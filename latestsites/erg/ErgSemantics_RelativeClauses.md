{% raw %}# ESD Test Suite Examples

\[Proposed\]

    The dog barked loudly.
    The fierce dog barked.
    The dog in the garden barked.
    The barking dog arrived.
    The dog bought by Abrams arrived.
    The dog Abrams bought arrived.
    The dog Abrams said barked arrived.
    Abrams is an easy editor to impress.

# Linguistic Characterization

The term ‘intersective modifiers’ here is used to include all non-scopal
modifiers, i.e. those which combine with their modifiee in such a way
that quantifiers cannot take scope in between. This is a very broad
phenomenon, including both modifiers of EPs with instance-type ARG0s and
of EPs with event-type ARG0s. Among nominal (instance-type) intersective
modifiers, we find that the semantic category includes subtypes that are
syntactically quite distinct, viz., relative clauses (which involve a
long-distance dependency) on the one hand, and non-relative clause
modifiers (adjectives, PPs, etc.) on the other.

The key property of intersective modification is the sharing of labels
between the modifier and modifiee. This in turn means that the two EPs
will necessarily occupy the same node in the scope tree, and
differentiates intersective modification from other predicate-argument
relations.

# Motivating Examples

The shared scopal position is illustrated by the contrast between the
following examples:

- All white cats are deaf.
- All deaf cats are white.

Though the ARG0 of **\_cat\_n\_1** is the ARG1 of both **\_deaf\_a\_1**
and **\_white\_a\_1** in both of these examples, they do not mean the
same thing. This, in turn, is because the modifier, but not the
predicate, shares its label with **\_cat\_n\_1** and thus ends up in the
same place in the scope tree (inside the restriction of the quantifier,
as opposed to its body). A similar contrast can be built with relative
clauses:

- All cats that are white are deaf.
- All cats that are deaf are white.

The shared scopal position between intersective modifiers and modified
verbs can be observed with respect to quantifier scope. A modifier like
*loudly* does not provide any additional slots for quantifiers to scope
into, such that the following example is unambiguous:

- Every dog barked loudly.

This contrasts with scopal modifiers, which do interact with
quantifiers, giving two readings in cases such as:

- Every dog probably barked.

# ERS Fingerprints

    h:[ARG0 e]
    h:[ARG0 i]

# Interactions

As noted, this is a very broad category, which subsumes several other
phenomena discussed in this documentation, including at least:

- [Apposition](https://delph-in.github.io/docs/erg/ErgSemantics_Apposition) (pending reanalysis in terms
of ICONS)
- [Compounding](https://delph-in.github.io/docs/erg/ErgSemantics_Compounding): ‘compound’,
‘compound\_name’, including titles and N-ed (J-N\_CRD-T\_C cuts
across compounding and coordination)
- [Implicit Locatives](https://delph-in.github.io/docs/erg/ErgSemantics_ImplicitLocatives): (‘today’,
‘every time he arrives’): ‘loc\_nonsp’
- [Instrumental
Relatives](https://delph-in.github.io/docs/erg/ErgSemantics_InstrumentalRelatives): ‘with\_p\_rel’
- Extraposed relative clauses (create page for these?)

# Reflections

Perhaps a better term for this category would be ‘non-scopal modifiers’,
since we give the same treatment in MRS to intersective, subsective and
private adjectives (Kamp & Partee 1993). At the level of MRS
representations, we argue that it is appropriate to treat these
equivalently, as they all share the property of disallowing intervening
quantifiers.

There is a semantic distinction within intersective modifiers that
cross-cuts the relative clause/other modifier distinction, namely,
whether or not the head being modified plays a role in the predication
sharing its label. For example in *The dog Abrams bought barked*,
**\_buy\_v\_1** shares its label with **\_dog\_n\_1** and the ARG0 of
**\_dog\_n\_1** is also the ARG2 of **\_buy\_v\_1**. However, in *The
dog Kim told Abrams to buy barked*, **\_dog\_n\_1**, despite sharing its
label with **\_tell\_v\_1** has no role to play in that predication. For
non-relative clause modifiers of nouns, we find an analogous case with
the so-called *tough* adjectives, as in *Abrams is an easy editor to
impress*, where **\_easy\_a\_for** shares a label with
**\_editor\_n\_1** but does not take its ARG0 as an argument.

Note, too, that certain elements can be syntactic complements but
semantic modifiers. This happens, for example, in the analysis of the
following:

- Kim behaved badly.

(At least, I thought it did, but that's not what I see in the demo.
Other examples?)

# Notes on Generation

# Open Questions

- Are there any cases where the modified element's ARG0 not only
doesn't have a role in the top EP of the modifier but also doesn't
have a role of any EP further down inside?
- TODO: Look for grounding in the semantics literature around the
notion of intersective modification, starting with Dowty, Wall &
Peters 1981 \[2012\], also chapter on Quantification in the
Encyclopedia of Linguistics, Barwise & Cooper 1981.

# Expert External Commentary

# Grammar Version

1214

# References

- Kamp, H., & Partee, B. (1995). Prototype theory and
compositionality. Cognition, 57(2), 129-191.

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-12-19 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_RelativeClauses/_edit)]{% endraw %}