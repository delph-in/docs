{% raw %}# Summary of SIG on Synthetic Data

Major use of synthetic data is for ML/AI evaluation. ShapeWorld motivation: fixed datasets are a bad idea for various reasons; instead, we can automatically generate varied but precise test data. In particular, ShapeWorld produces text grounded in images. In developing any new dataset, important to think about: amount of hand-coding vs. interestingness of the dataset.

Luís developing iTHOR, based on Unity 3D, allowing a human user to verbally interact with a virtual robot. Students develop their own virtual robot.
- automated evaluation could use synthetic text instead of human users, e.g. synthetic descriptions of robot actions
- language generation from virtual worlds is underexplored

A different application is generating language learning materials. Potential for gamification. If testing language production, learners might produce unexpected kinds of sentence. Easier to start with classification (e.g. asking if a caption matches an image). This could also prime the learner towards producing certain kinds of sentence in a subsequent task.

Also in the domain of language learning, synthetic data could be used for precise evaluation of error detection/correction models. Can generate many examples of a rare kind of error (or a rare kind of context). There is a cline between this and probing (i.e. measuring how well a system models L1 or L2 language).

"BabyLM Challenge" shared task (evaluated on a suite of tasks)
- restricted training data (100M or 10M tokens)
- 2nd version (2024): can choose your own data (still 10M or 100M tokens), e.g. filter a larger dataset
- previous finding: bootstrapping on self-generated data gives a better learning algorithm; potential for filtering/controlling this

Last update: 2024-07-06 by Guy Emerson [[edit](https://github.com/delph-in/docs/wiki/OlomoucSynthetic/_edit)]{% endraw %}