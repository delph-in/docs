{% raw %}Some ways of customizing [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) ([ItsdbTop](https://delph-in.github.io/docs/tools/ItsdbTop))

# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

## The .tsdbrc file

- To make treebanking faster:

<!-- -->


    (setf *tsdb-cache-connections-p* t)

- To set the database home:

<!-- -->


    (tsdb:tsdb :home "/home/oe/src/itsdb/src/tsdb/home")

- To set the location of skeletons

<!-- -->


    (tsdb:tsdb :skeletons "/home/oe/src/lkb/src/tsdb/skeletons/english")

- To set what gets exported:

<!-- -->


    (setf tsdb::*redwoods-export-values*
        '(:derivation :tree :avm :mrs :indexed :prolog :xml :rmrs  :dependencies :triples))

- To save MRSes when you parse (or generate) (recommended only if you
save few results: see \*tsdb-maximal-number-of-results\*)

<!-- -->


    (setf tsdb::*tsdb-semantix-hook* "mrs::get-mrs-string")

- To save phrase structure trees when you parse (or generate)

<!-- -->


    (setf *tsdb-trees-hook* "lkb::parse-tree-structure")

\* To save MRSes when using the parse/generate scripts supply

    (setf tsdb::*tsdb-write-mrs-p* t)

- To save MRSes when you export (recommended for thinning exports)

<!-- -->


    (setf tsdb::*redwoods-semantix-hook* "mrs::get-mrs-string")

- Maximum number of (passive) edges used when parsing

<!-- -->


    (setf tsdb::*tsdb-maximal-number-of-edges* 10000) 

- Maximum number of detailed results saved (derivation trees etc.)

<!-- -->


    (setf tsdb::*tsdb-maximal-number-of-results* 1000)

- To include (or not) parses marked as dis-preferred when exporting:

<!-- -->


    (setf *redwoods-export-bad-trees-p* t)

- To set the separator used in the treebanking annotation window
(compare)

<!-- -->


    (setq *tree-discriminants-separator* " || ")

- To customize instance names proposed for new test suites

<!-- -->


    (setf tsdb::*tsdb-instance-template* "hinoki/%t/%d")

Values include:

    (#\g grammar), (#\v version). (#\t skeleton), (#\d date), (#\s system), (#\% "%")

Last update: 2012-08-07 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ItsdbCustomization/_edit)]{% endraw %}