{% raw %}# ESD Test Suite Examples

    Abrams said ¦i j'adore la neige i¦.

# Linguistic Characterization

Naturally occurring English text will sometimes include strings of
foreign words. These can be relatively recent borrowings that haven't
been fully assimilated into English or they could be items in quotes as
in the testsuite example. In standard orthography, italics are used to
represent the fact that the string is not English (and not intended to
be read as such). The ERG does not attempt to assign any linguistically
motivated syntactic or semantic internal structure to foreign word
sequences. Rather, they are represented with a subgraph which can then
integrated into the larger MRS structure.

# Motivating Examples

- Would be nice to give some examples of different ways that they fit
in.

# ERS Fingerprints

      h0:fw_seq[ARG1 i1, ARG2 i2]
      h0:[ARG0 i1]
      h0:[ARG0 i2]

# Interactions

# Reflections

# Open Questions

- In the proposed testsuite example the label of the fw\_seq EPs is
shared not only with all of the components of the FW sequence but
also with the verb's EP \_say\_v\_1. I think this is required to
make the MRS a graph, and this, too, should be explained somewhere.

# Grammar Version

- 1212, forward-looking argument labels (ARG1, ARG2 rather than
L-INDEX, R-INDEX)

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_ForeignExpressions/_edit)]{% endraw %}