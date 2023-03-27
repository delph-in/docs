{% raw %}# Notes

## What is regression testing?

Regression testing checks if a new implementation works well with all
the previous functionality in the development of software. That is to
say, it should be tested to ensure the newly adapted development is not
detrimental to the previous implementation.

## Why do we have to conduct the test?

Recall the butterfly effect! Even if you change a very small thing on
the grammar, that may cause a huge difference in the coverage and
performance of the grammar. So you have to check out if your revision
has a positive or negative effect on the whole grammar. Normally, your
revision may focus on a small part of grammar, and you may want to test
your revision with a small number of sentences. Even though your
revision works well for your own test sentences, we cannot say that the
revision necessarily work in the correct direction for the other parts
of grammar. Your new implementation may or may not conflict with some
other grammar modules.

## When do we have to run the test?

In principle, whenever you want to commit the files that you editted to
the repository, you should run this test.

If you find no error in the test, you can submit your revision
willingly.

If you find an error in the regression test, you are responsible for
seeing where the error comes from and identifying whether the change
makes the grammar better or not. If you find that your grammar does not
have an adverse effect on the grammar, and the error just means that
your version improves the problems in the previos version, then you can
update the gold profile(s).

If you add a new grammatical module, you may want to add your own
testsuite, add the new gold profile, and add the testsuite name into the
the list of comparison.

# Required Components (Tools)

See [ZhongCoverage](https://delph-in.github.io/docs/grammars/ZhongCoverage)

# Usage

You can run the regression test under zhong/cmn/zhs/utils.

    $ ./regression_test.sh

The profiles to be tested are enumerated in COMPARISON under
zhong/cmn/zhs/utils (line by line).

## Adding a new profile

First, you have to convert your testsuite to a TDSB item file. The
script for this conversion is under zhong/utils

    $ ./make_item PATH_OF_TESTSUITE

This generate a txt file on the same folder with PATH\_OF\_TESTSUITE.

Second, you can create a folder named your testsuite under
*tsdb/skeletons/*, and save the item file generated above into the
folder. The name must be *item*. After that you can copy the *relations*
file from another profile folder (e.g. mrs). Then, you can register the
new profile into *Index.lisp*.

Third, you can generate a new profile using the following command. You
can run the following under zhong/cmn/zhs.

    $ mkprof -s tsdb/skeletons/YOUR_NEW_PROFILE tsdb/gold/YOUR_NEW_PROFILE 
    $ art -a "ace -g zhs.dat" tsdb/gold/YOUR_NEW_PROFILE

Finally, don't forget submitting your new profile into the repository.

Last update: 2015-03-19 by SanghounSong [[edit](https://github.com/delph-in/docs/wiki/ZhongRegressionTest/_edit)]{% endraw %}