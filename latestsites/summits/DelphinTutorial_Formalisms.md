{% raw %}# HPSG: Head-Driven Phrase Structure Grammar

Strictly speaking, not a formalism but primarily a linguistic theory.
See brief linguistic characterisation on the
[DelphinTutorial/Grammars](https://delph-in.github.io/docs/howto/DelphinTutorial_Grammars) page.

# JRF: DELPH-IN Joint Reference Formalism

One of the early accomplishments of DELPH-IN partners was agreement on a
joint reference formalism (i.e. a ‘designer logic’ for typed feature
structures), blending elements of the formalisms proposed in Carpenter
(1992), Copestake (1992), and Krieger & Schäfer (1994). The joint
descriptive formalism can be informally characterized as a
**closed-world**, **conjunctive-only**, **multiple inheritance type
system** that enforces **strong typing** and **strict appropriateness**,
but allows types to be associated with arbitrary (complex) constraints
that are inherited and applied both at compilation and at run-time (e.g.
when two types unify to a more specific, constraint-introducing
subtype). HPSG well-formedness principles, immediate dominance schemata,
and constituent ordering constraints are all spelled out in the type
hierarchy (and cross-multiplied), yielding a set of phrase structure and
lexical rules that can be interpreted as rewrite rules over complex
(typed feature structure) categories by a suitable parser or generator.

Compared to the range of formal devices assumed at times in the
(theoretical) HPSG literature, the DELPH-IN JRF is relatively
**conservative**, excluding, for example, logical disjunction and
negation, implications with complex antecedents, relational constraints,
or cyclic feature structures. The DELPH-IN selection of descriptive
devices was seeking to balance **theoretical** and **engineering**
considerations alike, i.e. (i) linguistic adequacy, reflecting two
decades of experience in building large computational grammars, and (ii)
processing requirements, informed by much earlier work on computational
efficiency.

DELPH-IN grammars are encoded in the Type Definition Language (**TDL**),
a textual specification of type inheritance and constraints. The
canonical reference for the DELPH-IN Joint Reference Formalism is the
appendix of the volume *Collaborative Language Engineering*:

    @incollection{Copestake:02:CLE,
     author = {Copestake, Ann},
     title = {Definitions of Typed Feature Structures},
     booktitle = {Collaborative Language Engineering},
     editor = {Oepen, Stephan and Flickinger, Dan and Tsujii, {Jun-ichi} and Uszkoreit, Hans},
     year = 2002,
     pages = {227--230},
     address = {Stanford, CA},
     publisher = {CSLI Publications}
    }

# MRS: Minimal-Recursion Semantics

MRS (Copestake et al 2005) is a system of semantic representations which
is designed to support underspecification, notably of **quantifier
scope**. Such underspecified representations can be taken as a
description language for other kinds of semantic representations, e.g.,
predicate logic with generalized quantifiers.

The semantic information associated with an HPSG sign is called an
**MRS**. While typically constructed through unification of typed
feature structures (in parsing or generation), MRSs formally are not
feature structures (or objects in the DELPH-IN JRF; see above). An MRS consists of:

- a distinguished label, called the top handle
- a bag (i.e. unordered multi-set) of **elementary predications**
(also called **EPs**)
- and a bag of **handle constraints**

Each EP has a **label** (aka **handle**), a **predicate symbol** (or
**pred** or **relation**) and a list of **arguments**. In many EPs (and
in some grammars increasingly in all EPs), one of those arguments can be
considered an **intrinsic variable** (or ‘distinguished’ or
‘characteristic’ variable). Depending on the type of the EP, this can be
either an **event** or **instance** variable. The value of the other
arguments may be either a handle or a variable. Handle-valued arguments
are typically either the label of another EP or related via a handle
constraint to the label of another EP. Variable-valued arguments are
typically intrinsic variables of other EPs within the same MRS.

The [naming conventions](https://delph-in.github.io/docs/tools/RmrsPos) for predicate symbols allow them to
encode **lemma**, **part of speech**, and additional **coarse sense
distinctions** as well as distinguishing between **surface predicates**
(typically associated with particular lexical entries, where the
lemmatized surface form occurs in the predicate symbol) and **abstract
predicates** (which at times have been called ‘grammar predicates’)
introduced by grammatical rules or semantically decomposed lexical
entries.

Note that DELPH-IN grammars typically do not make sense distinctions in
MRS predicate symbols unless the sense distinction correlates with
morphosyntactic differences between lexical entries.

<img src="http://faculty.washington.edu/ebender/dogbarks.jpg" title="http://faculty.washington.edu/ebender/dogbarks.jpg" class="external_image" alt="http://faculty.washington.edu/ebender/dogbarks.jpg" />


The **Semantic Interface** (SEM-I) is an optional component in DELPH-IN
grammars that spells out the inventory of valid predicates, roles,
variable types, variable properties, and such.

While MRSs are the primary objects of meaning representation in
DELPH-IN grammars, a number of variants have been defined throughout the
years. Robust Minimal Recursion Semantics (**RMRS**) further decomposes
individual EPs (into sets of predications, one per argument in the
original EP, linked together through a unique **anchor** assumed for
each EP), to also allow underspecification of argument roles.
[Elementary Dependency Structures](https://delph-in.github.io/docs/tools/EdsTop) (**EDS**) reduce the bag of
EPs and argument structure to a variable-free dependency graph. EDS can
be further simplified into strictly **bi-lexical semantic
dependencies**, dubbed [DELPH-IN MRS
Dependencies](http://sdp.delph-in.net) (**DM**), for compatibility with
standard data-driven dependency parsing. To allow interconversion
between an original MRS and a variable-free dependency graph, Dependency
MRS (**DRMS**) overlays the EDS graph with additional scope-related
information about label (in)equalities among EPs.

While MRS in the first instance is a formalism, the name can also be
taken to refer to the collection of analyses that have been developed
using this formalism, the vast majority of which are encoded in DELPH-IN
grammars, especially the [ERG](http://www.delph-in.net/erg).
Documentation of these analyses is under way (see
[ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics)), and the analyses are often the topic of
[discussion](https://delph-in.github.io/docs/tools/RmrsDiscussions) at DELPH-IN summits and smaller meetings.

# REPP: Regular Expression-Based Pre-Processing

As grammars need to make assumptions about tokenization, the
DELPH-IN formalisms include a declarative specification language for
string normalization and tokenization rules, applied prior to parsing to
map from an input string to a sequence of token objects. The **REPP**
formalism essentially defines a cascade of regular expression rewrite
rules, with some additional machinery to support iteration, modularity
of rule sets and configurability, as well as so-called
**characterization**, i.e. the ability to keep track, for each output
token, of character start and end points in the original input string.
REPP documentation is available from the [ReppTop](https://delph-in.github.io/docs/garage/ReppTop) page.

# VPM: Variable Property Mapping

Another minor element in the DELPH-IN collection of formalisms is what
is called Variable Property Mapping (**VPM**), a declarative,
bidirectional facility to map between naming conventions for MRS
elements employed grammar-internally (i.e. in the JRF encoding of
MRSs built compositionally during parsing or generation) and actual,
grammar-independent MRS objectss, as specified in the **Semantic
Interface** (SEM-I). VPM documentation is available from the
[RmrsVpm](https://delph-in.github.io/docs/tools/RmrsVpm) page.

# LOGON Machine Translation (In)Formalism

Last update: 2023-06-26 by Guy Emerson [[edit](https://github.com/delph-in/docs/wiki/DelphinTutorial_Formalisms/_edit)]{% endraw %}