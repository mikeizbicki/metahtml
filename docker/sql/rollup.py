import collections
import re

Key = collections.namedtuple('Key', ['value','type','name'])


def _add_namespace(s, namespace):
    '''
    Identify all column names in the input string s and replaces them with the specified namespace.

    >>> _add_namespace('url', 'new')
    'new.url'
    >>> _add_namespace('simplify_url(url)', 'new')
    'simplify_url(new.url)'
    >>> _add_namespace('metahtml.simplify_url(url)', 'new')
    'metahtml.simplify_url(new.url)'
    '''
    return re.sub(r'\b(\w|_)+\b([^.(]|$)', namespace+r'.\g<0>', s)


def create_rollup_str(source_table, rollup_view_name, keys, uniques):

    if '.' in source_table:
        schema_name, table_name = source_table.split('.')
    else:
        schema_name = ''
        table_name = source_table

    if '.' in rollup_view_name:
        rollup_schema, rollup_name = rollup_view_name.split('.')
    else:
        rollup_schema = ''
        rollup_name = rollup_view_name
    rollup_table_name = rollup_view_name + '_raw'


    '''
    -- this table stores the raw rollup summaries
    CREATE TABLE metahtml.metahtml_rollup_hostname_raw (
        hll         hll     NOT NULL,
        num         INTEGER NOT NULL,
        hostname    TEXT    ,
        PRIMARY KEY (hostname)
    );
    '''
    cmd_create_table = ('''
    CREATE TABLE '''+rollup_table_name+''' (
        '''+
        '\n'.join([unique.name + '_hll hll NOT NULL,' for unique in uniques])+'''
        num INTEGER NOT NULL,
        '''+
        '\n'.join([key.name + ' ' + key.type + ',' for key in keys]) +
        '''
        PRIMARY KEY('''+ ','.join([key.name for key in keys]) +''')
    );
    ''')

    '''
    -- indexes ensure fast calculation of the max on each column
    CREATE INDEX metahtml_rollup_hostname_index_hll ON metahtml.metahtml_rollup_hostname_raw (hll_cardinality(hll));
    CREATE INDEX metahtml_rollup_hostname_index_num ON metahtml.metahtml_rollup_hostname_raw (num);

    '''
    cmd_create_indexes_hll = ''.join(['''
    CREATE INDEX '''+rollup_name+'_index_'+unique.name+'_hll ON '+rollup_table_name+' (hll_cardinality('+unique.name+'_hll));' for unique in uniques
    ])

    cmd_create_indexes_int = '''
    CREATE INDEX '''+rollup_name+'_index_num ON '+rollup_table_name+''' (num);
    '''

    '''
    -- the view simplifies presentation of the hll columns
    CREATE VIEW metahtml.metahtml_rollup_hostname AS
    SELECT
        hll_cardinality(hll) AS num_unique_url,
        num,
        hostname
    FROM metahtml.metahtml_rollup_hostname_raw;
    '''
    cmd_create_view = ('''
    CREATE VIEW '''+rollup_view_name+''' AS
    SELECT
        '''+
        '\n'.join(['floor(hll_cardinality('+unique.name+'_hll)) AS '+unique.name+'_unique,' for unique in uniques])+'''
        num,
        '''+
        ',\n'.join([key.name for key in keys]) +
        '''
    FROM '''+rollup_table_name+';')

    '''
    -- an insert trigger ensures that all future rows get rolled up
    CREATE OR REPLACE FUNCTION metahtml.metahtml_rollup_hostname_insert_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        INSERT INTO metahtml.metahtml_rollup_hostname_raw (
            hll,
            num,
            hostname
            )
        VALUES (
            hll_add(hll_empty(),hll_hash_text(new.url)),
            1,
            metahtml.url_hostname(new.url)
            )
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
    '''
    cmd_trigger_insert = ('''
    CREATE OR REPLACE FUNCTION '''+rollup_table_name+'''_insert_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        INSERT INTO '''+rollup_table_name+''' (
            '''+
            '\n'.join([unique.name+'_hll,' for unique in uniques])+'''
            num,
            '''+
            ',\n'.join([key.name for key in keys]) + '''
            )
        VALUES (
            '''+
            '\n'.join(['hll_add(hll_empty(), hll_hash_'+unique.type+'('+_add_namespace(unique.value,'new')+')),' for unique in uniques])+'''
            '''+
            '\n'.join(['1,' for unique in uniques])+'''
            '''+
            ',\n'.join([_add_namespace(key.value,'new') for key in keys]) + '''
            )
        ON CONFLICT (''' + ','.join([key.name for key in keys]) + ''')
        DO UPDATE SET
            '''+
            '\n'.join([unique.name+'_hll = '+rollup_table_name+'.'+unique.name+'_hll || excluded.'+unique.name+'_hll,' for unique in uniques])+'''
            num = '''+rollup_table_name+'''.num + excluded.num;
        RETURN NEW;
    END;
    $$;

    CREATE TRIGGER '''+rollup_name+'''_insert_t
        AFTER INSERT 
        ON ''' + source_table + '''
        FOR EACH ROW
        EXECUTE PROCEDURE ''' + rollup_table_name+'''_insert_f();
    ''')

    '''
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
    '''
    cmd_trigger_update = ('''
    CREATE OR REPLACE FUNCTION ''' + rollup_table_name + '''_update_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN'''
        +'\n'.join(['''
        IF '''+_add_namespace(unique.value,'new')+''' != '''+_add_namespace(unique.value,table_name)+''' THEN
            RAISE EXCEPTION 'update would cause the value of "'''+unique.value+'''" to change, but it is a unique constraint on a rollup table';
        END IF;'''
        for unique in uniques
        ])+'''
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER '''+rollup_name+'''_update_t
        BEFORE UPDATE
        ON ''' + source_table + '''
        FOR EACH ROW
        EXECUTE PROCEDURE ''' + rollup_table_name+'''_update_f();
    ''')

    '''
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
    '''
    cmd_trigger_delete = ('''
    CREATE OR REPLACE FUNCTION ''' + rollup_table_name + '''_delete_f()
    RETURNS TRIGGER LANGUAGE PLPGSQL AS $$
    BEGIN
        RAISE EXCEPTION 'cannot delete from tables with unique rollup constraints';
    RETURN NEW;
    END;
    $$;

    CREATE TRIGGER '''+rollup_name+'''_delete_t
        BEFORE DELETE
        ON ''' + source_table + '''
        FOR EACH ROW
        EXECUTE PROCEDURE ''' + rollup_table_name+'''_delete_f();
    ''')


    '''
    -- ensure that all rows already in the table get rolled up
    INSERT INTO metahtml.metahtml_rollup_hostname_raw (
        hll,
        num,
        hostname
        )
    SELECT
        hll_add_agg(hll_hash_text(url)),
        count(1),
        metahtml.url_hostname(url) AS hostname
    FROM metahtml.metahtml
    GROUP BY hostname;
    '''
    cmd_insert = ('''
    INSERT INTO '''+rollup_table_name+''' (
        '''+
        '\n'.join([unique.name+'_hll,' for unique in uniques])+'''
        num,
        '''+
        ',\n'.join([key.name for key in keys]) + '''
        )
    SELECT
        '''+
        '\n'.join(['hll_add_agg(hll_hash_'+unique.type+'('+unique.value+')),' for unique in uniques])+'''
        count(1),
        '''+
        ',\n'.join([key.value+' AS '+key.name for key in keys]) + '''
    FROM '''+source_table+'''
    GROUP BY ''' + ','.join([key.name for key in keys])+''';
    ''')


    return '\n'.join([
        'BEGIN;',
        cmd_create_table,
        cmd_create_indexes_hll,
        cmd_create_indexes_int,
        cmd_create_view,
        cmd_trigger_insert,
        cmd_trigger_update,
        cmd_trigger_delete,
        cmd_insert,
        'COMMIT;',
        ])


