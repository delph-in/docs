{% raw %}# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

This page is for listing wishlist items in \[incr tsdb()\]. Just because
they are here doesn't, of course, mean that anyone will implement them
for you, but we hope that this page will serve as a focus for
discussion.

- Change the name to something more easily pronounced by non-TCL
speakers.
- Find a user base able to appreciate the beauty and simplicity in the
software \_and\_ its name
- An undo button when treebanking.
- A way to create a skeleton from within the UI, rather than copying
files around in directories.
- Check the Relations file in Skeletons when the Skeletons root is set
and give a user-friendly error message when it is out of date.
Indeed, the fine system could even offer to update it to the current
version.
- Hybrid compare\|detail and compare parses functionality: In the
compare\|detail window a button that would send all of the parses
for a particular sentence from both the (g)old and new profiles,
color coded so that (g)old-only, shared, and new parses could be
distinguished. Requires a new version of the discriminants tool that
does not rely on rebuilding the trees but works only from the
derivations as stored.
- Compare\|detail under tsql condition not hiding numbers that don't
match. In particular, when tsql condition is unanalyzed and
compare\|detail is invoked, it would be nice to see the number of
parses that were there in the other profile.
- Canned queries for items which parsed in the (g)old profile but not
in the new, items which parse in the new profile but not in the
(g)old one, items which parse in both but have increased in
ambiguity, items which parse in both but have decreased in
ambiguity.
- Ability to measure differences in spurious ambiguity, i.e., compare
two profiles and determine for which items the number of distinct
MRSs has stayed the same while the number of distinct derivations
has changed. Or, even better, to detect items which are assigned the
same set of distinct MRSs, using more or fewer distinct derivations.
- Ability to trace MRSs from the Compare \| Detail display (with
Intersection = MRS) to the derivations that they are associated
with.
- Option under TSQL Condition for \`error != ""' to make it easier to
browse well-formed items that gave rise to errors. (This is because
lexical rule bugs usually manifest as errors, to [\[incr
tsdb()\]](http://www.delph-in.net/itsdb).)

Last update: 2012-08-07 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ItsdbWishlist/_edit)]{% endraw %}