{% raw %}# Grammar Engineering Frequently Asked Questions

## What should I know about documenting my grammar?

Documentation is key to creating maintainable grammars. Current best
practice recommendations are as follows:

1. Documentation consists, in the first instance, of comments in your
.tdl files.
2. Comments should begin with an identifier of the author (e.g., your
initials) and a date.
3. Comments should include a statement of why a type was created, or,
in the case where you are changing an existing type, a statement of
what was changed (what it looked like before and after).
4. Wherever possible, comments should include an example sentence
illustrating the phenomenon which motivated the change, in IGT
format.
5. Comments should be placed immediately above the type they refer to.
6. Old comments should not be deleted.
7. When there are multiple comments regarding the same type, the older
comments should come first (above) and the newer comments later,
with the most recent comment immediately above the type in question.
8. Often, a change in the grammar requires making related changes to
multiple types. It is important to leave a comment documenting that
change at each type (or above each block of types), but it is fine
to have a longer explanatory comment in just one place (with
examples, etc), and shorter comments elsewhere. In this case, the
shorter comments should point to the longer one.
9. If these practices are followed, the result is a narrative that will
allow you (or some future developer of the grammar) to reconstruct
why each type is the way it is, avoid re-exploring analyses that
were found not to work, and generally maintain the grammar over
time.

Back to [Grammar Engineering FAQ page](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqGrammarDocumentation/_edit)]{% endraw %}