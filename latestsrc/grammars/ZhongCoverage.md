{% raw %}# Usage

The script to run the coverage test is under zhong/cmn/zhs/utils. (The
test script for other languages will be added later).

    $ ./coverage.sh [--data LIST_FILE_NAME] \ 
                    [--best b] \ 
                    [--timeout sec] \ 
                    [--max-chart-megabytes mb] \ 
                    [--max-unpack-megabytes mb] 

The default option values are as follows.

1. **data**: COVERAGE
2. **best**: 5
3. **timeout**: 5 (sec.)
4. **max-chart-megabyte**: 256 (mb) for parsing, 2048mb for generation
(fixed)
5. **max-unpack-megabyte**: 256 (mb) for parsing, 2048mb for generation
(fixed)

If you run the following script, it will test both the regression test
with all testsuites for comparison and the coverage test with all the
following datasets.

# Data Set

## Development Set (dev)

This set is used to develop the grammar, and we can sometimes see the
items and look into where the problem in processing comes from. This set
includes the followings. (The LIST\_FILE\_NAME is DEV.)

1. **mrs**: Matrix MRS testsuite (107 sentences) (see
[MatrixMrsTestSuiteMandarin](https://delph-in.github.io/docs/grammars/MatrixMrsTestSuiteMandarin))
2. **ntumc**: the NTU-MC corpus
(<http://compling.hss.ntu.edu.sg/ntumc/>)
3. **pctb-dev**: Penn Chinese Treebank (LDC10T07; the first 5,000
sentences). This profile is not included in the repository, because
we have no permission to redistribute it.
4. **sinica-dev**: The Sinica Treebank include in the NLTK
(\~/nltk\_data/treebank/sinica). This profile has the first 5,000
sentences, and it is not include in the repository for the same
reason as pctb-dev.

## Held-out Set

The held-out dataset refers to a similarly constructed test set by
different groups and possibly from a different point of view. This
dataset aims to see how much out grammar is good from an objective
stance. This set includes the followings. (The LIST\_FILE\_NAME is
HELDOUT.)

1. **jec**: JEC Basic Sentence Data (created by Kurohashi and Kawahra
Lab., <http://nlp.ist.i.kyoto-u.ac.jp/EN/index.php>). This is a
trilingual dataset, whose components are written in Japanese,
English, and Chinese. These data can be used for testing machine
translation later.
2. **fu-berlin**: This testsuite was created as a project of
constructing "An HPSG Fraga­ment of Chinese" by Ste­fan Müller's
group (Freie Uni­ver­sität Berlin). This includes the basic
grammatical and ungrammatical sentences to be checked in developing
the basis of Chinese grammar in HPSG. (see
<https://hpsg.fu-berlin.de/Fragments/Chinese/>)
3. **mcg-smallest**: Mandarin Chinese Grammar
4. **mcg-wxl**: The data above and this were constructed based on the
phenomenon-oriented test suite from Dr. Xiangli Wang. This is
similar to **fu-berlin**, but is more likely to be based on the
DELPH-IN framework.

## Test Set (test)

These data should not be touched and seen by developers. These data are
tested every Friday to see the progress state of our current grammar.
For the copyright reason, these data are not included in the repository.
(The LIST\_FILE\_NAME is TEST.)

1. **pctb-test**: Penn Chinese Treebank (LDC10T07; the second5,000
sentences).
2. **sinica-test**: The Sinica Treebank include in the NLTK
(\~/nltk\_data/treebank/sinica, the second 5,000 sentences).

# Tools

The coverage testing employs several DELPH-IN tools. All the paths of
the tools below must be enrolled as PATH in \~/.bashrc (or whatever).

1. **ace**: see [AceTop](https://delph-in.github.io/docs/tools/AceTop)
2. **art**: see <http://sweaglesw.org/linguistics/libtsdb/art>
3. **pyDelphin**: see <https://github.com/goodmami/pydelphin>
4. **gTest**: see <https://github.com/goodmami/gtest>

# What to be calculated

1. **Parsing Coverage**: The parsing coverage is computed in terms of
four choices, including ordinary, unknown word handling, robust
parsing and the combination of the last two.
2. **Generation Coverage**: This is computed by one-best parsing and
generation.
3. **End-to-end Coverage**: Parsing Coverage \* Generation Coverage

# History of Coverage

See [ZhongHistory](https://delph-in.github.io/docs/grammars/ZhongHistory)

Last update: 2015-03-20 by SanghounSong [[edit](https://github.com/delph-in/docs/wiki/ZhongCoverage/_edit)]{% endraw %}