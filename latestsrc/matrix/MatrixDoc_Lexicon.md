{% raw %}# Documentation for the Grammar Matrix Customization Lexicon Library

# Introduction

This document explains how to fill out the [Lexicon
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
of the Grammar Matrix Customization questionnaire and presents
background information on the person library of the Grammar Matrix
Customization System (Bender et al., 2002; Bender and Flickinger, 2005;
Bender et al., 2010). General instructions on using the questionnaire
can be found
[here](/MatrixDocTop#General_instructions_on_how_to_use_the_questionnaire).

The [Lexicon
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
interacts with virtually every library in the customization system. On
the Lexicon page, the user can define various lexical types. The
features and values available to use in the definition of these lexical
types depend on the answers to other parts of the questionnaire.

# Citing the Lexicon Library

Most of the work for the Lexicon Library and its implementations has
been done as part of [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf).
The full reference and .bib entry can be found
[here](/MatrixDoc/Lexicon#References). The adjectives and copulas were
added as part of Trimble 2014 (forthcoming).

# Table of Contents

- [Options](/MatrixDoc/Lexicon#Options)
  
  - [General Information](/MatrixDoc/Lexicon#General)
  - [Nouns](/MatrixDoc/Lexicon#Nouns)
  - [Verbs](/MatrixDoc/Lexicon#Verbs)
  - [Adjectives](/MatrixDoc/Lexicon#Adjectives)
  - [Auxiliaries](/MatrixDoc/Lexicon#Auxiliaries)
  - [Copulas](/MatrixDoc/Lexicon#Copulas)
  - [Determiners](/MatrixDoc/Lexicon#Determiners)
  - [Case Marking
Adpositions](/MatrixDoc/Lexicon#Case_Marking_Adpositions)
- [Analyses](/MatrixDoc/Lexicon#Analyses)
- [References](/MatrixDoc/Lexicon#References)

# Options

## General

The [Lexicon
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
provides means to define grammatical properties of nouns, transitive and
intransitive verbs, adjectives, auxiliaries and copulas, determiners and
case-marking adpositions. The page bears a red question mark when
unfilled. This means that it is possible to create a grammar with an
empty lexicon, but generally assumed that it makes sense to define at
least a noun and two verb types (typically intransitive and transitive)
so that the grammar will be able to parse something. The question mark
disappears as soon as at least one noun type and two verb types are
given.

Nouns, verbs, adjectives, and copula types that partially share
grammatical properties can be defined as a hierarchy, where a general
supertype defines properties shared by more than one class of nouns or
verbs. The noun or verb classes that exhibit these shared properties
will inherit them from the supertype (see the specific documentation on
noun and verb classes for details).

## Nouns

The following information can be provided for each noun type:

- Type name
- Supertypes
- Features (name value)
- **Determiners (obligatory)**
- Stems (Spelling Predicate)
- Morphotactic constraints

A more detailed description of each of these properties follows below.

### Type name

Defines the name of the class of nouns. It should be noted that:

- The suffix *-noun-lex* will be added to the given name, e.g. *mass*
becomes *mass-noun-lex* and *mass-noun*, *mass-noun-noun-lex*
- Noun types without a type name will be numbered: *noun1-noun-lex*,
*noun2-noun-lex*, etc.
- Good engineering style: pick transparent names, such as *mass* and
*count*, *1st-sg-pro*, *1st-pl-incl-pro* rather than cryptic names

### Supertypes

This dropbox allows you to select supertypes of the noun-class. The
dropbox will contain all other noun types you have defined, the order is
not relevant. You can select several supertypes. This is useful if you
want to cross-classify properties such as grammatical gender and
countability for classes of nouns.

A noun inherits the feature values of its supertype. For instance:

- noun\_type has feature Name: PERSON Value: 3rd
- noun\_type2 has supertype noun1

In the resulting grammar, all nouns belonging to the class of
noun\_type2 will be 3rd person.

Next to **Noun Types**, you find a(n experimental) link saying
*visualize noun hierarchy*. It will display the supertype relations that
are defined at that moment as a hierarchy.

Cycles of inheritance are not allowed (and they do not make sense
anyway). So if noun\_type2 is a supertype of noun\_type1, noun\_type1
may not be a supertype of noun\_type2. Note that the supertype-subtype
relation is transitive, so if *a := b* indicates a supertype relation
where *b* is supertype of *a*, the following is forbidden as well:

    a := b.
    b := c.
    c := a.

In the supertype hierarchy above, *c* is a supertype of *a* through *b*.
So *a* cannot be a supertype of *c*.

**CAREFUL!!!!!!**

Validation does not check whether constraints on supertypes and subtypes
are compatible. This means that grammars with such errors can be created
by the customization system, **but they will not load in lkb and cannot
be compiled to work with PET or ACE**. An example of this would be the
following:

    NounType 1
    Type name: 2nd-sg
    supertype: 3rd-sg
    Feature: PERSON 2nd
    
    NounType 2
    Type name: 3rd-sg
    
    Feature: PERSON 3rd

The 2nd-sg noun will inherit the property \[PERSON 3rd\] from the 3rd-sg
noun, but have the additional property of \[PERSON 2nd\] from its own
definition. Assuming that 3rd and 2nd are conflicting values, the
grammar contains an ill-defined type. The following hierarchy would be
possible:

    NounType 1
    Type name: 2nd-sg
    supertype: 3rd-sg
    Feature: PERSON 2nd
    
    NounType 2
    Type name: 3rd-sg
    
    Feature: PERSON 3rd, 2nd

In this case, Noun Type 2 will have a value for PERSON that is an
underspecification of 2nd and 3rd. This value can unify with the value
of Noun Type 1.

There is a bug report for this problem, but it is extremely hard to
implement so that it works at the time of validation. So for now and the
near future: **pay attention while defining inheritance!**

### Features

The Feature option for verbs has three fields *name*, *value*. You can
select a feature under *name* and its value(s) under *value*.

The drop-boxes will show features and values based on what was filled
out at the pages
[Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person),
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number),
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender),
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case),
and [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features).
The first four libraries
([Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person),
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number),
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender),
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case))
each define features typically appropriate for nouns. [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
allows you to define customized features. These features can be assigned
to nouns, verbs or both. Features that are defined for both categories
or for nouns will appear in the drop-box.

Select the feature you want to specify from the left drop-box.
Appropriate values will appear in the right drop-box. Each value is
preceded by a check box. You can select as many values as you want for
each feature (but note that selecting all values leads to the same
behavior as not specifying a feature value pair at all).

If you select more than one value for a feature, the noun class will
assign an underspecified value to the feature that may unify with any of
the selected values. The customization system will adapt the type
hierarchy of the feature value accordingly. See the [analysis
section](/MatrixDoc/Lexicon#A_Features_Analyses) for an example of the
impact on the type hierarchy.

### Determiners

This is the only obligatory question for noun classes, validation
indicates an error when this question is not answered, while other
questions for a given noun class are.

You must indicate whether determiners are *optional*, *obligatory* or
*impossible*. Nouns with optional determiners can either form a noun
phrase by themselves or by being combined with a determiner. If
determiners are obligatory, they can only form a noun phrase (and hence
only occur in a parsed sentence) when combined with a determiner. If
determiners are impossible, the nouns form NPs by themselves and cannot
be combined with determiners.

If you indicated on the [Word
Order](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=word-order)
page that the grammar does not have determiners, you must select
*impossible* (else validation will indicate there is an error).

### Stems

Here you can define the actual stems of nouns belonging to a given
class. Note that classes that are meant to serve as a supertype for
other noun classes should (in most cases) not have stems. You can add as
many noun stems per class as you want. It is not the fastest way to
define a large scale lexicon, so you probably want to limit it to a
hand-full that allows you to build decent test suites.

For each noun stem, spelling and a predicate must be provided. After you
fill out the spelling and hit tab, a predicate name based on the stem
and MRS standards is suggested. This has the following form:

    Spelling: myStem     Predicate: _myStem_n_rel

You can change the predicate if you like, but it is recommended to stick
to the conventions of starting with \_ and ending nominal relations by
\_n\_rel.

Pronouns are typical examples where predicates are not based on the
spelling of the stem (e.g. *\_pronoun\_n\_rel*, *\_pro\_n\_rel* for all
pronouns, INDEX features indicate the person, number, gender and other
distinctive properties it may have).

### Morphotactic constraints

This part of the lexicon library allows you to define interactions with
morphotactics, which morphemes are required and which are forbidden to
combine with a given lexical type.

When you click either of the buttons, a constraint description appears
with a drop-down menu. The position classes and morphological rules
defined for nouns on the [morphology
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
appear in the drop-down. Select a class to define complete the
constraint. You can define as many constraints as necessary.

A Require constraint makes sure the lexical item is only accepted as a
word after combining with a morpheme belonging to the selected position
class or an instance of the selected lexical rule (depending on whether
a position class or lexical rule was selected).

A Forbid constraint makes sure the lexical item cannot combine with a
morpheme belonging to the selected position class or an instance of the
selected lexical rule (depending on whether a position class or lexical
rule was selected).

## Verbs

The following information can be provided for each noun type:

- Type name
- Supertypes
- Features (name, value, specified on)
- **Argument structure**
- Stems (Spelling Predicate)
- Morphotactic constraints

A more detailed description of each of these properties follows below.

### Type name

Defines the name of the class of verbs (similar to nouns). It should be
noted that:

- The suffix *-verb-lex* will be added to the given name, e.g. *trans*
becomes *trans-verb-lex* and *trans-verb*, *trans-verb-verb-lex*
- Verb types without a type name will be numbered: *verb1-verb-lex*,
*verb2-verb-lex*, etc.
- Good engineering style: pick transparent names, such as *trans* and
*intrans*, *nom-acc-trans*, *nom-dat-trans* rather than cryptic
names

### Supertypes

This dropbox allows you to select supertypes of the verb-class. The
dropbox will contain all other verb types you have defined, the order is
not relevant. You can select several supertypes. This is useful if you
want to cross-classify properties such as argument structure, case
marking on arguments and subject or object agreement (if not handled by
morphotactics).

A verb inherits the feature values of its supertype. For instance:

- verb\_type1 has argument-structure intransitive
- verb\_type2 has argument-structure transitive
- verb\_type3 has supertype verb\_type2 and feature value \[ CASE nom
\] on the subject
- verb\_type4 has supertype verb\_type2 and feature value \[ CASE acc
\] on the object
- verb\_type5 has supertype verb\_type1 and feature value \[ CASE nom
\] on the subject
- verb\_type6 has supertypes verb\_type3 and verb\_type4

In the resulting grammar, all verbs belonging to the class of
verb\_type5 will be intransitive verbs with nominative subjects, all
verbs belonging to the class of verb\_type6 will be transitive verbs
with nominative subjects and accusative objects.

Next to **Verb Types**, you find a(n experimental) link saying
*visualize verb hierarchy*. It will display the supertype relations that
are defined at that moment as a hierarchy.

Cycles of inheritance are not allowed (and they do not make sense
anyway). So if verb\_type2 is a supertype of verb\_type1, verb\_type1
may not be a supertype of verb\_type2. Note that the supertype-subtype
relation is transitive, so if *a := b* indicates a supertype relation
where *b* is supertype of *a*, the following is forbidden as well:

    a := b.
    b := c.
    c := a.

In the supertype hierarchy above, *c* is a supertype of *a* through *b*.
So *a* cannot be a supertype of *c*

**CAREFUL!!!!!!**

Validation does not check whether constraints on supertypes and subtypes
are compatible. This means that grammars with such errors can be created
by the customization system, **but they will not load in lkb and cannot
be compiled to work with PET or ACE**. An example of this would be the
following:

    VerbType 1
    Type name: past
    supertype: present-v
    Feature: TENSE past
    
    NounType 2
    Type name: present-v
    
    Feature: TENSE present

The past verb will inherit the property \[TENSE present\] from the
future verb, but have the additional property of \[TENSE past\] from its
own definition. Assuming that past and future are conflicting values,
the grammar contains an ill-defined type. The following hierarchy would
be possible:

    VerbType 1
    Type name: past
    supertype: past-v
    Feature: TENSE past
    
    VerbType 2
    Type name: present
    
    Feature: TENSE present, past

In this case, Verb Type 2 will have a value for TENSE that is an
underspecification of present and past (typically this would be
non-future defined on verbal features). This value can unify with the
value of Noun Type 1.

There is a bug report for this problem, but it is extremely hard to
implement so that it works at the time of validation. So for now and the
near future: **pay attention while defining inheritance!**

### Features

The Feature option for verbs has three fields: *name*, *value*, and
*specified on*. The name of the feature can be selected under *name*,
its value(s) under *value* and where the feature-value pair applies to
under *specified on*. Further explanation follows below.

The first two drop-boxes will show features and values based on what was
filled out at the pages
[Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person),
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number),
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender),
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case),
[Tense-Mood-Aspect](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-mood-aspect),
and [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features).
The first four libraries
([Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person),
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number),
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender),
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case))
each define features typically appropriate for nouns.
[Tense-Mood-Aspect](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-mood-aspect)
library provides the means to define typical verbal features (including
grammatical features such as finiteness). [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
allows you to define customized features, which can be assigned to
nouns, verbs or both. All features, regardless of whether they are
defined for nouns, verbs or both categories will appear in the drop-box.

The third drop-box provides five options: *the verb*, *the subject NP*,
*the object NP*, *the higher-ranked NP* and *the lower-ranked NP*.
Typical verbal properties such as Tense, Aspect, Mood and verb form
should be assigned to *the verb*. Agreement between verbs and their
arguments can be modeled by assigning properties to an NP. Be careful to
only assign properties that are defined for verbs or both categories to
*the verb* and only properties that are defined for nouns or both to the
NPs. **Currently validation does not check for such errors.** You will
therefore be allowed to do define properties this way on the
questionnaire, but your grammar will not load. A bug report has been
filed to fix validation.

If your grammar has optional arguments and you defined the related
properties on [Argument
Optionality](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=arg-opt)
page of the questionnaire, you can define which arguments are optional
and which are not by defining feature value pair \[OPT +\] and \[OPT
-\], respectively, for the **arguments** in question. In other words, an
optional object is defined by assigning \[OPT +\] to *the Object NP*.
The OPT feature cannot be defined for *the verb*. Validation checks for
this.

Select the feature you want to specify from the left drop-box.
Appropriate values will appear in the right drop-box. Each value is
preceded by a check box. You can select as many values as you want for
each feature (but note that selecting all values leads to the same
behavior as not specifying a feature value pair at all). Assign the
feature value pair to the appropriate element, keeping in mind the
comments made above.

If you select more than one value for a feature, the verb class will
assign an underspecified value to the feature that may unify with any of
the selected values. The customization system will adapt the type
hierarchy of the feature value accordingly. See the [analysis
section](/MatrixDoc/Lexicon#A_Features_Analyses) for an example of the
impact on the type hierarchy.

**Please not that you cannot define argument-structure here**,
argument-structure should be defined by the special argument-structure
drop-down explained below. The option *argument-structure* is intended
for the morphemes only (to be defined on the morphology page).

### Argument Structure

The argument structure drop-box allows you to indicate whether a verb is
transitive or intransitive. Depending on the definitions you provided on
the
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case)
page, the drop-box also provides the standard case marking of your
language's subjects and objects (e.g. intransitive (nom) transitive
(nom-acc), intransitive (erg), transitive (erg-abs)). For split case
marking, no basic marking will be given for the case marking on the
argument structure.

If you want to define a verb with non-standard case marking (e.g. a verb
with dative objects in a nominative-accusative language,
nominative-nominative case marking for copula verbs), you can select the
option *case unspecified*. You can then specify the case marking on
subject and object using 'features'.

For verbs that will undergo nominalization, choose "case unspecified"
and then constrain the output of the morphological rule associated with
nominalization appropriately.

For verbs that will take clausal complements, you have three options:

- Choose case unspecified and use the Feature button to constrain
subject or object case, where appropriate.
- Choose normal case marking. This will only work for verbs taking
nominalized complements, since only they will have case.
- Specify the subject case but not the object case. It is expected
that the subject case will be the same as for other verbs in most
cases. Object case will not be appropriate for non-nominalized
clausal complements.

Argument structure is obligatory for all verb classes.

### Stems

Here you can define the actual stems of verbs belonging to a given
class. Note that classes that are meant to serve as a supertype for
other verb classes should (in most cases) not have stems. You can add as
many verb stems per class as you want. It is not the fastest way to
define a large scale lexicon, so you probably want to limit it to a
hand-full that allows you to build decent test suites.

For each verb stem, spelling and a predicate must be provided. After you
fill out the spelling and hit tab, a predicate name based on the stem
and MRS standards is suggested. This has the following form:

    Spelling: myStem     Predicate: _myStem_v_rel

You can change the predicate if you like, but it is recommended to stick
to the conventions of starting with \_ and ending verbal relations by
\_v\_rel.

### Bipartite stems

"The term bipartite stem was coined by William Jacobsen (1980) to
describe a pervasive type of verb formation in Washo, a Hokan language
of western Nevada in which \[...\] bound morphemes neither of which can
constitute a verb stem on its own, are combined to form a “bipartite”
stem." ([DeLancey](/DeLancey), p.1)

Above 'Stems' you will find the line *If this verb class includes
bipartite stems, select the position class for the affix portion of the
stems:* followed by a dropbox. Here, you can select a position class
defined on the [Morphology
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology).
Position classes define whether an affix is a prefix or suffix and the
morphemes (stems or other affixes) it is preceded or followed by.

If the verbs in the language have positions specific to the affix of the
bipartite stem, you should go to the [Morphology
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
and define this position. You can then select it for the verb class on
the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page.

If you click on *Add a bipartite Stem* three boxes appear, one for the
root, one for the affix and one for the predicate. As for regular stems,
a predicate is suggested as soon as you enter the root:

    Root spelling: myRoot       Affix spelling: myAffix        Predicate: _myroot_v_rel

### Morphotactic Constraints

This part of the lexicon library allows you to define interactions with
morphotactics, which morphemes are required and which are forbidden to
combine with a given lexical type.

When you click either of the buttons, a constraint description appears
with a drop-down menu. The position classes and morphological rules
defined for verbs on the [Morphology
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
appear in the drop-down. Select a class to define the constraint. You
can define as many constraints as necessary.

A Require constraint makes sure the lexical item is only accepted as a
word after combining with a morpheme belonging to the selected position
class or an instance of the selected lexical rule (depending on whether
a position class or lexical rule was selected).

A Forbid constraint makes sure the lexical item cannot combine with a
morpheme belonging to the selected position class or an instance of the
selected lexical rule (depending on whether a position class or lexical
rule was selected).

## Adjectives

The following information can be provided for each adjective type:

- Type name
- Supertypes
- Syntactic behavoir
- Features (name, value, specified on)
- Modification direction
- Unique modification
- Predicative behavoir
- Stems (Spelling Predicate)
- Morphotactic constraints

A more detailed description of each of these properties follows below.

### Type name

Defines the name of the class of adjectives (similar to nouns and
verbs). It should be noted that:

- The suffix *-adj-lex* will be added to the given name, e.g.
*regular* becomes *regular-adj-lex* and *regular-adjective*,
*regular-adjective-adj-lex*
- Adjective types without a type name will be numbered:
*adj1-adj-lex*, *adj2-adj-lex*, etc.
- Good engineering style: pick transparent names, such as
*regular-both*, *irregular-both*, *regular-attributive-posthead* or
*irregular-predicative-stative* rather than cryptic names like
*basic*.

### Supertypes

This dropbox allows you to select supertypes of the adjective-class. The
dropbox will contain all other adjective types you have defined, the
order is not relevant. You can select several supertypes. This is useful
when defining agreement features, such as gender or number.

An adjective inherits the feature values of its supertype. For instance:

- adj\_type1 has the feature value \[ GENDER masculine \] on both
positions
- adj\_type2 has the feature value \[ GENDER feminine \] on both
positions
- adj\_type3 has the feature value \[ NUMBER singular \] on both
positions
- adj\_type4 has the feature value \[ NUMBER plural \] on both
positions
- adj\_type5 has supertypes adj\_type1 and adj\_type3
- adj\_type6 has supertypes adj\_type2 and adj\_type3
- adj\_type7 has supertype adj\_type4

In the resulting grammar, there will be three *leaf* adjective types,
one for each of the possible combinations of the two two-valued
features, which can easily have lexical instances (lexicon entries)
added to. Doing this helps the grammar remain structured, and to easily
place additional constraints on types, say if it is discovered that
plural nouns are inherently feminine.

Next to **Adjective Types**, you find a(n experimental) link saying
*visualize adjective hierarchy*. It will display the supertype relations
that are defined at that moment as a hierarchy.

Cycles of inheritance are not allowed (and they do not make sense
anyway). So if adj\_type2 is a supertype of adj\_type1, adj\_type1 may
not be a supertype of adj\_type2. Note that the supertype-subtype
relation is transitive, so if *a := b* indicates a supertype relation
where *b* is supertype of *a*, the following is forbidden as well:

    a := b.
    b := c.
    c := a.

In the supertype hierarchy above, *c* is a supertype of *a* through *b*.
So *a* cannot be a supertype of *c*

**CAREFUL!!!!!!**

Validation does not check whether constraints on supertypes and subtypes
are compatible. This means that grammars with such errors can be created
by the customization system, **but they will not load in lkb and cannot
be compiled to work with PET or ACE**. An example of this would be the
following:

    AdjType 1
    Type name: regular-both
    supertype: regular-attributive
    
    AdjType 2
    Type name: regular-attributive
    This adjective is attributive.

The regular-both adjective will inherit the property
Behavoir:attributive from the regular-attributive adjective, but have
the additional property of Behavoir:both from its own definition. This
results in an ill-defined type, and should be avoided.

There is a bug report for this problem, but it is extremely hard to
implement so that it works at the time of validation. So for now and the
near future: **pay attention while defining inheritance!**

### Syntactic behavoir

There are four options for syntactic behavior:

- attributive
- predicative
- both
- unspecified

Examples of attributive adjectives include:

    English: a tall man
    Apatani: Abraham 1985: 23
      aki atu
      dog small
      'a small dog'
    French:
      le chien noir
      DET.DEF dog black
      'the black dog'

Examples of predicative adjectives include:

Many adjectives in many languages can be both attributive and
predicative, such as in English:

    the big dog barks
    the dog is big

The *unspecified* choice is for adjectives that either agree with only
their subject or modificand (but not both), or are optionally the
complement of a copula. The *unspecified* option is currently only
useful for these situations, and should be avoided otherwise.

### Features

The Feature option for adjectives has three fields: *name*, *value*, and
*specified on*. The name of the feature can be selected under *name*,
its value(s) under *value* and where the feature-value pair applies to
under *specified on*. Further explanation follows below.

The first two drop-boxes will show features and values based on what was
filled out at the pages
[Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person),
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number),
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender),
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case),
[Tense-Mood-Aspect](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-mood-aspect),
and [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features).
The first four libraries
([Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person),
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number),
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender),
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case))
each define features typically appropriate for nouns.
[Tense-Mood-Aspect](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-mood-aspect)
library provides the means to define typical predicate or 'verbal'
features (including grammatical features such as finiteness). [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
allows you to define customized features, which can be assigned to
nouns, verbs or both. All features, regardless of whether they are
defined for nouns, verbs, or both categories will appear in the
drop-box.

The third drop-box provides four options: *the modified noun*, *the
subject*, *both positions*, and *the adjective*. Typical verbal
properties such as Tense, Aspect, Mood and form should be assigned to
*the adjective*. Agreement between adjectives and their modificand or
subject can be modeled by assigning properties to one of the other
options. Be careful to only assign properties that are defined for verbs
or both categories to *the adjective* and only properties that are
defined for nouns or both to the NPs.

**Note** that *both positions* is typologically more common, and *both
positions* can and **should** be used for attributive only or
predicative only adjectives. The options *the modified noun* and *the
subject* are for cases where the adjective can appear in either position
but only agrees with one position, or agrees differently with each
argument. For instance, German adjectives only agree in attributive
constructions, so they might be specified to agree with *the modified
noun* as opposed to *both positions*.

Select the feature you want to specify from the left drop-box.
Appropriate values will appear in the right drop-box. Each value is
preceded by a check box. You can select as many values as you want for
each feature (but note that selecting all values leads to the same
behavior as not specifying a feature value pair at all). Assign the
feature value pair to the appropriate element, keeping in mind the
comments made above.

If you select more than one value for a feature, the adjective class
will assign an underspecified value to the feature that may unify with
any of the selected values. The customization system will adapt the type
hierarchy of the feature value accordingly. See the [analysis
section](/MatrixDoc/Lexicon#A_Features_Analyses) for an example of the
impact on the type hierarchy.

On the use of *the subject* and *the modified noun*, in order to enable
this functionality, the system automatically does two things on the
selection of one of these options:

- Sets the behavior of the adjective to *unspecified*
- Creates a new position class on the
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
page with two lexical rule types that can be specified *attributive*
or *predicative*. Any features you have specified on the Lexicon
page are **moved** to the Morphology page upon saving or going to
another page. These lexical rule types are automatically set up with
the proper behavior and features, so you should not have to change
anything on the Morphology page after using this feature, but best
to check.

### Modification direction

This choice is only relevant for *attributive* or *both* adjectives, and
specifies whether the adjective appears **before** or **after** the noun
it modifies, or **either**. The configurations are as follows:

    after the adjective: adj n
    before the adjective: n adj
    either position: adj n OR n adj

While some free word order languages allow adjectives to appear in any
discourse constrained position, the word order library does not
currently support this.

### Unique modification

This choice is only relevant for *attributive* or *both* adjectives, and
specifies whether the adjective can be the only modifier of the noun it
modifies. That is, the string adj adj n is illegal in the target
language because two adjectives modify the same noun.

### Predicative behavior

This choice is only relevant for *predicative* or *both* adjectives, and
specifies whether an adjective *obligatorily*, *optionally*, or
*impossibly* appears as a copula complement. These are described below:

- obligatory: the adjective **must** appear as a copula complement to
be grammatical. Currently, the order of adjective and copula is the
same as the order of Verb and Subject (VS/SV) on the [Word
Order](http://www.trimbleworks.us/matrix/web/matrix.cgi?subpage=word-order)
page. This choices requires a copula to be defined on the Lexicon
page.
- impossibly: the adjective is a stative predicate, and **never**
appears as a copula complement.
- optionally: the adjective can appear as a copula complement **or** a
stative predicate. This is facilitated through the use of a special
position class, which is created automatically on the
[Morphology](http://www.trimbleworks.us/matrix/web/matrix.cgi?subpage=morphology)
page upon **saving** this choice. On the Morphology page, users can
then define special morphology or other features of the copula
complement or stative predicate instances of this adjective.

### Stems

Here you can define the actual stems of verbs belonging to a given
class. Note that classes that are meant to serve as a supertype for
other verb classes should (in most cases) not have stems. You can add as
many verb stems per class as you want. It is not the fastest way to
define a large scale lexicon, so you probably want to limit it to a
hand-full that allows you to build decent test suites.

For each verb stem, spelling and a predicate must be provided. After you
fill out the spelling and hit tab, a predicate name based on the stem
and MRS standards is suggested. This has the following form:

    Spelling: myStem     Predicate: _myStem_a_rel

You can change the predicate if you like, but it is recommended to stick
to the conventions of starting with \_ and ending adjectival relations
by \_a\_rel.

### Morphotactic Constraints

**NOTE**: morphotactic constraints on adjectives are still under
development and may not work as intended.

This part of the lexicon library allows you to define interactions with
morphotactics, which morphemes are required and which are forbidden to
combine with a given lexical type.

When you click either of the buttons, a constraint description appears
with a drop-down menu. The position classes and morphological rules
defined for verbs on the [Morphology
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
appear in the drop-down. Select a class to define the constraint. You
can define as many constraints as necessary.

A Require constraint makes sure the lexical item is only accepted as a
word after combining with a morpheme belonging to the selected position
class or an instance of the selected lexical rule (depending on whether
a position class or lexical rule was selected).

A Forbid constraint makes sure the lexical item cannot combine with a
morpheme belonging to the selected position class or an instance of the
selected lexical rule (depending on whether a position class or lexical
rule was selected).

## Auxiliaries

Auxiliaries represent verbs that take other verbs as their complement. A
basic description is provided on the [Lexicon
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon).
You can add an auxiliary by clicking on the *Add an Auxiliary Type*.
This opens up a range of relevant fields and questions to define
auxiliaries.

They are:

- Type Name
- *No predicate* or *An independent predicate*
- Auxiliary Features
- Subject Type
- Complement Features
- Stems
- Morphotactic Constraints

A more detailed description of each of these properties follows below
(**note**: currently under development)

### Type Name

Defines the name of the class of auxiliaries (similar to nouns and
verbs). It should be noted that:

- The suffix *-aux-lex* will be added to the given name, e.g. *modal*
becomes *modal-aux-lex* and *modal-aux*, *modal-aux-aux-lex*
- Aux types without a type name just receive the suffix (*-aux-lex*),
you should therefore **provide a type name!**
- Good engineering style: pick transparent names, such as *modal* and
*participle*, *future*, *past* rather than cryptic names

### No predicate or An independent predicate

By selecting a radio button, you indicate whether the auxiliaries
belonging to a class have an independent predicate (e.g. English *can*,
*may*) or not (e.g. English *will* contributing future tense through a
feature).

### Auxiliary features

The Feature option for auxiliaries has three fields *name*, *value* and
*specified on*. The name of the feature can be selected under *name*,
its value(s) under *value* and where the feature-value pair applies to
under *specified on*. Further explanation follows below.

The first two drop-boxes will show features and values based on what was
filled out at the pages
[Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person),
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number),
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender),
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case),
[Tense-Mood-Aspect](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-mood-aspect),
and [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features).
The first four libraries
([Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person),
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number),
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender),
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case))
each define features typically appropriate for nouns.
[Tense-Mood-Aspect](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-mood-aspect)
provides the means to define typical verbal features (including
grammatical features such as finiteness). [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
allows you to define customized features, which can be assigned to
nouns, verbs (including auxiliaries) or both. All features, regardless
of whether they are defined for nouns, verbs or both categories will
appear in the drop-box.

The third drop-box provides five options: *the auxiliary*, *the subject
NP*, *the object NP*, *the higher-ranked NP* and *the lower-ranked NP*.
Typical verbal properties such as Tense, Aspect, Mood and verb form
should be assigned to *the auxiliary*. Agreement between verbs and their
arguments can be modeled by assigning properties to an NP. Be careful to
only assign properties that are defined for auxiliaries or both
categories to *the auxilaries* and only properties that are defined for
nouns or both to the NPs. **Currently validation does not check for such
errors.** You will therefore be allowed to do define properties this way
on the questionnaire, but your grammar will not load. A bug report has
been filed to fix validation.

If your grammar has optional arguments and you defined the related
properties on [Argument
Optionality](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=arg-opt)
page of the questionnaire, you can define which arguments are optional
and which are not by defining feature value pair \[OPT +\] and \[OPT
-\], respectively, for the **arguments** in question. In other words, an
optional object is defined by assigning \[OPT +\] to *the Object NP*.
The OPT feature cannot be defined for *the verb*. Validation checks for
this.

Select the feature you want to specify from the left drop-box.
Appropriate values will appear in the right drop-box. Each value is
preceded by a check box. You can select as many values as you want for
each feature (but note that selecting all values leads to the same
behavior as not specifying a feature value pair at all). Assign the
feature value pair to the appropriate element, keeping in mind the
comments made above.

If you select more than one value for a feature, the auxiliary class
will assign an underspecified value to the feature that may unify with
any of the selected values. The customization system will adapt the type
hierarchy of the feature value accordingly. See the [analysis
section](/MatrixDoc/Lexicon#A_Features_Analyses) for an example of the
impact on the type hierarchy.

**Please not that you cannot define argument-structure here**, the
argument-structure for auxiliaries is currently defined on the [Word
Order](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=word-order)
page, because its specifications are mostly seen in word order. In
principle, all that can be defined on argument structure for auxiliaries
is which arguments of the verbal complement are raised, and which are
picked up by the verbal complement itself. The option
*argument-structure* is intended for the morphemes only (to be defined
on the [Morphology
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)).

### Subject Type

Here you can define the kind of subject the auxiliary takes. There are
three options concerning case marking of nouns and the option to select
an adpositional phrase as a subject. Case options include *no case
marking*, *the case the verbal complement assigns to its subject*, i.e.
similar to a raising analysis and *receiving the following case from the
auxiliary*, which allows you to define a specific case the auxiliary
will assign to the subject.

### Complement Features

Click on the button *Add a complement feature* to define features on the
verbal complement. As mentioned on the page, a feature for FORM is
required. If no feature values for form where defined, the options
*finite* and *nonfinite* will be available for FORM.

The features in the drop-down menu are all suitable for verbal
complements.

### Stems

Here you can define the actual stems of auxiliaries belonging to a given
class. You can add as many stems per auxiliary class as you want.

For each auxiliary stem must be provided. Depending on the option you
filled out regarding predicates (*No predicate* or *An independent
predicate*) you may also need to define a predicate (validation will
throw an error if you define a predicate for a predicateless auxiliary
or no predicate for an auxiliary requiring one). Since not all
auxiliaries have their own predicate, no predicate form is suggested for
auxiliaries. The recommended form is however similar to that of nouns
and main verbs:

    Spelling: myStem     Predicate: _myStem_v_rel

You can provide any predicate you like, but it is recommended to stick
to the conventions of starting with \_ and ending verbal relations by
\_v\_rel.

### Morphotactic Constraints

This part of the lexicon library allows you to define interactions with
morphotactics, which morphemes are required and which are forbidden to
combine with a given lexical type.

When you click either of the buttons, a constraint description appears
with a drop-down menu. The position classes and morphological rules
defined for verbs on the [morphology
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
appear in the drop-down. **Note that position classes for auxiliaries
are included in position classes for verbs**. Select a class to define
the constraint. You can define as many constraints as necessary.

A Require constraint makes sure the lexical item is only accepted as a
word after combining with a morpheme belonging to the selected position
class or an instance of the selected lexical rule (depending on whether
a position class or lexical rule was selected).

A Forbid constraint makes sure the lexical item cannot combine with a
morpheme belonging to the selected position class or an instance of the
selected lexical rule (depending on whether a position class or lexical
rule was selected).

## Copulas

**NOTE** Currently, the Grammar Matrix customization system only
supports copulas with adjectival complements. However, if these sorts of
copulas fit your needs for other complement types, you can use the
Grammar Matrix customization system to define your copula types and
lexical items, and then edit the output grammar.

The following values can be defined on Copulas.

- Type name
- Supertypes
- Complement Types
- Features (name, value, specified on)
- Stems (Spelling Predicate)
- Morphotactic constraints

Each of these is covered in detail below.

### Type Name

Defines the name of the class of copulas (similar to nouns and verbs).
It should be noted that:

- The suffix *-cop-lex* will be added to the given name, e.g.
*regular* becomes *regular-cop-lex* and *regular-copula*,
*regular-copula-cop-lex*
- Copula types without a type name will be numbered: *cop1-cop-lex*,
*cop2-cop-lex*, etc.
- Good engineering style: pick transparent names, such as
*regular-adj-comp-1st-sg* or *irregular-2nd-pl*.

### Supertypes

This dropbox allows you to select supertypes of the copula-class. The
dropbox will contain all other copula types you have defined, the order
is not relevant. You can select several supertypes. This is useful when
defining agreement features, such as gender or number.

An adjective inherits the feature values of its supertype. For instance:

- cop\_type1 has the feature value \[ GENDER masculine \] on the
subject
- cop\_type2 has the feature value \[ GENDER feminine \] on the
subject
- cop\_type3 has the feature value \[ NUMBER singular \] on the
subject
- cop\_type4 has the feature value \[ NUMBER plural \] on the subject
- cop\_type5 has supertypes cop\_type1 and cop\_type3
- cop\_type6 has supertypes cop\_type2 and cop\_type3
- cop\_type7 has supertype cop\_type4

In the resulting grammar, there will be three *leaf* copula types, one
for each of the possible combinations of the two two-valued features,
which can easily have lexical instances (lexicon entries) added to.
Doing this helps the grammar remain structured, and to easily place
additional constraints on types, say if it is discovered that plural
nouns are inherently feminine.

Next to **Copula Types**, you find a(n experimental) link saying
*visualize copula hierarchy*. It will display the supertype relations
that are defined at that moment as a hierarchy.

Cycles of inheritance are not allowed (and they do not make sense
anyway). So if cop\_type2 is a supertype of cop\_type1, cop\_type1 may
not be a supertype of cop\_type2. Note that the supertype-subtype
relation is transitive, so if *a := b* indicates a supertype relation
where *b* is supertype of *a*, the following is forbidden as well:

    a := b.
    b := c.
    c := a.

In the supertype hierarchy above, *c* is a supertype of *a* through *b*.
So *a* cannot be a supertype of *c*

**CAREFUL!!!!!!**

Validation does not check whether constraints on supertypes and subtypes
are compatible. This means that grammars with such errors can be created
by the customization system, **but they will not load in lkb and cannot
be compiled to work with PET or ACE**. An example of this would be the
following:

    CopType 1
    Type name: regular-adj-comp-pl
    supertype: regular-adj-comp-sg
    
    CopType 2
    Type name: regular-adj-comp-sg
    This copula constrains its subject to be singular.

The regular-adj-comp-pl copula will inherit the property
Feature:subject:singular from the regular-adj-comp-sg copula, but have
the additional property of Feature:subject:plural from its own
definition. This results in an ill-defined type, and should be avoided.

There is a bug report for this problem, but it is extremely hard to
implement so that it works at the time of validation. So for now and the
near future: **pay attention while defining inheritance!**

### Complement Type

Choose the part of speech type that can appear as a complement to this
copula type. Options are *NPs*, or Noun Phrases; *PPs*, or Prepositional
Phrases; and *APs*, or Adjective Phrases. Currently, the only available
option is *APs*, which generates a copula type in the output grammar
with its complement constrained to be an adjective.

### Features

### Stems

Here you can define the actual stems of copulas belonging to a given
class. You can add as many stems per auxiliary class as you want.

Copulas are analyzed as having empty semantics, so there is not an
option for copula predicates.

### Morphotactic Constraints

**NOTE**: morphotactic constraints on copulas are still under
development and may not work as intended.

This part of the lexicon library allows you to define interactions with
morphotactics, which morphemes are required and which are forbidden to
combine with a given lexical type.

When you click either of the buttons, a constraint description appears
with a drop-down menu. The position classes and morphological rules
defined for verbs on the [Morphology
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
appear in the drop-down. Select a class to define the constraint. You
can define as many constraints as necessary.

A Require constraint makes sure the lexical item is only accepted as a
word after combining with a morpheme belonging to the selected position
class or an instance of the selected lexical rule (depending on whether
a position class or lexical rule was selected).

A Forbid constraint makes sure the lexical item cannot combine with a
morpheme belonging to the selected position class or an instance of the
selected lexical rule (depending on whether a position class or lexical
rule was selected).

## Determiners

The following information can be provided for each determiner:

- Type name
- Stems
- Features
- Morphotactic constraints

### Type name

Defines the name of the class of auxiliaries (similar to nouns, verbs
and determiners). It should be noted that:

- The suffix *-determiner-lex* will be added to the given name, e.g.
*def* becomes *def-determiner-lex* and *def-det*,
*def-det-determiner-lex*
- Determiner types without a type name will be numbered:
*det1-determiner-lex*, *det2-determiner-lex*, etc.
- Good engineering style: pick transparent names, such as *definite*
and *def-nom-sg*, *indef-fem-erg* rather than cryptic names

### Stems

Here you can define the actual stems of determiners belonging to a given
class. You can add as many determiner stems per class as you want.

For each determiner stem, spelling and a predicate must be provided.
After you fill out the spelling and hit tab, a predicate name based on
the stem and MRS standards is suggested. This has the following form:

    Spelling: myStem     Predicate: _myStem_q_rel

You can change the predicate if you like, but it is recommended to stick
to the conventions of starting with \_ and ending quantifier relations
by \_q\_rel.

### Features

The Feature option for determiners has two fields *name* and *value*.
You can select a feature under *name* and its value(s) under *value*.

The drop-boxes will show features and values based on what was filled
out at the pages
[Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person),
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number),
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender),
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case),
and [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features).
The first four libraries
([Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person),
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number),
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender),
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case))
each define features typically appropriate for nouns, which can also be
assigned to determiners. [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
allows you to define customized features. These features can be assigned
to nouns, verbs or both. Features that are defined for both categories
or for nouns will appear in the drop-box.

Select the feature you want to specify from the left drop-box.
Appropriate values will appear in the right drop-box. Each value is
preceded by a check box. You can select as many values as you want for
each feature (but note that selecting all values leads to the same
behavior as not specifying a feature value pair at all).

If you select more than one value for a feature, the determiner class
will assign an underspecified value to the feature that may unify with
any of the selected values. The customization system will adapt the type
hierarchy of the feature value accordingly. See the [analysis
section](/MatrixDoc/Lexicon#A_Features_Analyses) for an example of the
impact on the type hierarchy.

### Morphological constraints

This part of the lexicon library allows you to define interactions with
morphotactics, which morphemes are required and which are forbidden to
combine with a given lexical type.

When you click either of the buttons, a constraint description appears
with a drop-down menu. The position classes and morphological rules
defined for determiners on the [Morphology
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
appear in the drop-down. Select a class to define the constraint. You
can define as many constraints as necessary.

A Require constraint makes sure the lexical item is only accepted as a
word after combining with a morpheme belonging to the selected position
class or an instance of the selected lexical rule (depending on whether
a position class or lexical rule was selected).

A Forbid constraint makes sure the lexical item cannot combine with a
morpheme belonging to the selected position class or an instance of the
selected lexical rule (depending on whether a position class or lexical
rule was selected).

## Case Marking Adpositions

This part of the [Lexicon
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
allows you to define case marking adpositions. Unlike the other lexical
items on this page, you cannot define an adposition class, but only
individual adpositions with grammmatical properties.

You can provide the following information for each adposition:

- Spelling
- Optionality or not
- Order (before or after the noun)
- Features

Note that these adpositions are meant to fill the role of case markers.
They thus have no predicates of their own. If the adposition is
optional, check the check box before 'optional' in the sentence
following *Spelling*.

You can indicate whether the adposition is a preposition or postposition
by indicating whether it appears before or after the noun phrase.

### Features

The Feature option for case-marking adpositions has two fields *name*
and *value*. You can select a feature under *name* and its value(s)
under *value*.

The drop-boxes will show features and values based on what was filled
out at the pages
[Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person),
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number),
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender),
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case),
and [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features).
The first four libraries
([Person](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=person),
[Number](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=number),
[Gender](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=gender),
[Case](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=case))
each define features typically appropriate for nouns, which can all be
defined on adpositions. [Other
Features](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=other-features)
allows you to define customized features. These features can be assigned
to nouns, verbs or both. Features that are defined for both categories
or for nouns will appear in the drop-box.

Select the feature you want to specify from the left drop-box.
Appropriate values will appear in the right drop-box. Each value is
preceded by a check box. You can select as many values as you want for
each feature (but note that selecting all values leads to the same
behavior as not specifying a feature value pair at all).

If you select more than one value for a feature, the adposition will
assign an underspecified value to the feature that may unify with any of
the selected values. The customization system will adapt the type
hierarchy of the feature value accordingly. See the [analysis
section](/MatrixDoc/Lexicon#A_Features_Analyses) for an example of the
impact on the type hierarchy.

# Analyses

## General: Introduced underspecification of feature values

If you select more than one value for a feature, the noun class will
assign an underspecified value to the feature that may unify with any of
the selected values. The customization system will adapt the type
hierarchy of the feature value accordingly.

For instance, the basic customized hierarchy for the option
'first-second-third' person and 'none' first person distinction will
look as follows:

    person := avm.
    1st := person.
    2nd := person.
    3rd := person.

If you define the following Feature-value pair:

    Feature: PERSON value [x] 1st []2nd [x]3rd

The hierarchy will look like this:

    person := avm.
    2nd := person.
    non-2nd := person.
    1st := non-2nd.
    3rd := non-2nd.

The resulting noun class will bear the feature-value pair \[PERSON
non-2nd\]

## Nouns

### Generally included: Argument structure

A basic type for noun-phrases is introduced in the grammar. It looks as
follows:

    noun-lex := basic-noun-lex & basic-one-arg & no-hcons-lex-item &
       [ SYNSEM.LOCAL [ CAT.VAL [ SPR < #spr & [ LOCAL.CAT.HEAD det ] >,
                                  COMPS < >,
                                  SUBJ < >,
                                  SPEC < > ] ],
         ARG-ST < #spr > ].

It inherits from three matrix.tdl types: *basic-noun-lex*,
*basic-one-arg* and *no-hcons-lex-item*.

- *basic-noun-lex* inherits from *norm-sem-lex-item* and introduces
the features \[ HEAD noun \], and \[ KEYREL noun-relation \]. All
together, this makes sure that the nouns have standard semantics
(introducing one relation) and have a referential index (which can
bear features for person, number, gender).
- *basic-one-arg* and *no-hcons-lex-item* reflect that the
customization system currently does not support nouns with arguments
of their own, or funky semantics for nouns involving scope

The argument structure makes it select for a specifier of category
*determiner* (\[HEAD det\]). Note that this also applies to languages
that do not have determiners: in these languages, all nouns will use the
*bare-np-phrase* rule to cancel the determiner from the argument list.
The application of the bare-np-rule is regulated through the feature \[
OPT bool \] on the synsem of the specifier. The bare-np-rule can only
apply when the determiner on the argument list is \[ OPT + \], the
head-specifier rule combining determiners with nouns, requires \[ OPT -
\] (which is added to the rule if the language has determiners, and
nouns that cannot take one are defined in the questionnaire).

If all nouns in the language have the same requirements towards
determiners (i.e. they are always obligatory, always impossible or
always optional) the required constraint is regulated on the basic
definition of *noun-lex* as follows (in partial structures of the
*noun-lex* type presented above):

    always obligatory determiners:
    noun-lex := ...
     [ SYNSEM.LOCAL [ CAT.VAL [ SPR < #spr & [ LOCAL.CAT.HEAD det,
                                               OPT - ] >,
      .... ].
    
    determiners are never allowed:
    noun-lex := ...
     [ SYNSEM.LOCAL [ CAT.VAL [ SPR < #spr & [ LOCAL.CAT.HEAD det,
                                               OPT + ] >,
      .... ].
    
    determiners are always optional:
    noun-lex := ...
     [ SYNSEM.LOCAL [ CAT.VAL [ SPR < #spr & [ LOCAL.CAT.HEAD det ] >,
      .... ].

In the first case, the *bare-np-phrase* cannot apply, but the
*spr-head-phrase* can combine the noun with a determiner. The \[ OPT +
\] feature blocks the *spr-head-phrase*, forcing the *bare-np-phrase* to
apply to create NPs (even if the language has determiners, nouns can
only be part of *bare-np-phrases* in this case). If they are always
optional, the \[ OPT bool \] feature remains underspecified, so that
both rules can apply.

If restrictions towards determiners vary, subtypes of *noun-lex*
introducing the right constraints are introduced:

    If obligatory determiners occur:
    obl-spr-noun-lex := noun-lex &
      [ SYNSEM.LOCAL.CAT.VAL.SPR < [ OPT - ] > ].
    
    If nouns for which determiners are impossible occur:
    no-spr-noun-lex := noun-lex &
      [ SYNSEM.LOCAL.CAT.VAL.SPR < [ OPT + ] > ].

### Generally included: Case Marking

If the language has case, the feature \[ CASE case \] is added to the
head-type noun as an addendum:

    noun :+ [ CASE case ]

### Noun Class Specific: Type Name

The name provided to the class will serve as the type identifier in the
lexicon with the suffix indicated above.

If a type has supertypes identified on the [Lexicon
page](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon),
these will be the only supertypes it receives. Else, the following
supertypes will be provided:

### Noun Class Specific: Supertypes

The supertypes of a noun class depend on:

- its behavior towards determiners
- its user-specified supertypes
- the behavior of the supertype towards determiners

The noun class will only have *noun-lex* as supertype if either of the
following applies:

- no supertypes were assigned in the questionnaire and all nouns
behave the same towards determiners in the language
- no supertypes were assigned and the behavior of the type towards
determiners was underspecified in the questionnaire
- no supertypes were assigned and determiners are optional

Else if no supertypes are defined, it will inherit from the
*obl-spr-noun-lex* or *no-spr-noun-lex*, depending on which is
applicable according to its behavior towards determiners.

If specific supertypes are defined on the questionnaire, they will
appear as supertypes of the noun-class. Additionally, the noun class may
take *obl-spr-noun-lex* or *no-spr-noun-lex* as a supertype. This
happens when **all** supertypes have underspecified behavior towards
determiners, and the noun class itself either has obligatory determiners
or cannot occur with them at all.

### Noun Class Specific: Feature values

All features associated with the noun class will be added to the
language specific type definition.

- \[ CASE \] restrictions are added to \[ SYNSEM.LOCAL.CAT.HEAD.CASE
\]
- \[ PER, NUM, GEND \] are added to \[
SYNSEM.LOCAL.CONT.HOOK.INDEX.PNG.PER \], \[
SYNSEM.LOCAL.CONT.HOOK.INDEX.PNG.NUM \] and \[
SYNSEM.LOCAL.CONT.HOOK.INDEX.PNG.GEND \], respectively

See *General: Introduced underspecification of feature values* to see
how the hierarchy is modified to include underspecified features, if you
define multiple values to a feature. The created underspecified value is
assigned to the feature in this case.

### Noun Class Specific: Stems and Predicates

For each stem 'my\_stem' and predicate 'my\_pred' belonging to noun
class 'my\_nclass' will be added to the lexicon:

    my_stem := my_nclass &
    [ STEM < "my_stem" >,
      SYNSEM.LKEYS.KEYREL.PRED "my_pred" ].

If several words with the same stem occur in the language, the stem
identifiers (*my\_stem* left of the assignment sign *:=* in the
representation above) receive numbers.

## Verbs

### General: basic type definitions

If the language has auxiliaries, the addenda include:

    ﻿head :+ [ AUX bool ].

The following basic types for verbs are included:

    verb-lex := non-mod-lex-item &
                     [ SYNSEM.LOCAL.CAT.HEAD verb ].
    
    main-verb-lex := verb-lex & basic-verb-lex &
           [ SYNSEM.LOCAL [ CAT [ VAL [ SPR < >,
                                        SPEC < >,
                                        SUBJ < #subj > ],
                                  HEAD.AUX - ],
                            CONT.HOOK.XARG #xarg ],
             ARG-ST < #subj &
                      [ LOCAL [ CAT.VAL [ SPR < >,
                                          COMPS < > ],
                                CONT.HOOK.INDEX #xarg ] ], ... > ].
    aux-lex := verb-lex &
                    [ SYNSEM.LOCAL.CAT.HEAD.AUX + ].

Else, if there are no auxiliaries, only the following will be included:

    verb-lex := verb-lex & basic-verb-lex &
           [ SYNSEM.LOCAL [ CAT.VAL [ SPR < >,
                                      SPEC < >,
                                      SUBJ < #subj > ],
                            CONT.HOOK.XARG #xarg ],
             ARG-ST < #subj &
                      [ LOCAL [ CAT.VAL [ SPR < >,
                                          COMPS < > ],
                                CONT.HOOK.INDEX #xarg ] ], ... > ].

*basic-verb-lex* is a definition from matrix.tdl, defining standard
semantics \[ KEY-REL event-relation \] and \[ HEAD verb \].

The basic types for intransitive and transitive verbs are the following
(where mainorverbtype stands for *main-verb-lex* when the language has
auxiliaries and *verb-lex* when it does not:

    intransitive-verb-lex := mainorverbtype  & intransitive-lex-item &
           [ SYNSEM.LOCAL.CAT.VAL.COMPS < > ].
    
    
    transitive-verb-lex := mainorverbtype & transitive-lex-item &
           [ SYNSEM.LOCAL.CAT.VAL.COMPS < #comps >,
             ARG-ST < [ ],
                      #comps &
                      [ LOCAL.CAT [ VAL [ SPR < >,
                                          COMPS < > ] ] ] > ].

### Verb Class Specific: Supertypes

The supertypes of a verb class depend on:

- its argument structure
- its user-specified supertypes
- the argument structure of its supertypes

The verb class will only have *main-verb-lex* (if the language has
auxiliaries) or *verb-lex* (if the languages does not have auxiliaries)
as supertype if no supertypes are defined for the verb

Else if no supertypes are defined, it will inherit from the
*obl-spr-noun-lex* or *no-spr-noun-lex*, depending on which is
applicable according to its behavior towards determiners.

If specific supertypes are defined on the questionnaire, they will
appear as supertypes of the noun-class. Additionally, the noun class may
take *obl-spr-noun-lex* or *no-spr-noun-lex* as a supertype. This
happens when **all** supertypes have underspecified behavior towards
determiners, and the noun class itself either has obligatory determiners
or cannot occur with them at all.

### General: case marking

If the language has case marking, subtypes representing the basic case
patterns of the languages are added to the language. A few examples are
given below:

    nominative accusative language:
    
    nom-intransitive-lex := intransitive-lex-item &
      [ ARG-ST.FIRST.LOCAL.CAT.HEAD noun & [ CASE nom ]].
    
    nom-acc-transitive-lex := transitive-lex-item &
      [ ARG-ST < [ LOCAL.CAT.HEAD noun & [ CASE nom ] ], [ LOCAL.CAT.HEAD noun & [ CASE acc ] ] > ].
    
    
    ergative language:
    
    abs-intransitive-lex := intransitive-lex-item &
      [ ARG-ST.FIRST.LOCAL.CAT.HEAD noun & [ CASE abs ]].
    
    erg-abs-transitive-lex := transitive-lex-item &
      [ ARG-ST < [ LOCAL.CAT.HEAD noun & [ CASE erg ] ], [ LOCAL.CAT.HEAD noun & [ CASE abs ] ] > ].

### Verb class specific: supertypes

The supertype of a verb depends on its argument structure and the
supertypes defined on the questionnaire. Verb classes inherit from the
argument-structure types described above as well as the user-defined
supertypes.

## Auxiliaries

Depending on the definition of the complement of the verbal complement
of auxiliaries on the word order page, one of the following basic types
will be provided:

    sentential complements:
    aux-lex := basic-one-arg &
                  [ SYNSEM.LOCAL.CAT.VAL [ SUBJ < >,
                                           COMPS < #comps > ],
                    ARG-ST < #comps & [ LOCAL.CAT [ VAL [ SUBJ < >,
                                                          COMPS < >,
                                                           SPR < >,
                                                           SPEC < > ],
                                                    HEAD verb ]] > ].
    
    
    vp complements:
    aux-lex := trans-first-arg-raising-lex-item  &
                         [ SYNSEM.LOCAL.CAT.VAL.COMPS < #comps >,
                           ARG-ST < [ ],
                                    #comps &
                                    [ LOCAL.CAT [ VAL [ SUBJ < [ ] >,
                                                        COMPS < >,
                                                        SPR < >,
                                                        SPEC < > ],
                                                  HEAD verb ]] > ].
    
    v complements:
    aux-lex := basic-two-arg &
                 [ SYNSEM.LOCAL.CAT.VAL.COMPS < #comps . #vcomps >,
                   ARG-ST < [ ],
                          #comps &
                          [ LIGHT +,
                            LOCAL [ CAT [ VAL [ SUBJ < [ ] >,
                                                COMPS #vcomps ],
                                          HEAD verb ],
                                    CONT.HOOK.XARG #xarg ]] > ].

For vp-complements, the subject is raised (which is defined on the
supertype it takes).

The subject of verbs taking v-complements is underspecified. Its
definition depends on the case restrictions defined for subjects of the
auxiliary.

## Determiners

The following basic type is introduced for determiners:

    determiner-lex := basic-determiner-lex & basic-zero-arg &
              [ SYNSEM.LOCAL.CAT.VAL [ SPR < >,
                                       COMPS < >,
                                       SUBJ < > ]].

The type inherits from *basic-zero-arg* (the customization system only
covers determiners that do not take any arguments for now) and
*basic-determiner-lex* in matrix.tdl. The definition of
*basic-determiner-lex* in matrix.tdl is the following:

    basic-determiner-lex := norm-hook-lex-item &
      [ SYNSEM [ LOCAL [ CAT [ HEAD det,
                               VAL.SPEC.FIRST.LOCAL.CONT.HOOK [ INDEX #ind,
                                                                LTOP #larg ]],
                         CONT [ HCONS <! qeq &
                                       [ HARG #harg,
                                         LARG #larg ] !>,
                                RELS <! relation !> ] ],
                 LKEYS.KEYREL quant-relation &
                       [ ARG0 #ind,
                         RSTR #harg ] ] ].

The most important property of this type is that it defines the
quantifier relation of the determiner over the noun. The index of the
determiner \[ ARG0 \#ind \] and \[ SPEC....INDEX \#ind \] on the noun
are identical. The HARG (corresponding to the RSTR imposed by the
semantics of the determiner) has scope over its LARG, which is identical
to the LTOP of the noun.

## Case Marking Adpositions

The basic type for case marking adpositions is presented below:

    case-marking-adp-lex := basic-one-arg & raise-sem-lex-item &
              [ SYNSEM.LOCAL.CAT [ HEAD adp & [ CASE #case, MOD < > ],
                                   VAL [ SPR < >,
                                         SUBJ < >,
                                         COMPS < #comps >,
                                         SPEC < > ]],
                ARG-ST < #comps & [ LOCAL.CAT [ HEAD noun & [ CASE #case ],
                                                VAL.SPR < > ]] > ].

The restruction on the SPR of the ARG-ST makes sure the adposition only
takes NPs (not Ns) as an argument. Note that these adpositions are pure
case-markers, they do not assign CASE to their NP complement, but they
share a CASE value with the noun they are combined with.

# References

Delancey, S. (2009). [Bipartite Verbs in Languages of Western North
America](http://www.academia.edu/226407/Bipartite_verbs_in_languages_of_western_North_America).
In A. Filchenko and O. Potanina, (eds.), Time and Space in Languages of
Various Typology. Proceedings of the XXV International Conference
"Dulson Readings”. Tomsk: Tomsk State Pedagogical University.

- bibtex:
  
  @article{Delancey:2009,\
author = {Scott Delancey},\
year = {2009},\
title = {Bipartite Verbs in Languages of Western North America},\
conference = {In proceedings of the XXV International Conference
"Dulson Readings”: Time and Space in Languages of Various
Typology},\
editors = {A. Filchenko and O. Potanina},\
publisher = {Tomsk: Tomsk State Pedagogical University}\
}

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

Jacobsen, W. H. (1980). Washo bipartite verb stems. In K. Klar, M.
Langdon, & S. Silver (Eds.), *Trends in Linguistics: Studies and
Monographs 16: American Indian and Indoeuropean Studies: Papers in Honor
of Madison S. Beeler* (pp. 85-99). The Hague: Mouton.

- bibtex:
  
  @incollection{Jacobsen:1980,\
author = {William H. Jacobsen},\
year = {1980},\
title = {Washo bipartite verb stems},\
booktitle = {Trends in Linguistics: Studies and Monographs 16:
American Indian and Indoeuropean Studies: Papers in Honor of
Madison S. Beeler},\
editors = {K. Klar, M. Langdon, and S. Silver},\
pages = {85-99},\
publisher = {The Hague: Mouton}\
}

Last update: 2018-01-04 by OlgaZamaraeva [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_Lexicon/_edit)]{% endraw %}