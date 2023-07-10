{% raw %}# Documentation for the Grammar Matrix Customization Clausal Modifiers Library

## Versions 16 – 22

By Kristen Howell

# Introduction

This document presents background information on the clausal modifiers
library of the Grammar Matrix Customization System (Bender et al., 2002;
Bender and Flickinger, 2005; Bender et al., 2010) and provides
instructions for filling out this section of the questionnaire. General
instructions for using the questionnaire can be found
[here](https://delph-in.github.io/docs/matrix/MatrixDocTop).

# Citing the Clausal Modifier Library

\[This section is currently under construction.\]

# Clausal Modifiers

Drawing from the typological survey of Thompson et al. (2007) and
description in Li and Thompson (1989), we divide clausal modifiers into
three basic strategies: Those marked by a free subordinator morpheme
(1), those marked by a free subordinator morpheme pair (one in the
subordinate clause and one in the matrix clause) (2), and those marked
by special verbal morphology (but no free subordinator) (3).

    (1) Ame  ga  agaru to,  Gon wa  hotto  shite      ana  kara haidemashita
        rain NOM stop  when Gon TOP relief performing hole from snuck.out
        `When the rain stopped, Gon got relieved and came out of the hole' Japanese [jpn] (Thompson et al., 2007)
    
    (2) Yīnwèi  tiān hēi   le, suǒyǐ wǒ méi chǖ-qu
        because sky  black CRS so    I  no  exit-go
        `Because it had gotten dark, I didn't go out.' Mandarin [cmn] (Li and Thompson, 1989)
    
    (3) Yaʔáʃ ŋéŋi         $uŋá-l kí-ʃ      pu-wá-qi-pi
        man   leave.remote woman  house.ACC her-sweep-PURP
        `The man left in order for the woman to sweep the house' Luiseño [lui] (Thompson et al., 2007)

Further variation among clausal modifier strategies is described under
Options.

# Options

The [Clausal
Modifiers](http://matrix.ling.washington.edu/customize/matrix.cgi?subpage=clausalmods)
page allows users to define any number of clausal modifier strategies,
which may vary in the following ways.

## Clausal Modifier Position

The clausal modifier can occur strictly before, strictly after or freely
before or after the constituent it modifies.

## Clausal Modifier Attachment

The clausal modifier can attach to verb phrases, sentences or either.

## Subordinate Predication

The subordinate predication can be contributed one of three ways, which
correspond to the three basic subordinator types described above:

1. by a free subordinator morpheme
2. by a free subordinator morpheme pair
3. no free subordinator (in which case the predication is associated
with a particular morphological form)

If the strategy uses a free subordinator morpheme or free subordinator
morpheme pair, the user may add any number subordinators and their
corresponding predications. If there is no free subordinator, the user
may only add one predication for that strategy.

The free subordinator morpheme pair includes a subordinator in the
clausal modifier, which has the same options as a free subordinator, and
a 'pair' morpheme in the matrix clause which has its own set of options.

## Subordinator Position

A free subordinator can occur strictly before, strictly after, or freely
before or after the VP or S it attaches too. Note that occurring freely
before or after is only compatible with the adverb analysis described
below.

## Subordinator Type

The user may choose to analyze the subordinator as the head of its
clause (as an adposition) or as an adverb. Typically we recommend that
the user treat the subordinator as a head unless there is evidence
otherwise. Such evidence includes attaching at the VP level or occurring
at both the beginning and end of the clause.

## Subordinator Attachment

If the subordinator is the head of the subordinate clause, it attaches
to the subordinate clause at the S level. If, however, it is an adverb,
the user may select VP or S attachment (or both).

## Subordinator Pair Adverb

Under the subordinator pair analysis, the adverb in the matrix clause
has the same position and attachment choices as the adverb subordinator.

## Special Morphology

Whether or not the strategy has a free subordinator, the user can add
special morphological constraints on the subordinate verb. Current
supported features include:

- FORM
- NMZ (see
[MatrixDoc/NominalizedClauses](https://delph-in.github.io/docs/matrix/MatrixDoc_NominalizedClauses))
- ASPECT
- MOOD
- Syntactic features (under HEAD) defined on the
[MatrixDoc/OtherFeatures](https://delph-in.github.io/docs/matrix/MatrixDoc_OtherFeatures) subpage)

Some common examples include:

- A non-finite verb is required: check the box to add FORM on the
Other Features page. Then click "Add a feature" in the clausal
modifier strategy and select FORM non-finite.
- Subjunctive mood is required: define the values for MOOD on the
[Tense, Aspect, Mood](https://delph-in.github.io/docs/matrix/MatrixDoc_TenseAspectMood) Subpage. Then
select MOOD subjunctive for the clausal modifier strategy.
- The subordinate clause must be nominalized: Define a nominalization
strategy on the [Nominalized Clauses](https://delph-in.github.io/docs/matrix/MatrixDoc_NominalizedClauses)
subpage. Then add nominalization "your strategy" to the clausal
modifier strategy. If the language uses different nominalization
morphemes in different clausal modifier strategies, we recommend
creating a feature on the Other Features page (under HEAD) that is
for both nominal and verbal categories. Associate this feature with
the morphological rule that adds the nominalization feature and with
the appropriate clausal modifier strategy.

## Subject Sharing

If the subject is shared between the matrix and subordinate clause and
is unexpressed in the subordinate clause, the user should check "Yes"
for subject sharing.

# Analyses

### Adposition subordinators

If the subordinator is an adposition, the customization system will add
this lexical supertype:

    adposition-subord-lex-item := single-rel-lex-item & norm-ltop-lex-item &
      [ SYNSEM.LOCAL.CAT [ MC -,
                           HEAD adp &
                                [ MOD < [ LOCAL scopal-mod &
                                                [ CAT [ HEAD verb,
                                                        VAL.COMPS < > ] ] ] > ],
                           VAL [ SUBJ < >,
                                 SPR < >,
                                 COMPS < [ OPT -,
                                           LOCAL.CAT [ MC -,
                                                       VAL.COMPS < > ] ] > ] ] ].

We create the following subtype of adposition-subord-lex-item if the
subordinate clause is verbal (a separate subtype is added if the
subordinate clause is nominalized)

    subord-with-verbal-comp-lex := adposition-subord-lex-item &
      [ SYNSEM [ LOCAL [ CAT [ HEAD.MOD < [ LOCAL [ CAT.HEAD verb,
                                                    CONT.HOOK [ LTOP #mod,
                                                                INDEX #index ] ] ] >,
                               VAL.COMPS < [ LOCAL [ CAT.HEAD verb,
                                                     CONT.HOOK.LTOP #comps ] ] > ],
                         CONT [ HCONS <! qeq &
                                         [ HARG #h1,
                                           LARG #mod ], qeq &
                                                        [ HARG #h2,
                                                          LARG #comps ] !>,
                                HOOK.INDEX #index ] ],
                 LKEYS.KEYREL [ ARG1 #h1,
                                ARG2 #h2 ] ] ].

### Adverb subordinators

If the subordinator is an adverb, the customization system will add this
lexical supertype:

    adverb-subord-lex-item := no-rels-hcons-lex-item &
      [ SYNSEM.LOCAL.CAT [ VAL [ SUBJ < >,
                                 SPR < >,
                                 COMPS < > ],
                           HEAD adv &
                                [ MOD < [ SUBORDINATED none,
                                          LOCAL intersective-mod &
                                                [ CAT [ MC -,
                                                        HEAD verb ] ] ] > ] ] ].

We define a unary rule to add the subordinate predication and to add the
matrix clause to the subordinate clauses MOD list.

    adv-marked-subord-clause-phrase := unary-phrase &
      [ SYNSEM.LOCAL [ CAT [ MC -,
                             VAL [ SPR < >,
                                   COMPS < >,
                                   SPEC < >,
                                   SUBJ #subj ],
                             HEAD adp &
                                  [ MOD < [ LOCAL scopal-mod &
                                                  [ CAT [ HEAD verb,
                                                          VAL [ SPR < >,
                                                                COMPS < > ] ],
                                                    CONT.HOOK [ LTOP #mcl,
                                                                INDEX #index ] ] ] > ] ],
                       COORD - ],
        C-CONT [ RELS <! arg12-ev-relation &
                         [ ARG1 #mch,
                           ARG2 #sch ] !>,
                 HCONS <! qeq &
                          [ HARG #mch,
                            LARG #mcl ], qeq &
                                         [ HARG #sch,
                                           LARG #scl ] !>,
                 HOOK.INDEX #index ],
        ARGS < [ SYNSEM.LOCAL [ CAT [ HEAD verb &
                                           [ MOD < > ],
                                      VAL [ SUBJ #subj,
                                            SPR < >,
                                            COMPS < >,
                                            SPEC < > ] ],
                                CONT.HOOK.LTOP #scl,
                                COORD - ] ] > ].

Subtypes of this rule contain a PRED value and are associated with a
clause that has the appropriate adverb via the SUBORDINATED feature.

### Morphologically marked subordination

For morphological subordination, the customization system adds a unary
phrase structure rule similar to adv-marked-subord-clause-phrase, that
is sensitive to the relevant morphological property. Abstracting away
from the constraints specifying that property, the rule is as follows:

    morphological-subord-clause-phrase := unary-phrase &
      [ SYNSEM.LOCAL [ CAT [ MC -,
                             VAL [ SUBJ #subj,
                                   SPR < >,
                                   COMPS < > ],
                             HEAD adp &
                                  [ MOD < [ LOCAL scopal-mod &
                                                  [ CAT [ HEAD verb,
                                                          VAL [ SPR < >,
                                                                COMPS < > ] ],
                                                    CONT.HOOK [ LTOP #mcl,
                                                                INDEX #index ] ] ] > ] ],
                       COORD - ],
        C-CONT [ RELS <! [ ARG1 #mch,
                           ARG2 #sch ] !>,
                 HCONS <! qeq &
                          [ HARG #mch,
                            LARG #mcl ], qeq &
                                         [ HARG #sch,
                                           LARG #scl ] !>,
                 HOOK.INDEX #index ],
        ARGS < [ SYNSEM.LOCAL [ CAT [ HEAD verb,
                                      MC na-or-+,
                                      VAL [ SUBJ #subj,
                                            SPR < >,
                                            COMPS < > ] ],
                                CONT.HOOK.LTOP #scl,
                                COORD - ] ] > ].

Subtypes of this rule contain a PRED value and the appropriate feature
constraints for the morphological property.

### Combined strategies

For each strategy, we create subtypes of the lexical types and unary
rules to constrain the strategy according to the user's choices. These
are specified on the lexical type or unary rule as detailed in the
following table.

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>Constraints</p></td>
<td><p>Adposition Subordinator</p></td>
<td><p>Adverb Subordinator</p></td>
<td><p>No Subordinator</p></td>
</tr>
<tr class="even">
<td><p>Clause<br />
Position</p></td>
<td><p>POSTHEAD +,-,bool<br />
(lexical item)</p></td>
<td><p>POSTHEAD +,-,bool<br />
(unary rule)</p></td>
<td><p>POSTHEAD +,-,bool<br />
(unary rule)</p></td>
</tr>
<tr class="odd">
<td><p>Clause<br />
Attachment</p></td>
<td><p>MOD.SUBJ &lt; &gt;, &lt; [ ] &gt;, none<br />
(lexical item)</p></td>
<td><p>MOD.SUBJ &lt; &gt;, &lt; [ ] &gt;, none<br />
(unary rule)</p></td>
<td><p>MOD.SUBJ &lt; &gt;, &lt; [ ] &gt;, none<br />
(unary rule)</p></td>
</tr>
<tr class="even">
<td><p>Subordinator<br />
Position</p></td>
<td><p>INIT +,-<br />
(lexical item)</p></td>
<td><p>POSTHEAD +,-,bool<br />
(unary rule)</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>Subordinator<br />
Attachment</p></td>
<td><p>COMPS.SUBJ &lt; &gt;<br />
(lexical item)</p></td>
<td><p>MOD.SUBJ &lt; &gt;, &lt; [ ] &gt;, none<br />
(lexical item)</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>Matrix<br />
Pair</p></td>
<td><p>SUBPAIR<br />
(lexical item)</p></td>
<td><p>SUBPAIR<br />
(lexical item)</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>Special<br />
Morphology</p></td>
<td><p>COMPS.FEATURE<br />
(lexical item)</p></td>
<td><p>MOD.FEATURE<br />
(lexical item)</p></td>
<td><p>DTR.FEATURE<br />
(unary rule)</p></td>
</tr>
<tr class="even">
<td><p>Nominalization</p></td>
<td><p>COMPS.NMZ +<br />
(lexical item)</p></td>
<td></td>
<td><p>DTR.NMZ +<br />
(unary rule)</p></td>
</tr>
<tr class="odd">
<td><p>Shared<br />
Subject</p></td>
<td><p>COMPS.SUBJ #subj &lt; unexpressed &gt;<br />
MOD.SUBJ #subj&lt;&lt;BR&gt;&gt;(lexical item)</p></td>
<td><p>DTR.SUBJ #subj &lt; unexpressed &gt;<br />
MOD.SUBJ #subj<br />
(unary rule)</p></td>
<td><p>DTR.SUBJ #subj &lt; unexpressed &gt;<br />
MOD.SUBJ #subj<br />
(unary rule)</p></td>
</tr>
</tbody>
</table>


### Paired subordinators

We add the SUBPAIR feature to associate subordinators with their matrix
pair. basic-head-mod-phrase-simple passes SUBPAIR up from the non-head
daughter, while the head-subject and head-complement rules pass it up
through the head-daughter. The item on the subordinate clause's MOD list
is specified to have a particular SUBPAIR value and the root symbol must
be \[SUBPAIR none\] to ensure that matrix pairs don't occur without a
subordinate clause.

Note: when adding morpheme pairs to the customization page, if the
matrix adverb is added first, the predicate for the subordinate adverb
will be auto-populated with \_adverb+subordinator\_subord\_rel. This
follows from the if+then construction in the English Resource Grammar.
For example, if 'then' is the matrix adverb and 'if' is the
subordinator, the predication will be \_if+then\_subord\_rel.

# References

Charles N Li and Sandra A Thompson. 1989. Mandarin Chinese: A functional
reference grammar. Univ of California Press.

Sandra A Thompson, Robert E Longacre, and Shin Ja J Hwang. 2007.
Adverbial clauses. Language typology and syntactic description. Volume
2: Complex constructions. ed. by Timothy Shopen. 237269. Cambridge:
Cambridge University Press.

Last update: 2018-05-09 by KristenHowell [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_ClausalModifiers/_edit)]{% endraw %}