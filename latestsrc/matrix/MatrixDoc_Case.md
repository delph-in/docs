{% raw %}# Documentation for the Grammar Matrix Customization Case Library

# Introduction

This document explains how to fill out the
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case)
page of the Grammar Matrix Customization questionnaire and presents
background information on the Case library of the Grammar Matrix
Customization System (Bender et al., 2002; Bender and Flickinger, 2005;
Bender et al., 2010). General instructions on using the questionnaire
can be found
[here](/MatrixDocTop#General_instructions_on_how_to_use_the_questionnaire).

# Citing the Case Library

The standard reference for the Case Library and its implementations is
[Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf).
The full reference and .bib entry can be found
[here](/MatrixDoc/Case#References).

# Options

The case library allows the user to specify the range of case values
used in the grammar (if any), and the general type of the language's
system for marking core cases. On the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page, each verb type can have an argument structure specified. The
options available there depend partly on the answers to the questions on
the
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case)
page, but there is always the option of defining a verb class that uses
a different case pattern than those provided on the basis of the
selection for core case marking.

The Grammar Matrix customization system provides you with nine
pre-defined case system options covering the most commonly used case
systems, as well as one option allowing you to define additional cases.
Following Dixon's terminology (Dixon 1994), cases are discussed in terms
of the roles of the arguments: **A** (agent of a transitive verb), **O**
(patient or object of a transitive verb), and **S** (subject of an
intransitive verb).  

- **None**\
Please select this option if your language does not use a case
system morphosyntactically. Instead of expressing it
morphosyntactically, such languages determine the roles of verbal
arguments by word order, intonation, or pragmatically.  
  
  **Nominative-accusative**  
  
  Please select this option if your language uses the
**nominative-accusative** (also referred to as **accusative**) case
system. In such case systems S and A are marked with the same case,
while O is marked with a different case. In the menu provided to you
in Grammar Matrix Customization system, please specify the name of
the case taken by S and A (e.g. nominative, subjective), and the
name of the case taken by O (e.g. accusative, objective). An example
of a language with nominative-accusative case system is German.  
  
  **Ergative-absolutive**  
  
  Please select this option if your language uses the
**ergative-absolutive** (also referred to as **ergative**) case
system. In such case systems S and O are marked with the same case,
while A is marked with a different case. In the menu provided to you
in Grammar Matrix Customization system, please specify the name of
the case taken by A (e.g. ergative, relative, or narrative), and the
name of the case taken by S and O (e.g. absolutive, nominative). An
example of a language with ergative-absolutive case system is
Australian language Dyirbal.  
  
  **Tripartite**  
  
  Please select this option if your language uses a **tripartite**
case system. In such case systems all three roles, i.e. S, O, A, are
marked with different cases. In the menu provided to you in Grammar
Matrix Customization system, please specify the name of the case
taken by S (e.g. nominative, subjective), the name of the case taken
by A (e.g. ergative, agentive), and the name of the case taken by O
(e.g. absolutive, patientive). An example of a language with
tripartite case system is Wangkumara.  

The next four options are the subtypes of the **split ergativity** case
systems, which are neither nominative-accusative, nor
ergative-absolutive. These case systems can be conditioned by the
following factors: (1). semantic nature of the main verb, (2). semantic
nature of the core NPs, (3). tense, aspect, or mood of the clause, and
(4). grammatical status of the clause (Dixon 1994:70). Please note that
the latter two (case conditioned on tense/aspect/mood and case
conditioned on grammatical status of the clause) receive a similar
analysis, described in more detail in [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 3.2.  

- **Split-S**  
  
  Please select this option if your language uses a **split-S** case
system. In such case systems there are two types of intransitive
verbs: verbs with A-like marking on their arguments and verbs with
O-like markings on their single arguments. In the menu provided to
you in the Grammar Matrix Customization system, please specify the
name of the case taken by A (e.g. ergative, agentive), and the name
of the case taken by O (e.g. absolutive, patientive). An example of
a language with split-S case system is Mandan.  
  
  **Fluid-S**  
  
  Please select this option if your language uses a **fluid-S** case
system. In such case systems, in addition to the two types of verbs
used in the split-S languages, there are also intransitive verbs
with A- or O-like markings on their single arguments, depending on
pragmatics. For example, if the subject controls the action, then
A-like marking is used on the argument. If the subject does not
control the action, then O-like marking is used on the argument. In
the menu provided to you in the Grammar Matrix Customization system,
please specify the name of the case taken by A (e.g. ergative,
agentive), and the name of the case taken by O (e.g. absolutive,
patientive). An example of a language with fluid-S case system is
the North Caucasian language Bats.  
  
  **Split conditioned on features of the noun phrase arguments**  
  
  Please select this option if your language uses a **split-N** case
system, in which use of case marking is determined by the nature of
nominal arguments. In such case systems some NPs (e.g. pronouns)
have nominative-accusative marking pattern, while other NPs (e.g.
common nouns) use the ergative-absolutive marking pattern. In the
menu provided to you in the Grammar Matrix Customization system,
please specify the name of the case taken by S and A (e.g.
nominative, subjective), the name of the case taken by O (e.g.
accusative, objective), the name of the case taken by A (e.g.
ergative, relative, narrative), and the name of the case taken by S
and O (e.g. absolutive, nominative). An example of a language with
**split conditioned on features of the noun phrase arguments** case
system is Dyirbal.  
  
  **Split conditioned on features of the verb**  
  
  Please select this option if your language uses a **split-V** case
system, where case marking is determined by the nature of nominal
arguments. You will be able to define these features later on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page. In such case systems, case markings are determined by the
tense, aspect, or mood of the clause. In the menu provided to you in
Grammar Matrix Customization system, please specify the name of the
case taken by S and A (e.g. nominative, subjective), the name of the
case taken by O (e.g. accusative, objective), the name of the case
taken by A (e.g. ergative, relative, narrative), and the name of the
case taken by S and O (e.g. absolutive, nominative). An example of a
language with **split conditioned on features of the verb** case
system is Indo-Iranian language Gujarati, with the
nominative-accusative case pattern in the imperfective aspect and
the ergative-absolutive case pattern in the perfective aspect.  
  
  **Focus-case**  
  
  Please select this option if your language uses a **focus-case**
system, in which an additional case exists (sometimes referred to as
**focus** case), the grammatical role of which is determined by the
morphology of the verb. An example of a language with **focus-case**
system is Tagalog, in which presence of one argument with
focus-marking is obligatory for every clause. In the menu provided
to you in the Grammar Matrix Customization system, please specify
the name of the focus case in your language, the name of the case
taken by A (e.g. ergative, relative, narrative), and the name of the
case taken by O (e.g. accusative, objective).  
  
  **Additional Cases**  
  
  Finally, many languages have more cases than those that cover
standard A, S and O marking. You can add any number of cases in the
*Additional Cases* section on the bottom of the
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case)
page. This option is useful for implementation of **quirky case**,
i.e. the case taken by obligatory verbal arguments beyond cases
marking intransitive subjects, agents, and patients (Levin and
Simpson 1981).
  
  To describe **quirky case**, define the appropriate range of case
values on the
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case)
page, including extra cases if necessary (in *Additional Cases* at
the bottom of the page). Then on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page, select an argument structure without any case presets.
Constrain the CASE value of each argument through the *add a
feature* iterator.  

