{% raw %}# Updating the Customization System

There are several [steps](https://delph-in.github.io/docs/matrix/Updating_the_Customization_System#steps) to
updating the customization system, although you won't necessarily do all
of them for every change. We also have some instructions for [committing
or vivifying](https://delph-in.github.io/docs/matrix/Updating_the_Customization_System#committing) changes.
There are also a few [basic
examples](https://delph-in.github.io/docs/matrix/Updating_the_Customization_System#examples) of things to play
with if you are starting out.

# Steps to Update the System <a name="steps"/>

The Matrix questionnaire is a web application that presents a
user-linguist with a linguistic-typological questions, and in response
to the answers, the customization system creates a LKB-compatible
grammar for the language described. When a developer wishes to make
changes to the any part of the system, several different parts must all
be updated at the same time in order to keep everything working.

The questionnaire is a CGI application written in Python that is stored
in the Matrix svn repository (in matrix/gmcs/). Its most important files
are:

- The [matrixdef](https://delph-in.github.io/docs/matrix/matrixdef_File_Syntax)
file, which defines both the questionnaire and the list of
**choices** -- that is, the name space of attributes and their
ranges of values that are used to store the user's answers to the
questionnaire.
- matrix.cgi, a CGI script written in Python. The entry point for the
questionnaire.
- deffile.py, which defines the MatrixDefFile class. This class is
responsible for creating web pages based on the contents of
matrixdef.
- choices.py, which defines the ChoicesFile class. This class is
responsible for loading, saving, and providing access to the choices
file, which contains the user's answers to the questionnaire.
- validate.py, which contains code to confirm that the user's current
choices are describe a coherent language. (For example, if the user
says the language contains no determiners, they must not have
defined one.)
- customize.py, which contains the code that creates an LKB-compatible
grammar based on the current choices.
- tdl.py, which defines the TDLFile class.
- Library modules in gmcs/linglib/

When there are changes to be made to the questionnaire, a likely course
of action is the following:

1. Form fields for the new choices must be added to the matrixdef file.
   
   1. If necessary, support for new form field types or behavior (e.g.
a drop-down box) must be added to deffile.py.
2. If any old choices have become obsolete, the version number in
choices.py (specifically, in the current\_version method on the
ChoicesFile class) must be incremented. Furthermore, a new
up-revving method that converts choices files of version *n-1* to
the current version *n* must be added. See the comments in
choices.py for details.
3. Install the system to a test location (NOT the live site), then
verify the changes look as expected
4. Write appropriate methods in validate.py (or a library's validate()
method)

When changes are made to libraries:

1. The linguistic phenomenon to be covered must be identified, along
with its range of possible patterns in the world's languages, and
based on this range a set of new choices (names and values) must be
defined.
2. Write the processing code in customize.py (and/or in a
library-specific module)
3. Write [unit tests](https://delph-in.github.io/docs/matrix/MatrixCustomizationUnitTesting) for the code
4. Write [regression tests](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting) to test the output

When changing the underlying infrastructure:

1. Write the changes to matrix.cgi, customize.py, choices.py, or
whatever module is needing change
2. Definitely write [unit tests](https://delph-in.github.io/docs/matrix/MatrixCustomizationUnitTesting) for
these kinds of changes
3. Update the documentation as necessary (e.g. these wiki pages)

Don't forget to [commit](/Updating_the_Customization_System#committing)
the changes.

# Installing a Test Instance of the Customization System

You can install an instance of the Grammar Customization System in a
test location for local development using matrix.py

    `python matrix.py install username@patas.ling.washington.edu:/home2/www-matrix/html/name-of-instance`

Once it is installed, you can access the test instance by visiting `https://matrix.ling.washington.edu/name-of-instance`.

**NB:** AS of June 2021, new instances (with new names, that is) result in the 500-Internal-Server error and need to be fixed manually by the UW admin.
Hopefully this will be resolved soon. In the meantime, your options are reusing one of the existing instances (e.g. `trunktest`) or simply copying all the files somewhere on your own server and figuring out yourself how to set that server up... (The `install` script simply copies files.)

**Other notes:** Make sure there is a sessions directory where you install the matrix; if
there is not, create it yourself and make writeable. It seems like
without it, you can't run matrix.cgi from localhost. E.g. install the
instance to a directory called matrix, and inside that directory, also
create a directory sessions, and make it writealbe (e.g.
chmod a+w sessions).

# Committing and pushing changes to the remote repository (this one!) using git <a name="committing"/>

1. **NB**: Avoid working directly on the trunk. Work in a branch, then merge your branch into the trunk once it's ready. See [related issue](https://github.com/delph-in/matrix/issues/503).
2. Don't forget to run all of the [regression tests](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting) before merging your branch with the trunk and before installing a version on the main public website! 
3. Refer to [git docs/tutorials](https://www.atlassian.com/git/tutorials) for information about committing, resolving conflicts, etc.

# Committing and Vivifying Changes in the old SVN repository <a name="committing-svn"/>

1. svn update
2. resolve conflicts
3. run the regression tests:
[MatrixRegressionTesting](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting)
4. fix any regressions (repeat as necessary)
5. svn diff each file to find diffs and note in text file for svn
comment
6. svn update
7. svn commit
8. Close any associated Trac tickets

Vivify to the live site with the following command:

    python matrix.py vivify

**Caution:** The vivify command doesn't know about svn, and uploads
whatever is in your $CUSTOMIZATIONROOT directory. Make sure to vivify
from a clean trunk!

# Regarding Trac and SVN

We use [a Trac instance](https://lemur.ling.washington.edu/trac/matrix/)
for our bug/ticket tracking. Trac has some convenient functions, and
it's good practice to make use of them. For instance, 'r' followed by a
number generates a link to Trac's source code browser for that revision,
and '\#' followed by a number generates a link to a Trac ticket. A good
way to use these is:

- In your SVN commit message, point to the Trac ticket it addresses,
such as:

<!-- -->


    matrix.py: Added the ability to remove and rename regression tests.
               Fixes Trac #78

- When you close or modify a Trac ticket, point to the code revision
of changes related to that ticket, such as:

<!-- -->


    Completed in r18481

- This way, users viewing tickets or code in Trac can easily see the
related changes to the project for each revision or bug.

# Merge Issues

Occasionally you may find upon merging a branch to or from trunk that
SVN claims files were modified that were not. This may be a problem with
svn:mergeinfo properties on files, which get modified on merges (note,
the property is modified, not necessarily the file itself). You can
check this property with the following command:

    svn propget svn:mergeinfo path/

In the Matrix repository, we merge to/from trunk and branches, not
to/from subdirectories. If you merge to/from a subdirectory, spurious
mergeinfo properties may be created, which will lead to these issues.
These properties can be removed as follows:

    svn propdel svn:mergeinfo path/

Be sure to remove the properties from all branches that copied them, or
it might get copied back again.

# Basic things to try <a name="examples"/>

You can extend the subpages form with a placeholder for your new
subpage. That's an easy and fun way to start making changes.

Suppose you are adding a Library called MyLibrary. In deffile.py, you
will find the class MatrixDefFile's definition, with two dictionaries,
called "sections" and "doclinks". Add a key-value pair for your library
to each:

    'mylib':'My Library',
    ...

Then, open web/matrixdef (it may look like a binary file but go ahead
and open it in a text editor). There, add placeholder content between
some existing sections. E.g.:

    ...
    Section mylib "My Library"
    This is a placeholder.
    ...

If you now deploy the updated files to the test location and renew the
main matrix.cgi page, you should see "My Library" in the Sections form
and should be able to click on the link and see the placeholder content.

# Preliminary notes about attaching a debugger

In general,
[this](https://stackoverflow.com/questions/6989965/how-do-i-start-up-remote-debugging-with-pycharm)
seems to be a good guide. In practice, what you need to do in, say,
[PyCharm](/PyCharm) is this (assuming your copy of the Matrix webpage is
simply on your localhost):

- append the location of pycharm-debug.egg to your PYTHONPATH
- create a remote-debug running configuration in [PyCharm](/PyCharm)
(note that you do need professional edition for this)
- hit "debug" in [PyCharm](/PyCharm)
- insert the import pydevd and the settrace statements (see the guide
above) in the code (before the beginning of the main script part is
fine)
- reload the webpage

-- You should see the debugger attach successfully and should be able to
set breakpoints and step through the execution.

Last update: 2024-01-24 by taraw28 [[edit](https://github.com/delph-in/docs/wiki/Updating_the_Customization_System/_edit)]{% endraw %}