{% raw %}Contents

1. [Overview](https://delph-in.github.io/docs/garage/PetTop#Overview)
2. [Obtaining PET](https://delph-in.github.io/docs/garage/PetTop#Obtaining_PET)
3. [Compiling and Installing PET](https://delph-in.github.io/docs/garage/PetTop#Compiling_and_Installing_PET)
4. [PET for developers](https://delph-in.github.io/docs/garage/PetTop#PET_for_developers)
5. [Compiling a grammar](https://delph-in.github.io/docs/garage/PetTop#Compiling_a_grammar)
6. [Running PET](https://delph-in.github.io/docs/garage/PetTop#Running_PET)
7. [Tips and Tricks](https://delph-in.github.io/docs/garage/PetTop#Tips_and_Tricks)
8. [History](https://delph-in.github.io/docs/garage/PetTop#History)

# Overview

The PET system for efficient processing of unification-based grammars is
an industrial strength implementation of the typed feature structure
formalism used in [DELPH-IN](http://www.delph-in.net) grammars. PET
reads the exact same source files (modulo some configuration options) as
the [LKB](http://www.delph-in.net/lkb/) grammar development environment
and produces identical results. In a nutshell, PET can be viewed as a
high-efficiency batch processing and application delivery engine, while
the LKB mainly targets interactive grammar development.

Some features of PET include:

- unknown word support, instantiating generic lexical entries at
run-time
- subsumption-based ambiguity factoring (giving a significant
improvement in parsing efficiency for long inputs)
- parse ranking according to a statistical parse selection model
- compilation of the (Common-Lisp) MRS LKB code base, enabling output
of (R)MRSs
- output of fragmentary analysis hypotheses in case of parse failures
- lattice input (via the YY, PIC and SMAF input formats, cf.
[PetInput](https://delph-in.github.io/docs/garage/PetInput))
- a variety of XML-based input formats that generalize the
lattice-oriented YY input mode
- pruning of the search space using a PCFG model

When installed, PET comprises the executable files cheap (bottom-up
chart parser) and flop (the grammar compiler).

# Obtaining PET

PET is hosted at <http://pet.opendfki.de/>, using the
[Trac](http://trac.edgewall.org/) system. It features a Subversion
repository for versioned source code management, an issue tracker for
filing bug reports and feature requests and a Wiki, where you can find
further instructions on accessing the Subversion repository and using
Trac. There you can find the most recent source tarball distribution as
well as the development tree.

There are no official binary distributions of PET, and users should
expect to compile their own executable files from source (see the next
section). [Ubuntu](http://www.ubuntu.com) users, however, can also
obtain a compiled version of PET from the [Ubuntu NLP
Repository](http://cl.naist.jp/~eric-n/ubuntu-nlp/).

# Compiling and Installing PET

Current PET development is exclusively carried out on Linux (x86.32)
environments, hence most (reasonably) recent Linux distributions should
work well. PET ports for Solaris (sparc, using gcc) and Windows (x86.32,
using either CygWin or Borland C++) used to be supported, and in
principle any platform for which a suitable C++ compiler is available
(and for which external libraries used by PET exist) should allow
successful compilation. Your mileage may vary.

In order to compile PET with complete functionality, a number of
external packages ([PetDependencies](https://delph-in.github.io/docs/garage/PetDependencies)) need to be
installed; in general, see the documentation for each of these packages,
but some coarse instructions on versions that are known to work are
available from the [PetDependencies](https://delph-in.github.io/docs/garage/PetDependencies) page. Compiling
without some of these packages should also be possible (giving up, for
example, UniCode support, \[incr tsdb()\] integration, or the embedded
MRS code), although these configurations have not been tested for quite
some time. See ./configure --help for a list of all configuration
options.

PET uses the GNU build system, making it easy to configure and install
the package. Note that if you've checked out a PET branch from the
Subversion repository, you have to run autoreconf -i once (requiring the
autoconf and automake packages), in order to generate the necessary
build files (this is neither needed for the source tarball distribution
nor after svn update). Finally, you minimally have to execute the
following commands:

    ./configure
    make
    make install  # (as root)

The README file and the ./configure --help command give detailed
instructions on how to configure and compile PET.

# PET for developers

For instructions how to set up PET as a project in Eclipse, see
[PetEclipse](https://delph-in.github.io/docs/garage/PetEclipse). The Eclipse IDE for C/C++ Developers (a.k.a.
[Eclipse CDT](http://www.eclipse.org/cdt/)) offers a feature-rich
development platform for C++, which facilitates editing, navigating, and
debugging C++ source code. There is a [Roadmap](https://delph-in.github.io/docs/garage/PetRoadMap).

# Compiling a grammar

One needs to preprocess the grammar files (for example english.tdl for
the ERG grammar) to be used with pet:

     flop english.tdl

This command generates the compiled grammar english.grm.

# Running PET

The PET software has been used in a range of projects (and one
commercial product), using grammars of several languages. There is a
relatively large number of options and run-time parameters that allow
customization of PET behavior to various tasks. Maybe the biggest factor
of variation is in (a) how input to the cheap parser is prepared for
PET-internal processing and in (b) what form analysis results are output
(or returned to the caller) after parsing; these are discussed on
separate [PetInput](https://delph-in.github.io/docs/garage/PetInput) and [PetOutput](https://delph-in.github.io/docs/garage/PetOutput) pages,
respectively. Many other aspects of PET run-time behavior can be
controlled using command-line options (see the [PetOptions](https://delph-in.github.io/docs/garage/PetOptions)
page), given to the flop or cheap binaries upon invocation, and
grammar-specific settings (see the [PetParameters](https://delph-in.github.io/docs/garage/PetParameters) page),
supplied in TDL syntax as part of each grammar. Since [revision 498 in
the main branch](https://pet.opendfki.de/browser/pet/main?rev=498) PET
employs a logging framework for configurable log output, which is
described in [PetLogging](https://delph-in.github.io/docs/garage/PetLogging). Finally, when using PET as a
processing client to the \[incr tsdb()\]
[profiler](http://www.delph-in.net/itsdb/), some of the options and
parameters are controlled from within the \[incr tsdb()\] environment.

For an ongoing discussion on a PET API, cf. [FeforPetApi](https://delph-in.github.io/docs/garage/FeforPetApi).

# Tips and Tricks

Some notes on [robust parsing](https://delph-in.github.io/docs/garage/PetRobustness) with PET: unknown word
handling, memory limits and so on.

The PET build process attempts to set appropriate mmap setting for your
architecture. However, this automation is not always successful. If on
running flop or cheap you get an error message like

    alloc: no space (up = b7f35000d, down = b7f35000d)
    terminate called after throwing an instance of 'tError'
    Aborted

then you should try changing your mmap settings, followed by
recompilation. If you look in common/chunk-alloc.cpp, you will find a
section like:

    #define _MMAP_ANONYMOUS
    #define _CORE_LOW  0x50000000
    #define _CORE_HIGH 0xbf429fff
    #define _MMAP_DOWN

Simply removing the line

\#define \_MMAP\_DOWN

works on an IBM T41 laptop running SuSE 9.3. But trial and error may be
necessary!

Mmap errors are likely kernel-specific, rather than tied to a particular
linux-distro. The above SuSE 9.3 setting also works under Ubuntu 5.10
with kernel &gt;= 2.6.10 and has been tested on an IBM Thinkpad T42 and
a Dell Precision 4100.

# History

PET was originally developed by [UlrichCallmeier](/UlrichCallmeier) at
DFKI GmbH and Saarland University, and some of its design is documented
in his [2001 MSc
thesis](http://www.coli.uni-sb.de/~uc/thesis/thesis.pdf). The software
subsequently served to build a commercial email auto response product
(by YY Technologies, Mountain View, CA), ported to Windows NT, generally
\`hardened' (eliminating memory leakage, increasing robustness to
exceptional situations, et al.), and extended in functionality and
interfaces (including UniCode support, unknown word support, server and
API library modes, lattice input, and initial MRS support); most of this
work was done by Ulrich with help from StephanOepen and
BerndKiefer (of DFKI). As part of the EU-funded [Deep
Thought](http://www.project-deepthought.net/) project, Ulrich and
Stephan later added support for subsumption-based ambiguity factoring
(giving a significant improvement in parsing efficiency for long
inputs), facilities to rank alternate parses according to a statistical
(Maximum Entropy) parse selection model (which, typically, one would
obtain using the [Redwoods](http://www.delph-in.net/redwoods) tools and
a hand-constructed treebank), and the ability to compile in the
(Common-Lisp) MRS code base also used in the LKB, thus enabling output
of (R)MRSs in various standard formats.

Towards the end of 2003, Ulrich retired from active PET development, and
Bernd has since been the main developer (with occasional help from
others, specifically FrederikFouvry and
YiZhang of Saarland University and Stephan). PET has seen a
range of substantial additions in functionality since, including the
ability to add (leaf) types at run-time, output fragmentary analysis
hypotheses in case of parse failures, and an XML-based input format that
generalizes the lattice-oriented YY input mode.

In 2006 YiZhang (Saarland University) added the ability to do
[selective unpacking](https://delph-in.github.io/docs/garage/PetSelectiveUnpacking), greatly decreasing the
memory consumption for n-best parsing. Later, Yi added native C++
support for MRS extraction from parse results and MRS output in various
formats. BartCramer added the possibility to constrain the
search space by using a PCFG-guided pruning of tasks, on the chart cell
level. In 2010, PeterAdolphs (DFKI Berlin) added [chart
mapping](https://delph-in.github.io/docs/garage/ChartMapping) and the [FSC input format](https://delph-in.github.io/docs/garage/PetInputFsc).

## To cite

Callmeier, Ulrich. "Efficient parsing with large-scale unification grammars." PhD diss., Master’s thesis, Universität des Saarlandes, Saarbrücken, Germany, 2001.

Last update: 2021-06-18 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/PetTop/_edit)]{% endraw %}