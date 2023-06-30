{% raw %}# Unit Testing

Unit testing is the systematic testing of code. For testing of overall
system performance regressions, see
[MatrixRegressionTesting](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting). Unit testing helps
to verify that code is correct and working as intended, and narrows down
the space where bugs can hide. You may want to check out the Wikipedia
entry on [Unit Testing](http://en.wikipedia.org/wiki/Unit_testing), and
the Python documentation for the [unittest
module](http://docs.python.org/library/unittest.html).

Below are instructions for
[running](https://delph-in.github.io/docs/matrix/MatrixCustomizationUnitTesting#running-unit-tests),
[adding](https://delph-in.github.io/docs/matrix/MatrixCustomizationUnitTesting#adding-unit-tests), and
[maintaining](https://delph-in.github.io/docs/matrix/MatrixCustomizationUnitTesting#maintaining-unit-tests) unit tests, and
[understanding](https://delph-in.github.io/docs/matrix/MatrixCustomizationUnitTesting#understanding-unit-test-output) the output,
as well as description on the [directory
structure](https://delph-in.github.io/docs/matrix/MatrixCustomizationUnitTesting#directory-structure) of unit test
modules.

# Running Unit Tests

Unit tests are run by the "unit-test" (short form: "u") command of
matrix.py:

    python matrix.py unit-test

Doing this will run all unit tests called from matrix.py, and print the
results.

# Adding Unit Tests

Unit tests are generally grouped in a module for each module to be
tested. For instance, we have the file gmcs/choices.py, so we would have
a test module gmcs/tests/testChoices.py. It is not necessary to prefix
the file with "test", but it is convention, and helps in automatic test
discovery (a feature in later Python versions, which we may use in the
future). Please read the [directory
structure](https://delph-in.github.io/docs/matrix/MatrixCustomizationUnitTesting#directory-structure) to see where the
test modules should be placed.

If a module does not have an associated test module (e.g.
gmcs/linglib/tense\_aspect.py), you should first add one (e.g.
gmcs/linglib/tests/testTense\_Aspect.py). Next you add a few lines in
matrix.py to call the tests:

```
   1 def run_unit_tests():
   2   import unittest
   3   loader = unittest.defaultTestLoader
   4   runner = unittest.TextTestRunner(verbosity=1)
   5   # other tests...
   6   # Add the following lines (modified for your test)
   7   print_line()
   8   print 'Tense and Aspect tests:'
   9   import gmcs.linglib.tests.testTense_Aspect
  10   runner.run(loader.loadTestsFromModule(gmcs.linglib.tests.testTense_Aspect))
```

Inside the file (e.g. gmcs/linglib/tests/testTense\_Aspect.py) you
should add your unit tests. Please refer to the [Python
documentation](http://docs.python.org/library/unittest.html) for how to
do that, or look at other test modules. In general, here's some
guidelines for writing tests:

- Break your assumptions
  - If your code assumes particular input, write a test that doesn't
follow these assumptions.
  - Remember that tests don't have to all be positive-- you can have
a test that expects to fail or throw an exception.
  - Just make sure your code does what you expect it to.
- Don't rely on outside files.
  - [ChoicesFile](/ChoicesFile) objects don't need a file to be
instantiated. You can pass in lists of strings. See
gmcs/tests/testChoices.py for an example.
  - You can also use "Mock objects", but as they are not part of the
standard Python libraries, it is not encouraged.
- Write one test method per code method, and many tests in a test
method.
  - E.g., if you have the method "instantiate\_hierarchies()" in
gmcs/linglib/tense\_aspect.py, you would want
"test\_instantiate\_hierarchies" in
gmcs/linglib/tests/testTense\_Aspect.py
  - This task is more easily done if your methods are functions--
that is, they take input, return a value, and don't have
side-effects.

# Maintaining Unit Tests

While your tests should change less often than your code, occasionally
you drastically change the way things are done and the tests no longer
pass, even if the code is correct. You can modify your tests to suit the
new code behavior, but do not just change the tests in order to get it
to pass. You should verify the code behaves as you expect, and perhaps
add a comment explaining a deprecated test.

If you write your tests to not be specific to the implementation, but
only test the input/output, then test maintenance will not have to be
done as often.

# Understanding Unit Test Output

When you run your tests, depending on the verbosity level set, you will
see informative messages displayed in STDOUT. A dot (.) means the test
passed, an "F" means the test failed, and an "E" means there was an
error during the test. For F and E, the statements that caused the
problem will be displayed, but for "E", the test aborts at that point
(no further tests in that method will run).

Hopefully, your tests are written specific enough so you can tell what
the error is. If not, you at least have a reference point from which you
can continue investigating.

# Directory Structure

We currently have two places for unit tests: gmcs/tests and
gmcs/linglib/tests. gmcs/tests is for unit tests over the general system
code, while gmcs/linglib/tests is for tests specific to linguistic
phenomenon libraries.

    gmcs/
        tests/
            testChoices.py
            testValidate.py
        linglib/
            tests/
                testMorphotactics.py

Last update: 2021-06-04 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/MatrixCustomizationUnitTesting/_edit)]{% endraw %}