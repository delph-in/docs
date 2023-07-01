{% raw %}# Overview

The LOGON tree makes a distinction between *core* components (a meager
three gigabytes) and *extra* resources; see the
[LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation) page for general installation
instructions, and the [LogonTop](https://delph-in.github.io/docs/tools/LogonTop) page for further background.
Of these, the latter are not required for basic functionality but rather
extend the LOGON tree with either proprietary third-party components
(which can only be released to sites with appropriate licenses,
typically members of the original LOGON consortium and external
co-developers) or 'bulky' add-on resources, for example the LinGO
Redwoods treebanks. This page provides information on which extra
components exist in the LOGON SVN repository, and on how to activate
these. In some cases, add-on components are only available for select
releases; for the earlier HandOn release of the LOGON tree, please see
the [LogonHandon](https://delph-in.github.io/docs/tools/LogonHandon) page.

Please note that, starting in November 2008, the *extra* mechanism is
new and remains to be tested. The information on this page is thus
expected to change more frequently than some of the more basic
documentation.

# A Note on SVN Access Methods

All access to the LOGON SVN repository is via the HTTP protocol,
typically to the address http://svn.emmtee.net/. The repository makes
available the open-source LOGON core for anonymous read-only access.
However, some of the add-on components can only be made available to
authenticated SVN users, for example members of the LOGON consortium who
have obtained licenses for the XLE LFG system or Allegro Common Lisp.
Thus access to proprietary LOGON add-ons is regulated by SVN user
accounts, where the original CVS accounts (and passwords) of the LOGON
core developers team have been imported into the SVN repository. Please
contact Stephan Oepen (oe *at* ifi.uio.no) for all questions relating to
SVN user accounts and access rights.

Due to what appears to be a quirk in how SVN handles [mixed-access
repositories](http://subversion.tigris.org/issues/show_bug.cgi?id=2712)
(i.e. repositories where some content is available to anonymous users,
while other parts require user authentication), LOGON co-developers with
SVN user accounts should connect through a different URL, viz.
http://logon.emmtee.net/, for example:

      svn checkout http://logon.emmtee.net/trunk logon

In fact, both URLs (svn.emmtee.net and logon.emmtee.net) connect to the
same physical SVN repository, they only differ in how they handle
authentication. We hope to be able to consolidate access methods as
newer SVN server revisions become available. In the following examples,
we use the environment variable $LOGONSVN instead of a specific SVN base
URL; once installed (see the [LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation)
page), the LOGON tree automatically sets$LOGONSVN to the appropriate SVN
access method. Note however that, for those with valid SVN user
accounts, it is always possible to uniformly use logon.emmtee.net as the
base SVN URL. Thus, if you hold a personal SVN account, it is
recommended to always use authenticated SVN URLs, even while installing
the freely available *core* tree or non-proprietary add-ons.

Finally, the repository structure for add-on components reflects the
distinction between *tagged* releases and the on-going *trunk* of
development. Again, in adapting the example SVN commands suggested
below, one may have to adapt directory names systematically (i.e. in
ways that should be obvious), to reflect the choice of LOGON version
currently installed. As of mid-2011, we will assume that users install
the *trunk* release. The [LogonSvn](https://delph-in.github.io/docs/tools/LogonSvn) page provides instructions
for using the SVN *switch* command to convert an existing local copy to
another release, for example updating from the frozen *Barcelona*
release to the cutting-edge *trunk* version.

# (1) English Redwoods Treebanks (Public)

The core directory lingo/redwoods/ contains the environment for
semi-automated parse selection (and, at least in principle, realization
ranking and MRS re-ranking) experiments, using treebanked versions of
the LOGON tourism and the [WeScience](http://www.delph-in.net/wescience)
corpora. In the *core* installation, this directory only contains the
scripts and various configuration files for such experimentation, but
not the actual treebanks or corresponding version of the ERG. To
download the complete data, for example for the 1214 release of the ERG,
execute the following:

      cd $LOGONROOT/lingo/redwoods
      svn switch --ignore-ancestry $LOGONSVN/extras/1214/lingo/redwoods

The SVN *switch* command makes a sub-directory of an SVN-controlled tree
point to a different module from the same repository (i.e. it does not
allow 'mixing and matching' across repositories). Please see the [SVN
documentation](http://svnbook.red-bean.com/) for further information.

# (2) Japanese Hinoki Treebanks (Public)

Similar to the English Redwoods treebanks, there is a treebank of some
15,000 sentences of Japanese, parsed with the JACY grammar and manually
disambiguated. To install the Hinoki treebank, replacing the stub
directory that is part of the core distribution, run the following:

      cd $LOGONROOT/ntu/hinoki
      svn switch $LOGONSVN/extras/trunk/ntu/hinoki

# (3) Test Version of the ERG (Public)

With most language pairs depending on the ERG for parsing or generation,
updating to newer versions of the ERG is not (always) a straightforward
step. For a transitory testing period, at least, it is possible to
install the latest revision of the ERG in a separate directory,
lingo/terg/. As the LOGON tree and the official DELPH-IN SVN repository
share the same infrastructure, in fact really reside in a single
repository that is accessible through several URLs, it is possible to
dowload a recent ERG version as follows:

      cd $LOGONROOT/lingo/terg
      svn switch --ignore-ancestry $LOGONSVN/erg/trunk .
      flop english

Please see the [LogonSvn](https://delph-in.github.io/docs/tools/LogonSvn) page for instructions on switching
between a tagged release and the current development head revision. With
the right versions of everything in place, the following should work
(and use the grammar in lingo/terg/):

      cd $LOGONROOT
      ./parse --binary --terg+tnt --best 1 --count 2 cb

# (4) Allegro Common Lisp (Restricted)

The LOGON tree includes so-called run-time binaries, precompiled
executable versions of the main LOGON software (which comprises the LKB,
[\[incr tsdb()\]](http://www.delph-in.net/itsdb), and LOGON extensions).
These run-time binaries are sufficient for grammar development
(including transfer and realization), experimentation with the MT
functionality, treebanking, web-accessible on-line demonstrations, and
(we believe) MaxEnt experimentation. However, to make modifications to
the Lisp (source) code of individual components or compile in additional
software, a complete Common Lisp system is required. The LOGON tree is
built using [Allegro Common
Lisp](http://www.franz.com/products/allegrocl/) (ACL), and this is the
only Lisp compiler that supports the complete LOGON functionality (this
is mainly due to some parts of the LOGON system making use of Lisp
functionality that is not part of the ANSI Common-Lisp standard, i.e. is
not portable across Lisp implementations).

The directories franz/linux.x86.32/ and franz/linux.x86.64/ provide
stubs for the site-specific installation of Allegro Common Lisp. The
*core* versions of these directories only contain the configuration
files used by LOGON developers to tune Allegro CL to their needs. For
ease of installation, complete ACL packages for 32- and 64-bit Linux are
available through SVN to authenticated users whose sites already hold a
valid ACL 8.1 license. Use the following command to download the Lisp
compiler:

      cd $LOGONROOT/franz
      svn switch --ignore-ancestry $LOGONSVN/extras/trunk/franz

However, even though we provide the base Lisp files (including all
software updates provided by the original vendor) and customized Lisp
binaries, you will still need to obtain the license files owned by your
site. These files are called devel.lic and are provided by Franz Inc.
customer support to the contact person at your site. Depending on your
platform (32- vs. 64-bit, or both), copy your own devel.lic into the
appropriate directory. For example, assuming a 32-bit installation:

      cp devel.lic $LOGONROOT/franz/linux.x86.32

To confirm that your license file is valid and compatible with the LOGON
version of ACL (which is version 8.1, as of November 2008), consider
running the following test (which should complete without error
messages):

      cd $LOGONROOT/franz/linux.x86.32
      ./alisp -I base -e "(excl:exit)"

# (5) \[incr tsdb()\] Skeletons for Penn Treebank (Restricted)

The [\[incr tsdb()\]](http://www.delph-in.net/itsdb) system supports
importing treebanks in PTB 'merged' format into skeletons. For the WSJ
portion of the PTB, there exist two sets of skeletons: the first set is
organized by PTB sections and called wsj00 to wsj24. The second set
provides the same data, but broken up into smaller profiles, each of a
maximum of 500 items; these skeletons are called wsj00a, wsj00b, and so
forth. To install the WSJ skeleton add-on, use the following command:

      cd $LOGONROOT/lingo/lkb/src/tsdb/skeletons/english/ptb
      svn switch --ignore-ancestry $LOGONSVN/extras/trunk/lingo/lkb/src/tsdb/skeletons/english/ptb

Only SVN users whose home sites hold a PTB license can be granted read
access to this add-on component.

Last update: 2019-12-06 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/LogonExtras/_edit)]{% endraw %}