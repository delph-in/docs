{% raw %}# Grammar Engineering Frequently Asked Questions

### Some of my relations/qeqs aren't showing up in the MRS for the whole parse. Why not?

If relations or qeqs that are contributed by lexical entries or rules
are not showing up in the MRS for the whole parse, it is almost
certainly because you have a broken [diff-list](https://delph-in.github.io/docs/matrix/GeFaqDiffList) append
somewhere in the structure. The most common way for a diff-list append
to break is for one of the arguments to be underspecified as to its
length. You should check that the RELS and HCONS lists inside CONT on
each lexical entry and the RELS and HCONS lists inside C-CONT (**NB**:
not CONT) of each lexical rule and phrase structure rule are bounded.
The easiest way to do this is with the &lt;! !&gt; notation:

- &lt;! !&gt; a diff-list with nothing on it.
- &lt;! top !&gt; a diff-list with one thing on it.
- &lt;! top, top !&gt; a diff-list with two things on it.
- &lt;! top, ... !&gt; a diff-list with at least one thing on it:
**underconstrained**!
- \[ LIST.FIRST top \] a diff-list with top as its first thing:
**underconstrained**!

Some of the types defined in matrix.tdl already sufficiently specify the
length of the RELS and/or HCONS lists. Here is a sample (as of
20-May-2005, courtesy of Jonathan Pool):

- **lexeme-to-word-rule**
- **no-ccont-lex-rule**
- **basic-head-subj-phrase**
- **basic-head-spec-phrase**
- **basic-head-comp-phrase**
- **basic-head-opt-comp-phrase**
- **basic-extracted-comp-phrase**
- **extracted-adj-phrase**
- **scopal-mod-phrase**
- **isect-mod-phrase**
- **declarative-clause**
- **basic-bare-np-phrase**
- **no-hcons-lex-item**
- **scopal-mod-lex**
- **basic-determiner-lex**
- **basic-subord-conjunction-lex**
- **single-rel-lex-item**

In most cases, your rules and lexical types should inherit from one of
the above. When they don't, you'll need to be sure to constrain the
length of the RELS and HCONS lists.

## Related topics

- [What's a difference list, and why do we use them?](https://delph-in.github.io/docs/matrix/GeFaqDiffList)
- [The LKB says "Cyclic check found cycle at ...". What does this mean
and how do I debug it?](https://delph-in.github.io/docs/matrix/GeFaqCyclicCheck)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqMissingRels/_edit)]{% endraw %}