def drop_rollup_str(rollup_view_name):
    rollup_table_name = rollup_view_name+'_raw'
    return ('''
BEGIN;
    DROP TABLE '''+rollup_table_name+''' CASCADE;
    DROP FUNCTION '''+rollup_table_name+'''_insert_f CASCADE;
    DROP FUNCTION '''+rollup_table_name+'''_update_f CASCADE;
    DROP FUNCTION '''+rollup_table_name+'''_delete_f CASCADE;
COMMIT;
''')


################################################################################

class SyntaxError(Exception):
    pass


def get_token(s):
    '''
    >>> get_token('THIS is a test')
    (' is a test', 'THIS')
    >>> get_token('   THIS is a test')
    (' is a test', 'THIS')
    >>> get_token(' test  ')
    ('  ', 'test')
    >>> get_token('test')
    ('', 'test')
    >>> get_token('test;test')
    (';test', 'test')
    >>> get_token('   ')
    Traceback (most recent call last):
        ...
    rollup.SyntaxError: end of input reached
    '''
    start = None
    end = None
    for i,x in enumerate(s):
        if start is None:
            if not x.isspace():
                start = i
        else:
            if not(x.isalnum() or x in '_.'):
                end = i
                break
    if start is None:
        raise SyntaxError('end of input reached')
    else:
        if end is None:
            return ('', s[start:])
        else:
            return (s[end:], s[start:end])


def match_token(s, token):
    '''
    >>> match_token('this is a test', 'this')
    ' is a test'
    >>> match_token('is this a test?', 'this')
    Traceback (most recent call last):
        ...
    rollup.SyntaxError: EXPECTED: this FOUND: is this a test?
    '''
    s1, t1 = get_token(s)
    if t1.lower() == token.lower():
        return s1
    else:
        raise SyntaxError('EXPECTED: '+token+' FOUND: '+s[:40])


def get_key(s):
    '''
    >>> get_key('value type AS name')
    ('', Key(value='value', type='type', name='name'))
    >>> get_key('value type AS name test')
    (' test', Key(value='value', type='type', name='name'))
    '''
    try:
        s, value = get_token(s)
        s, type = get_token(s)
        s = match_token(s, 'AS')
        s, name = get_token(s)
        return (s, Key(value, type, name))
    except SyntaxError as e:
        raise SyntaxError('Error in key definition')


