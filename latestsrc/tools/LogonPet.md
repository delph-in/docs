{% raw %}# Overview

The so-called LOGON distribution (please see the [LogonTop](https://delph-in.github.io/docs/tools/LogonTop)
page, for general background) includes pre-compiled binaries of the
[PET](https://delph-in.github.io/docs/garage/PetTop) parsing system. To support a variety
of user needs, there are binaries for a range of different
configurations, ‘hidden’ behind wrapper scripts that provide a
command-line option, to select a specific binary. Furthermore, the
scripts prepare the run-time environment for the pre-compiled binaries,
specifically set up the dynamic linker search path ($LD\_LIBRARY\_PATH)
temporarily, to make sure the binary finds all its required libraries
(in the right versions). Note that, as of mid-2011, the actual LOGON PET
binaries always run in 32-bit mode (even on a 64-bit Linux
installation), hence make sure to have 32-bit compatibility mode
installed (the default on RedHat Linux and derivatives, though
apparently not necessarily so on recent Ubuntu distributions).

The LOGON front-ends to the two PET components are $LOGONROOT/bin/flop
and $LOGONROOT/bin/cheap, which will be automatically added to the shell
search path (the $PATH environment variable) in a functional LOGON
installation (please work through the
[LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation) page, in case the above does not
seem true in your case). In contrast to the standard PET binaries, the
LOGON wrappers take one additional command-line option, which
furthermore /must/ be provided as the very first option, right after the
command name. When omitted, the wrapper will default on the current
‘trunk’ revision of the PET binaries (see below for details).

For example, the following command will invoke the ‘stable’ (see below)
version of the PET grammar compiler, *flop*:

      flop --stable english.tdl

Conversely, to run the bleeding-edge ‘testing’ (see below) version of
the PET parser (*cheap*), one could issue a command like the following:

      cheap --test -repp -tagger -cm -default-les=all english.grm

In either case, all command-line arguments *but* the first are passed
verbatim to the actual binary.

# Supported Configurations

As of mid-2011, there are three available PET configurations in the
LOGON tree proper, plus some support for locally compiled binaries,
external to the LOGON tree.

The *stable* PET binaries support users who require PET functionality as
of around the first half of 2010 (e.g. prior to the addition of native
REPP support). These binaries are compiled off the so-called *legacy*
branch (which in mid-2011 corresponds to the 1.0 release version of PET,
though may over time have critical fixes back-ported to it) and will
continue (at least for the foreseeable future) to provide functionality
that in around 2010 was judged deprecated by the PET developers and is
thus not actively supported (and likely to disappear in newer versions;
please see the PET [mailing
list](http://lists.delph-in.net/archive/developers/2010/001476.html) for
details). Stable *flop* and *cheap* binaries, in the LOGON tree, are
activated through the --stable option to the wrapper scripts.

Bleeding-edge *testing* versions, on the other hand, may not always be
available and will typically target a small sub-community of ‘power’
users and PET or LOGON co-developers. It is typically compiled off an
active branch (e.g. the *next generation*, or NG, branch in mid-2011)
and should typically not be used for regular development, at least not
without close communication with the PET developer(s) on the branch in
question. Unlike the *stable* binaries, *testing* binaries may or may
not include ECL. Testing *flop* and *cheap* binaries are activated
through the --test command-line option.

Finally, the *default* binaries should be suitable for regular users;
they are compiled off the PET development trunk (called *main*), with
quality control by the LOGON developers (and users). Typically, these
binaries will reflect the head revision of the trunk, although for
practical (lack of time) or contentful reasons (a critical known issue,
yet to be resolved) may lag behind trunk development some. Default
binaries are activated when the *flop* and *cheap* wrappers are called
without an extra initial argument, e.g. (mirroring an earlier example):

      cheap -repp -tagger -cm -default-les=all english.grm

# PET Developer Support

In addition to the three configurations above, the LOGON *flop* and
*cheap* wrapper scripts provide some limited support for running a
user-provided (locally compiled) binary. These are activated by the
--local option; please see the [source
code](http://svn.emmtee.net/trunk/bin/cheap) for further information (or
contact StephanOepen directly). Furthermore, the
selection of a specific *cheap* configuration can be short-circuited by
virtue of the $LOGONCHEAP environment variable (in which case, no extra
command-line option must be supplied), e.g.

      LOGONCHEAP=~/src/pet/repp/debug/cheap/cheap \
        cheap -repp -tagger -cm -default-les=all -timeout=60 english.grm

This facility will be most useful (if at all), when running *cheap*
through LOGON batch processing scripts; please see the
[LogonProcessing/BatchParsing](https://delph-in.github.io/docs/tools/LogonProcessing_BatchParsing) page, for
further discussion.

# Implementation Notes

As of mid-2011, PET binaries are compiled in the standard LOGON build
environment, a 32-bit CentOS 4.9 distribution. The actual binaries
reside in $LOGONROOT/uio/bin/linux.x86.32, with associated shared
libraries in $LOGONROOT/uio/lib/linux.x86.32.

Last update: 2021-06-18 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/LogonPet/_edit)]{% endraw %}