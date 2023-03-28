{% raw %}# Sense Distinctions, Valence Alternations, Nominalizations, and Everything

Even if ‘standardization’ of meaning representations may be an evasive
goal, for the time being, we might move forward by being (more) explicit
about design goals for ‘deep’ (grammatical) analysis, levels of
ambition, and criteria used in making these decisions. Assuming a
‘conceptual’ (abstract, semantics-oriented) interface to grammatical
analysis, i.e. some kind of meaning representation, many of the
decisions involved are about the (semantic) ‘lexicon’—the inventory of
predicates or concepts and the associated argument positions or labels.

Following are some examples of design decisions embodied in the ERG; we
have long felt ‘proud’ of some of these, while we keep debating whether
and how to revise others at regular intervals. As an overall guiding
principle, we assume that the interface to grammatical analysis should
(a) include all information that is constrained by grammar (i.e.
distinctions which can be argued to be grammaticized); (b) normalize
highly (i.e. abstract away from details of surface syntax), such that
close paraphrases lead to comparable or identical structures; and (c)
minimize ambiguity, i.e. not make ‘unnecessary’ distinctions, where
these do not correspond to grammatical contrasts.

As a corollary of principle (b), valence alternations like the dative
shift or passivization are normalized (in the ERG), for example. But how
far can one push this? What about other such relationships, e.g. the
conative, body-part possessor ascension, *swarm*, or *spray–load*
alternations?

- (1a) She hit the door.
- (1b) She hit at the door.
- (2a) I touched your shoulder.
- (2b) I touched you on the shoulder.
- (3a) Linguists swarm at CSLI.
- (3b) CSLI swarms with linguists.
- (4a) She sprayed paint on the wall.
- (4b) Mary sprayed the wall with paint.

Principle (c) suggests that (semantic) word sense distinctions should
only be made where they align with morpho-syntactic contrasts. For
example, WordNet distinguishes ten senses for the noun *bank*, but all
uniformly have the distribution of count nouns (although one might ask
whether there is a morpho-syntactic sub-division into relational vs.
non-relations senses). On the other hand, the count–mass distinction in
pairs like *much paper* (substance) vs. *many papers* (publication)
might seem indicative of a grammaticized sense distinction.

The current ERG makes comparatively few sense distinctions, often even
affording itself predicate polymorphism in argument positions that can
alternate between scopal and non-scopal values, for example:

- (5a) I watched her arrival.
- (5b) I watched her arrive.
- (6a) I know the story.
- (6b) I know that she left.
- (7a) I believe the explanation.
- (7b) I believe you.
- (7c) I believe that you didn't cheat.
- (7d) I believe in deep analysis.

Do we have strong intuitions about these? Can we articulate criteria
(operationalizable tests) for when to introduce (predicate-level) sense
distinctions? Closely related to these, we have scarcely attempted to
relate ERG predicates to external resources like VerbNet, FrameNet, or
WordNet. Of these, the latter seems least concerned with grammatical
contrasts, but what benefits could be obtained from spelling out such
relations?

- (8a) She heard me attempt to sing.
- (8b) She heard my attempt to sing.
- (8c) She heard my attempt at singing.
- (9a) \[I heard\] the choir perform the song.
- (9b) \[I heard\] the performance of the song by the choir.
- (9c) \[I heard\] the performance of the song.
- (9d) \[I heard\] the performance of the choir.

—For the unlikely event that the discussion runs out of steam, also
consider:

- \(10\) He was charged with public intoxication and resisting arrest.

<!-- -->


      (c / charge-05
       :ARG1 (h / he)
       :ARG2 (a / and
              :op1 (i / intoxicate-01
                    :ARG1 h
                    :location (p / public))
              :op2 (r / resist-01
                    :ARG0 h
                    :ARG1 (a2 / arrest-01
                           :ARG1 h))))

## Notes from scribe

=== Scribe: EmilyBender ===

oe: \[Goes through notes on the wiki\]

\(1\) How do we pick word senses for a linguistic precision grammar?

Dan: We don't put the fine-grained word-sense distinctions because of
worries about efficiency in parsing. But maybe a packed representation
would obviate that issue? Maybe some of our more informed cousins in the
room can inform us about that. But given that core design decision (from
1995 or so), is there a way to take advantage of WordNet or similar to
make that info available in a way consistent with our analyses. Hope to
work on this with Francis while he's in Seattle. Many of you in the room
have thought very hard about finer-grained sense for verbs, verb
classes, entailment, veracity. That's another place we haven't done
much, but that kind of enrichment is surely useful for many
applications. I have consoled myself with the notion that I'm just
building part of the solution, but no one's come through the door to do
the rest of the work. Our potential consumers typically whine about how
little we're giving them. We're in part looking for guidance on how to
round out the bigger black box that embeds our smaller black box and
guidance on how fancy those fine-grained sense distinctions ought to be.
Should we do the verb alternations? Should we not have a noun/verb
distinction in the lexicon, but let the grammar work it out or leave
things more underspecified in the meaning representation? For the sense
distinctions, I see WordNet as making way too many distinctions. I'm
grudgingly willing to accept that *text* should be used as a verb. How
do we find the right place to park on the slippery slope?

