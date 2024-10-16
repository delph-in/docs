{% raw %}# Matrix Development

This wiki is a reference for Grammar Matrix developers. Users of the
Grammar Matrix should start from [MatrixTop](https://delph-in.github.io/docs/matrix/MatrixTop).

Below we have information about the [SVN
repository](https://delph-in.github.io/docs/matrix/MatrixDevTop#repository),
[configuration](https://delph-in.github.io/docs/matrix/MatrixDevTop#configuration), the [directory
structure](https://delph-in.github.io/docs/matrix/MatrixDevTop#directory-structure), and [other
links](https://delph-in.github.io/docs/matrix/MatrixDevTop#links).

# Moving to GitHub

As of July 2020, we are in the process of moving to [GitHub](/GitHub).
The Matrix projects page is:
<https://github.com/delph-in/matrix/projects/1>

This page needs to be updated.

# Matrix Developers links <a name="links"/>

A collection of documentation regarding the Matrix project, aimed at
Matrix developers.

- [Updating\_the\_Customization\_System](https://delph-in.github.io/docs/matrix/Updating_the_Customization_System)
- [matrixdef\_File\_Syntax](https://delph-in.github.io/docs/matrix/matrixdef_File_Syntax)
- [matrix.py](https://delph-in.github.io/docs/matrix/MatrixDevTop#matrixpy) (main script for customization)
- [MatrixDevConventions](https://delph-in.github.io/docs/matrix/MatrixDevConventions) (Listing of global
variables and other conventions)
- [MatrixRegressionTesting](https://delph-in.github.io/docs/matrix/MatrixRegressionTesting)
- [MatrixCustomizationUnitTesting](https://delph-in.github.io/docs/matrix/MatrixCustomizationUnitTesting)
- [MatrixCustomizationWebTesting](https://delph-in.github.io/docs/matrix/MatrixCustomizationWebTesting)
- [MatrixMorphology](https://delph-in.github.io/docs/matrix/MatrixMorphology)
- [PythonIdioms](https://delph-in.github.io/docs/matrix/PythonIdioms)
- [Running the web interface locally](https://github.com/delph-in/matrix/blob/trunk/web/README.md?raw=true)
- [MatrixTDBProcedures](https://delph-in.github.io/docs/matrix/MatrixTDBProcedures) (Current as of Sept 2009,
for MatrixTDB2)
- [MatrixTDB2Tables](https://delph-in.github.io/docs/matrix/MatrixTDB2Tables) (2009 version switched to
MatrixTDB2 from MatrixTDB)
- [MatrixValidationDebugging](https://delph-in.github.io/docs/matrix/MatrixValidationDebugging) (Deprecated.
See the section on [matrix.py](https://delph-in.github.io/docs/matrix/MatrixDevTop#matrixpy))
- [MatrixDevBlueprints](https://delph-in.github.io/docs/matrix/MatrixDevBlueprints) (Ideas and proposals for
Matrix development)
- [MatrixLibraryDevelopment](https://delph-in.github.io/docs/matrix/MatrixLibraryDevelopment)
- [MatrixLibraryWishList](https://delph-in.github.io/docs/matrix/MatrixLibraryWishList)

# Matrix Repository <a name="repository"/>

    svn co svn://lemur.ling.washington.edu/shared/matrix matrix

Note that you need to be granted permission to read or write to/from
this repository. Send email to linghelp@ or Emily Bender (ebender@)
about getting permissions. (Both email addresses above have
u.washington.edu as the domain)

# Configuration

## CUSTOMIZATIONROOT

Several matrix.py commands (such as "install", "vivify", and
"regression-test") require the environment variable CUSTOMIZATIONROOT to
be set, with the value being the "gmcs" directory of the Matrix branch
being used. In most cases this can, and should, be set as an option to
matrix.py (--customizationroot (short form: -C)). For example:

    python matrix.py --customizationroot=gmcs/ regression-test

or

    python matrix.py -C gmcs/ regression-test

If necessary, the variable may be set with an export command, which
would be valid for the current session. This export command may be
placed in \~/.bashrc so the variable is set each time a session is
started. Assuming the directory matrix/ exists is the home directory,
the export commands would look like this for trunk:

    export CUSTOMIZATIONROOT=~/matrix/trunk/gmcs

or like this for a branch:

    export CUSTOMIZATIONROOT=~/matrix/branches/mybranch/gmcs

## ACEROOT

Additionally, if you are using ACE ([AceTop](https://delph-in.github.io/docs/tools/AceTop)) for regression
testing or whatever, the variable may also be set with an export
command. This export command may be placed in \~/.bashrc, too. Make sure
to point the ACEROOT to the **directory** where ACE is located, as
opposed to the actual ACE binary.

    export ACEROOT=_YOUR_ACE_DIRECTORY_

You can download the latest version of ACE
[here](http://sweaglesw.org/linguistics/ace/download).

## Matrix.py <a name="matrixpy"/>

matrix.py is a top-level script used mainly by developers to do a wide
range of tasks, such as customization, validation, unit-testing,
regression-testing, and installing. The command python matrix.py --help
prints the following (as of 2011.04.26):

    Usage: matrix.py [OPTION] COMMAND [ARGS...]
    
    OPTIONS:
        --customizationroot (-C) PATH
                    Set CUSTOMIZATIONROOT to PATH.
        --cheap-hack
                    Add a blank morphological rule to irules.tdl (if it is
                    empty) to workaround a bug in Cheap.
        --lkb
                    Install the LKB binaries to a live site.
        --warning (-w)
                    Print warnings when running validate.
        --help (-h) [COMMAND]
                    Print a usage message about COMMAND (if specified) or
                    else all commands and examples.
        
    COMMANDS:
        customize (c) PATH [DEST]
                    Customize the grammar at PATH, with the output written to
                    DEST/iso or the directory named as the isocode at PATH. 
                    PATH points to a choices
                    file or a directory that contains a choices file.
        customize-to-destination (cd) PATH DEST
                    Customize the grammar at PATH, with the output written directly to
                    DEST. PATH points to a choices
                    file or a directory that contains a choices file.
        customize-and-flop (cf) PATH [DEST]
                    Customize and flop the grammar at PATH, with the output
                    written to DEST or the directory at PATH. PATH points to a
                    choices file or a directory that contains a choices file.
        validate (v) PATH
                    Validate the choices file at PATH.
        regression-test [-TASK] [TESTS]
                    Run regression test TASK (or all tasks if unsprecified)
                    over TEST (or all tests if unspecified). TASKS can be any
                    of the following and can be combined (e.g. -vc):
                      [none]       : run all tests
                      -v : validate and report errors
                      -c : customize and report errors
                      -p : customize and parse, report differences with gold
                    TESTS can be a single test name or a list of names.
        regression-test-add (ra) PATH/TO/CHOICES PATH/TO/TXTSUITE
                    Add CHOICES (a choices file) and TXTSUITE (a text file
                    containing test sentences) as a new regression test.
        regression-test-update (ru) TEST
                    Update the gold standard of TEST to use the results of the
                    current system.
        regression-test-remove (rr) TEST
                    Remove TEST from the regression test suite. This command
                    removes all files checked into subversion.
        regression-test-rename (rn) OLDTEST NEWTEST
                    Rename OLDTEST to NEWTEST. This is performed with a call
                    to 'svn mv' on the files in the repository. Remember to
                    commit your changes.
        unit-test (u)
                    Run all unit tests.
        web-test (w)
                    Run all web tests.
        web-test-add (wa) PATH [comment]
                    Add a new Selenium test with an optional comment.
        web-test-remove (wr) TEST
                    Remove a Selenium test.
        install (i) PATH
                    Install a custom instance of the Grammar Matrix
                    Customization System and Questionnaire at PATH (PATH is
                    generally a URL on the uakari server accessible via the patas server).
        vivify (v)
                    Install a new version of the Grammar Matrix Customization
                    System and Questionnaire to the live site after verifying
                    the code has been tested and committed to SVN.
    
    EXAMPLES:
      matrix.py customize ../choices/Finnish
      matrix.py c ../choices/Finnish
      matrix.py customize-and-flop ../choices/Finnish
      matrix.py cf ../choices/Finnish
      matrix.py validate ../choices/Finnish
      matrix.py v ../choices/Finnish
      matrix.py --customizationroot=gmcs/ regression-test
      matrix.py -C gmcs/ r -v
      matrix.py -C gmcs/ r -cp vso-aux-before-vp Fore
      matrix.py -C gmcs/ ra Cree_choices Cree_test_suite
      matrix.py -C gmcs/ ru Cree
      matrix.py -C gmcs/ rr tiniest
      matrix.py -C gmcs/ rn sujb-drop subj-drop
      matrix.py -C gmcs install username@patas.ling.washington.edu/home/www-matrix/html/username
      matrix.py -C gmcs/ --lkb ih my_matrix
      matrix.py -C gmcs/ vivify

# Directory Structure

If you get the repository using the command
[above](https://delph-in.github.io/docs/matrix/MatrixDevTop#repository), you will see three subdirectories:
branches, tags, and trunk. Each of these contain a copy of the Matrix
code (a "branch"), but "trunk" is the official version, "tags" contains
frozen snapshots (e.g. the version used for a dissertation, etc.), and
"branches" contains development versions. The directory structure
detailed below explains the directories and files for a single branch
(e.g. in trunk):

    gmcs/        [most of the code resides here]
        lib/              [Python libraries for internal code]
            hierarchy.py            [module for type hierarchies]
            tdlhierarchy.py         [module for tdl hierarchies]
            itsdb.py                [module for itsdb profile creation]
        linglib/          [Libraries for linguistic phenomena]
            tests/                  [unit tests for linglib]
            agreement_features.py
            argument_optionality.py
            auxiliaries.py
            case.py
            coordination.py
            direct_inverse.py
            features.py
            lexbase.py              [classes shared by lexicon.py and morphotactics.py]
            lexical_items.py        [should probably be merged with lexicon.py]
            lexicon.py
            morphotactics.py
            negation.py
            parameters.py
            toolboximport.py
            verbal_features.py
            word_order.py
            yes_no_questions.py
        regression-tests/ [code and resources for regression testing]
        sql_profiles/     [code and resources for MatrixTDB]
        tests/            [unit tests for the general system]
        __init__.py       [gmcs packaging module]
        choices.py        [classes for working with choices files]
        customize.py      [primary code for customizing grammars]
        def_check.py      [module to check matrixdef]
        deffile.py        [module to interpret matrixdef for web presentation]
        generate.py       [module to aid in test-by-generation]
        profiles.py       [MatrixTDB ... might be from old version]
        randgram.py       [out-of-date script to create a semi-random grammar]
        tdl.py            [module for dealing with TDL files]
        tdltest.py        [code to test tdl.py. Should probably be folded into unit tests]
        utils.py          [module with various helper functions]
        validate.py       [module to validate a choices file]
    gmmt/        [resources for the "massively multilingual translation" task]
    lisp/        [various lisp scripts for Developers]
    matrix-core/ [the Matrix grammar files]
    modules/     [snippets of TDL and notes about analyses]
    web/         [place for web questionnaire related files]
        sample-choices/   [sample choices files displayed on the live site]
        templates/        [inputs for test-by-generation]
        matrix.css        [style file for the questionnaire]
        matrixdef         [website content definition]
        matrix.js         [website-related functions]
    install      [bash script for installing the code (e.g. to the live site)]
    matrix.py    [Python script for running customize, tests, install, etc.]
    matrix.cgi   [CGI script to handle web requests]

Last update: 2024-10-15 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/MatrixDevTop/_edit)]{% endraw %}