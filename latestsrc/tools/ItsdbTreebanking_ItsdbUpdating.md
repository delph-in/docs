{% raw %}# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

Contents

1. [Page Status](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbUpdating#Page_Status)
2. [Updating](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbUpdating#Updating)
   1. [Fully Automatic Update](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbUpdating#Fully_Automatic_Update)
   2. [Interactive Update](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbUpdating#Interactive_Update)

# Updating

One of the defining properties of the Redwoods treebanks is that they
are dynamic: the treebank can be updated when the grammar changes.

Because the discriminants are saved for each parse forest, even when the
grammar changes, re-annotation is only necessary in cases where either
the parse has become more ambiguous, so new decisions have to be made,
or changes in rules or lexical items have made the parse so different
that the earlier discriminants are not applicable.

Updating is a two step process: Fully Automatic (which will annotate all
trees that are uniquely determined) and Interactive (which will present
the annotator with any new decisions that need to be made).

## Fully Automatic Update

1. Select the gold standard profile (middle button; if you don't have a
middle button, click on Compare--Source Database to choose the gold
profile) something.n
2. Select the target profile (Left button) something/grammar
3. Load the same grammar as the target profile (rsa "japanese")
4. Set *Trees \| Switches \| Automatic Update*, and nothing else.
5. Select *Trees \| Update*
6. Wait for a tree annotation window to pop up ...
7. The updates are color coded:
   - Magenta: A single correct parse was found
   - Blue: There was only one parse but it was not one that was
determined by the gold annotations
   - Black: There are still remaining ambiguities

You do your annotation on Run 1 of some test suite TS with version A of
the grammar. Then change the grammar to produce version B. Create a new
instance of the test suite TS for Run 2, and *Process \| All Items*

- using grammar version B. Next, select Run 1 as your gold

standard (middle click), select Run 2 as the current database (left
click), make sure version B of the grammar is loaded into the LKB, make
sure that *Trees \| Switches \| Automatic Update* is selected, and then
select *Trees \| Update*. This will cause the tree annotation window to
appear, and begin zooming through your items, incorporating all
annotations that it can from the original treebank in Run 1, and adding
those annotations to Run 2.

This will give all the sentences that satisfy the update-match-p()
predicate (defined in lkb/src/tsdb/lisp/redwoods.lisp). The default is
inputs for which the recorded discriminants fully disambiguate, where
there is more than one reading, or those where there is only one
reading, and it is the same as before.

      ;; during updates, a `save' match is indicated by the following conditions:
      ;;
      ;;   - the current item has not been tree annotated already;
      ;;   - the number of active trees in the current set equals the number of
      ;;     active trees in the gold set;
      ;;   - either the current item has more than one reading, or that single one
      ;;     reading has the exact same derivation as the preferred tree from the
      ;;     gold set.
      ;;   - also, when in `exact-match' update mode, be content if there is one
      ;;     unique result.
      ;;

*Note* that has not been tree annotated *does not mean the same as
unannotated*. The former means has not been touched before (e.g. there
is no entry in the tree file) the latter means that it has been touched
(e.g. there is an entry in the tree file with the value -1).

## Interactive Update

Treebank only those places that have changed

1. Select the gold standard profile (middle button) something.n
2. Select the target profile (Left button) something/grammar
3. Load the same grammar as the target profile (rsa "japanese")
4. **Unset** *Trees \| Switches \| Automatic Update*
5. **Set** *Options \| TSQL Condition \| Unannotated*
6. Select *Trees \| Update*

In this stage, the annotator can annotate any trees that have changed,
exploiting any relevant existing decisions.

Last update: 2014-04-08 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/ItsdbTreebanking_ItsdbUpdating/_edit)]{% endraw %}