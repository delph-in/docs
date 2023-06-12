{% raw %}# gCLIMB for German

## General

This page provides background information on phenomena and
implementations included in gCLIMB for German.

In this document, *I* and *me* refers to AntskeFokkens.

**Disclaimer**

1. This documentation is under construction and incomplete. At present,
the only way to get detailed into implementations of gCLIMB is by
looking at the grammars.
2. I am currently finishing my thesis. In the near future, this page
will therefore mostly contain background information that completes
work described in my PhD. If you have request on other explanations
or documentation, please contact [me](mailto:antske.fokkens@vu.nl)
and I'll see if I can shift priorities around.
3. This documentation will be restructured soon

## Where to get gCLIMB

For now, e-mail [me](mailto:antske.fokkens@vu.nl). The repository should
be accessible for guest accounts soon.

## Phenomena

This section provides an incomplete list of phenomena implemented in
gCLIMB for German. It describes when the phenomenon was added, when
revised and what decisions were made concerning the scope of the
phenomenon (i.e. what to do rare constructions, examples that are
awkward, but not ungrammatical etc.)

### Word order for verbs (left and right brackets, relative order in right bracket)

In principle covered since Fokkens (2011).

**Old Bug report**

In previous versions there was a problem with interaction between polar
questions and restricting the verbal cluster. The arg-comp analysis
incorrectly accepted the following sentences:

|                         |             |                  |                |                                  |              |
|-------------------------|-------------|------------------|----------------|----------------------------------|--------------|
| **Topological fields:** | **Vorfeld** | **Left Bracket** | **Mittelfeld** | **Right Bracket**                | **Nachfeld** |
| **German:**             | \*          | Hat              |                | schlafen der Mann können         |              |
| **Transliteration:**    |             | have.3rd.sg      |                | sleep.inf the.nom man.nom can.nf |              |
| **German:**             | \*          | Hat              | mich           | sehen der Mann können            |              |
| **Transliteration:**    |             | have.3rd.sg      | me.acc         | see.inf the.nom man.nom can.nf   |              |

The problem was corrected at a later stage. More information can be
found in the repository overview below.

**Development stages**

|                        |                                                                  |
|------------------------|------------------------------------------------------------------|
| **repository version** | **addition/revision**                                            |
| 19613                  | Addition of polar questions, including bug for arg-comp analysis |
| 19617                  | Bug fixed                                                        |

### Split verbal clusters

Split verbal clusters are a specific form of partial VP fronting, where
the main verb is placed in the Vorfeld (optionally accompanied by one or
more arguments) and at least one auxiliary is left in the Right Bracket.
An example (meaning *you should be able to sleep here*):

|                         |             |                  |                          |                   |              |
|-------------------------|-------------|------------------|--------------------------|-------------------|--------------|
| **Topological fields:** | **Vorfeld** | **Left Bracket** | **Mittelfeld**           | **Right Bracket** | **Nachfeld** |
| **German:**             | Schlafen    | solltest         | Du hier auf jeden Fall   | können            |              |
| **Transliteration:**    | sleep.inf   | should.2nd.sg    | you.nom here in any case | can.inf           |              |

Split verbal clusters are beyond doubt grammatical, but marked and
rarely used. gCLIMB allows you to either include or exclude them. These
two possibilities have been present in gCLIMB since Fokkens (2011),
though revisions have been made.

**Old Bug report**

**Bug 1**

At certain stages in the past, the argument-composition analysis in
gCLIMB required the fronted main verb to fit subcategorization
requirements of the finite verb in the left bracket. This is incorrect,
it should fit subcategorization requirements of the auxiliary in the
Nachfeld that governs it. The auxiliary+construction analysis in this
version is correct. The repository table below provides the information
that is currently available about this bug. Where it was introduced
exactly and when it was fixed completely is still under investigation.

Subversion version 19613 (2 major updated after the place where the bug
was found) largely recovers the bug. Split clusters work in principle,
except for cases where the main verb and dative argument are fronted and
subject and accusative argument remain in the Mittelfeld. The example
below illustrates such a structure (*The man should be allowed to give
the wine to me*):

|                         |                 |                  |                                         |                   |              |
|-------------------------|-----------------|------------------|-----------------------------------------|-------------------|--------------|
| **Topological fields:** | **Vorfeld**     | **Left Bracket** | **Mittelfeld**                          | **Right Bracket** | **Nachfeld** |
| **German:**             | Mir geben       | sollte           | der Mann den Wein                       | dürfen            |              |
| **Transliteration:**    | me.dat give.inf | should.3rd.sg    | the.nom.sg mann.nom.sg the.acc wine.acc | may.inf           |              |

**Bug 2**

As informal complements were introduced, the interaction between split
verbal cluster of the auxiliary + verbal construction analysis and
informal vcomps was broken. It accepted the following sentence
(ungrammatical unless *schläft er?* would be direct speech):

    *Schläft      er sagt       der        Mann
     sleep.3rd.sg he say.3rd.sg the.nom.sg man.nom.sg

