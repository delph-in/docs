{% raw %}# Regression Testing

Before any changes are committed to trunk or vivified to the live site,
developers must verify the correctness of the system by running
regression tests. These tests are a series of saved choices files, test
suites, and gold-standard parsing profiles.

## Regression Testing with Pydelphin

The most modern framework for regression testing is with
[pydelphin](https://delph-in.github.io/docs/tools/PyDelphinTop). It works on Linux and Mac OSX, and only
requires that you check out the Matrix code and install pydelphin and
[ACE](https://delph-in.github.io/docs/tools/AceTop). Pydelphin allows you to:

- [Create](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting#creating-a-new-regression-test) and [update](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting#updating-a-regression-test) regression tests
- [Run](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting#run) all or some of the regression tests listed in the regression-test-index file (located in `gmcs/regression_tests/`)

Note that you should refer to the official [pydelphin
docs](https://pydelphin.readthedocs.io/en/latest/) for the information
on how to use it in general.

Also note that you should not forget to manually add new tests to git.
This might be for the better as it encourages extra care (we have
problems in the past with empty gold profiles being automatically added
to svn, etc).

Last but not least, note that, while pydelphin allows you to inspect the
MRS and compare two profiles, it has no GUI and will not allow you to
click around the MRS, highlight variables, click on results to see trees
and feature structures etc. Therefore, it is recommended that you still
use \[incr tsdb()\] to inspect the gold profiles before adding new
tests.

[Click here](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting#original) to see the information
on the original regression testing framework.

<a name="run"/>


### Running regression tests

NB: Below, it is assumed that your matrix/trunk and any matrix/branches
are located right in your home directory. Please adjust according to
your actual directory structure.

After you have [checked out the matrix code](https://delph-in.github.io/docs/matrix/MatrixDevTop#repository)
and have descended into the matrix/trunk directory (or to your branch),
create and activate a virtual environment (not necessary but strongly
recommended):

    [~]$ cd matrix/trunk
    [~/matrix/trunk]$ virtualenv -p python3 py3env
    [~/matrix/trunk]$ source py3env/bin/activate

Now install pydelphin v. 1.0:

    (py3env) [~/matrix/trunk]$ pip install pydelphin

Now, assuming you have got ACE added to your PATH, you can simply run
all the regression tests which are listed in
gmcs/regression\_tests/regression-test-index:

    (py3env) [~/matrix/trunk] ./rtest.py

Or, you can run a specific test:

    (py3env) [~/matrix/trunk] ./rtest.py Cree

Or, a number of tests starting with some string:

    (py3env) [~/matrix/trunk] ./rtest.py adj*

### Creating a new regression test

To add a new regression test:

1. Come up with a meaningful name for the test, e.g.
wh3-svo-sg-oblig-det for "wh-questions library, test number 3, a
pseudolanguage which has SVO word order, obligatory single fronting,
and determiners". Adding a number to your test name can be helpful
for later debugging; it is easier to grab a profile/log by a number
than by a long name among other long names consisting of the same
parts (e.g. sov-aux-before-v vs svo-aux-before-v can be easily
confused).
2. You probably have a grammar corresponding to this new test which you
created with the Grammar Matrix system. Take a note of the location
of the choices file and the test\_sentences file, or put them
somewhere convenient, such as tests/regression/scratch/.
3. Run rtest.py with the --add command:

<!-- -->


    (py3env) [~/matrix/trunk] ./rtest.py --add tests/regression/scratch/choices tests/regression/scratch/test_sentences myNewTestName

### Removing a regression test

If something is not right, you can always remove a fully or partially
created test by running:

    (py3env) [~/matrix/trunk] ./rtest.py --remove myOldTestName

### Updating a regression test

Sometimes gold profiles contain mistakes or at any rate, the current
profile is preferable over the gold one. In this case, the gold profile
should simply be replaced by the current one. You can do this by
running:

    (py3env) [~/matrix/trunk] ./rtest.py --update TestName

### Debugging regression diffs

If some of the tests fail, look in the corresponding log file. For
example, you might see there:

      Current profile: MyBranch/tests/regression/home/current/testname
      Gold profile:    MyBranch/tests/regression/home/gold/testname
      1                                        <0,1,0>
      3                                        <0,1,0>
      5                                        <0,1,0>
      7                                        <0,1,0>
      10                                       <0,1,0>
      11                                       <1,0,1>
      15                                       <0,1,0>
      16                                       <0,1,0>
    Result: FAIL

The above log is telling you that item whose ID is 11 is parsed
differently in the current and the gold profiles. You can tell because
it has 0 results in the middle column which is the shared results
column. The other columns are for unique results in current and gold, so
for a test to pass, those columns should have zeros.

To inspect, you can either use \[incr tsdb()\] or pydelphin, as below:

         (py3env) [~/matrix/trunk] delphin select 'mrs where i-id = 11' tests/regression/home/gold/testname/ | delphin convert --indent
         (py3env) [~/matrix/trunk] delphin select 'mrs where i-id = 11' tests/regression/home/current/testname/ | delphin convert --indent

That will nicely display the two MRS in your terminal (you may need to
install delphin highlight plugin:

        pip install delphin.highlight

## Classical (LOGON-dependent) system for regression testing

This older testing framework uses the customization system to create a
grammar from the choices file, then uses \[incr tsdb()\] and ACE to
parse the test suite with the grammar and verify the results are the
same as those in the gold-standard profile.

See below for information on how to [run](/MatrixRegressionTesting#run),
[update](/MatrixRegressionTesting#update),
[add](/MatrixRegressionTesting#add), or
[maintain](/MatrixRegressionTesting#maintain) regression tests, as well
as a description of the [directory
structure](/MatrixRegressionTesting#directory) of the regression test
framework.

Regression testing works with ACE ([AceTop](https://delph-in.github.io/docs/tools/AceTop)) for speed and
handling ICONS. As of September 18th, 2014, it takes about 8 minutes
with 273 choices files. Regression testing with ACE requires about 2 GB
free disk space on your machine. You can download the latest version of
ACE [here](http://sweaglesw.org/linguistics/ace/download).

## Setting Up a Regression Testing Environment

Regression tests require a system with Ubuntu 12.04+, emacs23+, LOGON,
ACE, and other requirements. For a step by step guide to setting up a
virtual machine that meets these requirements, see
[MatrixRegressionTestingSetup](https://delph-in.github.io/docs/matrix/MatrixRegressionTestingSetup).

Note if you try to run most or all of the tests in one command, a
current bug results in all of the tests producing errors. To avoid this
bug, change the user limit to at least above 10,000. For instance, in
Ubuntu, the limit can be changed by editing this file:
/etc/security/limits.conf

    * soft nofile 40000
    * hard nofile 40000

Then, you can change it at the terminal:

    ulimit -n 40000

Logout and login to initiate this change.

## Running Regression Tests

Before you can run the regression tests, you must make sure the
environment variables
[CUSTOMIZATIONROOT](/MatrixDevTop#customizationroot) and
[ACEROOT](/MatrixDevTop#aceroot) are set.

To run all tests, run the "regression-test" (short form: "r") command of
matrix.py with no arguments:

    python matrix.py regression-test

To run a single test, run the "regression-test" command with the test
name as the argument:

    python matrix.py regression-test infl-q-aux-verb

You can also run a suite of tests using the wildcard character. The
following runs all of the tests beginning with "neg":

    python matrix.py r neg*

For each test, a result will be printed to STDOUT. A correct grammar
will result in a "Success!" message, while a faulty one will result in a
"DIFFS!" message. If you ran a single test, the items causing error
messages will be printed to STDOUT, otherwise they will be repressed.
The results will also be written to a [log
file](/MatrixRegressionTesting#logs).

After running the tests, check the [logs](/MatrixRegressionTesting#logs)
for differences, and either fix the regressions or
[update](/MatrixRegressionTesting#update) any progressions.

## Checking Logs

The results of a run of the regression tests are saved in several log
files. These files are:

        gmcs/
            regression_tests/
                logs/
                    regression-tests.date
                    test-name.date
                    tsdb.date

- "regression-tests.date" shows the "Success!"/"DIFFS!" messages for
each test, and the items causing diffs.
- "test-name.date" shows the diffs from a particular test.
- "tsdb.date" shows the output of \[incr tsdb()\], which may be useful
in debugging (if the grammar fails to load, for instance).

Note: The date is only granular to the day, so multiple runs in a single
day are in the same file.

## Updating Regression Tests

Sometimes, changes to the customization system yield grammars that
perform *better* that the gold standard. These changes will produce a
"DIFFS!" result, but it is not necessarily a bad thing. After opening
the current and gold profiles in \[incr tsdb()\] and verifying (by hand)
that the current results are more desirable, you can update the gold
standard to use the current results. This is done with the
"regression-test-update" (short form: "ru") command of matrix.py, and
with the name of the test as an argument. This command is designed to be
used after discovering a difference. It relies on the new gold standard
file being stored in the testing environment
(regression\_testing/home/current), so make sure to run the test first:

    python matrix.py r test-to-update
    python matrix.py ru test-to-update

This should add the new gold standard files to svn, so be sure to commit
them!

## Adding Regression Tests

Whenever a new feature is added to the customization system, regression
tests should be created to test this feature. Regression tests consist
of a choices file and a test suite. Choices files can be any set of
choices in the choices file format, but they must validate.

Ensure that the Grammar Matrix produces the grammar you expect given the
choices file **before** adding the test. Here is a general workflow:

1. Create txtsuite file with the sentences for the testsuite
2. Create the corresponding choices file
3. Use the current customization system version to create a grammar
from the choices file
4. Start up the lkb & \[incr tsdb()\]
5. Load the grammar into the lkb
6. In \[incr tsdb()\] use "import test items" to create a test suite
profile from the txtsuite file
7. In \[incr tsdb()\] use "process \| all items" to parse the test
items with the grammar
8. In \[incr tsdb()\] use "browse \| results" to **manually** explore
both grammaticality and MRSs for each test item
9. Adjust the customization system until the previous step yields the
desired result
10. For each change to the customization system, ensure that all other
regression tests continue to pass

Tests take their name from the choices file's language name, so make
sure to name each language appropriately. Generally, test/language names
follow this general template: LIBRARY-PHENOMENON-INSTANCE; e.g.
"neg-head-comp-vpauxbefore-compbefore". However, this is not an enforced
standard.

Test suites are text files with one test item per line, negative
(ungrammatical) items marked with an asterisk (\*), such as:

- he likes her
- the boy plays
- the dog barks
- \*he likes she
- \*the boy play
- \*the dogs barks

New regression tests are created using matrix.py. First, put your
choices file and test suite file into
mybranch/gmcs/regression\_tests/scratch/, and then do the following:

    python matrix.py regression-test-add CHOICES_FILENAME TXT-SUITE_FILENAME

CHOICES\_FILENAME and TXT-SUITE\_FILENAME are just the filenames (not
the full paths) of the files you added into the scratch/ directory.

This is what regression-test-add does under the bonnet (paths relative
to gmcs/regression\_tests):

1. Customizes a grammar from the choices file
2. Compiles the grammar with ACE
3. Copies the choices file to choices/ and test suite to txt-suites/
4. Adds the regression test to regression-test-index
5. Creates an unparsed profile
6. Parses the profile with ACE and art
7. Uses the parsed profile as gold (in home/gold/lang-name/), and the
item and relations files for a skeleton (in skeletons/lang-name)
8. Updates the skeletons index (skeletons/Index.lisp)

Make sure to test your regression test after you add it:

    python matrix.py regression-test NAME_OF_TEST_LANGUAGE

When you're finished adding all your regression tests:

    svn commit

If you're having trouble, make sure your
[CUSTOMIZATIONROOT](/MatrixDevTop#customizationroot) and
[ACEROOT](/MatrixDevTop#aceroot) are set up properly and take a look at
[MatrixRegressionTestingSetup](https://delph-in.github.io/docs/matrix/MatrixRegressionTestingSetup)

## Maintaining regression tests

DO avoid editing regression-test-index directly or changing the contents
of choices/ txt-suites/ skeletons/ or home/gold by hand. This code is
probably fairly brittle wrt to files not being where they are expected.

Otherwise, no need to do anything here: We want choices files in old
versions so that we are routinely testing the up-rev code.

## Directory structure:

    regression_tests/
            add_regression_test.py
            call-customize
            run_regression_tests.sh
            regression-test-Index
            regressiontestindex.py
            update-gold-standard.sh
            choices/
            txt-suites/
            skeletons/      [tsdb skeletons]
                    Index.lisp
            home/           [tsdb home]
                    gold/
                    current/
            grammars/
            logs/
            scratch/

## Notes

A typical reason for all tests failing is using a wrong customization
root.

Everything in the home/current/, grammars/, and logs/ subdirectories is
placed there and named by the scripts.

Language name in choices file used as the basis of the naming. We need a
convention for them :slightly\_smiling\_face:

Last update: 2022-03-01 by Guy Emerson [[edit](https://github.com/delph-in/docs/wiki/MatrixRegressionTesting/_edit)]{% endraw %}