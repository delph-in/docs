{% raw %}# Stanford Tools

Zhong makes use of the Standford tools for segmenting raw sentences and
POS-tagging the segmented sentences. These tools are not included in the
Zhong repository, and users are responsible for downloading, installing,
and setting up the tools.

## java

The Stanford tools are all implemented in JAVA. So, if your machine does
not have JAVA, you must install JAVA first (java1.7 or java1.8).

    $ sudo add-apt-repository ppa:webupd8team/java
    $ sudo apt-get update
    $ sudo apt-get install oracle-java8-installer

Please check out whether the java binary works on your machine.

    $ which java
    /usr/bin/java
    
    $ java -version
    java version "1.7.0_72"

## Stanford Word Segmenter

<http://nlp.stanford.edu/software/segmenter.shtml#Download>

1. If you are using java1.7, download versin 3.4.1
\[<http://nlp.stanford.edu/software/stanford-segmenter-2014-08-27.zip>\].
If you are using java1.8, download version 3.5.0
\[<http://nlp.stanford.edu/software/stanford-segmenter-2014-10-26.zip>\]
or later.
2. Extract the zip file somewhere you want.
3. Register the path in your \~/.bashrc or whatever. The name must be
STANFORD\_SEGMENTER\_PATH. For example,

<!-- -->


    export STANFORD_SEGMENTER_PATH=/home/sanghoun/tools/stanford-segmenter

## Stanford POS Tagger

<http://nlp.stanford.edu/software/tagger.shtml#Download>

1. According to your java version, download the proper version (3.4.1
for java1.7 / 3.5.0 or later for java1.8). You have to download the
FULL version.
2. Extract the zip file somewhere you want.
3. Register the path in your \~/.bashrc or whatever. The name must be
STANFORD\_SEGMENTER\_PATH. For example,

<!-- -->


    export STANFORD_TAGGER_PATH=/home/sanghoun/tools/stanford-postagger

# NLTK

NLTK is required, because the script for running the Stanford POS tagger
is build on NLTK.

1. Install Setuptools: <http://pypi.python.org/pypi/setuptools>
2. Install Pip & Install NLTK

<!-- -->


    $ sudo easy_install pip
    $ sudo pip install -U nltk

You can test installation, using

    $ python
    >>> import nltk

## nltk.tag.stanford

After installing NLTK, you want to add Stanford libraries into your
NLTK.

    $ python
    >>>  from nltk.tag.stanford import POSTagger

You can install nltk.tag.stanford answering the query. In addition, you
may want to register JAVAHOME in your bashrc, too. For example,

    export JAVAHOME=/usr/bin/java

Last update: 2015-01-22 by SanghounSong [[edit](https://github.com/delph-in/docs/wiki/ZhongPreprocessing/_edit)]{% endraw %}