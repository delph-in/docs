{% raw %}# Overview

This page summarizes the procedure for obtaining and installing the LKB
software. The LKB is available as either a precompiled binary (for
select platforms) or as Common Lisp source code.

We recommend you start out with a binary installation unless you do not
have access to one of the hard- and software configurations for which
ready-to-run binaries are provided, or if you need to compile the
sources because you have code of their own that needs to be integrated
with the LKB. The complete LKB software is [open
source](http://www.opensource.org/); see the
[LkbCopyright](https://delph-in.github.io/docs/tools/LkbCopyright) page for details. Users running a
precompiled binary may choose to install the source code too, of course,
for example when trying to decide how to customize LKB behavior, or
simply as a somewhat low-level form of reference documentation.

Should you have any problems with installation, please email the support
address for the LKB (and other LinGO resources): lingo@delph-in.net.

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->

**Table of Contents**

- [Overview](https://delph-in.github.io/docs/tools/LkbInstallation#overview)
- [Supported Hard- and Software Platforms](https://delph-in.github.io/docs/tools/LkbInstallation#supported-hard--and-software-platforms)
- [Automated Installation](https://delph-in.github.io/docs/tools/LkbInstallation#automated-installation)
- [Which Version to Use: Stable vs. Latest](https://delph-in.github.io/docs/tools/LkbInstallation#which-version-to-use-stable-vs-latest)
- [Manual Installation](https://delph-in.github.io/docs/tools/LkbInstallation#manual-installation)
- [First-Time Use](https://delph-in.github.io/docs/tools/LkbInstallation#first-time-use)
  - [Directory for LKB Temporary Files](https://delph-in.github.io/docs/tools/LkbInstallation#directory-for-lkb-temporary-files)
- [Virtual Machine Image](https://delph-in.github.io/docs/tools/LkbInstallation#virtual-machine-image)
- [Development and Supported Lisp Environments](https://delph-in.github.io/docs/tools/LkbInstallation#development-and-supported-lisp-environments)
- [Further Pointers](https://delph-in.github.io/docs/tools/LkbInstallation#further-pointers)
- [Trouble Shooting](https://delph-in.github.io/docs/tools/LkbInstallation#trouble-shooting)
  - [amd64 Version](https://delph-in.github.io/docs/tools/LkbInstallation#amd64-version)
  - [libXm.so.4](https://delph-in.github.io/docs/tools/LkbInstallation#libxmso4)
  - [libXpm.so.4](https://delph-in.github.io/docs/tools/LkbInstallation#libxpmso4)
  - [uming font problem](https://delph-in.github.io/docs/tools/LkbInstallation#uming-font-problem)

<!-- markdown-toc end -->


# Supported Hard- and Software Platforms

Our recommended platform is Linux; however, there are options for
running the LKB on Windows and macOS.

Windows users can run recent versions of the LKB using
[Ubuntu+LKB](https://wiki.ling.washington.edu/bin/view.cgi/Main/KnoppixLKB).
The latest 'native' binary of the LKB for Microsoft Windows is available
at http://lingo.delph-in.net/builds/2004-09-17/. There are no newer
binary versions due to unresolved licensing issues.

For macOS there are two main alternatives, outlined on the
[LkbMacintosh](https://delph-in.github.io/docs/tools/LkbMacintosh) page. One is to run the new, fully open
source version of the LKB ('LKB-FOS'); see the [LkbFos](https://delph-in.github.io/docs/tools/LkbFos) page for
details. Another is to run a Linux version of the LKB in a virtual
machine.

# Automated Installation

For Linux (x86) and Solaris (sparc), there is experimental support to
perform a semi-automated installation. In a nutshell, users designate a
top-level directory for DELPH-IN resources (which we will refer to as
DELPHINHOME), download the installer, and then have everything
downloaded and installed for them. This procedure will also work in
Windows environments when the free [CygWin](http://www.cygwin.com)
environment is installed, but note that the *wget* utility must be
requested explicity when installing CygWin. For macOS users, and Windows
users without CygWin (or ones who cannot work out how to re-run the
CygWin installer in order to add *wget*), please see the instructions
for manual installation below.

Assuming you want all DELPH-IN tools and resources in a sub-directory
delphin/ to your own home directory, try the following:

      wget http://lingo.delph-in.net/etc/install
      bash install --home ~/delphin

The installer should successively retrieve archive files from the LKB
download site and generate reassuring messages like:

      install: `lkb_data.tgz' ... done.
      install: `lkb_linux.x86.32.tgz' ... done.
      install: `lkb_source.tgz' ... done.
      install: `itsdb_libraries.tgz' ... done.
      install: `itsdb_tsdb.tgz' ... done.
      install: `itsdb_capi.tgz' ... done.
      install: `itsdb_linux.x86.32.tgz' ... done.
      install: `itsdb_data.tgz' ... done.
      install: `itsdb_documentation.tgz' ... done.
      install: `itsdb_source.tgz' ... done.
      install: `eli.tgz' ... done.
      install: `erg.tgz' ... done.

Towards the end of the procedure, the installer will instruct you to add
a few lines to your shell initialization file (called .bashrc or .cshrc,
typically) and *emacs* start-up file, respectively. To record the choice
of the DELPH-IN top-level directory for future sessions, add a line
like:

      export DELPHINHOME=~/delphin

to the file \~/.bashrc in your home directory, in case your Unix login
shell is *bash* (the default in Linux), or use:

      setenv DELPHINHOME ~/delphin

in the file \~/.cshrc (or sometimes \~/.tcshrc) if you were using *tcsh*
or another *csh* derivative. Should you not know the type of your Unix
login shell, try:

      echo $SHELL

In case you are installing on Windows using CygWin, the DELPHINHOME
environment variable will need to be set in the global environment, i.e.
somewhere in the *Properties* dialogue that you get from left-clicking
on *My Computer* on the Windows desktop. Note that the DELPHINHOME path
must not include a trailing slash (or back slash depending on your OS),
i.e. it should be something like \~/delphin and not \~/delphin/.

This much should suffice to run the LKB, but the installer also suggests
that you set up *emacs*, the standard editor, for use with the LKB.
Integration of the LKB and *emacs* will simplify starting the LKB and
makes available some improved editing functionality for LKB grammars.
Following the instructions provided by the installer, use an editor to
open the file \~/.emacs from your home directory and paste the block of
lines suggested by the installer into this file, e.g.

      (let ((root (or (getenv "DELPHINHOME")
                      "/home/oe/delphin")))
        (if (file-exists-p (format "%s/lkb/etc/dot.emacs" root))
          (load (format "%s/lkb/etc/dot.emacs" root) nil t t)))

Save the file, then exit the editor and start a fresh *emacs* for the
changes to take effect. Assuming there were no further error messages,
the following command in *emacs* will start the LKB:

      M-x lkb RET

where M-x means pressing the *Alt* and *x* keys simultaneously, and RET
means pressing the *Enter* key (*Return* on some keyboards). A new
window named *LKB Top* should pop up. Hooray!

Those who prefer running the LKB without *emacs*, the LKB can be started
from a Unix command shell by executing the file lkb in a
platform-specific sub-directory of the DELPHINHOME tree, e.g. (for
32-bit Linux on x86):

      $DELPHINHOME/bin/lkb

In Windows, you can launch the LKB by locating the file lkb.exe (which
resides in $DELPHINHOME/lkb/windows) and double-clicking on it.

# Which Version to Use: Stable vs. Latest

The LKB system is constantly evolving. On-going development adds new
features and makes bug fixes as problems are discovered. Aiming to (i)
make both the latest functionality and fixes available to all users and
(ii) guarantee a functional baseline system at all times, the LKB
developers team maintains the system in two versions, *stable* and
*latest*. The *stable* version, usually, has been more thoroughly tested
than later code snapshots but may lack newer functionality or support
for recent versions of some operating systems (notably Linux). The
current LKB *stable* release was frozen in November 2002 and will likely
not work on recent Linux distributions; this version of the LKB is
available for download from <http://lingo.delph-in.net/stable/>. Also
available from the download site are regular code snapshots of the
current head revision in the LKB source code repository (versioned
according to build dates); the most recent snapshot of these (from
October 2014 or later) can be retrieved from
<http://lingo.delph-in.net/latest/>. While the LKB team is preparing an
updated *stable* release, right now, we recommend that all new users
consider using the *latest* version. The automated installer by default
picks the *latest* snapshot, thus can be run repeatedly to obtain
updates.

Note that there will not always be a Windows or macOS binary for the
latest release, and that you may have to work backwards to find it.

# Manual Installation

For users who cannot use the automated installer for some reason, the
following is a step-by-step account of what needs to be done for a full
LKB installation.

1. Check the supported platforms and decide on which version to
install;
2. Check system requirements and third-party software (e.g. OpenMotif
on Linux);
3. Create a top-level directory to hold the DELPH-IN software and
resources;
4. Create a directory for the LKB to create temporary files;
5. Download the appropriate selection of archive files and unpack each;
6. Add LKB-specific settings to your shell and *emacs* start-up files.

For the following, we will refer to the top-level directory as
DELPHINHOME. Good choices for this directory could be c:\\delphin\\ in
Windows, \~/delphin/ on Unix systems, or \~/Documents/delphin/ on macOS.
Decide on where you want your DELPH-IN files and make sure the target
directory exists (and is writable to you). Also, for successful
operation, the LKB will need a writable directory to store its temporary
files. In Windows, make sure that the environment variable TEMP (or TMP)
points to a valid and writable directory, or create a new directory
c:\\tmp. For Unix, make sure a directory called \~/tmp/ exists in your
home directory (or \~/Documents/tmp/ on the macOS).

Next, download the archive lkb\_data.tgz plus either (i) a binary
archive for your hardware (e.g. lkb\_windows.zip or
lkb\_linux.x86.32.tgz) or (ii) the LKB source code as lkb\_source.tgz.
Getting all three is fine too, of course. Unpack all archives into the
DELPHINHOME, e.g. using a tool like
[PowerArchiver](http://www.powerarchiver.com) or
[WinZip](http://www.winzip.com) on Windows, or the Unix *gzip* and *tar*
shell commands (which are also included in the free CygWin package for
Windows), e.g.

      gunzip -c lkb_data.tgz | tar xvf -

If doing a binary install, at this point, you should be able to locate
the LKB precompiled binary (lkb.exe in Windows and lkb.darwin\_x86\_64
on macOS; also see the automated install section above) and just execute
it. Confirm that the *LKB Top* window pops up and is functional and then
proceed to adding settings to your .emacs and .bashrc (or .tcshrc)
files; see above. Should you need or want to compile the LKB source
code, please consult the instructions on the
[LkbCompilation](https://delph-in.github.io/docs/tools/LkbCompilation) page.

# First-Time Use

Once you can run the LKB and get the *LKB Top* window (or alternatively
a version of the LKB source code loaded into Lisp in *tty* mode),
proceed to make sure the system is really functional.

- In the *LKB Top* window, select *Load \| Complete grammar* and
select one of the example grammars that come with the installation
(viz. in the lkb\_data.tgz archive). These grammars are located in
the sub-directory lkb/src/data/, relative to DELPHINHOME. Within the
grammar directory, itfs/ contains the examples from the
*Implementing Typed Feature Structure Grammars* (Copestake, 2002);
in the file selection dialogue that should have popped up, select
the file script from within the directory lkb/src/data/itfs/g7sem/.
- Once you have selected the script file to load the grammar, click
*OK* to request that the grammar be loaded (compiled, in a sense) by
the LKB. Watch the status messages that scroll by in the *LKB Top*
window and make sure there are no error or warning messages. Also,
check the Lisp console (the buffer called \*common-lisp\* when
running the LKB from *emacs*) for unexpected messages.
- Use the *Parse \| Parse input* command to analyze a first sentence
and confirm the default input (which should be *the dog barks* for
the grammar in g7sem/ grammar) by clicking *OK*. A new window should
pop up showing a parse tree. Click on the tree, selecting *Show
Enlarged Tree* to get a detailed view of the same tree with
clickable nodes. Confirm the functionality of pop-up menus available
on individual nodes, for example inspecting the feature structure of
the top node.

A more detailed account of a first-time tour is available as an
[excerpt](http://cslipublications.stanford.edu/pdf/1575862603h.pdf) from
Copestake (2002).

## Directory for LKB Temporary Files

These details can be ignored by most non-Windows users.

The LKB requires some temporary files be created for lexicon handling
(unless you use the [LkbLexDb](/LkbLexDb), which is recommended for
moderate to large lexicons but not for new users with small lexicons).
Unfortunately, there is no way of ensuring that the temporary files will
be created in a sensible place for every user on every system. For Unix
and Linux, the default location for the files is in a directory tmp in
the user's home directory. For Windows, the default location is
whereever the environment variable TEMP or TMP points or if that is not
a valid directory C:\\tmp. For macOS, the default location is
\~/Documents/tmp. If it is possible to use these locations, then simply
create the requisite directory before loading the first grammar. If it
is not convenient to have these directories, and you are using a binary,
then you need to add a function lkb-tmp-dir() to the user-fns.lsp file
for every grammar you use. For instance, you can add something like the
following to user-fns.lsp (or replace the function lkb-tmp-dir() if it
exists already):

      (defun lkb-tmp-dir ()
        (make-pathname :device "D" :directory "tmp"))

If you are compiling the LKB yourself from the source files, you can
edit the file $DELPHINHOME/lkb/src/main/user-fns.lsp so that the
function lkb-tmp-dir() identifies a more suitable directory, rather than
change it in every grammar. Or you may want to add the function
definition to a file that you use to load the LKB.

# Virtual Machine Image

There is a VirtualBox virtual machine image built by researchers at the
University of Washington, which boots you into Linux with the LKB:
[Ubuntu+LKB](https://wiki.ling.washington.edu/bin/view.cgi/Main/KnoppixLKB);
this may be useful for Windows and macOS users (see also
[LkbMacintosh](https://delph-in.github.io/docs/tools/LkbMacintosh)).

# Development and Supported Lisp Environments

The main development environment for the LKB is
[Franz](http://www.franz.com) Allegro CL and CLIM. Most development work
has been in Allegro CL on Linux, but the code will likely compile with
ease on other platforms for which Allegro CL and CLIM are available.
Most current development targets Allegro CL versions 8.0 and 7.0
primarily, but older versions back to, at least, Allegro CL version 5.0
should still work. The current LKB user interface is built atop CLIM
(the Common-Lisp Interface Manager), such that graphical interactions
and visualization will only be available with Allegro CLIM; there is
partial support for [LispWorks](http://www.lispworks.com) CLIM.

A fully open source version of the LKB is also available, which is not
dependent on any proprietary software; see [LkbFos](https://delph-in.github.io/docs/tools/LkbFos) for details.
The core of the LKB is ANSI Common Lisp and is known to compile in a
variety of free Lisp implementations, including

- [Steel Bank Common Lisp](http://www.sbcl.org/) on Linux (x86 and
others) and macOS (x86);
- [Clozure CL](https://ccl.clozure.com/) on macOS (x86);
- [CMUCL](http://www.cons.org/cmucl/) on Linux (x86) and Solaris
(sparc), possibly others;
- [CLISP](https://clisp.sourceforge.io/) on Linux (x86) and probably
others.

The above list is ordered according to recent experience of LKB
developers. These free, open source Lisp implementations typically vary
in which features are available on which platforms (e.g. native code
compilation, Unicode support, multi-threading, or socket support), and
users may need to experiment a little. The LKB provides a non-graphical
mode of interactions (called *tty mode*; see the
[GeFaqLispPromptTips](https://delph-in.github.io/docs/matrix/GeFaqLispPromptTips) page) that enables basic
grammar writing or deployment of an existing grammar. Also, there is
experimental support to provide graphical tools without CLIM for select
platforms; see the [LkbLui](https://delph-in.github.io/docs/tools/LkbLui) pages. For instructions on compiling
the LKB source code, please see the [LkbCompilation](https://delph-in.github.io/docs/tools/LkbCompilation)
pages.

# Further Pointers

In case of problems, please see the [LkbFaq](https://delph-in.github.io/docs/tools/LkbFaq) page. For
additional information on obtaining, installing, and running the LKB,
see:

- [LkbEmacs](https://delph-in.github.io/docs/tools/LkbEmacs): Instructions on interfacing the LKB to the
emacs(1) editor;
- [LkbFos](https://delph-in.github.io/docs/tools/LkbFos): Running the fully open source version of the LKB;
- [LkbCompilation](https://delph-in.github.io/docs/tools/LkbCompilation): Compiling the LKB source code (in
various lisps);
- [LkbFaq](https://delph-in.github.io/docs/tools/LkbFaq): Frequently Asked Questions related to using the
LKB;
- [LkbLexDb](/LkbLexDb): Setting up and using a lexical database
(optional);
- [LkbLui](https://delph-in.github.io/docs/tools/LkbLui): Linguistic User Interface (LUI) mode (optional);
and
- other Lkb pages - use the wiki search facilities to find them.

# Trouble Shooting

## amd64 Version

(2007-02-08) On ubuntu edgy the latest amd64 binaries require you to

- install your own libXm.so.3 (sudo apt-get install libmotif3)
  
  - This solves the following error

<!-- -->


    Warning: Loading clim2:climxm.so failed with error: libXm.so.3: wrong
    ELF class: ELFCLASS32.

- install the lib32 compatibility libraries
(sudo apt-get install lib32stdc++6 lib32gcc1 ia32-libs)
  
  - This allows swish++ and so on to work.

On a redhat based system you need to install something like

- openmotif-2.2.3-\*.rpm (the exact details depend on your
distribution)

For example, vinelinux 4.1 requires

- openMotif-2.2.3-0vl6.i386.rpm

## libXm.so.4

For recent versions of the lkb you may get this error message

    Warning: Loading sys:climxm.so failed with error:
            libXm.so.4: cannot open shared object file: No such file or directory.

If your distribution doesn't have the latest Open Motif, it should be
enough to link version three to version 4:

    sudo ln -s /usr/lib/libXm.so.3 /usr/X11R6/lib/libXm.so.4
    sudo ln -s /usr/lib/libXm.so.3 /usr/lib/libXm.so.4

Thanks to Cecilia Seidel for the bug report and work around.

You can also do something like this with recent LKBs (and it doesn't
require sudo privileges):

    export LD_LIBRARY_PATH=/path/to/delphin/lkb/lib/linux.x86.64/:$LD_LIBRARY_PATH

Thanks to Xuchen Yao for the solution (2010-04-18).

## libXpm.so.4

If you are running a modern (64-bit) Linux distribution, you may need to
specify 32-bit architecture when installing libraries. This can be done
by appending the string ":i386" to the library name. For instance, for
the error:

    Warning: Loading sys:climxm.so failed with error:
            libXpm.so.4: cannot open shared object file: No such file or directory.

The solution is to install the 32-bit libxpm package:

    sudo apt-get install libxpm4:i386

This can be iterated for each missing .so error.

## uming font problem

There is a problem with CLIM and the Chinese Unicode TrueType font
collection "AR PL UMing". The font does not return one of its
x-properties correctly, and that causes CLIM to crash.

Removing ttf-arphic-uming is the easiest solution.

    sudo dpkg --purge ttf-arphic-uming

Michael Goodman has filed a bug with the font in Ubuntu:
<https://bugs.launchpad.net/ubuntu/+source/ttf-arphic-uming/+bug/296161>

We encourage people to file bugs in their own distributions, and/or
confirm the bug in Ubuntu so that it gets a higher priority.
Alternatively, if you know about fonts then please fix it...

Last update: 2021-06-02 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/LkbInstallation/_edit)]{% endraw %}