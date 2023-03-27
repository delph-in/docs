{% raw %}# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

# Annotation

This page describes how to treebank with [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) ([ItsdbTop](https://delph-in.github.io/docs/tools/ItsdbTop)), as well
as how to normalize the annotated profile.

[\[incr tsdb()\]](http://www.delph-in.net/itsdb) supports Redwoods-style
treebanking, from the *Trees* menu. It has been used to produce the
Redwoods ([RedwoodsTop](https://delph-in.github.io/docs/garage/RedwoodsTop)) and Hinoki treebanks. You can
annotate a corpus; update an annotated corpus to a new grammar; and
train statistical models on the treebanked corpora.

Normally only active and deduced discriminants are written out. You can
write out all discriminants by setting
\*redwoods-record-void-discriminants-p\* to t when you are in the tsdb
package.

After selecting a profile, *Trees \| Annotate*, will bring you into the
interface for compiling a treebank. You must have have the same grammar
loaded in the LKB ([LkbTop](https://delph-in.github.io/docs/tools/LkbTop)) that was used to parse the profile
because the system uses the grammar to do the reconstruction of the
parse trees.

The annotator selects the correct analysis (or, occasionally, rejects
all analyses). Selection is done through a choice of discriminants. The
system selects features that distinguish between different parses, and
the annotator selects or rejects the features until only one parse
remains. The number of decisions for each sentence is normally around
log\_2 of the number of parses, although sometimes a single decision can
reduce the number of remaining parses by more or less than half. In
general, even a sentence with 5,000 parses only requires around 12
decisions.

After you completely disambiguate, in the left-hand-side window you will
see the elementary dependency structures displayed underneath the tree.
Quantifiers and messages are suppressed (by default: see
/src/mrs/dependencies.lisp for the configuration options).

The dependencies are color coded:

- Blue: Good dependency constructed.
- Orange: Fragmented dependency constructed.
- Red: Cyclic.

### Recommended Settings

- Number of results stored: 500 ---
(setf tsdb::\*tsdb-maximal-number-of-results\* 500)
  
  - when you have a model, the good parse is almost always in the
top 500, and annotation is much quicker.

### Updating from an old grammar

When updating from gold to new, the first step is to identify the gold
profile as gold by middle-clicking on it in the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) window (turning that line to
gold color; if you don't have a middle button, click on Compare--Source
Database to choose the gold profile), and to identify the new profile as
the one to be updated, by left-clicking on it (turning that line's color
to blue). Then in that window, click on Trees--Update, which will launch
the automatic updating stage, which should take a while, but probably
less than an hour for this profile. Alternatively you can use the
'redwoods' export script to achieve this.

Once this is done, you can click on Trees--Summarize--Annotations to get
a table which will show how many of your items were fully disambiguated
based on the gold discriminants (t-active=1), and how many need manual
disambiguation (unannotated), along with other information. Now you need
to deal with the remaining unannotated items manually. To do this, click
on Trees--Switches--Automatic Update to turn this switch off. Then to
restrict yourself to only the unannotated items, click on Options--TSQL
Condition--Unannotated. Now click on Update, and after a short pause,
the treebanking window will appear, presenting you with the first of the
items that need manual attention. In many cases, the previous
discriminants will have served to partially disambiguate, leaving you
with a few remaining new choices to make, but in some cases it will look
like you have to start over (either because this item wasn't even parsed
previously, or because the discriminants are no longer useful). Before
you groan in these cases, try hitting the magic Reset button (next to
the Clear button), which will often get you a partially or fully
disambiguated result after all. This resolves the tree on the basis of
only manually selected discriminants from the gold profile, rather than
deduced discriminants as well (which is the norm), meaning that it is
less likely to fail (with fewer discriminants) but also results in less
disambiguation.

Once you've found your way to the right tree by selecting appropriate
discriminants, hit Save as usual, which stores your decisions, and moves
you to the next unannotated item.

It is easy to confuse oneself with that Options--TSQL Condition setting,
so once you're done with a stage of updating, it's good to remember to
reset that constraint to No Condition before (say) asking for the
Trees--Summarize--Annotations chart again, or you won't get information
on all of the items in the profile.

### Normalizing

When you annotate an item, the old unannotated entry for that item in
the database is not deleted, but rather the database is augmented with
another entry recording the updated information about that item, along
with a version indicator showing that the annotated entry is more recent
than the original one. But this version annotation is not dynamically
queried when you impose conditions, so to make the version information
usable (e.g. to be able to run queries to see unannotated items by
selecting Options \| TSQL condition \| Unannotated) you have to
periodically "normalize" the database.

You normalize by selecting *Trees \| Normalize* and give a name for the
new normalized database (since the old one will not be overwritten).
This step should not be too time-consuming as long as your databases has
fewer than 3000 items in them (recommended). In Hinoki, we find a
database with 2000 items and a maximum of 5,000 results is quite slow,
taking several hours (2005-03-25).

**NOTE:** Remember to set the *Options \| TSQL Condition* to no
condition, otherwise only some trees will be normalized.

**NOTE:** Normalizing gets slightly quicker if you iconicize emacs, and
is much quicker if you run it as a batch.

### Thinning Normalizing

This saves only the results for good trees, making a much smaller
profile.

When you thinning normalize it is possible to save MRSs and phrase
structure trees for the treebanked sentences by setting the following:

    (setf tsdb::*redwoods-semantix-hook* "mrs::mrs-get-string")
    (setf tsdb::*redwoods-trees-hook* "lkb::parse-tree-structure")

## Clear Cutting

If you for some reason you wish to delete all the trees (e.g., you made
a false start with the update process for Run 2) you can (verrrrryyyy
carefully) discard the new annotations by selecting *Trees \| Clear
Cut*. Be certain (as in positive) that you are removing these
annotations for Run 2, not the hand-coded real annotations you
constructed painstakingly for Run 1, as clear cutting fells all the
trees.

Last update: 2012-08-07 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ItsdbTreebanking_ItsdbAnnotation/_edit)]{% endraw %}