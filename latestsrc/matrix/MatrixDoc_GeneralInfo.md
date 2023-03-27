{% raw %}# Documentation for the Grammar Matrix Customization General Information Page

# Introduction

This document provides background information on how to fill out the
[General Information
page](http://matrix.ling.washington.edu/customize/matrix.cgi?subpage=general)
of the customization system.

# Options

## Language

You must provide the name of the language (or grammar if you are working
on a fake-language) and can (optionally) provide the language's [ISO
code](http://www.sil.org/iso639-3/codes.asp).

The file containing language-specific implementations based on the
questionnaire will be named after the name of the language. The name of
the directory of your grammar will be its [ISO
code](http://www.sil.org/iso639-3/codes.asp), if provided and else the
language's name.

## String-processing

String processing allows you to define specific settings for
tokenization, in particular regarding punctuation. The options provided
on the [General Information
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=general)
allow you to select which characters may be part of a token in addition
to letters.

The default setting discards all punctuation, except for the following
three characters: "-", "=" and ":". These characters are typical ways to
mark morphosyntactic boundaries and likely to occur in grammars until
morphophonemics is dealt with (the Grammar Matrix supports
morphosyntactic, but not morphophonemic phenomena).

The following other options are provided:

- Discard all lower ascii punctuation except \\x22 (i.e. also discard
"-","=" and ":")
- Split on tabs and white space, maintain all other characters
- Define a customized list of characters (other than letters) that may
occur in tokens

Note that if you decide to go with the second option or allow basic
punctuation marks to occur in tokens, you must either implement analyses
that deal with punctuation or make sure you do not use these punctuation
marks for actual punctuation in your examples. For instance: if "." can
be part of tokens, tokenization will make *punctuation!* a word rather
than *punctuation* in the sentence *Be careful with punctuation!*.

In general, the default is recommended. The other options can be used as
an example on how to define the repp file as soon as the grammar gets
bigger and it is time to deal with punctuation properly.

## Archiving and Version Control

### Archiving

All information concerning archiving is optional. If not filled out,
your answers to the questionnaire will **not** be retained by us. If
possible, do allow us to save your answers and provide us with name and
contact details. This information can help us monitor how the Grammar
Matrix is used and improve it. We may contact you out of interest in
your research, unless you add to the comments on your implementation
that you prefer not to be contacted. As mentioned on the page, we will
not share your answers or identifying information outside the project,
unless required by law.

### Version Control

Highly recommended, even for smaller grammar development projects.
Please consult the [wiki](https://delph-in.github.io/docs/tools/VersionControlForGrammarDevelopment) on
version control for grammar development.

# Upcoming Work

not applicable.

# References

not applicable.

Last update: 2018-02-01 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_GeneralInfo/_edit)]{% endraw %}