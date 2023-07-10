{% raw %}# DELPH-IN Grammars

The [GrammarCatalogue](https://delph-in.github.io/docs/grammars/GrammarCatalogue) page gives an overview of the
existing DELPH-IN grammars, including the
[ERG](http://www.delph-in.net/erg) and many other grammars ranging in
size from broad-coverage to experimental.

## Overview

A DELPH-IN grammar consists of a set of **grammar entities** which
together license a set of strings together with linguistic structures
for each string representing morphological, syntactic and semantic
information.

The grammar entities conform to **declarative constraints** which encode
well-formedness restrictions as well as compositional semantics. There
are three major categories of grammar entities:

- **lexical entries** giving form/meaning information about particular
lemmas
- **lexical rules** which build words from lemmas and can add
syntactic, semantic, and orthogaphic information
- **phrase structure rules** which build larger constituents from
words

In addition, there are also two further categories of grammar entities:

- **root symbols** which any spanning edge must unify with to be
output as a parse
- **node labels** used in the display of abbreviated trees

The grammar entities are instantiated from the
**type hierarchy**. The type hierarchies in DELPH-IN grammars are
singly-rooted, allow (and make extensive use of ) **multiple
inheritance**, and conform to the **closed world assumption** (no new
types are created a runtime).
Each type is associated with a **type constraint**
expressed as a typed feature structure.
Most of the work in developing a DELPH-IN
grammar involves creating and maintaining the type hierarchy and
the type constraints.

Though the type hierarchy is formally one large system, notionally it
can be seen as involving three main classes of types:

- **lexical types** instantiated by lexical entries
- **construction types** instantiated by phrase structure rules and
lexical rules
- ancillary types used in the definition of both of the above

## Linguistic Characterization

DELPH-IN grammars are couched within the framework of HPSG. This
framework is characterized by what Sag, Wasow and Bender (2003) call
**constraint-based lexicalism**. It is a mono-stratal theory, in which
input strings are assigned structures (or rejected) in a single layer of
processing (no mapping trees to trees); all constraints are declarative;
and lexical entries contain rich information (largely determined by
lexical type constraints). In contrast to classical HPSG's sparse set of
grammatical schemata (and consistent with much recent theoretical work),
DELPH-IN grammars posit a rich collection of **constructions** (phrase
structure rules).

## Structures

The structures licensed by DELPH-IN grammars are typed feature structures
(often expressed as attribute-value matrices), which tend to be very large.
The LKB and to some degree ACE
(see [LKB](https://delph-in.github.io/docs/howto/DelphinTutorial_Processing)) provide support for
interactively exploring these structures.
In general, for viewing the analysis for a whole utterance, the most commonly
used display formats are CFG-like trees, with node labels abbreviating
the feature structures at the nodes and the various formats for
displaying the MRS associated with a node (usually the root).

## Treebanks

Mature DELPH-IN grammars have associated **treebanks**, i.e.,
collections of text for which one analysis per sentence has been
selected by hand in the [Redwoods](https://delph-in.github.io/docs/garage/RedwoodsTop) style.

The result of processing an input string in the analysis direction with
a DELPH-IN grammar and one of the associated processors, if successful,
is a **parse forest** giving all or a subset of the analyses licensed by
the grammar. The **treebanking tools**
([ItsdbTreebanking](https://delph-in.github.io/docs/tools/ItsdbTreebanking) and the newer full-forest
treebanker) calculate **discriminants** (syntactic or semantic) each of
which divide the parse forest in two. Annotators select trees by
choosing among these discriminants. Treebanks are important for training
parse selection models as well as for documenting grammar coverage in
regression testing.

## Documentation

- Lexical type documentation (TODO)

## Auxiliary definitions

- SEM-I: A grammar that is to be used in generation should have a
[SEM-I](https://delph-in.github.io/docs/tools/RmrsSemi) (semantic interface),

declaring the predicates accepted by the grammar, their arity, and the
types of values expected in each argument position.

- Token mapping

## Creating new grammars

The [Grammar Matrix](http://www.delph-in.net/matrix) provides support
for creating additional DELPH-IN style grammars. The **Matrix** consists
of a **core grammar** shared by all Matrix-derived grammars and a set of
**libraries** of analyses of cross-linguistically variable phenomena.
These libraries are accessed through the [customization
system](http://www.delph-in.net/matrix) which elicits a high-level
linguistic description from the user and outputs a working DELPH-IN
style fragment. The analyses provided by the customization system and
best practices for accessing them are documented in the pages under
[MatrixDocTop](https://delph-in.github.io/docs/matrix/MatrixDocTop).

Grammar writers beginning new grammars and interested in systematic
exploration of the analysis space are encouraged to explore the CLIMB
methodology (see [ClimbTop](https://delph-in.github.io/docs/garage/ClimbTop)).

Last update: 2023-06-26 by Guy Emerson [[edit](https://github.com/delph-in/docs/wiki/DelphinTutorial_Grammars/_edit)]{% endraw %}