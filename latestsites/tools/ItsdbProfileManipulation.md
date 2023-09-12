{% raw %}# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

# Compressing a Test Suite

The **File\|Compress** menu compresses a profile by gzipping the files
that contain the data (i.e. all files with non-zero size except
**relations**). After being compressed [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) treats the data as read-only:
you can still browse , analyse and compare, but cannot reparse or
treebank. The status is set to **ro** (read-only). There is no way to
undo this from inside [\[incr tsdb()\]](http://www.delph-in.net/itsdb).
If you wish to decompress then you must ungzip the files externally.

A quick way of compressing a profile in this way using a shell is
(assuming you are in the profile):

     find . -size +0 -type f -not -name 'relations' -exec gzip {} \;

# Updating old profiles

The database schema has changed over the years. Occasionally, it may be necessary to update old profiles to conform with the current schema. The process is roughly as follows (see also https://delphinqa.ling.washington.edu/t/updating-old-srg-incr-tsdb-profiles/832/):

- Identify the differences between your outdated schema (the `Relations` file) and the current schema. You can get the current schema from any recent release (e.g. of the ERG, Matrix...)
```
diff old-relations-file current-relations-file
```

The diffs might look like this:

```
69a70
>   protocol :integer                     # [incr tsdb()] protocol version
108c109
<   aedges :integer                       # active items in chart (PAGE)
---
>   aedges :integer                       # active items in chart
```

The above means, the current schema has a line `protocol :integer                     # [incr tsdb()] protocol version`, which the old schema does not have, and that the `aedges :integer` lines, though are found in both schemas, have a difference in them (namely, in the old file, the comment contains the word "PAGE" and in the current schema, it does not). The differences in comments can be ignored. What is important is the differences in number of lines, i.e. new or disappeared lines. Those mean that the outdated schema must be updated with respect to the number of columns that some database files have.

- To update the old schema, you need to first find out which files the differences belong to. You can easily find this out by e.g. opening the current `Relations` file (the schema) and looking for the `protocol :integer` line. For example, you will find that the `protocol :integer` line belongs to the database file named `run`, and that it is the 4th column in that database file:

```
run:
  run-id :integer :key                  # unique test run identifier
  run-comment :string                   # descriptive narrative
  platform :string                      # implementation platform (version)
  protocol :integer                     # [incr tsdb()] protocol version
  tsdb :string                          # tsdb(1) (version) used
  application :string                   # application (version) used
  ... more lines below
```

- The next step is to look inside the `run` file. The @ signs indicate the columns. The file below is the one corresponding to an updated profile, so, it has all the columns corresponding to what is in the current `Relations` file:

```
1@@gcc 3.4@1@2.0 (23-jun-13; beta)@@PET(tom cheap v0.99.14svn_cm) [... more things here ] @complete
```

In the old profile, the same file might look like this:

```
2@@gcc 3.4@2.0 (19-aug-09; beta)@PET(tom cheap v0.99.14svn_cm) [... more things here ] @complete
```

Note the difference in the number of @-signs before the word "PET". This shows that the old file has fewer columns in the database than the current one. In particular, the additional column corresponding to the line `protocol :integer` in the current schema is missing in the old schema. It is column number 4 because there is three @-signs preceeding it in the current schema.

- Now all you need to do (for just this one item) is add the @ into the right place in the old, outdated schema, in order to update it:

```
2@@gcc 3.4@2.0 (19-aug-09; beta)@@PET(tom cheap v0.99.14svn_cm) [... more things here ] @complete
```

- Repeat the same process for all the diffs in all your outdated profiles. You need to do this for each item in each relevant file. NB: The SRG `util` folder has [some code which will do this automatically](https://github.com/delph-in/srg/blob/main/util/update_profile.py?raw=true), given the file name and the positions to insert new columns. 
- After you've done this for all relevant files, you need you "refresh" the profile using e.g. pydelphin tools:

```
delphin mkprof path-to-profile --relations current-relations-file --refresh
```

This [tutorial](https://delph-in.github.io/docs/tools/FftbTreebankUpdateTutorial) may be relevant for updating very old treebanks.

Last update: 2023-04-26 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/ItsdbProfileManipulation/_edit)]{% endraw %}