{% raw %}# Overview

The LOGON infrastructure combines about a dozen or so independently
developed resources into an integrated MT environment. In most cases,
the individual components (e.g. the LKB, PET, or [\[incr
tsdb()\]](http://www.delph-in.net/itsdb)) function much like they would
in isolated installation. However, for better integration of the LOGON
tree, in a few cases the default configurations may differ from such
isolated installations, and there is some functionality that is only
activated in the LOGON universe. This page enumerates such divergences
and LOGON-exclusive functionality, and aims to enable users to revert to
more familiar defaults if desired.

# International Character Support

Since around 2006, several DELPH-IN developers have worked with [Franz
Inc.](http://www.franz.com), the developer of the Common Lisp system
behind many of the LOGON pieces, to improve display and input of
international characters in the Common Lisp Interface Manage (CLIM).
CLIM is the widget library used to build the (original) LKB graphical
user interface. Since early 2007, the LOGON tree has been the testbed
for patches to improve internationalization in CLIM, as they have been
provided incrementally by Franz Inc. Sometime early in 2008, Franz Inc.
made these patches official, i.e. they are now part of the official
patch distribution (and have since been revised a few more times).

The LOGON run-time binaries are built with the latest CLIM patches (as
of late 2008), and both display and input of a wide variety of character
sets should be possible in this environment (we have tested and
confirmed at least the following: German, Japanese, Korean, and
Norwegian). As tends to be the case with internationalization problems,
it is important to align the Un\*x and Lisp *locale* (value of $LANG or
$LC\_ALL, and value of the -locale command line argument to ACL), and to
make sure emacs(1) and Lisp agree on the appropriate coding system. The
LOGON tree attempts to get all of these parameters right
'out-of-the-box', mostly by pushing for
[UTF-8](http://www.cl.cam.ac.uk/~mgk25/unicode.html) as the default
encoding across languages. While the non-LOGON LKB binaries (see the
[LkbInstallation](https://delph-in.github.io/docs/tools/LkbInstallation) page) are not yet built using the
latest set of CLIM patches as of late 2008, it is expected that they too
will activate improved international character support (on Linux) in the
near future.

# Linguistic User Interface

The LOGON tree enables the replacement Linguistic User Interface (LUI)
for the LKB by default; see the [LkbLui](https://delph-in.github.io/docs/tools/LkbLui) page for further
information. However, LUI as of late 2008 only supports the display of
trees, AVMs, (single) MRSs, and parsing charts, hence the LOGON
infrastructure will often still fall back on the original LKB CLIM
widgets. This is specifically the case for the LOGON multi-MRS browser,
i.e. the widget that interactively displays the results of transfer. To
render individual MRSs in the more compact (and, some say, more
user-friendly) LUI browser, the *Debug \| Simple* and *Debug \| Index*
commands can be used in the multi-MRS window.

# Discriminant Mode

The Redwoods tree comparison and treebanking tools support two distinct
modes of discriminant extraction, one syntactic in nature (operating on
HPSG derivations), the other semantic (operating on variable-free MRS
triples). Unlike the stand-alone LKB and [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) installations, the LOGON tree
opts for semantic discriminant mode by default, primarily so as to also
support comparison and treebanking of analysis results from non-HPSG
systems. The two discriminant modes are (somewhat opaquely) named
:classic and :modern, for syntactic and semantic discrimination,
respectively. The LOGON default is :modern, and can be changed as
follows

      (setf lkb::*tree-discriminants-mode* :classic)

To semi-permanently change the default, a command like the above can be
put in the per-user .lkbrc LKB start-up file in the user home directory.

# \[incr tsdb()\] Skeleton Directory

The LOGON tree sets the default [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) skeleton directory to
Norwegian, reflecting the primary source language of the original LOGON
consortium. To globally change the default skeleton directory, a command
like the following can be executed interactive, or placed in the
per-user .tsdbrc [\[incr tsdb()\]](http://www.delph-in.net/itsdb)
start-up file:

      (tsdb :skeletons "~/logon/lingo/lkb/src/tsdb/skeletons/english")

However, note that the various LOGON batch processing scripts (see the
[LogonProcessing](https://delph-in.github.io/docs/tools/LogonProcessing) page for details) will adjust the
skeleton directory appropriately, i.e. reflecting the choice of grammar
or language pair.

# Language Modeling and MRS Ranking

# Web-Accessible Demonstrators

# MaxEnt Experimentation

Last update: 2018-01-13 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/LogonIdiosyncrasies/_edit)]{% endraw %}