{% raw %}Dan: A request for extra brain power:

The challenge: Our grammars, being linguistically informed, and precise,
fail to assign analyses to some set of sentences. We’re never gonna get
to 100% coverage. If nothing else, there will be resource constraints.
There are linguistic constraints too. Yet our potential customers want a
black box that works with minimal suspicion. It is reasonable to
consider packaging our machinery as a non-suspicious black box. Indeed
DeepBank 1.0 had a safety net such that it made some semantic (possibly
suspicious) claim about everything it encountered (c.f. Zhang ‘Jigsaw’).
This solution is unfortunately no longer available. Lacking a
replacement, I’ve sought and considered grammar-internal solutions to
the robustness problem.

A possible solution: Whilst keeping as much machinery constant as
possible, (i.e. creative use of start symbols), avoiding combinatorial
explosions, making sure to not be blocked by unspannable chasms in the
chart, and using only internal-grammar techniques that I have access to,
I can go to the 10% of unparseable sentences, and without necessarily
having to study the failed charts too carefully, I can create 50 to 1000
spanning rules of the form: “somewhere in the middle find me a sentence,
give me a few sisters/daughters to the left and right, and call it
good,” or “I need a subject, a noun phrase, and a verb phrase, with
possible pieces interspersed”, or “Find a big chunk of MRS to salvage,
and then provide vague categories and covering elements via 2-place
fragment-MRS relation ‘\_frag\_rel’”.

These “covering span rules” allow a fully connected MRS to be issued and
they are only allowed to apply in the spanning chart cell. This avoids
the combinatorics. Then, the (new) root condition (‘desperation\_frag’)
that admits them is given the lowest priority amongst start symbols.

e.g. “A crazy linguist he doesn’t know how to solve this problem.” (ERG
trunk: 0 derivations)

Currently, the inventory of n-ary rules such that n&gt;2 is few. This
proposal might expand this space.

A caution: setting the resource limit too low might starve the various
‘\_frag\_rel’s. Worst case, the parser exudes: “I found a string of
lexical items!”

If this could work, additional treebanking would be required in order to
characterize the quality of these new spanning fragmentary analyses.

Woodley: The notion that you can solve your problem by writing a 50-ary
rule is not going to work. In theory yes, but with existing technology
this would defeat selective unpacking. A spanning rule that takes even,
say 10 daughters… 10<sup>10</sup> local ambiguity is not feasible.

Dan: What’s the maximum number of daughters you’ll let me have?

Stephan: Depends on how well constrained the daughters are.

Woodley: If you’re careful, you can maybe explore the space a little.
This type of explosion is not too common with the current grammar.

Stephan: Let’s not forget to talk about the Jigsaw type approaches
during this session. But as for your proposal, I feel there’s something
we have often brought up in this context in the past, which is that we
might invoke the robust machinery as a second phase. Now it seems like
you’re trying to do it in the main pass. Adding a second phase of
parsing, I think, can be added to the processors, this would allow us to
keep the main parse clean and not proceed to the putative second phase
unless necessary.

Dan: I think the results, modulo performance/efficiency, should be
equivalent.

Stephan: Maybe not; I think you’re reading too much into the ordering of
the root list.

Dan: Via experimentation, I have seen certain behavior which I have
grown to believe is true.

Woodley: Ordering only affects the labeling of the derivation.

Dan: Oh, I see. I guess there would still have to be two separate steps.
I’m still expecting that the worst of the original results will be
better than all of the fragmentary analyses.

Ann: Why not: “Any two constituents, stick them together.”

Dan: Robustness currently is not a 2-phase process. I want them to play
in the same soup, competing on level territory. 2-phase could be a way
to do it more efficiently. Current robustness rules are extremely
explosive. Astonishing numbers of edges come in as soon as they
activate.

Woodley: Robustness rules are a “good (MRS) analysis of substandard
language” versus the current discussion, “Bad analysis of
well-intentioned language.”

Ann: Don’t exclude the former when activating the latter.

Woodley: How would your proposal differ from XLE skimming mode?

Dan: I think it’s similar.

Woodley: So you think you can get better precision (or what...?) by
doing it yourself.

Dan: Need to look at some cases. But the grammarian has the best
knowledge of the relative competency of the various areas of his
grammar. For some problems, less linguistic (automatic) gluing solutions
might be fine, but for others, the grammarian should supervise.

Stephan: skimming is not the right analogy in the XLE. What you had in
mind is XLE “fragmenting mode”. When they reach a stop-point (no
analysis), they go into a procedural mode which finds the smallest
left-branching path through the chart.

Dan: We tried it in Verbmobil.

Stephan: Yes, and Yi looked at probabilities for the shortest path
through the chart. I think Dan wants to be part of this walk (“chart
gleaning”) and that’s reasonable.

Dan: The spanning rules part is new. We would need to somehow prevent
multiple application. I explode when I do recursive robustness rules.

Ann: Treebanking of the examples you’re not analyzing. Prototype some of
these manually to try it out before going too far?

Emily: can the full-forest treebanker be deployed/adapted for this?

Woodley: Maybe

Ann: give me only the analyses that are consistent with..

Dan: in this instance, the full forester is designed very easily for
this, to highlight a span and the engine immediately gives me...

Ann: yes "rascal"...(?)

Dan: Emily’s idea of the full forest treebanker sounds great

OE/Woodley: We could only enable the “glue anything to anything rule”
XP-&gt;XP XP in the full-forest treebanker.

Dan/Emily: Huge explosion.

Woodley: no because the mother of the rule could be ‘never unify’

