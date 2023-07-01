{% raw %}# Grammar Engineering Frequently Asked Questions

## How do I see what definition the LKB has read in for a type?

In one of the following ways:

- From the LKB Top menu, select "View &gt; Type definition..." and
enter the type's identifier (the part before := in the .tdl file in
which it is defined). The LKB will display the information given
directly in the type definition, and none of the inherited
constraints.
- From the LKB Top menu, select "View &gt; Expanded type..." and enter
the type's identifier. The LKB will display all of the constraints
associated with the type, including those inherited from supertypes.
- From a window displaying a feature-structure, click on any type name
(in bold). The pop-up menu will have "Type definition" and "Expanded
type" as options.
- From a window displaying a type hierarchy, click on any type name
(in red). The pop-up menu will have "Type definition" and "Expanded
type" as options.

## Related topics

- [How do I look at fully specified lexical entries or
rules?](https://delph-in.github.io/docs/matrix/GeFaqViewEntry)
- [How do I browse the type hierarchy?](https://delph-in.github.io/docs/matrix/GeFaqViewHierarchy)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqViewType/_edit)]{% endraw %}