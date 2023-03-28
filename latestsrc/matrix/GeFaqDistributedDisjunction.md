{% raw %}# Grammar Engineering Frequently Asked Questions

## Can I make the value of one feature dependent on the value of another?

Yes, but only in some cases. The mechanism of reentrancy (coreference
tags, e.g. \#same) allows you to require that the value of two features
be the same. The more general case ('distributed disjunction') is not
possible within tdl however. You cannot state that the value of FOO is x
just in case the value of BAR is y.

[Back to the Grammar Engineering FAQ](/GrammarEngineeringFaq).
<update date omitted for speed>{% endraw %}