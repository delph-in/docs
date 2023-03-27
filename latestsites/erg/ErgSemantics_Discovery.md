{% raw %}# Discovery Procedure for ERG Semantic Phenomena

We developed a discovery procedure which starts from *grammar entities*
(phrase structure rules, lexical rules, and lexical types) in the
current version of the ERG to enable a data-driven exploration of
semantic phenomena which have received treatments in the ERG to date.
The discovery procedure starts by identifying grammar entities which are
likely to contribute to the composition of semantic representations that
go beyond the basics. In the case of phrase structure rules and lexical
rules, we identified all instances with non-empty C-CONT.RELS values. In
the case of lexical types, we found all those which exhibit at least one
of the following properties:

- More than one EP in CONT.RELS
- At least one of the EPs in CONT.RELS has at least one scopal
argument

We plan to also look for (classes of) lexical entries with CARGs and
grammar predicates (suggesting lexical decomposition), but this has yet
to happen. Each extracted grammar entity is associated with a
*signature*, for now just the (multi-)set of PRED values in the EPs in
its RELS list.

We then took the grammar entities and created rough *clusters* based on
shared signatures, clustering only within broad grammar entity class
(phrase structure rules, lexical rules, or lexical types). While it
might be more informative to extend the sets of EPs to a more proper
semantic signature, this was not done in the first pass.

Once the grammar entities and clusters were extracted, we indexed the
existing collection of Redwoods treebanks (including
[DeepBank](https://delph-in.github.io/docs/garage/DeepBank)) for all grammar entity types. This enabled us to
extract examples for each grammar entity of interest. These lists of
examples include the three shortest available across the Redwoods
corpora, plus all examples from the MRS test suite. Working from the
phrase structure and lexical rule clusters and their associated
examples, we produced an initial set of proposed phenomena to document
(listed on the [inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) page). Among the
phenomena, we found a few types of information in the MRS which we
believe to be MRS-based encodings of quasi-semantic or para-semantic
phenomena. These are listed separately.

This procedure seems to have been effective for the rules, but less so
for the lexical types. We looked some at the clusters and examples for
lexical types, and from there were able to extract a non-exhaustive list
of phenomena as well as a candidate set of basic components of semantic
analyses which should be documented. These, too, are noted on the
[inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) page.

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) Main Page
- [How to Cite this Work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2014-11-04 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_Discovery/_edit)]{% endraw %}