\(2\) What about that issue of packing everything into the lexicon and
just using better unpacking and stochastic models in parsing?

\(3\) Where do we find a convenient plateau on that slippery slope of
every more fine-grained sense distinctions?

Ping: A few years ago we worked on lexical resources like WordNet and we
do feel that WordNet senses are too fine-grained. I vaguely remember
some work by ?? who flattened that structure, arguing that WordNet has
too many levels, many of which are not familiar to ordinary users.

Annie: A project that was packing the WordNet senses in categories ---
does anyone remember it?

Francis: [OntoNotes](/OntoNotes)?

Annie: Yes that one.

Francis: Roberto Navigli is another one.

Alex: The virtue of the ERG is that it's domain independent. All it's
encoding is a form-meaning mapping that is not specific to a domain.
Anyone using the grammar has their own domain, and we can't anticipate
them. Yes, some of the senses are obscure, but people might want those
in some domain. Need to find out a way to make domain adaptation easy
--- taking the MRS and post-processing into a suitable representation
for their domain. Can't provide it, can only facilitate.

Dick: Couldn't agree more. Word-senses are always going to be relative
to a domain. Lots of birds in WordNet? Biologists are people. What
you're trying to do at that level is say there are some broad
distinctions that provide a good starting point for doing domain
adaptation, but you're never going to capture all word-sense
distinctions, because it's open-ended.

Valeria: Start with WordNet, it's useful, a good starting point. Do
multilingual, which will turn up distinctions that aren't obvious in
English, then try to use our friends in AI.

Dan: I'm impatient about those friends.

Valeria: They are doing lots of stuff on specific domains. Take a big
thing like WN and then create little modules for biologists, musicians,
lawyers… It's obvious that there's a generic model to start with.

oe: Is there consensus that we have two senses of word sense in this
discussion? PropBank/VerbNet (Ontonotes nowadays) which are more closely
tied to grammatical contrasts v. WordNet that isn't.

Valeria: Tracy and Dick tried collecting resources and putting them
together. Probably doesn't work, but better than starting from zero.

Dick: Back to oe's point about normalization. How much normalization do
you want to impose? Big difference between people working on formal
ontologies and those working on NL. Ontologists come in with a view that
language is inherently messy and unstructured. Not true, but also not
fully formalized. Ontologists want just one way of saying each thing,
but language clearly isn't like that. It really makes sense to normalize
dative alternation, passive. Looking at nominalization and
verbalization, maybe there's an argument to be made to put them all into
some underlying structure, but that's less clear. And there is a point
where you don't want to normalize everything, when you come to bits of
meaning that are contingent. *If you drop a vase, it will probably
break.* … don't want to get that info from normalization. I think part
of the issue is setting expectations for consumers. Don't bow to them
asking for only one way to say each thing. Need to say where to draw the
boundary.

Dan: One instance where we are mired with having to make some decision
is nominalization. *My attempt to solve that problem* v. *I attempted to
solve that problem*. Any commitment I should have in the lexicon to
connect the two predicates for *attempt*. What about
*destruction/destroy*. Do I want a *destroy* predicate inside
*destruction*.

Dick: Consider tools for allowing people to say that these two are the
same.

Dick/Alex: It will depend on the domain.

Dick: I've been trying to normalize, formalize -- what you actually want
to do is along the lines of natural language inference. You've got
structures for what the backend operations are, and for what's coming
out of language, and ask can I make some connection/match them together,
rather than normalizing one to the other.

oe: At the level of f-structures, to pick another framework, are you
concerned with sense distinctions?

Tracy: NO.

oe: Same PRED in all of the believe etc examples?

Tracy: Yes, unless it lemmatizes to something different.

oe: And you were working off of f-structure in a domain-independent
spirit, and now that's too ambitious?

Dick: Domain-independent is very useful, but it's not the end of the
story.

Alex: Make it easier for the consumer of the grammar to do the mappings
they want to do among words. Let them encode destroy/destruction
relationship and have the effect on reasoning that it should have. For
ex, take *teacher* --- *-er* is semi-productive, see *cooker* as not
necessarily someone who cooks.

Ping: It seems to be clear that word senses are domain senses, however,
when you consider each specific domain quite often it's hard for people
to agree --- difficult to make progress. In Boeing, we have problems
with definitions for *engine*. Trying to build nomenclature, three
groups: engine 1/engine 2, engine A/engine B, engine L/engine R. Spent
days and days and couldn't agree. Each engine is defined not just as an
engine itself, but also by its relations to other things. When we do
things like this, we have to have some backbone which includes the basic
senses of the words.

Alex: I would have thought that's exactly the argument against that ---
how is Dan going to adjudicate the disagreement at Boeing?

Tracy: The guys with 'engine L and R' were encoding a relationship. If
we build a toolkit that allows people encode entities and relationships
that that gives the \*solution architect\* what they need to be able to
build what they need.

Alex: That's what I'm arguing for --- an architecture to build these
things.

