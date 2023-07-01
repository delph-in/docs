{% raw %}# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

Further, observe that [\[incr tsdb()\]](http://www.delph-in.net/itsdb)
database internals can change over time. For a given database (i.e.
profile), the database schema is defined by the file relations, which is
part of the profile directory. To cope with differences in database
versions over time, [\[incr tsdb()\]](http://www.delph-in.net/itsdb)
will always support *reading* from older formats, while *writing* is
typically limited to current versions.

# Reference

Contents

1. [Page Status](https://delph-in.github.io/docs/tools/ItsdbReference#Page_Status)
2. [Reference](https://delph-in.github.io/docs/tools/ItsdbReference#Reference)
   1. [Formatting Conventions](https://delph-in.github.io/docs/tools/ItsdbReference#Formatting_Conventions)
   2. [Database Files](https://delph-in.github.io/docs/tools/ItsdbReference#Database_Files)
      1. [Output File Format](https://delph-in.github.io/docs/tools/ItsdbReference#Output_File_Format)
      2. [Text Input Formats](https://delph-in.github.io/docs/tools/ItsdbReference#Text_Input_Formats)
         1. [Plain Text Input Format](https://delph-in.github.io/docs/tools/ItsdbReference#Plain_Text_Input_Format)
         2. [Bi-text Import Format](https://delph-in.github.io/docs/tools/ItsdbReference#Bi-text_Import_Format)
   3. [Well Formedness (i-wf)](https://delph-in.github.io/docs/tools/ItsdbReference#Well_Formedness_.28i-wf.29)
   4. [How to make a new Skeleton](https://delph-in.github.io/docs/tools/ItsdbReference#How_to_make_a_new_Skeleton)
      1. [How to make a Profile from a text input
file](https://delph-in.github.io/docs/tools/ItsdbReference#How_to_make_a_Profile_from_a_text_input_file)

This page includes some low level information about [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) ([ItsdbTop](https://delph-in.github.io/docs/tools/ItsdbTop)). You may
also be interested in [ItsdbCustomization](https://delph-in.github.io/docs/tools/ItsdbCustomization).

## Formatting Conventions

For all tables in \[[\[incr tsdb()\]](http://www.delph-in.net/itsdb)\],
the field (i.e. column) separator is '@', and a newline is a record
(i.e. row) separator. Where these characters must be used within a
field, they must be escaped:

|                   |      |
|:-----------------:|:----:|
| escape characters |      |
|         @         | \\s  |
|      newline      | \\n  |
|        \\         | \\\\ |

## Database Files

Some fields of the **item** file are:

|     |              |                       |            |
|-----|--------------|-----------------------|------------|
|     | i-difficulty | Difficulty            | 1          |
| 6:  | i-category   | Category              | S,XP       |
| 7:  | i-input      | String                | *parse me* |
| 8:  | i-wf         | Well Formedness       | 0,1,2      |
| 9:  | i-length     | String length (words) | integer    |
| 10: | i-comment    | Comment               |            |
| 11: | i-author     | Author                | uname      |
| 12: | i-date       | Date created          | 5-8-2003   |

An actual entry might look like this:

    1@csli@formal@none@1@S@Abrams works .@1@2@@@jul-98

Note that \[[\[incr tsdb()\]](http://www.delph-in.net/itsdb)\] does not
always check that the i-ids are unique, but they should always be kept
unique. Also, it is a good idea to keep the items sorted.

In the Hinoki project, the i-comment is used to give the source of the
utterance (definition sentence, example, other corpus), the ID in the
source corpus, and, for definition and examples sentences, some
information about the headword being defined or exemplified.

### Output File Format

It is possible to store information about desired outputs, for example
translations. They are stored in a skeleton's **output** file.

A minimal example of (Japanese) translations of the sentence shown in
the item file format is:

    1@@@@-1@-1@@エーブラムズ が 働く 。@@@-1@@
    1@@@@-1@-1@@エーブラムズ が 仕事 する 。@@@-1@@

|       |           |                                    |               |
|-------|-----------|------------------------------------|---------------|
| Field | Name      | Explanation                        | Example Value |
| 1:    | i-id      | Item for this output specification | integer       |
| 8:    | o-surface | Expected surface string            | string        |

All the fields are described in the **relations** file found in each
skeleton.

It is possible to have multiple correct outputs (e.g., multiple
reference translations).

### Text Input Formats

***This describes obsolete versions of the format --- revision coming as
soon as possible***

#### Plain Text Input Format

This file format allows you to record more information about the text in
an easy to manipulate format:

    [1010] +The Cathedral and the Bazaar
    [1030] Linux is subversive.

The file format is:

- one sentence per line
- each line optionally identified by \[sentencenumber\]
- headings, list items and other "non-sentences" are marked with a
  - vertical bar:

<!-- -->


            [1-2 |] Preikestolen

- XPs are marked with **+**
- non-grammatical input is marked with **\***

This can be used to make a profile, which contains an item file, by
[\[incr tsdb()\]](http://www.delph-in.net/itsdb), as described below.

#### Bi-text Import Format

- a sentence and its translations are grouped together, with each
group separated by an empty line

<!-- -->


    The Cathedral and the Bazaar
    伽藍 と バザール
    伽藍 と 勧工場
    
    Linux is subversive.
    リナックス は 、 既存 の 概念 を 打ち 砕く もの で ある 。

This can be used to create a profile (containing an item and output
file) as described below.

## Well Formedness (i-wf)

|       |                           |
|-------|:--------------------------|
| Value | Meaning                   |
| 0     | Illformed (Ungrammatical) |
| 1     | Wellformed (Grammatical)  |
| 2     | Ignored                   |

- **Wellformed** (Grammatical) is used to mark items that a grammar
should parse.
- **Illformed** (Ungrammatical) is used to mark items that a grammar
should not parse.
- **Ignored** is used to mark items in a profile that should currently
be ignored. For example, a Japanese newspaper corpus may contain
*[senryuu](/%5Bhttp%3A//en.wikipedia.org/wiki/Senryu)\]*, which is
currently beyond the scope of the grammar, and can be excluded when
treebanking or analyzing performance.

* * *

The grammticality judgements can be used to measure lack of coverage and
overgeneration, respectively:

- **Lack of Coverage**
  
  - test items (plus relevant properties) that are annotated as
grammatical but failed to parse;
- **Overgeneration**
  
  - list test items (plus relevant properties) that are tagged
ill-formed but accepted by the parser (i.e. were assigned at
least one analysis).

## How to make a new Skeleton

- Make an **item** file
- Make a new sub-directory with the **item** and **relations** files
in it
- Add the skeleton to **skeletons/Index.lisp**

<!-- -->


      ((:path . "newtest") (:content . "example test suite"))

### How to make a Profile from a text input file

- Create a plain text file with the sentences (one per line), e.g.
**newtest**
  
  - Make sure the encoding is what you want it to be (utf-8 is
recommended)
- Import the items in the testsuite using itsdb

<!-- -->


       file > import > Test items
       in-path/newtest
       out-dir/newtest

This makes a profile (**out-dir/newtest**) with an **item** file (with
default results for the fields, and numbering starting from 0 or 1) and
a **relations** file.

       file > import > Bi-text Items
       in-path/newtest
       out-dir/newtest

If there are translations, then it also makes an output file. This is
useful for automatically scoring machine translation.

- It gets confused if there are more than 9 translations ...

Last update: 2013-03-21 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/ItsdbReference/_edit)]{% endraw %}