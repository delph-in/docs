{% raw %}# (R)MRS predicate naming conventions

For compatibility with RMRS and software designed to integrate deep and
shallow processing, all MRS **pred** values should conform to the
following templates:

    _lemma_pos_sense_rel  (lexically introduced predicates)
    sense_rel            (abstract predicates introduced by constructions)

## lemma

The lemma component is a string corresponding to the (stem) orthogrophy
of the lexical entry, at least for all open-class words, and typically
also for closed-class words. By using the stem orthography, we ensure
that predicate names used in MRSs produced by deep grammars will be
interoperable with predicate names used in MRSs produced by robust
shallow processors, which name the predicates based on (lemmatized)
forms in the input. The leading underscore is used to distinguish
predicate names introduced by specific lexical entries from those
introduced by constructions or by lexical types supplying a common
predicate for a class of lexical entries.

The mapping from string to lemma is not necessarily one-to-one, for
example, some spelling variants are combined here. For example, in one
version of the ERG, *color* and *colour* both produce the predicate
\_color\_n\_1\_rel.

## pos

The pos component is one of a closed set of single lowercase letters
interpreted as described in the following section. This POS-based
information (such as might be accessible from a POS-tagger) is used for
coarse-grained sense distinctions.

## sense

Finer-grained distinctions can be made (in a precision grammar) via the
sense component. The sense component can consist of any sequence of
characters (letters, numbers, etc.), excluding the underscore which is
used to separate the components of the name. In the ERG, verb particle
constructions are handled semantically by having the verb contribute a
relation particular to that combination. We distinguish these relations
by placing the particle's orthography in the sense field. Unlike the
other components, the sense component is optional, and if omitted, its
separating underscore is also omitted. By convention, a predicate name
with no sense component is interpreted as underspecified for sense, so
if more than one sense is present in the lexicon for a given orthography
and part of speech, each of these predicate names should have a sense
component.

Note thatfor the ERG, there was a decision to always have something in
the sense field, even if there is currently no ambiguity. The main
motivation is to reduce future re-working of the SEM-I as later
enrichment might add further sense distinctions.

Every relation and predicate name ends in \_rel, for the convenience of
the grammar writer, particularly to avoid possible namespace collisions.
This suffix (and the leading underscore) can of course be suppressed by
MRS display methods if desired.

Somed examples of names are given below:

|            |                      |
|------------|----------------------|
| *aardvark* | \_aardvark\_n\_rel   |
| *bank*     | \_bank\_n\_2\_rel    |
| *bank*     | \_bank\_v\_turn\_rel |
| *look*     | \_look\_v\_up\_rel   |

Finally, one further detail of formatting should be mentioned: Words
with single lexical entries whose orthography is conventionally spelled
with a space, such as the English use of *ad hoc*, appear with the whole
orthography in the orth component, but with the space(s) replaced by the
plus sign. So the following example is also correct:

|          |                  |
|----------|------------------|
| *ad hoc* | \_ad+hoc\_j\_rel |

**Note:** it is best not use single alphabetic characters in the sense
field: \_dog\_n\_a\_rel. Doing this would make it much harder to
identify all adjective/adverbs with a single regular expression /\_a\_/.
Instead, use a number or two or more characters.

# (R)MRS POS codes

These are the POS labels in the RMRS. They form a rough set of POS tags,
suitable for exchange between different POS inventories.

|               |                                                         |                                     |                           |
|---------------|---------------------------------------------------------|-------------------------------------|---------------------------|
| Label         | Explanation                                             | Example                             | Comment                   |
| n := u        | noun                                                    | *banana\_n\_1*                      | [WordNet](/WordNet) **n** |
| v := u        | verb                                                    | bark\_v\_1                          | [WordNet](/WordNet) **v** |
| a := u        | adjective or adverb (i.e. supertype of j and r)         | fast\_a\_1                          |                           |
| j := a        | adjective                                               |                                     | [WordNet](/WordNet) **a** |
| r := a        | adverb                                                  |                                     | [WordNet](/WordNet) **r** |
| s := n, s:= v | verbal noun (used in Japanese and Korean)               | benkyou\_s\_1                       |                           |
| c := u        | conjunction                                             | and\_c\_1                           |                           |
| p := u        | adposition (preposition, postposition)                  | from\_p\_1, kara\_p\_1 (から\_p\_1) |                           |
| q := u        | quantifier (needs to be distinguished for scoping code) | this\_q\_1                          |                           |
| x := u        | other closed class                                      | ahem\_x\_1                          |                           |
| u             | unknown                                                 |                                     |                           |

Last update: 2013-03-06 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/RmrsPos/_edit)]{% endraw %}