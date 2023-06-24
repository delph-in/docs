{% raw %}# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

# Overview

Information here describes the syntax-based discriminants. This mode can
be chosen as follows:

    (setf lkb::*tree-discriminants-mode* :classic)

The default discriminant mode is :classic, but in the LOGON distribution
it defaults to :modern. This is to enable discriminant-based MRS
comparison, which is also applicable to parsers other than the LKB or
PET (e.g. when using MRS-enabled XLE grammars).

# .tsdbrc

Create a ".tsdbrc" file to set options for treebanking. Dan highly
suggests setting the number of analyses and results to 500; 100 is too
few and 1000 is no fun. You will need 2Gb+ of memory for this task, so
if you don't have this much, find another machine.

    (setf tsdb::*tsdb-maximal-number-of-results* 500)
    (setf tsdb::*tsdb-maximal-number-of-analyses* 500)

# Links

- [/ItsdbAnnotation](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbAnnotation)
  
  - Selecting and rejecting parses
- [/ItsdbUpdating](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbUpdating)
  
  - Automatic and Interactive updating to a new grammar
- [/ItsdbExporting](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbExporting)
  
  - Exporting data from treebanks, as trees, (R)MRSs, dependencies
and so on
  - Normalizing treebanks (e.g. thinnning)
- [/ItsdbModeling](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbModeling)
  
  - Creating and scoring stochastic models

# Exploring a Treebank with the [incr tsdb()] GUI

If you have an already treebanked corpus (such as the ones that come with the ERG releases), you can look at the gold trees using the [incr tsdb()] graphical interface. In the [incr tsdb()] podium, select the treebank profile and then go to Browse-->Results. To access the gold tree for a particular example, first click on the corresponding number in the "derivation" column. A window will open displaying the tree in the bracketed text format. Click on that text line, and you should see the tree visualization.

Last update: 2023-06-23 by Francis Bond [[edit](https://github.com/delph-in/docs/wiki/ItsdbTreebanking/_edit)]{% endraw %}