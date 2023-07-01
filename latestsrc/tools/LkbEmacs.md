{% raw %}# Overview

The LKB is a stand-alone grammar development environment and can be used
in connection with any text editor. The basic engineering cycle is
similar to software development: a set of source files (aka a grammar)
is maintained using a text editor and then compiled for run-time use in
the LKB system. At the same time, integrating the LKB with the *emacs*
editor brings certain advantages, among them ease of start-up, editing
support for LKB grammar files, and some additional debugging facilities.

Extending the terse discussion from the
[LkbInstallation](https://delph-in.github.io/docs/tools/LkbInstallation) page (which hopefully just worked for
you), the following paragraphs provide some more background on using the
LKB with *emacs*, including help on running a Lisp environment as a
sub-process to *emacs* (so as to compile the LKB source code).

Contents

1. [Overview](https://delph-in.github.io/docs/tools/LkbEmacs#Overview)
2. [About emacs](https://delph-in.github.io/docs/tools/LkbEmacs#About_emacs)
3. [After you have emacs installed](https://delph-in.github.io/docs/tools/LkbEmacs#After_you_have_emacs_installed)
4. [Simple way to load a grammar](https://delph-in.github.io/docs/tools/LkbEmacs#Simple_way_to_load_a_grammar)
5. [Working with other scripts in
Emacs](https://delph-in.github.io/docs/tools/LkbEmacs#Working_with_other_scripts_in_Emacs)
   1. [Proposal to Standardize Configuration
Settings](https://delph-in.github.io/docs/tools/LkbEmacs#Proposal_to_Standardize_Configuration_Settings)
      1. [Working with Greek
(UTF-8)](https://delph-in.github.io/docs/tools/LkbEmacs#Working_with_Greek_.28UTF-8.29)
      2. [Working with Japanese
(EUC)](https://delph-in.github.io/docs/tools/LkbEmacs#Working_with_Japanese_.28EUC.29)
         1. 1. [ACL 8.0](https://delph-in.github.io/docs/tools/LkbEmacs#ACL_8.0)
         1. 2. [Other Components](https://delph-in.github.io/docs/tools/LkbEmacs#Other_Components)

# About emacs

See [Gnu emacs](http://www.gnu.org/software/emacs/emacs.html) or
[Xemacs](http://www.xemacs.org/) (or
<http://www.cs.iupui.edu/~n241/faqs/faq0.html> for Windows users) which
give information and download instructions. Note that these notes
concern Gnu emacs.

# After you have emacs installed

If you use the semi-automated installation process as in
[LkbInstallation](https://delph-in.github.io/docs/tools/LkbInstallation) then all the emacs files will
magically be in the correct place and it will all work! If you are
unable to use this, or if something doesn't work, here are instructions:

- Get the additional files:
[dot.emacs](http://lingo.delph-in.net/etc/dot.emacs) and
[eli.tgz](http://lingo.delph-in.net/etc/eli.tgz)
- Unpack eli.tgz into your DELPHINHOME directory.
- Start emacs, open \~/.emacs (probably C:\\.emacs on Windows) and
edit it to load the dot.emacs file as described in the comments at
the start of that file.
- Save and restart emacs.
- If all is well, you should now be able to run the LKB as \`M-x lkb
RET' in emacs.
- load [lkb.el](https://delph-in.github.io/docs/tools/LkbMode) (dot.emacs may do it for you) or some user
friendly menus and shortcuts.
- load [tdl-mode.el](https://delph-in.github.io/docs/tools/LkbMode) for syntax coloring and useful
keybindings when dealing with TDL files.

# Simple way to load a grammar

Add this to your .emacs file and you can then call your grammar with
M-x jacy.

This starts the lkb, loads the grammar, sets the skeleton and home
directories for itsdb and sets up the input encoding. You should change
the paths to the ones for your grammar.

    (defun jacy ()
      (interactive)
      ;; set up logon  (use  (lkb) for the MATRIX default set-up
      (logon)
      ;; put the path to your grammar here
      (insert "(lkb::read-script-file-aux \"/home/bond/logon/dfki/jacy/lkb/script\")")
      (fi:inferior-lisp-newline)
      ;; skeletons
      (insert "(tsdb:tsdb :skeletons  \"/home/bond/logon/dfki/jacy/tsdb/skeletons\")" )
      (fi:inferior-lisp-newline)
      ;; tsdb database (home)
      (insert "(tsdb:tsdb :home  \"~/jacy-debug\")") 
      (fi:inferior-lisp-newline)
      ;; set up input method
      (set-input-method "japanese-anthy"))

# Working with other scripts in Emacs

## Proposal to Standardize Configuration Settings

- 1\. **(Ensure Lisp/LKB reads grammar files using correct encoding)**
  
  - In grammar's global.lsp use the set-coding-system macro to set
the character encoding. Eg. (set-coding-system utf-8) at the top
of the file.
  - if running Allegro the following will then be executed
(setf excl:\*locale\* (excl::find-locale ".utf8"))
  - ISSUES: *canonical encoding (take from Emacs?), mapping into
encoding names used by specific Lisps, Lisp function
grammar-encoding must be written and incorporated into LKB code
base, backwards compatibility?*
- 2\. **(Ensure Emacs reads grammar files using correct encoding)**
  
  - In every grammar file require header
;;; -\*- Mode: TDL; Coding: utf-8 -\*-
  - ISSUES: *all files must have correct header, mulitbyte users
also need to load mule-ucs for emacs 21*
- 3\. **(Ensure Emacs and Lisp/LKB communicate in compatible and
sufficient character encoding)**
  
  - fi:common-lisp already takes care of this

Above assumes UTF-8 as the character encoding used of the grammar files.
This should be strongly recommended, but any other (GNU Emacs supported)
character encodings must also be allowed. Name used to specify character
encoding should be same in both 1 and 2 above.

Also:

- 4\. **(Links to PET, Lexdb and Lui settings)**

Some of the known issues:

- text input doesn't work for multibyte characters in CLIM;
- not all character sets display properly (e.g. Korean);
- do we need to add notes for versions compiled with ACL 6.2 (where
the encoding names are different)?
- postscript/LaTeX printing from CLIM/LUI with non-ascii characters.

### Working with Greek (UTF-8)

This is the documentation of how to use LKB and Emacs with Greek
(grammar files in UTF-8). You need an Emacs upwards of 21.3 (I do not
know about the requirements for XEmacs).

Start the LKB in Emacs.

In your Emacs startup file, add the following settings:

    ;; Sets character set to greek-iso8859-7, and coding system to greek-iso-8bit
    ;; Also sets a default input method (Greek)
    (set-language-environment 'Greek)
    (set-default-coding-systems 'mule-utf-8)
    (unless (boundp 'fi:common-lisp-image-arguments)
      (setq fi:common-lisp-image-arguments nil))
    (setq fi:common-lisp-image-arguments
          (nconc (list "-locale" "el_GR.utf8") fi:common-lisp-image-arguments))

The first line sets most required values. The second one changes the
default coding systems (the default in the Greek language environment is
ISO-8859-7, not UTF-8) so that the grammar and test suite files are read
with the correct encoding. The remaining lines tells Allegro Common Lisp
to use Greek.

At the end of lkb/globals.lsp, add the following:

    ;; Write CDB temporary files as binary
    (defparameter cdb::*cdb-ascii-p* nil)

Exit LKB and Emacs, delete the temporary lexicon files.

Your LKB setup is now capable of working with Greek. You can run batch
parses from Greek files, pass on Greek sentences to do-parse-tty in the
\*common-lisp\* buffer, and the results can be viewed (with Greek
characters) in the chart window, parse tree windows, etc.

For other languages, the settings are probably analogous: choose an
appropriate language environment in Emacs, and choose the appropriate
file coding system (if it is different from the default in the language
environment - see M-x describe-language-environment).

Remain to do:

- Greek input in the "Parse..." window
- Greek characters in the title bars (an UTF-8-capable window manager
is probably enough to solve this problem)
- Greek characters in the menus of the parse tree window (e.g.
specifying what rules or lexicon entries were used)

Note: this setup was working as described with Emacs 21.3 and Allegro
Common Lisp 6.2. A recent change in Emacs seems to be causing some
problems (for Greek keyboard input, input-method 'greek-jis seems to be
working, but 'greek is not (anymore); the final sigma in the generation
of the temporary lexicon files is problematic). We are investigating.

### Working with Japanese (EUC)

The Japanese grammar now uses UTF-8, and we recommend everyone else
does.

This is left for historical interest.

Define a function to set a buffer's encoding japanify.

    ;;; this sets up an encoding
    (defun japanify (buffer encoding)
      (save-excursion
        (switch-to-buffer buffer)
        (set-language-environment 'japanese)
        (set-buffer-file-coding-system encoding)
        (set-buffer-process-coding-system encoding encoding))
      (setq default-buffer-file-coding-system encoding))

Use this when calling lisp (for Japanese):

    (defun lisp (&optional prefix)
      (setq lkb-tmp-dir "/tmp")
      (interactive "P")
      (load "/usr/local/delphin/acl/eli/fi-site-init")
      (setq fi:common-lisp-image-name "/usr/local/delphin/acl/alisp")
      (setq fi:common-lisp-image-file "/usr/local/delphin/acl/bclim.dxl")
      (setq fi:common-lisp-image-arguments 
        (list 
         "-locale" "japan.EUC"
         "-qq" "-L" "/usr/local/delphin/cl-init.cl"))
      (fi:common-lisp)
      (japanify "*common-lisp*" 'euc-jp))

We have found that for the latest eli and emacs 21.4, that it always
sets the (stream-external-format \*terminal-io\*) to :emacs-mule. We
prefer it to be EUC-JP, so we evaluate the following in the lisp buffer:

    (setf excl:*default-external-format*
     (setf (stream-external-format *terminal-io*) :euc))

We also need to change lkb/globals.lsp by adding the following:

    ;; Write CDB temporary files as binary
    (defparameter cdb::*cdb-ascii-p* nil)

While not strictly necessary, we also make a point of explicitly marking
the encoding in the grammar and lexicon files. This is because some
users prefer their defult to be euc-jp, others to be junet and others to
be utf-8. The grammar, however, must be uniformly euc-jp.

    ;;; -*- Mode: TDL; Coding: euc-jp -*-

##### ACL 8.0

In newer versions of allegro lisp, you can reset the locale in the
grammar itself (we also set the locale for pvm here). In lkb/globals.lsp

    #+:allegro
    (setf excl:*locale* (excl:find-locale "japan.EUC"))
    #+:allegro
    (setf *pvm-encoding* :euc-base)

In 2007 JACY intends to move to utf-8, and much of this will become
redundent.

##### Other Components

If you are working with [PetTop](https://delph-in.github.io/docs/garage/PetTop), don't forget to specify the
encoding in grammar.set as well:

    ;;;; settings for CHEAP                 -*- Mode: TDL; Coding: euc-jp -*-
    encoding := EUC-JP.

If you use the [LkbLexDb](/LkbLexDb), don't forget to specify the
encoding when you install the lexical database:

    bash install-lexdb.sh jap ~/jap/lexdb.fld ~/jap/lexdb.dfn "-E EUC_JP"

Last update: 2019-07-16 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/LkbEmacs/_edit)]{% endraw %}