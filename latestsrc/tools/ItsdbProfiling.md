{% raw %}# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

Contents

1. [Page Status](https://delph-in.github.io/docs/tools/ItsdbProfiling#Page_Status)
   1. 1. [Parsing](https://delph-in.github.io/docs/tools/ItsdbProfiling#Parsing)
   1. 2. [Generation](https://delph-in.github.io/docs/tools/ItsdbProfiling#Generation)
   1. 3. [Transfer](https://delph-in.github.io/docs/tools/ItsdbProfiling#Transfer)
   1. 4. [Translation](https://delph-in.github.io/docs/tools/ItsdbProfiling#Translation)
   1. 5. [Preprocessing](https://delph-in.github.io/docs/tools/ItsdbProfiling#Preprocessing)

### Parsing

You can generate from a [profile](https://delph-in.github.io/docs/tools/ItsdbProfile) by selecting it, loading
a grammar and then doing Process--All Items.

The default is to parse with the grammar loaded in the lkb/tsdb
combination, but you can also parse with client grammars (see
[ItsdbDistributedProcessing](https://delph-in.github.io/docs/tools/ItsdbDistributedProcessing)).

You can store MRSs when you parse with either
(setf tsdb::\*tsdb-semantix-hook\* "mrs::get-mrs-string") or by
selecting **Process\|Switches\|write 'mrs' Field**.

### Generation

You can generate from a profile with stored MRSes (by, e.g. thinning
normalize with
(setf tsdb::\*redwoods-semantix-hook\* "mrs::get-mrs-string").

First select the profile with MRSes as the Gold Profile (middle click;
if you don't have a middle button, click on Compare--Source Database to
choose the gold profile). Then create a new profile with the same
skeleton, and select it (left click). Set Process---Switches---generate.
Make sure you have a grammar loaded that can generate. Then do
Process--All Items.

You can check whether the generated output includes the input parse as
follows. Select the profile with MRSes as the Gold Profile (middle
click), and then select the generated profile. Change the
Compare --- Switches to Subset Comparison and Best Parse Only. Change
Compare   --- Intersection to derivation, and select Compare --- Detail.

### Transfer

You can transfer (MRS to MRS translation) from a profile with stored
MRSes.

First select the profile with MRSes as the Gold Profile (middle click).
Then create a new profile with the same skeleton, and select it (left
click). Set Process---Switches---transfer. Make sure you have a transfer
grammar loaded. Then do Process--All Items.

### Translation

In theory, you can translate (parse, transfer and generate) in one fell
swoop.

### Preprocessing

You can pass the items to be parsed through a preprocessor by defining
it in the cpu. E.g.

      (make-cpu
        :host (short-site-name)
        :spawn "/path/to/cheap"
        :options (list "-tsdb"  "-tok=yy" "-packing=7" "-default-les"
                       (format nil "~a/grammars/japanese/japanese.grm" %delphin%))
        :preprocessor "lkb::chasen-preprocess-for-pet"
        :class :chasen :grammar "jacy-chasen" :name "jacy-chasen" :threshold 2)
       (make-cpu
        :host (short-site-name)
        :spawn "/path/to/cheap"
        :options (list "-tsdb"  "-tok=yy" "-packing=7" "-default-les"
                       (format nil "~a/grammars/japanese/japanese.grm" %delphin%))
        :preprocessor "tsdb::rasp-preprocess-for-pet"
        :class :rasp :grammar "jacy-rasp" :name "jacy-rasp" :threshold 2)

chasen-preprocess-for-pet and rasp-preprocess-for-pet are lisp functions
that take two arguments, the item itself and an optional tagger, and
return a tokenized string suitable for **pet**: in this case the
yy-tokenization.

chasen-preprocess-for-pet calls an external morphological analyzer
([ChaSen](/ChaSen)) and reformats the output.

rasp-preprocess-for-pet assumes the input is of the form *word\_pos
word\_pos* and associates each word with its POS in the input chart.

Last update: 2024-05-10 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/ItsdbProfiling/_edit)]{% endraw %}