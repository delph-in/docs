{% raw %}This page is a brief introduction to the *profiles* used by [\[incr
tsdb()\]](http://www.delph-in.net/itsdb). For more information, see the
[User & Reference
Manual](http://www.delph-in.net/itsdb/publications/manual.pdf).

# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

Contents

1. [Page Status](https://delph-in.github.io/docs/tools/ItsdbProfile#Page_Status)
2. [Overview](https://delph-in.github.io/docs/tools/ItsdbProfile#Overview)
   1. [item](https://delph-in.github.io/docs/tools/ItsdbProfile#item)
   2. [run](https://delph-in.github.io/docs/tools/ItsdbProfile#run)
   3. [parse](https://delph-in.github.io/docs/tools/ItsdbProfile#parse)
   4. [result](https://delph-in.github.io/docs/tools/ItsdbProfile#result)

# Overview

A Competence and Performance *Profile* is a test suite instance that
includes competence and performance information from a processing system
(such as a parser or generator) and a grammar (and possibly
pre-processor).

A profile typically is made up of a directory consisting of a database
stored as several text files. The format of the files is controlled by
the relations file. The most up-to-date relations file should be here:
<http://svn.emmtee.net/trunk/lingo/lkb/src/tsdb/skeletons/english/Relations>.
Within each file, the rows are lines, and the columns are separated by
the **@** mark.

Profiles can be manipulated within [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) proper (the default) and some
other [tools](https://delph-in.github.io/docs/tools/ToolsTop).

Some of the files are described below. Note, however, that the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) database schema is subject to
occassional revision; the [canonical current
version](http://svn.emmtee.net/trunk/lingo/lkb/src/tsdb/skeletons/english/Relations)
is available through SVN.

## item

**Schema**

    item:
      i-id :integer :key
      i-origin :string
      i-register :string
      i-format :string
      i-difficulty :integer
      i-category :string
      i-input :string
      i-tokens :string
      i-gloss :string
      i-translation :string
      i-wf :integer
      i-length :integer
      i-comment :string
      i-author :string
      i-date :date

This is the input file. The actual input is typically column 7: i-input.
If it is tokenized/pre-processed before processing, the results of this
should go into field 8: i-tokens.

## run

This gives some information about the configuration of the actual
test-run, including the processing engine and grammar versions.

    run:
      run-id :integer :key                  # unique test run identifier
      run-comment :string                   # descriptive narrative
      platform :string                      # implementation platform (version)
      tsdb :string                          # tsdb(1) (version) used
      application :string                   # application (version) used
      environment :string                   # application-specific information
      grammar :string                       # grammar (version) used
      avms :integer                         # number of avm types in image
      sorts :integer                        # number of sort types in image
      templates :integer                    # number of templates in image
      lexicon :integer                      # number of lexical entries
      lrules :integer                       # number of lexical rules
      rules :integer                        # number of (non-lexical) rules
      user :string                          # user who did the test run
      host :string                          # machine used for this run
      os :string                            # operating system (version)
      start :date                           # start time of this test run
      end :date                             # end time for this test run
      items :integer                        # number of test items in this run
      status :string                        # exit status (PVM only)

## parse

This gives information about the entire process for a single input item:
this information is mainly used for competence/performance profiling.
The i-id should be linked to the id in item.

    parse:
      parse-id :integer :key                # unique parse identifier
      run-id :integer :key                  # test run for this parse
      i-id :integer :key                    # item parsed
      p-input :string                       # initial (pre-processed) parser input
      p-tokens :string                      # internal parser input: lexical lookup
      readings :integer                     # number of readings obtained
      first :integer                        # time to find first reading (msec)
      total :integer                        # total time for parsing (msec)
      tcpu :integer                         # total (cpu) processing time (msec)
      tgc :integer                          # gc time used (msec)
      treal :integer                        # overall real time (msec)
      words :integer                        # lexical entries retrieved
      l-stasks :integer                     # successful lexical rule applications
      p-ctasks :integer                     # parser contemplated tasks (LKB)
      p-ftasks :integer                     # parser filtered tasks
      p-etasks :integer                     # parser executed tasks
      p-stasks :integer                     # parser succeeding tasks
      aedges :integer                       # active items in chart (PAGE)
      pedges :integer                       # passive items in chart
      raedges :integer                      # active items contributing to result
      rpedges :integer                      # passive items contributing to result
      unifications :integer                 # number of (node) unifications
      copies :integer                       # number of (node) copy operations
      conses :integer                       # cons() cells allocated
      symbols :integer                      # symbols allocated
      others :integer                       # bytes of memory allocated
      gcs :integer                          # number of garbage collections
      i-load :integer                       # initial load (start of parse)
      a-load :integer                       # average load
      date :date                            # date and time of parse
      error :string                         # error string (if applicable |:-)
      comment :string                       # application-specific comment

## result

This stores the actual result of the processing. There may be multiple
results for a single input. The i-id should be linked to the id in item,
the parse-id to the is in parse. Typically this file will be used as
input by any post-processors, such as exporting, transfer, generation
and so on.

    result:
      parse-id :integer :key                # parse for this result
      result-id :integer                    # unique result identifier
      time :integer                         # time to find this result (msec)
      r-ctasks :integer                     # parser contemplated tasks
      r-ftasks :integer                     # parser filtered tasks
      r-etasks :integer                     # parser executed tasks
      r-stasks :integer                     # parser succeeding tasks
      size :integer                         # size of feature structure
      r-aedges :integer                     # active items for this result
      r-pedges :integer                     # passive items in this result
      derivation :string                    # derivation tree for this reading
      surface :string                       # surface string (e.g. realization)
      tree :string                          # phrase structure tree (CSLI labels)
      mrs :string                           # mrs for this reading
      flags :string                         # arbitrary annotation (e.g. BLEU)

Last update: 2012-08-07 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ItsdbProfile/_edit)]{% endraw %}