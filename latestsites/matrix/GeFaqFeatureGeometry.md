{% raw %}# Grammar Engineering Frequently Asked Questions

## What is the feature geometry assigned in the Matrix? (Or: How do I figure out what paths I need to use?)

It's not possible to exhaustively describe the feature geometry for at
least two reasons:

1. It's not the same for every sign (consider the features inside COMPS
on transitive versus intransitive verbs).
2. It's not static: Anyone using the Matrix is adding features.
Furthermore, depending on how you configured the Matrix (if you're
using the modules and the configuration script), you might have
slightly different feature sets (e.g., with or without AUX).

Nonetheless, it can be useful to have a quick reference guide to the
basic feature geometry, especially if you're having a hard time getting
path names right. This FAQ attempts to provide that basic guide.

* * *

### Outermost features

The top level features on all signs are as follows:

- STEM the orthography
- SYNSEM syntactic and semantic constraints
- KEY-ARG is this the daughter that should be instantiated first? (NB:
This feature is typically set not in the definition of the sign
itself but in the definition of a rule describing which of its
daughters should be instantiated first.)
- ARGS daughters (for lexical entries, this is just ignored; for
phrase structure rules, it is the daughters, for lexical rules, it
is (logically) the input)
- INFLECTED is a bundle of features ("FLAG" features) that track
whether required lexical rules have applied.

In addition, phrases and lex-rules also have the following:

- C-CONT constructional content (the semantic contribution of the
phrase or lex rule)
- RULE-NAME a string giving the rule a name for LKB display purposes

Headed-phrases further have:

- HEAD-DTR the sign that is the head-daughter, linked (by
**basic-head-only**, **basic-head-final**, or **head-initial**) to
the appropriate element of the ARGS list.

Binary headed-phrases have an analogous feature

- NON-HEAD-DTR the sign that is the non-head daughter.

And lexical entries (lex-item) and lexical rules also have the
following:

- ALTS a place for features tracking which lexical rules an item can
undergo (not well-developed within the Matrix as of 4/2006)
- ARG-ST the argument structure of the lexical item (only on words,
but NB we don't do binding theory; ARG-ST is used to assist in
cross-linguistic statements of linking facts, or the mapping of
syntactic and semantic arugments)

* * *

### Synsem Features

Most of the action happens within SYNSEM (either the SYNSEM of the sign
itself, or the SYNSEM of its ARGS). Inside SYNSEM, one finds:

- LOCAL syntactic and semantic information, excluding that dealing
with non-local dependencies.
- NON-LOCAL information about non-local dependencies
- OPT for marking certain arguments as optional or obligatory (note
that this feature is usually used by selecting heads inside their
valence features)
- OPT-CS a feature allowing lexical heads to specify how their
arguments are to be interpreted (as definite or indefinite) when
they are left unxpressed. This may be superseded by a Sem-I based
solution. Like OPT, signs don't specify their own OPT-CS value, but
rather the OPT-CS value of their dependents.
- LIGHT a feature useful for handling phenomena that distinguish words
(or word-like small phrases) from phrases (see Abeille and Godard
2003).
- MODIFIED a feature used in the analysis of modification to control
spurious ambiguity in the case of left and right modifiers.
- LKEYS pointers into the semantics of lexical items, useful for
syntax-semantic linking in defining lexical types.

* * *

### Local features

Inside LOCAL, one finds the following:

- CAT category (head, valence)
- CONT content (semantics)
- CTXT context (pragmatic information; not well developed as of
4/2006)
- AGR (syntactic) agreement
- COORD a feature which distinguishes phrases that are inside of
coordinate structures from those that are not.
- COORD-REL a feature which mediates semantic composition in the case
of coordination
- COORD-STRAT a feature for distinguishing coordination strategies in
languages which have more than one.

### Non-local features

Inside NON-LOCAL, one finds the following features, which all take
difference lists as their values:

- SLASH long-distance dependencies (topicalization, wh-questions,
relativization, easy-adjectives)
- QUE marks the presence of wh- question words within a consituent;
used in the analysis of wh-questions
- REL marks the presence of relative pronouns within a constituent;
used in the analysis of pied piping in relative clauses

* * *

### Category features

Inside CAT, one finds the following:

- HEAD Part of speech information. NB: as of 4/2006, the Matrix
provides a hierarchy of types which serve as the value of HEAD, but
no features for those types, beyond MOD and KEYS.
- VAL Valence requirements (specifier, subject, complements)
- MC distinguishes main from subordinate clauses, in case of phenomena
sensitive to this distinction
- HC-LIGHT determines the LIGHT value of a head-complement phrase with
the current item as its head.
- POSTHEAD controls order of modifiers with respect to heads

* * *

### Head and Valence features

Inside HEAD, one finds the following:

- MOD list valued; either a list containing a single synsem that
matches the kind of constituent the sign can modify, or empty.
- KEYS fine-grained subclassification of part of speech types (e.g.,
temporal v. non-temporal nouns, specific adpositions)

Inside VAL, one finds the follwing, which all take lists of synsems as
their values.

- SUBJ subject of verbs, other predicates
- SPR specifier of nouns, adjectives; as a basic rule of thumb,
specifiers are semantic heads, subjects are not
- COMPS complements of any kind of head
- SPEC feature used by specifiers to select their heads (and therefore
gain access to information for semantic composition)
- --KEYCOMP pointer to 'key complement' on COMPS list.

* * *

### Content features

Inside CONT as well as C-CONT, one finds the following:

- HOOK information available for further semantic composition
- RELS list of elementary predications (difference list to facilitate
append)
- HCONS list of handle constraints (difference list to facilitate
append)
- MSG pointer to message on RELS list.

The value of RELS is a list of elementary predications, which typically
have the following features:

- LBL the handle which labels the ep.
- WLINK a list used (by the underlying machinery) for linking an ep to
the lexical item that contributed it; useful in some applications
- PRED the predicate name of the relation
- some list of ARGn features, each taking an index or a handle as
their value.

The value of HCONS is a list of qeqs, which have the following features:

- HARG the handle with higher scope
- LARG the handle with lower scope

Inside HOOK, one finds the following:

- LTOP local top handle
- INDEX index (individual or event) of the local sign
- XARG distinguished argument of the local sign, available for control
by outside predicates

* * *

### Lexkeys

Inside LKEYS one finds the following:

- KEYREL pointer to main relation in RELS
- ALTKEYREL pointer to an alternate relation in RELS
- --COMPKEY pointer to the first complement's KEY predsort
- --OCOMPKEY pointer to the oblique complements's KEY predsort

* * *

### Examples

Here are a couple of pdf files meant to be used as "cheat sheets" for
reading of the path names of features you want to constrain in your
grammars. They are not complete, but aim to present the most commonly
used features in a readable format.

- [for phrases](http://depts.washington.edu/uwcl/docs/geo1.pdf)
- [for lexical
entries](http://depts.washington.edu/uwcl/docs/geo2.pdf)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqFeatureGeometry/_edit)]{% endraw %}