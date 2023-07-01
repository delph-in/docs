{% raw %}# Grammar Engineering Frequently Asked Questions

## I have a lexical rule that seems to be applying even when its phonological conditions aren't met. What's going on?

The rule probably doesn't inherit from the type **inflecting-lex-rule**.
This breaks the connection between the STEM values of the input and
output. Add **inflecting-lex-rule**as a supertype to the rule in
question, and it should work better.

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).
<update date omitted for speed>{% endraw %}