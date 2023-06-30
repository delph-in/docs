{% raw %}# Grammar Engineering Frequently Asked Questions

## When I try to generate, the LKB says "Probable circular lexical rule". How do I debug this?

This error arises when a lexical rule can apply to its own output. With
spelling-change rules, this isn't a problem in the parsing direction,
because the number of times the rule can apply is constrained by the
input form. In the generation, direction, however, the form itself is
unconstrained, only the semantics. A typical case would be a
lexeme-to-lexeme rule that only adds information (e.g. case
information). This problem doesn't arise with rules where the DTR
(input) and mother (output) are already incompatible (e.g., different
values for INFLECTED). One solution is to constrain the type of the
daugher on the rule: to *lex-item* if it's the first affix or to the
type of the lexical rule that adds the immediately preceeding affix.

Another possibility (if you're dealing with a highly inflecting
language) is that you are exceeding the limit on maximal lexical rule
applications (the value of **maximal-lex-rule-applications** set in
lkb/globals.lsp). This value can be changed by editing that file.

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqCircularLexRule/_edit)]{% endraw %}