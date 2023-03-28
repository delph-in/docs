{% raw %}# Discussion VIII: Comparative Evaluation

The discussion aimed to reach a common agreement from
[DELPH-IN](http://www.delph-in.net/) members on the necessity of having
good comparative evaluation paradigm for both deep grammars and
processing algorithms.

The tasks to be evaluated include (but not limited to):

- parsing/generation algorithms
- various grammars
- disambiguation models

And the comparative evaluation might be carried out not only within the
[DELPH-IN](http://www.delph-in.net/) community, but also with other deep
processing with different formalism (LFG, CCG), or even more general
NLP/CL groups.

The motivation of comparative evaluation is to help the scientific
evolution, ensure the credibility of research, and provide better
visibility to the outside of [DELPH-IN](http://www.delph-in.net/)
community.

For grammar evaluation, the basic metrics should include:

- Grammar size (number of types, lexical entries, line of codes, etc)
- General coverage
- Flexibility/adaptability for various NLP application
- Usefulness in multi-lingual application context
- Output preciseness
- (Linguistic interests and elegance)

One of the major discussion focuses was how to evaluate/compare the
accuracy of deep parsers. Semantic output based evaluation provides a
relatively good metric. More specific,
[PropBank](http://www.cis.upenn.edu/~ace/) provides partial semantic
representation in predicate argument structure. By mapping the
[(R)MRS](https://delph-in.github.io/docs/tools/RmrsTop) output of deep parser to
the predicate argument structure, we can compare and evaluate the
preciseness of the output. It would be even better if the mapping
algorithm can be standardized and publicly available, to avoid the
duplicated work.

The potential problems of using
[PropBank](http://www.cis.upenn.edu/~ace/) (or alike) for evaluation
are:

- [PropBank](http://www.cis.upenn.edu/~ace/) is not a multi-lingual
resource
- [PropBank](http://www.cis.upenn.edu/~ace/) mainly focuses on verbs
only
- Evaluation based on newspaper texts might potentially divert, even
jeopardize the deep grammar development.

Creating (small) testing resources (corpus/treebank) and sharing among
[DELPH-IN](http://www.delph-in.net/) members is a good suggestion
acknowledged by most of the members.

Another possible evaluation task brought into discussion is
paraphrasing. It can evaluate both parsing and generation. It also
provides a possible way of cross-lingual evaluation, and eventually
helps the applications like machine translation. However, considering
the fact that many grammars under development still overgenerate
massively, the practicability of adopting paraphrasing as evaluation
task is still to be explored.

As a conclusion of the discussion, [DELPH-IN](http://www.delph-in.net/)
members agreed on that having some shared data will help the comparative
evaluation for all delph-in groups.

Last update: 2021-06-03 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/LisbonEvaluationDiscussion/_edit)]{% endraw %}