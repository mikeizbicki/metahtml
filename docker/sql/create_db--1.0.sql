CREATE EXTENSION IF NOT EXISTS rum;
CREATE EXTENSION IF NOT EXISTS hll;

CREATE SCHEMA metahtml;

/*******************************************************************************
 * simple functions for working with urls
 */

CREATE OR REPLACE FUNCTION uri_simplify_host(hostname TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT
AS $$
BEGIN
    RETURN CASE WHEN SUBSTRING(hostname FOR 4)='www.'
        THEN SUBSTRING(hostname FROM 5)
        ELSE CASE WHEN SUBSTRING(hostname FOR 5)='www2.'
            THEN SUBSTRING(hostname FROM 6)
            ELSE CASE WHEN SUBSTRING(hostname FOR 2)='m.'
                THEN SUBSTRING(hostname FROM 3)
                ELSE hostname
                END
            END
        END;
END 
$$;


CREATE OR REPLACE FUNCTION btree_sanitize(t TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT
AS $$
BEGIN
    RETURN SUBSTRING(t FOR 2048);
END
$$;


CREATE OR REPLACE FUNCTION metahtml.simplify_hostname(hostname TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT
AS $$
BEGIN
    RETURN CASE WHEN SUBSTRING(hostname FOR 4)='www.'
        THEN SUBSTRING(hostname FROM 5)
        ELSE CASE WHEN SUBSTRING(hostname FOR 5)='www2.'
            THEN SUBSTRING(hostname FROM 6)
            ELSE CASE WHEN SUBSTRING(hostname FOR 2)='m.'
                THEN SUBSTRING(hostname FROM 3)
                ELSE hostname
                END
            END
        END;
END 
$$;


CREATE OR REPLACE FUNCTION metahtml.simplify_url(url TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT
AS $$
DECLARE
    hostname TEXT = SUBSTRING(url, '//([^/:]*):?[^/]*/');
    pathquery TEXT = SUBSTRING(url, '://[^/]+(/.*)');
BEGIN
    RETURN btree_sanitize(metahtml.simplify_hostname(hostname) || pathquery);
END 
$$;


CREATE OR REPLACE FUNCTION metahtml.url_hostname(url TEXT)
RETURNS TEXT language plpgsql IMMUTABLE STRICT
AS $$
BEGIN
    RETURN SUBSTRING(url, '//([^/:?]*):?[^/?]*[/?]');
END 
$$;


/*******************************************************************************
 */

/*
 *
 */
CREATE TABLE metahtml.source (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);
INSERT INTO metahtml.source (id,name) VALUES (-1,'metahtml');

/* 
 * The primary table for storing extracted content
 */

CREATE TABLE metahtml.metahtml (
    id BIGSERIAL PRIMARY KEY,
    accessed_at TIMESTAMPTZ NOT NULL,
    id_source INTEGER NOT NULL REFERENCES metahtml.source(id),
    url TEXT NOT NULL, -- FIXME: add this constraint? CHECK (uri_normalize(uri(url)) = uri(url)),
    jsonb JSONB NOT NULL
);


CREATE INDEX metahtml_title_rumidx ON metahtml.metahtml USING rum (to_tsvector('simple', jsonb->'title'->'best'->'value'));
CREATE INDEX metahtml_content_rumidx ON metahtml.metahtml USING rum (to_tsvector('simple', jsonb->'content'->'best'->'value'));
SELECT
    count(*) AS num
    --jsonb->'title'->'best'->'value'
FROM metahtml.metahtml
WHERE
    to_tsvector('simple', jsonb->'title'->'best'->'value') @@ to_tsquery('simple', 'covid');



CREATE INDEX metahtml_url_accessed ON metahtml.metahtml (metahtml.simplify_url(url) text_pattern_ops, accessed_at);
SELECT count(*)
FROM metahtml.metahtml m
WHERE
    --metahtml.simplify_url(url) like 'reuters.com/%' AND
    accessed_at = (SELECT max(accessed_at) FROM metahtml.metahtml WHERE metahtml.simplify_url(url)=metahtml.simplify_url(m.url));


/*
 * NOTE:
 * triggers are a complicated way of implementing the index above
 *
CREATE OR REPLACE FUNCTION metahtml.metahtml_besturl_trigger_fnc()
RETURNS trigger AS
$$
BEGIN
    SELECT metahtml.metahtml

    UPDATE metahtml.metahtml SET besturl_hostpath=FALSE
    WHERE besturl_hostpath=TRUE AND uri_hostpath(url) = uri_hostpath(new.url);

    UPDATE metahtml.metahtml SET besturl_hostpathquery=FALSE
    WHERE besturl_hostpathquery=TRUE AND uri_hostpathquery(url) = uri_hostpathquery(new.url);
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';


CREATE TRIGGER metahtml_besturl_trigger
BEFORE INSERT
ON metahtml.metahtml
FOR EACH ROW
EXECUTE PROCEDURE metahtml.metahtml_besturl_trigger_fnc();
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

select count_estimate('select 1 from metahtml.metahtml');
select count(*) from metahtml.metahtml;


/*
 * but the equivalent queries for text search are way off.
 */

SELECT count_estimate($$
SELECT
    1
FROM metahtml.metahtml
WHERE
    to_tsvector('simple', jsonb->'title'->'best'->'value') @@ to_tsquery('simple', 'covid');
    $$);

/*
 * A rollup table can fix the problem.
 *
 * rollup fields: 
 *   metahtml.url_hostname(url)
 *   jsonb->'timestamp.published'->best->'value'->>'lo'
 *   jsonb->'content'->'best'->>'value'
 */


BEGIN;
    -- this table stores the raw rollup summaries
    CREATE TABLE metahtml.metahtml_rollup_hostname_raw (
        hll         hll     NOT NULL,
        num         INTEGER NOT NULL,
        hostname    TEXT    ,
        PRIMARY KEY (hostname)
    );

    -- indexes ensure fast calculation of the max on each column
    CREATE INDEX metahtml_rollup_hostname_index_hll ON metahtml.metahtml_rollup_hostname_raw (hll_cardinality(hll));
    CREATE INDEX metahtml_rollup_hostname_index_num ON metahtml.metahtml_rollup_hostname_raw (num);

    -- the view simplifies presentation of the hll columns
    CREATE VIEW metahtml.metahtml_rollup_hostname AS
    SELECT
        hll_cardinality(hll) AS num_unique_url,
        num,
        hostname
    FROM metahtml.metahtml_rollup_hostname_raw;

    -- ensure that all rows already in the table get rolled up
    INSERT INTO metahtml.metahtml_rollup_hostname_raw (hll, num, hostname)
    SELECT
        hll_add_agg(hll_hash_text(url)),
        count(1),
        metahtml.url_hostname(url) AS hostname
    FROM metahtml.metahtml
    GROUP BY hostname;

    -- an insert trigger ensures that all future rows get rolled up
    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup_hostname_insert_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        INSERT INTO metahtml.metahtml_rollup_hostname_raw (hll, num, hostname) VALUES
            (hll_add(hll_empty(),hll_hash_text(new.url)), 1, metahtml.url_hostname(new.url))
        ON CONFLICT (hostname)
        DO UPDATE SET
            hll = metahtml.metahtml_rollup_hostname_raw.hll || excluded.hll,
            num = metahtml.metahtml_rollup_hostname_raw.num +  excluded.num;
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup_hostname_insert_t
        AFTER INSERT 
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup_hostname_insert_f();

    -- an update trigger ensures that updates do not affect the unique columns
    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup_hostname_update_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        IF new.url != metahtml.url THEN
            RAISE EXCEPTION 'cannot update the "url" column due to unique rollup';
        END IF;
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup_hostname_update_t
        BEFORE UPDATE
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup_hostname_update_f();

    -- a delete trigger ensures that deletes never occur
    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup_hostname_delete_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        RAISE EXCEPTION 'cannot delete from metahtml.metahtml due to unique rollup';
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup_hostname_delete_t
        BEFORE DELETE
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup_hostname_delete_f();
COMMIT;

BEGIN;
    DROP TABLE metahtml.metahtml_rollup_hostname_raw CASCADE;
    DROP TRIGGER metahtml_rollup_hostname_insert_t ON metahtml.metahtml;
    DROP TRIGGER metahtml_rollup_hostname_update_t ON metahtml.metahtml;
    DROP TRIGGER metahtml_rollup_hostname_delete_t ON metahtml.metahtml;
    DROP FUNCTION metahtml.metahtml_rollup_hostname_insert_f;
    DROP FUNCTION metahtml.metahtml_rollup_hostname_update_f;
    DROP FUNCTION metahtml.metahtml_rollup_hostname_delete_f;
COMMIT;


/* deleteme
CREATE TABLE urls_summary (
    hostname TEXT NOT NULL,
    distinct_path hll NOT NULL,
    distinct_path_query hll NOT NULL,
    num BIGINT NOT NULL,
    PRIMARY KEY (hostname)
);

INSERT INTO rollups (name, event_table_name, event_id_sequence_name, sql)
VALUES ('urls_summary', 'urls', 'urls_id_urls_seq', $$
    INSERT INTO urls_summary
        (hostname,distinct_path,distinct_path_query,num)
    SELECT
        hostname,
        hll_add_agg(hll_hash_text(path)),
        hll_add_agg(hll_hash_text(path || query)),
        count(1)
    FROM urls
    WHERE
        id_urls>=$1 AND
        id_urls<$2
    GROUP BY hostname
    ON CONFLICT (hostname)
    DO UPDATE SET
        distinct_path = urls_summary.distinct_path || excluded.distinct_path,
        distinct_path_query = urls_summary.distinct_path_query || excluded.distinct_path_query,
        num = urls_summary.num+excluded.num
    ;
$$);
*/
