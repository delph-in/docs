{% raw %}# Documentation for the Grammar Matrix Customization Other Features Library

# Introduction

This document explains how to fill out the [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
page and presents background information on the Other Features library
of the Grammar Matrix Customization System (Bender et al., 2002; Bender
and Flickinger, 2005; Bender et al., 2010). For more information about
[Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
page please refer to Section 5.4.2 in [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf)
and Section 5.4 in [Poulson
2011](http://depts.washington.edu/uwwpl/vol28/poulson_2011.pdf).

General instructions on using the questionnaire can be found
[here](/MatrixDocTop#General_instructions_on_how_to_use_the_questionnaire).

# Citing the Other Features Library

The standard references for the Other Features library and its
implementations are [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf)
and [Poulson
2011](http://depts.washington.edu/uwwpl/vol28/poulson_2011.pdf). The
full references and .bib entries can be found
[here](/MatrixDoc/OtherFeatures#References).

# Options

The [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
page of the Grammar Matrix Customization questionnaire allows you to add
the features beyond the ones that you have already defined in the rest
of the questionnaire. For every feature you add, you will define a type
hierarchy, which consists of a root type (e.g. pernum, gendnum, etc.)
and a series of other value types. You can place these features either
on syntactic HEAD or on semantic INDEX.

After defining the feature name for the root type, you will be asked to
describe this feature in more detail based on the following questions:

- **Is this feature:**
  
  - a syntactic feature (which will go under head)?
  - a semantic feature (which will go under index)?
  
  **Is this feature for:**
  
  - nominal categories?
  - verbal categories?
  - both categories?
  
  **Values in the feature hierarchy:**
  
  - use an existing value type
  - define a new value type

After defining whether this feature is syntactic or semantic, as well as
whether it applies to nominals, verbs, or both categories, you will be
asked to define the values in the feature hierarchy. You can either use
an existing value type (previously defined in the questionnaire and
available in the drop-down menu) and/or define new value types. If you
need to add a new value type that was not previously defined in the
questionnaire, you will need to add the name of the value and its
supertype. Its supertype can be the root type that you defined above or
any other value type that you decide to add.

Some of the examples of features that can be added on this page include
merged features, additional syntactic/semantic features, additional
tense and aspect features, discussed in more detail in the
[Motivation](/MatrixDoc/OtherFeatures#Motivation) section below.

# Motivation

The [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
page was developed to provide users with enough flexibility to cover the
additional grammar phenomena, otherwise not covered in the
questionnaire. The examples covered below are just a few examples of why
[Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
can be very useful to a linguist user:

- **Merged features**
  
  The [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
page is a good place to add merged features if such exist in your
grammar. For example, a \[PERNUM\] or a \[GENDNUM\] feature could be
added here, if your grammar uses the
[\[PERNUM\]](/MatrixDoc/Person#Motivation) feature instead of
separate \[PERSON\] and \[NUMBER\] features, or if your grammar uses
a \[GENDNUM\] feature instead of separate \[GENDER\] and \[NUMBER\]
features. For more information about adding \[PERNUM\] feature to
[Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
page please refer to Section 5.4.2 in [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf)
.  
  
  **Additional syntactic/semantic features**
  
  Another example of features that could be defined on this page is an
addition of syntactic/semantic features to a type that has already
been defined in the questionnaire, but needs an additional feature.
A syntactic feature for number can be added on the [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
page, to supplement already existing semantic feature for number, in
order to model the agreement in French, for instance. The need for
adding syntactic feature to an already existing semantic feature for
number is presented in Kathol's example (1) below, in which two
kinds of agreement are observed (described in greater detail in
Section 5.2 in [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf)):  
  
  - Vous êtes belle\
you are.pl beautiful.sg.fem\
‘You are beautiful.’ \|fra\| (Kathol 1999:239)  
  
  Here a personal formal second person pronoun "vous" refers to a
single person (semantically), but takes a plural form
(syntactically). Therefore, there are two kinds of agreement in this
sentence:  
  
  - (1). "Syntactic" agreement (agreement in form): *vous.Plural* +
*êtes.Plural*\
(2). "Semantic" agreement (agreement in meaning):
*vous.Singular* + *belle.Singular*  
  
  If the user defines the number values only on the
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number)
page in the questionnaire, the number feature by default is assigned
to semantic INDEX, following Pollard and Sag (1994). However, the
[Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
page allows the user to add number features under syntactic HEAD as
well, thus covering more complex phenomena, such as above, i.e. the
agreement in form between French pronoun *vous* and verb *êtes*.  
  
  **Additional tense and aspect features**
  
  Another example of features that can be added to your grammar on the
[Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
page are tense and aspect features that were not definable on the
[Tense, Aspect, and Mood](/MatrixDoc/TenseAspectMood#Options) page.
Here you can define these features on syntactic HEAD (or semantic
INDEX), with a corresponding hierarchy of value types. For more
information please refer to Section 5.4 in [Poulson
2011](http://depts.washington.edu/uwwpl/vol28/poulson_2011.pdf).

These are just a few examples of the additional features that can be
added on the [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
page. The number of the features and their values that you can add to
your grammar on [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
page is unlimited.

# Analyses

Based on the answers you provide on the [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
customization page page, your starter grammar will either place your new
feature(s) under syntactic HEAD or semantic INDEX.

The values you define on this page will determine the values available
on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
and
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
pages.

The choices you make on the [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
customization page, will also affect the lexical types
(your\_language\_name.tdl file), lexical rules (lrules.tdl file), and
inflectional rules (irules.tdl file).

# Upcoming Work

Overall, the main direction of the future work in the Other Features
implementation in the Matrix Customization system is to extend the
overall coverage across languages, expanding the range of feature paths
and allowing the user to define more types of features. For more
information on further work in Matrix customization system please refer
to section 5.7 in [Poulson
2011](http://depts.washington.edu/uwwpl/vol28/poulson_2011.pdf).

# References

Drellishak, Scott. 2009. [Widespread but Not Universal: Improving the
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

Kathol, A. (1999). Agreement and the Syntax-morphology Interface in
HPSG. In R. Levine and G. Green (Eds.), Readings in HPSG, pages 223–274,
Cambridge: Cambridge University Press.

- bibtex:
  
  @incollection{Kathol:1999,\
author = {Andreas Kathol},\
year = {1999},\
title = {Agreement and the Syntax-morphology Interface in HPSG},\
editor = {R. Levine and G. Green},\
booktitle = {Readings in HPSG},\
pages = {223-274},\
publisher = {Cambridge: Cambridge University Press}\
}

Pollard, C., & Sag, I. A. (1994). Head-Driven Phrase Structure Grammar.
Stanford: CSLI.

- bibtex:
  
  @book{Pollard and Sag:1994,\
author = {Pollard, C., & Sag, I.},\
year = {1994},\
title = {Head-Driven Phrase Structure Grammar},\
publisher = {Stanford: CSLI}\
}

Poulson, L. (2011). [Meta-modeling of Tense and Aspect in a
Cross-linguistic Grammar Engineering
Platform](http://depts.washington.edu/uwwpl/vol28/poulson_2011.pdf). UW
Working Papers in Linguistics, *28*.

- bibtex:
  
  @article{Poulson:11,\
author = {Laurie Poulson},\
year = {2011},\
title = {Meta-modeling of Tense and Aspect in a Cross-linguistic
Grammar Engineering Platform},\
volume = {28}\
}

Last update: 2013-02-24 by VaryaGracheva [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_OtherFeatures/_edit)]{% endraw %}