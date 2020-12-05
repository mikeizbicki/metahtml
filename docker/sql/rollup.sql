BEGIN;

    CREATE TABLE metahtml.metahtml_rollup1_raw (
        url_hll hll NOT NULL,
        url_simplify_hll hll NOT NULL,
        num INTEGER NOT NULL,
        hostname text NOT NULL,
        access_day timestamptz NOT NULL,
        PRIMARY KEY(hostname,access_day)
    );
    

    CREATE INDEX metahtml_rollup1_index_url_hll ON metahtml.metahtml_rollup1_raw (hll_cardinality(url_hll));
    CREATE INDEX metahtml_rollup1_index_url_simplify_hll ON metahtml.metahtml_rollup1_raw (hll_cardinality(url_simplify_hll));

    CREATE INDEX metahtml_rollup1_index_num ON metahtml.metahtml_rollup1_raw (num);
    

    CREATE VIEW metahtml.metahtml_rollup1 AS
    SELECT
        floor(hll_cardinality(url_hll)) AS url_unique,
        floor(hll_cardinality(url_simplify_hll)) AS url_simplify_unique,
        num,
        hostname,
        access_day
    FROM metahtml.metahtml_rollup1_raw;

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup1_raw_insert_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        IF metahtml.url_hostname(new.url) IS NOT NULL AND date_trunc('day',new.accessed_at) IS NOT NULL THEN
            INSERT INTO metahtml.metahtml_rollup1_raw (
                url_hll,
                url_simplify_hll,
                num,
                hostname,
                access_day
                )
            VALUES (
                hll_add(hll_empty(), hll_hash_text(new.url)),
                hll_add(hll_empty(), hll_hash_text(metahtml.simplify_url(new.url))),
                1,
                metahtml.url_hostname(new.url),
                date_trunc('day',new.accessed_at)
                )
            ON CONFLICT (hostname,access_day)
            DO UPDATE SET
                url_hll = metahtml.metahtml_rollup1_raw.url_hll || excluded.url_hll,
                url_simplify_hll = metahtml.metahtml_rollup1_raw.url_simplify_hll || excluded.url_simplify_hll,
                num = metahtml.metahtml_rollup1_raw.num + excluded.num;
        END IF;
        RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup1_insert_t
        AFTER INSERT 
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup1_raw_insert_f();
    

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup1_raw_update_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        IF new.url != metahtml.url THEN
            RAISE EXCEPTION 'update would cause the value of "url" to change, but it is a unique constraint on a rollup table';
        END IF;
        
        IF metahtml.simplify_url(new.url) != metahtml.simplify_url(metahtml.url) THEN
            RAISE EXCEPTION 'update would cause the value of "metahtml.simplify_url(url)" to change, but it is a unique constraint on a rollup table';
        END IF;
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup1_update_t
        BEFORE UPDATE
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup1_raw_update_f();
    

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup1_raw_delete_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        RAISE EXCEPTION 'cannot delete from tables with unique rollup constraints';
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup1_delete_t
        BEFORE DELETE
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup1_raw_delete_f();
    

    INSERT INTO metahtml.metahtml_rollup1_raw (
        url_hll,
        url_simplify_hll,
        num,
        hostname,
        access_day
        )
    SELECT
        hll_add_agg(hll_hash_text(url)),
        hll_add_agg(hll_hash_text(metahtml.simplify_url(url))),
        count(1),
        metahtml.url_hostname(url) AS hostname,
        date_trunc('day',accessed_at) AS access_day
    FROM metahtml.metahtml
    WHERE
        metahtml.url_hostname(url) IS NOT NULL AND
        date_trunc('day',accessed_at) IS NOT NULL
    GROUP BY hostname,access_day;
    
