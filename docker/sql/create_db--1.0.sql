BEGIN;

\set ON_ERROR_STOP on

CREATE EXTENSION IF NOT EXISTS rum;
CREATE EXTENSION IF NOT EXISTS hll;

CREATE SCHEMA metahtml;
SET SEARCH_PATH TO metahtml;

/*******************************************************************************
 * generic helper functions
 */

/*
 * reverse an array, see: https://wiki.postgresql.org/wiki/Array_reverse
 */
CREATE OR REPLACE FUNCTION array_reverse(anyarray) RETURNS anyarray AS $$
SELECT ARRAY(
    SELECT $1[i]
    FROM generate_subscripts($1,1) AS s(i)
    ORDER BY i DESC
);
$$ LANGUAGE 'sql' STRICT IMMUTABLE;

/*
 * the btree index cannot support text column sizes that are large;
 * this function truncates the input to an acceptable size
 */
CREATE OR REPLACE FUNCTION btree_sanitize(t TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT SET search_path=metahtml
AS $$
BEGIN
    RETURN SUBSTRING(t FOR 2048);
END
$$;

/*
 * converts a string into a truncated UTC timestamp
 * FIXME:
 * should we delete this?
 */
CREATE OR REPLACE FUNCTION simplify_timestamp(field TEXT, t TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT SET search_path=metahtml
AS $$
BEGIN
    RETURN date_trunc(field,t::timestamptz AT TIME ZONE 'UTC');
END
$$;

/*******************************************************************************
 * functions for extracting the components of a url stored as text
 * NOTE:
 * the extension pguri (https://github.com/petere/pguri) is specifically designed for storing url data;
 * but it requires that all input urls be properly formatted;
 * that will not be the case for our urls,
 * and so that's why we must manually implement these functions
 */

/*
 * remove the scheme from an input url
 */
CREATE OR REPLACE FUNCTION url_remove_scheme(url TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT SET search_path=metahtml
AS $$
BEGIN
    RETURN COALESCE(SUBSTRING(url, '[^:/]*//(.*)'),url);
END 
$$;

do $$
BEGIN
    assert( url_remove_scheme('https://cnn.com') = 'cnn.com');
    assert( url_remove_scheme('https://cnn.com/') = 'cnn.com/');
    assert( url_remove_scheme('https://www.cnn.com/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html') = 'www.cnn.com/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html');
    assert( url_remove_scheme('http://cnn.com') = 'cnn.com');
    assert( url_remove_scheme('http://cnn.com/') = 'cnn.com/');
    assert( url_remove_scheme('http://www.cnn.com/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html') = 'www.cnn.com/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html');
    assert( url_remove_scheme('cnn.com') = 'cnn.com');
    assert( url_remove_scheme('cnn.com/') = 'cnn.com/');
    assert( url_remove_scheme('www.cnn.com/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html') = 'www.cnn.com/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html');
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION url_host(url TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT SET search_path=metahtml
AS $$
DECLARE
    url_without_scheme TEXT = url_remove_scheme(url);
BEGIN
    RETURN SUBSTRING(url_without_scheme, '([^/?:]*):?[^/?]*[/?]?');
END 
$$;

do $$
BEGIN
    assert( url_host('https://cnn.com') = 'cnn.com');
    assert( url_host('https://cnn.com/') = 'cnn.com');
    assert( url_host('https://www.cnn.com/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html') = 'www.cnn.com');
    assert( url_host('http://cnn.com') = 'cnn.com');
    assert( url_host('http://cnn.com/') = 'cnn.com');
    assert( url_host('http://www.cnn.com/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html') = 'www.cnn.com');
    assert( url_host('cnn.com') = 'cnn.com');
    assert( url_host('cnn.com/') = 'cnn.com');
    assert( url_host('www.cnn.com/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html') = 'www.cnn.com');
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION url_path(url TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT SET search_path=metahtml
AS $$
DECLARE
    url_without_scheme TEXT = url_remove_scheme(url);
BEGIN
    RETURN COALESCE(SUBSTRING(url_without_scheme, '[^/?]+([/][^;#?]*)'),'/');
END 
$$;

do $$
BEGIN
    assert( url_path('https://cnn.com') = '/');
    assert( url_path('https://cnn.com/') = '/');
    assert( url_path('https://www.cnn.com/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html') = '/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html');
    assert( url_path('http://cnn.com') = '/');
    assert( url_path('http://cnn.com/') = '/');
    assert( url_path('http://www.cnn.com/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html') = '/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html');
    assert( url_path('cnn.com') = '/');
    assert( url_path('cnn.com/') = '/');
    assert( url_path('www.cnn.com/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html') = '/2020/12/09/tech/facebook-antitrust-lawsuit-ftc-attorney-generals/index.html');

    assert( url_path('https://example.com/path/to/index.html?a=b&c=d') = '/path/to/index.html');
    assert( url_path('https://example.com/index.html?a=b&c=d') = '/index.html');
    assert( url_path('https://example.com/?a=b&c=d') = '/');

    assert( url_path('https://example.com/path/to/index.html;test?a=b&c=d') = '/path/to/index.html');
    assert( url_path('https://example.com/index.html;test?a=b&c=d') = '/index.html');
    assert( url_path('https://example.com/;test?a=b&c=d') = '/');

    assert( url_path('https://example.com/path/to/index.html#test') = '/path/to/index.html');
    assert( url_path('https://example.com/index.html#test') = '/index.html');
    assert( url_path('https://example.com/#test') = '/');
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION url_query(url TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT SET search_path=metahtml
AS $$
BEGIN
    RETURN COALESCE(SUBSTRING(url, '\?([^?#]*)'),'');
END 
$$;

do $$
BEGIN
    assert( url_query('https://example.com/path/to/index.html?a=b&c=d') = 'a=b&c=d');
    assert( url_query('https://example.com/index.html?a=b&c=d') = 'a=b&c=d');
    assert( url_query('https://example.com/?a=b&c=d') = 'a=b&c=d');

    assert( url_query('https://example.com/path/to/index.html?a=b&c=d#test') = 'a=b&c=d');
    assert( url_query('https://example.com/index.html?a=b&c=d#test') = 'a=b&c=d');
    assert( url_query('https://example.com/?a=b&c=d#test') = 'a=b&c=d');

    assert( url_query('https://example.com/path/to/index.html') = '');
    assert( url_query('https://example.com/index.html') = '');
    assert( url_query('https://example.com/') = '');

    assert( url_query('/path/to/index.html?a=b&c=d#test') = 'a=b&c=d');
    assert( url_query('/index.html?a=b&c=d#test') = 'a=b&c=d');
    assert( url_query('/?a=b&c=d#test') = 'a=b&c=d');
END;
$$ LANGUAGE plpgsql;


----------------------------------------
-- simplification functions

/*
 * remove extraneous leading subdomains from a host
 */
CREATE OR REPLACE FUNCTION host_simplify(host TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT SET search_path=metahtml
AS $$
BEGIN
    RETURN COALESCE(
        SUBSTRING(host, 'www\d*\.(.*)'),
        SUBSTRING(host, 'm\.(.*)'),
        host
    );
END 
$$;

do $$
BEGIN
    assert( host_simplify('cnn.com') = 'cnn.com');
    assert( host_simplify('www.cnn.com') = 'cnn.com');
    assert( host_simplify('www2.cnn.com') = 'cnn.com');
    assert( host_simplify('www5.cnn.com') = 'cnn.com');
    assert( host_simplify('www577.cnn.com') = 'cnn.com');
    assert( host_simplify('bbc.co.uk') = 'bbc.co.uk');
    assert( host_simplify('www.bbc.co.uk') = 'bbc.co.uk');
    assert( host_simplify('en.wikipedia.org') = 'en.wikipedia.org');
    assert( host_simplify('m.wikipedia.org') = 'wikipedia.org');
END;
$$ LANGUAGE plpgsql;

/*
 * converts a host into the key syntax used by the common crawl
 * the main feature is that subdomains are in reverse order,
 * so string matches starting from the left hand side become increasingly specific
 */
CREATE OR REPLACE FUNCTION host_key(host TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT SET search_path=metahtml
AS $$
BEGIN
    RETURN array_to_string(array_reverse(string_to_array(host,'.')),',')||')';
END 
$$;

do $$
BEGIN
    assert( host_key('cnn.com') = 'com,cnn)');
    assert( host_key('www.cnn.com') = 'com,cnn,www)');
    assert( host_key('www.bbc.co.uk') = 'uk,co,bbc,www)');
END;
$$ LANGUAGE plpgsql;

/*
 * removes default webpages like index.html from the end of the path,
 * and removes trailing slashes from the end of the path;
 * technically, these changes can modify the path to point to a new location,
 * but this is extremely rare in practice
 */
CREATE OR REPLACE FUNCTION path_simplify(path TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT SET search_path=metahtml
AS $$
DECLARE
    path_without_index TEXT = COALESCE(
        SUBSTRING(path, '(.*/)index.\w{3,4}$'),
        path
    );
BEGIN
    RETURN COALESCE(
        SUBSTRING(path_without_index, '(.*)/$'),
        path_without_index
    );
END 
$$;

do $$
BEGIN
    assert( path_simplify('/path/to/index.html/more/paths') = '/path/to/index.html/more/paths');
    assert( path_simplify('/path/to/index.html') = '/path/to');
    assert( path_simplify('/path/to/index.htm') = '/path/to');
    assert( path_simplify('/path/to/index.asp') = '/path/to');
    assert( path_simplify('/path/to/') = '/path/to');
    assert( path_simplify('/index.html') = '');
    assert( path_simplify('/index.htm') = '');
    assert( path_simplify('/') = '');
    assert( path_simplify('') = '');
END;
$$ LANGUAGE plpgsql;


/*
 * sorts query terms and removes query terms used only for tracking
 * see: https://en.wikipedia.org/wiki/UTM_parameters
 * see: https://github.com/mpchadwick/tracking-query-params-registry/blob/master/data.csv
 * for the sorting step, see: https://stackoverflow.com/questions/2913368/sorting-array-elements
 */
CREATE OR REPLACE FUNCTION query_simplify(query TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT SET search_path=metahtml
AS $$
BEGIN
    RETURN array_to_string(array(
        SELECT * FROM unnest(string_to_array(query,'&')) AS unnest
        WHERE unnest.unnest NOT LIKE 'utm_%'
        ORDER BY unnest.unnest ASC
    ),'&');
END 
$$;

do $$
BEGIN
    assert( query_simplify('a=1&b=2&utm_source=google.com') = 'a=1&b=2');
    assert( query_simplify('a=1&utm_source=google.com&b=2') = 'a=1&b=2');
    assert( query_simplify('utm_source=google.com&a=1&b=2') = 'a=1&b=2');
    assert( query_simplify('a=1&b=2') = 'a=1&b=2');
    assert( query_simplify('b=1&a=2') = 'a=2&b=1');
    assert( query_simplify('a=1') = 'a=1');
    assert( query_simplify('') = '');
END;
$$ LANGUAGE plpgsql;

----------------------------------------
-- functions for indexing

CREATE OR REPLACE FUNCTION url_host_key(url TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT SET search_path=metahtml
AS $$
DECLARE
    url_lower TEXT = lower(url);
BEGIN
    RETURN btree_sanitize(host_key(host_simplify(url_host(url_lower))));
END 
$$;

do $$
BEGIN
    assert( url_host_key('https://example.com') = 'com,example)');
    assert( url_host_key('https://example.com/') = 'com,example)');
    assert( url_host_key('https://example.com/#test') = 'com,example)');
    assert( url_host_key('https://example.com/?param=12') = 'com,example)');
    assert( url_host_key('https://example.com/path/to') = 'com,example)');
    assert( url_host_key('https://example.com/path/to/') = 'com,example)');
    assert( url_host_key('https://example.com/path/to/#test') = 'com,example)');
    assert( url_host_key('https://example.com/path/to/?param=12') = 'com,example)');
    assert( url_host_key('https://Example.com/Path/To/?Param=12') = 'com,example)');
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION url_hostpath_key(url TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT SET search_path=metahtml
AS $$
DECLARE
    url_lower TEXT = lower(url);
BEGIN
    RETURN btree_sanitize(host_key(host_simplify(url_host(url_lower))) || path_simplify(url_path(url_lower)));
END 
$$;

do $$
BEGIN
    assert( url_hostpath_key('https://example.com') = 'com,example)');
    assert( url_hostpath_key('https://example.com/') = 'com,example)');
    assert( url_hostpath_key('https://example.com/#test') = 'com,example)');
    assert( url_hostpath_key('https://example.com/?param=12') = 'com,example)');
    assert( url_hostpath_key('https://example.com/path/to') = 'com,example)/path/to');
    assert( url_hostpath_key('https://example.com/path/to/') = 'com,example)/path/to');
    assert( url_hostpath_key('https://example.com/path/to/#test') = 'com,example)/path/to');
    assert( url_hostpath_key('https://example.com/path/to/?param=12') = 'com,example)/path/to');
    assert( url_hostpath_key('https://Example.com/Path/To/?Param=12') = 'com,example)/path/to');
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION url_hostpathquery_key(url TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT SET search_path=metahtml
AS $$
DECLARE
    url_lower TEXT = lower(url);
    query TEXT = query_simplify(url_query(url_lower));
BEGIN
    RETURN btree_sanitize(
        host_key(host_simplify(url_host(url_lower))) || 
        path_simplify(url_path(url_lower)) || 
        CASE WHEN length(query)>0
            THEN '?' || query
            ELSE ''
        END
    );
END 
$$;

do $$
BEGIN
    assert( url_hostpathquery_key('https://example.com') = 'com,example)');
    assert( url_hostpathquery_key('https://example.com/') = 'com,example)');
    assert( url_hostpathquery_key('https://example.com/#test') = 'com,example)');
    assert( url_hostpathquery_key('https://example.com/?param=12') = 'com,example)?param=12');
    assert( url_hostpathquery_key('https://example.com/path/to') = 'com,example)/path/to');
    assert( url_hostpathquery_key('https://example.com/path/to/') = 'com,example)/path/to');
    assert( url_hostpathquery_key('https://example.com/path/to/#test') = 'com,example)/path/to');
    assert( url_hostpathquery_key('https://example.com/path/to/?param=12') = 'com,example)/path/to?param=12');
    assert( url_hostpathquery_key('https://Example.com/Path/To/?Param=12') = 'com,example)/path/to?param=12');
END;
$$ LANGUAGE plpgsql;


/*******************************************************************************
 */

/*
 *
 */
CREATE TABLE source (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);
INSERT INTO source (id,name) VALUES (-1,'metahtml');

/* 
 * The primary table for storing extracted content
 */

CREATE TABLE metahtml (
    id BIGSERIAL PRIMARY KEY,
    accessed_at TIMESTAMPTZ NOT NULL,
    id_source INTEGER NOT NULL REFERENCES source(id),
    url TEXT NOT NULL, -- FIXME: add this constraint? CHECK (uri_normalize(uri(url)) = uri(url)),
    jsonb JSONB NOT NULL
);


CREATE INDEX metahtml_title_rumidx ON metahtml USING rum (to_tsvector('simple', jsonb->'title'->'best'->'value'));
CREATE INDEX metahtml_content_rumidx ON metahtml USING rum (to_tsvector('simple', jsonb->'content'->'best'->'value'));
/*
SELECT
    count(*) AS num
    --jsonb->'title'->'best'->'value'
FROM metahtml
WHERE
    to_tsvector('simple', jsonb->'title'->'best'->'value') @@ to_tsquery('simple', 'covid');
*/


CREATE INDEX metahtml_url_accessed ON metahtml (url_hostpathquery_key(url) text_pattern_ops, accessed_at);
/*
SELECT count(*)
FROM metahtml m
WHERE
    --url_hostpathquery_key(url) like 'reuters.com/%' AND
    accessed_at = (SELECT max(accessed_at) FROM metahtml WHERE url_hostpathquery_key(url)=url_hostpathquery_key(m.url));
*/

/*
 * NOTE:
 * triggers are a complicated way of implementing the index above
 *
CREATE OR REPLACE FUNCTION metahtml_besturl_trigger_fnc()
RETURNS trigger AS
$$
BEGIN
    SELECT metahtml

    UPDATE metahtml SET besturl_hostpath=FALSE
    WHERE besturl_hostpath=TRUE AND uri_hostpath(url) = uri_hostpath(new.url);

    UPDATE metahtml SET besturl_hostpathquery=FALSE
    WHERE besturl_hostpathquery=TRUE AND uri_hostpathquery(url) = uri_hostpathquery(new.url);
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';


CREATE TRIGGER metahtml_besturl_trigger
BEFORE INSERT
ON metahtml
FOR EACH ROW
EXECUTE PROCEDURE metahtml_besturl_trigger_fnc();
*/


/*********************************************************************************
 * faster count(*) 
 */


/*
 * This function is taken from https://www.postgresql.org/docs/current/row-estimation-examples.html
 * It's good for very general queries, but bad for specific ones, especially text search.
 */
CREATE FUNCTION count_estimate(query text) RETURNS integer AS $$
DECLARE
  rec   record;
  rows  integer;
BEGIN
  FOR rec IN EXECUTE 'EXPLAIN ' || query LOOP
    rows := substring(rec."QUERY PLAN" FROM ' rows=([[:digit:]]+)');
    EXIT WHEN rows IS NOT NULL;
  END LOOP;
  RETURN rows;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT;


/*
 * The following queries have very similar outputs
 */

/*
select count_estimate('select 1 from metahtml');
select count(*) from metahtml;
*/

/*
 * but the equivalent queries for text search are way off.
 */

/*
SELECT count_estimate($$
SELECT
    1
FROM metahtml
WHERE
    to_tsvector('simple', jsonb->'title'->'best'->'value') @@ to_tsquery('simple', 'covid');
    $$);
*/

/*
 * A rollup table can fix the problem.
 *
 * rollup fields: 
 *   url_host(url)
 *   jsonb->'timestamp.published'->best->'value'->>'lo'
 *   jsonb->'content'->'best'->>'value'


BEGIN;
    -- this table stores the raw rollup summaries
    CREATE TABLE metahtml_rollup_host_raw (
        hll         hll     NOT NULL,
        num         INTEGER NOT NULL,
        host    TEXT    ,
        PRIMARY KEY (host)
    );

    -- indexes ensure fast calculation of the max on each column
    CREATE INDEX metahtml_rollup_host_index_hll ON metahtml_rollup_host_raw (hll_cardinality(hll));
    CREATE INDEX metahtml_rollup_host_index_num ON metahtml_rollup_host_raw (num);

    -- the view simplifies presentation of the hll columns
    CREATE VIEW metahtml_rollup_host AS
    SELECT
        hll_cardinality(hll) AS num_unique_url,
        num,
        host
    FROM metahtml_rollup_host_raw;

    -- ensure that all rows already in the table get rolled up
    INSERT INTO metahtml_rollup_host_raw (hll, num, host)
    SELECT
        hll_add_agg(hll_hash_text(url)),
        count(1),
        url_host(url) AS host
    FROM metahtml
    GROUP BY host;

    -- an insert trigger ensures that all future rows get rolled up
    CREATE OR REPLACE FUNCTION metahtml_rollup_host_insert_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        INSERT INTO metahtml_rollup_host_raw (hll, num, host) VALUES
            (hll_add(hll_empty(),hll_hash_text(new.url)), 1, url_host(new.url))
        ON CONFLICT (host)
        DO UPDATE SET
            hll = metahtml_rollup_host_raw.hll || excluded.hll,
            num = metahtml_rollup_host_raw.num +  excluded.num;
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup_host_insert_t
        AFTER INSERT 
        ON metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml_rollup_host_insert_f();

    -- an update trigger ensures that updates do not affect the unique columns
    CREATE OR REPLACE FUNCTION metahtml_rollup_host_update_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        IF new.url != url THEN
            RAISE EXCEPTION 'cannot update the "url" column due to unique rollup';
        END IF;
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup_host_update_t
        BEFORE UPDATE
        ON metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml_rollup_host_update_f();

    -- a delete trigger ensures that deletes never occur
    CREATE OR REPLACE FUNCTION metahtml_rollup_host_delete_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        RAISE EXCEPTION 'cannot delete from metahtml due to unique rollup';
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup_host_delete_t
        BEFORE DELETE
        ON metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml_rollup_host_delete_f();
COMMIT;

BEGIN;
    DROP TABLE metahtml_rollup_host_raw CASCADE;
    DROP TRIGGER metahtml_rollup_host_insert_t ON metahtml;
    DROP TRIGGER metahtml_rollup_host_update_t ON metahtml;
    DROP TRIGGER metahtml_rollup_host_delete_t ON metahtml;
    DROP FUNCTION metahtml_rollup_host_insert_f;
    DROP FUNCTION metahtml_rollup_host_update_f;
    DROP FUNCTION metahtml_rollup_host_delete_f;
COMMIT;
*/

/* deleteme
CREATE TABLE urls_summary (
    host TEXT NOT NULL,
    distinct_path hll NOT NULL,
    distinct_path_query hll NOT NULL,
    num BIGINT NOT NULL,
    PRIMARY KEY (host)
);

INSERT INTO rollups (name, event_table_name, event_id_sequence_name, sql)
VALUES ('urls_summary', 'urls', 'urls_id_urls_seq', $$
    INSERT INTO urls_summary
        (host,distinct_path,distinct_path_query,num)
    SELECT
        host,
        hll_add_agg(hll_hash_text(path)),
        hll_add_agg(hll_hash_text(path || query)),
        count(1)
    FROM urls
    WHERE
        id_urls>=$1 AND
        id_urls<$2
    GROUP BY host
    ON CONFLICT (host)
    DO UPDATE SET
        distinct_path = urls_summary.distinct_path || excluded.distinct_path,
        distinct_path_query = urls_summary.distinct_path_query || excluded.distinct_path_query,
        num = urls_summary.num+excluded.num
    ;
$$);
*/

COMMIT;
