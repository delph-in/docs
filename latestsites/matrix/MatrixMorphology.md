{% raw %}# Matrix Morphology

## INFLECTED

INFLECTED is a top-level attribute with an AVM of "flags" as its value.
Flags model the co-occurrence restrictions between lexical types and
lexical rule types, and draw their values from the luk hierarchy.

## Matrix Morphotactics

## Matrix Morphosyntax

## Matrix Morphophonology

## Regression testing

The following patterns are, or should be, implemented to ensure the
morphotactic system is working properly:

|                              |                                                                                                                                                |                 |
|------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|-----------------|
| **Test**                     | **Details**                                                                                                                                    | **Implemented** |
| morph-opt-oblig-single-input | 2 PCs, each with one input. One is optional, and the other is obligatory                                                                       | Yes             |
| morph-impl-expl-disjunction  | 5 PCs, A-&gt;B, B-&gt;C, A-&gt;D, D-&gt;E, A requires (B or D ) and C and E, so both an explicit and implicit disjunction in flags are created | Yes             |
| morph-req-fbd                | Tests forward- and backward-require and forbid co-occurrence restrictions                                                                      | Yes             |
| morph-lrt-inputs             | PCs with more complex lexical rule hierarchies are used to test inputs and co-occurrence restrictions                                          | Yes             |

Note that some tests may be collapsed.

## History

(pre-O'Hara description?)

O'Hara added TRACK variables for co-occurrence restrictions and planning
of lexeme-to-lexeme and lexeme-to-word (sometimes word-to-lexeme) rules
to handle obligatory rules. [O'Hara
2008](http://www.delph-in.net/matrix/kohara-thesis.pdf)

Goodman merged TRACK into INFLECTED so co-occurrence constraints
directly affect lexical integrity (ability to use lexemes with syntactic
(phrasal) rules. [Goodman and Bender
2010](http://makino.linguist.univ-paris-diderot.fr/files/hpsg2010/file/abstracts/MFG/goodman-bender-mfg.pdf)

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/MatrixMorphology/_edit)]{% endraw %}