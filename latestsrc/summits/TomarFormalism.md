{% raw %}# Discussion: HPSG Formalism Harmonization: Implications, Relations, Macros?

# Background

Within HPSG, currently, (at least) three sub-communities working on
computational grammars:

- [Alpino](http://www.let.rug.nl/vannoord/alp/Alpino/) (Groningen):
- [CoreGram](http://hpsg.fu-berlin.de/~stefan/Pub/coregram.html)
(Berlin, et al.): TRALE (plus various add-ons, e.g. UTool and
[\[incr tsdb()\]](http://www.delph-in.net/itsdb))
- DELPH-IN:

These groups assume different formalisms in their work (and,
correspondingly, different interpretations of HPSG). Among the above,
the [DELPH-IN Reference Formalism](https://delph-in.github.io/docs/howto/DelphinTutorial_Formalisms) arguably
is the most restrictive selection of descriptive devices found in the
theoretical HPSG literature; this selection was largely made in the
mid-1990s.

Alpino is somewhat special, as local to Groningen and focused on Dutch
only; very close collaboration between tool developers and grammarians
over two decades: broad-coverage grammar and fairly efficient parsing.
In comparison to [CoreGram](/CoreGram), several DELPH-IN grammars have
much broader coverage, and can be processed magnitudes more efficiently.

Stefan Mueller
[argues](http://hpsg.fu-berlin.de/~stefan/Pub/coregram.pdf) (forcefully)
that, in order to allow “rather direct implementation of analyses that
are proposed by theoretical linguists”, the following descriptive
devices are indenspensible:

- phonologically empty elements
- relational constraints
- implications with complex antecedents
- cyclic feature structures
- macros (aka templates)
- a more expressive morphological component

From an in-depth discussion that Stephan had with Stefan, formalism
differences are a major obstacle to collaboration with the CoreGram
group and, possibly, also a barrier to establishing agreement within the
larger HPSG community on the ‘standard’ approach and infrastructure for
computational grammar engineering.

Do we feel like revisiting the DELPH-IN reference formalism, presumably
in a spirit of backwards-compatible, monotonic extension?

Are any of the above devices (strongly) attractive to DELPH-IN members?

Would we know how to implement them (with reasonable efficiency)?

As background, here are some slides from an earlier
[discussion](http://www.delph-in.net/2006/formalism.pdf) in a similar
spirit.

# Discussion Notes

oe: part of treatment for sabbatical syndrome: discussing meeting with
SM / [CoreGram](/CoreGram)

oe: Alpino is nice, but unlikely to collaborate; [CoreGram](/CoreGram)
stable universe with richer formalism but worse performance
[CoreGram](/CoreGram) folks critical of our restrictive formalism; we
eschew fancy bells and whistles on purpose, but should we revisit that
decision? SM interested in principle in broader collaboration, but not
without bells and whistles.

do we want any of those bells? probably not all; do we miss any of them?
we may be able to get some of them without sacrificing much efficiency.

ann: what do you mean by phonology? oe: morphophonology. how about
relational constraints for diff list operations? membership testing,
removing things from list, etc?

SM used to want discontinuous parsing facility but now feels that is
unnecessary

priority for discussions: relational constraints and implications

emb: example of implications?

oe: we have them today in the form of GLB constraints in unification.
what about when the antecedent is more complicated? constraints on the
space of well-formed TFS. candidate application in ERG: pairs of
constructions conditioned on property of arguments, e.g. scopal vs
non-scopal arguments in hd\_cmp

wp: conditioned on source of TFS or just shape?

oe: just shape. possible implementation: whenever a TFS is created in
parsing/generation, test all implications and apply them. check the
literature perhaps.

ann: not well defined yet. don't have enough info yet to see what
exactly you mean.

oe: can't be more precise yet because I'm not sure. check the
literature.

emb: introductions should be kept short, please. for the candidate
application to the ERG -- simplifies the grammar a bit but not the
analyses. what about David's example from the other day, "something's
plural"?

ann: there are versions of implicational constraints which mean
unification can end up not terminating. in general if you have these,
you don't even need grammar rules -- beautiful but horrible. if you
disallow some types of them, maybe OK. if the point is just avoiding
introducing a type, not too messy

berthold: dan presented in Fefor some kind of constraint about inferring
information from subtypes

oe: I think that's the same thing maybe.

berthold: I hit that problem every few months.

oe: "Lack of gravity" -- well known gripe, could be handled by this

glenn: safer to do on a full passive edge rather than in the unifier

ann: that's non-declarative. subtle problems.

oe: really? hoping to limit implications to sign-level, assume
subsumption between antecedent and implication, don't see
non-termination issue

ann: so the LHS of an implication has to be a sign type.

oe: yes.

ann: also assume RHS never introduces something that triggers more
implications.

wp: what if multiple implications can apply, perhaps inconsistently?

oe: do them all at once; if unification failures, edge fails

ann: trigger cannot be subsumption; must be unifiability

oe: enough complaints from tool folks. what about grammar engineers'
inputs?

emb: I want my verb's AGR = function(subject's AGR, object's AGR). right
now has to be decomposed.

berthold: not a fully general solution to that, at least at the sign
level. doesn't solve the gravity problem with implications at the sign
level, either.

david i: could move tense info from pronoun to verb in my language.
match some TFS in pronoun.

ann: when pronoun combines with verb, you want to say the phrase
containing the pronoun and the verb has this additional information
which lives on the EP corresponding to the verb?

david: yes

ann: I don't think this helps; need to find the verb relation

emb: can find its HOOK.INDEX. existing solutions possible but ugly.

guy: what language has these pronouns?

david, emb: nanti, wolof

fcb: what I want is default unification.

emb: me too. for lexical rules. we talked about this in Paris, worked
out a spec, nobody implemented it. idea: values of these two paths are
the same unless somebody overrides, and even if so, the rest is the
same. but only in building the type hierarchy.

ann: send me an email, I'll put it back on my to-do list.

fcb: needs to be supported in more than one engine.

ann: need to work out details before it goes too far.

various: SM does not need default unification. berthold: but he probably
would be happy to use it!

oe: DELPH-IN slightly farther from "implementation = theory" than LFG.
we've been fairly successful over in our corner, but it costs us some
interaction with HPSG crowd

wp: what about macros?

emb: why do we need them if we have types?

oe: SM wants to spell out bundles of statements about TFS without
assigning a type to that; without taking a stand on where that lives in
the hierarchy. I'm not convinced, but it would be easy to add.

berthold: petter wants it.

guy: what is it?

oe: textual mechanism substituted at compile time.

wp: want to state same constraint in multiple places without forcing
relatedness in hierarchy

emb: don't do that.

ann: TRALE is closer to PATR-3 than we are. Particular notion of type
that is not the same as ours. Our notion comes from inheritance; theirs
comes from programming language tradition. Easy to add macros if we want
them.

antske: don't understand what the advantage would be?

oe: could look at coregram sources… I think SM uses it to organize the
lexicon

ann: theoretical linguists don't like seeing internal types showing up
-- somewhat understandable.

wp: what is PATR-3?

berthold: PATR is a CFG with unification without types:

ann: "parse and translate"; old technology; PATR-2 precursor to LKB

oe: the good old days. the \*really\* good old days. or the good
\*really\* old days?

joshua: morphophonology?

emb: having looked at Slavi, really morphophonologically complex: really
want to separate things out. wouldn't mind LKB losing morphology all
together. better to separate.

mike: agree with that.

oe: surprised at that position. agree that current approach is
underpowered. 2-level paradigm good idea, but don't see why that should
be \*separate\*? I don't like the duplication of the lexicon.

emb: proposal that conceives of a single lexical database.

antske: would like there to be a standard setup for morphology for
matrix grammars.

berthold: morphology for Hausa. when GG had an external morphological
analyser, couldn't generate; too separate. easier to maintain all in one
place. main problems for expressivity: compounding and (large)
reduplication. also umlaut when too far in.

ann: dubious about analysis of compounding -- interacts with
tokenisation

oe: almost out of time -- take-away points?

danf: not much to say to our cousins; why spend our scarce processor
development resources on building that bridge? anyone in this room who
would benefit from these extensions? dangling carrot of, say,
implicational constraints is tempting, but also raises risks of serious
debugging and learning curve. homework for grammarians: make a list of
things that hurt in the current formalism.

berthold: not sure how much good the implicational constraints would do.
pretty sure list operations would be useful, e.g. access to last element
in a list. German word order jumbling. End up enumerating possibilities
for lists up to length N, which is ugly.

oe: best outcome: do something that gives the appearance of outreach,
but do so in a self-serving manner. Don't set formalism in stone.

Last update: 2014-07-16 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/TomarFormalism/_edit)]{% endraw %}