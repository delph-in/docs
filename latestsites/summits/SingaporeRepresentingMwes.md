{% raw %}Francis: \[Presents from slides, which can be found from
[SingaporeSchedule](https://delph-in.github.io/docs/summits/SingaporeSchedule)\]

Emily: \[Expresses skepticism about program of finding
[WordNet](/WordNet) senses of components of idioms.\]

Francis: It turns out to be not that hard.

Emily: Did you measure IAA?

Francis: No.

Guy: If the metaphor is clear, maybe not so hard.

Francis: What we used this for is finding variants of the
idiom---looking for other words in the same synsets as the components.

Emily: id\_rel replaced with ICONS?

Dan: Yes, already in trunk.

Francis: *You wear your heart on your sleeve, and your face.*

Hans: Not both idioms?

Emily/Francis: *Wear your heart on your face* is not an established
idiom.

Woodley: Isn't everything you need in the paraphrased MRS in this case,
if *and your face* connects the right way to *express emotions (too
readily)*?

Francis: I don't think it's an accident that there's some syntactic
parallelism here.

Emily: You've got one example.

Francis: I have others. Also: internal modification of idioms. *Don't
loose your tiny mind.*

Hans: *He lost his heart and his last chance to stay single.*

Francis: *He nailed his colors to the mast.* meaning: to show a position
you won't back down from, to show real intentions. Hard to paraphrase in
a structure-preserving way.

Woodley: Is this an established idiom?

Francis/Dan: Yes, but not in Dan's dialect.

Dan: There are 10s of thousands of these, and not realistic that any
native speaker would know all of them, especially across dialects.

Emily: So the point here is to support the disjunctive MRS, which is
more complicated than the original two-layer idea.

Francis: We paraphrase this to: *You show your emotions too readily and
your face.* Can you find a better one?

Hans: These ones that have to do with emotions won't be paraphrasable
that way, because the signaling verb is really talking about emotional
states/changes.

Emily: Convince me this is not just zeugma. If you've got 5 examples
like this, how is it not just that people are playing with the language?

Francis: So we shouldn't deal with this?

Emily: Not treat it as a core thing to build the grammar around.

Dan: It's a backing down. Real zeugma examples are like: *I drive my
brother crazy and my mom to the grocery store.* Not going to get that.

Francis: So we're going to give up on *Spill the official beans*?

Emily: No, I think those ones are more compelling. But how do they
relate to the conjunctive MRS idea?

Guy: Methodological question---just because we can't think of a
paraphrase, does that really mean they aren't decomposable?

Francis: Between we couldn't and it's impossible, there's a gulf.
\[phone rings\]

Dan: My feeling is that there's the useful attempt to encompass
everything we might say, but there's also some use in a scientific
exercise to back off from the entirety of the cliff face, while keeping
note of the utterance types that we know we aren't handling yet. But to
spend a lot of time really expanding the representational power in ways
we don't quite understand feels like a really ambitious program.

Francis. Yes. It's also the same thing we want to do for the simple MRS
things like proper names as single strings, also paraphrasing
*Universities of Washington and Delaware* to *University of Washington
and University of Delaware*. Also theoretically interesting, even if not
immediately implementable. Have played some with pyDelphin; also talked
with Ann about her packed DMRS representation. Would be a lot of work to
do properly, possibly for little gain.

Tuan Anh: Imagine that you are a human translator who had to translate
this sentence. Would need to do some inference. The target language
might not have an equivalent sentence. Would write down paraphrase and
then put a footnote to explain the paraphrase. Take the part that you
recognize as an idiom, give the literal meaning in the footnote. Imagine
that you don't have access to the source language and you have this info
that would help the human translator.

Hans: In translation you have to distinguish between what a literary
translator would do and what MT should do. MT is not yet ready to notice
and translate metaphors. We're more at the transcoder/interpreter stage.
The ideal would be to do more constructive work, but for now we'd be
happy to get the two things apart and somehow mapped over.

Tuan Anh: The idea is to have the machine providing what info it can to
help a human translator.

Francis: Like what people do translating an unknown food name. E.g. que
chao (footnote: a kind of noodle).

Francis: \[Goes back to slides.\] Christiane Fellbaum has made the claim
for German that for many idioms you get variants based on the literal
meaning *Wear your heart on your collar*, *Wear your heart on your
trouser leg.* That would be evidence that we know about the literal
meaning and using it. Found no examples of variation of idioms of the
type X\_np V\_1 X\_np's N\_1 in the first 5% of the BNC not already in
the lexicon. Could be that we would find some if we expanded more
hypernyms. If it was very common, we would have found some.

Emily: I'd like to know more about how the conjunctive packed MRSs help
with the modification cases.

Francis: If it's a non-decomposable idiom, then the thing being modified
might not exist anymore.

Emily: Examples?

Dan: In the Sag, Wasow, Numberg language paper. Something like *That
cowboy finally bit the Texan dust.* meaning dies in Texas.

\[...\]

Emily: *make one's unsteady way* could be *go unsteadily*

Francis: My intuition suggests there are two kinds: external
modification (actually modifying the whole event, like here) and the
cases where you get modification of a piece that's gone *He twiddles his
clumsy thumbs.* meaning he's idle and clumsy.

Dan: *He twiddles his teenage thumbs.*

Francis: Maybe what we want is to say there's some connection between
teenage and you figure it out.

Francis: Don't have the data yet --- mining the BNC.

Zhenzhen: Would a professional translator be able to translate these
easily.

Francis: Able to yes, easily no.

Zhenzhen: Very hard to fit the meaning of the idiom and the humorous
both into the same sentence.

Francis/Dan: Or add another sentence.

Zhenzhen: So isn't this too hard for a machine?

Francis: Not something we're doing to solve tomorrow, also not the most
pressing problem.

Dan: Would be nice to design a methodology that could be pushed into
ever harder cases.

Francis: Just getting these right without the humorous is currently
impossible for existing MT systems. So solving that is already a big
step forward.

Francis: If you are translating to a language with a similar idiom in
the same pattern, you would lose the ability to find the corresponding
thing in the output language. Don't always want to paraphrase, but how
do you know when?

Emily: But keeping both layers separate would be enough there, right?

Woodley: It's possible to through a packed MRS into the generate and
have it try both.

Emily: Backing up a bit: The idea that professional translators would
use to sentences sounds a lot like paraphrase and then say there's
something teenage about this, you figure it out.

Guy: Do we have tests for decomposability besides the existence of
paraphrases?

Nurit: Syntactic reflexes: non-decomposable ones will have less
variation syntactically.

Francis: There are claims in the linguistic literature, but when we test
them we find them not to be true.

Nurit: I sympathize with the question, since it seems like
decomposability is a test of your imagination. Makes sense in terms of
MT because you want to paraphrase in order to translate. But more
theoretically, there should be some kind of indication/test, more than
just whether you have enough imagination to think of a paraphrase.

Francis: Questions of internal/external modification, syntactic change
... those are other things it would be nice to look at. Hopefully this
corpus study will help get the data to look at that. For now matching
very flexibly, even if it means we hit literal ones.

Hans: I once was invited to give a talk at the meeting of the literary
translators of Germany. I had fun with a very clever and analytical ways
they translated certain phrases with only three or four days of work for
the phrase. I showed them MT and they were happy because they knew they
weren't out of a job anytime soon. What are the difficult things if we
really try very hard in MT to preserve those. Example: Journalists very
often tag on additional descriptions to people like *the clumsy thumbs*,
*the 24-year-old* but they are not assertions, but presuppositions. If
we make those into additional separate sentences, we make them
assertions. Need to be careful we don't spoil things by creating new
mistakes; may be better to leave them out.

Last update: 2015-08-10 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SingaporeRepresentingMwes/_edit)]{% endraw %}