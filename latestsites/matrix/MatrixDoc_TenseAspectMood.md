{% raw %}# Documentation for the Grammar Matrix Customization Tense, Aspect and Mood Library

# Introduction

This document explains how to fill out the [Tense, Aspect, and
Mood](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-aspect-mood)
page of the Grammar Matrix Customization questionnaire and presents
background information on the Tense, Aspect and Mood (TAM) library of
the Grammar Matrix Customization System (Bender et al., 2002; Bender and
Flickinger, 2005; Bender et al., 2010). General instructions on using
the questionnaire can be found
[here](/MatrixDocTop#General_instructions_on_how_to_use_the_questionnaire).

# Citing the Tense, Aspect, and Mood Library

The standard reference for the Tense, Aspect, and Mood Library and its
implementations is [Poulson
2011](http://depts.washington.edu/uwwpl/vol28/poulson_2011.pdf). The
full reference and .bib entry can be found
[here](/MatrixDoc/TenseAspectMood#References).

# Options

The [Tense, Aspect, and
Mood](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-aspect-mood)
page allows you to specify a range of values for each of these features
in your language either by choosing pre-existing values or creating your
own values. This page is divided into two sections: **(1). Semantic
Features** (semantic features of Tense/Aspect/Mood) and **(2). Syntactic
Feature** (verb forms if your grammar contains auxiliary verbs).

The Tense, Aspect, and Mood library allows you to specify the range of
values for the features \[TENSE tense\], \[ASPECT aspect\], \[SITUATION
situation\] , \[MOOD mood\], and \[FORM form\] that will be available
elsewhere in the customization system and in the resulting grammar (see
more on that in the [Analyses](/MatrixDoc/TenseAspectMood#Analyses)
section below). The values you define for TENSE, ASPECT, SITUATION,
MOOD, and FORM on this page will determine the values available on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
and
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
pages. **Note** that feature values defined on the lexicon and
morphology libraries may affect the hierarchy of Tense, Aspect, and
Mood. Underspecifications in the lexicon or morphosyntax will
automatically be integrated in the hierarchy of Tense, Aspect, and Mood:
you do not need to define these explicitly on the [Tense, Aspect, and
Mood](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-aspect-mood)
page.

## Semantic Features

This section describes **semantic** features of Tense, Aspect, and Mood.
For both TENSE and ASPECT features, user can select among common values
and/or define additional ones. MOOD values are purely user-defined.

1\. **Tense**

In this section please define TENSE values and their subtypes (if
applicable) for your language. You can either choose from TENSE values
pre-defined for you by the Matrix Customization system or you can create
your own TENSE values.

You are provided with the pre-defined TENSE values, which cover the most
common tense hierarchies across the languages. If these pre-defined
values provided below are sufficient to describe the tense system in
your language, please choose "Select among common hierarchy elements"
option and select from the values below as applicable to your language.
For each option you select, please add a subtype if applicable.

- 1). **present**
  
  2). **past**
  
  3). **future**
  
  4). **nonpast** (note: If present and/or future are also selected
they are assumed to be subtypes of nonpast.)
  
  5). **nonfuture** (note: If present and/or past are also selected
they are assumed to be subtypes of nonfuture.)

If the pre-defined tense values provided above are not sufficient to
describe the tense hierarchy in your language, you can build your own
tense hierarchy. If your language requires a deeper tense hierarchy,
please choose the option "Build your own TENSE hierarchy" on the bottom
of TENSE section and enter all tense types and their supertypes existing
in your language. If you choose to build your own tense hierarchy, the
number of values that you can enter for tense types and their subtypes
is unlimited.

**Motivation for build your own hierarchy**

This option is especially useful for the languages with deeper tense
hierarchies, such as Amerindian language Kiksht. Kiksht tense system is
divided into non-past and past, with the past tense being subdivided
into remote (further subdivided into early-remote and late-remote
tenses), far (further subdivided into early-far and late-far tenses),
middle, and near tenses (Comrie 1985). Clearly, languages like Kiksht
with deep tense hierarchies require a user to build a more elaborate
tense hierarchy than the one already provided by Matrix customization
system.

2\. **Aspect**

In this section please define ASPECT values existing in your language.
As with tense, you can either choose from the aspect values pre-defined
for you by the Matrix Customization system or you can create your own
aspect hierarchy. This section is divided into two parts: **Viewpoint
aspect** and **Situation aspect**.

- (1). **Viewpoint aspect**
  
  Viewpoint aspect (or 'grammatical aspect') describes the situation
from a particular viewpoint, dividing it into endpoints and stages
(Smith 1991, 1997). It is usually marked by verbal inflection or by
presence of auxiliary with complement. The most common viewpoint
aspect values are **perfective** (a view including two endpoints)
and **imperfective** (a view not including endpoints). If your
language only has these two aspect values, they are covered by the
pre-defined option provided by Matrix Customization system. In this
case please select the "Create a hierarchy consisting of just the
values **perfective** and **imperfective** as subtypes of aspect"
option.  
  
  If your language uses other and/or additional aspect subcategories
