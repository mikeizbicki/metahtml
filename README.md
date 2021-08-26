# metahtml [![ContinuousIntegration Status](https://github.com/mikeizbicki/metahtml/workflows/tests/badge.svg)](https://github.com/mikeizbicki/metahtml/actions)

This library extracts metadata from a webpage.
This meta-information includes:
1. type (article, not article)
1. language
1. publication time
1. modification time (if modified since published)
1. author name
1. canonical url
1. urls of translations into other languages
1. links
1. images
1. meta description
1. article text

All of this information is encoded in the HTML at various locations.
The problem is that there are many standards for encoding this information,
and even major websites like the BBC often do not follow the standards exactly.
Therefore, existing tools for extracting this information are frequently wrong.

The key unique feature of this library is that it has 1000s of test cases for different webpages.
These test cases give us a high confidence that the information extracted from the webpage is correct.

## Downloading

It is not recommended to perform a standard git clone on this repo.

This repo has a very large (multi-gigabyte) test suite.
Therefore, a standard `git clone` will download a large number of unneeded files.
Instead, I recommend using the following procedure for performing a partial clone.

```
$ git clone --filter=blob:none --no-checkout https://github.com/mikeizbicki/metahtml
$ cd metahtml
$ git sparse-checkout init
$ git sparse-checkout set '!/tests/.cache' '/*'
$ git checkout master
```

