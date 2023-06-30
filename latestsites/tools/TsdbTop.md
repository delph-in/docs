{% raw %}# A Treatise on the Nature of TSDB and ancillary bits and pieces

What follows are the notes of a recent [Expedition](/ArneSkj%C3%A6rholt)
into the depth of TSDB, in the months of August and September MMXIV.
These notes may be incomplete, misleading, or flat-out wrong, but are
provided here in the hope that they may be of some use to future
travellers.

## The Lay of the Land or, the database schema

TSDB is, when you get down to it, just a relational database. But
instead of using a standard SQL database, the data are stored in flat
text files on disk. A TSDB profile (that is, a database) is stored in a
folder. The file relations describes the database schema of this
profile; its syntax is described in the [TSNLP User Manual (Volume
2)](http://www.delph-in.net/tsnlp/ftp/manual/volume2.ps.gz) (p. 27).
Individual relations (or tables, if you prefer) are stored in separate
files with the same name as the relation. The SQL-like query language
TSQL, used to query profiles, is also documented here (pp. 26-27).

A practical upshot of this idiosyncracy is that if your needs are
modest, the database can be queried with standard Unix text processing
tools such as cut and grep, AWK, and/or Perl. The relation files contain
a single row per line, with fields separated by the '@' character.

A [RedWoods](/RedWoods)-style profile contains the following relations:
analysis, daughter, decision, edge, fold, item, item-phenomenon,
item-set, output, parameter, parse, phenomenon, preference, result,
rule, run, score, set, tree, update. Not all of these are understood by
yr hmbl crrspndnt, but I will describe what I know.

An *item* is a sentence. This relation contains various things,
including the input sentence itself. Shared information for a parse run
of the sentence is stored in the *parse* relation, with individual
parser outputs stored in the *result* table.

Annotations of sentences are linked to rows in the *parse* table (since
annotation is the selection of a gold parse from a parse forest),
through the *tree* relation. However, since the annotator may choose to
only partially disambiguate a parse forest, *tree* only contains shared
information (including a version field, so that old annotations don't
have to be overwritten on subsequent annotation passes). Selected trees
(in the *result* table) are linked to in *preference* (which also links
back to *tree*, of course).

## Into the Wild or, the Lisp API

If your needs are more specialised, your most likely port of call is the
Lisp API. A Lisp session can be started with the M-x logon command (cf.
[LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation)), but this runs a precompiled
binary which may or may not have been updated recently. If your site has
a licence for the Allegro Common Lisp compiler (cf.
[LogonExtras](https://delph-in.github.io/docs/tools/LogonExtras), your local LOGON bodhisattva), the system
can also be started as follows:

1. In emacs, run M-x lisp. This will start the Lisp REPL, but not LKB
or [itsdb](/itsdb) .
2. Execute (lmt) (short for *Load Machine Translation system* I
believe)
3. Read in a grammar with rsa(). For English (rsa :erg) or (rsa :terg)
(loading either the most recent release of the ERG or the trunk
version) is most likely what you want, or (rsa :deepbank) if working
with [DeepBank](https://delph-in.github.io/docs/garage/DeepBank).

If you need to do slightly different things (or are merely curious),
lmt() and rsa() are defined in $LOGONROOT/dot.clinit.cl.

If you want to start the system *without* the GUI (if you are, say,
interacting with the system on a big-iron machine, across a
temperamental intercontinental internet link, avoiding X forwarding and
running emacs -nw in a screen \[or tmux\] session is likely a good idea)
execute (setf (system:getenv "DISPLAY") nil) in between steps 1 and 2.

Next, you will probably want to iterate over the items in some profile.
This is most easily accomplished by leveraging the GUI code (but without
running the actual GUI stuff \[this code clearly predates the spread of
the gospel of MVC beyond the borders of the Smalltalk nation\]).
Observe:

    (loop
        with frame = (browse-trees profile :runp nil)
        for id in (lkb:compare-frame-ids frame)
        for nil = (browse-tree profile id frame :runp nil)
        do (format t "~A~%" id))

The GUI code is really quite chatty. It can be silenced by adding the
declaration with excl:\*initial-terminal-io\* = nil before the
invocation of browse-trees().

The compare-frame class contains a number of data members that are
useful. One of these we've already seen, compare-frame-ids which is a
list containing the ids of the items being browsed over. Also of
interest are compare-frame-in and compare-frame-out which contain parses
selected and not selected, respectively, for the current item (mnemonic:
the parses *in* the set of selected parses and those *out*side the set.
For a full list, see the class declaration in
$LOGONROOT/lingo/lkb/src/ACL\_specific/compare.lsp (lines 500-621 at the
time of writing. Grep for define-application-frame).

Your specific use-case may not be directly supported by compare-frame
(or it may be, you just can't find it; more on this in a moment), and
some of the information you require may be not be in its data members.
However you will likely find code similar enough (or even identical!) to
your needs in the body of browse-trees() or, more likely, browse-tree().
However both of these functions are very tightly coupled code, with data
model manipulations, application control and GUI logic intermixed. In
particular browse-tree() is perhaps a tall order to comprehend in its
full 850-line, non-Euclidean glory, and a more expedient approach may be
to pick useful bits of code from the bowels of these functions and
extract them to the comfort of your own code.

A final useful trick is liberal use of the ELI mode's *go to definition*
functionality (bound by default to C-c .), which takes you to the source
location where any function, class or variable is defined.

Last update: 2023-06-14 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/TsdbTop/_edit)]{% endraw %}