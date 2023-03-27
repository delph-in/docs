{% raw %}# ESD Test Suite Examples

    Abrams, the dog, arrived.
    Abrams, garden dog, arrived.

# Linguistic Characterization

A full noun phrase is followed by another nominal phrase (NP or Nbar)
whose referent is the same as the first NP. This appositive nominal can
be set off by commas, dashes, or parentheses, none of which introduce a
reflex in the semantics. The apposition construction introduces a
two-place relation 'appos' whose first argument is the index of the
first NP (the head), and whose second argument is the index of the
second, modifying nominal. The LTOP of the whole NP is the label of the
'appos' relation.

# Motivating Examples

- Parentheticals may be ambiguous: *Abrams (the dog) arrived* or *My
dog (no joke) was on TV*
- Titles may look like apposition, but are not: contrast *professor
Kim Smith* with *the professor Kim Smith*, where the first is a
title construction (see [Compounding](https://delph-in.github.io/docs/erg/ErgSemantics_Compounding)),
while the second is apposition.

# ERS Fingerprints

When the modifying nominal is a full NP, the apposition construction
simply introduces the two-place appos relation, whose first argument is
the index of the head NP, and whose second argument is the index of the
second, appositive NP:

    appos[ARG1 x1, ARG2 x2]
    [ARG0 x1]
    [ARG0 x2]

When the modifying nominal is a singular count Nbar lacking a
determiner, as in the second reference example, the apposition
construction introduces an implicit quantifier 'udef\_q' to bind the
index of the Nbar:

    appos[ARG1 x1, ARG2 x2]
    [ARG0 x1]
    udef_q[ARG0 x2]
    [ARG0 x2]

# Interactions

# Open Questions

This analysis introducing a two-place relation is problematic, since its
label must be bound to something, yet cannot be identified with the
label of the restrictor in the head NP (analogous to ordinary
compounding), since that label is no longer visible when the appositive
attaches to the NP. So by the semantic algebra, the 'appos' relation's
label is identified with the LTOP of whichever predicate takes the full
NP as its argument, but this is neither intuitive nor entirely
successful, since that identification per the algebra is not yet fully
implemented in the grammar. The near-term aim is to get rid of the
'appos' relation, instead making use of the recently introduced
mechanism for expressing ICONS (constraints between individuals), having
the construction add an 'eq' ICONS between the index of the head NP and
that of the appositive nominal.

# Grammar Version

- 1212

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_Apposition/_edit)]{% endraw %}