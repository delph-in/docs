{% raw %}# WordNet integration notes

## Francis's intro

Some colleagues at times sneer when we say we're doing deep linguistic
processing, because MRS after all isn't very deep --- structural, but
not lexical semantics.

Want to look at deeper linguistic processing with HPSG --- in particular
[WordNet](/WordNet).

Multiple possible resources for lexical semantics: Goi Taikei,
Wikipedia, ... but [WordNet](/WordNet) is probably easiest.

If we knew what words meant lexically (dog is an animal, translation is
a process, Suquamish is a place) then we could generalize some of the
knowledge that we have, and condition on semantic classes. Improvements
in

- Improvements for parse ranking (Fujita et al, Egirre et al) If you
just try to use senses at is, doesn't help at all (too sparse) need
to back up the semantic hierarchy.
- And it goes the other way: trying to do WSD, it's helpful to know
that \`dog' barks, in trying to figure out which sense of *dog* is
meant.
- Semantic classes can also help in transfer rules (again, selecting
the right sense). Learning everything you possibly drink, need a
very very big corpus (beer, water, Shirley Temple), but generalizing
to liquid' or beverage' can help with decreasing number of rules and
increasing robustness in transfer.

Proposal: make senses types, use a hierarchy

- Advantages:
  - conceptually simple,
  - we have relevant machinery so it's easy to experiment with.
- Problems:
  - Slow with current machinery
  - Creating different words (one for each sense) -&gt; large
increase in (very packable) ambiguity; Can super-sense-tag to
prune
  - MWEs where WN node is *machine translation*, *lose one's
temper*, which don't point to single thing in ERG, either
because MWE isn't there, or because we wouldn't analyze it that
way.
  - Unknown words can cause problems. How to put unknown words into
the hierarchy (esp NEs)?

Other ideas:

- Use WN sense IDs as PRED values
- Add a CONCEPT feature to *relation*
- Add CONCEPT as a feature on *index* (but requires very good
hierarchy early on, because we unify indices in various places).

Resources: Free, freeish, and not free WNs for many WNs (see slides),
and WN-sense tagged corpora.

When: Francis is optimistic that he will have laid the groundwork to get
into this within the next year or so.

## Discussion

Laurie: It seems like dealing with nouns that WN is easier than dealing
with verbs. Do you see any issues or problems when you work with verbs
instead of nouns.

Francis: Has mostly worked with nouns. WN hierachy is much flatter with
verbs than nouns. Expectation is that as a side-effect will come up with
verbs with WN senses, plus sub-cat from grammars, plus selectional
restrictions in terms of these senses. (Similar to
[FrameNet](/FrameNet).) Semantic preferences can probably be done fairly
programmatically once we have the integration of the senses.

João: What about other relations in WN (other than subsumption).

Francis: Right. The big one is meronymy. Would need to explicitly model
as extra predicates somewhere in the space so that it's part of the bg
knowledge that the grammar has.

Emily: Does that go in the MRS?

Francis: Yes, but exactly how, we don't have that yet.

Valia: Have you done experiments to show that integration of
[WordNet](/WordNet) is worth the slow-down in the parser, etc?

Francis: Have done experiments with Goi Taikei. Implementation was
entirely off-line, so we couldn't measure efficiency. Egirre has shown
that WN helped for English, with a different grammar. If you believe
that in the long term accuracy is more important than speed, then
certainly worth it.

Valia: [WordNet](/WordNet) is messy. (Implications for what accuracy
improvements we can hope for.)

Francis: WN is far from perfect, just like our grammars. Part of my
expectation is that we would have to improve WN.

Valia: What about supporting WN with [VerbNet](/VerbNet) and others, for
fallback strategies? (And set things up so each resource can be toggled
on or off to try different experimental settings.)

Francis: Yes, [VerbNet](/VerbNet) [FrameNet](/FrameNet) from the start
would be useful. Hope would be that we would enhance not just our
grammars but also [WordNet](/WordNet), to the level of what's in
[FrameNet](/FrameNet).

Prescott: Would you be able to express constraints that would have an
impact across sentences (through coref chains)? (Ex with dog linked to
further NP that then meows.)

Francis: Selection restrictions are better thought of as part of a
ranking model rather than hard constraints. Intersentential constraints,
haven't thought about very much yet. But selectional restrictions can be
very useful for coref resolution, at least for Japanese. Would expect it
to help.

Tim: WSD is not a solved task. If we add in WN into ERG, it's going to
become slower and more inaccurate. Are we not going to evaluate at the
sense level? And if we're not going to evaluate, then why are we doing
it? To date, if we push anything into the syntax, it's been motivated by
the syntax-semantics interface. Better to still clump senses that are
morphosyntactically undistinguishable? But doing it so that it can be
fed into the parse selection model, but still underspecified. Never have
to syntactically disambiguate senses that don't have any syntactic
distinction.

Stephan: Foundational questions. What is our understanding of the
parsing task? What is our understanding of being syntactic? Francis's
proposal for \`how' runs against our approach so far. Parsing is
syntactic ambiguation, and syntactic is anything that is grammaticalized
(impacting grammaticality). Lexical semantics mostly doesn't meet this
criterion (exceptions like count/mass paralleling sense distinctions).
Now suggesting that there are parallels: both disambiguation. Might want
to do joint learning, but that doesn't mean word-sense ambiguation would
be in the grammar.

Woodley: Clarify what \`same syntactic distribution' means?

Dan/Emily: *Driver* example. \`Distribution' is hard distribution, not
soft distribution.

Laurie: How do we decide what's syntactic? Ex: *He ate his sandwich
tomorrow* is that a syntactic problem (\*) or a pragmatic one (\#)? How
have you been drawing the line?

Dan: I fear that that is a fundamental problem. I know no good answer
for that. It is easy to find sharp cases where 100 native speakers would
agree. But the blurring to pragmatic constraints is really tough for
non-linguists. *The teacup asked for some sugar* might be rejected, even
if it could occur in *Beauty and the Beast*. If you can push it to a
context where it makes sense, then that's not grammar, that's the rest
of the world.

Woodley: That's a question of your creativity. No such things as 100
linguists?

Dan: There are sentences where even I can get 100 linguists to agree.
*Cat the chased dog the.*

Woodley: 100/100 linguists will agree it's grammatical, without the
context presented?

Dan: No, wouldn't expect that much consistency without providing the
context.

Woodley: 100 linguists = 100 times more creativity...

Francis: The question is whether *The teacup wants the sugar* would
entail that the teacup is animate (in our analysis). I'd like to bring
this into the grammar, but would be prepared to do it as not-the-grammar
if others don't agree. Not 100% convinced that putting everything into
the type hierarchy also used for parsing is the right solution, but want
a big-G grammar that includes these notions.

Glenn: There is already stochastic parse selection that could be made
easier by ruling out analyses based on lexical semantic information.

Emily: Don't want to say WS information makes the parse impossible, but
want to put it there so that parse selection mechanism can learn over
it.

Tim: Yes, make it so we can feed it into parse selection model.

Stephan: [DeepThought](/DeepThought) deliverable (Sem-I) which connects
to that same story. Claim is that \_dog\_n\_rel is a perfectly packed
representation of that equivalence class, but what remains to be done is
to relate that atomic predicate at the semantics interface to WN,
domain-specific ontologies. Would be concerned to say we only commit to
WN as something to support. Need to worry about modularity, another
benefit of the current design. It's all there, you (Francis) should
provide mapping to WN sense, plus training data. Seems like a lot to ask
treebankers to disambiguate parses and word senses. I understand that
you're frustrated that telling that story we never get to it.

Francis: I understand that you strongly believe it --- but I've never
been convinced. But I'm open to a model we'll all believe in.

Woodley: Most of the time in parsing is the exhaustive forest
construction, so adding even more ambiguity (packed or otherwise).
People are experimenting with beam searches and trying to limit that
step, thinking about statistics about animacy seems premature there. \[?
might have gotten that down wrong -EB\]

Stephan: Same story about joint parse and word-sense selection I could
tell about pruning, too.

Emily: What's the mechanism though, if not by the grammar?

Stephan: We have a design but haven't ever implemented it (Sem-I). But
also the problem that parsing is made practical by restricting the
semantics, so that info isn't available during parsing.

Rebecca: Reranking on exhaustive forest (or top-N) with information
added. Not as clean as doing it jointly, but can be done within in a
year.

Francis: Were doing WSD first, and then using that do to parse
reranking. Weren't getting benefit of the parse for WSD.

Rebecca: Could ...

Francis: To be continued in [OntoNotes](/OntoNotes) discussion.

Laurie: \[Channeling Hans\] For these grammars to be useful in
applications, one of the great things is that we have the semantics, but
when we restrict the semantics to only contain things that are
syntactically relevant, then less valuable. Could be useful for temporal
work, which is really relevant in medical field. Temporal issues are the
focus of this discussion, but it's still the same issue. Have to have
some way to end up with a semantic package that actually has the
semantics in it.

Francis: \[Shorter Laurie\] There are many applications for which
lexical semantics would be useful.

Dan: There is definitely a user base for this. What we haven't
identified in the past 10 years is a provider base. If we want it, but
aren't going to produce it ourselves, find some way to out source it.

Francis: I am committing to producing it, but might not do it in the
best possible way.

Francis: I want to hear Dan's point of view.

Dan: I think that it is very likely that info about lexical semantics
would sharply reduce the noise in the current parsing process. I believe
that having lexical semantic information would greatly improve the
robustness of the generator. For both ways I see the grammars being
used, that info would be immediately and selfishly useful. The problem
is that I'm also convinced that unification is the wrong thing to use
for this. Unless we go for coercion rules. Every domain imposes
constraints on its entities, but each domain has its own base types.
From meeting scheduling to hotel reservations some of the predicates
shifted. Some of the object types shifted (sorts couldn't be what they
were). Transfer group went about relaxing constraints. It's clear that
grammatical constructions is the wrong place for semantic constraints,
which aren't hard constraints the way we pretend that syntactic ones
are.

We have to put them somewhere. The unifier is a black and white object,
and is not stochastic. Can't put them anywhere the unifier will get to
them. It must be able to succeed somehow --- open type hierarchy, unlike
the closed one we have now.

There is a way we could coerce our unification machinery into working on
semantic types by automatically generating the \`bottoms' of everything.
Won't get any filtering, but will get information that can be presented
for disambiguation. Can be heavy-handed way to do it.

Never get beyond that step, never get to do anything where I can
experiment.

Two main problems:

1. Tool of unification is the wrong tool for this kind of semantics. At
least problematic. (Woodley clarifies: to put constraints on those
in grammar.)
2. Really really want something to experiment with. A tool, that stands
off from the unification itself, which would enrich that parse with
whatever information could be extracted.

Emily: If you only put in one constraint (e.g., the nouns on their own
ARG0 or PRED) then the unifier doesn't care because it would never be
contradicted. What I heard Francis saying was that the nouns put the
information in, but nothing else does. Can learn the selectional
restrictions later.

Francis: That's what I wish I meant. As a cheap way of experimenting to
make the information easily available from the grammar.

Montse: Tried putting selectional restrictions in the SRG, but had to
take it out. Good to have a separate feature (like Francis's on CONCEPT
on relations).

Francis: Can help the parse selection model, but you pay more in
treebanking.

Stephan: Given the current machinery, couldn't in fact make the
distinctions since all 7 *dog*s are the same lexical type.

Emily: That is a natural way to separate the two tasks.

Antske: If it's only in the nouns, how does the parse selection model
take advantage? \[? Not sure I got this right\]

Francis: \[... missed this one ...\]

Stephan: Two possible experimentation platforms emerging:

1. Script that takes WN-ERG mapping and adds lots of lexical entries.
2. Or someone would write transfer rules that post-process MRS and
unfolds \_dog\_n\_rel into the 7 distinct predicates.

With either could arrive at sets of MRSs that you could use to look at
WSD ambiguation.

Francis: Couldn't get the 2nd approach to work, and the 30 min loading
time for option 1 was barrier.

Yi: Let's talk later about efficiency.

Francis: I agree that there are cheap ways of doing this, but they
require tweaking to get off the ground.

Dan: This has sharpened up one stepping stone: That it is possible to
take info from e.g., WN and decorate the characteristic variable, and it
would be inert (not changing grammaticality) if nothing else constrained
that feature on the other position that variable shows up in. Still not
convinced that it helps to ambiguate at the head of the pipeline is
anything other than making more work. Creating 64 entries for *driver*
just doesn't seem like a road to happiness. The observation that it
would pack quickly doesn't mean it would pack quickly enough.

Yi: We pack because there isn't enough interaction between the syntactic
and semantic part of the feature structures. So packing might help. But
on the other hand, maybe we don't need to do the unifications then.

Francis: We have to ambiguate just before we need the information. If
using it for pruning, it has to be there up-front. Could be done just
before unpacking if we were doing it then. Happy to put it as late as is
practical.

Stephan: Also the distinction to remember between disjunction and
underspecification. Seven copies of dog\_n1 seems stone-age. Sem-I entry
is the underspecification, if WN is the target, ... I'd like the
flexibility to change the lex semantic target based on application.

Woodley: It could be quite helpful to have WN hierarchy avaialble in
writing transfer rules. What would that interaction be like? Would it
have to be in both hierarchies, or add just before transfer?

Stephan: The story is: The Sem-I (inventory of semantic predicates) is
what should be connected to such a hierarchy (WN etc). Not part of the
type hierarchy of the grammar, but a separate hierarchy. Once you had
that, the design is that that hierarchy is part of the transfer
grammar/available in the transfer rules. Came close to building that
LOGON project, but ran out of time.

Francis: If you don't believe that it would be useful in parse ranking,
makes sense to do it after parsing. If you believe that real world
knowledge/lex semantics is useful in parse ranking, need to do it
earlier.

Stephan: If you postpone \`parse ranking' (syntactic + WS
disambiguation), until after the lex sem ambiguating transfer grammar
has applied, then this model can do what you want without making seven
copies of the syntactic properties associated with \_dog\_n\_rel.

Antske: How useful is it to put features like that in the parse ranking?
Seems complex and expensive. Needs lots of data and slow.

Francis: We did it all off line and it was slow. But people are working
on efficient methods.

Stephan; Should not be insurmountable, but the benefits weren't
dramatic.

Francis: But we didn't do all the experiments because it was slow.

Last update: 2012-07-24 by LilingTan [[edit](https://github.com/delph-in/docs/wiki/SuquamishMRSWordNet/_edit)]{% endraw %}