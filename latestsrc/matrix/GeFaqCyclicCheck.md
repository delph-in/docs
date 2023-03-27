{% raw %}# Grammar Engineering Frequently Asked Questions

## The LKB says "Cyclic check found cycle at ...". What does this mean and how do I debug it?

The feature structures are supposed to be directed acyclic graphs, that
is, you can't follow a path and get back to the same place. The
following constraint is cyclic, and therefore illegal:

    foo := basic-verb-lex &
      [ SYNSEM #synsem & 
          [ LOCAL.CAT.VAL.COMPS < #synsem > ]].

That would seem an unlikely thing for anyone to type. A more frequent
cause of cycles is in diff-lists. If you are getting this error, there's
a reasonably good chance that you're over-identifying the values of
features that are involved in a diff-list append. Alternatively, a type
and its supertype might be saying inconsistent things about the length
of the diff-list. Check features such as RELS, HCONS, SLASH, QUE, and
REL.

## Related topics

- [What's a difference list, and why do we use them?](https://delph-in.github.io/docs/matrix/GeFaqDiffList)
- [Some of my relations/qeqs aren't showing up in the MRS for the
whole parse. Why not?](https://delph-in.github.io/docs/matrix/GeFaqMissingRels)

[Back to the Grammar Engineering FAQ](/GrammarEngineeringFaq).

Last update: 2012-08-14 by NedLetcher [[edit](https://github.com/delph-in/docs/wiki/GeFaqCyclicCheck/_edit)]{% endraw %}