The values you assign to the CASE feature will be available to use later
in the customization system, especially the
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
and
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
pages. The answers you provide on this page will determine the values
available on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page for the CASE feature. CASE will also appear as one of the features
of the lexical rule types on
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
page.

Further information about the options on the Case page is provided in in
[Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 3.3.

# Motivation

While some language do not have a case system, other languages that do
use cases rely on them heavily. The case library of the Grammar Matrix
Customization system was developed to cover case systems that are most
commonly used across languages, providing user with nine pre-defined
options in the questionnaire. To provide the user with more flexibility
in coverage of the less commonly used case systems or of the quirky
case, the Grammar Matrix Customization system also allows user to define
additional case values instead of just relying on the pre-defined
analyses. For more information on the analyses of case systems please
refer to the [Analyses](/MatrixDoc/Case#Analyses) section below.

# Analyses

After you define a case system for your language, your starter grammar
will include the feature \[ CASE case \], with possible values based on
the choices you make on the
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case)
customization page.

Below is a snippet of code related to case from choices file for a
language with nominative-accusative case system:

    section=case
    case-marking=nom-acc
    nom-acc-nom-case-name=nominative
    nom-acc-acc-case-name=accusative

This can be compared to code from the same section of the choices file
for a language that does not use a case system:

    section=case
    case-marking=none

If no further specifications for case is defined on the Lexicon or
Morphology pages of the Grammar Matrix customization system, the case
hierarchy will be flat, i.e. all cases will be direct subtypes of the
feature-value *case*.

    case := avm.
    nom := case.
    acc := case.
    gen := case.
    dat := case.
    abl := case.

A more elaborate hierarchy can be formed by indicating common
underspecifications for lexical items or morphemes. For instance, the
Latin word *tempus* can either be nominative or accusative, but not
genitive, dative or ablative. If you define *tempus* in the lexicon with
*nom* and *acc* as case values, the hierarchy will included an
underspecified form for case that is either nominative or accusative:

    case := avm.
    nom-or-acc := case.
    nom := nom-or-acc.
    acc := nom-or-acc.
    gen := case.
    dat := case.
    abl := case.

Following Pollard and Sag (1994), CASE is a feature of the syntactic
HEAD. The cases of both arguments (subject and object) are specified on
the verb lexical types. Grammar Matrix provides the following
case-marking strategies in the Lexicon section: (1). marking
*morphologically* on nouns, determiners, or (2). marking of whole NPs
via *case-marking adpositions*, or (3). both (*mixed marking*).

- (1). *Morphological marking* is implemented through lexical rules.
These rules take a lexical item as an input, apply spelling change,
constrain CASE feature to have a particular value. For languages
with morphological case-marking strategy, nominal heads have a
\[CASE\] feature that is specified by lexical rules for the
appropriate case inflection or directly on a lexical type. Verbs are
constrained to take arguments that are noun phrases.  
  
  (2). *Case-marking adpositions* are implemented through lexical
items taking nominal complements and specifying a particular case
marking on this complement, as well as on the adpositional phrase.
In this strategy verbs take adpositional phrases as their arguments,
instead of noun phrases. \[CASE\] feature is specified on both
nominal and adpositional heads. Case-marking adpositions are
constrained to take nominal complements as their arguments and
specify an appropriate case value on both the complement and the
resulting adpositional phrase. Verbs are constrained to have
adpositional phrases as their arguments, thus preventing noun
phrases appearing as their complement.  
  
  (3). *Mixed marking* is more complex and is reserved for languages
that have both morphological and adpositional case-marking, e.g.
Tagalog. As in the case-marking adpositional analysis, the \[CASE\]
feature is specified both on nominal and adpositional phrases. Verbs
can take different arguments, i.e. nouns, noun phrases or
adpositional phrases, depending on the language. For more
information on implementing the mixed case-marking strategy and its
complications please refer to [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 3.2.1.1.

For the detailed analyses of each of the case-marking systems covered by
Grammar Matrix Customization system please refer to [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 3.2.

# Upcoming Work

Although Case library of Grammar Matrix Customization system is already
quite flexible, providing user with nine pre-defined case systems and
allowing user to create additional cases, it could be extended for a
broader coverage of case and its interactions with other grammatical
phenomena.

One of the limitations of the Grammar Matrix is its lack of coverage of
the more complex argument-marking cases, e.g. some fine interactions
between case-marking and verb forms. Adding support for these
interactions between case and verb forms (or between case and other
parts of grammar) would provide a broader coverage of the grammatical
phenomena described in these sections, as well as make the interaction
between these sections of Grammar Matrix Customization system more
dynamic.

Another current limitation of Grammar Matrix customization system is
lack of coverage of the **syntactic ergativity**. Although syntactic
ergativity is an inter-clausal phenomenon and absence of its coverage
does not yet affect grammars created by Grammar Matrix Customization
system, it would be beneficial to implement it in the future. Providing
support for syntactic ergativity would also aid in the enhancements to
the sections on relative clauses, control, and binding, which can
interact with syntactic ergativity. This could be achieved through the
integration of the HPSG analysis of syntactic ergativity that has
already been developed by Manning and Sag (1995).

# References

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

Dixon, R. M. W. (1994). Ergativity. Cambridge: Cambridge University
Press.

- bibtex:
  
  @book{Dixon:1994,\
author = {R. M. W. Dixon},\
year = {1994},\
title = {Ergativity},\
publisher = {Cambridge: Cambridge University Press}\
}

Levin, L. S., & Simpson, J. (1981). Quirky Case and Lexical
Representations of Icelandic Verbs. Chicago Linguistic Society 17,
185–196.

- bibtex:
  
  @book{levin:1981,\
author = {Lori S. Levin and Jane Simpson},\
year = {1981},\
title = {Quirky Case and Lexical Representations of Icelandic
Verbs},\
conference = {In Proceedings of the Chicago Linguistic Society
17},\
pages = {185–196},\
}

Manning, C. D., & Sag, I. (1995). Dissociations between Argument
Structure and Grammatical Relations. In Lexical and Constructional
Aspects of Linguistic Explanation, pages 63–78, CSLI.

- bibtex:
  
  @incollection{manning:1995,\
author = {Christopher Manning and Ivan Sag},\
year = {1995},\
title = {Dissociations between Argument Structure and Grammatical
Relations},\
booktitle = {Lexical and Constructional Aspects of Linguistic
Explanation},\
pages = {63-78},\
publisher = {CSLI Publications}\
}

Last update: 2013-10-01 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_Case/_edit)]{% endraw %}