{% raw %}# MRS modeling mini-symposium at UW 2012-11-28

## Participants

- FrancisBond
- [PrescottKlassen](/PrescottKlassen)
- ZinaPozen
- SanghounSong
- [SpencerRarricks](/SpencerRarricks)
- MichaelGoodman
- EmilyBender (scribe)
- GlennSlayden
- [WoodleyPackard](/WoodleyPackard)
- DanFlickinger (by Skype)

## Use cases

MWG: statistical transfer, using language model to select best outputs
for cohesive MRSness and filling in missing bits.

FCB: So parse ranking, where the parse doesn't come from a grammar, but
rather from (very noisy) transfer output. … MRS ranking. Possibly a
component of filtering MRS wellformedness as well.

WP: So like a black and white aspect: good MRS or not?

MWG: Probably do that separately, e.g., with UTool, saving LM for
semantic fluency.

WP: Purposes of this discussion, maybe more interested in fluency rather
than well-formedness.

FCB: Not just the fluency of what's been produced, but how to make
well-formed if not well-formed.

MWG: Most likely way to connect elements to make something that is
well-formed.

GS: Dan's point from a few months ago: Incomplete MRSs will still
sometimes be generatable-from. The generator will fill in what's
missing. Generator is robust to some kinds of underspecification, but
not others.

WP: Definitely not robust to mis-specification: e.g., gpreds that don't
exist, or handle-valued feature with individual variable. Cycle in qeqs.

ZP: Parse reranking, score that reflects semantic fluency. Mostly it's
about combining lexical and structural semantic information. Currently
extended the XML representation to add lexical semantics to augment
structure with first WN sense tagging and also gold tags when available.
WSD is also a use case. Assigning most likely semantic files for unknown
words.

WP: Coreference resolution --- another case of deciding which MRS is
best out of a set. Contemplating whether two different NPs are
coreferent, can construct something like an MRS with bits of the
description from both sides and see if that looks semantically fluent or
not.

    I have a brown dog.  It has yellow spots on it.
    I have a brown dog that has yellow spots. : Is this one fluent?
    I have a brown dog. It's yellow. : Is this one fluent?

FCB: Interested in all of those. In particular the current way we rank
the output of the transfer model is one of the weak points in the MT
chain, would like to improve. Beam-searchable even better. Also want to
improve parse ranking for monolingual grammars. Also WSD. One dream we
have is if we can link to lex semantics than doing things on slightly
abstract MRS: train on one language use on another.

DPF: Comparing student answer to teacher's answer. That answer from the
student qualifies as correct even if it's not the same as any answer we
wrote ahead of time. What counts as a paraphrase? There might be some
low-hanging fruit to go after there.

WP: Scores for similarity between two MRSs.

DPF: Yeah. A narrow variant of the transfer problem. Moving from a
constant vocabulary, but the teachers might put them together in more
complex ways than a student does. So wider variety of constructions
(teacher) to narrow range (student). Kind of like a transfer problem.

ZP: Interesting to know the information structure too, as part of the
model.

DPF: One thing I could feed into that experimentation is 6 million
(tokens) sentences have written against 400-500 exercises. 1000s of
exemplars for each exercise. Weed out repetitions, or count frequencies,
could be interesting data. Can't distribute publicly, but could be made
useable for research somehow (maybe).

FCB: Comparing across languages: cross-lingual
disambiguation/treebanking.

DPF: One sentence with the right tree. Target language someone has
provided the translation of that sentence with N readings in the
Japanese grammar. One of those will be a closer match than the others.

EMB: Two problems: (1) Given an MRS how much like language X does it
look? (2) Given two MRSs from different sources, how similar are they?

WP: If there were a notion of MRS subtraction, could use one to model
the other.

PK: Interested int he idea of being able to do MRS intersection. Which
parts of MRSs are similar between two in varying degrees of granularity.
Including meta types providing an abstraction on top of the MRS.

FCB: This has been popular over the years (Mike, Ann, Matteo), but no
nice solution yet. Would be nice to have it be done less in isolation.

GS: Is it a graph editing problem?

