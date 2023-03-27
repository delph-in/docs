# Background

This page is intended as a collection of pointers related to *using* the
ERG (for parsing or generation), with an eye towards first-time users.
The page was initiated by [StephanOepen](StephanOepen), who intends to
maintain it over time. Seeing that it will be important for the
information provided here to be accurate and up-to-date, please be both
pedantic and conservative in making (non-trivial) revisions.

# Choice of Run-Time Environment

To parse running text using the ERG, a number of tools are required.
Basically, there are three possible paths towards a software environment
supporting the ERG: (a) a [‘full-blown’ DELPH-IN distribution
for](#logon) Linux; (b) [the stand-alone ACE or PET
parsers](#standalone), which can be compiled in various
operating environments; and (c) a ‘thin’, portable client against the
[RESTful on-line interface](#restful). Each of these
choices has distinct advantages and limitations—discussed briefly in the
individual sections below. All three are regularly used and, thus,
‘suported’ by the ERG developers, who will be happy to try and assist
with installation and usage questions. Please contact lingo@delph-in.net
for support.

<a name="logon"/>

# (A) The LOGON Distribution: Installation

For Linux users, the most straightforward way of installing the full
DELPH-IN toolchain is through the so-called LOGON distribution (see the
pages [LogonTop](LogonTop) and [LogonInstallation](LogonInstallation)
for background). On any reasonably recent Linux distribution (running on
32- or 64-bit x86 derivatives, where 32-bit compatibility libraries need
to be available on natively 64-bit environments), do the following (note
that the full installation requires a little more than one gigabyte in
available disk space, and the process of downloading the full tree can
take between ten minutes and a couple of hours):

      svn export http://svn.emmtee.net/trunk logon

In case you do not have access to a suitable Linux installation, are
critically short on disk space, or lack the network bandwidth to
download multiple gigabytes (but are so fortunate as to have access to a
computer and the Internet)—please consider one of the processing options
(B) or (C) below (i.e. the stand-alone ACE or PET parsers, or the
RESTful on-line interface). Finally, the web-accessible [on-line
demonstration](http://erg.delph-in.net/) allows inspection of ERG
parsing outputs without software installation; note, however, that
comparatively tight limits are imposed on time and memory usage in this
interface.

# Parsing

For the full functionality of the LOGON tree, there is a certain amount
of first-time configuration, documented as Step (1) on the
[LogonInstallation](LogonInstallation) page. However, to merely parse a
sequence of sentences, it should work to directly move on to just
running the system, from the command line:

      cd logon
      ./parse --binary --erg+tnt --best 1 --text ./lingo/erg/etc/test.txt

Here, the file ‘test.txt’ provides a newline-separated list of strings
(using Un\*x-style line break conventions), where each line will be fed
to the parser individually for syntactic analysis (with a standard
configuration, handling unknown words on the basis of a PoS tagging
pre-processing step and lightweight RE-based named entity detection; for
details, see the [PetInput](/PetInput#ChartMapping) page).

If all goes well (as it should), the above command will produce tracing
outputs somewhat like the following:

      International Allegro CL Enterprise Edition
      8.2 [64-bit Linux (x86-64)] (Oct 27, 2011 17:11)
      Copyright (C) 1985-2010, Franz Inc., Oakland, CA, USA.  All Rights Reserved.

      This standard runtime copy of Allegro CL was built by:
         [TC13152] Universitetet i Oslo (IFI)

      ; Loading /ltg/oe/src/logon/dot.tsdbrc

      [...]

      [sh 0.0] (1) `The ERG is easy to install and use .' [100000] --- 1 (0.11|0.10:0.11 s) <58:1058> {2612:4471} (26M).
      [sh 0.0] (2) `Parsing English with the ERG is a real pleasure .' [100000] --- 1 (0.12|0.11:0.12 s) <59:959> {2108:5709} (32M).
      [sh 0.0] (3) `We are grateful to everyone who contributed to the grammar and software .' [100000] --- 1 (0.18|0.16:0.18 s) <84:1777> {4202:8436} (45M).
      [t40002] total elapsed parse time 0.4s; 3 items; avg time per item 0.1333s
      flush-cache(): flushing `erg/1111/test/12-01-17/pet' cache ... done.

The numbers following each parser input on the last few lines above
record various statistics, for example: (a) producing a single analysis
in all cases (meaning the grammar was able to assign a parse to each of
these utterances, and reflecting that the ‘--best 1’ option in our
example command asks for only the most probable analysis to be
extracted); (b) taking between 110 and 190 miliseconds per sentence; or
(c) requiring between 26 and 45 megabytes of dynamic memory while
parsing one sentence. More detailed information about the batch parsing
process is available through the
[LogonProcessing/BatchParsing](LogonProcessing_BatchParsing) page.

As a side effect of the above run, parsing results and statistics were
written into a simple (file-based, textual) database, a so-called
competence and performance profile. For our running example, this
profile will be located in a newly created sub-directory called
‘erg/1111/test/12-01-17/pet’, within the so-called [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) database home
‘lingo/lkb/src/tsdb/home/’ inside the LOGON tree.

# Output Formats

While it is possible to operate directly on the profile directory, it
may be more convenient (for non-expert users) to export key elements of
each parsing result into a (slightly) more human-readable form. To do
so, a command like the following can be be used (where the name of the
profile holding parsing results needs to reflect the current date, of
course):

      ./redwoods --binary --erg --default --composite --target /tmp \
        --export derivation,tree,mrs,eds --active all \
        erg/1214/test/16-05-23/pet

This command asks to export four distinct views on each analysis: (a)
the so-called derivation tree (i.e. the exact HPSG recipe); (b) a
simplified syntactic constituent tree (using a set of conventional
category labels); (c) a logical-form meaning representation in Minimal
Recursion Semantics (MRS); and (d) a reduced variant of the MRS, in the
form of elementary semantic dependencies (EDS). These outputs will be
available, in a newly created file in the ‘--target’ directory, named
after the original parsing profile, i.e. in this case
‘/tmp/erg.1111.test.12-01-17.pet.gz’ (note that export files by default
are compressed using GNU gzip(1); sample output for our running example
is available as a separate
[ErgProcessing/SampleExport](ErgProcessing_SampleExport) page; formats
(a), (c), and (d) are further discussed to some degree on the
[ItsdbDerivations](ItsdbDerivations), [ErgSemantics](ErgSemantics), and
[EdsTop](EdsTop) pages, respectively).

If you like what you are seeing, it is probably about time to read more
about the ERG and DELPH-IN technology, for example starting from the
[ErgTop](ErgTop) and [LogonTop](LogonTop) pages on this wiki, maybe
perusing our [mailing list archives](http://lists.delph-in.net), or
preparing a grant application or donation to work with us on improving
the grammar and tools. There are numerous ways of running the toolchain
and of adapting the grammar and engine to various subject domains,
genres, and more generally to a specific use case. Furthermore, (even)
more detailed syntacto-semantic information is available from the full
HPSG analyses delivered by the grammar than what is exposed through the
four interface representations shown in the above.

<a name="standalone"/>

# ACE and FFTB in the LOGON Distribution

Pre-compiled binaries of the Answer Constraint Engine (ACE)
parser–generator and its Full-Forest Treebanker (FFTB) are bundled with
the LOGON distribution. As an alternatively to the parsing command
suggested above, one can for example provide --erg+tnt/ace as the first
argument to the parse script, to invoke the ACE parser. Among the
distinctive features of ACE is its efficient implementation of chart
realization (i.e. surface generation). Further instructions on how to
invoke the ACE parser and full-forest treebanker from within the
integrated LOGON distribution are available on the
[LogonAnswer](LogonAnswer) page.

# (B) Stand-Alone Parsing (and Generation) with ACE or PET

The LOGON distribution bundles several of the DELPH-IN tools and
grammars, including various interfaces for data in- and output. For
‘core’ parsing or realization functionality using the ERG, the
stand-alone Answer Constraint Engine (ACE) parser–generator (implemented
in ANSI C), or the PET parser (implemented in ANSI C++) may be
sufficient. These tools can in principle be compiled for a wide range of
operating environments (with known success stories on Linux and MacOS
for ACE, and Linux and Windows for PET), but are also available in
pre-compiled form. Furthermore, the stand-alone parsers provide a more
light-weight software installation and make available both a
command-line and programmatic interface.

For instructions on how to obtain and run ACE, including pre-compiled
snapshots of recent ERG releases, please see the [AceTop](AceTop) page.

For some advice on using options to improve the utility of the ERG with
ACE, please see the [AceErgTuning](AceErgTuning) page.

<a name="restful"/>

# (C) RESTful Interactions with the On-Line ERG Service

As of mid-2016, a programmatic RESTful on-line interface to ERG parsing
is available, including a sample ‘thin’ client in Python and integration
in the [pyDelphin](https://github.com/delph-in/pydelphin) environment.
For emerging documentation on this interface, please see the
[ErgApi](ErgApi) page.

# Validation

The basic functionality of the LOGON tree, as exemplified in the
examples above is periodically validated (as long as we recommend
everyone use the *trunk*; more testers would be welcome):

-   2013/03/30: \#13162 @ patas.ling.washington.edu \[oe\]

-   2013/02/14: \#12918 @ login.coli.uni-saarland.de \[oe\]

-   2016/05/23: \#12918 @ login.coli.uni-saarland.de \[oe\]

-   2016/05/24: \#12918 @ patas.ling.washington.edu \[oe\]
