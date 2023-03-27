{% raw %}Robustness discussion

Top level goal driven by Birds of a Feather meeting where we asked for
advice on annotations we could put into the parsed data to make them
useful for other people. In addition to advice on format, got the
message that they want full coverage.

We've put off robust processing with our tools for a while (exception
DeepThough/HoG deep/shallow integration), but now we are in a position
to do something more about it, for several happy reasons:

- Much more data
- ... enabling work's like Yi's on PCFG extraction

HPSG-derived PCFG approach allows us to say something about any input
and to say it at a relatively deep level. Even if that analysis couldn't
be produced by the deep grammar, parts of it could, and it might even be
possible to replay the semantic part without worrying about the syntax.
Since the semantics doesn't usually rule out any sentences, it may be
possible to arrive at an MRS which is not very far from wonderful for
sentences that couldn't have been parsed (yet) by the deep grammar
itself. Mismatches might be predicted to mostly be sortal mismatches
(between argument positions and the variables filling them). Others
(those way outside the scope of the grammar) might be more amusing.

--&gt; Can export at least semantic information and also a lot of
syntactic information (e.g., detailed structures for NPs, even if the
whole sentence didn't parse), as well as good POS tags.

Things to talk about today:

- portability of Yi's work to other grammars/languages
- other approaches
  - grammar-internal robustness rules (and how to disambiguate)
- ways of using the resources to produce robust outputs

Dan to Yi: Is anything in your work ERG-specific?

Yi: Knowledge about which rules are morphological rules, which are
punctuation, but it's an unlexicalized PCFG grammar. Eventual
performance could vary a lot depending on how much morphology,
strictness of word order, how many unary rules the grammar has, ... from
language to language/grammar to grammar. But the mechanism should be
able to do its thing.

Dan: n-ary rules okay, or do they have to be binarized?

Yi: Just fine. Can also run on PTB.

Dan: To review: Have to be able to distinguish syntactic from lexical
rule

Yi: that's optional, a parameter to play with while looking for better
PCFG approximation, with implications to how close it is to the results
that the deep grammar would give. Might be some trial and error when
moving to a new grammar. But seems like a rather small amount of fine
tuning to do.

Francis: Syntactic v. lexical rules hard coded (and thus apparent) in
the grammar.

Dan: Not so for the lexical v. punctuation distinction.

Dan: I've also adopted naming convention for rules (syntactic and
lexical) and within the lex rules differentiating on various dimensions.
Not a perfect solution either, but I think it's all recoverable. Worst
case: could produce file of declarations to be used by the PCFG
machinery.

Dan: How much training data would be required to get the magic to start
working? 1,000 sentences treebanked, does something happen?

Yi: Because this is an approximation approach, don't necessarily need
treebanked data. Treebank gives better performance, but can work with
large amount of unannotated data. Supervised only by the grammar.

Dan: But how much hand annotated data is needed to even make the
machinery run (separate from the quality of the output)? Mechanically
would it work?

Yi: It would always finish.

Francis: If it sees a lex type it's never seen before?

Yi: I'm actually predicting lex types for the words. Unknown words only
predicted from lex types.

Yi: With a grammar like ERG (fine-grained lex types), without any
decoration, 2000-3000 gives decent full-coverage CFG. With one level of
grandparenting need more.

Dan/Yi: Can never have too much annotated data, but maybe some grammars
with treebanks would start experimenting soon ...?

Stephan: I feel a growing urge to spoil the party; worried about the
message we might be giving. For the ERG with its substantial treebanks
and good parse selection models and broad grammatical coverage on
running text, we have yet to determine that this approach actually gives
us pseudo-derivations that contain a large proportion of valid
structures. And we have yet to build a mechanism that extracts semantics
from those structures. I'm not sure I would recommend playing in this
space to other grammarians at this point.

Yi: I would also not recommend experimenting with a medium sized grammar
at this point. Want to work on extracting/evaluating semantic
information from ERG pseudo-derivations and to try with Jacy. For
smaller grammars, maybe in a year's time.

Francis: Maybe for medium or smaller grammars, the most important thing
for robustness would be the unknown word handling mechanism.

Francis: \[Show of hands\] Some but not all of the grammars under
development have unknown word handling, and there's not that much
documentation of how to go about putting it in.