Ping: Yes -- we need a set of basic senses.

Emily: What do you mean by basic senses -- something that is not domain
specific?

Ping: Yes.

Glenn: Not just a problem with productivity of senses, but also of
relative prominence. Even if you had a complete list of senses, the
ranking would differ by domain.

Luis: Going back to what oe was trying to push back. Right now in the
ERG, there are senses distinguished by numbers in the sense field, but
unknown how that relates to ontologies in WordNet. \[…\] One of the
solutions can't be to put the 23 watches in the ERG. How would you
treebank? Are you prepared to underspecify some of the choices? You
right now don't underspecify the tree that you put in the treebank, but
that could be a choice. We probably have three or four senses of vase
that would break if you drop them, but not the fifth sense (something
very obscure that you probably don't care about unless you're in that
domain).

Dan: Clear that putting too much in the grammar forces us to decide
things early --- too hard to make a model that could do that.

oe: My paper example. There is a grammaticized contrast: *Linguists use
much paper in writing many papers.* In f-structure?

Tracy: One PRED, pass it over there.

oe: Mass/count encoded somehow in the f-structure?

Tracy: Only if something else (plural, determiners) mark it. Left a lot
of things underspecified.

Dick: Try to draw a semantic distinction from the grammatical one.
Assuming that it's the same property that applies to it, but with
different divisibility. I don't think that really … there's a lot of
differences in meaning that aren't really sense distinctions but are
more structurally imposed. If you're going for exhaustive parsing,
helpful to ask how the additional distinctions will change the shape of
the search space or the order in which you pull out preferred readings
from the search space. In LFG, didn't change the shape of search space
--- so don't mess up the grammar to deal with that.

oe: I think that's a paraphrase of my grammaticized contrast here. Did
you ever think, Dan, Tracy do your job here!

Dan: *I prefer paper.* v. *I prefer that paper.* --- clearly different
senses.

Alex: The individuation feature is all you need in this case. Someone
adapting to their domain and trying to do proper inference, that's all
they need to know. That's where you've got to be helpful. Make them more
transparent.

Emily: What would make them more transparent.

Alex: I don't know, a book.

Martin: If I talk about a paper that someone wrote, you might say "It
wasn't a paper, it was a chapter in a book." --- I'll say okay, but then
go back to calling it a paper.

Alex: I don't think it's Dan's job to work on public commitments to how
to describe things, not the job of a grammar to sort that out. What you
do need to provide is the aspect of meaning that comes from form --- all
those distinctions that a dialogue person like me needs from form. Milk
all the distinctions you can possibly milk out of the syntax, and no
more.

Annie: Paper and paper --- if we don't have a distinction in the LFG
grammar, we should. The more complicated cases are the ones like *book*
and *newspaper* where you have polysemy --- don't want to put it in the
grammar, there'd be no end to it, but you need this info for inferences.
*The newspaper is located on Main St* -- talking about the
company/building, etc. There the problem is something for the people
from AI who make ontologies, as Valeria was saying. Not particularly
well equipped to play the games ourselves.

Dick: We're trying to look at some kind of general level of
representation that consumers can use. There is something in between
grammar & domain level. Dick is working in that space, who does it for
DELPH-IN?

Alex: What Dick does is very useful, and you can't use MRS without
something like that.

Francis: I think I am the Dick Crouch equivalent to some extent. It's
the shirt. I agree with almost everything everyone has said, except of
course oe, who I think is confusing differences in sense with
differences in granularity. PropBank does make distinctions that aren't
syntactically driven. It does make sense distinctions based on e.g.
hypernym. Fillmore: It's not always a question of whether you want to
split or lump, sometimes some people are just splitting them wrong. I
think that's unfortunately still true of WordNet. WordNet is trying to
do something just as hard or harder than the ERG, without a Dan
equivalent --- not as well developed as the ERG. People are at least
becoming aware of these things. How do do domain extensions,
hierarchicalize fine/coarse distinctions, do clustering. One thing
that's missing if we're trying to link the WordNet to the ERG or LFG ---
WordNet doesn't give mass/count distinction for paper. There are known
things that fit together that perhaps the mapping is still incomplete.
There's still a scientific question we don't' know, again a granularity
thing --- when we talk about grammar does that include the parse ranking
model? If so, making a paper/paper distinction will reduce the
perplexity of model.

Emily: Paper/paper is the wrong example there.

Francis: My favorite example is hot dog/hot dog -- probably there's a
syntactic difference *very hot dog* isn't the one you eat. But almost no
one makes that distinction in the grammar (*hot dog* MWE required).

Guy: Seems that people are in agreement that there are domain-specific
sense distinctions. Use something like SEM-I to allow people to put
domain-specific things in as a DELPH-IN approved infrastructure for
doing so. Here's how you specify your own hierarchy of predicates.

Valeria: Don't you need the subcats?

Emily: That would be available, because the predicates in the SEM-I map
to ERG entries.

Glenn: Time to finish!

Last update: 2016-06-22 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/StanfordSenses/_edit)]{% endraw %}