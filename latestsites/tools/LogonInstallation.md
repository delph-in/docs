{% raw %}# Overview

This page provides installation instructions for the LOGON
infrastructure (see the [LogonTop](https://delph-in.github.io/docs/tools/LogonTop) page for general
information), combined with background information on the use of
[SubVersion](http://subversion.tigris.org) (SVN) for both delivery and
collaborative development of the LOGON source tree. As of late 2008, the
LOGON tree is exclusively supported on Linux (32- or 64-bit x86), where
any reasonably up-to-date distribution should work. Most of the core
LOGON development is performed on [Redhat Enterprise
Linux](http://www.redhat.com/rhel/) and
[Fedora](http://fedoraproject.org/) distributions, but several of the
LOGON component maintainers successfully use
[Ubuntu](http://www.ubuntu.com/) Linux. Please see the
[LogonRedhat](https://delph-in.github.io/docs/tools/LogonRedhat), [LogonUbuntu](https://delph-in.github.io/docs/tools/LogonUbuntu), and
[LogonArch](https://delph-in.github.io/docs/tools/LogonArch) pages for distribution-specific information.
Although both 32- and 64-bit Linux installations should work fine, with
a 64-bit distribution it will be necessary to also install 32-bit Linux
compatibility mode (which for many distributions is part of the standard
configuration), as the LOGON tree includes some binaries that (so far)
are only available in 32-bit versions. In general, as of late 2012, a
64-bit Linux installation (*with* 32-bit compatibility mode enabled) is
the recommended setup.

# (0) Background: Organization of the LOGON Source Tree

The LOGON tree combines a large number of resources into a canonical
directory structure. The tree can be installed in an arbitrary location
on the filesystem, for example in a directory logon in the user home
directory. In the following, we will use the shell variable $LOGONROOT
to refer to the top-level directory of the LOGON tree, which for typical
users might be the directory \~/logon/, i.e. a sub-directory in the user
home directory. For successful operation, the LOGON system assumes that
this shell variable is set correctly, and the instructions below will
guide you through the process of downloading the source tree and
performing a few first-time steps to adapt your user account for use of
the LOGON software.

The top-level directory structure of $LOGONROOT is organized by
*providers*, i.e. (typically) the site where a resource was originally
developed or made available. In this scheme, for example, lingo refers
to the [LinGO Laboratory](http://lingo.stanford.edu) at Stanford
University, and dfki to the [German Research Center in Artificial
Intelligence](http://www.dfki.de/). By and large, the second level of
sub-directories corresponds to individual resources, e.g. lingo/erg/ to
the [LinGO English Resource Grammar](http://www.delph-in.net/erg) or
uio/wescience/ to the WeScience corpus provided by the [University of
Oslo](http://www.ifi.uio.no/research/groups/lns/lt.html). Please note
that, while everything available publicly through the LOGON tree is
licensed for free distribution, individual components vary as to which
specific licenses they use (most use one of a handful of standard [open
source](http://www.opensource.org/) licenses). Please see the individual
directories (or headers of individual files) for license details and
contact the LOGON developers if you feel that there is incorrect or
missing information on licensing conditions.

Development of the LOGON tree is distributed over a group of
co-developers. For each component, give or take, there is one individual
who acts as the primary maintainer of that module. Component maintainers
decide on which versions (in what exact configuration) to include in the
LOGON tree, and they share the responsibility for testing component
functionality and inter-operability with other modules. The LOGON
co-developers use SVN to coordinate their efforts, and hence the LOGON
SVN repository has a dual function: (a) as the delivery vehicle for
LOGON users and (b) as the revision control system for on-going
development. At regular intervals (hopefully), the LOGON developers will
*tag* snapshots of system configurations that have been tested to a
certain degree; these tags, loosely speaking, provide releases of the
LOGON tree recommended for typical users. Continuous development, on the
other hand, proceeds on the SVN *trunk*. Thus, to obtain 'bleeding-edge'
test snapshots of the LOGON software, it may also be feasible to use SVN
to obtain the current development trunk, say if a specific new feature
is required that is not yet availabled in a tagged release. The most
recent stable release is called Barcelona and dates from mid-2009. In
the following, we will assume that users install the current development
trunk.

Finally, the LOGON tree comprises tens of thousands of files, totaling
several gigabytes of disk space. There is an open-source *core* that is
required for all installations. To augment core functionality with
either proprietary third-party software (e.g. Allegro Common Lisp or the
XLE LFG system) or 'bulky' add-on modules, the repository is configured
to provide overlays to the core tree on demand. These extensions, and
how to use SVN to install them, are discussed on the
[LogonExtras](https://delph-in.github.io/docs/tools/LogonExtras) page. If you expect to install proprietary
add-ons (i.e. have a personal SVN user account), please read the
[LogonExtras](https://delph-in.github.io/docs/tools/LogonExtras) page before you proceed; it is advisable to
start with the authenticated SVN access method from the beginning, i.e.
already while installing the freely accessible *core* tree.

# (1) Obtaining the Core Files

To obtain an initial copy of the LOGON core, decide on where you want
the tree to reside (and make sure you have at least four gigabytes of
available disk space), and execute the following command from the Un\*x
shell:

      svn checkout http://svn.emmtee.net/trunk logon

Depending on the quality of your Internet connection (and proximity to
the University of Oslo), this initial download may take between ten
minutes and a few hours. As SVN copies files from the repository into
your local directory tree, it generously prints re-assuring messages.

# (2) First-Time Configuration

Once the download is complete, you will need to make two additions to
your account configuration. This is a one-time step that will make sure
that the global shell variable $LOGONROOT is set, and that emacs(1) (our
editor of choice) is configured for use with LOGON. In case you chose a
different directory than \~/logon/ for $LOGONROOT, please adjust the
following examples accordingly.

First, edit the file \~/.bashrc (your shell start-up configuration file)
and add the following towards the end:

      #
      # include LOGON-specific settings
      #
      LOGONROOT=~/logon
      if [ -f ${LOGONROOT}/dot.bashrc ]; then
        . ${LOGONROOT}/dot.bashrc
      fi

Save the file; then edit \~/.emacs (the standard editor configuration
file) and add:

      ;;;
      ;;; include LOGON-specific settings
      ;;;
      (if (getenv "LOGONROOT")
        (let ((logon (substitute-in-file-name "$LOGONROOT")))
          (if (file-exists-p (format "%s/dot.emacs" logon))
             (load (format "%s/dot.emacs" logon) nil t t))))

Save this file too, then log out and back in (so that changes to the
start-up files can take effect).

# (3) Running the LOGON Core

For ease of interaction, interactive use of the various LOGON components
is best accomplished through emacs(1), the standard editor. Start emacs
and type:

      M-x logon RET

If the command sounds cryptic, get some help on emacs(1).

Two new windows should pop up, one labelled *LKB Top*, the other
labelled *\[incr tsdb()\] Podium* — great news!

Ideally, you will see a number of entries in the body of the \[incr
tsdb()\] podium window; select (by clicking once):

      gold/erg/mrs

and try *Browse \| Results* from the menu. In the new window that opens,
double-click on one of the red numbers in the column labelled MRS; the
LKB MRS browser should pop up, and the *Previous* and *Next* buttons
navigate through results in case of multiple MRSs.

If you have trouble running the *logon* binary, checkout the [LKB
Installation page](https://delph-in.github.io/docs/tools/LkbInstallation), especially the final section on
troubleshooting.

# (4) Batch Processing

The LOGON tree includes a number of scripts to automate batch parsing,
batch generation, and batch translation (and a few more common tasks).
Typically, all such scripts configure the LOGON environment for batch
processing (i.e. load and initialize all the components required) and
then use [\[incr tsdb()\]](http://www.delph-in.net/itsdb) facilities to
execute the actual processing. Thus, results will be recorded as a new
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) profile (often combined
with one or more log files). To test system functionality, execute the
following (from the shell):

      cd $LOGONROOT
      ./batch --binary --jaen mrs

This command should load the Japanese—English system instantiation and
translate the (Japanese) MRS test suite. Once the batch process is
complete, use *Options \| Update \| Database List* in [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) to re-read the profile
inventory. There should be a new entry, with a name like
ja2en/mrs/08-11-16 (assuming the current date were November 16, 2008).

Or try batch parsing using the ERG, for example

      ./parse --binary --erg+tnt --best 1 --text ./uio/data/romsdal.en.txt

The [LogonProcessing](https://delph-in.github.io/docs/tools/LogonProcessing) page provides more documentation
on the various scripts and available system configurations.

# (5) Interactive MT Development

LOGON uses PVM and distributed computing quite heavily, which makes
interactive debugging more interesting than it would be in a single,
monolithic process. Typically, while working on one language pair, a
comfortable development environment will comprise two instances of the
LOGON core (see above) running interactively, one for transfer, one for
generation. The third component, analysis, in this scenario is best run
as a client to the transfer system.

For Norwegian–English, for example, launch the first interactive LOGON
session (from within emacs(1)). Note that the Norwegian analysis grammar
is not part of the LOGON core, however, hence the following steps will
only be applicable to members of the original LOGON project (as time
passes, the Norwegian–English MT configuration may even disappear from
the LOGON tree, seeing it is no longer maintained since around 2007).
Then, load the NoEn transfer grammar, either by using the LKB menu entry
*Load \| Complete Grammar*, or the following LOGON short-hand command:

      (rsa :noen)

Still in the same session, create an [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) parsing client for Norwegian,
using the command

      (tsdb:tsdb :cpu :norgram :task :parse :file t)

Once the client has been successfully registered, confirm parsing
functionality:

      (mt:parse-interactively "Bodø er tett befolket.")

This command should yield a new window, showing the MRS(s) corresponding
to parsing results. Use the buttons labeled *Previous* and *Next* to
cycle through multiple results; click *Transfer* to invoke the current
transfer grammar on the active MRS.

In order to generate from transfer results, launch another interactive
LOGON session and load the generation grammar, assuming our current
scenario, for example by going through the *Load \| Complete Grammar*
LKB menu again, or using the short-hand

      (rsa :erg t)

Then make sure the generator is initialized, and running in server mode.
The LOGON rsa() command — with its second, optional t argument — will
automatically create the generator indices and turn on server mode. If
you prefer working through the LKB menues, execute *Generate \| Index*,
followed by *Generate \| Start server*.

At this point, clicking the *Generate* button on the transfer result
window (which looks much like the analysis result window), should send
the active MRS to the generator server, which should display messages of
the form:

      [12:54:19] translate(): read 1 MRS as generator input.
      [12:54:19] translate(): processing MRS # 0 (3 EPs).
      [12:54:19] translate(): 18 generation results.

Note that, for this way of running the generator in server mode, the
values of \*translate-grid\* (in the LKB package) need to be compatible.
The NoEn transfer grammar, for example, includes the global parameter

      (setf *translate-grid* '(nil . (en)))

which means that it cannot run as a generator server (obviously, being a
transfer process), and will look for a generator server for English.
Correspondingly, the ERG generation grammar includes the setting,
declaring itself as a suitable generation grammar for English:

      (setf *translate-grid* '(en))

Last update: 2014-08-12 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/LogonInstallation/_edit)]{% endraw %}