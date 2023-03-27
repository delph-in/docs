{% raw %}# Notes on discussion of Grammar Indexing for Phenomena

## Brief presentation

The problem:

- Analyses of phenomena typically touch many different types/rules,
and each type/rule typically bears constraints related to multiple
phenomena.
- Grammar engineers and others might have many reasons to want to see
where in a grammar a phenomenon is handled:
  - Learning from someone else's grammar
  - Cross-linguistic comparison: How does phenomenon X differ across
grammars?
  - Cross-grammar comparison: How many phenomena are handled in
grammars X, Y and Z?
  - Measuring degree of interaction between phenomena
  - Discoverability: How can I find grammars that have treatments of
phenomenon Z?
  - Grammar engineering for language documentation (=&gt; finding
phenomena in a treebank)

A solution:

- Annotate *grammars* with labels on constraints (i.e., pieces of
types) indexing the analyses they belong to
- Ideally using a vocabulary drawn from GOLD or a similar ontology
(for discoverability)

But how?

- Build on lextype DB?
- Embedded in tdl or stand-off?
- Grammar Matrix customization system could auto-generate for
library-based analyses (and to get people off on a good start)
- Retrofitting might be harder than building in in new grammars

## Discussion

Emily: phenomena are 'ideal' units, but implementation is scattered
through the grammar. (see notes above)

Antske: Sabina Lehmann's thesis might be relevant to this problem.
Defining the phenomena in the first place is hard.

Stephan: When TSNLP test suites were being constructed, big name
linguists tried to define phenomena. There's been very little take up of
their definitions and they haven't really stood the test of time.

Emily: Even a practical definition would help. Not trying to create
linguistic theory.

Dan: each grammar engineer write the first 100 phenomena they think of,
Huddleston & Pullum book has thousands, no one implements, some not even
named. features in a lex type serve multiple different purposes - how to
document?

Emily: wants to index grammar by phenomena (annotated at constraint
level, but view otherwise)

Mike: use type addendum to build types line by line, allows line by line
documentation.

Antske: inheritence in grammar matrix could inform interactions. Antske:
Use sentences with phenomena to index/find phenomena

Emily: Let's make a start with Dan's plan.

Stephan: Documentation needs to be more specific: which phenomena added
the need for which level of specification. Mike's technical answer is
probably the way to go.

Glenn: that's why i make tools (to see this stuff). code-refactoring?
use VCS to merge.

Tim: labelling lex types with GOLD. use AVM to describe GOLD. use
sentences (items) as index? keep grammar separate to this annotation, to
make updating easier.

Emily: too stand-off. need to see the types and constraints.

Antske: use customisation system/meta grammar produce documentation

(Emily: with version control)

Dan: An example: expletive pronouns: need the pronouns, predicates,
nouns, structures etc that select for p

Emily: just detecting the x? index comes up with those

Dan: just document in the one (discriminitive) place then, not on all
places touched in the grammar

Stephan: OK, so grammar engineers get phenomena, then we use type
addendum: features are grouped by the phenomena they are needed by, not
only by type, editor with layers ala photoshop to deal with this, oe and
mike to make this tool?

Last update: 2011-06-27 by RebeccaDridan [[edit](https://github.com/delph-in/docs/wiki/SuquamishGrammarIndexing/_edit)]{% endraw %}