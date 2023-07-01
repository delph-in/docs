{% raw %}# Grammar Engineering Frequently Asked Questions

## The LKB seems to be "forgetting" a constraint/definition I've coded. Why?

If you've coded a constraint in tdl but it isn't reflected in the LKB
(there's no change to your grammar's behavior; when you look at an
entry--rule, lexical entry, etc.--or a type which should be subject to
the constraint using the View menu, you don't see the constraint), check
the following:

- Have you reloaded the grammar since you made the change?
- Have you saved the tdl file you added the change to, before loading
the grammar?
- Does the entry you're considering actually inherit from the type
you've put the constraint on? (Double check in lexicon.tdl,
rules.tdl, irules.tdl, lrules.tdl, whichever is relevant.)
- Do you have multiple types with the same name? If so, only the last
one will "count" -- it will overwrite what came before. You can use
the search function in emacs to check whether this it the case.
- Have you misspelled an outermost feature name (e.g., SYSNEM for
SYNSEM)?

## Related topics

- [How do I see what a type looks like with all of the constraints it
inherits from supertypes?](https://delph-in.github.io/docs/matrix/GeFaqExpandedType)
- [How do I look at fully specified lexical entries or
rules?](https://delph-in.github.io/docs/matrix/GeFaqViewEntry)
- [How do I see what definition the LKB has read in for a
type?](https://delph-in.github.io/docs/matrix/GeFaqViewType)
- [In which files does order matter?](https://delph-in.github.io/docs/matrix/GeFaqOrderMatters)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqForgottenConstraint/_edit)]{% endraw %}