{% raw %}# Discussion on HPSG Processing Strategies

Moderator: StephanOepen

Scribe: YiZhang

This discussion was initiated by the request of contributing a chapter
on HPSG processing to the language and linguistics compass online
volume. The general discussion of HPSG processing strategies dates back
to a workshop in Berlin in 1998. People from SB, Tokyo, Stanford came
together to discuss the strategies of overcoming obstacles in HPSG
processing: FS manipulation, efficient unification and copying, etc.
Stochastic disambiguation models joined the game around 2000. More
recently, the development has been focusing on improving robustness of
the HPSG parsing. The essential goal nowadays is to achieve the balance
(sweet-point) between coverage accuracy and efficiency. While the
on-going effort to achieve better efficiency in Tokyo presents a
competitive response to other deep parsing communities (i.e. CCG), there
is also a growing interest in exploring cognitive apparatus in HPSG
parsing (deterministic parsing, incremental parsing, more general
psycholinguistic human sentence processing, etc) from others
(StephanOepen).

The general open question for discussion is:

**How to achieve the sweet-point of balance between efficiency, accuracy
and coverage?**

[MiyaoYusuke](/MiyaoYusuke): it should be emphasized that the three
aspects of the parsing (coverage/robustness, accuracy, efficiency) must
been considered together when attempting to improve the parser. It is
also closely related to grammar engineering. And from some aspects, the
generation is similar the parsing. A good disambiguation model can help
to overcome the problem with an overgenerating grammar.

JohnCarroll: Traditional grammar developers do not rely
on statistical disambiguation model. What does grammar developers think
of this problem?

DanFlickinger: For instance, when treebanking the
grammar outputs, the results are sometimes somehow skewed by the
disambiguation model.

AnnCopestake: To a degree, the disambiguation model
makes the grammar domain specific. For large scale parsing it skews the
search space. We should avoid be less different from treebank-induced
grammars. One should not be too much affected by practical issues.

DanFlickinger: What's the workload distribution between
parser and grammar? Many parsing edges are created for the need to
handle modifier attachment. To which degree the syntactic structure are
isomorphic?

It is mentioned in the discussion that there are ongoing work on
generation with treebank-induced grammar (i.e. at Tokyo).

StephanOepen: Incremental processing strategies,
inter-dependencies between the grammar and processing

BertholdCrysmann: Interlinguality need to be
considered in processing, as well. A close cooperation between grammar
engineering and processing people is needed.

Last update: 2007-08-26 by YiZhang [[edit](https://github.com/delph-in/docs/wiki/BerlinProcessing/_edit)]{% endraw %}