{% raw %}# Grammar Engineering Frequently Asked Questions

## I'm trying to write a lexical (or phrase structure rule), but I get the error "Rule without daughter". What does this mean, and how should I fix it?

The parameters file lkb/globals.lsp specifies (among other things) the
features through which the parser/generator can find the daughters of a
phrase structure or lexical rule. If none of those features are
appropriate for the rule that you defined, you will get this error. The
best way to make sure that you inherit the proper features is to make
your rule a subtype of some type which identifies each of the ARGS
elements with an appropriate other feature, such as DTR, HEAD-DTR,
NON-HEAD-DTR. Types which do this include lex-rule, head-initial,
head-final, and head-only. In fact, to take full advantage of the
Matrix, you almost certainly want to inherit from much more specific
subtypes of those types.

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqRuleWithoutDaughter/_edit)]{% endraw %}