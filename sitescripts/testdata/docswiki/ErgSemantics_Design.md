# Background

# Linguistic Design Principles

Design principles for DELPH-IN/MRS semantic representations identified
during the Hankø meeting:

-   Interface representation should include all information that is
    constrained by the grammar
-   Interface representation should be highly normalized, abstracting
    away from details of surface syntax
-   Close paraphrases should lead to comparable or identical structures
    in the interface representation
    -   Ex: Predicative copula does not contribute an EP (The fierce dog
        barks \~ The dog that is fierce barks)
    -   Ex: Dative alternation, passive (modulo discourse rel)
-   Minimize ambiguity
    -   Corollary: Differentiate lexical predicates only if that
        distinction corresponds to morphosyntactic differences
-   Decomposition is desirable, but not a goal in itself. If the
    predicates required for decomposition exist, then it is good.

cf. Copestake et al 2005 and "Slacker Semantics" (Copestake 2009)

<a name="intrinsic_arguments"/>

# Intrinsic Arguments on Adjectives and Adverbs

While the assumption of an intrinsic argument should be
non-controversial for the predications associated with verbal and
nominal phrases, more explanation is in order for extending this
assumption to the predications introduced by adjectives and even
adverbs.

One design decision for the ERG is that the same predicative copula *be*
is used both for present participles as in *the cat is sleeping* and for
predicative adjectives as in *the cat is happy*. Since we only want one
EP for the verb phrase *is sleeping*, the copula *be* does not introduce
an EP of its own, but rather constrains variable properties (tense and
aspect) of the semantics introduced by its verbal complement. Hence
predicative adjectives need to supply the eventuality that the copula
will so constrain, and this variable is unsurprisingly the intrinsic
argument of the EP introduced by the adjective.

A second design decision is that the same lexical entry is used both for
predicative and attributive uses of adjectives, rather than either
making distinct lexical entry pairs for most adjectives, or deriving the
predicative entry from the attributive one via lexical rule. As a
consequence, the EP introduced by this lexical entry has an intrinsic
argument present even when the entry is used as an attributive
adjective, where nothing else in the structure will constrain its
variable properties. The grammar makes use of this ARG0 when the
adjective itself is modified by a non-scopal word or phrase, as in
*extremely happy*, with *extremely* introducing an EP which takes the
ARG0 of the adjective it modifies as its ARG1. Without an intrinsic
argument present in the EPs of attributive adjectives, all modifiers of
adjectives would have to be treated as scopal, but this would create an
unwanted asymmetry for *consistently won* and *consistently happy*,
where we expect manner adverbs to be non-scopal modifiers of verbs.

A third design decision is that morphologically related adjective-adverb
pairs introduce the same EP, with the syntactic category difference
reflected in the semantics only in that the ARG1 of this predication
will turn out to be an instance for adjectives but an eventuality for
adverbs. Given the prior design decisions, even adverbs therefore have
an intrinsic eventuality argument in their EPs, and this ARG0 is again
employed by the ERG in composing the semantics of adverbial phrases
containing a non-scopal modifier of the adverb, as in *consistently
victoriously*. Here again, if *victoriously* lacked an intrinsic
argument, then *consistently* would have to be treated as a scopal
modifier taking the label of *victoriously* as its argument, leading to
a similarly undesirable asymmetry between *consistently won* and
*consistently victoriously*, assuming that the adverb modifying the verb
here is non-scopal.

The presence of these intrinsic arguments in the predications for
adverbs and attribute adjectives is thus motivated by the desires to
minimize proliferation of lexical entries, to capture the morphological
regularity of most adjective-adverb pairs in English, and to enable a
consistent representation of non-scopal modifiers when they themselves
modify modifiers.

# Predicate Hierarchies

# Non-Scopal Modification

The term ‘non-scopal modifiers’ includes all those which combine with
their modifiee in such a way that quantifiers cannot take scope in
between. This is a very broad phenomenon, including both modifiers of
EPs with instance-type ARG0s and of EPs with event-type ARG0s. Among
nominal (instance-type) non-scopal modifiers, we find that the semantic
category includes subtypes that are syntactically quite distinct, viz.,
relative clauses (which involve a long-distance dependency) on the one
hand, and non-relative clause modifiers (adjectives, PPs, etc.) on the
other.

