{% raw %}# Documentation for the Grammar Matrix Customization Argument Optionality Library

# Introduction

This document explains how to fill out the [Argument
Optionality](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=arg-opt)
page of the Grammar Matrix Customization questionnaire and presents
background information on the argument optionality library of the
Grammar Matrix Customization System (Bender et al., 2002; Bender and
Flickinger, 2005; Bender et al., 2010). General instructions on using
the questionnaire can be found
[here](/MatrixDocTop#General_instructions_on_how_to_use_the_questionnaire).

# Citing the Argument Optionality Library

The standard references for the Argument Optionality library and its
implementations are [Saleem
2010](http://www.delph-in.net/matrix/saleem-thesis.pdf) and [Saleem and
Bender 2010](http://aclweb.org/anthology-new/C/C10/C10-2123.pdf). The
full references and .bib entries can be found
[here](/MatrixDoc/ArgumentOptionality#References).

# Options

The [Argument
Optionality](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=arg-opt)
page allows you to describe argument realization in your language. More
specifically, it enables you to indicate whether an argument, i.e.
subject or object, can be dropped in your language. This page is divided
into two sections: (1). **Subject dropping** and (2). **Object
dropping**.  

1\. **Subject dropping**

In this section you can indicate whether a subject can be dropped in
your language, describe the conditions/contexts in which subject
dropping occurs, and model the agreement between subject (overt or
dropped) and the verb.

First, using the options provided on the [Argument
Optionality](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=arg-opt)
questionnaire page, please indicate whether the subject dropping can
occur with any verb or only with certain verbs. For example, in Tamil
subjects and objects can be dropped with all verbs, except for
weather-related verbs, which require overt subjects (Asher, 1985). In
other languages subject dropping can occur only with certain verbs, in
which case you would choose the second option from the options provided
below:

- **Subject dropping can occur**  
  
  - with any verb  
  - only with certain verbs  

Please note that when you are filling out the **Verb Types** section on
the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page later, for each verb type that does not allow subject dropping, you
will need to select the feature OPT with the value "minus" and specified
on the subject NP. For example, for Tamil language that allows subject
dropping with any verb except only a very narrow group of verbs, you
would choose the first option for subject dropping on the [Argument
Optionality](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=arg-opt)
page, i.e. "with any verb," and later use the menu on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page in order to add the OPT+ value to all verbs that allow the subject
dropping and OPT- value to weather verbs.

Second, using the options provided to you on the [Argument
Optionality](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=arg-opt)
questionnaire page, you can model the agreement between the
dropped/overt subject and the verb. Depending on the language you are
modeling, verbs may or may not be marked for person, number, or gender
when their arguments are dropped or overt:

- **When a subject is dropped, a subject marker on the verb is**  
  
  - required  
  - optional  
  - not permitted  
- **When a subject is overt (not dropped), a subject marker on the
verb is**  
  
  - required  
  - optional  
  - not permitted  

Please note that when you are filling out the **Verb Types** section on
the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page later, you will need to add the following features and their values
for the verbs, depending on whether the morphemes (subject markers) are
required, optional, or not permitted when an overt subject is present or
absent. You will need to select **overt-arg permitted** for the
morphemes that are (1). optional when a subject is dropped and required
when an overt subject is present or (2). required when a subject is
dropped and optional when an overt subject is present. You will need to
select **overt-arg not permitted** for the morphemes that are optional
or required when a subject is dropped and are not permitted when an
overt subject is present. And, finally, you will need to select
**drp-arg not permitted** option for the morphemes that are not
permitted when a subject is dropped and required when an overt subject
is present. These four options above are described in more detail on the
[Argument
Optionality](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=arg-opt)
page.

Lastly, you will need to specify the contexts, in which subject dropping
occurs. Depending on the language, subjects can be dropped in all
contexts or just some contexts. Finnish and Hebrew are examples of
languages that allow subject dropping in certain contexts. In Finnish a
subject can be dropped only for certain persons. In Hebrew subject
dropping can occur only with expletives, some non-matrix clauses,
generic references for third person subjects, and with the past and
future tense for the first and second person subjects. Below are the
options provided to you on the [Argument
Optionality](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=arg-opt)
page:

- **Subject dropping occurs in**  
  
  - all contexts  
  - some contexts  

If you indicate that in your language subject dropping occurs only in
some contexts, you will need to add context(s) in which subject dropping
occurs by selecting features and their values as applicable to your
language in the drop-down menu that appears when you add a context in
the menu below:

- **Contexts**  
  
  - Add a context  

1\. **Object dropping**

In this section you can indicate whether an object can be dropped in
your language, whether object dropping can occur with all verbs or just
certain verbs, and model the agreement between object (overt or dropped)
and the verb.

First, using the options provided on the [Argument
Optionality](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=arg-opt)
questionnaire page (repeated below), please indicate whether the object
can be dropped with any verb or only with certain verbs:

- **Object dropping is**  
  
  - always allowed  
  - lexically licensed  

If your language allows object dropping for all verbs, e.g. Tamil or
Arabic, then select the first option "always allowed." If your language
allows object dropping only for certain verbs, then select the second
option "lexically licensed." English is an example of a language that
usually requires overt objects, but allows object dropping for certain
verbs, such as *eat* (Example 1: *He is eating fish*, Example 2: *He is
eating*).

Please note that when you are filling out the **Verb Types** section on
the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page later, for all verbs that do not allow object dropping, you will
need to select the feature OPT with value "minus" and specify it as
marked on the object. And, vice versa, for all verbs that allow object
dropping, you will need to select the feature OPT with value "plus" and
specify it as marked on the object.

Second, using the options provided to you on the [Argument
Optionality](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=arg-opt)
page in Matrix Questionnaire, you can model the agreement between the
object (overt or dropped) and the verb. Depending on the language you
are modeling, verbs may or may not be marked for person, number, or
gender. Similar to subjects, when you are filling out the **Verb Types**
section on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page later, you will need to add appropriate features and their values
for the verbs, depending on whether the morphemes (object markers) are
required, optional, or not permitted in the presence or absence of an
overt object. You will be provided with four options, described in
detail on the [Argument
Optionality](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=arg-opt)
page.

For more information on analyses and implementation of the argument
optionality please refer to
[Analyses](/MatrixDoc/ArgumentOptionality#Analyses) section below.

# Analyses

When you define argument optionality in your language, your starter
grammar will include an actual Matrix feature OPT, as well as two
features OVERT-ARG and DRP-ARG, the main purpose of which is just to
prompt creation of certain lexical and/or phrase rules . All three
features will be available to you for later use in the Grammar
customization system.

The feature OPT is used to specify which verb types allow dropped
arguments and which verbs do not. Its values can be either
underspecified as type bool, or constrained to + or -, based on the
choices you make on the [Argument
Optionality](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=arg-opt)
and
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
pages. Verb types allowing dropped arguments should be specified as
\[OPT +\], while verb types that do not allow dropped arguments, should
be specified as \[OPT -\].

Feature OVERT-ARG will appear on
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page if you have indicated that your language has markers that are
required for dropped arguments and that are optional/not permitted for
overt arguments.

Feature DRP-ARG will appear on
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page if you have indicated that your language has markers that are
required for overt arguments and that are optional/not permitted for
dropped arguments.

Below is a snippet of code related to Argument Optionality in choices
file for a language with lexically-based subject dropping:

    section=arg-opt
    subj-drop=subj-drop-lex
    subj-mark-drop=subj-mark-drop-not
    subj-mark-no-drop=subj-mark-no-drop-not
    subj-con=subj-con-always

Below is a snippet of code related to Argument Optionality in choices
file for a language with context dependent subject dropping:

    subj-con=subj-con-some
    context1 feat1 name=tense
    context1 feat1 value=past
    context1 feat1 head=verb
    context1 feat2 name=person
    context1 feat2 value=3rd
    context1 feat2 head=subj

In order to model argument optionality a unary phrase structure rule was
used to shorten the valence list(s) of the mother. More specifically,
for the languages allowing object dropping, in addition to a
**head-comps-phrase** rule, a unary **head-opt-comps-phrase** rule was
added. This rule empties the COMPS list without a complement being
present. A similar analysis was adopted for languages allowing subject
dropping.

Currently the Argument Optionality library allows user to cover various
combinations of lexical, context, and affix co-occurrence restrictions
involved in argument realization for different languages. For more
information about the analyses implemented in the Argument Optionality
library please refer to Chapter 4 in [Saleem
2010](http://www.delph-in.net/matrix/saleem-thesis.pdf) and [Saleem and
Bender 2010](http://aclweb.org/anthology-new/C/C10/C10-2123.pdf).

# Upcoming Work

One possible improvement to Argument Optionality section in Grammar
Matrix Customization system is providing coverage of languages, in which
pronominal subjects are expressed by clitics with variable hosts or by
subject pronouns occupying a different syntactic position than full noun
phrase subjects do. Another possible improvement of Argument Optionality
section of Grammar Matrix Customization is the coverage of semantic
factors influencing the argument optionality strategies employed by
different languages. All of these improvements would benefit the word
order section of Grammar Matrix customization system as well, as they
would require applying changes/extensions to the word order library.

# References

Asher, R.E. 1985. Tamil. Croom Helm, London.

- bibtex:
  
  @book{Asher:1985,\
author = {R. E. Asher},\
year = {1985},\
title = {Tamil},\
publisher = {London: Croom Helm}\
}

Saleem, Safiyyah. 2010. [Argument Optionality: A New Library for the
Grammar Matrix Customization
System](http://www.delph-in.net/matrix/saleem-thesis.pdf). Masters
thesis, University of Washington.

- bibtex:
  
  @mastersthesis{Saleem:10,\
author = {Safiyyah Saleem},\
year = {2010},\
title = {Argument Optionality: A New Library for the Grammar Matrix
Customization System},\
school = {University of Washington}\
}

Safiyyah Saleem and Emily M. Bender. 2010. [Argument Optionality in the
LinGO Grammar
Matrix](http://aclweb.org/anthology-new/C/C10/C10-2123.pdf). Coling
2010: Posters. pp.1068-1076.

- bibtex:
  
  @misc{Saleem and Bender,\
author = {Safiyyah Saleem and Emily Bender},\
year = {2010},\
title = {Argument Optionality in the LinGO Grammar Matrix},\
conference = {Coling}\
}

Last update: 2013-02-15 by VaryaGracheva [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_ArgumentOptionality/_edit)]{% endraw %}