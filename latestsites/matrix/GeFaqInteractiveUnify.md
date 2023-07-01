{% raw %}# Grammar Engineering Frequently Asked Questions

## How do I do interactive unification?

This FAQ explains how to do interactive unification. To learn about when
to use interactive unification, see this FAQ. If you've tried
interactive unification, and you're not getting the result you expect,
look here. In the chart, click on each of the daughter edges, and select
"feature structure" to get the feature structures for the edges.
(Interactive unification can also be used to debug a unary rule. Here
I'm going to talk about binary rules.)

- In the LKB top menu, choose View &gt; Grammar Rule and pick the rule
you think should have applied. This will give you a feature
structure for the rule.
- In the feature structure for the rule, scroll down until you find
the HEAD-DTR feature (it may be easier to shrink the values for
SYNSEM, ARGS, and C-CONT on the way).
- Click on the type that is the value of HEAD-DTR (probably **sign**,
but possibly something more specific), and choose "select" out of
the pop-up menu.
- In the feature structure for the edge that should be the head
daughter, click on the highest type (e.g., **common-noun-lex** or
**head-comp-phrase**) and in the pop-up menu choose "unify".
- If the unification failed already, there will be a message in the
LKB window telling you the first point at which the two feature
structures didn't unify (there may be more).
- The rules tend to be fairly non-specific, so this first unification
usually works. If it does, you'll get a new window called
"unification result" which is exactly the information from the rule
with the information of the head daughter unified in.
- In the unification result feature structure, scroll down (or shrink
down) to the NON-HEAD-DTR feature. Click on the value of that
feature and choose "select".
- In the feature structure for the edge that should be the non-head
daughter, click on the highest type (e.g., **det-lex** or
head-spec-phrase) and choose "unify".
- Go look at the LKB top window for a message indicating the first
point at which the two feature structures didn't unify (there may be
more). This information should be useful for debugging.

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqInteractiveUnify/_edit)]{% endraw %}