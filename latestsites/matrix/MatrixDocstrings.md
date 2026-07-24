{% raw %}# Documentation for Grammar Matrix Docstrings and Links to Doc Pages
# Introduction
This document describes the addition of docstrings to the matrix customization system code, including [how to add docstrings to your TDL typedefs](https://github.com/delph-in/docs/wiki/MatrixDocstrings/_edit#add-a-docstring-to-a-typedef) and [how to add links to new documentation](https://github.com/delph-in/docs/wiki/MatrixDocstrings/_edit#add-a-new-link-to-matrix-documentation-pages) for use in these docstrings. 

## What are Docstrings?
A docstring can be added to a typedef when a typedef is added or updated from the python files in gmcs/linglib using parameters in mylang.add(). Docstrings appear as part of a typedef in your_language_name.tdl and provide extra information about each typedef. This information could include links to relevant documentation for the customization system libraries that the type bore constraints from.  This additional documentation is beneficial for both grammar engineers and linguistic researchers working with the grammar matrix customization system. Docstrings are also useful when using LTDB because the LTDB system will automatically add them to the description page for the type in the database (see [here](https://github.com/delph-in/docs/wiki/MatrixDocstrings/_edit#interaction-with-ltdb)).

There are two types of docstrings available to add to a typedef: links to documentation pages and general docstrings. The first type (links to documentation) is a pre-formatted docstring that can include a list of matrix documentation library links relevant to the typedef. The second type (general docstring) can be used to include your own text with no preformatting. The two styles can be added to the same typedef. 

The first type (links to documentation) will appear like this on general typedefs in the your_language_name.tdl file:

    png :+ [ PER person,
    NUM number ]
    """
    This type as generated from the customization system bore constraints from these libraries:
    https://github.com/delph-in/docs/wiki/MatrixDoc_Number
    https://github.com/delph-in/docs/wiki/MatrixDoc_Person
    """.

The second type (general docstring) will appear like this on general typedefs in the your_language_name.tdl file:

    png :+ [ PER person,
    NUM number ]
    """
    This is a sample sentence describing this type. 
    """.

Both types of docstring can be added to the same typedef, in which case they will combine into the following:

    png :+ [ PER person,
    NUM number ]
    """
    This type as generated from the customization system bore constraints from these libraries:
    https://github.com/delph-in/docs/wiki/MatrixDoc_Number
    https://github.com/delph-in/docs/wiki/MatrixDoc_Person
    This is a sample sentence describing this type
    """.

## Interaction with LTDB
When using LTDB, the docstrings you've added to your grammar will automatically appear on the description page for each type in your grammar.

Given the following typedef in your_language_name.tdl (with a docstring):

    itr-verb-lex := nom-intransitive-verb-lex
    """
    This type as generated from the customization system bore constraints from these libraries:
    https://github.com/delph-in/docs/wiki/MatrixDoc_Lexicon#verbs
    """.

The LTDB of your_language_name will produce the following:

<img width="917" height="188" alt="image" src="https://github.com/user-attachments/assets/506fa85b-c98a-4daf-9c53-f1b8ff14ff91" />


# Add a Docstring to a Typedef

There are 3 options for adding a docstring to your typedef: [links to documentation](https://github.com/delph-in/docs/wiki/MatrixDocstrings/_edit#links-to-documentation), [a general docstring](https://github.com/delph-in/docs/wiki/MatrixDocstrings/_edit#general-docstrings), or [both](https://github.com/delph-in/docs/wiki/MatrixDocstrings/_edit#both-links-and-a-general-docstring).

## Links to Documentation
To add a docstring with links to specific doc pages relevant to the typedef, simply add the line "links = set_links([X1, X2, X3, ...])" as a parameter to your call to mylang.add(), where the Xs in the list are each the name of a docpage_LINK global variable (as found in docstrings.py) that you want listed in the docstring. Make sure that the docpage_LINK(s) you want to use and the method set_links are imported from docstrings.py within the file you are working on. 

The following python code:

        typedef = \
            'verb-lex := non-mod-lex-item & \
                       [ SYNSEM [ LOCAL.CAT.HEAD verb, L-QUE - ] ].'
        mylang.add(typedef, links = set_links([LEXICON_VERBS_LINK]))

Will produce the following TDL typedef:

    verb-lex := non-mod-lex-item & \
                       [ SYNSEM [ LOCAL.CAT.HEAD verb, L-QUE - ] ].
    """
    This type as generated from the customization system bore constraints from these libraries:
    https://github.com/delph-in/docs/wiki/MatrixDoc_Lexicon#verbs
    """.

### What is set_links?
set_links is a function in the file docstrings.py which takes a list of docpage_LINK(s) and creates the full version of each link by concatenating the general MATRIX_DOC_LINK to the beginning of each of them. Then, it creates a set() from this list (so there are no repeats) and returns it. 

## General Docstrings
To add a general docstring to your typedef, simply add the following line as a parameter to your call to mylang.add(): docstring = "your_text_here". The String "your_text_here" contains the text you want in the docstring.

The following python code:

        typedef = \
            'verb-lex := non-mod-lex-item & \
                       [ SYNSEM [ LOCAL.CAT.HEAD verb, L-QUE - ] ].'
        mylang.add(typedef, docstring = "Sample description of this type.")

Will produce the following TDL typedef:

    verb-lex := non-mod-lex-item & \
                       [ SYNSEM [ LOCAL.CAT.HEAD verb, L-QUE - ] ].
    """
    Sample description of this type.
    """.

## Both Links and a General Docstring
You can add both documentation links and a general docstring to the same typedef. When both are added, the general text appears under the links within the same docstring.

The following python code:

        typedef = \
            'verb-lex := non-mod-lex-item & \
                       [ SYNSEM [ LOCAL.CAT.HEAD verb, L-QUE - ] ].'
        mylang.add(typedef, links = set_links([LEXICON_VERBS_LINK]), docstring = "Sample description of this type.")

Will produce the following TDL typedef:

    verb-lex := non-mod-lex-item & \
                       [ SYNSEM [ LOCAL.CAT.HEAD verb, L-QUE - ] ].
    """
    This type as generated from the customization system bore constraints from these libraries:
    https://github.com/delph-in/docs/wiki/MatrixDoc_Lexicon#verbs
    Sample description of this type.
    """.

# Add a New Link to Matrix Documentation Pages
In gmcs/linglib, there is a python file called docstrings.py. This is the core file for storing the links to documentation pages (that can be added to docstrings) and the main python method for adding/formatting doc links in a typedef.

At the top of the file, there is a global variable called MATRIX_DOC_LINK. This is the main link to the matrix doc pages, from which all other pages can be linked. Currently, the variable is set to "https://github.com/delph-in/docs/wiki/", but this can be changed if the docs ever move location.

After the general MATRIX_DOC_LINK, you can find a global variable for every Matrix Doc page/library. These variables are strings which contain the name of each doc page/library, which will take you to the specific doc pages when they are added to the end of the general MATRIX_DOC_LINK. For example, the variable CASE_LINK is defined as "MatrixDoc_Case", so when this variable is added to the end of MATRIX_DOC_LINK, you get "https://github.com/delph-in/docs/wiki/MatrixDoc_Case", which is the full link to the matrix doc page on Case.

To add a new link to a new library, simply define a global variable as yourlibraryname_LINK = "MatrixDoc_nameofyourlibrary". You can make sure that you've added the correct info by simply checking that "https://github.com/delph-in/docs/wiki/MatrixDoc_nameofyourlibrary" (MATRIX_DOC_LINK + yourlibraryname_LINK) links to the correct doc page.

Last update: 2025-12-11 by elshire7311 [[edit](https://github.com/delph-in/docs/wiki/MatrixDocstrings/_edit)]{% endraw %}