For detailed on what these commands are doing, see [this github blog post](https://github.blog/2020-01-13-highlights-from-git-2-25/).

## Testing overview

There are currently two types of tests: golden and content tests.

### Golden Tests

The golden tests ensure that certain metainformation (language, publication date, modification date, and type) are all correct.
They are called "golden" tests because we record a gold-standard output for each file,
and the test case ensures that the output of metahtml matches the gold-standard output file exactly.
These are the most basic tests, and at least one test must exist for every domain name that we want to use metahtml on.

The file `tests/test_golden.py` provides a simple command line interface for extracting information from a webpage.
For example, we can extract information from https://www.cnn.com/2020/03/28/politics/trump-executive-order-ready-reserve-military-coronavirus/index.html with the command
```
$ python3 tests/test_golden.py 'https://www.cnn.com/2020/03/28/politics/trump-executive-order-ready-reserve-military-coronavirus/index.html'
```
and get output like
```
test_path= tests/.golden/https___www.cnn.com_2020_03_28_politics_trump-executive-order-ready-reserve-military-coronavirus_index.htmla7ac3bf6/2020-07-13
{
    "language": "en",
    "timestamp.modified": {
        "hi": "2020-03-28 17:11:14.999999+00:00",
        "lo": "2020-03-28 17:11:14+00:00"
    },
    "timestamp.published": {
        "hi": "2020-03-28 13:09:30.999999+00:00",
        "lo": "2020-03-28 13:09:30+00:00"
    },
    "type": "article",
    "url": "https://www.cnn.com/2020/03/28/politics/trump-executive-order-ready-reserve-military-coronavirus/index.html"
}
```
Most of these fields are self explanatory, but the `timestamp` fields are slightly confusing.
The accuracy of the timestamp that an article has been published/modified on varies on different websites, and the `hi` and `lo` fields are used to specify the range that the article may have been published on.
For example, the cnn.com webpage above specifies the article timestamp accuracy down to the second, but the following webpage specifies the accuracy only down to the day.
```
$ python3 tests/test_golden.py 'http://www.windermeresun.com/2020/01/10/conseqences-of-qasem-soleimanis-death/'
test_path= tests/.golden/http___www.windermeresun.com_2020_01_10_conseqences-of-qasem-soleimanis-death_8cdd1101/2020-06-29
{
    "language": "en-us",
    "timestamp.published": {
        "hi": "2020-01-10 23:59:59.999999",
        "lo": "2020-01-10 00:00:00"
    },
    "type": "article",
    "url": "http://www.windermeresun.com/2020/01/10/conseqences-of-qasem-soleimanis-death/"
}
```

The library is able to extract considerably more information as well if you pass the `--full` flag,
but this extra information is not included in the test cases.

There are currently about 2000 domain names that the metahtml library has test cases for.

#### How to add new test cases

Test cases for a website consist of 2 files: 
1. A file containing the raw html data for the webpage (stored in the `tests/.cache/HASHED_URL/DATE` directory),
   where `HASHED_URL` is the url of the webpage with special characters (like `:/?&`) removed so that it is a valid filename,
   and `DATE` is the date the file was downloaded. 
   Storing the webpages is necessary because webpages change over time,
   and we want to ensure that the test cases do not change.
   In order to account for changes over time, we also store the date of the file as well.
   This way we can have multiple versions of the same webpage in the tests.
   Caching the files also greatly speeds up the testing process,
   since downloading thousands of webpages can take a long time.
2. A "golden test" file in `tests/.golden/HASHED_URL/DATE`.
   This file contains the output of the `tests/test_golden.py` python program.
   This file is only created after a human annotator has manually verified that the output for the program is correct for the given url.

In order to create a new test case, run the command
```
$ python3 tests/test_golden.py 'URL'
```
where `URL` is the url you are testing.
You must include the single quotation marks, or your terminal may mangle the url string before it gets passed to python.

##### If the output is correct

You need to create a commit with the new test case files, and create a pull request.
You should be able to add the correct files to the staging area with the commands
```
$ git add .
```
This will add all of the currently uncommitted files.
Before committing, run 
```
$ git status
```
to ensure that the only files that were added were the two test case files described above.
If extraneous files get added, I cannot accept your pull request.
Finally, commit the changes and issue the pull request.

##### If the output is incorrect

If the problem is the `language` field, then let me know.

* I'll have to fix this myself.

If the problem is that there is that the `timestamp.published` `timestamp.modified` fields are missing or incorrect:
* In order to fix this problem, you need to write an xpath that can extract the information from the given webpage, and add it to either the `metahtml/property/timestamp/published.py` or `metahtml/property/timestamp/modified.py` files.

If the problem is that the `type` field is incorrect:

* This field should be automatically determined based on the `timestamp.published` field.
  If there is a timestamp, then the `type` field should always say `article`;
  if there is no timestamp, then it can say anything else besides `article`.
  If this behavior isn't working correctly,
  let me know and I'll fix it myself.

#### Pull request check list

In order for me to accept a pull request, there needs to be at least 5 new test cases added for each hostname:
1. 1 test case for the hostname by itself (this should not have any timestamps)
1. 2 test cases for article urls (these should must have timestamps, and the timestamps should ideally be many years apart)
1. 2 test cases for "category" urls that contain lists of many other urls (these should not have timestamps)

### Content Tests

Content tests are used to measure how accurately (in precision/recall terms) metahtml extracts the content of a webpage.
Since we cannot guarantee that metahtml gets 100% accuracy on all webpages, these are not golden tests that must match exactly.

The file `tests/test_content.py` is used to create content tests.
To generate content tests, run the command
```
$ python3 tests/test_content.py --lang=en --username=mikeizbicki
```
but replace `mikeizbicki` with your github username and `en` with the ISO code of the language you wish to annotate.
This will launch a firefox window with the contents of the webpage loaded.
You can annotate the document by holding shift and selecting paragraphs;
any region of the document that is highlighted in red is labeled as not being part of the main text of the document.

The only content that should be labeled as document text (i.e. not red) is the actual content of the article.
Other metadata such as:

1. title
1. author byline
1. publication date
1. copyright notice
1. lists of links to related articles (that are not actually part of the document text)
1. advertisements
1. user comments
1. navigation menus
1. etc.

should all be highlighted in red.

There is a set of 50 urls that all annotators must label,
and the `test_content.py` file will ensure that you label these urls first.
You should submit a pull request with these 50 labels before moving on to labeling the remaining

**NOTE:**
Occasionally, metahtml will screw up the labeling process.
The most common ways this happens are:
1. Some webpages will come up blank when they should have some text content;
1. Some webpages have incorrect language labels, and so they will not get filtered correctly when using the `--lang=XX` parameter.
In either of these events:
1. Post a github issue with the url so that I can go and fix the issue.
1. Rerun the `test_contents.py` file with a new `--seed` parameter (set it equal to a number) to cause the remaining test cases to be randomly shuffled differently and you can get a new set of test cases to evaluate

<!--
The following urls have problems for some reason

Only contains Month/Day
https://www.healthcarefinancenews.com/news/five-blues-plans-launch-evio-profit-company-focused-lowering-drug-prices

Javascript webpage
https://spectrum.ieee.org/automaton/robotics/humanoids/hyundai-buys-boston-dynamics
https://www.virusbulletin.com/blog/2021/03/vb2021-localhost-call-papers-great-opportunity/
https://www.rsaconference.com/Library/Blog/weekly-news-roundup-january-25-29-2021
https://news.bitcoin.com/former-ethereum-developer-virgil-griffith-arrested-for-signing-into-his-coinbase-account-report/

503:
https://blog.cloudflare.com/quic-version-1-is-live-on-cloudflare/

Extracts correct div, but doesn't get the date from it
https://www.csis.org/events/rethinking-homeland-defense-domain-awareness-information-dominance-and-decision-superiority
https://chey.org/Eng/issues/IssuesContentsView.aspx?seq=415

## Notes

Some websites aggregate from other websites, but appear to be their own news source.
Should we special case these sites?
Example: https://headtopics.com/es/est-grave-de-salud-kim-jong-un-12557786

## Important links

Schemas:
https://iptc.org/standards/rnews/
https://schema.org/Article

Academic:
https://www.aclweb.org/anthology/2020.wac-1.2/t
https://ecir2020.org/

Python libraries:
https://github.com/scrapinghub/extruct
https://github.com/victormartinez/ferret
https://www.scrapinghub.com/data-api-news/
https://www.diffbot.com/products/automatic/article/
https://lateral.io/docs/article-extractor
https://extractarticletext.com/
https://www.octoparse.com/tutorial-7/capture-text-from-a-page
http://adrien.barbaresi.eu/blog/trafilatura-main-text-content-python.html
https://pypi.org/project/jusText/ (has lots of links to other libs)
https://github.com/dalab/web2text
https://github.com/dragnet-org/dragne

-->
