{% raw %}### Overview

Combined SIG, merging discussions of updating the analysis of
coordination in the Matrix and DMRS algebra, proposed separately.

Scribes: Guy, Emily

### Notes

Emily: I want to update the analysis of coordination in the Grammar
Matrix, inspired by change in ERG. But analyses given by ERG 2018 don’t
match what the ESD page projected for future (when the page was written)
analyses of coordination.

Stephan: Dan and I made a dramatic simplification of coordination, so
that it identifies all the labels involved.

Dan: Nothing has changed with respect to the nouns (except for renaming
the roles). For verbs, it’s a contentful change. This asserts that
there’s no way to squeeze in a quantifier for one conjunct but not the
other. The old analysis seemed to proliferate the candidate scope
ambiguities with no benefit.

Emily: Agree for VP-coordination, but not sure for S-coordination.

Woodley: There’s also the question of whether the coordination itself
has any opaque scopal properties. This is okay for *and*, but how can
this be the correct analysis for other coordinations, e.g. *slept or
barked*? This analysis says that we have logical conjunction.

Guy: Could this depend on how we convert from MRS to a logical
proposition?

Woodley: But they’re now sisters in the scope tree.

Alex: Sharing a scope just means that they’re at the same scopal
position.

Woodley: Copestake et al. (2005) say that’s logical and.

Dan: That was perhaps a poor presentational choice.

Woodley: In the old analysis, *big or tall* have different labels.

Guy: Thinking about the algebra, we might need two types of
coordination, scopal and non-scopal.

Stephan: This SIG, possible validation of our decision.

Guy and Alex: Mix *and* and *or*, it’s scopal

Dan: We can recover that in the ARG1 and ARG2

Emily: *Every dog chases a cat and every cat jumps a fence*

Guy and Alex: uhhh….

Alex: Mark Steedman’s book: *every x and every y loves a z*. He takes
that as a matter of grammar that you have to block that. I’m not sure.

Alex: I agree with Mark that we are overgenerating, by not disallowing
‘a z’ from in between ‘every x’ and ‘every y’.

Guy: Can the coordination of NPs identify the LBL of both ‘every’s and
the ‘and’?

Alex: No -- you get syntactically ill-formed MRSs.

Alex: VP coordination too: Every jazz player loves and every pianist
hates a saxophone player. Scope constraint survives here too.

Guy: I think this is doable with a more general notion of a scope tree.

Alex: Determiners in English are not usually quantifiers, e.g. *a*,
*two*, Skolem constant.

Alex: No clear it’s a grammar issue.

Guy: Then why are we trying to do this with qeqs?

oe: The grammar doesn’t give us much in terms of syntactically
determined scope constraints;...

Guy: It does give useful, partial constraints. If there are clear
principles of which scopes are possible, we should capture those.

Alex: I think the grammar is trying to impose scope constraints that we
deem to be syntactically driven. The complication is that it’s a grey
area, what’s syntactic and what’s pragmatic.

Guy: In that case we should be able to come up with a situation in which
we can get those scope readings.

Alex: That’s the test … and hard to prove a negative.

oe: This particular example and whether or not that’s a syntactically
driven scope constraint does not bear on the more technical design
decision under review. The old analysis account for it either.

Guy: My specific suggestion of identifying labels of NPs is also not
relevant to the change from 1214 to 2018.

Emily: Counter-arguments to current 2018 analysis of verby coordination:
shared label is wedge per Copestake et al 2005 ‘Every dog chased a cat
and every cat jumped a fence.’: okay to have verbs in the same place?
Scopal relations below the coordinated verbs?

Alex/oe: Scopal relations above?

Alex: Any construction of the form *X and not Y*, the negation is
underneath the conjunction

Dan: The label that’s shared is the neg’s; the ARG still points to the
verb’s event.

Guy: Have to start with the individuals that the ARG1/2 is pointed to
and then climb up the scope tree to find the predicate…

Dan: That non-immediacy comes from an old decision about negation &
modals not having eventualities.

Guy: Would expect all coordination of clauses to point to handles,
because it’s about truth values.

Alex: Sometimes you are combining events, actually.

Guy: For nouny things … mereological sum (Alex: Linkian collective
thing). I don’t think that’s true for evaluating at the clause level, is
it?

Emily: One weakness is a lack of distinction between events and
clauses/VP and S in the semantics.

Dan: The dog tripped and fell. The dog tripped and the dog fell.

