{% raw %}Future directions for HPSG parsing

Chair: Olga Scribe: John

Initial notes

Task: \[More HPSG\] constituency ... dependency \[Less HPSG? But more
useful?\] Downstream (what is needed to make progress there?) for
grammar correction? For gold standard annotation?

Efficiency: Packing: under subsumption; under generalization

Structure/type of algorithm:

- Top-down? See <https://www.aclweb.org/anthology/2020.iwpt-1.14.pdf>
from this year’s IWPT

Limitations:

- What can and cannot be improved, in principle? What kind of gains
are we talking about, in general?

Evaluation:

- What do we compare against?

Formalism:

- JRF
  - Relational constraints? :slightly\_smiling\_face:
  
  MRS

Discussion

Olga: Introduced the topic. She noted that the IWPT paper above elicited
positive reactions when presented; the results are surprising since many
researchers have given up on top-down parsing for HPSG.

John: Do different tasks have different requirements for parsing
efficiency? Earlier today we heard about successes in producing semantic
representations using DELPH-IN tools – for this task, is current HPSG
parsing efficiency adequate? Specifically, is ACE fast enough to always
produce a full forest that a grammarian can disambiguate?

Dan: For constructing treebanks, parsing speed is not an issue with ACE
and the ERG - only around 1% of current English treebank sentences fail
to get a packed forest in 300 secs CPU time and 16GB memory. ACE is able
to produce up to 10^18 packed analyses. But with Alexandre's mining
corpus containing 50 or 60-word sentences, the failure rate is as high
as 30-40%.

Olga: What do these failure rates and the high level of ambiguity tell
us about the grammar?

Dan: There might not necessarily be a problem here, especially if we
were to use techniques that cut up the search space into smaller
sub-problems, e.g. Ewa Muszynska's work on chunking. But when parsing
there are 'black holes' consisting of dense groupings of chart edges.
The grammarian needs better tools to identify and explore these places.

Stephan: Expressed the hope that DELPH-IN is viewed externally not just
as treebank producers. He would like to see more research in DELPH-IN
into the core parsing problem. Shouldn't our parsers take advantage of
recent deep learning approaches to improve tagging, for instance? Our
current technology for tagging unknown words seems particularly
inaccurate.

Dan: Talks about how he is convinced there are certain very fundamental
things that could be discovered through exploring massive ambiguity, but
our current tools do not really allow us to investigate such issues in
million-edge parse charts. And it is not that the chart does not load
(it does eventually), it is more a visualization issue; there is nothing
useful that can be done with that chart.

Woodley: In the past, didn't you dive into the chart but always find
some way of justifying any particular edge being there?

Dan: No, there's always something there that shouldn't be. Sometimes a
type could be changed to stop such edges being created, but fixes of
this kind never ended up having any significant effect on overall
performance.

Glenn: In that case, it seems likely there is no silver bullet.

Dan: There might in some cases be 5-6 things that mutually interact to
inflate edge numbers. And extra edges can multiply out. Some 20-30 token
sentences unexpectedly blow up.

John: In certain scenarios, might beam search be acceptable instead of
full forest parsing? Beam search would not be appropriate a some points
in grammar development, but it could be worth considering. There's a
very recent TACL paper by Meister, Vieira & Cotterell
<https://arxiv.org/abs/2007.03909> reporting promising results.

Alexandre: What do you actually see when you look at dense parts of the
chart?

Dan: When sampling chart cells with many edges, it's often possible to
explain why each edge should be there given some context or other, in
which case it's not possible to find a way of getting rid of it. There
are still pathological problems – even for parsing WSJ sentences. Beam
search seems tempting, but there would need to be a test harness to
control how it is applied. Some rules such as vocative cost a lot but
are very little used in genres such as WSJ. Maybe a one-size fits all
grammar and set of parameters aren't appropriate.

Stephan: Rebecca Dridan got some excellent results for supertagging.
However, since then we have not managed to reliably package up this
technology. How about applying the latest neural approaches to lexical
type prediction and pruning? For some tasks these kinds of models
achieve super-human accuracies.

Dan: It's not clear what super-human performance means for tagging,
since it's not a task that humans do. At present, after making only a
few changes in the grammar, the supertagger needs to be retrained; it is
brittle. Retraining is expensive. It would be fine if grammar resources
were static but unfortunately they're not.

Berthold: parsing bottom up does not work so well when syntactic
information that constrains the analysis is available only at the top of
the tree, e.g. partial VP fronting in German. He has tried all available
computational tweaks, but none of these addressed the basic problem that
parsing is very expensive if the valency of the main verb is not known
until the end of the parse. Although CFG approximation seemed promising,
it was not the solution to top-down prediction. He couldn't get
supertagging to work well with German's richer morphology.

Dan: There is a PCFG derived from the ERG, but it's so large that it
costs a lot to apply. It was designed for robust parsing, but it could
potentially be used to guide beam search or top-down prediction.

Olga: I'm afraid we're out of time. Thanks to all for the interesting
discussion.

Last update: 2020-07-15 by JohnCarroll [[edit](https://github.com/delph-in/docs/wiki/VirtualParsingDirections/_edit)]{% endraw %}