{% raw %}# Overview

In order to compile all of the PET functionality, several external
libraries are required. Following are some brief comments on which
aspects of PET require what external package and some suggestions on
obtaining and installing these packages. However, when in doubt, use the
documentation that comes with individual packages, specifically when
compiling for an unusual target platform or using versions different
from the ones listed below.

The default linking regime for PET is dynamic (thus creating references
to library files that are resolved at run-time). Thus most of the
libraries described in the following will be needed both to compile
*and* to run PET binaries. Where it is desirable to run the same binary
on more than one machine, it will be necessary to arrange for both PET
and its external dependencies to be installed into directories that are
visible (using the same naming scheme and directory structure) on all
hosts that are to run PET.

# Boost C++ Libraries

In the most recent version, PET requires the Boost C++ graph libraries
to compile both 'flop' and 'cheap'. Since the Boost Graph libraries are
header-only libraries, it would suffice to put the Boost header files
into an appropriate location were the compiler can find them.

For Debian-based distributions, the following is the easiest way to
install the required headers into a standard location (if administrator
privileges are available):

      sudo apt-get install libboost-graph-dev 

Boost packages are also available for most of the other distributions.
If the package has been installed, it is usually not necessary to
specify a path for Boost during ./configure

Similarly the Boost Regex libraries are required. The Debian/Ubuntu
package is libboost-regex-dev

# UniCode Support