FCB: It's hard when looked at it that way. The more assumptions we can
make about things being closer the better.

EMB: What about statistical paraphrase (like SMT)? Does that provide
traction?

FCB: Still a hard problem, but maybe if you cut the search space to the
outputs for one input.

DPF: One way to reduce the complexity is to look at which parts of the
MRS are essential to the meaning of the sentence and ignore the others.
E.g., main clause arguments and modifiers, and ignore subordinate
clauses, and then recursively descend adding complexity. Might be able
to keep the problem more straightforward by looking at atomic clauses.
Use handle tree structure to cut larger problem into smaller parts.

EMB: For Prescott's use case, might help, but would want to be sure to
consider all clauses.

PK: Density -- clusters of meaning from a bunch of MRSs over a corpus.
Group via similarity to form clusters. Sort of like the summarization
task.

FCB: Do generalization on both sides: like what Zina's doing (also
generalize through the SEM-I) and compare at that level first, and then
do the more detailed comparison only if the first match succeeded.

GS: Looking at SVD or PCA to do that, if you know about the entities
that you are looking to compare. E.g., EDS.

## Moving on from use cases to things that you want to model.

MWP: Thinking of starting from EDS triples, and expanding to slightly
larger structures more components. EDS are predicate-arg-predicate. Want
to get also variable properties. Tense/aspect mapping would be
interesting in a bilingual setting. Maybe also some sense of idioms
where several EPs are involved. So far that's where I intend to differ
from what's been done before.

FCB: Concrete example?

MWP: Japanese/Chinese perfective sometimes goes to English past tense
and sometimes not. Other elements in the MRS might help determine.

SR: Did a preliminary experiment to convert MRS to DMRS and then assign
each of the triples (ep-role-ep) as a features and trained a maxent
model over them. Only used the hike corpus. Used for parse selection. No
automated evaluation, but impressionistically, seemed to work sometimes.

GS: Did get the maxent model built over DMRSs. And this is where Dan
recommended ignoring parts of the MRS that make it non-treelike?

SR: I don't think we were worrying about whether it was treelike or not.
We were thinking it would be interesting to see if tree-to-tree models
used in SMT could be used on treeified DMRSs.

WP: I've also played the game of training maxent models for the parse
disambiguation problem based not the same type of triples pulled out of
the MRS. Numbers were not encouraging. May have to do something more
interesting in order to get useful results, something like what Zina's
doing to back off to reduce data sparsity.

FCB: That's what we found too. There's still unexplored feature
engineering that could be done in that space, in addition to what Zina's
doing. Xiao Chang (sp?) at NTU is looking at this problem. Some stuff
that's already been done:

    I chased the cat and the dog. -> chase cat; chase dog
    I left it on the table. -> leave ON table, not leave ARG2 on, on ARG2 table

Way we model MWEs could be improved. Want to treat hotdog differently
from guard dog. Even without going to [WordNet](/WordNet) or back-off,
there's useful things that can be done.

WP: That's rethinking the size/shape of the chunks the model looks at.
Any one of these models is going to have to break the MRS up into
smaller chunks. You're talking about also baking the MRS a little bit.

FCB: We also want to grandparent --- going from triples to fipples.

WP: Data sparsity…

FCB: Every time someone's tried to to parse ranking based on MRS, need
to back off or data sparsity makes it not work. Same for parse ranking
on syntax: back off to POS from words. A group of things between 8 and
100 seems to be the right level of abstraction. The exciting thing (that
Zina has just shown again), even if the WSD isn't perfect, first sense
works (better!). Dependencies work better than CFGs for this. Andy tried
using the syntactic model, not an MRS model.

GS: Does the 8-100 number have cognitive implications about how humans
do this?