def get_many(s, f):
    '''
    >>> get_many('this is a test', get_token)
    ('', ['this', 'is', 'a', 'test'])
    >>> get_many('this is a test', get_key)
    ('this is a test', [])
    >>> get_many('value type AS name test', get_key)
    (' test', [Key(value='value', type='type', name='name')])
    >>> get_many('value type AS name value2 type2 as name2 test', get_key)
    (' test', [Key(value='value', type='type', name='name'), Key(value='value2', type='type2', name='name2')])
    '''
    try:
        s1, t = f(s)
        s2, matches = get_many(s1, f)
        return (s2, [t]+matches)
    except SyntaxError:
        return (s, [])


def get_create(s):
    '''
    >>> assert(get_create("""
    ... CREATE ROLLUP VIEW rollup_view_name ON source_table
    ... KEYS (
    ...     value type AS name
    ...     )
    ... UNIQUES (
    ...     value type AS name
    ...     ) ;
    ... """))
    >>> assert(get_create("""
    ... CREATE ROLLUP VIEW rollup_view_name ON source_table
    ... KEYS(
    ...     value1 type1 AS name1
    ...     value2 type2 AS name2
    ...     value3 type3 AS name3
    ...     )
    ... UNIQUES(
    ...     value1 type1 AS name1
    ...     value2 type2 AS name2
    ...     );
    ... """))
    >>> assert(get_create("""
    ... CREATE ROLLUP VIEW metahtml.metahtml_rollup1 ON metahtml.metahtml
    ... KEYS(
    ...     value1 type1 AS name1
    ...     value2 type2 AS name2
    ...     value3 type3 AS name3
    ...     )
    ... UNIQUES(
    ...     value1 type1 AS name1
    ...     value2 type2 AS name2
    ...     );
    ... """))
    >>> assert(get_create("""
    ... CREATE ROLLUP VIEW metahtml.metahtml_rollup1 ON metahtml.metahtml
    ... KEYS(
    ...     metahtml.url_hostname(url) text AS hostname,
    ...     date_trunc('day',accesed_at) timestamptz AS access_day
    ...     )
    ... UNIQUES(
    ...     url text AS url,
    ...     metahtml.simplify_url(url) text AS url_simplify
    ...     );
    ... """))
    '''
    s = match_token(s, 'CREATE')
    s = match_token(s, 'ROLLUP')
    s = match_token(s, 'VIEW')
    s, rollup_view_name  = get_token(s)
    s = match_token(s, 'ON')
    s, source_table = get_token(s)
    s = match_token(s, 'KEYS')
    s = match_token(s, '(')
    s, keys = get_many(s, get_key)
    s = match_token(s, ')')
    s = match_token(s, 'UNIQUES')
    s = match_token(s, '(')
    s, uniques = get_many(s, get_key)
    s = match_token(s, ')')

    t = create_rollup_str(
        source_table,
        rollup_view_name,
        keys,
        uniques)
    return (s, t)


def get_drop(s):
    '''
    >>> assert(get_drop("""
    ... DROP ROLLUP VIEW rollup_view_name ;
    ... """))
    '''
    s = match_token(s, 'DROP')
    s = match_token(s, 'ROLLUP')
    s = match_token(s, 'VIEW')
    s, rollup_view_name  = get_token(s)
    t = drop_rollup_str(rollup_view_name)
    return (s, t)


if True:
    print(create_rollup_str(
        source_table = 'metahtml.metahtml',
        rollup_view_name = 'metahtml.metahtml_rollup1',
        keys = [ 
            Key( value='metahtml.url_hostname(url)', type='text', name='hostname' ) ,
            Key( value="date_trunc('day',accessed_at)", type='timestamptz', name='access_day' ) ,
            ],
        uniques = [ 
            Key( value='url', type='text', name='url' ) ,
            Key( value='metahtml.simplify_url(url)', type='text', name='url_simplify' ) ,
            ],
        ))
    print(create_rollup_str(
        source_table = 'metahtml.metahtml',
        rollup_view_name = 'metahtml.metahtml_rollup2',
        keys = [ 
            Key( value='metahtml.url_hostname(url)', type='text', name='hostname' ) ,
            ],
        uniques = [ 
            Key( value='url', type='text', name='url' ) ,
            Key( value='metahtml.simplify_url(url)', type='text', name='url_simplify' ) ,
            ],
        ))
    print(create_rollup_str(
        source_table = 'metahtml.metahtml',
        rollup_view_name = 'metahtml.metahtml_rollup3',
        keys = [ 
            Key( value="date_trunc('day',accessed_at)", type='timestamptz', name='access_day' ) ,
            ],
        uniques = [ 
            Key( value='url', type='text', name='url' ) ,
            Key( value='metahtml.simplify_url(url)', type='text', name='url_simplify' ) ,
            ],
        ))
else:
    print(drop_rollup_str('metahtml.metahtml_rollup1'))
    print(drop_rollup_str('metahtml.metahtml_rollup2'))
    print(drop_rollup_str('metahtml.metahtml_rollup3'))
