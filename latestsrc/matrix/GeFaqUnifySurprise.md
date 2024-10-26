{% raw %}# Grammar Engineering Frequently Asked Questions

## I've tried to use interactive unification to find out why an edge can't be built, and it can be built interactively, but it's still not in the chart. What's going on?

With interactive unification, you can mimic interactively what the
parser does when it tries to parse a sentence. Therefore, edges that the
parser can't find one way it shouldn't be able to build the other.
However, sometimes you use interactive unification to try to find out
why an edge can't be built, only to find that seemingly it can. There
are probably many ways this can come about. Here are some I've found so
far:

- The edge you thought was missing actually wasn't. Double check the
chart.
- You took the two daughters and unify each separately with the
grammar rule. If you do this, they will almost always both unify.
The proper way to apply interactive unification is to unify one
daughter with the grammar rule, and then unify the other not with
the rule but with the unification result.
- Edges you are trying to use as daughters appear to be contiguous in
the chart, but actually are not. This can happen because if the LKB
can't construct an edge for a lexical entry, it won't put anything
for that entry in the chart. It will, however, record the fact that
there is something there, and not let constituents bridge the
material it can't account for. On the possible causes of this
situation, see [this FAQ](/GeFaqWordNotInChart).
- The problem is actually with the direction of headedness (i.e.,
order of daughters) in the rule. For example, say your language has
VO word order, but you've made your head-complement rule inherit
from head-final. If you try to unify the verb with the HEAD-DTR of
the head-complement rule and the NP with the NON-HEAD-DTR, it will
work just fine. However, when the LKB tries to parse the sentence,
it can't apply the rule because it's expecting the NP (NON-HEAD-DTR)
as the first (i.e., left-hand) daughter, per the constraints on
head-final. (The LKB uses the feature ARGS to determine the order of
the daughters. The types head-final and head-initial link the values
of HEAD-DTR and NON-HEAD-DTR to their respective positions on ARGS.)
- A rule you are expecting to appear in the parse hasn't been
instantiated in rules.tdl. (In this case, you wouldn't expect to see
the rule in the View &gt; Grammar Rule or View &gt; Lexical Rule
menus, but you could still have accessed its type definition through
View &gt; Expanded Type, for example.)
- If the rule that is not firing is a lexical rule, it's possible that
you've said it's an inflecting lexical rule (i.e., one that adds an
affix) but defined it so that it doesn't in fact add one. As well as
processing the irules.tdl and lrules.tdl files differently (as
instructed by lkb/script), the LKB also uses the NEEDS-AFFIX
feature. Inflecting rules should inherit from inflecting-lex-rule
and be instantiated in irules.tdl, while non-inflecting rules should
inherit from constant-lex-rule and be instantiated in lrules.tdl.
- The word in question is misspelled or the lexical rules are buggy
such that the morphophonological rules produce only analyses of the
lexical item which are spurious according to the morphosyntactic
rules. For example, say you have a stem 'CV' and a lexical rule
which adds a -V suffix, but isn't actually morphosyntactically
compatible with the stem 'CV'. In parsing a string which includes
the 'word' 'CVV', the LKB will 'strip' the -V suffix (per the
morphophonological rule) and find the 'CV' stem. The LKB will
accordingly create an edge in the chart for this lexical item,
labeled with the corresponding form from the input string ('CVV').
However, the LKB has remembered that this edge needs to be put back
through the -V rule in order to be legitimate. If the CV stem is not
compatible morphosyntactically with the DTR of the -V rule, it won't
spawn any further edges in the chart, even if some other rules
(e.g., a phrase structure rule) could happily take it as a daughter.
- The rule applies to the lexical edge as it appears in the chart, but
that lexical edge represents some spelling changes, and the lexical
rules associated with those spelling changes failed to apply.
- The rule is one of a chain of lexical rules, and some following
(spelling changing) lexical rule fails to apply. Since the LKB won't
put edges derived by lexical rule in the chart unless the whole word
can be rebuilt to the given surface form, edges for successful but
intermediate lexical rule applications might not appear. In this
case, the problem is actually further along the chain of lex rules,
so the next step is to do more interactive unification, using the
result from the interactive unification as input to the next
expected lex rule.
- You have fixed a problem in your grammar that was preventing
unification, but you are selecting "Redisplay parse" instead of
actually re-parsing the sentence. This will display the old parse
chart, but the problematic edges will unify during interactive
unification.
- The lexical rule is being removed by lexical filtering, e.g. because it underspecifies TRAITS (or similar). See [here](https://delphinqa.ling.washington.edu/t/help-debugging-a-unification-surprise-involving-lexical-rules/875/4).
- (Applicable to ace only, not the LKB): If the value of `parsing-roots` in `ace/config.tdl` is a string that does not correspond to something in `roots.tdl`, ace will refuse to put any edges into the spanning cell of the chart, even if they can be built interactively. Discovered in Olomouc, during KRG discussion

## The sentence is parsed by the LKB, but an edge I am interested in is not in the parse chart. I can build it interactively, and I can see it in the ACE parse chart.

- The LKB hides some of the packed edges (at least when using LUI). You can [parse the sentence without packing](https://github.com/delph-in/docs/wiki/LkbFos#features-and-enhancements), and you should see the edge. See [here](https://delphinqa.ling.washington.edu/t/an-edge-is-in-the-tree-but-not-in-the-chart/1087).

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2024-10-25 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/GeFaqUnifySurprise/_edit)]{% endraw %}