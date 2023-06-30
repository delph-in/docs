{% raw %}# Grammar Engineering Frequently Asked Questions

## How do I do disjunction (constrain the value of a feature to be X or Y)?

The tdl formalism doesn't provide an explicit disjunction operator. In
most cases, disjunction can be handled straightforwardly through the
logic of the type hierarchy. For example, if you want to constrain the
value of CASE to be either nom or acc (but not dat), it suffices to
define a type which subsumes both nom and acc, but not dat:

    case := top.
    dat := case.
    nom+acc := case.
    nom := nom+acc.
    acc := nom+acc.

Given this hierarchy, "The case is nominative or
accusative"(equivalently, "The case is not dative") can be expressed
thus:

    [ CASE nom+acc ].

Note that a type can have multiple supertypes. This allows for
overlapping disjunctive types. In this hierarchy, the types nom+acc and
nom+dat subsume nom and acc and nom and dat, respectively.

    case := top.
    nom+acc := case.
    nom+dat := case.
    nom := nom+acc & nom+dat.
    acc := nom+acc.
    dat := nom+dat.

### Related topics

- [How do I constrain something to be not of a certain
value?](https://delph-in.github.io/docs/matrix/GeFaqNegValue)
- [How do I browse the type hierarchy?](https://delph-in.github.io/docs/matrix/GeFaqViewHierarchy)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqDisjunctiveValue/_edit)]{% endraw %}