{% raw %}## Background

There are three major types of possesssive constructions: (1)
predicative possessive constructions, (2) external possessive
constructions, and (3) adnominal possessive constructions. Of these
three, this library covers only the last type of constructions. These
three types of constructions are distinguished as follows:

**Predicative possessive expressions** are constructions in which the
possessive relationship between two entities is expressed by means of a
verb. This is often a verb that is roughly equivalent to the English
verbs "have" or "belong". Alternatively, in some cases, possession may
be expressed by constructions where the possessor is marked by an
oblique case or an adposition and the verb is an existential verb of
some kind, as in the Latin (lat) example below.

|                                          |             |          |
|------------------------------------------|-------------|----------|
| mihi                                     | est         | liber    |
| 1SG.DAT                                  | be.3SG.PRES | book.NOM |
| 'I have a book' (lit. 'to me is a book') |             |          |

\[Bernd Heine. Possession: cognitive sources, forces, and
grammaticalization. Cambridge University Press, Cambridge, 1997.\]

**External possessive constructions** are defined as expressions in
which "a possessive modifier does not occur as a dependent constituent
of the modified NP, but NP-externally as a constituent of the clause."
This can be seen in German (ger), such as in the example below. Here,
the possessor *dem Kind* 'the child' is not a dependent of the
possessum, but rather is simply another argument of the verb *wusch*
'washed.' However, in this construction, it is only understandable as
the possessor. External possessive expressions are not found in all
languages and they are not modeled by this library.

|                                       |        |        |         |       |         |       |
|---------------------------------------|--------|--------|---------|-------|---------|-------|
| die                                   | Mutter | wusch  | dem     | Kind  | die     | Haare |
| the                                   | mother | washed | the.DAT | child | the.ACC | hairs |
| 'The mother washed the child's hair.' |        |        |         |       |         |       |

\[Martin Haspelmath. External possession in a european areal
perspective. In Doris Payne and Immanuel Barshi, editors, External
Possession. John Benjamins, Amsterdam, 1999.\]

In **adnominal possessive constructions**, the possessor and the
possessum form a single noun phrase together. The possessor is a
syntactic dependent of the possessum. An example of an adnominal
possessive phrase in Finnish (fin) is given below:

|                |              |
|----------------|--------------|
| heidän         | ystävä-nsä   |
| 3PL.POSS       | friend-3POSS |
| 'their friend' |              |

