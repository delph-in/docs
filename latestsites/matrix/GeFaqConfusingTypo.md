{% raw %}# Grammar Engineering Frequently Asked Questions

## I have a type/lexical entry/rule which doesn't seem to be inheriting a constraint from its supertype. What might be going on?

There are probably several possible causes for this, but here's one to
look out for:

If you have a typo in a feature name at the very highest level of the
feature structure (e.g., SYSNEM instead of SYNSEM in a lexical type),
the LKB will simply posit a new feature. Any constraints written below
that feature will be ineffective, since nothing else in the grammar is
looking for SYSNEM. If you're particularly unlucky, the new feature will
be ordered first, and you'll see what you're expecting to see when you
do View &gt; Type. You'd only notice that there's also a feature SYNSEM
(inherited from a supetype, with lots of constraints associated with it)
if you scroll down in the type window.

## Related Topics

- [How do I see what a type looks like with all of the constraints it
inherits from supertypes?](https://delph-in.github.io/docs/matrix/GeFaqExpandedType)
- [How do I look at fully specified lexical entries or
rules?](https://delph-in.github.io/docs/matrix/GeFaqViewEntry)
- [I'm trying to add a new feature, and the LKB doesn't like it. What
should I do?](https://delph-in.github.io/docs/matrix/GeFaqNewFeature)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqConfusingTypo/_edit)]{% endraw %}