COMMIT;
BEGIN;

    CREATE TABLE metahtml.metahtml_rollup2_raw (
        url_hll hll NOT NULL,
        url_simplify_hll hll NOT NULL,
        num INTEGER NOT NULL,
        hostname text NOT NULL,
        PRIMARY KEY(hostname)
    );
    

    CREATE INDEX metahtml_rollup2_index_url_hll ON metahtml.metahtml_rollup2_raw (hll_cardinality(url_hll));
    CREATE INDEX metahtml_rollup2_index_url_simplify_hll ON metahtml.metahtml_rollup2_raw (hll_cardinality(url_simplify_hll));

    CREATE INDEX metahtml_rollup2_index_num ON metahtml.metahtml_rollup2_raw (num);
    

    CREATE VIEW metahtml.metahtml_rollup2 AS
    SELECT
        floor(hll_cardinality(url_hll)) AS url_unique,
        floor(hll_cardinality(url_simplify_hll)) AS url_simplify_unique,
        num,
        hostname
    FROM metahtml.metahtml_rollup2_raw;

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup2_raw_insert_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        IF metahtml.url_hostname(new.url) IS NOT NULL THEN
            INSERT INTO metahtml.metahtml_rollup2_raw (
                url_hll,
                url_simplify_hll,
                num,
                hostname
                )
            VALUES (
                hll_add(hll_empty(), hll_hash_text(new.url)),
                hll_add(hll_empty(), hll_hash_text(metahtml.simplify_url(new.url))),
                1,
                metahtml.url_hostname(new.url)
                )
            ON CONFLICT (hostname)
            DO UPDATE SET
                url_hll = metahtml.metahtml_rollup2_raw.url_hll || excluded.url_hll,
                url_simplify_hll = metahtml.metahtml_rollup2_raw.url_simplify_hll || excluded.url_simplify_hll,
                num = metahtml.metahtml_rollup2_raw.num + excluded.num;
        END IF;
        RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup2_insert_t
        AFTER INSERT 
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup2_raw_insert_f();
    

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup2_raw_update_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        IF new.url != metahtml.url THEN
            RAISE EXCEPTION 'update would cause the value of "url" to change, but it is a unique constraint on a rollup table';
        END IF;
        
        IF metahtml.simplify_url(new.url) != metahtml.simplify_url(metahtml.url) THEN
            RAISE EXCEPTION 'update would cause the value of "metahtml.simplify_url(url)" to change, but it is a unique constraint on a rollup table';
        END IF;
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup2_update_t
        BEFORE UPDATE
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup2_raw_update_f();
    

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup2_raw_delete_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        RAISE EXCEPTION 'cannot delete from tables with unique rollup constraints';
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup2_delete_t
        BEFORE DELETE
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup2_raw_delete_f();
    

    INSERT INTO metahtml.metahtml_rollup2_raw (
        url_hll,
        url_simplify_hll,
        num,
        hostname
        )
    SELECT
        hll_add_agg(hll_hash_text(url)),
        hll_add_agg(hll_hash_text(metahtml.simplify_url(url))),
        count(1),
        metahtml.url_hostname(url) AS hostname
    FROM metahtml.metahtml
    WHERE
        metahtml.url_hostname(url) IS NOT NULL
    GROUP BY hostname;
    
COMMIT;
BEGIN;

    CREATE TABLE metahtml.metahtml_rollup3_raw (
        url_hll hll NOT NULL,
        url_simplify_hll hll NOT NULL,
        num INTEGER NOT NULL,
        access_day timestamptz NOT NULL,
        PRIMARY KEY(access_day)
    );
    

    CREATE INDEX metahtml_rollup3_index_url_hll ON metahtml.metahtml_rollup3_raw (hll_cardinality(url_hll));
    CREATE INDEX metahtml_rollup3_index_url_simplify_hll ON metahtml.metahtml_rollup3_raw (hll_cardinality(url_simplify_hll));

    CREATE INDEX metahtml_rollup3_index_num ON metahtml.metahtml_rollup3_raw (num);
    

    CREATE VIEW metahtml.metahtml_rollup3 AS
    SELECT
        floor(hll_cardinality(url_hll)) AS url_unique,
        floor(hll_cardinality(url_simplify_hll)) AS url_simplify_unique,
        num,
        access_day
    FROM metahtml.metahtml_rollup3_raw;

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup3_raw_insert_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        IF date_trunc('day',new.accessed_at) IS NOT NULL THEN
            INSERT INTO metahtml.metahtml_rollup3_raw (
                url_hll,
                url_simplify_hll,
                num,
                access_day
                )
            VALUES (
                hll_add(hll_empty(), hll_hash_text(new.url)),
                hll_add(hll_empty(), hll_hash_text(metahtml.simplify_url(new.url))),
                1,
                date_trunc('day',new.accessed_at)
                )
            ON CONFLICT (access_day)
            DO UPDATE SET
                url_hll = metahtml.metahtml_rollup3_raw.url_hll || excluded.url_hll,
                url_simplify_hll = metahtml.metahtml_rollup3_raw.url_simplify_hll || excluded.url_simplify_hll,
                num = metahtml.metahtml_rollup3_raw.num + excluded.num;
        END IF;
        RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup3_insert_t
        AFTER INSERT 
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup3_raw_insert_f();
    

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup3_raw_update_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        IF new.url != metahtml.url THEN
            RAISE EXCEPTION 'update would cause the value of "url" to change, but it is a unique constraint on a rollup table';
        END IF;
        
        IF metahtml.simplify_url(new.url) != metahtml.simplify_url(metahtml.url) THEN
            RAISE EXCEPTION 'update would cause the value of "metahtml.simplify_url(url)" to change, but it is a unique constraint on a rollup table';
        END IF;
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup3_update_t
        BEFORE UPDATE
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup3_raw_update_f();
    

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup3_raw_delete_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        RAISE EXCEPTION 'cannot delete from tables with unique rollup constraints';
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup3_delete_t
        BEFORE DELETE
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup3_raw_delete_f();
    

    INSERT INTO metahtml.metahtml_rollup3_raw (
        url_hll,
        url_simplify_hll,
        num,
        access_day
        )
    SELECT
        hll_add_agg(hll_hash_text(url)),
        hll_add_agg(hll_hash_text(metahtml.simplify_url(url))),
        count(1),
        date_trunc('day',accessed_at) AS access_day
    FROM metahtml.metahtml
    WHERE
        date_trunc('day',accessed_at) IS NOT NULL
    GROUP BY access_day;
    