Francis: The idea of producing MRSs without unifying the rest of it is
very exciting. When will that be testable?

Dan: We only did the thought experiment yesterday, and are not yet
confident that it will actually work that way. There might be enough
interaction to be able to create semantics by only unifying semantics.
e.g., "The dog see the cat" wouldn't unify even in the semantics.
Depending on morphosyntax of agreement properties might not work.

Emily: What about linking?

Dan: Get me every path that has CONT in its name (e.g.,
SYNSEM.LOCAL.VAL.SUBJ.FIRST.LOCAL.CONT.HOOK.INDEX) and then use those.
Grabbing the index only and not worrying about the semantics. But there
still may be too much influence of syntax on semantics (as is typical in
HPSG sign architecture)

Emily: And extraposed relative clauses?

Dan: "A book arrived yesterday that I wanted to read". Presumably the
PCFG will find a creative way to put that together, probably a binary
rule that combines the relative clause with something and it will do a
thing.

Emily: In that case certainly not the right thing.

Dan: \[Wishful thinking about the PCFG coming up with beautiful analyses
which can then be ported into the grammar....\]

Francis: MT: If we were getting slightly wrong things from Jacy can
still get reasonably close translations in some cases. NTT getting
correct first parse in &lt; 30% of sentences, but a correct translation
in 60% of sentences, because of ambiguities that carried across or just
didn't make a difference. That might be a nice case of where this kind
of thing could be useful. Another: the speech lattice thing, where the
PCFG might help get the right path through the lattice.

Dan: It all depends on whether we succeed in creating a semantic
representation out of the PCFG output, and there may be unknown
obstacles to that.

Dan: Imagine we take the deep grammar and parse 100,000 sentences just
one parse only, and have student vet the trees (reasonable/not
reasonable). Say she discards half of them as nonsense. Could we use
that lightweight approach using those kind of reasonable trees. Parse in
500 best, store the trees but keep the original one best as the target
in training the PCFG. Could that kind of rough and ready data be
suitable input for the PCFG training? The particular student working on
this at Stanford can do this 10-15x faster than selecting discriminants.

Yi: The only potential risk there is data skew if annotator is
consistently rejecting some particular phenomenon, that phenomenon won't
be represented in the treebank.

Dan: But even if we were doing careful treebanking the only right answer
is reject the trees in these same cases. Annotator is trained in the
grammar and can quickly reject sentences based on known patterns (e.g.,
extraposed relatives) but also can quickly notice silly structures that
the statistical model sometimes chooses.

Yi: If the purpose of this treebank is training for new PCFG
approximations?

Dan: Or as bootstrapping for parse selection.

Dan: If there are phenomena with low frequency that are important when
they occur. E.g., dialogues infrequent in the training data, so
vocatives are low frequency. Won't find many vocatives in 50,000
sentences of Wikipedia. If I parse any children's book 5/8 sentences
will have proper name at beginning or end of a sentence. Goal would be
to give the statistical model a few examples of that rule in action.

Yi: A bit like active learning...

Dan: But not trying to be clever about which sentences asking the human
for, just asking to look at a lot without requiring them to be exact
with the annotation. It would of course then be interesting to do
systematic comparison of the resulting model to see the relative
importance of mass v. precision.

Stephan: "Cheaply supervised self-training" We don't have much
experience with self-training.

Rebecca: Andy's done some recently.

Stephan: Take a little gold in-domain data, parse a large amount of
in-domain data and rank based on the small model, and then train on that
model. Andy found small amount of improvement. You're suggesting a
moderate amount of effort to quality control the self-training data.
Interesting trade-offs between value of data and cost of manual effort.
Scientifically sounds interesting, but maybe better to try self-training
more before investing manual effort. Something to quantify without doing
that experiment is how much the quality of the parse selection model
affect the result of PCFG. Maybe produce a [WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods) with
something less than our best parse selection model.

Stephan: What's less attractive than lead?

Woodley: Dirt.

Yi: Even with the dirt one, the massive number of observations is still
going to at least tell you a lot about the lexical statistics, which is
where the information is most sparse. So I expect the model to be less
accurate, but it could be interesting to actually measure that
difference.

Stephan: Would potentially be happy to produce a dirt version of
[WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods) for this purpose.

Emily: How does one evaluate