Alex: Presence v. absence of over subject is different.

Emily: But what about VP v. S -- proposition v. event.

Alex: Montague has a strong difference there, but most everyone else who
looks at natural language relieves themselves of that stiff constraint.
(Except Mark.)

Emily: So what about the case where there are scopal arguments below the
coordinated Vs? *Kim believes that it is raining and doubts that it will
clear up.* If *believe* and *doubt* end up at the same point in the
tree, what about their arguments.

<img src="http://faculty.washington.edu/ebender/VirtualSummit/tree-into-cloud.png" title="http://faculty.washington.edu/ebender/VirtualSummit/tree-into-cloud.png" class="external_image" width="600" alt="http://faculty.washington.edu/ebender/VirtualSummit/tree-into-cloud.png" />


\[The image above shows the end state of the relevant part of the
whiteboard, not where it was at this point in the discussion.\]

oe: It’s a tree, so why can’t it branch?

Emily/Alex: How do we know which branch goes with which predicate
though?

Dan: Increased the cost of conversion, but simplified the representation

Alex: You’re using the event to say something about scope now.

Emily: Not clear what events have to do with it.

Alex: Collapsing subtrees into single structures that can be unpacked
later.

Emily: Because identifying labels of believe and doubt doesn’t identify
their holes.

oe: Rights.

Emily: So the little tree diagrams are just a bit misleading…

Alex: Right -- the erstwhile nodes in a tree are ‘clouds’ whose
structure we can reconstruct based on the info there.

\[Argument about climbing around in trees\]

oe: Can we write out the logical form?

Alex: Fully scoped?

oe: Yes. So here what’s coordinated are propositions and\_c here equates
to logical conjunction, but in other sentences it would be interpreted
in other ways.

Guy: If we’re going to simplify this here with coordination, why not do
it for scopal modifiers too?

Emily: You just want to open all the cans of worms…

Guy: But why simplify inconsistently?

Dan: Coordination is one of the hardest things to do in a compositional
grammar. Need the simplifications here for grammar construction and
maintenance, so they’re not of a type. The less I have to do in building
a coordinate structure’s semantics, the more likely I’ll be consistent.
If you have to do a little more work to unpack them, I’m not
sympathetic. Less complexity in the raw MRS is always going to be a win,
if it’s not lossy.

Alex: You do have to do a bit of digging around to find the one with the
semantic index containing all the other thingies as its argument. There
is work to do, but it is deterministic.

Dan: You’re suggesting that finding requires a hunt of some kind. It’s a
direct look up. Not even a two-step look up.

Alex: You’re right.

