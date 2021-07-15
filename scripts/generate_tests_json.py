#!/usr/bin/python3
'''
This script collects all of the tests and outputs them as a single json object.
The output can then be used to bulk load the tests into a database.
'''

import json
import glob

with open('golden.jsonl','x') as fout:
    for filename in glob.glob('tests/.golden/*/*'):
        if '.content' not in filename:
            with open(filename) as f:
                test = json.loads(f.read())
                fout.write(json.dumps(test)+'\n')

with open('golden_full.jsonl','x') as fout:
    for filename in glob.glob('tests/.golden_full/*/*'):
        if '.content' not in filename:
            with open(filename) as f:
                test = json.loads(f.read())
                fout.write(json.dumps(test)+'\n')
