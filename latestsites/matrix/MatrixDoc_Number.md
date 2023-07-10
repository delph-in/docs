{% raw %}# Documentation for the Grammar Matrix Customization Number Library

# Introduction

This document explains how to fill out the
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number)
page of the Grammar Matrix Customization questionnaire and presents
background information on the number library of the Grammar Matrix
Customization System (Bender et al., 2002; Bender and Flickinger, 2005;
Bender et al., 2010). General instructions on using the questionnaire
can be found
[here](https://delph-in.github.io/docs/matrix/MatrixDocTop#general-instructions-on-how-to-use-the-questionnaire).

# Citing the Number Library

The standard reference for the Number Library and its implementations is
[Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf).
The full reference and .bib entry can be found
[here](https://delph-in.github.io/docs/matrix/MatrixDoc_Number#references).

# Options

On the
[Number](http://matrix.ling.washington.edu/customize/matrix.cgi?subpage=number)
page in Matrix Customization you are asked to describe number marking in
your language (e.g. singular, dual, plural). This can be defined as a
hierarchy. The number library allows you to specify the range of values
for the feature NUMBER that will be available elsewhere in the
customization system and in the resulting grammar (see more on that in
the [Analyses](https://delph-in.github.io/docs/matrix/MatrixDoc_Number#analyses) section below). The
complexity of number hierarchy is different for all languages. The
number of values that you can enter for number names and their
supertypes in questionnaire is unlimited.

Please note that this part of the questionnaire is for entering number
values, and NOT numerals, such as *one*, *two*, *three*, etc.. Even
though there can be an interaction between grammatical number and
numerals, numerals are a very different phenomenon, which is not yet
supported by the Matrix Customization system.

The values you define for number marking will be available to use later
in the customization system, especially the Morphology and Lexicon
pages. The answers you provide on this page will determine the values
available on the Lexicon page for the NUM feature (or the PERNUM
feature, about which see the
[Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person)
section of the questionnaire for more details or
[Person](https://delph-in.github.io/docs/matrix/MatrixDoc_Person) documentation page). **Note** that feature
values defined on the lexicon and morphology pages may affect the
hierarchy of number. Underspecifications in the lexicon or morphosyntax
will automatically be integrated in the hierarchy of *number*: you do
not need to define these explicitly on the number page.

Using the dropdown menu, please add numbers and their supertypes as
applicable to your language. Unlike [gender](https://delph-in.github.io/docs/matrix/MatrixDoc_Gender), which
focuses first and foremost on agreement, it is important to represent a
number hierarchy for the grammar even if it is not involved in
agreement. This is necessary to assure a consistent semantic
representation of number, which needs to be reflected in your grammar.
An example of a language with lack of number agreement between nouns and
other parts of speech is Japanese. Despite this lack of agreement, both
singular and plural numbers should be distinguished in the grammar.
Otherwise the grammar cannot distinguish the semantics of sentences
containing nouns that differ in number.

Some of the common possibilities of the number values on this page are:
**singular** (represents one entity), **dual** (two entities), **trial**
(three entities), **quadral** (four entities), **paucal** (a few
entities), **plural** (multiple entities), **general** (unspecified
number of entities), with some further subdivisions for paucal and
plural numbers.

Below is an example of options chosen for Slovene, which has three
numbers and a facultative number system (see
[Analyses](https://delph-in.github.io/docs/matrix/MatrixDoc_Number#analyses) for more details):

- |            |               |
|------------|---------------|
| **Gender** | **Supertype** |
| Singular   | number        |
| Dual       | number        |
| Plural     | number        |

For more information on how to use the questionnaire to define values
for NUMBER in your language, please refer to the
[number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number)
page in Matrix Customization.

For more information on the implementation of number in Grammar Matrix
please refer to the section [Analyses](https://delph-in.github.io/docs/matrix/MatrixDoc_Number#analyses).

# Motivation

Instead of applying some form of a universal number hierarchy to all
starter grammars, the customization system requires users to define
number values in their language, thus solving the problem with
representing languages with complex number hierarchies, which cannot be
accounted for by a universal number hierarchy. Examples of such number
hierarchies that cannot be covered by a universal number hierarchy are
found in languages with facultative number systems, in which number is
present optionally.

American Sign Language is an example of a language with a number
hierarchy that cannot be covered by a universal approach. While American
Sign Language requires a hierarchy with plural and non-plural numbers
(with the latter subdivided into singular and dual numbers), an attempt
of a universal number hierarchy is likely to start with a singular vs.
non-singular division (where non-singular may be further subdivided in
dual and plural numbers, for instance). Because of the existence of
languages that require different basic subdivisions, a customized
Grammar Matrix approach is a better solution for representing number
hierarchies across languages. For more information on merging person and
number for your target language, please refer to [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 5.3.6.1.

# Analyses

If you define a number hierarchy, your starter grammar will include the
feature \[ NUM number \], with possible values based on the choices you
make on the
[number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number)
customization page. Note that like GENDER and PERSON, NUM is a feature
of the nominal INDEX. Making NUM a feature of the semantic INDEX instead
of the syntactic HEAD results in semantic representations of number in
your grammar and avoids spurious ambiguity during generation.

Below is an example of a gender section in the choices file of a
language with singular, plural, and dual numbers:

    section=number
      number1_name=singular
        number1_supertype1_name=number
      number2_name=dual
        number2_supertype1_name=number
      number3_name=plural
        number3_supertype1_name=number

This will be reflected in the your\_language\_name.tdl file (given no
additional information comes from the lexicon and morphology libraries):

    png :+ [ PER person,
        NUM number,
        GEND gender,
        ANIMATION animation ].
    
    
    ;;; Number
    
    number := *top*.
    singular := number.
    dual := number.
    plural := number.

The choices you make on the number customization page, will also affect
the lexical types (your\_language\_name.tdl file), lexical rules
(lrules.tdl file), and inflectional rules (irules.tdl file).

The analyses implemented in the number library are described in detail
in [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 5.3.

NUM is a feature often involved in agreement phenomena. These are
handled through the lexicon and morphology libraries. The analyses of
agreement implemented in the Grammar Matrix are described in detail in
[Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 5.2.

**Note** that feature values defined on the lexicon and morphology
libraries may affect the hierarchy for number. Underspecifications in
the lexicon or morphosyntax will automatically be integrated in the
hierarchy of *number*: you do not need to define these explicitly on the
number page. In the example above, for instance, if a lexical item or
morpheme were to be defined that can be dual or plural (having both
values assigned to the same entry on the morphology or lexical page),
the hierarchy will look like this:

    ;;; Number
    
    number := *top*.
    singular := number.
    non-singular := number.
    dual := non-singular.
    plural := non-singular.

# Upcoming Work

- <span class="small">\[ This documentation is under construction.
When it is more complete, this section should describe any
modifications to or enhancements of this library that are either in
progress or planned. \]</span>

# References

Drellishak, S. (2009). [Widespread but Not Universal: Improving the
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

Last update: 2021-06-04 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_Number/_edit)]{% endraw %}