{% raw %}# ESD Test Suite Examples

    Three of the dogs bark.
    Who is the oldest of all?
    Some of them arrived.

# Linguistic Characterization

Several varieties of noun phrases appear without an overt head noun,
with the semantics of the phrase identifying some subset of a set of
entities supplied overtly by an of-PP within the NP. The partitive
relation \`part\_of' is introduced by each of a set of unary rules that
accommodate the missing head noun by licensing a nominal phrase whose
daughter is either a determiner or an adjective of the appropriate type,
where this daughter's semantics imposes the partitive restriction on the
set of entities given by the of-PP's semantics.

# Motivating Examples

The following are examples involving this phenomenon:

- *Three of the dogs bark.*
- *Who is the oldest one of all?*
- *Some of them arrived.*

# ERS Fingerprints

Analyses of strings involving this phenomenon are characterized by the
EP part\_of, which is a relation between two sets of individuals, one a
subset of the other.

      part_of[ARG0 x1, ARG1 x2]

The variable x2 corresponds to the full set of entities identified by
the of-PP, while x1 identifies the relevant subset constrained by the
overt determiner or adjective.

# Interactions

The variants of these partitive noun phrases where the of-PP is absent
do not introduce a part\_of relation (since there is no overt full set
identified), but instead supply a generic\_entity relation. Thus in the
example

- *Some arrived.*

there is no information in the sentence identifying the larger set of
individuals of which some subset arrived.

# Reflections

There is a connection with one-anaphora as an overt variant, which
should be elaborated on here.

# Open Questions

# Expert External Commentary

# Grammar Version

- 1212

# References

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_Partitives/_edit)]{% endraw %}