{% raw %}# Discussion Notes from Maintenance, Sharing, and Re-Use of Resources: Lexica, Test Suites, and Others (Stanford Summit 2016)

(see [slides](http://www.delph-in.net/2016/sharing.pdf) for intro)

Tracy: For the big LFG lexicons, information for open class items was
collected from everywhere and munged. Lexica for closed class items were
made carefully by hand. Take from everywhere you can.

Emily: Has anyone connected LFG to WordNet etc?

Tracy: Does (PARC?) license include semantics?

Dick: Not sure?

Annie: includes propositions(scribe mishearing?) VerbNet is doing what
we were doing years ago.

Francis: Munging is improving, could submit improvements back.

Annie: Students developing VerbNet have little connection to users,
social problems getting corrections in.

Tracy: We borrowed from finite state morphology project(s?), some
licensed, some available, see if you can get them, because morphology is
a distinct problem. At least get lemma. Lots of work in morphology. Can
use for bootstrapping. The HP test suite was awesome, thanks!

Dan: You've had experience absorbing large dictionaries. Are there right
and wrong ways to do that?

Glenn: I took lemmas from thai-language.com using annotated POS. A
disaster. Went back to supervised, with corpora, using freq to direct
efforts.

Tracy: We cared about verbs and subcat, knowing shape in advance was
very helpful.

Glenn: if I don't have the POS, I use place holders, fill in later

Dan: How to do unknown word mechanism when importing external resources?
I will be exhaustive for any lemma, so I don't get unknown words if I
have any form. Big resource won't be exhaustive. How to balance? How to
navigate? How to manage distrust?

Alex L: Trusted POS more than lexicon. Use unknown word handling, if
lemma wasn't in lexicon with the tagged POS. Increased coverage on
PubMed from 2%-80%. Not sure on quality.

Melanie: We imported for Jacy, not much damage. POS problem varies by
language. English has this problem more because words have more than one
class.

Francis: Hard for Jacy, Indra etc. We don't know the POS. Import high
freq. We have a long tail of hidden stuff, ala Dan above. We should try
Alex's approach. Target by phenomena we have just figured out. That is
easier.

Luis: Do you trust tagger over lexicon or in addition? Addition could
depend on parse selection model.

Alex L: We weren't doing parse selection, so didn't matter. But you
won't have full model.

Dan: I don't trust the POS tagger. Engine is stupider than my parser. So
"long-eared" comes up as verb, shouldn't be.

Alex L: Add, not block. But model is still the issue

Stephan: re: unified lexicon paper by Tracy and Dick, combining
[WordNet](/WordNet) and other resources to LFG syntactic lexicon for KR.
Some of these resources now publicly available. Any hope of getting the
LFG lexicon now?

Tracy: Ask Ron. It was protected. License (I think) is research-only.

Stephan: Which resource were useful for KR?

Dick: cyc wasn't. Too limited. VerbNet was useful.

Annie: It had roles, but they weren't correct when looking in detail.

Dick: But useful to find alternations.

Annie: [VerbNet](/VerbNet) was class specific, not cross class.

Stephan: idea of unified lexicon initiative, connecting different
syntactic lexica to as many resources as we can.

Valeria: sumo rather than cyc? ontology directed towards language.
Linguistic linked open data - they are working hard, must be something
useful. Some things you don't share, even with friends.

Tracy: keep in mind, English was best case. Resources in other languages
were not so prevalent.

Berthold: lex acquisition from Yi. what's the state?

Francis: very little, because languages are annoying different

Dan: that work was about focussing manual work to what we need. Asked
BNC for frequent verbs. Manually added with the right subcat.

Berthold: So the statistical stuff in the paper was not what you used

Dan: It helped direct... but lots of manual linguist's intuition. Used
the exemplar sentences from BNC

Francis: Lexicon building more delegateable than grammar engineering.
Showing LTDB. Used grad students, given LTDB, to classify verbs. Use
(Chinese) PTB to get subcat. Faster to accumulate, still need human
intervention. Not high tech: KWIC etc.

Tracy: Even shallow TBs can give us the lists.

Dan: Any IP concerns?

Tracy/Francis: Not for deriving lists

Francis: I want lists of things like scissors, trousers from ERG. Use
example sentence to get type, then use LTDB. Language enthusiasts make
lists like this sometimes. We can use this. re: license issues. We don't
want to steal. We like reciprocity. More sharing now than 20 years ago.

Glenn: Sumo is GPL

Francis: Links to WN are not, by our request.

Last update: 2016-06-27 by RebeccaDridan [[edit](https://github.com/delph-in/docs/wiki/StanfordResourceSharing/_edit)]{% endraw %}