**Development stages**

|                        |                                                                                                                                    |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| **repository version** | **addition/revision**                                                                                                              |
| Older branch           | Split cluster already optionally included. The aux-rule analysis uses a hack that violates principles of semantic compositionality |
| 19578                  | Bug on subcategorization requirements for arg-comp analysis identified                                                             |
| 19613                  | Bug on subcategorization partially fixed (no partial VP with only dative argument fronted)                                         |
| 19617                  | Informal vcomps are added, bug interacting with aux+vconstr split cluster analysis                                                 |
| 19732                  | Bug on subcategorization completely fixed                                                                                          |
| ...                    | ...                                                                                                                                |
| 23282                  | Bugs known to be fixed completely, more principled analysis for aux-rule and split clusters (Fokkens, in progress)                 |

### Subordinate clauses, VCOMP

Supports both subordinates introduced by complementizers *dass*(*that*)
and *ob* (*whether*) with finite verb final word order, as well as
informal (spoken language), where the complementizer is dropped and the
finite verb is placed in second position.

    Er sagte            dass der        Mann        mir     das        Buch        schenken würde.
    He say.past.3rd.sg  that the.nom.sg man.nom.sg  me.dat  the.acc.sg book.acc.sg give.inf would.3rd.sg
    ''He said that the man would give the book to me.''
    
    
    Er sagte            der        Mann        würde        mir     das        Buch        schenken.
    He say.past.3rd.sg  the.nom.sg man.nom.sg  would.3rd-sg me.dat  the.acc.sg book.acc.sg give.inf
    ''He said that the man would give the book to me.''
    
    
    *Er sagte            der        Mann        mir     das        Buch        schenken würde.
     He say.past.3rd.sg  the.nom.sg man.nom.sg  me.dat  the.acc.sg book.acc.sg give.inf would.3rd.sg
    
    
    *Er sagte            dass der        Mann        würde        mir     das        Buch        schenken.
     He say.past.3rd.sg  that the.nom.sg man.nom.sg  would.3rd.sg me.dat  the.acc.sg book.acc.sg give.inf

**Old bug**

When first introduced, the grammar slightly overgenerated. Matrix verbs
selecting a question complement could be combined with a v2 informal
complement. Examples like the following were accepted:

    *Er fragt      der        Mann       schenkt     mir    das        Buch.
     He ask.3rd.sg the.nom.sg man.nom.sg give.3rd.sg me.dat the.dat.sg book.dat.sg

Details on when the bug was introduced and when it was fixed can be
found below.

**Development stages**

|                        |                                                                                                                                                      |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **repository version** | **addition/revision**                                                                                                                                |
| 19617                  | subordinates introduced by 'dass' and 'ob' as well as informal vcomps introduced. Bug: overgenerating informals for verbs that do not allow for this |
| 19769                  | Bug fixed                                                                                                                                            |

### Adverbial Negation

Comments:

- Fronting of the negative adverb in German sounds unnatural, but
could be acceptable in poetry. In the initial implementation it is
accepted by the grammar (i.e. parsed and generated)

<!-- -->


    ?Nicht schläft           der     Mann.
    Not    sleep.pres.3rd.sg the.nom man.nom.
    ''The Man doesn't sleep.''

**Development stages**

- |                        |                                                                   |
|------------------------|-------------------------------------------------------------------|
| **repository version** | **addition/revision**                                             |
| 19613                  | Initial implementation of *nicht* with free position of adverbial |

### Object raising

**old bug**

When object raising was introduced, the interaction of VP-coordination
and object-raising was broken. Examples like the following were not
covered.

    Er will        tanzen    und kann       lachen.
    He want.3rd.sg dance.inf and can.3rd.sg laugh.inf
    ''He wants to dance and can laugh.''
    
    Er will        schlafen  und tanzt.
    He want.3rd.sg sleep.inf and dance.3rd.sg
    ''He wants to sleep and dances.''

**Development stages**

|                        |                                                                                                    |
|------------------------|----------------------------------------------------------------------------------------------------|
| **repository version** | **addition/revision**                                                                              |
| 19732                  | Implementation of object raising, bug of interaction vp-coord and obj-raising for arg-comp present |
| ...                    | ...                                                                                                |
| 23282                  | Bug known to be fixed                                                                              |

## References

Fokkens, Antske (2011) Metagrammar engineering: Towards systematic ex-
ploration of implemented grammars. In Proceedings of the 49th Annual
Meeting of the Association for Computational Linguistics: Human Lan-
guage Technologies, pages 1066–1076, Portland, Oregon, USA: Association
for Computational Linguistics.

Fokkens, Antske (in progress) Enhancing empirical research for
linguistic precision grammars. PhD thesis. Saarland University.\
**NB** References to this work in the documentation are already written.
Please contact me if you are interested in this information before the
PhD is done.

Last update: 2012-12-31 by AntskeFokkens [[edit](https://github.com/delph-in/docs/wiki/Climb_GClimb_German/_edit)]{% endraw %}