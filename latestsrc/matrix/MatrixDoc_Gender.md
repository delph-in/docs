{% raw %}# Documentation for the Grammar Matrix Customization Gender Library

# Introduction

This document explains how to fill out the
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender)
page of the Grammar Matrix Customization questionnaire and presents
background information on the gender library of the Grammar Matrix
Customization System (Bender et al., 2002; Bender and Flickinger, 2005;
Bender et al., 2010). General instructions on using the questionnaire
can be found
[here](/MatrixDocTop#General_instructions_on_how_to_use_the_questionnaire).

# Citing the Gender Library

The standard reference for the Gender Library and its implementations is
[Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf).
The full reference and .bib entry can be found
[here](/MatrixDoc/Gender#References).

# Options

On the
[gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender)
page in Matrix Customization you are asked to describe the gender
marking in your language (i.e. feminine, masculine, neuter). This can be
defined as a hierarchy. The gender library allows you to specify the
range of values for the feature GENDER that will be available elsewhere
in the customization system and in the resulting grammar (see more on
that in the [Analyses](/MatrixDoc/Gender#Analyses) section below). The
complexity of gender hierarchy depends on the language. The number of
genders and their supertypes that you can enter in the questionnaire is
unlimited. Such flexibility of Matrix customization mechanism allows
users to cover languages with extensive gender hierarchies.

**Note** that feature values defined on the
[lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
and
[morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
pages may affect the hierarchy of gender. Underspecifications in the
lexicon or morphosyntax will automatically be integrated in the
hierarchy of *gender*: you do not need to define these explicitly on the
gender page.

Using dropdown menu, please add genders and their supertypes as
applicable to your language. Please note that like
[person](https://delph-in.github.io/docs/matrix/MatrixDoc_Person), the Grammar Matrix currently only deals with
gender insofar as it is expressed grammatically, i.e. through some form
of agreement. If your language does not express gender through agreement
(for example, English or Mandarin Chinese), please leave this section
blank and move on to the [next
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case)
of the questionnaire. If your language expresses gender through
agreement, please add genders and their supertypes as applicable. Below
are examples of options chosen for two languages with different gender
hierarchies:

(1). Russian has 3 genders, with a 'one-level' gender hierarchy. They
are *feminine*, *masculine*, and *neuter*, all of which have "gender" as
their supertype:

- |            |               |
|------------|---------------|
| **Gender** | **Supertype** |
| Feminine   | gender        |
| Masculine  | gender        |
| Neuter     | gender        |

(2). Tamil has 4 genders with a 'two-level' gender hierarchy, in which
*rational* gender is further subdivided into *feminine* and *masculine*
genders and is therefore recorded as their supertype:

- |            |               |
|------------|---------------|
| **Gender** | **Supertype** |
| Rational   | gender        |
| Feminine   | Rational      |
| Masculine  | Rational      |
| Neuter     | gender        |

For more information on how to use the questionnaire to define gender
values for your language, please refer to the
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender)
page in Matrix Customization.

For more information on the implementation of gender in Grammar Matrix
please refer to the next section [Analyses](/MatrixDoc/Gender#Analyses).

# Analyses

If you define a gender hierarchy, your starter grammar will include a
feature \[GEND gender\] for GENDER, with values based on the choices you
made on the
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender)
customization page. Note that similar to NUMBER and PERSON, GENDER is a
feature of the nominal INDEX. Making GENDER a feature of semantic INDEX
instead of syntactic HEAD allows for correct semantic representation of
gender in your grammar and helps avoiding spurious ambiguity during
generation.

The choices you make in the questionnaire are recorded in the choices
file, which is a Unicode text file. Below is an example of a gender
section in the choices file of a language with feminine, masculine, and
neuter genders:

    section=gender
      gender1_name=masc
        gender1_supertype1_name=gender
      gender2_name=fem
        gender2_supertype1_name=gender
      gender3_name=neut
        gender3_supertype1_name=gender

This will be reflected in the your\_language\_name.tdl file:

    png :+ [ PER person,
        NUM number, 
        GEND gender].
    
    ;;; Gender
    
     gender := *top*.
     masc := gender.
     fem := gender.
     neut := gender.

The values you assign to the GENDER feature will be available to use
later in the customization system, especially the
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
and
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
pages. Gender will appear as one of the features of the lexical rule
types on
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
page and as one of the features of the lexical types on
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page.

The choices you make on the
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender)
customization page will also affect the lexical types
(your\_language\_name.tdl file), lexical rules (lrules.tdl file), and
inflectional rules (irules.tdl file).

GENDER is a feature often involved in agreement phenomena. These are
handled through the lexicon and morphology libraries. The analyses of
agreement implemented in the Grammar Matrix are described in [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 5.2.

For more information regarding the analyses implemented in the gender
library please refer to [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 5.3.

**Note** that feature values defined on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
and
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
pages may affect the hierarchy of gender. Underspecifications in the
lexicon or morphosyntax will automatically be integrated in the
hierarchy of *gender*: you do not need to define these explicitly on the
gender page.

# Upcoming Work

- <span class="small">\[ This documentation is under construction.
When it is more complete, this section should describe any
modifications to or enhancements of this library that are either in
progress or planned. \]</span>

# References

Bender, E., & Flickinger, D. (2005). [Rapid prototyping of scalable
grammars: Towards modularity in extensions to a language-independent
core](http://faculty.washington.edu/ebender/papers/modules05.pdf). In
Proceedings of the 2nd International Joint Conference on Natural
Language Processing IJCNLP-05 (Posters/Demos), Jeju Island, Korea.

- bibtex:
  
  @article{Bender & Flickinger:05,\
author = {Bender, E., & Flickinger, D.},\
year = {2005},\
title = {Rapid prototyping of scalable grammars: Towards modularity
in extensions to a language-independent core},\
conference = {In Proceedings of the 2nd International Joint
Conference on Natural Language Processing IJCNLP-05
(Posters/Demos)},\
location = {Jeju Island, Korea} }

Drellishak, S. (2009). [Widespread but Not Universal: Improving the
Typological Coverage of the Grammar
Matrix](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf).
PhD thesis, University of Washington.

- bibtex:
  
  @phdthesis{Drellishak:09,\
author = {Scott Drellishak},\
year = {2009},\
title = {Widespread but Not Universal: Improving the Typological
Coverage of the {G}rammar {M}atrix},\
school = {University of Washington}\
}

Last update: 2013-03-01 by VaryaGracheva [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_Gender/_edit)]{% endraw %}