FCB: Prepared to go with this. But I was excited because not having to
have accurate WSD and still getting better parse ranking is exciting.
Katz, Fodor, Jackendoff claim that a small number of 8-12 things are
relevant (bits that count and those that don't). Would expect those to
be cross-lingual in a way that the lower level bits are not.

WP: 8-100 isn't just about data sparsity, even with more data more than
8-100 won't help much?

FCB: In Japan found that if we wanted to find the distinctions among
verb senses, need 2000 nodes in the noun hierarchy. But if you're just
doing the parse selection, then it's plausible that the higher levels
(8-100 categories) is better even with lots and lots of training data.
(Same in syntactic parse ranking: lexicalization only helps for
closed-class words.) Bad news for DELPH-IN is that named entities are
important. First pass: say that every name is a person.

SR: Does data sparsity matter less on the fipples because e.g., leave
and table are almost always going to have the same arcs between them.

WP: Probably not n<sup>5</sup> rather than n<sup>3</sup> but still much
more than n<sup>3</sup>.

ZP: There could be some kind of inference model: if you leave something
on something then it's lying there. Inject additional Eps.

GS: How are we differentiating todays topic from the idea of world
modeling in general? Obviously, there's a slippery slope there. How do
we make sure not to slide down?

FCB: Skiing is fun. You're looking at it the wrong way.

GS: Why do you not want to maintain a stage on which entities are
active; interpret every utterance in terms of what's on the stage.

PK: /Nods vigourously/

FCB: If you want to be 100% accurate, you need to do that. But even
people do some disambiguation without context and then fit it in to the
context.

GS: I don't think there's evidence that those two things happen as
separate steps, may be evidence that they happen at the same time.

FCB: Experiments showing that people's reading comprehension is better
with a title.

EMB: Just because we can do some disambiguation without context, doesn't
mean we don't use the context simultaneously when we have access to it.

ZP: We're never without context, you just use a larger stage?

GS: Then aren't we miring ourselves down by trying a harder problem?

EMB: Avoiding the problem of building the stage…

FCB: People who did this very seriously in the 1980s (incl IBM) went
down that slippery slope. IBM apparently kept doing it, but stopped
publishing about it.

GS: Cyc is not as impressive as they say.

FCB: A speculative comment: My feeling is that we don't have enough MWEs
by a factor of five. WN is currently 50% single words, 50% MWEs. If we
have all we need, it'll be 80% MWEs. There's a huge number of MWEs that
are part of your knowledge of language that are not part of the lexical
resources yet.

DPF: Definitely nodding vigorously about the need for MWEs. That's the
single thing I run into most frequently in [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) tree
banking. The most common problem is missing MWEs. There's no single
source to say what they should be. Easy to add, hard to find.

EMB: Whatever happened to the MWE workshops?

FCB: Not enough loop closing: those who find MWEs and those who parse
MWEs haven't quite met. Acquisition of MWEs outside of verb particle
constructions not at a high enough accuracy.

SS: Phrasal verbs, serial verbs?

FCB: Phrasal verbs was more of a success, extracted a lot and put them
in the ERG. What's our coverage?

DPF: verb+particle, verb+PP with specific P. ERG has 2,000-4,000,
missing about 20,000.

     Fell down -- V particle
     Look up the answer -- V particle NP or V NP particle
     Rely on Kim -- V PP with specific P

Problem is finding which ones are compositional v. idiosyncratic, and
then if idiosyncratic then which of those three categories it belongs
to. Even finding the first one syntactically, can't just look at the
string of words because there almost always a syntactic analysis with

FCB: Acquisition folks declared success and stopped, but not really
done.

SR: Can we parse and then look at MRS co-occurence for verb predicates
and P predicates.

WP: But then you get a list that's 76% accurate but no one wants to do
the detailed tests on each one.

FCB: Multilingual data can help … look+up translates to shiraberu.

ZP: Use dictionaries?

FCB: Every dictionary has about 2000 and there's about 20% overlap. If
you can convince Wikitionary to make the distinction you want, can get a
lot of pedantic people working on it. ("wikipedantic sourcing")

SR: If you have the list that's 76% correct, assume it's 100% correct
and threw in features for joined and unjoined EPs and let machine
learning sort it out?

FCB: Not very generalizeable --- so hard to publish. But yes, all of
these things should be farmed out in small chunks to people who are
prepared to do them.

GS: Before we can get the community to do anything the distinction has
to be sound.

WP/EMB: Well studied already.

GS: So what's it called? So why can't we get people to label them?

WP/ZP: Generate all the diagnostic sentences, put them on wikitionary,
and wait for people to delete the bad ones…

DPF: Halfway reliable syntactic information + statistical modeling might
lead to a solution that wasn't a possibility even recently.

EMB: Drifting from the topic?

FCB: Not necessarily: MWEs are something we don't take seriously enough
in our model. Partly because they are seen as not very generalizeable.
But they're still there.

WP: So how do you want the model to handle "color television"?

FCB: For most cases, a color TV is a TV so often doesn't matter. More
interested in hotdog than color TV.

DPF: Just got a note from Adam P. who has just secured a big grant from
the EU to work on cross-linguistic MWEs. There may be a new surge of
interest in MWEs at least in Europe (and on European languages). Connect
with that effort? Collaborate? Shape?

EMB: MWE identification can be a use case (find one's we're missing).
But are they also something to consider when we design our models so
that they are MWE-ready?

WP: Wouldn't you think that MWEs shouldn't look like multi-part things
in the MRS?

FCB: Good question! look\_v\_up\_rel, sure, but "rack one's brains"
seems like it might be one place, but in fact you can modify "brains"
and that doesn't' seem to be so far out into the word play realm. Need
somewhere to hang "tired" in "rack one's tired brains". Currently the
MRS identifies "rack one's brains" as a MWE, but keeps all the pieces.

SR: Use a special idiomatic rack, with arguments.

FCB/EMB: That's more or less how it is.

WP: Arguments about scoping aside, why do we care that your brain and
its tiredness are related to the racking?

ZP: Brains have to be tired at the same time as they're tired.

GS: I racked my brains until they were tired.

WP: Coreference back…

DPF: In this particular case the identity between the subject &
possessive is represented. We have maybe 10 of the 1000 such
constructions.

WP: I guess I'll eat my words.

FCB: I have a student who's added another 200 to the ERG.

EMB: Not yet with ICONS right?

FCB: Right.

FCB: There are ones where the thing in the brains position is less
modifiable, but many cases where the question of how much to keep/put in
the MRS (shadow arguments: I buttered my bread = I spread my bread with
butter) is underspecified. I buttered my bread with margarine != I
spread my bread with butter with margarine.

EMB: How does this effect how we're building the probabilistic models?

FCB: You don't think it will?

EMB: It will effect the size of the chunks we want to allow, but we
already want larger than triples.

SR: What about variable chunk size?

FCB: People who have done modeling over dependencies for MT do have
variable-sized chunks. Yeah, maybe we shouldn't be rigidly tying
ourselves to n-gram things.

WP: Do we want to be able to reassemble the chunks and assign a
meaningful probability to the whole?

FCB: Yes. Probably more interested in the sentence of the whole.

WP: Then need to think about how the model combines the chunks back
together, and if you get that right the size of the chunks might not
matter.

PK: Going back over the bridge to syntax, probabilistic set of syntactic
generation paths based on input & transfer?

EMB: Monolingual task like summarization or paraphrasing.

WP: Thinking about realization modeling rather than MRS modeling.

GS: DELPH-IN parsers/generators are closed analytical systems.

WP: Can also do as reranking…

WP: As far as statistical models for putting the pieces back together, I
don't' know how far we've gotten on that. Zina has maybe come the
furthest. Used something that was guaranteed to be correct off the shelf
(a language model). Creative idea.

ZP: Maxent might have worked as well, maybe even better.

WP: Getting counts of everything over wikiwoods was a probabilistic rats
nest that didn't tie itself back together .

ZP: Perplexity assigned to each part of each parse. Could be individual
EPs or … Could potentially try to disambiguate (WSD).

FCB: How to assign to individual Eps?

WP: You get a perplexity for each triple, right?

ZP: Right now calculate a joint perplexity.

WP: For a specific EP, only the triples related to that EP.

ZP: Normalized by the number of words.

WP: Compute the perplexity on each individual triple and then take the
geometric mean.

FCB: Using SRILM was a good idea. Many people have been looking at these
problems.

WP: I was curious whether the LM that Zina's using can come up with a
probability for the whole sentence.

ZP: Yes --- get one, but not using it right now.

GS: Probability of a sentence in what context?

WP: As a generative model over all MRSs.

FCB: In theory, the probability of this reading of this sentence given
all of English.

WP: What you get out of a language model that way is the probability of
this whole collection of triples, but the way you put the chunks
together should influence it: some parts of a sentence would be
represented multiple times while the other parts aren't. SF associated
with the verb will show up once for each argument, but each argument
only once, but with a different part of the rest of the triple.

ZP: The model is not sparse, so it doesn't back off to bigrams.

SR: So you may end up underweighting the leaf nodes.

WP: That's what I was worried about.

ZP: Doesn't seem to be a problem.

FCB: Must happen.

WP: P(give) factored in there more than P(dog) or P(bone) or
P(computer).

FCB: It's possible that that's a good thing.

ZP: The thing we want to score is the EP with PRED give, which has all
of those.

WP: There's probably a way (probably non-trivial) to appropriately
distribute the probabilities.

SR: All of these triples contain the probability

WP: I'm probably wrong but I want to understand:

    P(give ARG1 dog) *
    P(give ARG2 bone) *
    P(give ARG3 man)

appears to be predicting 'give' three times. Seems like what you want to
do is:

    P(give) *
    P(ARG1 dog | give) *
    P(ARG2 bone | give) *
    P(ARG3 man | give)

PK: Relevant that give has participated in three triples.

ZP: The fact that give has an ARG3 is interesting.

… discussion of in what sense these are trigrams and how P(give ARG1
dog) is actually calculated.

SR: The same algorithm that works for a string might not work on the
MRS, because the MRS is a dag, not a string with inherent order.

WP: SRILM is calculating the average probability of the triples: how
good do these triples look? This not the same thing as how good the MRS
they came from is.

PK: In a triples-based representation of anything, identity is
important. Clumps/gathers triples together.

WP: There are random variables that have names, and these are the values
of the random variables. If we gave the random variables names, some of
the mist would dissipate.

FCB: If we give the triples in a different order, would it have a
different score?

WP: Changing the order within the triple or order of triples?

FCB: Within a triple.

WP: That depends on whether it's treating these as joint or conditional
probabilities.

PK/ZP: Could show all different permutations if doing different
conditions. e.g. P(ARG1\|head = give, dependent = dog).

ZP: Right now these are joint, and decomposed into bigrams (also joint).

EMB: Do we care about the probability of just give?

FCB/WP: a parse with give and one with give up, then we care.

SR: Does the probability of give need to be conditioned on all of the
args?

WP: Assuming that all MRSs have this shape:

SR:

    P(give | ARG1=dog, ARG2=bone, ARG3= man) *
    P(ARG1 = dog, ARG2 = bone, ARG3 = man)

SR: Seems tricky to have a generative model to capture all the info
that's needed without counting something more than once.

WP: If we don't know what the graph looks like ahead of time, then it
will get harder.

ZP: Never interested in the absolutely probabilities, but interested in
comparing things.

GS: But even the things you are comparing are going to have different
shapes.

WP: Probabilities are good to use if we can, but maybe other scores are
better.

SR: Discriminitive models are easier because you can just throw
everything in.

WP: Training a discriminative model on a lot of data (like
[WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods) lot of data) is going to be tricky.

SR: My experience is that maxent scales pretty well.

GS: Bing translator's LM is maxent, took overnight to train.

WP: Probably on lots and lots of compute nodes.

... discussion continued informally, but note-taking stopped.

## Related Work

\[Additions welcome\]

- Stephan Oepen, Erik Velldal, Jan Tore Lønning, Paul Meurer, Victoria
Rosén, and Dan Flickinger. Towards hybrid quality-oriented machine
translation. On linguistics and probabilities in MT. In Proceedings
of the 10th International Conference on Theoretical and
Methodological Issues in Machine Translation, Skövde, Sweden, 2007.
- E. Velldal. Empirical Realization Ranking Ph.D. thesis, Department
of Informatics, University of Oslo Oslo, Norway, 2008

Last update: 2020-07-17 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/RmrsLm/_edit)]{% endraw %}