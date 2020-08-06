from metahtml.property.timestamp.__common__ import TimestampExtractor


def test__get_best_timestamps_0():
    timestamps = [
        ]
    best_timestamps = TimestampExtractor.filter_results(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==0

def test__get_best_timestamps_1():
    timestamps = [
        TimestampExtractor.str_to_result('2019-02-10 23:59:59.999999'),
        TimestampExtractor.str_to_result('2019-02-10 23:59:59.999999'),
        ]
    best_timestamps = TimestampExtractor.filter_results(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==1

def test__get_best_timestamps_2():
    timestamps = [
        TimestampExtractor.str_to_result('2019-02-10 23:59:59.999999'),
        TimestampExtractor.str_to_result('2019-02-11 23:59:59.999999'),
        TimestampExtractor.str_to_result('2019-02-10 23:59:59.999999'),
        ]
    best_timestamps = TimestampExtractor.filter_results(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==2

def test__get_best_timestamps_3():
    timestamps = [
        TimestampExtractor.str_to_result('2019-02-10'),
        TimestampExtractor.str_to_result('2019-02-10 23:59:59.999999'),
        ]
    best_timestamps = TimestampExtractor.filter_results(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==1

def test__get_best_timestamps_4():
    timestamps = [
        TimestampExtractor.str_to_result('2019-02-10 23:59:59.999999'),
        TimestampExtractor.str_to_result('2019-02-10'),
        ]
    best_timestamps = TimestampExtractor.filter_results(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==1

def test__get_best_timestamps_5():
    timestamps = [
        TimestampExtractor.str_to_result('2019-02-10 23:59:59.999999'),
        TimestampExtractor.str_to_result('2019-02'),
        ]
    best_timestamps = TimestampExtractor.filter_results(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==1

def test__get_best_timestamps_6():
    timestamps = [
        TimestampExtractor.str_to_result('2013/01/'),
        TimestampExtractor.str_to_result('2013-01-27'),
        ]
    best_timestamps = TimestampExtractor.filter_results(timestamps, require_valid_for_hostname=False)
    assert len(best_timestamps)==1


def test__parse_timestamp_str_1():
    res = TimestampExtractor.str_to_result('2019') 
    assert res is not None
    assert res['value']['lo'] is not None

def test__parse_timestamp_str_2():
    res = TimestampExtractor.str_to_result('2019-02') 
    assert res is not None
    assert res['value']['lo'] is not None

def test__parse_timestamp_str_3():
    res = TimestampExtractor.str_to_result('2019-02-01') 
    assert res is not None
    assert res['value']['lo'] is not None

