{% raw %}These FAQs concern software issues. For grammar writing issues, see the
Further FAQs section at the end.

# Linux

Many of the known problems are CLIM/Motif related: there's not much we
can do about this as LKB developers, but there are workarounds for some
problems.

1. A message about missing libraries appears when you try to start the
LKB. (You may have to scan back to see this message - the apparent
error may be something else.) When you start the LKB from a runtime
binary, you may get an error message that says a library is missing
(e.g., libXm.so.3). The CLIM interface uses Motif libraries and on
some systems these are not made available by default. If you are
using Solaris, you may be able to fix this by adding /usr/dt/lib to
your LD\_LIBRARY\_PATH: if this doesn't work (or if this explanation
is incomprehensible), please talk to your system administrator (it's
a standard difficulty with software that uses Motif, not LKB
specific). If you are using Linux, you either need to install Open
Motif or to fix the installation so that the libraries are where the
Lisp system expects them to be. Please see
[LkbInstallation](https://delph-in.github.io/docs/tools/LkbInstallation) (Trouble Shooting).
2. If you have an incompatible version of the Motif libraries, (which
currently happens for some people on AMD64: 2007-05-08) you may get
a message like:
   
       An unhandled error occurred during initialization:
       Attempt to do an array operation on
       #<unknown object of type number 13 @ #x10011714ed> which is not an array.
   
   In this case you need to install the right version of libXm. Please
see the [LkbInstallation](https://delph-in.github.io/docs/tools/LkbInstallation) page for more
information.
3. Also on 64-bit systems, if you get an error to the effect that
libXm.so.4 couldn't be found, you can fix it by creating a symbolic
link in $(DELPHINHOME)/lkb/lib/linux.x86.64 as follows:
   
       ln -s libXm.so.3 libXm.so.4
4. The LKB interaction window appears but none of the menus work. This
happens when you have lesstif installed. You will have to
remove/relocate the lesstif libraries and install Open Motif.
5. The windows in the file loading interaction are incorrect sizes so
it it difficult or impossible to see the file names. A known problem
in CLIM and some OS versions. Fix awaited.
6. Clicking on a directory in the file loading interaction has no
result. A known problem in CLIM and some OS versions. Workaround is
to enter the full pathname. Fix awaited.
7. Menus suddenly freeze. Restarting the LKB does not help. If you
logout and login again, the LKB menus will start to work again.
Generally this problem is caused by the use of the NUMLOCK key (so
it often afflicts French speakers). Workaround: don't use the
NUMLOCK key when using the LKB. It's possible this problem occurs
under other circumstances too - if you get this effect reproducibly
without the NUMLOCK key, please send details to lingo@delph-in.net.
8. If emacs is shut down without quitting the LKB first, the LKB
process hangs around. Known problem. Either remember to Quit the LKB
before shutting down emacs or write a script to kill off errant
LKBs.

### Missing characters

Warnings appear about missing fonts when trying to display feature
structures. The CLIM interface requires that English and iso8859-1 are
set as default. If your default language uses another character set, you
may need to change this.

The LKB displays a message about missing character sets (e.g., when
doing Parse input) and fails. Some linux distributions appear to default
to a font encoding that is incompatible with the current version of CLIM
and Motif underlying the LKB run-time binaries. The problem typically
surfaces when using menu commands like Parse Input where the LKB will
generate an error message about Missing charsets and fail. To eliminate
the problem, the system needs to be configured to use an iso8859-1
encoding instead of iso8859-15 (which, actually is just like iso8859-1
with the addition of the new Euro symbol; hence, one cannot currently
use the LKB and fonts with the Euro symbol).

To set the necessary font encoding, do the following:

In [RedHat](/RedHat), run locale\_config as the super user; select a
locale without the @euro suffix, say it\_IT rather than it\_IT@euro. As
an alternative, set the value of the LANG value accordingly in in
/etc/sysconfig/i18n directly.

In [SuSe](/SuSe), run yast and perform the equivalent operation. Again,
alternatively it should be sufficient to set DEFAULT\_LANGUAGE in
/etc/sysconfig/language and re-run yast. Unfortunately, we do not have
access to a [SuSe](/SuSe) 8.x installation to test this, but LKB users
have confirmed the general procedure.

Note that this is not an LKB problem, strictly speaking, but an issue
with the underlying graphics toolkits (CLIM and Motif). We expect to see
this resolved in future releases of the underlying software, but in the
meantime hope that the loss of the Euro character will not be
prohibitive to LKB users.

# Windows

[WinZip/PowerArchiver](/WinZip/PowerArchiver) won't unpack the lkb .tgz
archive correctly. We have made two versions of the Windows archive
available: one .zip for [WinZip](/WinZip) (and
[PowerArchiver](/PowerArchiver)), one .tgz for tar/gzip. This problem
only affects the LKB and not the grammar files.

# General LKB problems

### Memory problems

For instance, you get a message such as:

Memory allocation problem: An allocation request for XXXXX bytes caused
a need for XXXXXXXX more bytes of heap. The operating system will not
make the space available because the address space reserved for the heap
could not be increased.

One possibility is that your computer has insufficient memory. Large
grammars, such as the ERG, now (May 2006) require at least 0.5 GByte
(and more to build the generator index). The problem also happens with
the default Allegro images if you are compiling your own LKB with 32-bit
Allegro Common Lisp. Please see $DELPHINHOME/lkb/etc/bclim.lisp.

This can also happen if your Linux distribution is using
[prelinking](http://en.wikipedia.org/wiki/Prelink). Prelinking is a
performance optimization that avoids having to relocate shared libraries
as they're loaded; however, it can cause the shared libraries to load
lower in RAM, where they interfere with the LISP heap. You can remove
the prelink data and force the libraries to be relocated as they're
loaded by running the command "prelink -u -a" as root, then rebooting.
Note that there may be a cron job that periodically updates prelink
data; unless you disable this job, the problem will return later.

### Loading a second grammar in a session

Although the LKB is generally robust to loading revised versions of the
same grammar, loading a completely different grammar into an LKB session
may cause problems (because of incompatible globals or user-fns files.
Before sending bug reports, check that the problem is reproducible when
you load the grammar into a fresh LKB session.

For example, a confirmed problem is that \*empty-list-type\*, which
defines the type for empty lists and which must be consistent with types
defined in your grammar files, is not refreshed when loading a different
globals.lsp file that may redefine it. The LKB's default value is
'\*null\*'. Some globals.lsp files (and corresponding grammars) use this
definition and others may use 'null'.

### Temporary lexicon files / Unknown structure error

Various error messages may occur if a new version of the LKB is used but
the old temporary lexicon files are not first removed. In general,
remove all temporary lexicon files and restart the LKB as the first step
in investigating any problem.

### A supplied grammar gives error messages on loading or won't parse test sentences

The grammars supplied are not all mutually compatible, in the sense that
if you load one grammar and then another, the new grammar may not work.
So always start from a new LKB session when working with a new grammar
(though grammar variants which are in a family, such as the main ITFSG
grammars, can usually be loaded one after the other). In
othercircumstances, if you get errors on an unmodified grammar, please
email lingo@delph-in.net.

### A grammar from a previous version of the LKB no longer works

Old grammars can generally be made to work with the current version of
the LKB simply by changing the ancilliary files, user-fns and globals.
If you have been working on a grammar derived from one distributed with
prior versions of the LKB and you haven't changed these files, the
simplest option is just to copy the files from the new version of the
corresponding grammar. The next FAQ point is for people who have made
changes to the user-fns files and don't want to revert back.

### Defaults problem

Files written using legal TDL syntax are still loadable by the LKB
without change. However, a bug in an earlier LKB version allowed an
incorrect use of defaults. This shows up in one version of the textbook
grammar as follows:

{{{ Syntax error at position 6368: Double defaults when reading CN-LXM

- Ignoring (part of) entry for CN-LXM Error: Syntax error(s) in type
file }}}

The error is caused by the following (incorrect) definition which used
to load into old versions of the LKB without complaint:

    cn-lxm := noun-lxm &
    [ SYN [ HEAD [ AGR #agr & [ GEND /l neut ] ],
             SPR < [ ] > ]
       ARG-ST /l < [ SYN [ HEAD det & [AGR #agr, COUNT /l true] ] ] > ].

The fix is to replace this with a correct version, without multiple
defaults, for instance:

    cn-lxm := noun-lxm &
     [ SYN [ HEAD [ AGR #agr & [ GEND /l neut ] ],
             SPR < [ ] > ],
       ARG-ST < [ SYN [ HEAD det & [AGR #agr, COUNT /l true] ] ] > ].

Older versions of the LKB accepted TDL definitions where a reentrancy
tag was only used once. These are no longer accepted. The fix is to
remove the redundant tag.

### A grammar that worked with previous versions of the LKB no longer works and it is not possible to use a new version of the user-fns file

Most problems are due to a change in the LKB internal data structures
which affects the user-fns file in individual grammars. In this case,
the grammar will load, but there will be a Lisp error message on
parsing, such as:

    Error: Illegal keyword given: :TYPES.
      [condition type: PROGRAM-ERROR]

This problem is caused by a change in the function make-orth-tdfs in the
user-fns file. Replace

      (make-u-value :types (list orth)) 

with

       (make-u-value :type orth)

When loading very old user-fns files, you may get error messages such
as:

    Warning: Free reference to undeclared variable UNIF assumed special.
    Warning: Free reference to undeclared variable IN assumed special.
    Warning: Free reference to undeclared variable FILTER assumed special.
    Warning: While compiling these undefined functions were referenced: FOR

This is due to the use of an old for loop macro which is no longer
included in the LKB. You will need to compare your user-fns file with a
current version and make the appropriate changes to use the current
(built-in) for loop.

### The greatest lower bound introduction code leaves redundant links in place

Known LKB problem - see [LkbBugs](https://delph-in.github.io/docs/tools/LkbBugs).

### Temporary lexicons

An error such as the following may arise when loading a grammar: {{{
creating \#p"/homes/aac10/tmp/templex" resulting in error: No such file
or directory }}}

This is generally caused by failure to create a directory for the
temporary lexicon files - see the detailed instructions. A similar error
message may arise when you first try and parse a sentence for the same
reason.

Similar messages may arise if your file system is full when the LKB
attempt to create a temporary file.

# Emacs related

There is a message from emacs when starting that it cannot find
tdl-mode. tdl-mode.el' and lkb.el' are add-on files for emacs that
provide some extra functionality: structured editing of TDL files (e.g.
indentation) and locate source file from the LKB. Details of how to set
this up are in [LkbEmacs](https://delph-in.github.io/docs/tools/LkbEmacs) but their absence won't cause
serious problems.

# Compilation

When trying to compile with Allegro Common Lisp, the following error may
appear:

    Error: "COMMON-LISP" is not the name of a package.
      [condition type: package-error]

This problem arises when one inadvertently uses a case-sensitive version
of Allegro CL. Starting with 6.0 you get two versions of each binary,
one typically called alisp (or alisp.exe' on Windows) for ANSI standard,
one called \`mlisp' which is case sensitive. Use the alisp binary
instead of mlisp.

# TDL documentation

The BNF description of TDL in the book implies that a string, constraint
(Feature-term), list, or difference-list can appear to the right of :=
at the top level of a type definition without an explicitly specified
type, but this does not appear to be supported in the LKB. For strings
and constraints, :+ can instead be used without an explicit type, if the
type has been previously defined. For lists and difference-lists, an
explicit type must be specified.

    noun-type := < >.       ; not permitted
    noun-type := cat & < >.    ; ok

# Repeated parents in type hierarchy

In the lkb, the following TDL creates a type with the same parent
repeated three times. This repetition may be benign.

    noun-type := *null* & *null* & < >.

# Further FAQs

The [GrammarEngineeringFaq](https://delph-in.github.io/docs/matrix/GrammarEngineeringFAQ) page contains
further LKB-related FAQs.

Last update: 2023-06-30 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/LkbFaq/_edit)]{% endraw %}