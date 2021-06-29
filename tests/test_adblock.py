import metahtml.adblock


metahtml.adblock.load_adblocks()

def test_num_adblocks():
    '''
    This test asserts that the total number of test cases loaded is non-zero.
    The intention is to ensure that the data files for adblock are correctly installed and loaded.
    '''
    assert len(metahtml.adblock.global_filter_class) > 0