oe: Wrote down handle-free variant. No search involved: believe(x,
rain()) /\\ neg(doubt(x, clear\_up())

oe: How about a tricker case? ‘or’, ‘because’, ?

Alex: ‘or’ just gives \\/ instead of /\\.

Dan: ‘because’ isn’t a conjunction.

Woodley: How about temporal ‘and’?

Alex: That’s pragmatics, not grammar.

Woodley: But we’re doing some post-processing here, so why not that?

Alex: It’s totally pragmatic: *Did Charlotte break the vase? It broke
and she dropped it.* \[it goes the other way!\]

Woodley: Just looking for cases where we have to do something with the
MRS post-processing.

Alex: If you’re asking if I can produce coherence relations based on
this output, the answer is I would have to do a little surgery. ‘and’
isn’t even always veridical.

oe: I was humoring Woodley and produced one for temporal and:
temp\_seq(believe(x, rain()),neg(doubt(x, clear\_up()))

Alex: I want ‘and’ there actually, because it’s useful info for
discourse processing that that was an ‘and’. The relations expressed by
these things are underspecified (over some set of possibilities), but I
want to know what the symbol was. Alex’s version: and(believe(x,
rain()),neg(doubt(x, clear\_up()))

Woodley: What you’ve written is what the ERG produced prior to 2018
directly.

Alex: Still does.

Woodley: I completely agree that it’s loss-less, but that doesn’t mean
that it’s the same.

Alex: It’s syntactic sugar/notational variants.

Guy: Bringing this around to the algebra: The conjunction needs to grab
whatever’s in the LTOPs of the conjuncts.

oe: Revised ERG grabs the INDEX and identifies the LTOP.

Guy: … negation …

Alex: That’s why we want an event for negation.

Guy: In terms of the DMRS algebra presented, this would mean putting a
link to the LTOP rather than the INDEX.

Guy: Draws DMRS for the structure, with /EQ at the top (args of and).
Can see that it’s a straightforward post-processing step to change these
to /H.

<img src="http://faculty.washington.edu/ebender/VirtualSummit/believe-and-not-doubt.png" title="http://faculty.washington.edu/ebender/VirtualSummit/believe-and-not-doubt.png" class="external_image" width="400" alt="http://faculty.washington.edu/ebender/VirtualSummit/believe-and-not-doubt.png" />


Guy: Dan, could you put in ARG0 of neg instead of doubt here?

Dan: Yes, I could. I’ve just been discouraged from doing this in the
past.

Guy: What would be the challenge in setting up ‘and’ so it takes handles
as arguments instead of individuals? What was the gain of trying to have
the same analysis for NP and S/VP coordination?

Emily: Not the same. With nouns, the LBLs aren’t identified.

oe: The LTOPs are, they just aren’t identified with LBLs, carefully.

oe: This came about from trying to update the algebra to what the ERG
actually does. This move simplified what we were doing in terms of
algebra-izing how the ERG handles coordinate structures. Would have to
look through old notes to figure out exactly how.

Alex: Does the ERG cover coordinated determiners like ‘three or four
people’.

Guy/Dan: Those are adjectives, and then udef\_q is supplied. ‘two dogs’
and ‘angry dogs’ are treated the same.

Alex: what about *all but one*

Dan: *Some but not quite all* - No one’s told me what I should do with
that. No plausible MRS has been supplied. Can’t do composition without a
target. I do provide an analysis, but using partitive. *Some things but
not quite all cats*.

Alex: So just one quantifier?

Dan: No, two.

Guy: For dealing with those, maybe you do want the LTOP of the
quantifier available to hook them up together.

Guy: Back to the earlier question … still trying to get to something we
can give a truth value. DAG structure rather than a tree structure.

Woodley: Would help, as Dan points out, with the ‘can and must eat fish’
problem. This is appealing, but not quite fully worked out.

Guy: How not quite worked out?

Woodley/oe: You have to write it down.

Guy: Just like with a scope tree, how you find truth values.

Woodley: I know how to do that for a DAG.

Guy: The same, because it’s acyclic.

Alex: And rooted.

Guy: True, stronger than just a DAG. It’s a rooted DAG.

Dan: What’s the bound variable for the BV in ‘some or all cats’?

Guy: The same cat variable.

Dan: How do I write the error checker that detects doubly bound
variables?

Woodley: Guy says feel free.

Dan: But it’s often a good signal of a mistake. So this is going to
reduce the power of that error checking. Not terrible, just thinking
through the consequences.

Guy: There would have to be something connecting those two quantifiers
together, otherwise you wouldn’t be able to resolve into a rooted scope
DAG.

Dan: Can I use the current software to create fully resolved scopes
(again for error checking).

Guy: Would need modification.

Guy: Draws DAG for *some but not all cats bark*

<img src="http://faculty.washington.edu/ebender/VirtualSummit/some-but-not-all-scoped.png" title="http://faculty.washington.edu/ebender/VirtualSummit/some-but-not-all-scoped.png" class="external_image" width="400" alt="http://faculty.washington.edu/ebender/VirtualSummit/some-but-not-all-scoped.png" />


Emily: That’s scary. But it makes sense.

Woodley: I have an itching desire to put in a glb.

Glenn: R.O.F.L.

Emily: Glenn, we can see you and we know that’s not true.

Alex: Logically speaking you have two quantifiers here each binding a
variable. Even in dynamic semantics they’re referring to different
things. Truth conditionally it’ll turn out fine: Some cats bark, but not
all cats bark.

Emily: But in what Guy’s drawn, they're binding the same variable.

Alex: Which makes them different variables.

Emily: So the quantifiers win.

Alex: Of course the quantifiers win.

Dan: Are you playing a pun here?

Guy: There’s only one variable here. Of course it can refer to multiple
things, because it’s a variable.

Alex: So that’s how you get it in the right places? If you look at the
model theory … the variable assignment function can be working over
different individuals than for the other, but that’s fine. It works
truth-conditionally. But having the same variable syntactically as you
compose, you make sure the right things go in the right restrictors and
the right bodies. For some x, x is a cat and x barks and not all x x is
a cat and x barks. Logically equiv to having a variable y in that second
quantified thing.

Alex: It’s worth exploring this trick that Dan is playing when
coordinating VPs is worth looking at with quantifiers as well.

Guy: Here you have to grab the cat individual because some, but not all
don’t have ARG0 to grab hold of.

Dan: Back to the Q of what got simpler in the shift to 2018: in the past
I wanted just one rule combining and with its next thing. Had to pretend
to be doing the same composition operation with NP and VP. Always grab
both handle and index and store in the EP. For verbs, got both and never
used the index and for nouns got both and never used the handle. Was
pretending to do a uniform thing but it was always disjoint. Could go to
a different move to double all of the coordinate structure rules (40
-&gt; 80) where one set does index combining and one does handle
combining. Didn’t want to.

Guy: This feels analogous to the two versions of the A & M operations.
We might still need that.

Dan: oe, Emily and I are tilting in that direction too. Have long
teetered on the brink of splitting the HCR into two (one for scopal and
one for non-scopal).

Alex: Why?

Dan: Because I want to say what the operation is. (There’s always enough
lexical information so I don’t have to, but awkward in some places.)
I’ve done it for head-spr, head-subj, and head-mod.

Guy: While trying to work out formalizing DMRS algebra, was deciding
between two different forms of each operation (as in the talk) or
annotating the graphs: SUBJ.INDEX not SUBJ.

Dan: Have long talked about having a ‘GRAB-ME’ feature in the HOOK.

Emily: Any given thing always have one GRAB-ME? What about ‘swim’
combining with ‘quickly’ or ‘try’?

Dan: When there’s an underspecified functor that doesn’t want to care, I
have to split that into two kinds.

Emily: So some functors just want the ‘GRAB-ME’ but some have an
opinion.

Dan: Yes. And coordination might be one of those. Coordination wants
‘GRAB-ME’ which for VPs/Ss would be LTOP, N/NP INDEX.

Alex: I think that makes absolute sense.

Guy: What about Turkish and Japanese examples where you might want the
index rather than the LTOP. Non-scopal modifiers attaching after
negation.

Alex: Didn’t we do that in our negation paper, Emily?

Emily: Yes, I think we ended up with wanting leq.

Guy: Maybe the morphology on ‘swim’ could switch GRAB-ME?

Emily: Not quite. We’re talking about Turkish for ‘I believe Kim doesn’t
swim quickly.’ Morphology makes LBL of neg LTOP, quickly takes INDEX (of
swim), believe takes ‘GRAB-ME’ which is still LTOP.

Dan: But the INDEX of not-swim should be the ARG0 of not, according to
what you were pushing me towards before.

Guy: I’m suggesting that the negation node is what the and points to.

Dan: How did you get there from 2018? I can give you the eventuality of
‘doubt’ or ‘neg’. If I give you ‘doubt’ you have to work hard to find
‘neg’. If I give you ‘neg’, then you have direct look up, but that
doesn’t work Turkish example.

Guy: In DMRS algebra, when I grab a node, I grab the whole node, not
just the handle or the individual. It’s a problem in the MRS, but
they’re the same thing in the DMRS.

Alex: It just figures in the labels on the arc. That’s where the
difference is. DMRS really helps here.

Dan: oe, can you imagine whether we explored the alternative of doing
that ‘GRAB-ME’ equivalent split in HCR to do the same thing in
coordination … two different operations for coordination rather than
just one.

oe: Those notes are not here in my home office… I think this involved
among other things modification of coordinate structures.

Dan: We were down inside a little bit of a box canyon someplace with
three or four elements at play. You’re now reminding me that the
‘GRAB-ME’ solution would allow me to not proliferate the coordination
rules.

Alex: What about ‘walk and swim quickly’? What does ‘quickly’ modify? Is
it possible for it to modify both walk and swim semantically when
attached wide? Or the semantic index of ‘and’.

Dan: Yes.

oe: It can only modify one thing. The individual of ‘and’ is what
represents…

Guy: A new eventuality. A non-scopal ‘and’.

Alex: Which is why it’s good to do it this way. LEaving it to pragmatics
to work out whether or not you want to conceptualize the coordinated
events as composite or separate events.

Dan: 1214 adn 2018 aren’t different in that respect.

Emily: Remembering some of this discussion. What’s the difference with
e.g. *while* -- never giving us composite events. Totally happy with
that for *because* (no need for one event), but for *while* I’m not
sure.

Alex: *I dreamt while sleeping*

Dan: *I dreamt while you slept*

Alex: In that case, two events

Emily: Plenty of languages where that’s marked with morphology on one of
the verbs, e.g. continuative aspect on one of the verbs. Kristen’s
library -- the mark on the verb can also have other meanings, so the
extra predication is added high. Is this a well-motivated distinction?

Dan: This can modify nouns, *my presentation while in Paris turned out
to be a disaster*. That’s non-scopal.

Emily: *I dreamt while you slept* Scopal in both arguments.

Alex: *I dreamt while you were probably out*. *My dog while in the park
chased a stick*, semantically chasing while in the park

Dan: This a pre-posed PP, e.g. *John would on Tuesday go to the store*.

Emily: What if there’s somewhere you can rent dogs...

Alex: Metonymy for *presentation while in Paris*

Emily: If we treat *and* as combining events, that sets up to let
pragmatics decide...

Dan: A conjoined verb phrase presents only the LTOP and the INDEX from
the coordination. What happens to be inside the argument slots is
invisible.

Emily: So this doesn’t provide an argument for treating ‘and’ and
‘because’ differently.

Dan: Right.

Guy: One more example: *I ordered my brother and begged my sister to
come along*. *I ordered the cat and begged the dog to sleep.* I think we
would want to have two different events … does there have to be some
kind of ellipsis? Trying to work out what the algebra would have to do,
I was tripped up by not knowing what I was aiming for. If we only have
one ‘sleep’ predicate, what should the ARG1 be of it?

Alex: ‘sleep’ example is nice because there’s no interpretation of it as
one joint event.

Guy: But *my brother and sister slept.* --- just one event?

Dan: *my brother and sister* is one individual. But we don’t have that
luxury in *I persuaded my brother and begged my sister* the ‘and’ isn’t
creating one conjoined individual out of ‘brother and sister’. Maybe we
have to do something fancier in these RNR cases to start proliferating
individuals.

Glenn: The same as the problem with *I can and must eat fish*.

Dan: Not quite the same. Only one individual.

Woodley: Not sure it’s not amenable to the same solution. We’d have to
draw the MRS DAG.

Guy: I’ve tried to draw the persuade/beg example but sleep would have to
have two ARG1s. Or have the persuading and begging have two different
sleep predicates.

<img src="http://faculty.washington.edu/ebender/VirtualSummit/order-beg-sleep-sleep.png" title="http://faculty.washington.edu/ebender/VirtualSummit/order-beg-sleep-sleep.png" class="external_image" width="400" alt="http://faculty.washington.edu/ebender/VirtualSummit/order-beg-sleep-sleep.png" />


<img src="http://faculty.washington.edu/ebender/VirtualSummit/sleep-with-2-ARG1.png" title="http://faculty.washington.edu/ebender/VirtualSummit/sleep-with-2-ARG1.png" class="external_image" width="400" alt="http://faculty.washington.edu/ebender/VirtualSummit/sleep-with-2-ARG1.png" />


Dan: Not convinced: *I begged my sister and ordered my brother to admire
<span class="u"></span> self/selves*.

Alex: Has to be themselves.

Dan: So it has to be a group.

<img src="http://faculty.washington.edu/ebender/VirtualSummit/RNR-added-group-entity.png" title="http://faculty.washington.edu/ebender/VirtualSummit/RNR-added-group-entity.png" class="external_image" width="600" alt="http://faculty.washington.edu/ebender/VirtualSummit/RNR-added-group-entity.png" />


Alex: Built how?

Dan: RNR is a particular construction, and when I do RNR with VPs with
any number of arguments, I have to keep track of those arguments. I
think I still have access at the lexical level to that sequence of
arguments and their semantics. Could create the groups in that process.
Not just of the eventuality at the top.

Guy: Would be very interesting because in the AM algebra holding onto
placeholders…

Alex: Then the group individual surfaces where? What connects the
conjoined individual to the indices of brother and sister?

Dan: The RNR construction would hook that up. Could either introduce a
new ‘and’ predication, or use ICONS to map individuals to groups.

Dan: Appeals to information you’ve already motivated, but does violence
to the idea that we are only dealing with HOOKs.

Glenn: Call the group constructor something other than ‘and’?

Dan: Where does that leave us?

Guy: I like this resolution on this last point.

Dan: And what advice should we give the Matrix developers re changing
their analysis of coordination? Woodley, Guy?

Woodley: Well, everyone in the room disagrees with me. I still like
handle equality as logical wedge.

Guy: Three steps --- could grab the handle of the quantifier.

Dan: You’re wrong. Then I’ve bound them in their maximum positions.

Alex: Let him finish!

Guy: This is why I drew the fully resolved scope DAG for *some but not
all*. Let me show you what I would want for the underspecified version.

<img src="http://faculty.washington.edu/ebender/VirtualSummit/some-but-not-all-underspecified.png" title="http://faculty.washington.edu/ebender/VirtualSummit/some-but-not-all-underspecified.png" class="external_image" width="400" alt="http://faculty.washington.edu/ebender/VirtualSummit/some-but-not-all-underspecified.png" />


Woodley: I assume if you’re going to do NPs with label of the quantifier
as the ARG of coordination, you’ll also have the quantifier.

Emily/Dan: That’s not the example in question. *I chased a dog and a
cat.*

Dan: *Every dog chased a cat or a mouse* I don't know what the full
range of scopes is, but I would think I don’t want both quantifiers
trapped under ‘or’.

Guy:

<img src="http://faculty.washington.edu/ebender/VirtualSummit/a-cat-or-a-mouse-underspecified.png" title="http://faculty.washington.edu/ebender/VirtualSummit/a-cat-or-a-mouse-underspecified.png" class="external_image" width="400" alt="http://faculty.washington.edu/ebender/VirtualSummit/a-cat-or-a-mouse-underspecified.png" />


Emily: These aren’t the examples that I as lead Matrix developer am
worried about. Nouny coordination pointing to indices of is fine. For
verby ones … do I do handles (with or without QEQs) or events?

Dan: Are you comfortable bifurcating the coordination?

Emily: We already do, because cross-linguistically it’s not the same
forms that are used across different POS that are being coordinated.

Dan: I’m not ready to bifurcate, but maybe GRAB-ME solves this.

Emily: Okay, to summarize: For the Matrix, go with handles. For the ERG,
file this under further motivation for GRAB-ME.

Glenn: If that feature becomes real, it needs to be named better. How
about something about publication?

Emily/Dan: Yes, it’s clearly the project code-name. Silly name indicates
that it’s not theoretically grounded (yet).

Dan: Anything else?

Woodley: How do we feel about the DAG solution to things like ‘can and
must eat fish’?

Dan: Reminiscent of discussion at Hankø where we started looking into
this. \[EMB: I think that was [this
discussion](https://delph-in.github.io/docs/garage/WeSearch_ScopalArgCoord).\]

Woodley: Main cost is in loss of existing tools for bug checking.

# Postscriptum (StephanOepen)

one of the (many) related prior discussions was
[WeSearch/ScopalArgCoord](http://moin.delph-in.net/WeSearch/ScopalArgCoord).
i believe that the *slipped and stumbled into the room* examples were
among the motivation for the CAS simplification of coordinate structures
(as non-scopal), because the PP is lexically selected for and both
*slip* and *stumble* want to equate its label (LTOP) with their own.
during the CAS discussions, we further assumed a (currently
hypothetical) universe were other non-scopal arguments (e.g.
non-quantified noun phrases, say a proper name or pronoun) actually
expose a relevant label as their LTOP. on this view, *She hired and
fired Abrams* would seem to present a similar need, of 'breaking' the
lexical expectations regarding their argument's labels.

in the current ERG analysis (equating the labels involved in a
coordinate structure), i believe at CAS we further noted that for
'verbal' coordination the ARG1 and ARG2 roles could be said to be
redundant, on the assumption that coordination is symmetric (and any
cues to interpretation based on surface order should be recovered from
characterization):

      h0:and(e0), h0:slip(e1, x1), h0:stumble(e2, x1), h0:into(_, e0, x2), the(x2, h1) =q h2:room(x2)
    
      ∃ x2 : room(x2) ; and(e0){slip(e1, x1) ∧ stumble(e2, x1) ∧ into(_, e0, x2)}

here, the elements of and{} are unordered, and removing ARG1 and ARG2 in
this analysis would enable paraphrases that permute the conjuncts
(possibly even in nested coordinate structures, come to think of it,
though that might be undesirable with different coordinators—win some,
lose some).

Last update: 2020-08-25 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/VirtualCoordinationComposition/_edit)]{% endraw %}