(for example, *post-inchoative*, *semi-perfective*, etc.), you can
build you own aspect hierarchy by adding aspect names and their
supertypes using provided drop-down menu under "Add an aspect type"
option.  
  
  If your language does not have a viewpoint aspect, please skip this
section entirely and move to the next section **Situation
aspect**.  
  
  (2). **Situation aspect**
  
  Situation aspect (also referred to as 'lexical aspect', 'inner
aspect', 'inherent aspect' or sometimes 'Aktionsart') describes the
type of situation, particularly in terms of its temporal properties.
The most common subcategories of situation aspect are: **States**,
**Activities**, **Achievements** and **Accomplishments** (Vendler
1957). Situation aspect can be expressed through the meaning of the
verb (its inherent lexical quality) or by presence of overt
morphological markers, both of which are implemented in Grammar
Matrix Customization system. However, the customization system
currently does not cover compositionally derived situation aspect,
i.e. marked by other elements (e.g. on qualities of verbal arguments
or sentential adjuncts).  
  
  Unlike the sections for tense and viewpoint aspect, there are no
pre-defined values for situation aspect in the questionnaire. So, if
situation aspect exists in your language, please build your own
situation aspect hierarchy by adding situation aspect values for the
feature \[SITUATION situation\], as well as their supertypes using
the drop-down menu in this section.  
  
  If situation aspect does not exist in your language, please skip
this section entirely and move to the next section **Mood**.  
  
  For more information about Grammar Matrix coverage of situation
aspect and its current limitations please refer to [Upcoming
Work](/MatrixDoc/TenseAspectMood#Upcoming_Work) section below.

3\. **Mood**

This section is designed to help you define the Mood and Modality system
in general as applicable to your language. Modality roughly describes
the opinions or attitudes of the speaker, with most common values being
**Subjunctive** and **Indicative**. If your language has only these two
subcategories of mood, please choose the pre-defined MOOD values
available in Matrix Customization system by checking the "Create a
hierarchy consisting of just the values **subjunctive** and
**indicative** as subtypes of mood" option.

Otherwise, you can either skip this section entirely or build your own
Mood hierarchy by adding mood types and their supertypes as applicable
to your language. **Please note that if you choose the option of
building your own Mood hierarchy, this will override the pre-defined
values binary Subjunctive/Indicative option above.**

4.**Additional features**

If you need to define additional features for Tense, Aspect, and Mood in
your language, such as for the arbitrary or quasi-semantic verb classes,
e.g. French verbs in terms of their auxiliary selection (for more
information about these verb classes please refer to Section 5.4 in
[Poulson
2011](http://depts.washington.edu/uwwpl/vol28/poulson_2011.pdf)), you
can define these features on the [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
questionnaire page.

## Syntactic Feature

The only syntactic feature this section deals with is the verb form,
distinguishing **finite verbs** from **nonfinite verbs**. The main
difference between these two verb forms is that finite verbs can head
stand-alone clauses, while nonfinite verb forms cannot.

If you have indicated on the [Word
Order](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=word-order)
questionnaire page that your language contains auxiliaries, your starter
grammar will have finite and nonfinite values of FORM by default.

If your language does not use auxiliary verbs, but makes a syntactic
distinction between finite and nonfinite verbs, please check the
corresponding option: "My language has no auxiliaries but does make a
syntactically relevant finite/non-finite distinction."

Often languages have subtypes of nonfinite verbs. For example, English
has Infinitive, Past Participle, and Present participle as subtypes of
nonfinite verbs. If applicable to your language, please add the subtypes
of finite and/or nonfinite verbs.

If your language does not make any syntactic distinction between finite
and nonfinite verbs, you can skip this section entirely and move to the
next page [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features).

If you need to define additional syntactic features, you can define
these features on the [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
questionnaire page.

For more information on how to use the questionnaire to define values
for Tense, Aspect, and Mood in your language, please refer to the
[Tense, Aspect, and
Mood](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-aspect-mood)
page in Matrix Customization.

For more information on the implementation of Tense, Aspect, and Mood
features in Grammar Matrix please refer to the Section
[Analyses](/MatrixDoc/TenseAspectMood#Analyses).

# Motivation

Unlike some well-understood grammatical phenomena that can be covered by
pre-defined analyses in Matrix libraries, Tense, Aspect, and Mood are
more complicated phenomena with varying terminology and
values/hierarchies that vary tremendously from language to language. A
library with pre-defined analyses is not sufficient for such a
complicated grammatical phenomenon. To allow user to have more
flexibility for coverage of Tense, Aspect and Mood, Matrix Customization
system uses a meta-modeling approach, enabling the user to define
tense/aspect/mood values themselves instead of relying on a library with
limited pre-defined analyses. For more information on the meta-modeling
approach and its use in Matrix Customization system please refer to
Section 4.1 of [Poulson
2011](http://depts.washington.edu/uwwpl/vol28/poulson_2011.pdf).

# Analyses

When you define tense, aspect, and mood hierarchies, your starter
grammar will include the features \[TENSE tense\], \[ASPECT aspect\],
\[SITUATION situation\], and \[MOOD mood\], with values based on the
choices you make on the [Tense, Aspect, and
Mood](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-aspect-mood)
customization page. TENSE, ASPECT, SITUATION, and MOOD are features of
semantic INDEX. On the other hand, FORM is a feature of syntactic HEAD
and can be used to constrain auxiliary complement forms. Below are
snippets of code related to Tense, Aspect, and Mood (TAM) in matrix.tdl
and in the your\_language\_name.tdl files (given no additional
information comes from the lexicon and morphology libraries).

Code from matrix.tdl file:

    tense := sort.
    aspect := sort.
    mood := sort.
    
    tam := avm &
      [ TENSE tense,
        ASPECT aspect,
        MOOD mood ]. 

Below is an example of what the relevant code would look like in
your\_language\_name.tdl file, if you were working on a language that
contains only *perfective* and *imperfective* viewpoint aspects, covered
by pre-defined option in Matrix Customization system:

    perfective := aspect.
    imperfective := aspect.

Below is an example of what the relevant code would look like in
your\_language\_name.tdl file, if you were working on a language that
has a deeper hierarchy system, with the *imperfective* aspect further
subdivided into *habitual* and *continuous* aspects, with *continuous*
aspect further subdivided into *nonprogressive* and *progressive*
aspects, in which case you would have to build your own viewpoint aspect
hierarchy:

    perfective := aspect.
    imperfective := aspect.
    habitual := imperfective.
    continuous := imperfective.
    nonprogresssive := continuous.
    progressive := continuous.

The choices you make on the [Tense, Aspect, and
Mood](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-aspect-mood)
customization page will also affect the lexical types
(your\_language\_name.tdl file), lexical rules (lrules.tdl file), and
inflectional rules (irules.tdl file).

**Note** that feature values defined on the lexicon and morphology
libraries may affect the hierarchies of Tense, Aspect, and Mood.
Underspecifications in the lexicon or morphosyntax will automatically be
integrated in the hierarchies of Tense, Aspect, and Mood: you do not
need to define these explicitly on the [Tense, Aspect, and
Mood](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-aspect-mood)
page.

# Upcoming Work

The main direction of the future work in the Tense, Aspect, and Mood
implementation in the Matrix Customization system is to extend the
overall meta-modeling coverage. Although quite flexible, the
meta-modeling approach currently cannot accommodate all analyses. In
particular, the process of defining lexical types and type hierarchies
needs more flexibility, both in terms of expanding the questionnaire and
coverage of grammatical phenomena.

For example, as noted in the situation aspect section of the
questionnaire, the coverage of situation aspect needs to be expanded. At
present, the coverage of situation aspect in the Matrix customization
system is limited only to the aspect expressed by inherent lexical
qualities or overt morphological marking. More work is required in order
to implement the compositionally derived situation aspect in the Matrix
Customization system, which is not covered yet. Another possible
enhancement of the situation aspect section is to provide a user with
the pre-defined hierarchy of situation aspect features (such as
*dynamic*, *durative*, and *telic*). These and other enhancements to the
Tense, Aspect, and Mood section will help provide more flexibility and
more coverage across languages.

For a more detailed discussion about future work on expanding the
coverage of the Matrix Customization system please refer to Section 5.7
in [Poulson
2011](http://depts.washington.edu/uwwpl/vol28/poulson_2011.pdf).

# References

Comrie, B. (1985). Tense. Cambridge \[Cambridgeshire\]; New York:
Cambridge University Press.

- bibtex:
  
  @book{Comrie:1985,\
author = {Bernard Comrie},\
year = {1985},\
title = {Tense},\
publisher = {Cambridge \[Cambridgeshire\]; New York: Cambridge
University Press}\
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

Smith, C. S. (1991). The parameter of aspect. Dordrecht; Boston: Kluwer
Academic Publishers, 1st ed.

- bibtex:
  
  @article{Smith:1991,\
author = {C. S. Smith},\
year = {1991},\
title = {The parameter of aspect},\
publisher = {Dordrecht; Boston: Kluwer Academic Publishers},\
edition = {first},\
}

Smith, C. S. (1997). The parameter of aspect. Dordrecht; Boston: Kluwer,
2nd ed.

- bibtex:
  
  @article{Smith:1997,\
author = {C. S. Smith},\
year = {1997},\
title = {The parameter of aspect},\
publisher = {Dordrecht; Boston: Kluwer},\
edition = {second},\
}

Vendler, Z. (1957). Verbs and times. The Philosophical Review, *66*(2),
143-160. (Reprinted in a revised version in Vendler, 1967).

- bibtex:
  
  @book{Vendler:1957,\
author = {Zeno Vendler},\
year = {1957},\
title = {Verbs and times},\
journal = {The Philosophical Review},\
volume = {66},\
issue = { 2 }\
}

Last update: 2013-02-23 by VaryaGracheva [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_TenseAspectMood/_edit)]{% endraw %}