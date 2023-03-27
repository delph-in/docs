{% raw %}PCFG and dependency conversion+parsing with [DeepBank](https://delph-in.github.io/docs/garage/DeepBank)(s) SIG

Notes provided by AngelinaIvanova

* * *

- 1\) Comparison of Stanford Basic (SB), CoNLL and DELPH-IN Syntactic
Derivation Tree-derived (DT) bi-lexical dependency formats

As a follow-up on the talk about parsing Stanford Basic, CoNLL and
DELPH-IN Syntactic Derivation Tree-derived formats: it could be
interesting to look closely at the structural differences and test if
combination of different annotations could lead to improvement. There is
an ongoing MSc project at Oslo now, about mapping between DT, SB, and
CoNLL. First, the formats are aligned and then it is analyzed how
parallel the formats are . Finally, the decision about the approach to
mapping is going to be taken: rule-based or learning-based.

- 2\) Parse-ranking results

In order to conduct fair comparison of parsers on out-of-domain data it
is necessary to freeze the grammar before treebanking previously unseen
test data, so that the knowledge about the new domains is not present in
the grammar.

- 3\) Parsing ERG derivation trees with Berkeley

Hypothesis in Berkeley parser: human cannot annotate a big corpus
manually with fine-grained annotations. Therefore the main problem for
this parser is the fine-grained set of supertags. Berkeley may have an
option for separate learning of syntactic categories and lexical
categories. Other parsers: Charniak and Johnson, Stanford

- 4\) DELPH-IN MRS-derived format (DM)

Possible future developments:

- participation in data-driven dependency parsing competition
- using DELPH-IN MRS-derived format in graph-structure prediction task
- linking DM to semantic roles
- using DM in social media analysis

One problem with the Stanford decision to use prepositions in the names
of dependency labels instead of including them as nodes in the
dependency tree is that prepositions (in this analysis) cannot be
coordinated and modified; prepositions are not predicates by themselves.

What are non-lexical elements of MRS good for? The main motivation to
exclude them during the conversion to DELPH-IN Derivation Tree- and
MRS-derived formats was to apply off-the-shelf dependency parsers on the
resulting dependencies. Perhaps we loose something we treasure when we
get rid of non-lexical elements of MRS.

There is no (easy) way to go back from bilexical dependencies to
MRS-like structures.

Last update: 2013-08-07 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/SaarlandPcfgDependency/_edit)]{% endraw %}