\[Ida Toivonen. The morphsyntax of Finnish possessives. Natural Language
and Linguistic Theory, 18(3):579{609, 2000.\]

## Adnominal Possession as Modeled by this Library

In this library, there are two major ways to model a possessive
construction: as a **possessive strategy** or as an instance of a
**possessor pronoun**. Adding a possessive strategy to your grammar will
add any appropriate inflecting rules or lexical items that mark
possessive phrases in your language. Adding a class of possessor
pronouns adds the lexical items corresponding to the possessor pronouns,
or the inflectional rules that add affixal possessor pronouns. In both
cases, any necessary phrase types are added as well.

The questionnaire prompts the user to supply information that is needed
to model a given possessive strategy or class of pronouns. This
information includes the order of constituents, how and where they are
marked, and the syntactic relationship between them. Though the
questionnaire is intended to be largely self-explanatory, some
instruction is given here on how best to model the constructions found
in your language. Topics covered include the distinction between
possessive strategies and possessor pronouns, the difference between
specifier-like and modifier-like possessor pronouns, the recommended way
to model constructions that are traditionally analyzed genitive case
marking on the possessor, and the coverage of inalienable possession.
Should questions remain, please contact the matrix-dev mailing list.

### Possessive strategies vs. possessor pronouns

As used in the adnominal possession customization page, the terms
**possessive strategy** and **possessor pronoun** refer to different
phenomena, though the delineation between the two is not always clear,
given the overlap between the two. Here are some examples of phenomena
in various languages, with the best analysis (possessive strategy or
possessor pronoun) indicated.

##### Examples of possessive strategies:

**Case 1: Neither argument may be a pronoun:**

English (eng) ('s-possessive)

|     |       |     |
|-----|-------|-----|
| the | cat's | paw |

|       |     |
|-------|-----|
| \*I's | paw |

**Case 2: The possessor can be a pronoun, but the pronoun is not
distinct from non-possessive pronouns:**

Japanese (jpn) (possessor marked by a clitic)

|                      |      |      |
|----------------------|------|------|
| sensee               | no   | hon  |
| teacher              | POSS | book |
| ‘the teacher's book’ |      |      |

|             |      |        |
|-------------|------|--------|
| watashi     | no   | ofisu  |
| 1SG         | POSS | office |
| ‘my office’ |      |        |

\[Nazikian, F., Hudson, M. (2014). Modern Japanese Grammar. London:
Routledge.\]

Fijian (fij) (possessum marked by adposition; possessor unmarked)

|              |          |      |
|--------------|----------|------|
| a            | mata-i   | Jone |
| a            | eye-POSS | John |
| ‘John’s eye’ |          |      |

|               |           |          |
|---------------|-----------|----------|
| a             | liga-i    | ‘eirau   |
| art           | hand-POSS | 1DU.EXCL |
| ‘our hand(s)’ |           |          |

\[Matthew S. Dryer and Martin Haspelmath, editors. WALS Online. Max
Planck Institute for Evolutionary Anthropology, Leipzig, 2013. URL
<http://wals.info/>. \]

**Case 3: Non-possessive pronouns can take possessive affixes that all
nouns take:**

Georgian (kat):

|              |         |
|--------------|---------|
| shen-i       | shvil-i |
| 2sg-POSS.NOM | shvil-i |
| 'your child' |         |

(cf. the non-possessive form of the 2SG pronoun, *shen*)

\[Brian G. Hewitt. Georgian: A structural reference grammar. John
Benjamins, Amsterdam, 1995.\]

In order to control whether a given affix attaches to pronouns or not,
the user should create distinctive noun classes for pronouns and
non-pronouns on the Lexicon subpage, and then indicated whether the
position class that contains possessive affixes can attach to the
pronoun class or not.

##### Examples of possessor pronouns:

**Case 1: The possessor pronoun is entirely different from
non-possessive pronouns:**

English (eng)

|          |     |
|----------|-----|
| my       | hat |
| 1SG.POSS | hat |
| ‘my hat’ |     |

**Case 2: The possessor pronoun is an affix on the possessum:**

Hungarian (hun)

|           |              |     |
|-----------|--------------|-----|
| a         | kalap-unk    |     |
| the       | hat-1PL.POSS |     |
| ‘our hat’ |              |     |

\[Anna Szabolcsi. The noun phrase. In The Syntactic structure of
Hungarian, volume 27 of Syntax and semantics. Academic Press, San Diego,
1994.\]

### On the specifier/modifier distinction:

**Specifier-like possessors.** In some strategies, the possessor takes
the place that one would expect a specifier (such as a determiner) to
take. English is a good example of this phenomenon:

Pat's book

\*the Pat's book

The possessum, *book,* cannot take a determiner, because the specifier
role is being filled by the possessor *Pat's.*

Specifier-like possessors are also characterized by a word order wherein
modifiers of the possessum appear between the possessor and the
possessum:

Pat's blue book

\*blue Pat's book (where the book is the thing that is blue)

**Modifier-like possessors.** In some strategies the possessor functions
more like a modifier of the possessum. Ancient Greek (grc) is an example
of this kind of language. As seen below, the possessum can take an
article irrespective of whether or not the possessor appears:

|                      |              |                  |                |
|----------------------|--------------|------------------|----------------|
| he:                  | toû          | patros           | oikia          |
| the.F.SG.NOM         | the.M.SG.GEN | father(M).SG.GEN | house(F)Sg.NOM |
| 'the father's house' |              |                  |                |

\[William W. Goodwin. A Greek Grammar. Macmillan & Co., London, 1894.\]

Modifier-like possessors are also able to appear in varying orders
relative to other modifiers.

**NB: if you don't have data that suggests one analysis over another,
the specifier-like analysis is a recommended default.**

**The specifier/modifier distinction in possessor pronouns:**

Like full NP possessors, possessor pronouns can also act either like
specifiers or modifiers.

### Modeling possessors marked with genitive case

A genitive case affix cannot be simply identical to the possessive
affix. If the genitive case affix were to carry the necessary possessive
semantics, then the genitive case could only be used in adnominal
possessive constructions, while many languages use the genitive case in
a host of other contexts as well. One possible analysis is to have the
genitive case affix simply be homophonous with but distinct from the
possessor marking. Though this would cover the facts, it would overlook
the fact that the genitive affix coincides completely with the
possessive affix. Instead, it is recommended that the user analyze the
possessive construction as an unmarked construction wherein the
possessor is constrained to have the case value *genitive*. This allows
the genitive case affix to be identical to the affix that appears on the
possessor without needing to carry the possessive semantics into
contexts where they would not be appropriate.

The user can implement this analysis as follows: on the Case subpage,
enter the name of the case that marks possessors (e.g. *genitive*).
Next, create a possessive strategy where no marking appears on either
the possessor or the possessum. When prompted, indicate that the
possessor is required to have the value *genitive* for the feature
*case*. Finally, ensure that the genitive affixes are defined on the
Morphology subpage.

### Inalienable possession

The distinction between alienably and inalienably possessed nouns is not
fully modeled by this library at this time. However, many languages that
make this distinction can nonetheless be modeled by taking advantage of
architecture already in place in other libraries. For example, in
languages where one class of nouns is required to appear with a
possessive affix, the user can define distinct noun classes on the
Lexicon page, and then require the desired possessive affixes by
checking the 'obligatorily occurs' box on the appropriate position class
on the Morphology subpage.

Currently this library does not support cases where the possessum
requires a certain type of possessive marking, but is not marked by an
affix. In order to fully model these languages, the user will have to
directly edit the grammar. The best approach to modeling such a language
would be to begin by defining noun classes on the Lexicon page that
delineate the different classes of possessum. Each noun class should
share some distinguishing syntactic feature (e.g. a boolean type called
*inalienable*), as defined on the Other Features subpage. The user can
then easily add constraints to the lexical items, lexical rules, and
phrase structure rules that are added by the library currently.

Last update: 2019-04-26 by ElizabethNielsen [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_AdnominalPossession/_edit)]{% endraw %}