COMMIT;
BEGIN;

    CREATE TABLE metahtml.metahtml_rollup4_raw (
        url_hll hll NOT NULL,
        url_simplify_hll hll NOT NULL,
        num INTEGER NOT NULL,
        timestamp_published timestamptz NOT NULL,
        PRIMARY KEY(timestamp_published)
    );
    

    CREATE INDEX metahtml_rollup4_index_url_hll ON metahtml.metahtml_rollup4_raw (hll_cardinality(url_hll));
    CREATE INDEX metahtml_rollup4_index_url_simplify_hll ON metahtml.metahtml_rollup4_raw (hll_cardinality(url_simplify_hll));

    CREATE INDEX metahtml_rollup4_index_num ON metahtml.metahtml_rollup4_raw (num);
    

    CREATE VIEW metahtml.metahtml_rollup4 AS
    SELECT
        floor(hll_cardinality(url_hll)) AS url_unique,
        floor(hll_cardinality(url_simplify_hll)) AS url_simplify_unique,
        num,
        timestamp_published
    FROM metahtml.metahtml_rollup4_raw;

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup4_raw_insert_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        IF date_trunc('day',(new.jsonb->'timestamp.published'->'best'->'value'->>'lo')::timestamptz) IS NOT NULL THEN
            INSERT INTO metahtml.metahtml_rollup4_raw (
                url_hll,
                url_simplify_hll,
                num,
                timestamp_published
                )
            VALUES (
                hll_add(hll_empty(), hll_hash_text(new.url)),
                hll_add(hll_empty(), hll_hash_text(metahtml.simplify_url(new.url))),
                1,
                date_trunc('day',(new.jsonb->'timestamp.published'->'best'->'value'->>'lo')::timestamptz)
                )
            ON CONFLICT (timestamp_published)
            DO UPDATE SET
                url_hll = metahtml.metahtml_rollup4_raw.url_hll || excluded.url_hll,
                url_simplify_hll = metahtml.metahtml_rollup4_raw.url_simplify_hll || excluded.url_simplify_hll,
                num = metahtml.metahtml_rollup4_raw.num + excluded.num;
        END IF;
        RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup4_insert_t
        AFTER INSERT 
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup4_raw_insert_f();
    

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup4_raw_update_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        IF new.url != metahtml.url THEN
            RAISE EXCEPTION 'update would cause the value of "url" to change, but it is a unique constraint on a rollup table';
        END IF;
        
        IF metahtml.simplify_url(new.url) != metahtml.simplify_url(metahtml.url) THEN
            RAISE EXCEPTION 'update would cause the value of "metahtml.simplify_url(url)" to change, but it is a unique constraint on a rollup table';
        END IF;
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup4_update_t
        BEFORE UPDATE
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup4_raw_update_f();
    

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup4_raw_delete_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        RAISE EXCEPTION 'cannot delete from tables with unique rollup constraints';
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup4_delete_t
        BEFORE DELETE
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup4_raw_delete_f();
    

    INSERT INTO metahtml.metahtml_rollup4_raw (
        url_hll,
        url_simplify_hll,
        num,
        timestamp_published
        )
    SELECT
        hll_add_agg(hll_hash_text(url)),
        hll_add_agg(hll_hash_text(metahtml.simplify_url(url))),
        count(1),
        date_trunc('day',(jsonb->'timestamp.published'->'best'->'value'->>'lo')::timestamptz) AS timestamp_published
    FROM metahtml.metahtml
    WHERE
        date_trunc('day',(jsonb->'timestamp.published'->'best'->'value'->>'lo')::timestamptz) IS NOT NULL
    GROUP BY timestamp_published;
    
