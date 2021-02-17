#!/usr/bin/python3
'''
This script collects all of the tests and outputs them as a single json object.
The output can then be used to bulk load the tests into a database.
'''

import json
import glob

tests = []
for filename in glob.glob('tests/.golden/*/*'):
    with open(filename) as f:
        test = json.loads(f.read())
        tests.append(test)

print(json.dumps(tests))
