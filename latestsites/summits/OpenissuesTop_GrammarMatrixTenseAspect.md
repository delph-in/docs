{% raw %}# Open Issue: Tense and Aspect

Mentor: EmilyBender (ebender at u dot washington dot edu,
<http://faculty.washington.edu/ebender>)

Co-mentors welcome!

## Problem statement

We are in need of a standardized representation of tense and aspect
within MRS. This representation should be able to encode all contrasts
which are syntactically marked, while underspecifying further
distinctions in such a way that they can be computed if necessary from
the MRS without reference to the syntax and without \`overgenerating'
(finding readings which are not licensed, given the syntax). This
representation should target, in the first instance, grammatical tense
and aspect (as opposed to lexical aspect or aktionsart).

### Deep/shallow integration

For the purposes of RMRS-based integration, the ideal system would allow
for a mapping between morpohological (or morphosyntactic) tense/aspect
and semantic tense/aspect. That is, a mapping between what can be found
through morphological analysis and the representations built by deep
grammars.

### Matrix customization

The ideal system will define a superset of predicates (or operators or
types to serve as the value of features) from which individual grammars
can draw. This is a prerequisite to building a tense/aspect section for
the Matrix customization system
(<http://www.delph-in.net/matrix/modules.html>). A complication is that
contrasts which are routinely marked in some languages are routinely
left underspecified in others. Indeed, some languages grammaticize
mostly aspect while others grammaticize mostly tense.

### Autogeneration of transfer rules

To the extent that grammars can draw from a common vocabularly of
tense/aspect information, the relations among which we understand, it
should be possible to automatically generate transfer rules between any
two grammars based on how they are generated from the Matrix
customization system.

## Existing literature

[Goss-Grubbs, David](http://students.washington.edu/davidgg). 2005. [An
Approach to Tense and Aspect in
MRS](http://students.washington.edu/davidgg/mrs_tense_aspect.pdf).
Master's Thesis. University of Washington.

Copestake, Ann, Dan Flickinger, Carl Pollard, and Ivan A. Sag. 2005.
Minimal Recursion Semantics: An Introduction. *Research on Language and
Computation.*

Bender, Emily M. and Dan Flickinger. 2005. [Rapid Prototyping of
Scalable Grammars: Towards Modularity in Extensions to a
Language-Independent
Core](http://faculty.washington.edu/ebender/papers/modules05.pdf).
Proceedings of IJCNLP-05 (Posters/Demos), Jeju Island, Korea.

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/OpenissuesTop_GrammarMatrixTenseAspect/_edit)]{% endraw %}