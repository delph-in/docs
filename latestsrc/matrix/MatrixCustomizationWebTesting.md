{% raw %}# Web Testing

Web testing uses Selenium to proceed though the Grammar Matrix
customization questionnaire to test the javascript and cgi scripts. It
requires [FireFox](http://www.mozilla.org/en-US/firefox/fx/) and
[Selenium](http://pypi.python.org/pypi/selenium) on the local system
running the tests.

Below are instructions for
[running](https://delph-in.github.io/docs/matrix/MatrixCustomizationWebTesting#running-web-tests),
[adding](https://delph-in.github.io/docs/matrix/MatrixCustomizationWebTesting#adding-web-tests),
[maintaining](https://delph-in.github.io/docs/matrix/MatrixCustomizationWebTesting#maintaining-web-tests), and
[removing](https://delph-in.github.io/docs/matrix/MatrixCustomizationWebTesting#removing-web-tests) web tests, information
for understanding the [output](https://delph-in.github.io/docs/matrix/MatrixCustomizationWebTesting#understanding-web-test-output),
and a description of the [directory
structure](https://delph-in.github.io/docs/matrix/MatrixCustomizationWebTesting#directory-structure) of web test
modules.

# Running Web Tests

Web tests are run by the "web-test" (short form: "w") command of
matrix.py:

    python matrix.py web-test

The script will prompt for a patas username and password. This allows
the script to remotely install your local code to the [test
page](http://uakari.ling.washington.edu/matrix/test/matrix.cgi). The
tests will then be run and print the results. You can also use the
remote install to confirm any errors produced by the tests.

# Adding Web Tests

All the web tests are located in a single module
gmcs/web\_tests/testWeb.py. There are two ways to add a new web test:

1\. Using the [Selenium IDE
Plugin](http://seleniumhq.org/projects/ide/): The Selenium Plugin allows
for the fast creation of a Web Test although it will often require some
editing by hand. For information to creating a test in the IDE please
check out the
[documentation](http://seleniumhq.org/projects/ide/plugins.html). After
a test is created you can choose to export the test as "Python 2 (Web
Driver)". The test can then be added to testWeb.py by a "web-test-add"
(short form "wa") call:

    python matrix.py web-test-add [Exported File]

If the test doesn't run correctly after being exported then it will
probably require a little editing.

2\. Create or edit a web test Class: Tests can be created directly in
the gmcs/web\_test/testWeb.py module. Just create a new class using any
of the existing tests as a template.

Some tips for creating using [Selenium
WebDriver](http://pypi.python.org/pypi/selenium):

- driver.get(web\_address) is used to load a web page, it works best
when using the complete address.
- driver.find\_element\_by\_css\_selector is often the fastest and
easiest way to find an element on a given page. For more info on
[CSS Selector](http://www.w3.org/TR/CSS2/selector.html). If other
methods are having trouble locating an element consider changing it
to find\_element\_by\_css\_selector.
- The two main methods for interacting with elements is .click() and
.send\_keys(String).
- When sending a file name to an Input File element, it requires an
absolute path. To change the relative path from matrix root,
consider
.send\_keys(os.path.abspath("./gmcs/web\_tests/web\_choices/\[choices.txt\]"))
- .click() can be used to bring an element into focus.
- .click() on a option element will select it.
- One known
[bug](http://code.google.com/p/selenium/issues/detail?id=2301) with
CSS Selector is that commas can cause issues. Try matching
attributes with '^=', '$=', or '\*=' to match the start, end, or
substring of the attribute accordingly.

# Maintaining Web Tests

Occasionally something on the web page may change where the page is
working correctly, but the test is still failing. If possible see if the
test can be edited by hand to correctly find and interact with the page
correctly. Especially if the issue involves not correctly finding one of
the elements. See Adding Web Tests above.

# Removing Web Tests

If a test is no longer of any use to do major changes, the class can be
removed by hand or by calling "web-test-remove" (short form "wr"):

    python matrix.py web-test-remove [Class Name]

# Understanding Web Test Output

The web tests use the
[unittest](http://docs.python.org/library/unittest.html) module, so the
output is similar to Unit Testing. A dot (.) means the test passed, an
"F" means the test failed, and an "E" means there was an error during
the test. For F and E, the statements that caused the problem will be
displayed, but for "E", the test aborts at that point (no further tests
in that method will run).

The tests should provide a reference point for checking investigating
bugs, and a method for recreating the error.

# Directory Structure

Currently all the web tests are located in the module
gmcs/web\_tests/testWeb.py, and any choices files used by the test
should be stored in gmcs/web\_tests/web\_choices.

    gmcs/
        web_tests/
            testWeb.py
            web_choices/

Last update: 2021-06-04 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/MatrixCustomizationWebTesting/_edit)]{% endraw %}