Yi: Parse-eval score on the derivation tree of the HPSG grammar. When we
can do robust MRS extraction from these derivation trees, need to do
evaluations on the MRSs --- both intrinsic (EDM) and extrinsic (in
applications like DARE).

Stephan: That requires gold standards for the sentences, so how to
evaluate the results on sentences that the deep grammar can't parse in
the first place. Suggests writing MRSs by hand.

Yi: What about correcting MRSs? (as an evaluation, but also as a gold
standard creation - EB)

Dan: That would be more entertaining (and illuminating). Could also take
large MRSs and edit out the hopeless cases. Also could paraphrase to get
what the MRS should have been (e.g., putting extraposed relatives back)
to get the target MRSs for sentences that we're not parsing.

Dan: What about that third topic, namely the consumption side. Are there
applications or experiments that some of you have been doing that suffer
from the lack of completeness over a given data set. Coref resolution
would likely be one of those.

Stephan: Well.......

Woodley: If every 4th sentence is missing, then you frequently have
cases where the anaphor or the antecedent just is not there and you end
up connecting to something else.

Stephan: But. I wonder whether we are collectively getting too
self-deprecating about what we actually do and are good at. Being
criticized for declining to say something about some subset of inputs.
Coref resolution systems can easily run multiple parsers (among the many
processing steps that they typically invoke). Nothing would stop you
from trying to parse but also at the same time running a "professional"
tool.

Woodley: Did he say we were being too self-deprecating?

Stephan: It remains to be determined whether we can provide more useful
information in robust mode than what other natively robust parsers can
produce for those inputs?

Dan: How do we determine that?

Stephan: Could demonstrate in a task: e.g., deep parsing + robust deep
parsing for coref resolution v. deep parsing + treebank parsing for
same.

Dan: To do that experiment, we need something that fits in the robust
deep parsing slot. That's what we're looking for.

Stephan: Just like in MT where it can be very beneficial for someone to
translate 20% of something with higher quality, the same may be true in
coref resolution.

Rebecca: The biggest difference there is that MT doesn't have the same
sequential nature as coref.

Woodley: If a component is looking for our output and we drop in and
out...

Stephan: Assuming the components of coref system look at the output of
several parsers.

Francis: Because we don't have a 100% coverage parser.

Francis: Two sorts of applications were more full coverage would have
been useful:

- Ontology extraction from machine readable dictionary (looking for
ISA relationships, missing steps in hierarchy is bad)
- Grant applications.

Fall back was [DeepThought](/DeepThought)

Dan: We're never going to build a perfect engine. This is robust for a
reason.

Francis: These are the kind of places where if we got a little of
something wrong in the parse, it would still be okay.

Woodley: We already get a little of something wrong in most sentences.

Dan: For ontology building, what's the cost if you don't get anything?

Francis: 10-20% drop in between nothing and shallow POS information in
ontology.

Francis: Grant applications: If I have to start by saying "We have a
parser that has 80% coverage" that hurt all the time, where 97 or 99.9
would make a difference.

Yi: I don't think we need to advertise the coverage. XLE doesn't. XLE
has fallback strategy.

Dan: Typically the way we configure our systems without these additional
components, we simply return no answer.

Francis: If I was getting some MRS for every input, even if 30% were
marked as not useful, would be better for grant applications.

Stephan/Francis: Experience with robust outputs from XLE suggests a
distinction is needed between 'full' coverage vs. robust 'coverage'
(robust analyses found substantially less useful in LOGON effort).

Emily: Good enough to say deep parses on 80% and robust parses on the
other 20%?

Francis: Grant application says semantic representation for 100% of
inputs in grant applications, and 80% number in more detailed papers.

Stephan: Can already claim that on the basis of PET a mode that gives
RMRS for anything.

Francis: Okay, but my MT application needs MRS, not RMRS.

Stephan: Re: Alternate approach of adding robustness rules to the
grammar. Bart adds rules to the grammar that are liberal about combining
things but not entirely unconstrained and then does a round of training
on different sets of those rules. Enlarges the search space and needs to
be combined with chart pruning and also fragment parsing. Greatly
increased recall at some cost to precision. F-score improvement was
good.

Dan: Why a hit in precision, compared to doing nothing?

Francis: Changes the denominator.

