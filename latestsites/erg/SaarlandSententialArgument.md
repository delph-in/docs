{% raw %}## Phenomenon-specific discussion of improvements to MRSs

Leader: Dan Participants: Petya, Rui, Yi, Petter, Lars, Ann, Angelina,
Woodley, Francis, oe, Bec, Emily Scribe: Emily

* * *

Topic 1 (and only): Treatment of sentential subjects

*To arrive bothers Kim.*

Bother in the lexicon looks for a referential index for ARG1 --- typed
to ref-ind to avoid expletive index. But the semantics of VPs is not a
referential index. Tree doesn't give a rule that wraps referential index
around the VP's event. Chose instead to do something on the other side
-- pumping **bothers Kim** VP to a VP that is looking for a
handle-valued ARG1.

Ann: Why do the pumping on the VP rather than on the subject?

Dan: Was there a compelling reason for that?

oe: There's a nominalization!

Dan: Yes --- the verb already says that the ARG1 is a referential index
--- can't undo that.

oe: When a CP is a subject it becomes a nominalized argument, but as as
complement it's not?

Dan: Correct.

Ann: The structure we saw yesterday had a p in ARG1.

Dan: Yes, in terms of the shape of predication itself it's ready, but
the valence list can't say it's underspecified between NP/VP\[inf\]/CP?

Emily: Why can't the valence list talk syntax only?

Dan: The selecting head has to know where to look in the HOOK to pick
the right thing.

Emily: But you don't have that problem with complements?

Dan: Always bifurcate the lexical entries.

Ann: Why say p if you're not taking a handle as the ARG1 --- doing the
nominalization --- why does the SEM-I say p? (I'd rather it didn't.)

oe: Why?

Ann: The underspecfication of something as p (handle or ref-ind) always
concerns me because logically they are very different things. I think
it's probably a better semantics to think of it that way because there
are some properties that are better captured by treating this as
proposition.

Emily: Same with complements, or subjects are special?

Ann: Subjects are special.

oe: *I believe your claim.*/*I believe that Kim arrived.*

Ann: There have been some arguments about this, but I am neutral. My
feeling is that because the sentential subjects are relatively less
common than the sentential complements and subjects are normally nominal
guys, it's more reasonable to the conversion there. However, I can't
unfortunately remember the literature with no notice … need to go back
and look at it. I don't mind if you end up with a structure where all
propositions are nominal could be interesting, but I believe this works.

Emily/oe: What about *That Kim arrived was believed by every one.*?

Dan: You're asking a tricky question. First you're asking whether the
passive rule allows the construction of something that has the right
shape but because the passive rule usually works on transitive verbs,
then you're asking whether I can throw that NP expectation away and put
in a clausal subject?

oe: \[looking at demo\] *That Kim left was believed by everyone* has the
same semantics

- as *Everyone believed that Kim left.* So it's not the subject, but
the ARG1 that gets this special treatment, not the subject.

Dan: Right --- I had to add a separate lex rule for passive that
explicitly allows for passives of sentential complement verbs. But it's
right that we get an asymmetry.

Ann: But it's not at the semantic level because it's not ARG1.

Emily: But what's the motivation for treating ARG1 differently?

Ann: First, there are no verbs that only take sentential and not nominal
subjects, but there are verbs that take only sentential complements and
not nominals (collected by Grimshaw).

Ann: Secondly, don't want to go down the route of all thinks like *if*
etc taking sentential complements doing nominalization. So we're going
to at least have a class of things doing what we do currently
(handle-valued ARGs) but arguably also a class that do nominalization.
And the main reason I think I want these is to avoid the p-type
underspecification.

oe: So exploiting the p in the ARG1 position makes you especially
nervous?

Ann: Because it's all over the place. Because every time we see an MRS
with a verb in we'd have to do something to that MRS.

oe: I see the difference in frequency, but is there a difference in
principle? Is the difference in frequency enough to motivate absorbing
the lack of parallelism.

Ann: I have some recollection that sentential subjects are different
from sentential complements in at least some sense.

Woodley: Was talking to Ann on Monday about scopal arguments and how to
deal with them --- reifying propositions.

Ann: That's one account of how to do the interpretations of MRS.

Woodley: Are there cases where the sentential subject position could be
interpreted more like the modals where you don't want to do the
reification?

Emily: *That Kim left is possible.*/*Parties are possible.*

Dan: I have two adjectives *possible*, one which can take a sentential
subject --- there's a class of predicates that take expletive *it* or
sentential subjects.

Emily/oe: So what about *bother* and *surprise*?

Dan: No nominalization there. That's because the base entry for
*surprise* that take an expletive subject and a sentential complement.

Ann: Is there another *surprise* for *Kim surprised me.* or is it going
to be the same rel?

oe: Or should it be a different rel?

Dan: from SEM-I:

    "_surprise_v_1_rel": ARG0 e, ARG1 i, ARG2 u.

Ann: Should be two separate predicates.

oe: Is that different senses?

Ann: We have other cases where we have two predicates differentiated
only by the set of ARGs. And I don't see that we're helping anyone by
having predicates

Woodley: *That Kim arrived surprised me.* seems different from *That Kim
arrived is possible.* The latter seems like something that can happily
be treated as a logical operator, but not so much for *surprise*.

