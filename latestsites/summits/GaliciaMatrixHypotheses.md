{% raw %}# Exploring/refactoring the Grammar Matrix code to distinguish between linguistic hypotheses and engineering artifacts

Discussion at the [Galicia Summit](https://delph-in.github.io/docs/summits/GaliciaTop) (2023-06-29)

[Slides](https://github.com/delph-in/docs/blob/main/summits/2023/GM-refactoring-SIG.pdf?raw=true)

Erik: Can we test hypotheses by, e.g. adding a rule that deletes information and sees what breaks.

Emily: Consider postpositions, we may have thought a language only has pre, (like English) but in fact also has post (like 'ago').

Consider lexical threading, it could be added, but would be a lot of work.
You can think of this as a hypothesis 'LDD can be lexically mediated'.   It is not clear whether we removed it for theoretical or engineering reasons.

Olga: or maybe it is a consequence of how we treat coordination (and other ways of doing it would make life easier)

Emily: the hypothesis all have to work together

Guy: this could be a weakness for deciding hypothesis

'Most phrases have an identifiable head daughter' is a very vague constraint, and can only be evaluated within a full theory.

Emily: interesting also in terms of the linguistic algebra.   How does this integrate with our theory of HD

Erik: Is this a hypothesis about all languages or about the output of the Matrix

Emily: there are two layers: core and output.   Core is a hypothesis about all languages.

Guy: One example is I added a common sub-type of instances and events.

Emily: I still don't love it.  It would be useful to underspecify for many PNW languages.

John: If people disagree about this then it is interesting hypothesis, it may not be true for all languages.

Berthold: Someone has tried to remove category (POS) from syntax, you only have it in morphology.  [Work on Oneida by JP Koenig and Karen Michaelson 2020](https://scholar.google.com/citations?view_op=view_citation&hl=en&user=T5MzyVYAAAAJ&sortby=pubdate&citation_for_view=T5MzyVYAAAAJ:qxL8FJ1GzNcC)

Guy: have they just moved stuff to semantics?  

Berthold: I am just raising it.

Emily: the SYN feature was not in the way, but maybe was useful.

We have an engineering decision to start with 10 POS, which may not hold for all languages.   It is not a linguistic hypothesis.

Olga:  How to model more flexible word orders?  More orders for H-comp, H-Subj or with more filler-head.   So S-head is not used for 'dogs bark' although it could have been.

Emily: this may be a family of hypothesises about what families of rules are necessary.

Olga: it felt like it was using LDD for Information Structure.

Chris: maybe we are relaxing what LDD means

Emily: set of hypothesis about what constructions we use

set of hypothesis about semantics and constructions (e.g. nominalization)

What distinctions are made in the semantics

Our choice of semantics is constrained by the syntax and vice-versa

And not all libraries in the Matrix are used for all languages

Guy: Perhaps one way of distinguishing between engineering decisions
and linguistic decisions would be too rebuild it and see which things change and which remain the same.

Olga: we would probably end up with a different mixture of eng vs ling.

Emily: only reproduce the regression test

Emily: changing the Matrix to use ET types and lose lexical threading lost a vast number of things.

Chris: I don't think the formalism is just an engineering decision.   The engineering decisions lead from our formalism

John: there are certainly engineering decisions that have been made
that I disagree with, e.g. chart-mapping, which is not well defined, VPM.

Dan: is there maybe a theory floating underneath there?  It seems to
me that CM is more a gathering of rules we need to capture some
generalities, but not really yet a theory.  More born from an urgent
need to handle some things practically.

John: it is neat that we can use it in multiple places (pre-processing, X and Y)

Dan: even within pre-processing it is handles two very different things (NE patterns and generic lexical entries).

Emily: we don't really use it for our very small grammars

Dan: but you need it soon, e.g. punctuation for Portuguese

Emily: it would be an interesting thing for a new library, and varies
interestingly across languages.

Emily: some things are not in the matrix system because of the
difficulties of the interactions (like indirect objects and case)
although the matrix core had types for this.

Emily: Comments, of course also have much useful information about how
motivated some things are.

Guy: we should think not only of the code-base but also the
regressions tests.

Emily: it would be very interesting to see, and may well find some
lacunae in the regression tests.

Typically tests from
* ?
* languages and phenomena used to build libraries
* languages and phenomena used to test libraries

John: google sometimes throws away some code and rebuilds it to pass
all the regression tests, and it generally makes the code much better

Olga: essential vs incidental complexity (from my thesis) from software engineering
Sangwan and Neill 2009.

Francis: one implicit hypothesis, which is generally engineering based
is that the unit of interest is sentences (rather then discourse or
fragments)

Chris: essential vs incidental complexity originally from Fred Brooks
(of 'The mythical man-month').

Chris: another place that is murky between engineering and linguist decisions is the way we did valence change as a collection of micro-code, that maybe makes the weak linguistic hypothesis that we have a set of operations we use to do these linguistic things.

Dan: this may be stronger if we can show how things vary across language where you may have a set of choices and different languages choose different subsets.

Emily: generalising about that, we are making a weak hypothesis that
these phenomena are related, and it depends on how much time you have,
what literature is available and so forth.  And of course the order we
do things in is important.  You can only develop a phenomena based on
what has already been developed.

Coordination breaks many things, so we did it early, and we should cross-test it more when making the regression tests.

John: coming back to the hypothesis, we could try to have a stronger
way of checking these hypothesis: e.g. does my grammar add or subtract
information, ...

Emily: hard to check for all things

Guy: at least some things can be checked using static analysis and it
might be useful

Francis: locality is one thing it would be good to check

John: e.g. in the SRG, something goes into the REL list and filters
things, and probably shouldn't

Emily: this is a case of maybe best-practice becoming a hypothesis
it is not that nothing is accessible non-locally, but rather that we only need a restricted set of things passed up.

Berthold: the compositionally hypothesis helped me find a better approach to reduplication.

Francis: grass and tree snakes

Dan: we need to make copies of things for gapping, and this kind of
thing can be used to handle these

GT: let me write you a type for these

Berthold and Guy: one hypothesis is that lexical rules are unary, and
this is not definitely the case.

Emily: this is a good example of a theory (the lexical and syntactic
processing are distinct) that may be wrong

Emily: thanks us all for an interesting discussion.


Last update: 2023-06-29 by Glenn Slayden [[edit](https://github.com/delph-in/docs/wiki/GaliciaMatrixHypotheses/_edit)]{% endraw %}