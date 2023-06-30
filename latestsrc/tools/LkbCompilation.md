{% raw %}# Overview

Below are instructions for compiling LKB source code in Franz Allegro
Common Lisp with Allegro CLIM. To be able to do this, you will need to
buy a license from Franz Inc. The LKB may also be compiled in other
Common Lisp implementations (see the section on open source Lisps
below), but to get a 'native' graphical user interface requires a
substitute for Allegro CLIM, such as McCLIM. In the absence of the
latter, you may be able to use the non-CLIM Linguistic User Interface
([LkbLui](https://delph-in.github.io/docs/tools/LkbLui)) to get graphics capabilities.

When compiling the LKB in a Lisp without CLIM, the system will operate
in what is called *tty* mode, a command-line based environment that
still allows access to most basic functionality. See the
[LkbTty](/LkbTty) page for more information on *tty* mode.

# Building the LKB in Allegro CL

## Preparatory Steps

The following assumes that you have completed the installation
instructions from the [LkbInstallation](https://delph-in.github.io/docs/tools/LkbInstallation) page, including
downloading and unpacking the archive lkb\_source.tgz into a directory
we will refer to as DELPHINHOME. Also, make sure the directory for LKB
temporary files is available and, on Linux, confirm that a compatible
version of OpenMotif is installed when using a local Allegro CL license
(check the release notes for your software). Finally, Allegro CL by
default ships with CLIM *not* included in the images. To generate a
CLIM-enabled Allegro CL binary, execute the following from within the
Allegro CL installation directory (*not* the DELPHINHOME directory):

      ./alisp -L buildclim.cl -kill

This should result in a new executable file clim in the current
directory. While you are at it, consider getting the latest patches from
Franz and re-building your images (see the release notes for
instructions).

## Compiling the LKB Source Code

Start your Lisp environment, preferably as a sub-process to *emacs*.
When using Allegro CL, use the clim binary (see above). The
[LkbEmacs](https://delph-in.github.io/docs/tools/LkbEmacs) page has instructions on how to run the LKB and
Lisp with *emacs*, the standard editor.

Within Lisp, load the LKB compilation environment. In our examples, we
will use pathnames relative to DELPHINHOME, so you can either make sure
the Lisp considers DELPHINHOME the current directory (usually starting
the process from within that directory should suffice) or expand the
path values in these examples to full directory names relative to your
system.

If your default image does not include CLIM, then you need to load it;
either *\[Linux\]*

       (require :climxm)

or *\[Microsoft Windows\]*:

       (require :climnt)

If you don't have CLIM at all, you can still compile the LKB, but will
only be able to use the tty mode.

Now enter:

      (load "lkb/src/general/loadup") 

There should be no error messages from this step. Next, request that the
complete LKB code base be compiled (this now includes the MRS code):

      (compile-system "lkb" :force t)

This compiles and loads all the LKB files that are appropriate for your
system. There may be some warning messages from the compiler -- these
can usually be ignored, but if you subsequently have problems using the
LKB, you should redo this process and examine the warning messages. You
should now see the *LKB Top* interaction window, unless you are running
in *tty* mode.

The :force keyword to compile-system() in the example above will make
sure that all files are re-compiled cleanly. This is necessary when
loading the LKB for the first time and every time you obtain updates to
the LKB source tree. Once all files are compiled on your local system,
however, it will be faster to just load the LKB code into Lisp, using:

      (load-system "lkb")

## Building Images

It is possible to make a development image in Allegro CL, for instance
to make the LKB available to several users at your site. Take a look at
the files image.lsp and deliver.lsp in the lkb/src/ACL\_specific/
directory. Either one could be tuned for your needs, e.g. by adjusting
path values or turning off :runtime mode. Loading one of these files
into Allegro CL (after loadup.lsp) should result in a precompiled
development image.

# Open Source Lisps and McCLIM

A fully open source version of the LKB is available, which uses SBCL and
McCLIM, both of which are open source. Pre-built binaries are available
for Linux and macOS. See the [LkbFos](https://delph-in.github.io/docs/tools/LkbFos) page for the current
status of this version.

# Public Source Code Repository

If you want to take a look at the source code for the LKB and [\[incr
tsdb()\]](http://www.delph-in.net/itsdb), you can access it through the
SubVersion (SVN) revision control system, for example (in a typical Unix
environment, or on Windows with suitable add-on software installed):

      svn checkout http://svn.delph-in.net/lkb/trunk lkb

Last update: 2017-12-18 by JohnCarroll [[edit](https://github.com/delph-in/docs/wiki/LkbCompilation/_edit)]{% endraw %}