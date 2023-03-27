{% raw %}# Discussion: Evaluation

# Moderator: Montserrat Marimon; Scribe: Rebecca Dridan

# Objective

Share experience/ideas among grammarians about evaluation:

1\. Diagnosis evaluation (regressing testing while developing)

2\. Direct evaluation (grammar performance in terms of recall and
precision, robustness,... )

3- Indirect evaluation (grammar usability/adequacy for a specific
application).

# Notes

Montserrat: How do other grammarians evaluate their grammars?

Antonio: We have a regression corpus of hand built analyses for around
555 sentences, including negative examples.

Emily: used held-out data to test the Wambaya grammar.

Francis: translating via [JaEn](/JaEn) MT

Dan: has found LOGON (translation) and exercises like CONLL useful to
locate problems in the grammar.

Yi: CONLL is a blackbox task, making it hard to get qualitative feedback
on grammar performance.

Valia: we need to look at cross-domain evaluation. Other formalisms like
LFG are doing this and finding that it triggers changes in the grammar.

Dan: Most of the changes required for shifting domains are in
pre-processing, not the grammar itself. Very rarely does an analysis
have to change because of new corpus data, although analyses for more
constructions are added.

Michael: EGAD system uses paraphrasing to discover grammar problems.
Uses signs such as strings not being recoverable, or paraphrases having
different semantics.

Richard: has an inference system that could also point out errors.

Dan: Ann Copestake and Steve Clark are discussing a common
predicate-based representation scheme they can agree on. The assumption
is if at least two groups agree on a standard and create a gold
standard, others like RASP and ENJU will follow. This was discussed at
the workshop at [CoLing](/CoLing) last year. Politically fraught because
no one can afford to agree to a metric that makes them look worse than
everyone else. There will probably end up relation types that are
counted in one grammar but not another for this reason. An ideal
representation will also be language independent.

Antonio: Language independence isn't worth fighting for. It is a nice
goal, but takes too long for little real benefit.

Stephan: Deep processing's time is coming. We should be looking at how
to differentiate between deep systems. What does DELPH-IN do best?

Nuria: There is currently discussion about ISO standards for annotation.
They might be interested to hear any representation that was agreed on.

Hans: We should look at whether any intrinsic evaluation correlates with
task performance. MT evaluation doesn't appear to correlate with parse
evaluation - any parse 1st or 20th seen to help.

Fei: IE could be a good evaluation task. In Rascalli, 50% of errors are
due to linguistic interpretation issues.

Last update: 2009-07-25 by RebeccaDridan [[edit](https://github.com/delph-in/docs/wiki/BarcelonaEvaluation/_edit)]{% endraw %}