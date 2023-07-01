{% raw %}# Grammar Engineering Frequently Asked Questions

## When I load my grammar, I get \*"Feature ... is introduced at multiple types (...)". What is causing this?

Features can only be declared for one type. If two types need the same
feature, they need to have a common supertype from which to inherit it.
You might hit this error if you happen to try to reuse a feature name
already in use in the matrix, or if you try to declare a feature for two
types at the same time (e.g., FORM on verb and prep) instead of putting
it on a supertype.

NB: You can of course mention features on multiple types, and often need
to in order to constrain their values appropriately. They just need to
be introduced on a supertype to all types that they are appropriate for.
This doesn't mean that e.g., trans-verb-lex needs to inherit from noun
in order to constrain a value of CASE on one of its arguments. In the
example below, CASE remains a feature of noun, which happens to be the
value at the end of a path inside verb-lex.

    trans-verb-lex := verb-lex & transitive-lex-item &
       [ SYNSEM.LOCAL.CAT.VAL.COMPS < [ LOCAL.CAT.HEAD noun &
                                                [ CASE acc ] ] > ].

* * *

### Related topics

- [I'm trying to add a new feature, and the LKB doesn't like it. What
should I do?](https://delph-in.github.io/docs/matrix/GeFaqNewFeature)
- [When I load my grammar, I get "no possible type for features (...)
at path (...)". What is causing this?](https://delph-in.github.io/docs/matrix/GeFaqNoPossibleType)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqFeatureMultiType/_edit)]{% endraw %}