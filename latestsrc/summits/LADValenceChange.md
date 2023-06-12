{% raw %}## Preliminaries

My current work is on adding a valence change library to the Grammar
Matrix customization system (Bender et al., 2010). The approach I'm
investigating is providing rule components (building blocks) that are
applicable cross-linguistically, which the grammar engineer can assemble
into full rules using the customization system.

Ultimately the library will support valence-decreasing operations and
valence-increasing operations; for the purpose of this session I'm
concentrating on the causative, using primarily illustrative examples
from Lakota.

## Causatives in Lakota

Lakota is a language in the Siouan family, spoken in conjunction with
its mutually-intelligible siblings Eastern Dakota (Santee-Sisseton) and
Western Dakota (Yankton-Yanktonai) dialects, by approximately 2,000
speakers in the United States and Canada, with the largest populations
in North and South Dakota.

Word order is basically SOV and postpositional, though overt nominals
are optional: 3rd person subject and object are unmarked, while other
PNs are marked by a system of verbal pronominal affixes. Stress is
phonemic but in the presence of affixation strongly tends to move
forward to not later than the second syllable. Many verbs and a few
nouns and enclitics undergo lexically-conditioned ablaut in their final
vowel, realized as -a /a/, -e /ɛ/, or -iŋ /ɪ̃/; in dictionary citation
form ablaut targets are denoted by a final capital A.

### Causative of Transitives

The straightforward causative is formed from transitive verbs with the
suffix *-khiyA* as illustrated in (1) and (2) below, along with the
corresponding MRSes:

    1a. igmú kiŋ wakhúwa
        igmú kiŋ wa-khuwá
        cat  DET 1SG.A-chase
        "I chased the cat"
    
     b. [ LTOP: h1 INDEX: e2
          RELS: < ["_cat_n_rel" LBL: h3 ARG0: x4 ]
                  ["exist_q_rel" LBL: h5 ARG0: x4 RSTR: h6 BODY: h7 ]
                  ["_chase_v_rel" LBL: h8 ARG0: e2 ARG1: x9 [ PNG 1sg ] ARG2: x4 ] >
          HCONS: < h6 qeq h3 h1 qeq h8 > ]
              
    2a. igmú kiŋ mayakhúwakhiye
        igmú kiŋ ma-ya-khuwá-khiyA
        cat  DET 1SG.P-2SG.A-chase-CAUS.TR
        "You made me chase the cat" (or "you made the cat chase me")
    
     b. [ LTOP: h1 INDEX: e10
          RELS: < ["_cat_n_rel" LBL: h3 ARG0: x4 ]
                  ["exist_q_rel" LBL: h5 ARG0: x4 RSTR: h6 BODY: h7 ]
                  ["_chase_v_rel" LBL: h8 ARG0: e2 ARG1: x9 [ PNG 1sg ] ARG2: x4 ] 
                  ["_cause_v_2_rel" LBL: h11 ARG0: e10 ARG1: x12 [ PNG 2sg ] ARG2: x9 ARG3: h13 ] >
          HCONS: < h6 qeq h3 h1 qeq h11 h13 qeq h8> ]

(Ullrich, 2011)

(NB. For convenience in this discussion I use English lemmas for PRED
values.)

Some transitive verbs form the causative with *-yA* in
mostly-complementary distribution with *-khiyA*; however, for a few
verbs it is contrastive: *-yA* expresses accidental or unintentional
causation, while *-khiyA* volitional.

### Causative of Statives

