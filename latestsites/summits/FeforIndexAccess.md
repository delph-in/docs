{% raw %}During the [FeforGrammarians](https://delph-in.github.io/docs/summits/FeforGrammarians) discussion on immediate
challenges to developing our grammars
([FeforImmediateChallenges](https://delph-in.github.io/docs/summits/FeforImmediateChallenges)) we indentified a
set of phenomena which seem to require access to indices other than the
XARG belonging to saturated arugments. These include:

- Floated quantifiers (including floating numeral classifier phrases
in CJK)
- Various languages of the Americas in which verbal arguments seem to
be saturated by proniminal affixes, where independent NPs appear to
be modifiers further specifying those arguments.
- Secondary predicates in English ("Kim hired Sandy drunk") and
Norweigan ("Inkvisitoren torturerte presten andektig" - 'The
inquisitor tortured the priest in devotion'.). In both cases there
is evidence that the secondary predicate attaches to VP (not to the
object NP). In English, the string is ambiguous, with "drunk" being
predicated of either Kim or Sandy (? but not both). The same is true
for the Norwegian example given above, meaning that either the
inquisitor or the priest is in a devoted state. The example can also
mean that the whole act was done in a devoted manner. For many such
cases in Norwegian, the morphology on the secondary predicate
disambiguates. It forces the low (semantic) attachment in a case
like 'Per drakk ølet kaldt' ('Per drank the beer cold'), where 'øl'
is neuter and 'Per' masculine, and 'kaldt' has the neuter form; it
forces the high attachment in 'Per drakk ølet kald' (which means
that Per was cold). 'Per drakk ølet kaldt' can also mean that he
drank the beer in a cold fashion, since '-t' is also an adverbial
affix. In the latter case, ARG1 of 'cold' is the event index. In the
subject predicative reading, it is identical to the verb's XARG,
whereas in the object predicative reading, the ARG1 of 'cold' is
equated to 'VARG', which exposes the object argument in the HOOK.

Let me add one more point to the list:

- For some grammarians it might in addition be of interest to express
the 'mover' as the ARG1 of the prepositional modifer in a
directional construction, such that it is Per rather than the event
that ends up in a park for the sentence 'Per runs to the park'. In
[NorSource](/NorSource), which has adopted this Jackendovian view,
this has been implemented through the use of DIRCT-ARG parallel to
XARG (and VARG).

Last update: 2006-06-18 by DorotheeBeermann [[edit](https://github.com/delph-in/docs/wiki/FeforIndexAccess/_edit)]{% endraw %}