Stephan: That machinery is available in PET, the thesis is published.
That too is a tool searching for more grammarians to put it to use.

Dan: Can it be adapted to DELPH-IN grammars?

Stephan: Yes.

Yi: The actual mechanism in the processing step is the chart pruning.
Whatever you write in robustness rule, it should work.

Dan: So I could write a rule that says combine a sentence with any
constituent...

Yi: Can turn on the chart pruning and that will still get you good
analyses. He also has constraints like every sentence can use only one
robustness rule.

Dan: Could be part of the same larger story:

1. Precision grammar
2. Robustness measures that are grammar-internal
3. PCFG approximation for the rest

and then measure the benefits in terms of precision and recall. If it
were in a pipeline mode would that damage

Stephan: Bart does not add a dependency when he combines with things
robustly. PCFG + robust semantics would put a dependency between them,
so there would be a difference in the outputs depending on relative
contribution of each.

Emily: Grammarian could try to write robustness rules with dependencies,
and still use chart pruning, right?

Dan: Could put in two place desperation\_rel if nothing else.

Stephan: Wouldn't help in recall and would hurt in precision, so Bart
didn't do it.

Prescott: Are there any plans to continue to explore RASP-based RMRS as
in HoG, e.g., RASP conversion updates or another parser.

Dan: If anything discouraged by Uli Schafer's experience finding that
the RASP conversion wasn't useful enough to keep maintaining in DARE.

Dan: Experience of trying to compare dependencies output by various
parsers in EMNLP paper ... painful. Elegant magic by Yi to make it
possible to even cherry pick and compare easy things to identify. So I
don't hold out hope for something that takes full dependency structures
from multiple systems and integrates them. Clark and Curran and others
put lots of time trying to creating mapping into a static resource.
Merging of two deep engines seems too difficult. Yi, can you say
anything more encouraging?

Yi: Conversion is difficult, and what you might expect to gain from it
can already be lost in the process.

Dan: There is an expressed interest in cross-platform comparison that
might lead to shared output formats initially for evaluation but
eventually could lead to using multiple systems as inputs. Not sure if
the pull of that will be enough to get people to arrive at the
standardized outputs.

Stephan: Concretely, RMRS was in fashion 10 years ago; Ann may have
moved on. I see little reason to expect that people outside DELPH-IN
will adopt RMRS as the common interface language. That makes it easier
for us to continue doing MRS or possibly a dependency simplification of
MRS because those are better tuned to what we actually do in the
grammars. RMRS was an attempt to reach out, putting everything in atomic
pieces to allow for radical underspecification that we don't usually
need in the deep grammars. The buzz now is in dependency-like
representations; the beauty of DMRS is that it accomplishes something
dependency-like without throwing away information that we believe we
care about (scopal relations).

Prescott: DMRS is used in DARE and TAKE?

Yi: Used in TAKE and a little bit in DARE. As consumers, they do find
that DMRS is closer to their needs within the application.

Prescott: Does PET emit it?

Yi: Currently the only MRS to DMRS conversion code is in Lisp. Cf. MRS
library discussion.

Dan: Strong desire to include DMRS conversion in a component that can be
combined with PET. One strategy is with encapsulated Lisp code. I expect
vigorous investigation of that in the next year or so.

Glenn: Does it currently run in ECL in PET?

Stephan: Yes. Embedding ECL with PET is deprecated, but currently works.
It's possible that DMRS is not exposed in terms of the user interface,
but the elementary dependencies (dependency simplification w/o scope)
is. DMRS adds the additional info that makes it possible to go back to
an MRS. ECL embedding we want to get rid of --- won't be in future
precompiled binaries or in trunk. MRS library in current LKB code base,
always been supported as a stand-alone component. There are build
instructions for creating a standalone binary with SBCL -- an MRS
manipulator. Given MRSs in a format it can read, will do equivalence
tests, RMRS and DMRS conversion, a couple of other things.

Emily: What about Enju --- not close enough to be used in committee with
say ERG?

Yi: Their PAS output is close to our MRS representation, but don't have
scope info in the first place.

Stephan: Have to talk about details: They have one predicate per word.
In that sense they are further removed from semantics than we are.

Last update: 2011-06-29 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/SuquamishRobustParsing/_edit)]{% endraw %}