{% raw %}# Grammar Engineering Frequently Asked Questions

## When I load my grammar, I get "no possible type for features (...) at path (...). What is causing this?

When the LKB loads a grammar, it checks the grammar for well-formedness.
One of the ways it does this is to check for every feature structure
(including feature structures inside feature structures) posited that
there is a type defined in the grammar which is consistent with the
constraints on that feature structure. Since the LKB requires that
features each be declared on only one type (and inherited by all
subtypes of that type), it can look at the features mentioned and decide
which set of types are possible. (It will then pick the least specific
of that set.)

Things that you can do which will cause the error above include:

- Mistype a path name
- Mispell a feature name (actually a subcase of the above)
- Try to introduce a feature in a feature structure other than the
outermost one for the type in which the feature is declared (see
[FAQ: I'm trying to add a new feature, and the LKB doesn't like it.
What should I do?](https://delph-in.github.io/docs/matrix/GeFaqNewFeature)).

The error message will specify the path at which the problem is
occuring. &lt;&gt; is the empty path, i.e., the outermost pair of square
brackets.

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqNoPossibleType/_edit)]{% endraw %}