Dan: So what do you want for *It surprised me that Kim left.*?

Woodley: Nominalization.

oe: Just to be difficult, I think that *It surprised me that Kim left*
and *That Kim left surprised me* are perfect paraphrases (and should be
represented as such).

Ann: Davidsonian … quotes … \[missed this one\] … there does seem to be
a difference between that and surprise.

Dan: There seem to be pretty close paraphrases in *That Kim left
surprised me.* and *The fact that Kim left surprised me.* But *It
surprised me the fact that Kim left* is different (if grammatical).

oe: Can't you do the *the fact that* paraphrasing with most sentential
objects?

Dan: Only if the verb can take an NP as well as a CP.

Ann: Presupposition difference (because *believe* isn't factive, but
*surprise* is).

oe: So could paraphrase with *the proposition that* or *the claim that*
instead.

Ann: Are there cases where we have non-factives for sentential subjects
(without passive)?

Dan: *whether* complementizer: *Whether or not Kim left did not emerge
from the courtroom evidence*

Ann/Dan: Complementizers might be semantically significant (per
Davidson) but might be just a syntactic idiosyncrasy.

Dan: We treat that as a syntactic fact.

Ann: What semantics do you give for *Whether Kim arrived on time
emerged.*?

Dan: wh-subjects always turn into NPs, so the nominalization is there.

Woodley: Does that predict that it doesn't go with predicates like
*possible*? \**Whether Kim arrives is possible*?

Dan: Wh-clauses have the distribution of NPs, where that-clauses don't.
So always pump wh clauses to NP, and don't want to pump all that clauses
to NPs, since then they have to be constrained away from lots of other
NP complements.

Ann: But if semantically you don't think that the wh things are that
different from the that things, then that would be an argument to treat
them as nominalizations in subject position.

Dan: This brings us back full circle to the thing I'm not too proud of:
I want the extraposition symmetry preserved, I wanna do something
sensible with sentential subjects, and … \[EMB: maybe this third one was
wanting consistent treatment of clausal arguments in general?\]

Guy: Does the extraposition/intrapositon rule also apply to VP subjects?
*to arrive bothers me*

Dan: It looks like no. Do I get *It bothered Kim to have to buy the
book.*: ERG currently doesn't get the analysis where VP\[to\] is a
complement of bother. I probably should have another lexical entry for
bother in this frame (with expletive subject). \[Searches for valence
frame --- no verbs like that yet.\]

oe: In that case it would pattern with *surprise*.

Emily: and that-CP taking *bother*, in fact.

Dan: Can you think of four other verbs?

- *annoy*
- *trouble*
- *please*

Guy: Would that give an additional analysis for *to add lexical types
bothers you*?

Dan: If I've written the existing lexical rule type correctly, it'll
come for free. The power of linguistic prediction!

oe: But this is increasing the number of cases of that discrepancy
between reified and non-reified ARG1.

Dan: For some strange version of counting … it preserves the
generalization (about expletive subject alterations).

oe: But we got interested in *surprise* because of that asymmetry.

Ann: For the expletive cases, I think this is right.

oe: Why?

Ann: The symmetry for the extraposition alternation is more important.
In all other cases you're talking about adding lexical entries, which
gives a place for putting in two different predicates.

Woodley: Direction of lexical rule: if it's non-extraposed to
extraposed, that would potentially make it possible to be consistently
nominalized.

Dan: Ann is saying that the semantics of the extraposition cases is not
up to debate. \**It brings up several problems that Kim left.*

Woodley: I star your star.

Emily: But are we saying that the two frames have to be consistent, or
that they may not have nominazliation?

Woodley: Can you knock down the straw man that any sentential subject
can be extra posed?

Dan: *That Kim sings songs vanished from our awareness.*/*It vanished
from our awareness that Kim sings songs.*

Ann: Let's stick with what's in the corpus…

Dan: Nothing rides on this except the empirical facts. Depending on that
distribution that might change the lexical rule that takes any verb and

Dan: *It persuaded John to leave the store that Mary went away.*

Everyone: ew.

Emily: If you did need that ugly rule, does it change what you want to
do about nominalization?

Dan: No. Or maybe it does. Then we could always pretend that a
sentential subject is the corollary of the

oe: Suggestion for homework from semantic documentation point of view to
possibly both of you (= Dan + Ann?). At this point it seems like there
is the possibly that it is more parsimonious to use the
underspecification mechanism also on ARG1s and say the choice of
reification v. not happens later. You (Ann) said that there may also be
literature on the difference between sentential subjects and
complements, which might also inform us. So maybe we should turn to that
next.

Ann: You would think that whether is okay with a nominalization or not?

oe: I'd currently like to entertain the possibility of no
nominalizaitons?

Dan: Then I'd have to have prepositions also into taking hole arguments
--- wh guys are NPs and get nominalized everyone. No like. That's not an
argument, it's an emotional indication of …

Glenn: … the work getting done.

Dan: More research is needed. It would be fine if people brought
illumination to the discussion.

Francis: That the results were inconclusive surprised no one.

Emily: Shall I record that as use or mention?

Last update: 2014-02-18 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SaarlandSententialArgument/_edit)]{% endraw %}