{% raw %}# Grammar Engineering Frequently Asked Questions

## How do I constrain something to be not of a certain value?

The tdl formalism does not include any explicit negation operator.
However, in most cases, you can use the logic of the type hierarchy to
encode negative constraints.

For example, suppose your language has three cases, nominative,
accusative, and dative, and that you want to constrain the value of CASE
on some type to be not dative. Within this closed system, not dative is
the same as nominative or accusative. Therefore, it suffices to define
an intermediate supertype for nominative and accusative, which excludes
dative:

    case := *top*.
    dat := case.
    nom+acc := case.
    nom := nom+acc.
    acc := nom+acc.

Given this hierarchy, "The case is not dative" (equivalently, "The case
is nominative or accusative") can be expressed thus:

    [ CASE nom+acc ].

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqNegValue/_edit)]{% endraw %}