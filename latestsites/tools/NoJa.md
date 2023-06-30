{% raw %}# Norwegian Japanese Machine Translation "NoJa"

These are some notes to set up a system using the [LOGON](https://delph-in.github.io/docs/tools/LogonTop)
architecture for a new langauge pair. This is not officially supported
by anyone at the moment.

**Disclaimer:** These pages are meant to be helpful, but that doesn't
mean the authors will always be able to helpfully answer questions.

Contents

1. [Norwegian Japanese Machine Translation
"NoJa"](https://delph-in.github.io/docs/tools/NoJa#Norwegian_Japanese_Machine_Translation__.22NoJa.22)
2. [Running No/Ja](https://delph-in.github.io/docs/tools/NoJa#Running_No.2FJa)
3. [Trouble shooting suggestions](https://delph-in.github.io/docs/tools/NoJa#Trouble_shooting_suggestions)
4. [Set Up](https://delph-in.github.io/docs/tools/NoJa#Set_Up)
   1. [.bashrc](https://delph-in.github.io/docs/tools/NoJa#A.bashrc)
   2. [.emacs](https://delph-in.github.io/docs/tools/NoJa#A.emacs)
   3. [logon/dot.tsdbrc](https://delph-in.github.io/docs/tools/NoJa#logon.2Fdot.tsdbrc)
   4. [logon/ntnu/norse-parse.lisp](https://delph-in.github.io/docs/tools/NoJa#logon.2Fntnu.2Fnorse-parse.lisp)
   5. [To Do](https://delph-in.github.io/docs/tools/NoJa#To_Do)
5. [Differences in attributes](https://delph-in.github.io/docs/tools/NoJa#Differences_in_attributes)

# Running No/Ja

We recommend you have at least 3GB of RAM. Even more memory wouldn't
hurt.

1. start transfer and generation in one emacs (M-x noja)
2. start a generator server
   - trollet
   - load \~/logon/dfki/jacy/lkb/script
   - index for generator
   - start server
3. translate
   - (mt::parse-interactively "overset meg") (C-c r)
   - a parse window appears
   - select the parse (with next/previous) and click transfer
   - select the translation (with next/previous) and click generate
   - the translation should magically popup in a little window

You can also run it as a [batch](https://delph-in.github.io/docs/tools/LogonProcessing_BatchTranslation) with
a bit more undocumented setup.

# Trouble shooting suggestions

- start afresh from a new emacs
- are the predicates strings or types? (it is easy to confuse the two)
- do you have INPUT and OUTPUT the right way round?

# Set Up

Not all of the bits have been publically released yet (2006-06-09).

- get a recent LOGON CVS (see [LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation))
  
  - fulfill your licensing requirements
    - put your ACL licence in
    - delete any bits you shouldn't have
- add in norsource
- add in noja
- setup various files
  - .bashrc
  - .emacs
  - logon/dot.tsbrc

## .bashrc

    LOGONROOT=~/logon
    if [ -f ${LOGONROOT}/dot.bashrc ]; then
        . ${LOGONROOT}/dot.bashrc
    fi

## .emacs

    ;;;
    ;;; LOGON-specific settings
    
    (defun log ()
      (interactive)
      (if (getenv "LOGONROOT")
          (let ((logon (substitute-in-file-name "$LOGONROOT")))
            (if (file-exists-p (format "%s/dot.emacs" logon))
                (load (format "%s/dot.emacs" logon) nil t t)))))
    
    (defun jacy ()
      (interactive)
      ;; set up logon
      (log)
      ;; load lisp
      (lisp)
      ;; make the encoding suitable for japanese (EUC-JP)
      (japanese)
      ;; load the common-lisp commands
      (insert (format ":ld %s/dot.clinit.cl\n" logon-root))
      (fi:inferior-lisp-newline)
      ;; load the machine translation controller
      (insert "(lmt)") 
      ;; load the tsdb settings
      (insert (format ":ld %s/dot.tsdbrc\n" logon-root))
      (fi:inferior-lisp-newline)
      ;;set tsdb home and skeleton home
      (insert "(tsdb::tsdb :home \"/home/bond/treebank/mrs\")")
      (fi:inferior-lisp-newline)
      (insert (format 
               "(tsdb::tsdb :skeleton \"%s/dfki/jacy/tsdb/skeletons\")"
               logon-root))
      (fi:inferior-lisp-newline)
      ;; load the grammar
      (insert 
       (format "(read-script-file-aux  \"%s/dfki/jacy/lkb/script\")" 
               logon-root))
      (fi:inferior-lisp-newline))
    
    
    (defun norse ()
      (interactive)
      ;; set up logon
      (log)
      ;; load lisp
      (lisp)
      ;; load the common-lisp commands
      (insert (format ":ld %s/dot.clinit.cl\n" logon-root))
      (fi:inferior-lisp-newline)
      ;; load the machine translation controller
      (fi:eval-in-lisp "(lmt)")
      ;; load the tsdb settings
      (insert (format ":ld %s/dot.tsdbrc\n" logon-root))
      (fi:inferior-lisp-newline)
      ;;set tsdb home and skeleton home
      (insert "(tsdb::tsdb :home \"/home/bond/treebank/norse\")")
      (fi:inferior-lisp-newline)
      (insert (format 
               "(tsdb::tsdb :skeleton \"%s/ntnu/norsource/tsdb/skeletons\")"
               logon-root))
      (fi:inferior-lisp-newline)
      ;; load the grammar
      (insert 
       (format "(read-script-file-aux  \"%s/ntnu/norsource/lkb/scribet\")" 
               logon-root))
      (fi:inferior-lisp-newline))
    
    (defun noja ()
      (interactive)
      ;; set up logon
      (log)
      ;; load lisp
      (lisp)
      ;; load the common-lisp commands
      (insert (format ":ld %s/dot.clinit.cl\n" logon-root))
      (fi:inferior-lisp-newline)
      ;; load the machine translation controller
      (fi:eval-in-lisp "(lmt)")
      ;; load the tsdb settings
      (insert (format ":ld %s/dot.tsdbrc\n" logon-root))
      (fi:inferior-lisp-newline)
      ;; load the parser
      (insert "(tsdb:tsdb :cpu :norse-parse :file t)")
      (fi:inferior-lisp-newline)
      ;; load the transfer grammar
       (insert 
        (format "(read-script-file-aux  \"%s/ntnu/noja/lkb/script\")" logon-root))
       (fi:inferior-lisp-newline))

## logon/dot.tsdbrc

           ;;;
           ;;; for NoJa (Norsource/Jacy)
           ;;; 
           (make-cpu 
            :host (short-site-name)
            :spawn binary
            :options (list "-I" base "-qq" "-locale" "no_NO.UTF-8" 
                           "-L" (format nil "~a/ntnu/norse-parse.lisp" %logon%))
            :class :norse-parse :name "norse-parse" :grammar "Norsource"
            :task '(:parse) :wait wait :quantum quantum)       

## logon/ntnu/norse-parse.lisp

    (in-package :common-lisp-user)
    ;;
    ;; make sure we have enough space available
    ;;
    (system:resize-areas :old 256 :new 256)
    (let* ((logon (system:getenv "LOGONROOT"))
           (lingo (namestring (parse-namestring (format nil "~a/lingo" logon)))))
      ;;
      ;; load MK defsystem() and LinGO load-up library first
      ;;
      (load (format nil "~a/lingo/lkb/src/general/loadup" logon))
      ;;
      ;; for NorSource, we need (close to) the full scoop
      ;;
      (pushnew :lkb *features*)
      (pushnew :mrs *features*)
      (pushnew :tsdb *features*)
      (pushnew :logon *features*)
      (pushnew :slave *features*)
      (excl:tenuring 
       (funcall (intern "COMPILE-SYSTEM" :make) "tsdb")
       (funcall 
        (intern "READ-SCRIPT-FILE-AUX" :lkb)
        (format nil "~a/ntnu/norsource/lkb/scribet" logon)))
      (set (intern "*MAXIMUM-NUMBER-OF-EDGES*" :lkb) 10000)
      (excl:gc :tenure) (excl:gc) (excl:gc t) (excl:gc)
      (setf (sys:gsgc-parameter :auto-step) nil)
      (set (intern "*TSDB-SEMANTIX-HOOK*" :tsdb) "mrs::get-mrs-string")
      (funcall (symbol-function (find-symbol "SLAVE" :tsdb))))

## To Do

Gain the admiration and respect of many by:

- running things from the DELPH-IN CVS
- running the parser using a cheap client instead of lisp
- setting up the tsdb cpus as a list append... + Japanese grammar
overgenerates passive (passive is PASS +, non-passive is boolean) -
fix in vpm

# Differences in attributes

Jacy (copying the ERG) has tense on prepositions, while Norsource
doesn't. This caused some problems. We solved them, using the [variable
property mapping](https://delph-in.github.io/docs/tools/RmrsVpm), as follows:

Add some types (to mrs.tdl) these mark events for which the entire
attribute will be deleted:

    ditch-tense := tense.
    ditch-mood := mood.

Use these in out.vpm to delete the attribute **iff** marked with
ditch-tense, otherwise to pass the values across.

    TENSE : TENSE
     ditch-tense => !
      * >> *
    
    MOOD : MOOD
      ditch-mood => !
      * >> *

In the input munging norse.tdl, find all prepositions with a regular
expression and then mark them to have tense and mood deleted.

    prep_mark_jf := monotonic_mtr &
    [ CONTEXT.RELS < [ PRED "~_p_", LBL #h0, ARG0 #e & e ] >,
      FILTER.RELS < [ PRED "prep_swap_mark", LBL #h0, ARG0 #e ] >,
      OUTPUT.RELS < [ PRED "prep_swap_mark", LBL #h0, ARG0 #e ] >,
      FLAGS.EQUAL < #e > ].
    
    specialize_prep_nf & monotonic_mtr &
    [ INPUT.RELS < [ LBL #h, ARG0 #e],
                   [ PRED "prep_swap_mark", LBL #h, ARG0 #e ] >,
      OUTPUT.RELS < +copy+ &  [ ARG0 #e &
                                        [TENSE ditch-tense,  
                                         MOOD ditch-mood] ] > ].

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/NoJa/_edit)]{% endraw %}