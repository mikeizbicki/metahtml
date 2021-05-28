# for information on versioning metahtml, see: https://stackoverflow.com/a/56984285/1241368

import setuptools

with open("README.md", "r", encoding="utf-8") as fh: 
    long_description = fh.read()

setuptools.setup(
    name="metahtml",
    use_scm_version=True,
    setup_requires=['setuptools_scm'],
    author="Mike Izbicki",
    author_email="mike@izbicki.me",
    description="Extracts metadata and content from html webpages",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/mikeizbicki/metahtml",
    packages=setuptools.find_packages(exclude='tests'),
    python_requires='>=3.5',
)
