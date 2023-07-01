{% raw %}# Grammar Engineering Frequently Asked Questions

## When I try to parse a sentence, the LKB says "probable runaway rule". How do I debug this?

The LKB gives this error when the parse chart gets too big. With
grammars the size we're looking at, this only happens when a rule or set
of rules can apply recursively. Typical culprits are non-affixing
lexical rules that are compatible with their own DTR values and lexical
types, lexical entries or phrase structure rules that leave the length
of the COMPS list (on the mother in the case of rules) underspecified,
allowing the head-opt-comp rule to go to town. Since the LKB is trying
to parse exhaustively (find all parses licensed by the grammar for the
input string), it will keep applying the recursive rules, even if it has
already found (one or more) spanning parses.

To debug this, you'll need to find the rule that is applying to itself
(e.g., a unary rule whose mother and daughter are compatible with each
other) and stop the recursion by making the mother and daughter
incompatible. If it's a set of rules which are causing the recursion,
you'll need to decide which one(s) shouldn't be legitimate daughters of
the others and make them incompatible.

To figure out which rules are spinning in this way, after you've tried
to parse a sentence and gotten the error, select Parse &gt; Show parse
chart from the LKB top menu. If the parse chart is overwhelming, you can
make it smaller by following these steps:

- Find the shortest string you can that causes the issue (often just
one word is enough).
- Set the edge limit low by typing the following command at the LKB
prompt in emacs:

<!-- -->


    (setf *maximum-number-of-edges* 25)

- Try parsing and examining the parse chart again.

Chances are the issue is to do with the grammar entity (lexical entry,
lexical rule, phrase structure rule) that licenses the edge just below
the recursive set of edges.

Once you've fixed the bug, don't forget to reset the edge limit to
something big enough for the grammar to parse your sentences with (e.g.
4000 edges)!

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqRunawayRule1/_edit)]{% endraw %}