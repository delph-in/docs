{% raw %}# Overview

DELPH-IN has a collection of sofware systems that iterpret its
descriptive formalisms. There is not one single engine for all needs,
however, but rather a toolbox of component systems with different
characteristics, for various use cases. Interactive grammar development,
for example, requires flexible debugging and visualization tools,
whereas batch parsing, say, will capitalize more on premium efficiency,
as well as on robustness measures and interfaces that enable application
building.

For some grammars, there are Web-accessible *on-line demonstrators*,
e.g. at <http://erg.delph-in.net> for the ERG. These demonstrators
usually utilize a combination of DELPH-IN processing engines, but they
are limited in how much computational resources they will have available
and how much interactive debugging and visualization they support.

Following is an overview of processing levels in parsing (as implemented
in the ERG and the PET parser):

<img src="http://www.delph-in.net/2013/tutorial/pipeline.png" title="http://www.delph-in.net/2013/tutorial/pipeline.png" class="external_image" alt="http://www.delph-in.net/2013/tutorial/pipeline.png" />


TODO: Add schematic of processing pipeline in the realization direction.

Not all DELPH-IN engines implement all sub-formalisms and processing
directions. A mildly out-of-date
[summary](http://sweaglesw.org/linguistics/delphin-engines.html) by
Woodley Packard provides a useful overview.

# LKB: Linguistic Knowledge Builder

The LKB (Copestake 2002) has served as the main platform for interactive
grammar development in the past 15 or so years. It supports parsing and
generation and makes available a range of visualization and debugging
tools. However, the LKB lacks some robustness measures (notably chart
mapping and unknown word handling in parsing) as well as some more
recent algorithmic improvements (e.g. selective unpacking with non-local
features). Also, it is about one order of magnitute less efficient than
engines optimized primarily for premium run-time performance.

The LKB is written in ANSI Common Lisp, building the Common Lisp
Interface Manager (CLIM) for its GUI. To compile the LKB from source
including the GUI, Franz Allegro Common Lisp is required. Pre-compiled
binaries are available for Linux. The LKB was originally developed by
Ann Copestake and since the mid-1990s has been substantially extended
and revised for use in DELPH-IN with the help of, among others, John
Carroll, Rob Malouf, and Stephan Oepen.

# PET: Platform for Efficient Experimentation with HPSG Processing Techniques

PET (Callmeier 2002) has served as the main batch parsing engine and
application delivery vehicle for the past 12 or so years. PET provides
(almost) no visualization facilities and is typically invoked from the
command line, reading inputs from stdin and reporting results to stdout.
Furthermore, PET provides interfaces to [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) and a socket-based as well as
an XMLRPC server interface.

PET only supports parsing, but (unlike the LKB) it makes available a
range of pre-processing and robustness measures that facilitate
broad-coverage analysis of running text. These include

- more accurate characterization in REPP
- the ability to call out to a PoS tagger to annotate a token sequence
- chart mapping for lightweight NE recognition and token normalization
- generic lexical entries
- lexical filtering (to remove redundant lexical items)
- selective unpacking with non-local features

PET lacks support for post-parsing idiom filtering (based on MRS
templates), however.

PET is written in ANSI C and C++, with a number of (relatively common)
external dependencies. Pre-compiled binaries are available through the
LOGON tree. PET was originally developed by Ulrich Callmeier; since
around 2001, Stephan Oepen, Bernd Kiefer, Yi Zhang, Peter Adolphs, and
Rebecca Dridan, among others, have made substantive code contributions.

# Other Engines

In 2013, two additional engines exist that implement the
DELPH-IN formalism.

The **Answer Constraint Engine** (ACE; see the [AceTop](https://delph-in.github.io/docs/tools/AceTop) page)
has been under development for about ten years, by Woodley Packard, and
has recently been released into the DELPH-IN open source repository
under the MIT License. ACE is an efficiency-oriented run-time engine,
somewhat similar in philosophy to PET, but implements both parsing and
generation (and pretty much all sub-formalisms and processing layers
sketched above, including idiom filtering).

ACE provides an interface to [\[incr
tsdb()\]](http://www.delph-in.net/itsdb). It is written in ANSI C with a
few external dependencies. Pre-compiled binaries are available from the
[ACE download page](http://sweaglesw.org/linguistics/ace/) as well as
through the LOGON Tree.

**Another Grammar Engineering Environment** (agree; see the
[AgreeTop](https://delph-in.github.io/docs/garage/AgreeTop) page), implementing the DELPH-IN formalism, was
recently released under the MIT open-source license. agree is built on
top of the C\# and .NET platform and aims to combine advanced GUI
capabilities with good run-time effiency, capitalizing heavily on
multi-threading. agree supports both parsing and generation and most,
though not all of the relevant sub-formalisms and processing layers. The
main agree developer is Glenn Slayden, with assistance from Spencer
Rarrick.

# \[incr tsdb()\]: Profiling and Treebanking Environment

The *tee ess dee bee plus plus* ([\[incr
tsdb()\]](http://www.delph-in.net/itsdb)) software is a cross-processor
environment to support

- the maintenance of annotated test suites and test corpora
- batch processing (using various engines) with detailed records of
system behavior
- interactive, graphical analysis of individual test runs and
constrastive analysis of multiple runs
- discriminant-based treebanking and (semi- or fully automatic)
updating of treebanks
- training and evaluation of discriminative parse and realization
ranking models

[\[incr tsdb()\]](http://www.delph-in.net/itsdb) has been developed
since the mid-1990s by Stephan Oepen; it combines some ANSI Common Lisp
with ANSI C and Tcl/Tk. Pre-compiled binaries are available for Linux.

# LUI: Linguistic User Interface

# Parse and Realization Ranking

Last update: 2013-07-30 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/DelphinTutorial_Processing/_edit)]{% endraw %}