{% raw %}# Grammar Engineering Frequently Asked Questions

### What's a difference list, and why do we use them?

The tdl formalism does not allow the statement of relational
constraints. That is, particular values can be equal to other values,
but not equal to some function of other values. One kind of relational
constraint that we find very useful nonetheless is append.

Two lists can be appended using just unification if the the length of
the first is known:

    [ FEAT1 < #val1, #val2 >,
      FEAT2 #list,
      RESULT < #val1, #val2 . #list > ].

This won't work, however, if the length of the first list is unknown.
Instead, we use difference lists, which are a means of embedded a list
in a structure with a pointer to the end. The matrix type diff-list is
defined as follows:

    diff-list := avm &
      [ LIST list,
        LAST list ].

The Matrix defines the following type to illustrate how diff-list append
works, though of course any particular case where you want a diff-list
append you won't be able to inherit from this type (the feature names,
geometry etc will be wrong):

    dl-append := avm & [APPARG1 [LIST #first,       
                                 LAST #between],
                        APPARG2 [LIST #between,
                                 LAST #last],
                        RESULT  [LIST #first,
                                 LAST #last]].

Diff-lists are currently used in the Matrix for the values of the
semantic features RELS and HCONS and for the long-distance dependency
features SLASH, QUE, and REL. For the most part, the diff-list appends
involved in handling these features appropriately should all be taken
care of in matrix.tdl. An exception would be if you are defining a new
phrase type, in which case you would need to make sure you either
inherit from an appropriate matrix type which does the appends or code
them in.

Because of the (admittedly somewhat subtle) logic of diff-list appends,
constraints involving diff-list valued features can cause problems that
are difficult to debug. In some cases, everything will unify just fine,
but not give you the result that you were expecting. For more
information, see the related topics links below.

### Related topics

- [The LKB says "Cyclic check found cycle at ...". What does this mean
and how do I debug it?](https://delph-in.github.io/docs/matrix/GeFaqCyclicCheck)
- [Some of my relations/qeqs aren't showing up in the MRS for the
whole parse. Why not?](https://delph-in.github.io/docs/matrix/GeFaqMissingRels)

[Back to the Grammar Engineering FAQ](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ).

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GeFaqDiffList/_edit)]{% endraw %}