The key property of non-scopal modification is the sharing of labels
between the modifier and modifiee. This in turn means that the two EPs
will necessarily occupy the same node in the scope tree, and
differentiates non-scopal modification from other predicate-argument
relations. However, label sharing between two predications is not a
sufficient condition to determine non-scopal modification: although it
is rare in current ERG analyses, it is possible for a predicate to take
a non-scopal, unquantified argument, as is the case, for example, in the
1214 analysis of a complex temporal expression like *\[at\] four
thirty*:

      h:numbered_hour(4)[ARG0 x, ARG1 i]
      h:card(30)[ARG0 i]

A similar configuration would arise if nominal arguments like pronouns
or proper names were analyzed as unquantified (and the rules of MRS
composition mandate the label sharing between the semantic head and its
argument in such cases).

The shared scopal position (of non-scopal modifiers as well as
non-scopal, unquantified arguments) is illustrated by the contrast
between the following examples:

-   All white cats are deaf.
-   All deaf cats are white.

Though the ARG0 of \_cat\_n\_1 is the ARG1 of both \_deaf\_a\_1 and
\_white\_a\_1 in both of these examples, they do not mean the same
thing. This, in turn, is because the modifier, but not the predicate,
shares its label with \_cat\_n\_1 and thus ends up in the same place in
the scope tree (inside the restriction of the quantifier, as opposed to
its body). A similar contrast can be built with relative clauses:

-   All cats that are white are deaf.
-   All cats that are deaf are white.

The shared scopal position between non-scopal modifiers and modified
verbs can be observed with respect to quantifier scope. A modifier like
*loudly* does not provide any additional slots for quantifiers to scope
into, such that the following example is unambiguous:

-   Every dog barked loudly.

This contrasts with scopal modifiers, which do interact with
quantifiers, giving two readings in cases such as:

-   Every dog probably barked.

Non-scopal modification is not a semantic phenomenon in the practical
sense that we use in this documentation, i.e. there is no set of
semantic fingerprints that uniquely picks out sentences with this
property. Rather, non-scopal modification is a property of several
phenomena discussed in this documentation, including at least:

-   [Apposition](ErgSemantics_Apposition) (pending reanalysis in terms
    of ICONS)

-   [Compounding](ErgSemantics_Compounding): ‘compound’,
    ‘compound\_name’, including titles and N-ed (J-N\_CRD-T\_C cuts
    across compounding and coordination)

-   [Implicit Locatives](ErgSemantics_ImplicitLocatives): (‘today’,
    ‘every time he arrives’): ‘loc\_nonsp’

-   [Instrumental
    Relatives](ErgSemantics_InstrumentalRelatives): ‘with\_p\_rel’

-   Extraposed relative clauses (create page for these?)

Some previous descriptions of ERS have used the term ‘intersective
modifiers’ for this phenomenon, but here we prefer ‘non-scopal
modifiers’ since we give the same treatment in ERS to intersective,
subsective and privative adjectives (Kamp & Partee 1993). At the level
of MRS representations, we argue that it is appropriate to treat these
equivalently, as they all share the property of disallowing intervening
quantifiers.

There is a semantic distinction within non-scopal modifiers that
cross-cuts the relative clause/other modifier distinction, namely,
whether or not the head being modified plays a role in the predication
sharing its label. For example in *The dog Abrams bought barked*,
\_buy\_v\_1 shares its label with \_dog\_n\_1 and the ARG0 of
\_dog\_n\_1 is also the ARG2 of \_buy\_v\_1. However, in *The dog Kim
told Abrams to buy barked*, \_dog\_n\_1, despite sharing its label with
\_tell\_v\_1 has no role to play in that predication. For non-relative
clause modifiers of nouns, we find an analogous case with the so-called
*tough* adjectives, as in *Abrams is an easy editor to impress*, where
\_easy\_a\_for shares a label with \_editor\_n\_1 but does not take its
ARG0 as an argument.

Note, too, that certain elements can be syntactic complements but
semantic modifiers. This happens, for example, in the analysis of
adverbial-complement taking verbs such as (certain senses of) *behave*,
*do* and *go*, as well as verbs of motion taking directional
complements:

-   Kim behaved badly.
-   Kim did well.
-   It went well.
-   Kim walked to the store.

Similarly, degree specifiers such as *very* in *Kim is very happy* are
syntactically combined as specifiers (not modifiers) but appear in the
ERS as non-scopal modifiers.

# References

-   Kamp, H., & Partee, B. (1995). Prototype theory and
    compositionality. Cognition, 57(2), 129-191.
