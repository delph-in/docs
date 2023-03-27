{% raw %}July 31st, 2013

12:10-12:30 Discussion: Subsumption checks in generation (Moderator
from: Woodley, Scribe: Rui)

W - Woodley; E - Emily; O - Oepen; A - Ann; F - Francis

W: so the topic is post-generation subsumption checking, i.e., whether
the meaning of one MRS is subsumed by the other. and also what would it
be exactly. for instance, when translating an MRS from one language with
gender into another without, vpm can destroy the information like
gender.

E: all the subsumption checking of MRSes need to be exposed in sem-i

O: you're assuming there is no such thing, but technical report 2013
actually mentioned such thing (leaving some footnotes)

A: we're not doing subsumption in the feature structure universe

E: what will you do with the gender example?

O: I'm not sure I understand the problem.

D: i want a masculine professor and the generator says I cannot help,
since the language doesn't have that.

W: LKB generator and ACE generator are different.

O: there could be some bug in the generator.

...

A: i don't think all should be in the subsumption checking. only the
"big" things not all the bits.

O: in which sense all the bits? variable type could be a distinction.

A: the reason for the post-generation testing is not for the bits.
what's going to be in the subsumption checking?

F: at least for MT, we could form well-formed MRS. there is an option to
choose whether to do post-generation subsumption checking or not. there
are a few percents we could gain with the loose setting.

O: it was also helpful for generation with ERG, though i don't have the
numbers, but it has some significant improvement.

A: suppose you have a hierarchy of predicates, the generator could
choose the more general ones.

O: for instance, preposition for location or temporal, we give an
underspecified input and get all of them; for the temporal it's fine,
but for location is not.

A: they will not unify, so it's not a problem.

D: if the input is unnecessarily specific, we can give perfect
paraphrases; but examples like "dog chases cat", we don't want "somebody
chases something". So in some cases, it's ok, but should not be
over-general.

E: it's a good research topic to start with this discussion.

Last update: 2013-07-31 by RuiWang [[edit](https://github.com/delph-in/docs/wiki/SaarlandMrsSubsumptionDiscussion/_edit)]{% endraw %}