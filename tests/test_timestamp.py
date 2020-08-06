import metahtml.extractors.timestamp


def test__get_best_timestamps_0():
    timestamps = [
        ]
    best_timestamps = metahtml.timestamp.get_best_timestamps(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==0

def test__get_best_timestamps_1():
    timestamps = [
        metahtml.timestamp.parse_timestamp_str('2019-02-10 23:59:59.999999'),
        metahtml.timestamp.parse_timestamp_str('2019-02-10 23:59:59.999999'),
        ]
    best_timestamps = metahtml.timestamp.get_best_timestamps(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==1

def test__get_best_timestamps_2():
    timestamps = [
        metahtml.timestamp.parse_timestamp_str('2019-02-10 23:59:59.999999'),
        metahtml.timestamp.parse_timestamp_str('2019-02-11 23:59:59.999999'),
        metahtml.timestamp.parse_timestamp_str('2019-02-10 23:59:59.999999'),
        ]
    best_timestamps = metahtml.timestamp.get_best_timestamps(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==2

def test__get_best_timestamps_3():
    timestamps = [
        metahtml.timestamp.parse_timestamp_str('2019-02-10'),
        metahtml.timestamp.parse_timestamp_str('2019-02-10 23:59:59.999999'),
        ]
    best_timestamps = metahtml.timestamp.get_best_timestamps(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==1

def test__get_best_timestamps_4():
    timestamps = [
        metahtml.timestamp.parse_timestamp_str('2019-02-10 23:59:59.999999'),
        metahtml.timestamp.parse_timestamp_str('2019-02-10'),
        ]
    best_timestamps = metahtml.timestamp.get_best_timestamps(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==1

def test__get_best_timestamps_5():
    timestamps = [
        metahtml.timestamp.parse_timestamp_str('2019-02-10 23:59:59.999999'),
        metahtml.timestamp.parse_timestamp_str('2019-02'),
        ]
    best_timestamps = metahtml.timestamp.get_best_timestamps(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==1

def test__get_best_timestamps_6():
    timestamps = [
        metahtml.timestamp.parse_timestamp_str('2013/01/'),
        metahtml.timestamp.parse_timestamp_str('2013-01-27'),
        ]
    best_timestamps = metahtml.timestamp.get_best_timestamps(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==1


def test__parse_timestamp_str_1():
    res = metahtml.timestamp.parse_timestamp_str('2019') 
    assert res is not None
    assert res['value']['lo'] is not None

def test__parse_timestamp_str_2():
    res = metahtml.timestamp.parse_timestamp_str('2019-02') 
    assert res is not None
    assert res['value']['lo'] is not None

def test__parse_timestamp_str_3():
    res = metahtml.timestamp.parse_timestamp_str('2019-02-01') 
    assert res is not None
    assert res['value']['lo'] is not None

