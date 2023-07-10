{% raw %}# Documentation for the Grammar Matrix Customization Word Order Library

## Versions 16 – 22

By AntskeFokkens (previously published as a
tech-report: Fokkens
(2010),[.bib](http://www.coli.uni-saarland.de/~afokkens/bibentries/fokkens-10.bib))

# Introduction

This document presents background information on the word order library
of the Grammar Matrix Customization System (Bender et al., 2002; Bender
and Flickinger, 2005; Bender et al., 2010). General instructions on
using the questionnaire can be found [here](https://delph-in.github.io/docs/matrix/MatrixDocTop).

# Citing the Word Order Library

The standard reference for the Word Order Library and its
implementations is Fokkens (2010). The full reference can be found
[here](/MatrixDoc/WordOrder#References).

# Word Order Options

This section provides basic guidelines to help users fill out the [Word
Order](http://matrix.ling.washington.edu/customize/matrix.cgi?subpage=word-order)
page of the customization system.

## Pattern of basic main clause word order

The first question on the word order page refers to the order of
subject, object and verb in the language. The implementations are
strict: when SOV is chosen, the grammar will only accept structures
where the order is Subject-Object-Verb. As the questionnaire page
describes, we ask for the pattern that best describes the word order in
your language.

The word order analyses are still under development. We are aware that
many (or even most) languages have word order restrictions that are
somewhere in between a rigid order of elements and completely free word
order, and are not accurately described by any of the patterns proposed
for now. When doubting what would be the best choice for your language,
it may be helpful to look whether one of the patterns would allow the
grammar to parse most simple sentences in the language. If this is the
case, it is probably easiest to choose this pattern, and add adapt/add
phrases to provide analyses for less common word orders. If your
language uses two or three of the proposed patterns frequently, but does
not allow other word orders, it probably also easiest to start with one
of these patterns, and adapt/add phrases accordingly. If word order in
your language has constraints that are not related to the main
constituents (subject, object, verb), starting with free word order and
adapting/adding constraints is probably your best choice.

Analyses for verb-second order are currently under development and the
explanations provided above do not necessarily apply to customized
grammars with this word order. The choice of complement determines what
may occur in the first position, before the conjugated verb, VPs or Vs.
Sentential complements are not possible for this word order. We are
aware that the current possibilities are too restrictive, future plans
will be addressed [below](/MatrixDoc/WordOrder#Upcoming_Work).

## Auxiliary-verb order

There are three aspects that (may) influence the position of auxiliaries
in the customization system’s present implementation. In addition to the
word order option of the auxiliary following or preceding the verb, the
kind of complement and restrictions on the number of auxiliaries in the
clause can have an impact on the permitted word orders of the starter
grammar.

The kind of complement chosen influences word order if the word order
between the auxiliary and its complement is disharmonic compared to the
order of the main verb and its arguments. Disharmonic word order occurs
when the auxiliary precedes its complement whereas main verbs follow
their object, or vice versa. If an auxiliary precedes a V-complement and
the main-verb follows its object, the relative order of the three
elements concerned is Object - Auxiliary - Verb. In case of a VP or S
complement, the relative order would be Auxiliary - Object - Verb.
Likewise, the relative position between the subject and auxiliary
changes if auxiliary-complement and head-subject order is disharmonic
depending on the auxiliary taking S-complement on the one hand, or a VP
or V-complement on the other hand.

Languages with basic VSO or OSV order form a special case: the
customization system assumes that relative word order for these
languages is Auxiliary-SVO and OVS-Auxiliary, respectively, for harmonic
word order when the auxiliary takes VP-complements. This assumption is
based on Irish and Welsh data (see among others O’Siadhail (1989) and
King (2003)). Disharmonic word order and VP-complements are not allowed,
because without evidence for such behavior in a particular language, it
is not clear what word order the language would exhibit.

An additional question that may influence word order relates to the
restriction of more than one auxiliary in a sentence. Using our current
implementation for free word order, we cannot produce a grammar that
allows more than two verb forms in a sentence that occur in complete
free order without introducing spurious ambiguity. Complete free word
order is therefore (at present) only allowed when the language allows
only one auxiliary to occur per clause. Else, the grammar obliges
auxiliaries to be immediately adjacent to their complement, i.e. the
verbal forms are placed in a verbal cluster. We are not aware of
languages allowing multiple auxiliaries per clause that do not form a
verbal cluster, but we know that the current possibilities do not cover
all languages: Bulgarian clauses may contain two verbal clusters, our
grammars only allow for one.

# Word order analyses

In this section, I will provide an overview of the analyses provided
through the word order library. The information provided here is mainly
of interest to users new to grammar engineering with the LKB (Copestake,
2002), or who are unfamiliar with the Grammar Matrix.

## Basic Word Order

Word order properties are mainly handled by the phrasal types that
combine words and phrases into larger constituents. Subcategorizarion
properties, semantics and the sharing of properties between the phrase
and its head-daughter are all defined in matrix.tdl types. The
head-complement-phrase, head-subject-phrase and head-specifier-phrase in
an individual grammar inherit these properties from matrix.tdl. Each
headed phrase in the starter grammar additionally inherits from
head-final or head-initial, matrix.tdl types that define whether the
head daughter follows or, respectively, precedes the non-head daughter.

### SOV, VOS, SVO and OVS word order

In addition to the choice of head-final and head-initial, basic word
order facts are influenced by the permitted moment of application of a
phrase. For grammars with SOV, VOS, SVO or OVS word order, the
head-subject-phrase has a constraint \[COMPS &lt; &gt;\] on the
head-daughter’s valency. This constraint ensures that the complement
list of the head-daughter must be saturated for the subject and
complement to combine. As a consequence, the subject-head-rule cannot
apply before all subcategorized objects are found. This excludes word
orders where the subject is placed in between the verb and one of its
objects.

### VSO and OSV word order

The implementation for VSO and OSV languages depends on whether the
language has auxiliaries or not. If no auxiliary properties are
assigned, the grammars add the constraint \[SUBJ &lt; &gt;\] to the
valency lists of head-daughters of head-complement-phrases. This
constraint prevents verbs from combining with an object before picking
up their subject. As a consequence, objects may not be placed between
the verb and its subject.

This approach no longer works when accommodating auxiliary structures
for languages where the auxiliary takes a VP-complement. In that case,
the position of the subject is guaranteed by the requirement that the
head-daughter may not have combined with any other elements before
picking up their subject. This behavior is achieved by the features
LIGHT and HC-LIGHT. Head-subject phrases must have a daughter that has a
(local) value of \[LIGHT +\]. The value of LIGHT in a phrase is always
identical to the HC-LIGHT value of its head-daughter. Verbs in VSO and
OSV languages have the property \[HC-LIGHT −\] as part of their category
information. When they become head of a phrase, this phrase will be
\[LIGHT −\], preventing the newly formed phrase to become head of a
phrase requiring \[LIGHT +\] head-daughters, such as the
head-subject-phrase.

### Verb-initial and verb-final word order

Verb-initial or verb-final word order is achieved by creating
head-initial or head-final phrases, respectively, for both
head-subject-phrases and head-complement-phrases without any of the
additional constraints explained above.

### Free word order

Free word order requires some additional manipulations compared to the
more restrictive orders. It is not a good solution to simply provide
unconstrained rules in both directions for free word order languages,
because this would introduce massive spurious ambiguity. At each point,
the grammar can create trees where the head combines with elements to
its left and trees where it combines with elements to its right until
the sentence is parsed. If the input sentence is grammatical, none of
these trees will lead to a failure. We therefore force the verb to first
combine with all elements on its right and then with all elements to its
left.

The idea behind the analysis is that as soon as a head-final-rule has
been applied in a parse, all head-initial-rules are blocked from
applying. The customization system adds a new feature \[ATTACH xmod\] to
the synsem in the language specific file. The value xmod is defined in
the grammar matrix with a similar purpose in mind to deal with flexible
word order of modifiers.

For both head-initial and head-final phrases, a subtype is introduced,
called head-initial-head-nexus and head-final-head-nexus, respectively.
The head-initial-head-nexus phrases introduce the constraint \[ATTACH
notmod-or-lmod\] on their head-daughter’s synsem, and the feature-value
pair \[ATTACH lmod\] on their own synsem. The value notmod-or-lmod
unifies with lmod, so head-initial-head-nexus phrases can apply
sequentially until all arguments right of the head are found.

The head-final-head-nexus phrase applies no constraints to the
ATTACH-feature of its head-daughter, allowing it to apply any time. The
phrase itself is \[ATTACH rmod\]. The value rmod does not unify with
notmod-or-lmod preventing head-initial-head-nexus phrases from applying
after a head-final-head-nexus phrase has applied.

All head-final phrases inherit from head-final-head-nexus, and all
head-initial phrases from head-initial-head-nexus. As a result,
head-initial phrases can never apply after a head-final phrase has
applied.

### Verb-second word order

The concept behind our current verb-second implementation is similar to
the idea behind free word order. Verb second clauses are built by
letting the verb combine with all elements present on its right, and
exactly one element on its left. The implementation behind it, however,
differs from free word order. The category feature MC (‘main-clause’) is
used to register whether the structure is verb-initial, or verb-second.
Originally meant to distinguish main clause from subordinate clause, MC
is used in this case to register which rule last applied. The main idea
is that we want only one constituent before the verb that heads the
sentence, and achieve this by making sure the head of a clause cannot
attach to any other element as soon as it has been head-final once.
Verbs start out with the value \[MC na\]. Both head-final and
head-initial rules require this value on their head-daughter. The value
of MC is passed up to the mother, each time a head-initial rule applies.
The head-final rule, on the other hand, assigns the value bool (for
boolean) to MC, so that neither head-final rules, nor head-initial rules
can apply thereafter. The file roots.tdl specifies that only sentences
with the value \[MC +\] are acceptable main clauses. The grammar will
thus only accept sentences where the head-final rule has applied exactly
once, placing the head of the sentence in second position.

## Auxiliary Word Order - VP-complements

Auxiliaries are combined with their complement using the
basic-head-complement-phrase that (among others) also combines verbs
with their object. Your language.tdl file contains a general type
representing auxiliaries which specifies that their verbal complement
must have an empty complement list (\[VAL.COMPS &lt;
\[LOCAL.CAT.VAL.COMPS &lt; &gt;\] &gt; \]).

### SOV, VOS, SVO, OVS word order

When auxiliary-complement order and verb-object order are harmonic (i.e.
identical), the grammar does not contain any additions to word order
rules or constraints to ensure its correct behavior. Disharmonic order
is implemented as follows. First, the grammar will contain two
head-complement-phrases: one that has head-final and one with
head-initial word order. The rule that represents auxiliary-complement
order is restricted to apply to head-daughters with a head feature value
\[HEAD verb & \[ AUX + \]\] only. The head-complement-rule that is used
to combine the main verb with its object will bear the constraint \[AUX
−\] on its head-daughter.

### VSO and OSV word order

For VSO, it is predicted that auxiliaries following a vp-comp do not
occur, the same holds for vp-comp-preceding auxiliaries in
OSV-languages. VSO and OSV word order is implemented using the
constraint \[VAL.SUBJ &lt; &gt;\] on the head-daughter of the
head-complement-phrase, preventing the rule from applying when the head
is still looking for a subject. An auxiliary taking VP-complements must
combine with its complement before picking up its subject, which is not
compatible with this standard analysis. The current implementation for
VSO and OSV languages with auxiliaries taking VP-complements removes the
\[VAL.SUBJ &lt; &gt;\] constraint from the head-complement-phrase, and
restrains the head-subject-phrase instead. All verbs get a \[LIGHT +\]
and a \[HC-LIGHT −\] feature-value pair. Head-complement-phrases obtain
their LIGHT value from the HC-LIGHT feature of their head-daughter (a
standard constraint specified in matrix.tdl). Verb phrases are thus
\[LIGHT +\] until the head-complement-rule has applied to them, after
which they are \[LIGHT −\]. The head-subject-phrase can only have a
head-daughter which is \[LIGHT +\], ensuring that the
head-subject-phrase only applies to heads that have not combined with a
complement yet.

### Verb-initial and verb-final word order

We assume that verb-final and verb-initial languages form a verbal
cluster when auxiliaries are present in the clause. This must still be
confirmed by typological research. When verb-initial has preceding
auxiliaries, or verb-final complement following auxiliaries, we use the
general verbal cluster analysis to solve this. This is developed to
ensure auxiliaries pick up their verbal complements before picking up
other complements and/or their subject. It is both used to get the right
distribution and to prevent spurious ambiguity.

The feature \[VC luk\] is introduced to the synsem in languages that
form verbal clusters (luk (Flickinger, 2000) is defined in matrix.tdl
and a supertype of bool (for ’boolean’)). Lexical rules simply pass the
value of VC up. The analysis adds a constraint to the
head-complement-phrase which makes the value of the VC feature of a
phrase identical to that of the non-head-daughter. This way, it can keep
track whether a specific complement (being \[VC +\]) has already been
taken up in the phrase. Main verbs are \[VC +\], auxiliaries are \[VC
−\]. By stating that the head-daughter of head-complement- and
head-subject- phrases must be \[VC +\], auxiliaries can only become the
head of such phrases if they have combined with a main verb, or an
auxiliary that has done so (or with an auxiliary combined with an
auxiliary combined with main verb, etc.). If the auxiliary complement
order is not harmonic (i.e. verb-initial with following auxiliaries, or
verb-final with preceding auxiliaries), the head-complement-phrase
combining the verb with its object is restricted to be \[AUX −\]. The
head-complement-phrase that allows auxiliaries to combine (in opposite
direction as usual) has the additional constraint that the subject list
is not empty (\[VAL.SUBJ &lt; \[ \] &gt;\]), excluding structures where
the subject stands between the verbs. This implementation is provided
for sake of completeness, but, intuitively, it seems not very likely
that there are languages that show this behavior.

### Free word order

No additional rules are needed to parse auxiliary-complement structures
in free word order languages, if the auxiliary takes a VP complement.
The head-complement-phrase representing the disallowed
auxiliary-complement word order4 bears the constraint \[AUX −\],
preventing auxiliaries from becoming head of such phrases.

### Verb second word order

No additional constraints or rules are provided for verb second
languages. The question on auxiliary-complement word order is currently
ignored by the system (see below for more information on planned
implementations).

## Auxiliary Word Order - V-complements

Auxiliaries are combined with their complement using the
basic-head-complement-phrase that (among others) also combines verbs
with their object. Your language.tdl file contains a general type
representing auxiliaries which specifies that their verbal complement
must be \[LIGHT +\] (\[ VAL.COMPS &lt; \[LOCAL.LIGHT +\] &gt;\]). Main
verbs have the category property to be \[HC-LIGHT −\]. This creates
\[LIGHT −\] verb-phrases as soon as a main verb has combined with a
complement or subject. This ensures that verbs cannot combine with the
auxiliary after taking up their object, or subject. The auxiliary adds
all elements from its complements COMPS-list to its own COMPS-list, i.e.
it raises all complements (\[VAL.COMPS &lt; \[LOCAL.CAT.VAL.COMPS
\#comps \] . \#comps &gt;\]).

The current web-interface forces users to choose one permissible word
order. If both orders occur, this can be obtained by removing the
constraint \[AUX −\] of the head-complement-phrase that bears it in the
grammar.

### SOV, VOS, SVO and OVS word order

If the auxiliary-complement order is harmonic to the verb-object order
(i.e. they are both head-final or both head-initial), the category of
auxiliaries bears the feature-value pair \[HC-LIGHT −\], just like main
verbs. Auxiliaries can only combine with complements (whether they are
main verbs or auxiliaries themselves) that have not combined with an
argument themselves. This restriction prevents spurious ambiguity from
occurring. If the auxiliary-complement and verb-object order are
disharmonic, a special auxiliary complement phrase (aux-comp-phrase) is
added to the grammar. This phrase inherits from the so-called
marker-comp-phrase in matrix.tdl. This phrase has been added to
matrix.tdl to accommodate structures with disharmonic auxiliary
word-order and will be explained briefly below.

The basic-marker-comp-phrase functions in the exact same manner as
basic-head-comp-phrase, except that the phrase does not share the value
of the feature HEAD from its marker-daughter (equivalent to the
head-daughter in a head-complement-phrase). Matrix.tdl also contains a
marker-initial-phrase and a marker-final-phrase, modeled after
head-initial and head-final to take care of the word order of the
marker-daughter and non-marker-daughter. In the case of disharmonic word
order between auxiliary-complement and verb-object structure, it is used
because, normally, both verbal and non-verbal complements are combined
with their head using the basic-head-complement-rule. When auxiliaries
have different word order constraints from main-verbs, the usual
solution is to introduce two head-complement-rules with different word
order, one restricted to head-daughters whose head is \[AUX −\], and one
restricted to \[AUX +\] head-daughters. However, when the auxiliary
takes V-complements, it raises the main verb’s complements. It will head
phrases that must combine with non-verbal complements using a
head-complement rule requiring \[AUX −\] head-daughters. For this
reason, we use an auxiliary-rule that does not share all head-features
with its head-daughter.

The aux-comp-phrase states that its marker-daughter’s head bears the
feature-value pair \[AUX +\], and that the non-marker-daughter must be a
verb (\[HEAD verb\]). Since the head-value of the marker-daughter is not
shared with the phrase, the value of the AUX remains underspecified. The
phrase does receive the value from the FORM-feature from its
marker-daughter. Auxiliaries can combine with their verbal complement
using the aux-comp-phrase. Because they have an underspecified
AUX-value, the newly created phrase may become head of a
head-complement-phrase which is restricted to head-daughters that are
\[AUX −\].

The aux-comp-phrase is always combined with the verbal cluster analysis,
which 10 makes sure that auxiliaries combine with verbal complements
before becoming a complement themselves. In this case, it is used to
prevent spurious ambiguity. The feature \[VC luk\] is introduced to
synsem. Lexical rules simply pass the value of VC up. The analysis adds
a constraint to the head-complement-phrase which makes the value of the
VC feature of a phrase identical to that of the non-head-daughter. This
way, it can keep track whether a specific complement (being \[VC +\])
has already been taken up in the phrase. Main verbs are \[VC +\],
auxiliaries are \[VC −\]. By stating that the head-daughter of
head-complement- and head-subject- phrases must be \[VC +\], auxiliaries
can only become the head of such phrases if they have combined with a
main verb, or an auxiliary that has done so (or with an auxiliary
combined with an auxiliary combined with main verb, etc.).

### VSO and OSV word order

When the grammar has VSO or OSV word order and auxiliaries take
V-complements, basic word order is implemented using the constraint
\[VAL.COMPS &lt; &gt;\] on the head-daughter of the subject-head-phrase,
as explained in Section 3.2.2. For VSO and OSV word order, the
customization system provides an analysis that creates verbal clusters.
This anaysis introduces the feature \[VC luk\] to synsem. Lexical rules
simply pass the value of VC up. The analysis adds a constraint to the
head-complement-phrase which makes the value of the VC feature of a
phrase identical to that of the non-head-daughter. This way, it can keep
track whether a specific complement (being \[VC +\]) has already been
taken up in the phrase. Main verbs are \[VC +\], auxiliaries are \[VC
−\]. By stating that the head-daughter of head-complement-phrases and
head-subject-phrases must be \[VC +\], auxiliaries can only become the
head of such phrases if they have combined with a main verb, or if their
complement is an auxiliary that has done so (or if their complement is
an auxiliary combined with an auxiliary combined with a main verb,
etc.).

When the language has harmonic word order between auxiliary-complement
and head-object phrases (i.e. both phrases are head-final, or both are
head-initial), the verbal cluster analysis is all that the grammar
contains to account for auxiliary word order. When the auxiliary follows
its complement in VSO, or precedes it in OSV, the grammar uses a special
aux-comp-phrase that inherits from marker-comp-phrase. The
basic-marker-comp-phrase functions in the exact same manner as
basic-head-comp-phrase, except that the phrase does not share the value
of the feature HEAD from its marker-daughter (equivalent to the
head-daughter in a head-complement-phrase). Matrix.tdl also contains a
marker-initial-phrase and a marker-final-phrase, modeled after
head-initial and head-final to take care of the word order of the
marker-daughter and non-marker-daughter. In the case of disharmonic word
order between auxiliary-complement and verb-object structure, it is used
because, normally, both verbal and non-verbal complements are combined
with their head using the basic-head-complement-rule. When auxiliaries
have different word order constraints from main-verbs, the usual
solution is to introduce two head-complement-rules with different word
order, one restricted to head-daughters whose head is \[AUX −\], and one
restricted to \[AUX +\] head-daughters. However, when the auxiliary
takes V-complements, it raises the main verb’s complements. It will head
phrases that must combine with non-verbal complements using a
head-complement rule requiring \[AUX −\] head-daughters. For this
reason, we use an auxiliary-rule that does not share all head-features
with its head-daughter.

The aux-comp-phrase states that its marker-daughter’s head bears the
feature-value pair \[AUX +\], and that the non-marker-daughter must be a
verb (\[HEAD verb\]). Since the head-value of the marker-daughter is not
shared with the phrase, the value of the AUX remains underspecified. The
phrase does receive the value from the FORM-feature from its
marker-daughter. Auxiliaries can combine with their verbal complement
using the aux-comp-phrase. Because they have an underspecified
AUX-value, the newly created phrase may become head of a
head-complement-phrase which is restricted to head-daughters that are
\[AUX −\]. The verbal cluster analysis described above is used to
prevent spurious ambiguity.

### Verb-initial and verb-final word order

We assume that a verbal cluster is formed at the beginning or end of the
clause when a language has verb-initial or verb-final word order,
respectively. This analysis introduces the feature \[VC luk\] to synsem.
Lexical rules simply pass the value of VC up. The analysis adds a
constraint to the head-complement-phrase which makes the value of the VC
feature of a phrase identical to that of the non-head-daughter. This
way, it can keep track whether a specific complement (being \[VC +\])
has already been taken up in the phrase. Main verbs are \[VC +\],
auxiliaries are \[VC −\]. By stating that the head-daughter of
head-complement-phrases and head-subject-phrases must be \[VC +\],
auxiliaries can only become the head of such phrases if they have
combined with a main verb, or if their complement is an auxiliary that
has done so (or if their complement is an auxiliary combined with an
auxiliary combined with a main verb, etc.). The use of the VC-feature
both reduces spurious ambiguity and prevents subjects from being placed
in the verbal group. When the auxiliary-complement order is harmonic
(i.e. head-initial for verb-initial languages, or head-final for
verb-final languages), no other additions regarding word order are made
to accommodate auxiliaries in the grammar.

In order to account for disharmonic auxiliary-complement order, the
system creates a special aux-comp-phrase, which inherits from the
basic-marker-comp-phrase in matrix.tdl. The basic-marker-comp-phrase
functions in the exact same manner as basic-head-comp-phrase, except
that the phrase does not share the value of the feature HEAD from its
marker-daughter (equivalent to the head-daughter in a
head-complement-phrase). Matrix.tdl also contains a
marker-initial-phrase and a marker-final-phrase, modeled after
head-initial and head-final to take care of the word order of the
marker-daughter and non-marker-daughter. In the case of disharmonic word
order between auxiliary-complement and verb-object structure, it is used
because, normally, both verbal and non-verbal complements are combined
with their head using the basic-head-complement-rule. When auxiliaries
have different word order constraints from main-verbs, the usual
solution is to introduce two head-complement-rules with different word
order, one restricted to head-daughters whose head is \[AUX −\], and one
restricted to \[AUX +\] head-daughters. However, when the auxiliary
takes V-complements, it raises the main verb’s complements. It will head
phrases that must combine with non-verbal complements using a
head-complement rule requiring \[AUX −\] head-daughters. For this
reason, we use an auxiliary-rule that does not share all head-features
with its head-daughter.

The aux-comp-phrase states that its marker-daughter’s head bears the
feature-value pair \[AUX +\], and that the non-marker-daughter must be a
verb (\[HEAD verb\]). Since the head-value of the marker-daughter is not
shared with the phrase, the value of the AUX remains underspecified. The
phrase does receive the value from the FORM-feature from its
marker-daughter. Auxiliaries can combine with their verbal complement
using the aux-comp-phrase. Because they have an underspecified
AUX-value, the newly created phrase may become head of a
head-complement-phrase which is restricted to head-daughters that are
\[AUX −\].

### Free word order

For free word order languages where auxiliaries take v-complements,
there are two options: either the auxiliary forms a verbal cluster with
its complements, or there is maximally one auxiliary present in the
clause. When at most one auxiliary can occur in the clause, the
constraint \[AUX −\] is added to the head of the auxiliaries complement,
making sure that an auxiliary can only combine with main verbs
(\[VAL.COMPS &lt; \[LOCAL.CAT.HEAD.AUX −\] &gt; \] on a generic type for
auxiliaries).

For languages with free word order that allow more than one auxiliary
per clause, the system provides an analysis forming verbal clusters.
This analysis introduces the feature \[VC luk\] to synsem. Lexical rules
simply pass the value of VC up. The analysis adds a constraint to the
head-complement-phrase which makes the value of the VC feature of a
phrase identical to that of the non-head-daughter. This way, it can keep
track whether a specic complement (being \[VC +\]) has already been
taken up in the phrase. Main verbs are \[VC +\], auxiliaries are \[VC
−\]. By stating that the head-daughter of head-complement-phrases and
head-subject-phrases must be \[VC +\], auxiliaries can only become the
head of such phrases if they have combined with a main verb, or if their
complement is an auxiliary that has done so (or if their complement is
an auxiliary combined with an auxiliary combined with a main verb,
etc.).

Auxiliaries combine with their complement using a special
aux-comp-phrase, inheriting from the basic-marker-comp-phrase defined in
matrix.tdl. The basic-marker-comp-phrase functions in the exact same
manner as basic-head-comp-phrase, except that the phrase does not share
the value of the feature HEAD from its marker-daughter (equivalent to
the head-daughter in a head-complement-phrase). Matrix.tdl also contains
a marker-initial-phrase and a marker-final-phrase, modeled after
head-initial and head-final to take care of the word order of the
marker-daughter and non-marker-daughter. In the case of disharmonic word
order between auxiliary-complement and verb-object structure, it is used
because, normally, both verbal and non-verbal complements are combined
with their head using the basic-head-complement-rule. When auxiliaries
have different word order constraints from main-verbs, the usual
solution is to introduce two head-complement-rules with different word
order, one restricted to head-daughters whose head is \[AUX −\], and one
restricted to \[AUX +\] head-daughters. However, when the auxiliary
takes V-complements, it raises the main verb’s complements. It will head
phrases that must combine with non-verbal complements using a
head-complement rule requiring \[AUX −\] head-daughters. For this
reason, we use an auxiliary-rule that does not share all head-features
with its head-daughter.

The aux-comp-phrase states that its marker-daughter’s head bears the
feature-value pair \[AUX +\], and that the non-marker-daughter must be a
verb (\[HEAD verb\]). Since the head-value of the marker-daughter is not
shared with the phrase, the value of the AUX remains underspecified. The
phrase does receive the value from the FORM-feature from its
marker-daughter. Auxiliaries can combine with their verbal complement
using the aux-comp-phrase. Because they have an underspecified
AUX-value, the newly created phrase may become head of a
head-complement-phrase which is restricted to head-daughters that are
\[AUX −\].

### Verb second word order

No additional constraints or rules are provided for verb second
languages. The question on auxiliary-complement word order is currently
ignored by the system (see below for more information on planned
implementations).

# Upcoming Work

The LinGO Grammar Matrix Customization System is constant work in
progress. The list of phenomena and behavior that would be nice to have
in the word order library is endless, and it is not feasible to discuss
all future ideas in this document. I will therefore restrict the
description to extension which are planned for the near future and for
which investigation has started. Because the details of most
implementations are still under development, I will not describe the
analyses themselves in this document. Feedback on the planned phenomena
is greatly appreciated, and requests concerning them or can be made to
the author. I will start with a description of my research for the
currently unfinished implementation for verb-second languages and
auxiliary structures. This will be followed by a description of
increasing the possibilities for the auxiliary’s word order and adding
more partially flexible word order options for basic constituent order.

## Verb second languages and auxiliaries

The current version of the customization system supports verb-second
languages and auxiliary structures as found in Australian indigenous
languages. The behavior found in Germanic verb second languages is not
covered at present. On the one hand, the system forces users to choose
between V-complements and VP-complements which excludes partial
VP-fronting phenomena as found in German, Dutch and Swedish (Nerbonne,
1994; Holmberg, 1999). On the other hand, the system overgenerates for
these languages, because verbal complements can be placed in any
position of the right-hand side of the conjugated verb. Implementations
of grammars that treat German, Dutch and Danish word order in the main
clause correctly have been made, but several aspects of the analysis are
currently under examination to provide the optimal solution. First, the
verb-second implementation provided by the customization system differs
from standard assumptions on Germanic verb-second word order in HPSG. I
plan to make alternative implementations with both the standard
(filler-gap) analysis and the current (MC-feature) analysis for
verb-secondness. If both can be integrated in to the system correctly,
the web-interface will allow the user to make their decision as to which
analysis the grammar should contain. Second, Bender (2010) has shown
that an alternative approach using an auxiliary construction5 for
raising is more efficient than the standard argument-composition
analysis. The system currently provides the general argument-composition
analysis for auxiliaries that take a V-complement, which is described in
Section 3.4. The interaction between this alternative analysis and other
phenomena is currently under investigation. Just as for the verb-second
analysis, I plan to provide both options to the user.

## Both positions for the auxiliary

At present, users need to choose whether auxiliaries precede or follow
their verbal complement. The chosen word order applies to all
auxiliaries. We are aware of several languages that show more variation
in auxiliary word order. The option “either” side of the verbal
complement is planned to be added to the word order page for
auxiliaries. We are aware of several possible conditions on alternative
word order for auxiliaries:

1. The word order of auxiliary and complement may be free for all
auxiliaries
2. The word order of auxiliary and complement may depend on the
auxiliary (with options “before”, “after” or “either” for each
auxiliary)
3. The word order may depend on the morphology of the auxiliary
4. A combination of conditions 2 and 3.
5. An auxiliary may have clitic-like properties

The first two conditions are scheduled to be included in the
customization system. I have working grammars and a proto-implementation
for the interaction between morphology and auxiliaries, but additional
tests are necessary to see how this implementation scales up to a wider
range of interactions. It is thus not clear whether this possibility
will be provided through the customization system in the near future.
There are no direct plans for implementing auxiliaries that have
clitic-like properties, but we may be able to provide a sample analysis
based on the Bulgarian grammar currently implemented by Petya Osenova
(Osenova, 2010).

## Main constituents word order

Dryer (1997) argues against the six-way classification of word order
showing that many languages only have clear preferences for the position
of either the subject or the object. I will therefore extend the options
of main constituent word order and provide the possibilities for a fixed
position of the subject, with free object word order or a fixed position
of the object, with free subject word order.

# References

- Emily M. Bender and Dan Flickinger. 2005. Rapid prototyping of
scalable grammars: Towards modularity in extensions to a
language-independent core. In Proceedings of the 2nd International
Joint Conference on Natural Language Processing IJCNLP-05
(Posters/Demos), Jeju Island, Korea.
- Emily M. Bender, Dan Flickinger, and Stephan Oepen. 2002. The
grammar matrix: An open-source starter-kit for the rapid development
of cross-linguistically consistent broad-coverage precision
grammars. In John Carroll, Nelleke Oostdijk, and Richard Sutcliffe,
editors, Proceedings of the Workshop on Grammar Engineering and
Evaluation at the 19th International Conference on Computational
Linguistics, pages 8–14, Taipei, Taiwan.
- Emily M. Bender, Scott Drellishak, Antske Fokkens, Michael Wayne
Goodman, Daniel P. Mills, Laurie Poulson, and Safiyyah Saleem. 2010.
Grammar Prototyping and Testing with the LinGO Grammar Matrix
Customization System. In Proceedings of ACL 2010 Software
Demonstrations.
- Emily M. Bender. 2010. Reweaving a grammar for Wambaya: A case study
in grammar engineering for linguistic hypothesis testing. Linguistic
Issues in Language Technology, 3(3):1–34.
- Ann Copestake. 2002. Implementing Typed Feature Structure Grammars.
CSLI Publications, Stanford, CA.
- Matthew S. Dryer. 1997. On the six-way word order typology. Studies
in Language, 21. Dan Flickinger. 2000. On building a more efficient
grammar by exploiting types. Natural Language Engineering, 6(1):15
– 28.
- Antske Fokkens. 2010. Documentation for the Grammar Matrix word
order library. Technical report, Saarland University.
- Anders Holmberg. 1999. Remarks on Holmberg’s generalization. Studia
Linguistica, 53(1):1–39.
- Gareth King. 2003. Modern Welsh: a comprehensive grammar. Routledge,
New York, USA.
- John Nerbonne. 1994. Partial verb phrases and spurious ambiguities.
In John Nerbonne, Klaus Netter, and Carl Pollard, editors, German
Grammar in HPSG, Lecture Note Series, pages 109–149. CSLI, Stanford,
USA.
- Petya Osenova. 2010. Bulgarian Resource Grammar. VDM Verlag Dr.
Müller.
- Michael O’Siadhail. 1989. Modern Irish: grammatical structure and
dialectal variation. Cambridge University Press, Cambridge, United
Kingdom.

Last update: 2018-02-01 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_WordOrder/_edit)]{% endraw %}