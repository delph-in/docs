{% raw %}# Grammar Engineering Frequently Asked Questions

## When I switch between grammars (e.g., the English Resource Grammar and a Matrix-derived grammar) the LKB sometimes behaves funny (errors, seg faults, etc.). What's going on?

Because different grammars tweak the LKB differently through the
parameters files in the lkb directory, it is not safe to assume that the
LKB is in the same starting state after you load grammar A rather than
before you load grammar B. In the course of grammar development, we
generally don't have cause to change the parameters files significantly
enough to cause a problem on reloading the same (slightly modified)
grammar.

If you are using another grammar (and particularly one that is not
Matrix derived and/or one that is large enough to have placed specific
requirements on the behavior of the LKB), it is a good idea to restart
the LKB itself when switching between grammars.

## Related topics

- [When I close the LKB Top Menu, is Lisp supposed to exit as
well?](https://delph-in.github.io/docs/matrix/GeFaqClickX)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqSwitchingGrammars/_edit)]{% endraw %}