Stative verbs are pervasive in Lakota, filling e.g. the role played by
adjectives in English. Stative verbs can transitivized via the causative
affix *-yA*, as here:

    3a. hayápi  kiŋ púze
        hayápi  kiŋ púzA
        clothes DET be.dry
        "The clothes are dry"
    
     b. [ LTOP: h1 INDEX: e2
          RELS: < [ "_clothes_n_rel" LBL: h3 ARG0: x4 ]
                  [ "exist_q_rel" LBL: h5 ARG0: x4 RSTR: h6 BODY: h7 ]
                  [ "_dry_a_rel" LBL: h8 ARG0: e2 ARG1: x4 ] >
          HCONS: < h6 qeq h3 h1 qeq h8 > ]
    
    4a. hayápi kiŋ  puswáye
        hayápi kiŋ  púzA-wa-yA
        clothes DET be.dry-1SG.A-CAUS.INTR
        "I dried the clothes"
    
     b. [ LTOP: h1 INDEX: e2
          RELS: < [ "_clothes_n_rel" LBL: h3 ARG0: x4 ]
                  [ "exist_q_rel" LBL: h5 ARG0: x4 RSTR: h6 BODY: h7 ]
                  [ "_dry_a_rel" LBL: h8 ARG0: e2 ARG1: x4 ]
                  [ "_cause_v_1_rel" LBL: h11 ARG0: e10 ARG1: x12 [ PNG 1sg ] ARG2: h13 ] >
          HCONS: < h6 qeq h3 h1 qeq h11 h13 qeq h8 > ]

(Van Valin, 1977)

*-yA* exists in mostly-complementary distribution with the "instrumental
causative" (Rood and Taylor, 1996) prefix *yu-*:

    5a. wašté                       b. tónačhaŋ         yuwášte-he
        Ø-wašté                        tónačhaŋ         yu-Ø-Ø-wášte=he
        3SG.P-be.good                  for.several.days CAUS.INTR-3SG.P-3SG.A-be.good=CONT
        "It is good"                   "He kept improving it for several days"

Stative verbs expressing size/shape or value judgments generally form
the causative with *yu-*, while other do so with *-yA*. In a few
instances, both forms are possible, giving contrastive meanings:

    6a. ska                b. skayé                               c. yuská
        Ø-ská                 Ø-Ø-ská-yA                             Ø-Ø-yu-ská
        3SG.P-be.white        3SG.P-3SG.A-be.white-CAUS.INTR         3SG.P-3SG.A-CAUS.INTR-be.white
        "It is white"         "He painted it white"                  "He cleansed it" 

(Ullrich, 2011)

#### All Together Now

Causatives formed from statives can also transitivized via the
causative:

    7a. hayápi  kiŋ  pusmáyayekhiye
        hayápi  kiŋ  púzA-ma-yÁ-ya-khiyA
        clothes DET  dry-1SG.P-CAUS.INTR-2SG.A-CAUS.TR
        "You made me dry the clothes"
    
     b. [ LTOP: h1 INDEX: e15
          RELS: < [ "_clothes_n_rel" LBL: h3 ARG0: x4 ]
                  [ "exist_q_rel" LBL: h5 ARG0: x4 RSTR: h6 BODY: h7 ]
                  [ "_dry_a_rel" LBL: h8 ARG0: e2 ARG1: x4 ]
                  [ "_cause_v_1_rel" LBL: h11 ARG0: e10 ARG1: x12 [ PNG 1sg ] ARG2: h13 ] 
                  [ "_cause_v_2_rel" LBL: h14 ARG0: e15 ARG1: x16 [ PNG 2sg ] ARG2: x12 ARG3: h17 ] >
          HCONS: < h6 qeq h3 h1 qeq h14 h13 qeq h8 h17 qeq 11 > ]

## Building Blocks

Given this data, it appears that to implement the causative in Lakota we
need two operations (and so two implementing rules):

- Addition of a subject argument
- Addition of a scopal predication

To expand this idea by way of contrast, we can compare to the causative
in Japanese:

    8a. Suzuki-ga  keeki-o  tabeta
        Suzuki-NOM cake-ACC eat.PST 
        "Suzuki ate the cake."
    
     b. Aoki-ga  Suzuki-ni  keeki-o  tabesaseta
        Aoki-NOM Suzuki-DAT cake-ACC eat.CAUS.PST 
        "Aoki made Suzuki eat the cake."

(Sag et al., 2003)

For Japanese, we need same two elements needed for Lakota, plus a third:

- Addition of a subject argument
- Addition of a scopal predication
- **Change of case frame**

## Implementation

Now we can look at how these rule components might be implemented.