To process anything that exceeds 7-bit ASCII (which is no longer
sufficient, even, for the [English Resource
Grammar](http://www.delph-in.net/erg/)), PET makes use of the
[International Components for
UniCode](http://icu.sourceforge.net/download/) (ICU) library which is
available in open-source from IBM. As of February 2005, ICU version 3.2
is known to work, but earlier revisions (starting from, say, 2.6
upwards) should also be suitable. The build process for ICU is simple;
the following worked for me (in its source/ sub-directory):

      ./configure --prefix=/lingo/local
      make
      make install

Installing ICU into a system directory like /usr/local/ will require
system administrator priviliges on typical Unix systems. With a general
tool like ICU (and likewise ECL; see below), it is generally desirable
to install it in a location that will be easily accessible to others,
but where write permission for system directories is not an option, any
path should be suitable as the value of -prefix in the above example.
Note that the choice of --prefix during ICU installation should be
passed as a command-line argument to PET's configure (e.g.,
\`./configure --with-icu=/lingo/local').

For Debian-based distributions, the following puts the libraries where
cheap can find them:

    sudo apt-get install libicu28-dev

# \[incr tsdb()\] Integration

The \[incr tsdb()\] [Competence and Performance
Profiler](http://www.delph-in.net/itsdb/) provides a wrapper around PET
(and other processing engines) for automated batch processing and
regression testing. In order to use the PET parser cheap with \[incr
tsdb()\], it needs to be linked against the \[incr tsdb()\] client
library libitsdb.a (or libitsdb.so), which in turn require availability
of PVM support. All header files and libraries needed to compile \[incr
tsdb()\] support into PET are provided with \[incr tsdb()\]
distributions, i.e. a functional \[incr tsdb()\] installation should
suffice to also compile PET with \[incr tsdb()\] support.

\[incr tsdb()\] is available as open-source from the [LinGO download
site](http://lingo.delph-in.net/), and most people use \[incr tsdb()\]
in connection with the [LKB](http://www.delph-in.net/lkb/) grammar
development environment. Users with access to the LinGO CVS repository
can get both packages by checking out the lkb module and making sure
that they have a current head revision (or, minimally, a source tree
more recent than 02/22/05). Both the LKB and \[incr tsdb()\] are
available as a set of archives files from the
<http://lingo.delph-in.net/> download site; grab the appropriate
archives for your platform and unpack all of them into a common
directory; this directory will then correspond to the LKBROOT variable
for PET Makefiles. The LinGO download site is organized according to
build dates, where <http://lingo.delph-in.net/latest/> corresponds to
the most recent available version. Make sure to get the build of
02/21/05 or a later one.

There is experimental support for an automated installation of the LKB
and \[incr tsdb()\] for Linux (x86, 32- and 64-bit) and Solaris (sparc,
32-bit) target platforms. Maybe try the following (assuming your login
shell is bash or another Bourne-compatible shell):

      export DELPHINHOME=${HOME}/delphin
      wget http://lingo.delph-in.net/etc/install
      bash install

Assuming a directory choice as above, the value of the LKBROOT variable
in PET Makefile settings should then be the path corresponding to
${HOME}/delphin/lkb/. For futher information on installing the LKB and
\[incr tsdb()\], watch the [LkbTop](https://delph-in.github.io/docs/tools/LkbTop) and [ItsdbTop](https://delph-in.github.io/docs/tools/ItsdbTop)
pages, where more detailed instructions should become available over
time.

*NOTE:* Since late in 2004, the LKB libraries are provided for both 32-
and 64-bit architectures. This means that the relevant files are in
lkb/lib/linux.x86.32/ and lkb/lib/linux.x86.64/, respectively. However,
the version of cheap from the PET *main* branch for the time being still
looks for them in lkb/lib/linux/. You may need to symbolic link the
relevant libraries to compile cheap.

# Embedded Common-Lisp and MRS Output

For PET to output MRSs in various formats, the current solution is to
compile in the MRS code used in the [LKB](http://www.delph-in.net/lkb/)
too. The MRS Common-Lisp code is first compiled into a function library
(libmrs.a, see instructions on the [PetTop](https://delph-in.github.io/docs/garage/PetTop) page) which is
subsequently linked into the main PET parser executable cheap. To allow
cheap to invoke Lisp code at run-time, the [Embedded Common
Lisp](http://ecls.sourceforge.net) (ECL) package serves to first compile
the MRS sources into standard C code, then use gcc to translate it into
architecture-specific binary code, and finally combine the set of
resulting object files into a standard C-callable library (using the
Unix ar utility). These steps are performed off-line and require a
working ecl binary. At run-time, cheap will use code from the ECL
library (typically libecl.so) to invoke the compiled MRS code; thus, in
the default dynamic compilation regime, the ECL run-time library will
need to be accesible to cheap.

To install ECL, download a recent version from the project [download
page](http://sourceforge.net/projects/ecls/); as of February 2005, the
latest available version is 0.9e which appears to work well. Earlier
versions (starting from 0.9b) seemed to sufficient too, although there
still is non-trivial variation in how the library is built and what
needs to be done to sucessfully link it into cheap. Thus, we strongly
recommend the use of ECL 0.9e. With the one exception of the
**mandatory** --with-cmuformat option (with the version of 0.9h, this
has become the default configuration), ECL configures and builds
straightforwardly. The following worked for me (on stock FC1 and RH9):

      ./configure --prefix=/lingo/local --with-cmuformat
      make
      make install

As with the other external libraries, the value of --prefix when
building ECL must later be passed as a command-line argument to pet's
configure, e.g.:

      ./configure --with-ecl=/lingo/local

A note for Fedora users. There is a RPM package for fedora linux
available at [Fedora Extra](http://fedoraproject.org/wiki/Extras).
Unfortunately the package is currently compiled with "--with-cxx"
configuration, which force the use of c++ compiler. This breaks the ecl
for me with GCC 4.1.1.

For Ubuntu users, and maybe Debian or other distros too, the 'ecl'
package in newer versions (e.g. 0.9j in Ubuntu Jaunty) seems to result
in segmentation faults when outputting RMRSs. The version included in
the [Ubuntu NLP repository](http://cl.naist.jp/~eric-n/ubuntu-nlp/)
(0.9h) works fine, so avoid the standard ECL.

# Apache Xerces XML Parser

In addition to the above, the [Apache
Xerces](http://xerces.apache.org/xerces-c/) XML Parser may be required
to compile the cheap parser, in case PiC or SMAF support (i.e.
XML-formatted input to the parser) is to be compiled in.

Building and installing Xerces from source is reasonably
straightforward, much like for ICU and ECL (if in doubt, see the
detailed instructions on the [Apache
Xerces](http://xerces.apache.org/xerces-c/) site). The following example
should work on reasonably modern Linux installations, assuming the
current working directory is the top of the Xerces source tree:

      export XERCESCROOT=`pwd`
      cd src/xercesc
      ./runConfigure -P/lingo/local -plinux -cgcc -xg++ -minmem -nsocket -tnative -rpthread
      make
      make install

Precompiled packages are available for most distributions. For
Debian-based distributions, the following installs the libraries:

      sudo apt-get install libxerces26-dev

Then configure PET with:

      ./configure --with-xml=/usr/lib

# XML-RPC

The chart-mapping branch of PET includes a preliminary XML-RPC mode.
This requires the [XML-RPC-C library](http://xmlrpc-c.sourceforge.net/).

For debian-based distros, run:

      sudo apt-get install libxmlrpc-c3-dev

Last update: 2014-03-30 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/PetDependencies/_edit)]{% endraw %}