{% raw %}Contents

1. [Setting up Jacy](https://delph-in.github.io/docs/grammars/JacyInstallation#Setting_up_Jacy)
   1. [Calling Jacy from Emacs](https://delph-in.github.io/docs/grammars/JacyInstallation#Calling_Jacy_from_Emacs)
   2. [Using JACY with PET](https://delph-in.github.io/docs/grammars/JacyInstallation#Using_JACY_with_PET)
2. [Using JACY with \[incr
tsdb()\]](https://delph-in.github.io/docs/grammars/JacyInstallation#Using_JACY_with_.5Bincr_tsdb.28.29.5D)
   1. [Using JACY with itsdb and PET](https://delph-in.github.io/docs/grammars/JacyInstallation#Using_JACY_with_itsdb_and_PET)
3. [Graphical User Interface](https://delph-in.github.io/docs/grammars/JacyInstallation#Graphical_User_Interface)
   1. [LUI](https://delph-in.github.io/docs/grammars/JacyInstallation#LUI)
   2. [CLIM](https://delph-in.github.io/docs/grammars/JacyInstallation#CLIM)

# Setting up Jacy

Here are some incomplete and sometime out-of-date instructions on how to
install and run [Jacy](https://delph-in.github.io/docs/grammars/JacyTop). First you must install the
[LKB](https://delph-in.github.io/docs/tools/LkbTop) or [PET](https://delph-in.github.io/docs/garage/PetTop). Note that currently the automated
installation ([LkbInstallation](https://delph-in.github.io/docs/tools/LkbInstallation)) with the option --jacy
gives an old version of the grammar.

If you want to use [ChaSen](http://chasen.naist.jp) for segementation
and unknown word handling, then you must also install it.

Although the lkb will run standalone, there are problems with Japanese
input. The recommended way to run it is from inside emacs, using the eli
interface. Install the lkb and eli (following the instructions in
[LkbEmacs](https://delph-in.github.io/docs/tools/LkbEmacs)), you can run Lisp with a UTF locale
(ja\_JP.UTF-8), but we change it internally anyway.

Now load everything, LKB, MRS, plus \[incr tsdb()\]:

Open emacs

Start Lisp with M-x lkb for the precompiled binaries, or with M-x lisp
if you have Allegro Common Lisp. Inside the common-lisp buffer:

    :ld ~/src/lkb/src/general/loadup
    (pushnew :lkb *features*)
    (pushnew :mrs *features*)
    (compile-system "tsdb" :force t)

Jacy also works with Steel Bank Common Lisp (sbcl).

Load the grammar with:

    (read-script-file-aux "~/path/to/grammar/jacy/lkb/script")

or, if you want to use [ChaSen](/ChaSen):

    (read-script-file-aux "~/path/to/grammar/jacy/lkb/script.chasen")

You can parse a sentence by typing (do-parse-tty "犬 が 吠える") in the
emacs window.

If you have any questions, please write an email to: bond＠ieee.org.

## Calling Jacy from Emacs

Assuming that you have a recent LOGON install, you can save some typing
with the following function:

    (defun jacy ()
      (interactive)
      ;; set up logon
      (logon)
      ;;set tsdb home and skeleton home
      (insert (format 
               "(tsdb::tsdb :skeleton \"%s/dfki/jacy/tsdb\")"
               logon-root))
      (fi:inferior-lisp-newline)
      (insert (format 
               "(tsdb::tsdb :skeleton \"%s/dfki/jacy/tsdb/skeletons\")"
               logon-root))
      (fi:inferior-lisp-newline)
      ;; load the grammar
      (insert 
       (format "(lkb::read-script-file-aux  \"%s/dfki/jacy/lkb/script\")" 
               logon-root))
      (fi:inferior-lisp-newline)
      ;; set up input method
      (set-input-method "japanese"))

## Using JACY with PET

You need to segment the Japanese, for example by preprocessing with
[ChaSen](http://chasen.naist.jp):

    > chasen -F"%m " | cheap ~/japanese/japanese.grm

reading \`pet/japanese.set'...

loading \`japanese.grm' (Japanese (jan-03))

16674 types in 1.7 s

# Using JACY with \[incr tsdb()\]

*Note*: some of these instructions may be out of date.

Install itsdb, following the instructions in the manual.

The latest version of JACY and versions of itsdb later than 2003-05-20
should work as is with Japanese.

      M-x itsdb

Note: Japanese test sentences should be in utf-8.

To get itsdb to count Japanese words, you need to segment the test
sentences at some stage. This can be done during import.

- if there is a \_global\_
preprocessing hook', \[incr tsdb()\] import will pipe everything through it and use the \_second\_ value that it returns as the i-length'
field; e.g. (setf \*tsdb-preprocessing-hook\*
"lkb::chasen-preprocess-for-pet")
  
  will enable that hook globally, and once you use a definition of
this function that counts correctly (no good doing length() on a
variable \_after\_ using the destructive nreverse() on it :-{), you
will notice that (i) imports from text files are much slower
and (ii)
Browse -- Test Items' will show \[http://chasen.naist.jp ChaSen\] word counts for the i-length'
field.

Note that because the import can now take actual time (half a second per
item or so), the \[incr tsdb()\] progress meter should advance correctly
during the import from text file function (this does not work on
versions older than 2003-06),

There is an example of
user-fns.lsp' for JaCY that enables the \*tsdb-preprocessing-hook\*, when \[incr tsdb()\] is loaded \_before\_ the grammar. (You could also set this in \~/.tsdbrc\`,
but then it would affect everything you do, no matter which grammar was
used.)

from user-fns.lsp:

;;; ;;; hook for \[incr tsdb()\] to call when preprocessing input (going
to the PET ;;; parser or when counting \`words' while import test items
from a text file). ;;;

(defun chasen-preprocess-for-pet (input)

(preprocess-sentence-string input :verbose nil :posp t))

\#+(or :pvm :itsdb)

(setf tsdb::\*tsdb-preprocessing-hook\*
"lkb::chasen-preprocess-for-pet")

## Using JACY with itsdb and PET

Install itsdb and PET.

You can run Japanese with a cpu defined in your .tsdbrc (substituting
your pathnames).

    grammardir=${LOGONROOT}/dfki/jacy
    grammarscript=${grammardir}/lkb/script
    skeletondir=${grammardir}/tsdb/skeletons
    grm=${grammardir}/japanese.grm
    petpreprocessor=lkb::chasen-preprocess-for-pet
    grmname=jacy
    
    (tsdb::make-cpu
            :host (short-site-name)
            :spawn "${LOGONROOT}/bin/cheap"
            :options (list "-tsdb" "-packing" "${grm}")
            :class :pet :name "${grmname}-pet" :grammar "${grmname}"
            :task '(:parse) :wait 300 :quantum 180)
    (tsdb::make-cpu
            :host (short-site-name)
            :spawn "${LOGONROOT}/bin/cheap"
            :options (list "-tsdb" "-packing" "-tok=yy" "-default-les" "${grm}")
            :class :lex :name "${grmname}-lex" :grammar "${grmname}"
            :preprocessor "${petpreprocessor}"
            :task '(:parse) :wait 300 :quantum 180)

After starting lkb-ja and itsdb in emacs:

Choose the cpu in the normal way by evaluating

(tsdb::tsdb :cpu :nihongo :file t) in the \*common-lisp\* buffer:

LKB(2): (tsdb::tsdb :cpu :nihongo :file t)

The preprocessor calls a function defined in usr-fns.lisp that runs
chasen on the input, the combination of "-yy" "-default-les" takes the
output and produces default lexical types for unknown words.

# Graphical User Interface

## LUI

The main graphical user interface with the LKB is now the [Linguistic
User Interface (LUI)](https://delph-in.github.io/docs/tools/LkbLui). Unfortunately, the default setup does not
display Japanese under Unix. There are two ways to fix things:

\* Install Pavel's Pangolui as an [Alternative Lui
Implementation](https://delph-in.github.io/docs/tools/LkbLui) (recommended)

\* Set up [.luirc](https://delph-in.github.io/docs/tools/LuiRc) to specify Japanese fonts

## CLIM

CLIM is used for some displays (the parse compare/treebanking window and
the type hierarchy). It should work out of the box for Japanese.

Last update: 2012-02-07 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/JacyInstallation/_edit)]{% endraw %}