COMMIT;
BEGIN;

    CREATE TABLE metahtml.metahtml_rollup5_raw (
        url_hll hll NOT NULL,
        url_simplify_hll hll NOT NULL,
        num INTEGER NOT NULL,
        timestamp_published timestamptz NOT NULL,
        hostname text NOT NULL,
        PRIMARY KEY(timestamp_published,hostname)
    );
    

    CREATE INDEX metahtml_rollup5_index_url_hll ON metahtml.metahtml_rollup5_raw (hll_cardinality(url_hll));
    CREATE INDEX metahtml_rollup5_index_url_simplify_hll ON metahtml.metahtml_rollup5_raw (hll_cardinality(url_simplify_hll));

    CREATE INDEX metahtml_rollup5_index_num ON metahtml.metahtml_rollup5_raw (num);
    

    CREATE VIEW metahtml.metahtml_rollup5 AS
    SELECT
        floor(hll_cardinality(url_hll)) AS url_unique,
        floor(hll_cardinality(url_simplify_hll)) AS url_simplify_unique,
        num,
        timestamp_published,
        hostname
    FROM metahtml.metahtml_rollup5_raw;

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup5_raw_insert_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        IF date_trunc('day',(new.jsonb->'timestamp.published'->'best'->'value'->>'lo')::timestamptz) IS NOT NULL AND metahtml.url_hostname(new.url) IS NOT NULL THEN
            INSERT INTO metahtml.metahtml_rollup5_raw (
                url_hll,
                url_simplify_hll,
                num,
                timestamp_published,
                hostname
                )
            VALUES (
                hll_add(hll_empty(), hll_hash_text(new.url)),
                hll_add(hll_empty(), hll_hash_text(metahtml.simplify_url(new.url))),
                1,
                date_trunc('day',(new.jsonb->'timestamp.published'->'best'->'value'->>'lo')::timestamptz),
                metahtml.url_hostname(new.url)
                )
            ON CONFLICT (timestamp_published,hostname)
            DO UPDATE SET
                url_hll = metahtml.metahtml_rollup5_raw.url_hll || excluded.url_hll,
                url_simplify_hll = metahtml.metahtml_rollup5_raw.url_simplify_hll || excluded.url_simplify_hll,
                num = metahtml.metahtml_rollup5_raw.num + excluded.num;
        END IF;
        RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup5_insert_t
        AFTER INSERT 
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup5_raw_insert_f();
    

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup5_raw_update_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        IF new.url != metahtml.url THEN
            RAISE EXCEPTION 'update would cause the value of "url" to change, but it is a unique constraint on a rollup table';
        END IF;
        
        IF metahtml.simplify_url(new.url) != metahtml.simplify_url(metahtml.url) THEN
            RAISE EXCEPTION 'update would cause the value of "metahtml.simplify_url(url)" to change, but it is a unique constraint on a rollup table';
        END IF;
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup5_update_t
        BEFORE UPDATE
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup5_raw_update_f();
    

    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup5_raw_delete_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        RAISE EXCEPTION 'cannot delete from tables with unique rollup constraints';
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER metahtml_rollup5_delete_t
        BEFORE DELETE
        ON metahtml.metahtml
        FOR EACH ROW
        EXECUTE PROCEDURE metahtml.metahtml_rollup5_raw_delete_f();
    

    INSERT INTO metahtml.metahtml_rollup5_raw (
        url_hll,
        url_simplify_hll,
        num,
        timestamp_published,
        hostname
        )
    SELECT
        hll_add_agg(hll_hash_text(url)),
        hll_add_agg(hll_hash_text(metahtml.simplify_url(url))),
        count(1),
        date_trunc('day',(jsonb->'timestamp.published'->'best'->'value'->>'lo')::timestamptz) AS timestamp_published,
        metahtml.url_hostname(url) AS hostname
    FROM metahtml.metahtml
    WHERE
        date_trunc('day',(jsonb->'timestamp.published'->'best'->'value'->>'lo')::timestamptz) IS NOT NULL AND
        metahtml.url_hostname(url) IS NOT NULL
    GROUP BY timestamp_published,hostname;
    
COMMIT;