Stephan: In this way the treebanker would be helping you identify
‘islands’ in the chart for further investigation.

Woodley: It gives you a way to see the dark matter.

Ann: Then you’ve got test data and away you go

Stephan: (something about Yi’s paper)

Francis: Sounds similar to how we were evaluating transfer rules
extrinsically

Dan: Summary of part one of this discussion: I think it would be good to
explore, at this early stage, these ideas cross-linguistically, and not
just in the ERG. viz. Does a grammar have to obtain a certain level of
maturity before this approach of having a “top-down” development harness
becomes useful? In fact, might such an approach work for very early
development.

Glenn: i.e. even right from the toy stage, as ‘placeholder’ analyses

Ann: should we, at this point, look into what that fragmentary MRS would
actually look like?

Dan: I haven’t thought about it. I’m just envisioning a pairwise
relation.

Stephan: ‘\_implicit\_rel’ ‘\_runon\_rel’

Ann: It’s a well formed RMRS to just have a list of EPs. That’s a
generalization of WF MRS. The links between EPs are a specialization.

Dan: It might be that I can say more.

Ann: Conjunction might be a reasonable model for relating this index and
this LTOP to each other. Assuming these things are going to be wrong in
some sense, you’re not deferring the decision. To go from robust
structure to WF MRS would then be when the decisions happen

Stephan: if we can’t be assertive about who did what to whom, we just
say nothing. If we feel like we should say “juxtaposed” or “run-on”.

Glenn: why was connected MRS important?

Dan: I had forgotten that RMRS doesn’t have to be connected.

Woodley: What about the applications that are trying to look into these
MRSes. Different apps will have different needs. But possibly the junky
ones will be non-trivially confusing/different for certain apps to
interpret. The shape of the glue relations to some applications may not
be irrelevant.

Francis: Doing graph comparisons disconnected MRSes cause Matthieu some
pain.

Ann: I’d probably throw the glue relations away.

Dan: Is there a simple deterministic way to take a non-connected RMRS
and produce a graph for a downstream app?

Ann: I wouldn’t want to make strong statements about semantics that are
not built compositionally.

David Mott: Re: disconnected fragments, some IBMers spent a lot of time
with low-resolution approaches which do end up with useful information.
Having the disconnected parts could be useful.

Ann: indeed, I would prefer them to be disconnected.

Dan: ‘\_frag\_conj\_rel’

Ann: I’d prefer that it weren’t a “rel” but we can confront that later

Woodley: The LTOPs should not be lost

Ann: That’s a very good point. We should maintain a collection of them
perhaps? A version of CONJ which contains a list of LTOPs might be a way
to do it.

Woodley: Branding of the ERG. Right now the ERG “brand” is high
precision. A caution that these frag analyses could tarnish the brand if
they are not well understood by lay consumers.

Dan: I think I’d feel more sympathetic to that if I had more admiration
for the range of existing analyses. Just because I found a covering
span, even now, doesn’t imply high quality. There is a good one most of
the time somewhere in the chart, but it often doesn’t rise to the top.

Stephan: trading precision for coverage. It’s a configuration
difference. It will be sensible to be clear about which configuration is
active.

Ann: Important issue.

Dan: As per Stephan’s request, let’s move on to the Jigsaw issue?

Stephan: I want to share some updates and thoughts to see whether it
triggers. This is from Angelina’s work. I remember being surprised at
the quality of Jigsaw results. It took 6 minutes to parse something and
was only a few points below what I hope for. New DeepBank ParseEval F
score approaching 80. Yi reached around 85 on WeScience. Perhaps using
an off-the-shelf PCFG parser might give us robust meaning composition.

Ann: Could we get a link to the export mechanism that is available...

Stephan: it’s part of the tsdb++ ecosystem. Angelina further reduced
Berkley PCFG trees to DT, ... (?) Robust unification and robust meaning
composition. These correspond to directly to groups of existing ERG
constructions. HEAD-COMP, SUBJ-HEAD, use these in robust unifications.

Dan: with this approach one assigns an analysis to every surface?

Stephan: Yes you’ll get at Dependency Tree for 100% of all inputs. Same
idea as Jigsaw, but here using off-the-shelf technology.

David Mott: Is there a way to use the lesser part to then inform the
ERG?

Dan: Aid in disambiguation: I’m going to prefer analyses from the deep
engine that are congruent with the shallow...

Ann: It could be an aid in the case of time-out

Stephan: What Angelina is doing, it’s similar to skimming, take some
chances based on shallow opinions...

Bec: If it’s an aid to efficiency, not all of us have a terabyte.

Woodley: In my experience, sentences that end up without a parse, mostly
due to grammar coverage, not resource exhaustion

Ann: what about resource exhaustion during treebanking? Can we
dynamically analyze sub-parts which the user specifies as a constituent?

Dan: what would be a next step? Do we wait for someone to save the day?
Wait for a brilliant Stanford student to show up?

Stephan: Can we use syntactic dependencies to put together an HPSG
analysis? If you (Dan) give us those 50 construction types, I think we
can run that experiment fairly quickly.

Dan: Sounds more satisfying than my spanning rule proposal. This might
do a better job of addressing Woodley’s explosion concerns.

Stephan: for example you will be running head-filler rule without
extraction

Dan: but this is no-longer a self-help approach. Are there comments that
some of you have been holding back as illuminating conclusions? No? Ok
let’s go eat.

Last update: 2014-10-15 by TJTrimble [[edit](https://github.com/delph-in/docs/wiki/TomarRobustParsing/_edit)]{% endraw %}