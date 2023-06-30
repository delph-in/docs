{% raw %}# Grammar Engineering Frequently Asked Questions

## When I try to generate, the LKB says "probable runaway rule". How do I debug this?

As with the [parallel error in parsing](https://delph-in.github.io/docs/matrix/GeFaqRunawayRule1), this happens
when the generator chart gets too big. Because the generator is working
from a bag of lexical items corresponding to the semantic relations it
was given, but no particular order of those lexical items, it has a
larger search space than the parser does. Thus, it is possible that you
could hit this error without actually having a runaway rule. However, in
the most common case, it is recursion that is causing the problem.

One thing that can cause recursion in generation without also causing it
in parsing is semantically empty lexical items (e.g., complementizers).
Unless you write filter rules for such lexical items, the generator has
to keep positing them, as many as might be needed to complete a parse
that covers all the semantics. Since the generator is also doing an
exhaustive search, this means that the empty lexical items can keep
getting thrown into the chart. If, for example, a phrase built out of a
complementizer and it complement is an acceptable complement for the
complementizer, this gets you a "runaway rule" situation.

To debug this, try generating, get the error, and then chose "Generate
&gt; Show gen chart" from the LKB top menu. (Be aware that it might take
a while to display the chart, since it will be big.) As with runaway
rules in parsing, the chart should help you see what's spinning.

If (due to lack of memory), the LKB won't display the big generator
chart in the GUI, you can see it in emacs. Go to the common-lisp buffer
and type:

    (pprint *gen-chart*)

Because the generator's search space is larger than the parser's, in
some cases it's possible that you could run out of chart edges without
finding all possible realizations, without there actually being any
illicit recursion involved. You can test this by increasing the number
of edges. In the emacs buffer common-lisp, do:

    (setf *maximum-number-of-edges* 8000)

(This doubles the default setting, and might mean that you end up using
virtual memory in trying to generate.) Try generating again. If you're
successful in generating with the increased edge limit, then you don't
have illicit recursion. There might still be something that's
underconstrained in your grammar, which is unnecessarily enlarging the
generator's search space. It's possible that adding filter rules for
semantically empty lexical items might help.

Scenarios that can lead to runaway rules in generation:

1. A lexical rule (inflecting or not) is written so that the mother is
compatible with the daughter and contributes no relations (its
C-CONT.RELS is empty). The generator isn't guided by surface forms,
so it will happily keep adding that affix forever. Note that in this
case, you actually get the \*"Probably circular lexical rule" error.
2. A unary phrase structure rule is written so that the mother is
compatible with the daughter and the rule contributes no relations
(its C-CONT.RELS is empty). In this case, you are likely to spin on
parsing as well, though it's possible that you could have a string
that parses without spinning but can't generate because the surface
string prevents the parser from exploring the spinning rule as a
possibility while the generator is able to explore that possibility.
3. You have a semantically empty lexical entry (e.g., a complementizer)
that can take phrases built out of itself as complements (so that
you'd get a CP with another CP as the non-head daughter.) Filter
rules can help in this case, but you should also fix the grammar
error. Presumably, your grammar is also overgenerating (e.g.,
parsing strings like Kim thinks that that that that that Sandy
slept).
4. You have a semantically empty lexical entry (e.g., a complementizer)
(even one that won't cause spinning on its own) and a phrase
structure or lexical rule that causes a valence list (SPR, SUBJ,
COMPS) to be underspecified for length. This would happen if the
value of any of those features wasn't constrained on the mother. In
this case, the generator will happily keep positing another instance
of the semantically empty element and attaching it via a
head-valence phrase of the appropriate type. Here again, filter
rules would keep the generator from spinning, but you also need to
fix the grammar bug, as once again your grammar is likely
overgenerating.

* * *

### Related topics

- [What are filter rules and how do I write them?](/GeFaqFilterRules)
- [When I try to generate, the LKB says "Probable circular lexical
rule". How do I debug this?](https://delph-in.github.io/docs/matrix/GeFaqCircularLexRule)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqRunawayRule2/_edit)]{% endraw %}