The scopal predicate rule is fairly straightforward:

    9. add-scopal-arg123-pred-lex-rule := lex-rule &
        [  SYNSEM [ LOCAL [ CAT.VAL [ SPR.FIRST.LOCAL.CONT.HOOK [ LTOP #handle,
                                                                  XARG #oldsubj ],
                                      SUBJ.FIRST.LOCAL.CONT.HOOK.INDEX #subj ],
                            CONT [ HOOK [ LTOP #top,
                                          INDEX #evt,
                                          XARG #subj ],
                                   RELS <! #key !>,
                                   HCONS <! qeq & [ HARG #scoped-evt,
                                                    LARG #handle ] !> ] ],
                    LKEYS.KEYREL #key & arg123-relation & [ LBL #top,
                                                            ARG0 #evt,
                                                            ARG1 #subj,
                                                            ARG2 #oldsubj,
                                                            ARG3 #scoped-evt ] ] 
          DTR.LOCAL.CAT.VAL.SUBJ.FIRST.LOCAL.CONT.HOOK.XARG #oldsubj ].

When adding a subject argument, we also need to make sure the non-local
dependencies get properly appended:

    10. add-subj-arg-lex-rule := lex-rule &
          [ SYNSEM [ SUBJ.FIRST.LOCAL.CONT.HOOK.XARG.SYNSEM.NON-LOCAL [ SLASH [ LIST #sfirst, LAST #smiddle ],
                                                                        QUE   [ LIST #qfirst, LAST #qmiddle ],
                                                                        REL   [ LIST #rfirst, LAST #rmiddle ] ],
                     NON-LOCAL [ SLASH [ LIST #sfirst, LAST #slast ],
                                 QUE   [ LIST #qfirst, LAST #qlast ],
                                 REL   [ LIST #rfirst, LAST #rlast ] ] ],
            DTR.NON-LOCAL [ SLASH [ LIST #smiddle, LAST #slast ],
                            QUE   [ LIST #qmiddle, LAST #qlast ],
                            REL   [ LIST #rmiddle, LAST #rlast ] ] ].

These rule components are envisioned to be language-independent and
provided by the valence change library. A case-changing rule component
necessarily needs language-specific case information and would be
created by the customization system.

For example, a case-changing rule for Japanese would look something like
this:

    11. caus-case-lex-rule := lex-rule &
          [ SYNSEM.LOCAL [ CAT.VAL [ SPR [ FIRST.LOCAL [ CONT.HOOK.XARG #causee,
                                                         CAT.VAL.COMPS.FIRST #obj-val ] ],
                                     COMPS < #obj-val,
                                             [ LOCAL [ CAT.HEAD.CASE ni,
                                                       CONT.HOOK.INDEX #causee ] ] > ] ] 
            DTR.LOCAL.CAT.VAL.SUBJ.FIRST.LOCAL.CONT.HOOK.XARG #causee ].

(In fact, this is essentially how JaCY implements case frame change, but
in a lexical rule, instead of a lexical type.)

Using this approach, with the mechanics provided by the customization
system library, the causative rule in the implemented grammar would
simply need to add a PRED value and (and any other desired constraints):

    12. caus-pred-lex-rule := val-change-only-lex-rule & add-subj-arg-lex-rule & add-scopal-arg123-pred-lex-rule &
          [ LKEYS.KEYREL.PRED "_cause_v_rel" ].

#### Questions

**Q1:** Are there contexts in which this compositional approach to
building valence-changing rules would not make sense?

**Q2:** add-subj-arg-lex-rule digs deeply into its SUBJ's
CONT.HOOK.XARG; is this reasonable? Problematic?

**Q3:** add-subj-arg-lex-rule doesn't mess with ARG-ST; should it?

#### More on ARG-ST

The question of what, if anything, to do with ARG-ST under valence
change is a topic we started discussing as a group of Emily's students
and summarized to the MATRIX-DEV mailing list, reproduced here:

- The big-picture question is: do valence-changing rules manipulate
ARG-ST, VAL, or both? If, for example, a valence reduction
suppresses an argument directly on ARG-ST, then one thing that gets
lost is the use of ARG-ST as a precedence setter for binding
relations. (Which may or may not be a problem for a particular
grammar, and may or may not be something we want to worry too much
over?)
  
  One of the functions of ARG-ST is as the locus for keeping track of
long-distance dependencies. If basic-one-arg is the mother of a
lexical rule, then we need to break the connection between the
mother’s NON-LOCAL and the daughter’s NON-LOCAL. Looking at
basic-two- arg, there are three diff list appends (SLASH, REL, and
QUE) that implement the head-threading analysis of Bouma, Malouf,
and Sag (2001 and/or 1998 - not sure which). (Note that we treat
modifiers separately.) With a suppressed argument, what we need to
worry about is that all those diff lists were empty (of type
unexpressed).  
  
  So there are three cases to consider:  
  1. In the case of a suppressed argument, the DTR needs to say that
the suppressed argument is type unexpressed.  
  2. In the case where e.g. we “demote” an argument from an NP to PP,
if we don’t copy the entire SYNSEM of the argument up, then we need
to copy up at least the NON-LOCAL values.  
  3. In the case of an added argument: in order to get any gaps
appropriately integrated, the mother of the rule needs to define its
own NON-LOCAL values as the diff-list-append of the DTRs NON-LOCAL
values and the new argument’s NON-LOCAL values.

(add-subj-arg-lex-rule was created specifically to address point \#3.)

**Q4:** Generally, what should valence-changing operations do or not do
with ARG-ST, VAL, or both?

#### Further Complications

Now we come back to the intransitive causative motivated by the Lakota
data. We want another rule component, similar to (9), to handle the
structural differences:

    12. add-scopal-arg12-pred-lex-rule := lex-rule &
        [ SYNSEM [ LOCAL [ CAT.VAL [ SPR.FIRST.LOCAL.CONT.HOOK [ LTOP #handle,
                                                                 XARG #oldsubj ],
                                     SUBJ.FIRST.LOCAL.CONT.HOOK.INDEX #subj ],
                            CONT [ HOOK [ LTOP #top,
                                          INDEX #evt,
                                          XARG #subj ],
                                    RELS <! #key !>,
                                    HCONS <! qeq & [ HTOP #scoped-evt,
                                                     LTOP #handle ] !> ] ],
                  LKEYS.KEYREL #key & arg12-relation & [ LBL #top,
                                                         ARG0 #evt,
                                                         ARG1 #subj,
                                                         ARG2 #scoped-evt ] ] 
          DTR.LOCAL.CAT.VAL.SUBJ.FIRST.LOCAL.CONT.HOOK.XARG #oldsubj ].

This brings up some additional questions:

**Q5:** The old subject doesn't get added to the causative EP. Does this
matter?

**Q6:** In my implemented Lakota grammar, statives inherit from
intransitive-lex-item (and therefore basic-one-arg-no-hcons); given the
possibility of transitivization, does this analysis make sense?

### References

- Bender, E. M., Drellishak, S., Fokkens, A., Poulson, L., &
Saleem, S. (2010) Grammar customization. *Research on Language &
Computation*, *8*(1), 23-72.
- Rood, D. S., & Taylor, A. R. (1996) Sketch of Lakhota, a Siouan
language. In *Handbook of North American Indians* (Vol. 17, pp.
440-82). Washington, DC: Smithsonian Institution.
- Sag, I. A., Wasow, T., and Bender, E.M. (2003) *Syntactic Theory: A
Formal Introduction.* Stanford, CA: CSLI.
- Ullrich, J. (2011) *New Lakota Dictionary* (2nd ed.). Bloomington,
IN: Lakota Language Consortium.
- Van Valin, R. D. (1977) Aspects of Lakhota Syntax: A Study of
Lakhota (Teton Dakota) Syntax and Its Implications for Universal
Grammar (Doctoral dissertation). University of California, Berkeley.

## Notes from Discussion

\[ Scribe: Emily \]

VLAD

Chris: \[goes through notes\]

Sanghoun: \_cause\_v\_rel/\_cause\_v\_2\_rel -- are these
interchangeable with each other?

Chris: That is one of the questions I'm trying to explore here: Whether
it makes sense for them to be separate. Straightforward transitive case,
we have a standard three arg causative. Causer makes causee do caused
event. Two argument version, it ends up being causer causes caused
event. We lose the old subject in the two-argument one.

Emily: Totally gone?

Chris: Not sure. See 3a/4a.

Emily: The old subject still has a role to play wrt to the embedded
verb?

Chris: Yes.

Emily: What is it about the syntax that leads you to see these as
different?

Francis: Intransitive v. transitive? What happens with non-stative
intransitives?

Chris: Don't know.

Guy: How do we know these are causatives rather than just a dropped
argument in 3a? Could it be an active-stative language, where the agent
is optional in stative verbs?

Chris: In 3a, you can't have an agent.

Emily: The morphology correlates with the possibility of overt agent.

Chris: Right.

David: So the question is whether in 4b the clothes should be in the
cause\_rel.

Chris: Right.

Francis: So the question is whether we should treat this as "I made the
clothes dry."

Guy: If you negate the sentence, can you negate either part?

Chris: Causative ends up … (checks position classes) … negation is an
enclitic that attaches …

Guy: Would it be possible to get the scope "I made the clothes not dry"?

Chris: You could, but not with the causative. You would have to use a
verb of "I did something" as in "Clothes dry not, I did something".

Guy: If it really is two different relations, then you'd predict that
you could negate them separately.

Emily: Not necessarily. Japanese has a morphological causative and
morphological negation, and you can only get neg &gt; cause in the
semantics (and morphology), but there is other evidence (e.g.
interpretation of adverbs) for separate EPs there.

Chris: Negation is way outside causative in Lakota, and only negative
causative when causative is there. Lakota is also one of those languages
where things are a bit fuzzy between nouns and verbs ("the clothes" v.
"be.clothes") … interacts with negation.

Francis: Orthogonal question: One of the standard tests from Japanese
for things like this is passivization. Can you passivize the clothes ---
"the clothes were made dry by me" ? Is the embedded NP available for
other valence changing things?

Chris: I think the answer there is no.

Francis: Which would be an argument for not putting "the clothes" in the
cause rel.

Emily: Isn't that more of a syntactic argument than a semantic one?

Francis: I like my syntax and semantics to be parallel.

Chris: On the earlier question, causatives for intransitives also …

\[Dan appears\]

Emily: Let's use this as an excuse to go back to the high level.

Francis note on Skype: so if 'X lie down' -&gt; 'Y puts X to bed' can
you make this passive? 'X is put to bed by Y'?

Chris: I don't think you can do a passive that way. Will have to check.

Chris: Back to question of whether to have a three-place causative in
case of statives.

Emily: So we're back to the question of how to test for presence of
semantic arguments, but this time we're talking about an ARG2 (of
\_cause\_v\_rel). Can we do something like the intentional adverb test
for this position?

Chris: Yes.

Emily: You keep saying that the three-place version is the expected one,
but where does that intuition come from? Periphrastic causative
languages like English?

Chris: That's a fair question.

Guy: Why do you need the ARG2 in 2b?

Chris: Indeed -- it may just be my intuition that it should be there.
This may be contamination from English, but it feels like causing,
making me do something, is different from causing the event. But that
may be splitting hairs.

Dan: Even for English it's not clear that there's always an ARG2, as in
examples with expletive: *He made there be an article on our todo list*.
There *make* would have to be a two-place relation between causer and
state of affairs. *He made it rain*, too. We might go back to a
different default state, even if 2a/b is normative, and say that 4b
makes sense everywhere.

Chris: One question to take away then for the overall problem of trying
to provide the building blocks is whether cross-linguistically there is
a justification for providing both mechanisms. Is there a language for
which the three-place version is required.

David: I think it's an interesting question if there's a language for
which there are two causatives for the two versions. So far we've only
come up with ambiguity for both of them.

Emily: What about reflexives? *I made myself sit there until I read all
the applications* … does that tell us anything about the semantics, or
is it just syntax again?

Dan: Not sure … those reflexives are so constrained by syntax.

David: You were saying something about volition? *I made myself do
something* is volitional in a way that *I made it rain* is
non-volitional?

Dan: Volition in the upper clause, or the lower one?

David: The lower one.

Chris: Back to notes -- introducing instrumental causative & causative
of causative (7a,b)

Sanghoun: Question about HCONS. Are these dropped arguments?

Emily: Yes.

Guy: If it's 3rd person, do you have any agreement?

Chris: No.\*

Chris: \*depending on what you mean by agreement. It almost never comes
up because 3rd person is unmarked and there are no overt 1/2 NPs. So you
never see things 'agreeing'.

Guy: No overt pronouns?

Chris: Demonstratives only.

Guy: Can you have a 1st person demonstrative?

Chris: Yes.

Dan: It's surely useful during therapy sessions, right?

Chris: Can't find it…

Dan: Is there a paraphrase possibility with other verbs like force or
cause or something other than that affix?

Chris: The broader sense of the morphological causative ends up being
more traditionally 'let' or 'allow', though it works in these examples
as 'make' would in English. For a more specific version, I don't believe
so. 'Force' for example uses the same -khiyA …

Emily: With an adverb or something to distinguish the meaning?

Chris: No.

Emily: Just ambiguous between force, make and let?

Chris: Yes.

Dan: It seems indicative in English that you can have elided sentences
like 'he forced me', 'he let me', 'he made me' --- seems to involve the
'me' as ARG2. Just an intuition.

David: But if it's a suffix, you can't leave the verb unexpressed.
Unless Lakota has the empty verb?

Chris: Verb is required. Idioimatically, you'd use the verb for 'stand'.

David: Could you get one of these causatives with that sort of light
stand-verb and the other would not take it? I'm trying to get Dan's *He
forced me* with a semantically very light verb.

Chris: That's a good question --- I don't have an example that comes to
mind.

Dan: You'd need a translation equivalent of *He forced me to do it* with
a vague doing verb somehow. I think this may be a distraction, not
convincing.

Emily: You already do something similar with elliptical sentences like
*Kim will*, where Kim is attached to the elliptical verb rel.

Chris: You can get causative of *do*.

Dan: Even though it's washed out, it is an EP corresponding to a verb. I
think this is just a distraction; it won't help with the 2 v. 3
question. Occam oughta come in and say, "Show me the reason you need a
third argument". What would go wrong?

?: We wouldn't be able to passivize would we?

Dan: That's a syntactic phenomenon -- *Books are believed to be on the
table.*

Chris: Interaction with the stuff I omitted. Lakota has a very
productive argument dereferentializer that removes an argument. They can
stack … apply more than once to remove more than one argument. In this
case, it would be … again I guess that doesn't really address whether it
needs to show up in the semantics.

Dan: A much more nebulous question. What are our metrics/ways of
deciding if the argument is present or not?

Chris: So question here is what's the evidence for the three-place one?

Emily: And maybe default in deference in to Occam should be two-place.
But Dan, you seem to default to control rather than raising verbs in the
ERG.

Dan: I'm not saying I'm leading the life I'm advocating….

David: What are the clear cases for three-place in English?

Dan: *Kim persuaded me to sing* (like that will ever happen) … *me* is
an argument of *persuade*.

Emily: Yes, there's tests for raising v. control. The question is
whether we have that in causatives in English?

Dan: Is *let* a causative for you? … But even there we get expletives.

Guy: But you can get ellipsis: *They let me* where you don't have the
second verb there.

Dan: That's the thing I was trying to do before, but I'm not sure that
will hold up over a lot of data. \**He will let it/there*

Emily: Interesting contrast to *There/It will.*

David: But note: *It will rain.*/*Let it.*

Emily: Maybe idiomatic? \**Let there.*

Dan: *Will he let it be known that S? \*I think he should let it.* But
still, *Let it* isn't what we'd predict.

Guy: You're trying to say *Let it* is a fixed phrase?

Emily: Yes, or: weather it isn't really a great expletive. *It's trying
to rain.*

David: You'd let *let it* be an idiom but not *it's trying to rain*?

Emily/David: *It's trying/threatening/pretending/wanting to rain*

Dan: Better to put the burden of proof on the proposal for the third
argument.

David: But can we come up with tests?

Dan: Emily's right to point us towards the tests for raising/control.

Emily: *Kim persuaded the candidates to be interviewed by Fox News*/*Kim
persuaded Fox News to interview the candidates.*

Francis: *Who did you make dry the clothes?*/*I made Kim.*

David: But the verb can't go missing in Lakota.

Dan: *Kim made the candidates be interviewed by Fox News/Kim made Fox
News interview the candidates.*

David: But Lakota has morphological constraints on the order of passive
& causative.

Emily: But here is a case where we do want three-place causative for
English, which we were skeptical of before.

Dan: Can you convince me those two examples are really
truth-conditionally different? Can we do anything with deliberately?

\[Digression on 'deliberately' as an adverb, with interesting
observation that *I was deliberately discovered during hide and seek* is
worse than *I got deliberately discovered during hide and seek*\]

Emily: We just need a sharper example where the motivations of the two
participants have more distinct motivations than candidates and Fox
News.

Chris: I'm going to stick a pin in this one to come back to later.

Dan: It has the nice property that it's not your problem.

Chris: Move to Japanese example.

Guy: In 7a, the 1sg is ma, but in 4a, it's wa.

Chris: Agentive v. patientive.

Guy: So don't we have to change the case frame there as well?

Chris: Simple answer is no because … easy answer is that my implemented
Lakota grammar doesn't deal with case at all, because it doesn't exist
in Lakota.

Guy: It looks like it does for the pronouns.

Emily: If it's morphology on the verb, it's not case.

Guy: But if you go with my analysis of morphemes as separate formatives,
then they do look much more like pronouns.

Emily: Yes, we invite you to build a grammar like that for Lakota.

Chris: That is an interesting question that I will probably dig into.
We'll assume arguendo that there are languages for which you need two of
those, and there are other languages for which you need all three of
those operations. Let's look at what those components might look like
(back to notes).

Dan: If you're going to factor the various parts you need for 12,
presumably you can find independent evidence for each, without the other
two?

Chris: That's part of the overall question there in Q1. It's easy to
find one where you want some and not the other, not sure how easy it is
to find each one in isolation. That's a good question about the state
space overall, where combinations alway occur cross-linguistically.

Emily: Japanese v. Lakota (at least w/o Guy's analysis) isolates case.
10. is needed whenever you add an argument.

Chris: Like in benefactives.

Emily: And if benefactives are treated as intersective rather than
scopal, then we've have 9-prime for 10 to combine with instead of 9.

Emily/Chris: What is the role of ARG-ST in these grammars? Do we need to
carefully tend it as we go up the lexical rule chain, or can we leave it
as a property of stems?

Dan: Yeah, I willfully ignore it. Supposed to be useful for binding and
the obliqueness hierarchy. Seems to be a pseudo-empirical question. As
people build bigger grammars, does it help anything to keep it up
through the lexical rules?

David: I can think of one case in my pet language --- for certain
preposition-like case assignments that will assign the same case
regardless of whether something has been passivized. Difficult to
express why passivization doesn't change case assignment unless you
still have ARG-ST and can say the first thing gets case a, the rest case
b.

Chris: What about causatives?

David: I think in that case you do add something to the start of the
ARG-ST.

Emily: So passive doesn't change ARG-ST but causative does?

David: Yes.

Emily: And for posterity, is this Nuu-Chah-Nulth, or one of your other
pet languages?

David: Nuu-Chah-Nulth. Don't have time for any other pet languages.

Chris: Let's talk more. Sounds like provisionally we might have a
motivation for modifying both ARG-ST and the valence lists.

Francis: Do you get verbs with causative marked form without a
corresponding non-causative?

Chris: Yes, lexicalization is pretty wide-spread with all of these
valence changing things in Lakota. A lot of arguments simply aren't ever
used anymore.

Francis: How do we then capture in the Matrix … can we mark something as
obligatorily going through a lexical rule?

Dan: In some cases, what we've done is to have a description of the
output as a first class entity as well as the input and then there are
some lexical entries that inherit from the type constraints true of the
output. You can still avoid missing the generalization about what's
common to the productively derived forms and the lexically isolated
ones. For example, the verb *rumored* only shows up in the passive form,
and I have a type passive-verb-lxm. I think it's still a separate an
interesting question of whether we allow into the lexicon a recipe for
construction involving stem forms that never appear independently. I
think Ann has in the past maintained that she'd be prepared to support
that in the LKB.

Francis: But it looks like these rules in the Matrix library don't have
corresponding lexical types. Probably something to think of in the
design.

Emily/Chris: Yes, thanks.

Last update: 2016-03-24 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/LADValenceChange/_edit)]{% endraw %}