{% raw %}# Documentation for the Grammar Matrix Customization Person Library

# Introduction

This document explains how to fill out the
[Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person)
page of the Grammar Matrix Customization questionnaire and presents
background information on the person library of the Grammar Matrix
Customization System (Bender et al., 2002; Bender and Flickinger, 2005;
Bender et al., 2010). General instructions on using the questionnaire
can be found
[here](/MatrixDocTop#General_instructions_on_how_to_use_the_questionnaire).

# Citing the Person Library

The standard reference for the Person Library and its implementations is
[Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf).
The full reference and .bib entry can be found
[here](/MatrixDoc/Person#References).

# Options

The
[Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person)
page in Matrix Customization questionnaire is divided into two sections,
allowing you to define person values in the first section and to
describe the interaction of person with number in the second section.

**Note** that feature values defined on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
and
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
pages may affect the hierarchy of person. Underspecifications in the
lexicon or morphosyntax will automatically be integrated in the
hierarchy of *person*: you do not need to define these explicitly on the
[Person](https://delph-in.github.io/docs/matrix/MatrixDoc_Person) page.

In the first section you are asked to define person values existing in
your language. The possible person values are: ***first*** (referring to
the speaker), ***second*** (the person spoken to), ***third***
(everybody else), and ***fourth*** person (its definition varies from
language to language). Grammar Matrix Customization system requires you
to choose from the following options:

- None
- First, second, and third
- First, second, third, and fourth
- First and non-first
- Second and non-second
- Third and non-third

Please choose the option that best describes the person system in your
language. The person library allows you to specify the range of values
for the feature \[PERSON\] (or \[PERNUM\]) that will be available
elsewhere in the customization system and in the resulting grammar (see
more on that in the [Analyses](/MatrixDoc/Person#Analyses) section
below).

Please note that like [gender](https://delph-in.github.io/docs/matrix/MatrixDoc_Gender), in terms of filling
out the Grammar Matrix questionnaire, we are dealing with person only
insofar as it is expressed grammatically, i.e. through some form of
agreement. If your language does not express person through agreement,
please choose the option "None".

The next section of the Matrix Customization questionnaire deals with
the absence/presence of the subtypes of the first person in your
language. Depending on your answers in this section, your grammar will
use either a feature for PERSON or PERNUM for PERSON and NUMBER (more
details in section [Analyses](/MatrixDoc/Person#Analyses) below). You
are provided with the following options in this section:

- none
- inclusive and exclusive
- other

If your language does not distinguish subtypes for the first person,
please select "none" in this section and move to the
[next](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender)
page of the questionnaire. If your language has different forms for the
first person, please select options "inclusive and exclusive" or
"other." If you choose one of these options, you will also need to enter
the subtypes of the first person on the bottom of the page. If you
choose "inclusive and exclusive" option, a dropdown menu will appear to
the right of this option with the number values you have defined on the
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number)
page of the questionnaire.

When defining inclusive/exclusive or "other" distinctions of first
person, the grammar will contain an attribute \[PERNUM\], rather than
two separate features for person and number. All defined person and
number values are cross-classified under this feature (e.g. \[PERNUM
3sg\] rather than \[PERSON 3, NUMBER sg\]).

English is an example of a language with two distinct forms for the
first person of the verb ***to be***, i.e. 1sg ***"am"*** and 1pl
***"are"*** and therefore requires creation of subtypes for first
person. Even though English typically makes this distinction for 3sg
versus all other forms, it can be advantageous to create this
distinction for first person (see explanation above).

For more information on how to use the questionnaire to define
\[PERSON\] values in your language, please refer to the
[Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person)
page in Matrix Customization.

For more analysis and implementation of the person hierarchy in your
language please refer to the [Analyses](/MatrixDoc/Person#Analyses)
section below.

# Motivation

Depending on the presence (absence) of the subtypes in the first person
in your language, Grammar Matrix will use either two separate features
\[PERSON\] and \[NUMBER\] or a single \[PERNUM\] feature. This approach
allows Grammar Matrix customization system to account accordingly both
for the languages with the distinct form for each combination of person
and number and for the languages with merged person and number values.

For example, \[PERNUM\] provides a more suitable manner to capture
person and number agreement in English as suggested by [Flickinger
2000](/MatrixDoc/Person#References). In particular, it can model the
standard distinction between 3rd-sg and non-3rdsg in a straight-forward
manner. With two distinct features, you would need two forms for each
standard English finite verb in present tense non-3rd-sg: one for 1st,
2nd and 3rd person plural and one for 1st and 2nd singular. The combined
feature allows you to group person-number values according to necessity:
furthermore distinguishing 1sg for the verb *to be* and 2nd person,
underspecified number for *you*.

For more information on using customized number hierarchy for your
target language, please refer to [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 5.3.4.

# Analyses

Depending on the choices you make on the
[Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person)
page in Matrix Customization, your starter grammar will either include
the feature \[ PER person \] or \[ PERNUM pernum \]. If your language
has a distinct form for each person and number combination and does not
have subtypes for first person (i.e. if you chose option "none" in the
[second
section](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person)
of the person questionnaire page), then your grammar will use a separate
feature \[PER person\] for PERSON. If your language is
inclusive/exclusive or minimal/augmented and has subtypes for first
person, then your grammar will use the feature \[PERNUM\] instead, in
order to account for the merged person and number hierarchy.

Note that like GENDER and NUMBER, PERSON is a feature of the nominal
INDEX. Making PERSON a feature of semantic INDEX instead of syntactic
HEAD allows for correct semantic representation of person in your
grammar and avoiding spurious ambiguity during generation.

If your grammar uses feature PERNUM, you will be able to define its
values later in the questionnaire on the [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
page.

The values you assign to PERSON feature will be available to use later
in the customization system, especially the
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
and
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
pages. The answers you provide on this page will determine the values
available on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page for the PERSON feature. PERSON will also appear as one of the
features of the lexical rule types on
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
page.

The choices you make on the
[Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person)
customization page, will also affect the lexical types
(your\_language\_name.tdl file), lexical rules (lrules.tdl file), and
inflectional rules (irules.tdl file).

The analyses implemented in the person library are described in
[Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 5.3.

PERSON is a feature often involved in agreement phenomena. These are
handled through the lexicon and morphology libraries. The analyses of
agreement implemented in the Grammar Matrix are described in [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 5.2.

**Note** that feature values defined on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
and
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
pages may affect the hierarchy of person. Underspecifications in the
lexicon or morphosyntax will automatically be integrated in the
hierarchy of *person*: you do not need to define these explicitly on the
[Person](https://delph-in.github.io/docs/matrix/MatrixDoc_Person) page.

# Trivia

English does not distinguish inclusive 1st person from exclusive. The
following quote from a speech made by the Mayor of Frankfurt am Main (in
English) in an attempt to get people to trust politicians and bankers
again shows why this distinction can be useful (Die Zeit, 6. Dezember
2012, p.25):

*&gt;&gt;There is no us and them, or better: us and you. There is only
us.&lt;&lt;*

# Upcoming Work

- <span class="small">\[ This documentation is under construction.
When it is more complete, this section should describe any
modifications to or enhancements of this library that are either in
progress or planned. \]</span>

# References

Drellishak, Scott. 2009. [Widespread but Not Universal: Improving the
Typological Coverage of the Grammar
Matrix](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf).
PhD thesis, University of Washington.

bibtex:

@phdthesis{Drellishak:09,\
author = {Scott Drellishak},\
year = {2009},\
title = {Widespread but Not Universal: Improving the Typological
Coverage of the {G}rammar {M}atrix},\
school = {University of Washington}\
}

Flickinger, Dan. 2000. On Building a More Eﬃcient Grammar by Exploiting
Types. Natural Language Engineering, *6*(1), 15–28.

bibtex:

@article{Flickinger:00,\
author = {Dan Flickinger},\
year = {2000},\
title = {On Building a More Eﬃcient Grammar by Exploiting Types. Natural
Language Engineering},\
journal = {Natural Language Engineering},\
volume = {6},\
pages = {15-28},\
}

Last update: 2013-01-14 by AntskeFokkens [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_Person/_edit)]{% endraw %}