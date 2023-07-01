{% raw %}# Instructions on how to set up an MT system

This page is under construction. Please expand and correct if you can.

Contents

1. [Instructions on how to set up an MT
system](https://delph-in.github.io/docs/garage/MtSetup#Instructions_on_how_to_set_up_an_MT_system)
   1. [Two ways to set up an MT
system](https://delph-in.github.io/docs/garage/MtSetup#Two_ways_to_set_up_an_MT_system)
2. [The Rephrasing method](https://delph-in.github.io/docs/garage/MtSetup#The_Rephrasing_method)
   1. [Requested files and settings](https://delph-in.github.io/docs/garage/MtSetup#Requested_files_and_settings)
   2. [Using the system](https://delph-in.github.io/docs/garage/MtSetup#Using_the_system)
3. [The Transfer Grammar method](https://delph-in.github.io/docs/garage/MtSetup#The_Transfer_Grammar_method)
   1. [Install LOGON and add your grammar(s) to the
repository](https://delph-in.github.io/docs/garage/MtSetup#Install_LOGON_and_add_your_grammar.28s.29_to_the_repository)
   2. [Creating CPU's](https://delph-in.github.io/docs/garage/MtSetup#Creating_CPU.27s)
   3. [Create lisp files for your grammars and the MT
system](https://delph-in.github.io/docs/garage/MtSetup#Create_lisp_files_for_your_grammars_and_the_MT_system)
   4. [Setting the \*translate-grid\*
values](https://delph-in.github.io/docs/garage/MtSetup#Setting_the_.2Atranslate-grid.2A_values)
   5. [Setting the VPM](https://delph-in.github.io/docs/garage/MtSetup#Setting_the_VPM)
   6. [Starting the MT system from
Emacs](https://delph-in.github.io/docs/garage/MtSetup#Starting_the_MT_system_from_Emacs)

## Two ways to set up an MT system

There are two ways to set up an MT system. One way is to include the
transfer component in the parsing grammar, using the rephrasing
mechanism to generate sentences with another grammar. This method is
used in EmilyBender's Grammar Matrix course ([Lab
9](http://courses.washington.edu/ling567/lab9.html)), and requires only
installation of the LKB system, and is thus relatively lightweight. The
other method is to create a seperate transfer grammar using the [LOGON
machinery](https://delph-in.github.io/docs/tools/LogonTop) to parse with one grammar, transfer with the
transfer grammar (which is separate from the parsing grammar), and
generate with a third grammar. This method is used by larger MT
projects, like the [LOGON](http://www.emmtee.net/) project and the [Jaen
Japanese-English MT project](https://delph-in.github.io/docs/garage/MtJaen). Instructions on how to set up
translation systems with both methods are provided below.

# The Rephrasing method

The LKB system comes with a possibility to rephrase a parsed sentence.
This is done by applying transfer rules to the MRS of the parsed
sentence and generating from the transferred MRS.

## Requested files and settings

[Transfer rules](https://delph-in.github.io/docs/tools/LogonTransfer) require two files: a type file for
transfer rules (e.g. mtr.tdl), which is loaded together with the other
type files, and a file with instances of transfer rules, e.g. acm.mtr.
In the script file:

    (mt:read-transfer-rules 
     (list
      (lkb-pathname (parent-directory) "acm.mtr"))
     "A place to put your transfer rules"
     :filter nil)

In addition, both the parsing grammar and the generation grammar load a
file called semi.vpm, which contains mappings from the feature structure
to the MRS (see [RmrsVpm](https://delph-in.github.io/docs/tools/RmrsVpm)). In the script file:

    (mt:read-vpm (lkb-pathname (parent-directory) "semi.vpm") :semi)

The parsing grammar and the generation grammar require the
\*translate-grid\* variables in the globals.lisp file to be set. If the
language of the parsing grammar is English (eng), and the language of
the generation grammar is Italian (ita), the settings are as follows. In
globals.lsp in the English grammar:

    (setf *translate-grid* '(:eng :ita))

In globals.lsp in the Italian grammar:

    (setf *translate-grid* '(:ita :eng))

The first argument of the \*translate-grid\* function is the language of
the grammar. The second argument is the language that the parsed
sentence is "rephrased" in. If you want to rephrase a sentence in the
same language, the two arguments need be the same.

## Using the system

Open two Emacs windows and start the LKB in both. Load the parsing
grammar and the generation grammar. Click on "Generate -&gt; Start
Server" in the LKB window of the generation grammar. Parse a sentence
with the parsing grammar and press "Rephrase".

# The Transfer Grammar method

This section shows a procedure for setting up a full MT system that can
do [Batch Translation](https://delph-in.github.io/docs/tools/LogonProcessing_BatchTranslation) and integrate
[LogonModeling](https://delph-in.github.io/docs/tools/LogonModeling), and where you can do interactive MT
development.

## Install LOGON and add your grammar(s) to the repository

If you don't have LOGON installed, follow the instructions on
[LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation). Make a directory (e.g.
mydirectory) inside the logon/ directory and put your grammar(s) (e.g.
mygrammar) there.

You also need a transfer grammar (e.g. inout). The easiest is maybe to
copy an existing grammar in logon/uio/tm/. Put your transfer grammar in
the tm/ directory.

## Creating CPU's

If the grammars you want to use for parsing and generation are not
assigned CPU's yet, they need to be set in the dot.tsdbrc file. Add the
name and version of your grammar to the list of grammars in the top of
the file.

           (mygrammar "Mygrammar (1107)")

Add the following function to the other make-cpu functions:

         (make-cpu 
          :host (short-site-name)
          :spawn wrapper
          :options (append 
                    options
                    (list "-I" base "-qq" "-locale" "en_US.UTF-8"
                          "-L" (logon-file "mydirectory" "mygrammar.lisp" :string)))
          :class :mygrammar :grammar mygrammar :task '(:parse :generate)
          :wait wait :quantum quantum)

Also make CPUs for the transfer grammar ...

         (make-cpu 
          :host (short-site-name)
          :spawn wrapper
          :options (append 
                    options
                    (list "-I" base "-qq" "-locale" "en_US.UTF-8"
                          "-L" (logon-file "lingo" "inout.lisp" :string)))
          :class :inout :name "inout" :grammar "InOut (current)" 
          :task '(:transfer) :wait (* wait 3) :quantum quantum)

... and the MT system:

         (make-cpu 
          :host (short-site-name)
          :spawn wrapper
          :options (append 
                    options
                    (list "-I" base "-qq" "-locale" "en_US.UTF-8"
                          "-L" (logon-file "lingo" "in2out.lisp" :string)))
          :class :in2out :name "in2out" :task '(:translate)
          :template "%s/%t/%d" :wait (* wait 4) :quantum 7200)

## Create lisp files for your grammars and the MT system

Copy the erg.lisp file in logon/lingo/ into your grammar directory and
rename it (e.g. mygrammar.lisp). Replace the line:

       (format nil "~a/lingo/erg/lkb/script" logon))

with:

       (format nil "~a/mydirectory/mygrammar/lkb/script" logon))

Make copies of jaen.lisp and ja2en.lisp in the logon/lingo/ directory
and name them e.g. inout.lisp and in2out.lisp. In inout.lisp, replace
the line:

       (format nil "~a/uio/tm/jaen/lkb/script" logon))

with:

       (format nil "~a/uio/tm/inout/lkb/script" logon))

In in2out.lisp, set the CPUs you want to call with your MT system:

      (funcall (symbol-function (find-symbol "TSDB" :tsdb)) 
               :cpu :mygrammar1 :task :parse :reset nil :file t :wait 600 :error :exit)
      (funcall (symbol-function (find-symbol "TSDB" :tsdb)) 
               :cpu :inout :reset nil :file t :wait 300 :error :exit)
      (funcall (symbol-function (find-symbol "TSDB" :tsdb)) 
               :cpu :mygrammar2 :task :generate
               :reset nil :file t :wait 600 :error :exit)

## Setting the \*translate-grid\* values

If your language translation pair is English to Italian, do the
following settings. In globals.lsp in the English grammar:

    (setf *translate-grid* '(:eng :ita))

In globals.lsp in the Italian grammar:

    (setf *translate-grid* '(:ita :eng))

In globals.lsp in the transfer grammar:

    (setf *translate-grid* '(nil . (:ita)))

## Setting the VPM

The transfer grammar loads two files called in.vpm and out.vpm. The
in.vpm file determines how the MRS is represented when it is given to
the transfer grammar from the parsing grammar. The out.vpm file
determines how the MRS is represented when it comes out from transfer
grammar. (See [RmrsVpm](https://delph-in.github.io/docs/tools/RmrsVpm))

## Starting the MT system from Emacs

Given the following lines in the .emacs file ...

    (defun jacy ()
     (interactive)
     ;; set up logon
     (logon)
     (insert "(rsa \"jacy\")")
     (fi:inferior-lisp-newline)
     (set-input-method "japanese-anthy"))
    (defun erg ()
     (interactive)
     ;; set up logon
     (logon)
     (insert "(rsa \"erg\" t)")
     (fi:inferior-lisp-newline))
    (defun jaen ()
     (interactive)
     ;; set up logon
     (logon)
     (insert "(tsdb::tsdb :cpu :jacy :task :parse :file t)")
     (fi:inferior-lisp-newline)
     (insert "(rsa \"jaen\")")
     (fi:inferior-lisp-newline)
     (set-input-method "japanese-anthy"))

... the [MtJaen](https://delph-in.github.io/docs/garage/MtJaen) system can be started from emacs. Open two
Emacs windows. In the first, type:

    Alt-x jaen

In the second, type:

    Alt-x erg

In order to parse a string with the parsing grammar, type:

    Ctrl-c r

Type in the input string and press enter. Press transfer on the MRS that
pops up, and the MRS is transferred. Then press generate and English
strings are generated.

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/MtSetup/_edit)]{% endraw %}