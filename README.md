# html\_parser [![ContinuousIntegration Status](https://github.com/mikeizbicki/metahtml/workflows/tests/badge.svg)](https://github.com/mikeizbicki/metahtml/actions)

This library extracts metadata from html.

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

## How to add support for a new hostname

The test cases for each hostname are stored in the file `tests/golden.csv`.
These test cases are generated in a semi-automated fashion that requires human review.

Adding support for a new hostname requires taking the following steps.

1. Generate test cases for the URLs by running the command
   ```
   $ python3 tests/test_golden.py --insert_urls URL1 URL2 URL3 URL4 URL5
   ```
   where `URL1` etc are the URLs to be added.
   This command inserts at least one line into `tests/golden.csv` for each URL.
   Depending on the URL, it may also insert translated versions of the webpage as well.

   If you have the URLs in a file called `URLS_FILE` (formatted with one URL per line),
   then you can run the command
   ```
   $ cat URLS_FILE | xargs python3 tests/test_golden.py --insert_urls
   ```
   to insert every URL in the file.

1. Open `tests/golden.csv` in excel.
   Find the lines for each of your inserted urls and edit each field using the following instructions.

   * `timestamp_published` / `timestamp_modified`:
     If these fields contain values, then verify that these values match the values displayed on the website.

     If these fields are blank,
     then find the xpath that refers to the article's publication timestamp,
     and add it to the `xpaths` variable in the `get_timestamp_published`/`get_timestamp_modified` functions within the `metahtml/timestamp.py` file.

     You can find an xpath reference at https://www.w3schools.com/xml/xpath_syntax.asp

     Some examples to pay attention to:

     1. BBC uses FB's OG to annotate title, but not date https://www.bbc.com/news/world-asia-50640033

     1. Stripes uses DC/OG meta data for title, but not date.
        Within the text area, there are extra words that get ignored by the parsing functions.
        https://www.stripes.com/news/us/navy-officer-receives-first-waiver-to-pentagon-transgender-policy-1.629896
     
     1. Don't use the innermost tag, use the semantically correct tag: https://theintercept.com/drone-papers/target-africa/

   * `title`:
      Remove category labels and website names from both the left and right of the title.
      For example:

      1. ```
         The week in charts - Chipping away at Huawei | Graphic detail | The Economist
         ```
         should be changed to
         ```
         Chipping away at Huawei
         ```
         There is a category label on the left and two on the right that get removed.

      1. Note that just because a title contains a `-` doesn't mean that it should be trimmed at that location.
         The following title should not be modified at all:
         ```
         Donald Trump-Kim Jong-un Summit Depends on One Word
         ```
         Similarly, the title below should not be modified
         ```
         Journalist Who Lived in Kim Jong-un's North Korea: "All Paths Lead to Catastrophe"
         ```
         as the `:` is part of the title.
         Othertimes, however, the `:` will separate the title from a category.
         For example,
         ```
         Donald Trump Is a Menace to the World: Opinion - DER SPIEGEL
         ```
         should be changed to
         ```
         Donald Trump Is a Menace to the World
         ```

      1. ```
         Overnight Defense — Presented by Boeing — House chairmen demand answers on Open Skies Treaty | China warns US to stay out of South China Sea | Army conducting security assessment of TikTok | TheHill
         ```
         should be changed to
         ```
         House chairmen demand answers on Open Skies Treaty | China warns US to stay out of South China Sea | Army conducting security assessment of TikTok 
         ```
         This article had three subjects embedded in it!
         All of these subjects must be kept.

      1. ```
         Paradoxe coréen, par Jean-Michel Frodon (Le Monde diplomatique, mars 2019)
         ```
         should be changed to
         ```
         Paradoxe coréen
         ```
         This title had lots of metadata in it like the author's name and publication date; those should be removed.


   * `human_annotator` :
     Write your name in this field, but only after you are sure that the line is correct.

1. Create a pull request with your changes.
   Your add command should look like
   ```
   $ git add metahtml/timestamp.py tests/golden.csv tests/.cache
   ```
   and your git commit message should look like
   ```
   Added support for: hostname1 hostname2 hostname3
   ```
   where `hostnameX` are the hostnames added in the commit.
   There should be no punctuation between the hostnames.


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

