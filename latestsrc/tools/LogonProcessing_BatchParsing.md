{% raw %}# Overview

Batch parsing for LOGON is the process of sending a collection of inputs
(often termed *test items*) through the analysis component, collecting a
range of metrics of grammar and system behavior in the \[incr tsdb()\]
database.

In the standard LOGON set-up, the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) cpu definition that
instantiates the standard ERG parsing client (including unknown word
handling) is termed :erg+tnt. Thus, the Lisp command

      (tsdb:tsdb :cpu :erg+tnt :task :parse :file t)

will create a new process that runs the parser (i.e. PET loaded with the
ERG, and calling out to the TnT PoS tagger to aid unknown word
handling).

Once loaded, the client will register itself with the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) server, e.g.

      wait-for-clients(): `ld.uio.no' registered as tid <40044> [1:40].

In order to interactively run batch parsing from the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) podium, first create a target
profile, i.e. a new [\[incr tsdb()\]](http://www.delph-in.net/itsdb)
database to record the results of batch processing. Typically, this can
be achieved by means of the *File \| Create* menu, which provides a
choice of pre-defined data sets (termed *test suite skeletons*, as they
provide the test material but no processing results yet). See below for
extra functionality that allows batch processing from a plain textual
input file. Executing the *File \| Create* menu command will prompt for
a new database name (suggesting a name based on the skeleton, processing
engine and grammar and current date) and then add a new profile entry to
the list of profiles showing in the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) podium.

Assuming the target profile is selected in the podium window (i.e.
highlighted), make sure that *Process \| Switches* is set to *Parsing*
and then execute one of the processing commands, e.g. *Process \| All
Items*.

# Invoking Everything from the Command Line

A streamlined way of running [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) batch parsing is by means of
the LOGON parse script. The script resides in the top-level LOGON
directory $LOGONROOT and is invoked from a command shell, e.g.

      $LOGONROOT/parse --erg+tnt mrs

The batch parse script requires a functional LOGON installation (please
see the [LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation) page, for background
information) and will first load up the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) environment and then configure
one or more parsing clients. As a result of running the parse script, a
new [\[incr tsdb()\]](http://www.delph-in.net/itsdb) profile will be
stored in the [\[incr tsdb()\]](http://www.delph-in.net/itsdb) profile
repository, and a log file will be generated in the user home directory.
For the example command above, the profile will be called
erg/mrs/05-11-16/xle (assuming the current date was November 16, 2005),
with its corresponding log file mrs.parse.05-11-16.log.

Using the *core* LOGON tree (without a full Allegro Common Lisp), it is
necessary to request the LOGON system to use its pre-compiled run-time
binaries (by virtue of the --binary command line option). By default,
the LOGON tree sets the [\[incr tsdb()\]](http://www.delph-in.net/itsdb)
skeleton directory to English (as of sometime in 2010; earlier, the
default used to be Norwegian). The ‘*Options\|Skeleton Root*’ menu
command in the [\[incr tsdb()\]](http://www.delph-in.net/itsdb) podium
can be used to change the set of available skeletons interactively. The
batch parse script, on the other hand, will select the appropriate
language based on the choice of analysis grammar used.

To parse a file in textual input format using the German Grammar, for
example, the following command could be used:

      cd $LOGONROOT
      ./parse --binary --gg --text ./dfki/gg/data/mrs.deen.txt

# Command-Line Synopsis

The LOGON parse script has a number of command line options that
facilitate a limited amount of customization. Note that the script is
not very robust in its option parsing, i.e. it is vital to spell
everything exactly right (the script may just hang, when giving
incorrect option names).

- --binary (which requires no argument) builds on the precompiled
LOGON run-time binaries, instead of loading [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) from source (the default);
- --reset (no argument) performs a complete restart of the PVM daemon
(on the local host) use this option with care, as it will terminate
other [\[incr tsdb()\]](http://www.delph-in.net/itsdb) jobs on the
same host;
- --count *n* parallelizes processing and start-up *n* full
instantiations of the parser client;
- --suffix *string* appends *string* to the name for the newly created
profile, e.g. when more than one run per day needs to be recorded;
- --target *string* sets the name of the newly created profile to
*string*, rather than letting [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) assign a name based on the
specific configuration used and current date;
- --best *n* enables n-best parsing (e.g. selective unpacking, in
clients that support it), with a maximum of *n* results;
- --limit *n* imposes an upper bound on the number of analyses
recorded; in n-best mode (i.e. in combination with --best), a value
of 0 will suppress result recording; in exhaustive mode, however, a
limit of 0 is interpreted as recording of all available analyses.
- --gold *string* sets the name of the 'gold' profile (relevant to
post-parsing operations like --update or --compare, see below for
details) to *string*;
- --update (no argument) invokes an automated Redwoods treebank update
after parsing, using the 'gold' profile as its source;
- --thin (no argument) applies a Redwoods thinning step (after the
automated treebank update), writing into a secondary profile with
the suffix .1 appended to the 'target' profile name;
- --compare *string* performs an in-depth comparison (equivalent to
the interactive [\[incr tsdb()\]](http://www.delph-in.net/itsdb)
command 'Compare \| Detail') against the 'gold' profile (see below);
- --compress (no argument) compresses the profile (all non-empty
database files) after parsing (and treebank updating, where
applicable);
- --text (no argument) toggles the input source to a plain-text test
item file (see below), rather than a pre-existing [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) skeleton.

Thus, a command like:

      ./parse --norgram --text --suffix ".42" /tmp/avis.txt

will import test items from the file avis.txt in the /tmp/ directory
into a new \[incr tsdb()\] profile (called norgram/avis/05-11-16/xle.42)
prior to batch processing. While batch parsing from textual input files
adds flexibility, it is often desirable to freeze frequently used data
sets as [\[incr tsdb()\]](http://www.delph-in.net/itsdb) skeletons, so
as to make sure that a stable version of a data set is readily available
from the *File \| Create* menu.

# Available Pre-Defined Parsing Clients

- --norgram the default client, using NorGram, not supported in
--binary mode; this client definition depends on availability of the
XLE system and Allegro Common Lisp.
- --erg or --erg+tnt the English Resource Grammar, optionally using
TnT for input pre-processing and unknown word handling; this client
uses PET for parsing.
- --gg the German Grammar; this client (for the time being) uses the
LKB parser.
- --jacy or --jacy+chasen the Japanese Grammar, optionally using
ChaSen for input segmentation, morphological analysis, and PoS
tagging; this client uses PET.
- --srg the Spanish Resource Grammar, always using FreeLing for input
pre-processing and morphological analysis; this client uses PET.

# Test Item Textual Input

When using the --text option to the LOGON parse script or the \[incr
tsdb()\] *File \| Import \| Test Items* command, processing will first
construct the target profile from an ASCII input file, essentially a
newline-separated list of test items (always using, in LOGON at least,
UTF-8 encoding).

Following is an example textual input file comprising three test items:

      Vi skal møte Ask på mandag.
      Ta båt til Ortnevik.
      Tar du båten til Ortnevik, kan du gå stien samme dagen.

Since we are running this on Unix, it is important to produce Unix-style
linebreaks, i.e. either create the file in a Unix environment itself or
make sure the linebreaks are ^L (linefeed) and not ^M (carriage return).

# Batch Parsing Log File Format

During batch parsing, a condensed summary of processing results for each
input item is written to the standard output (and also to the log file,
which is named after the specific configuration used and current date.
Chapter 4 in the (draft) [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) [Reference
Manual](http://www.delph-in.net/itsdb/publications/index.html#itsdb)
provides a discussion of the syntax (although some additional fields may
have been added since the late 1990s).

# Semi-Automated Regression Testing

The LOGON parse script can be used to partially automate regression
testing, for example when making changes to a processing client like
PET. Assuming a functional (and up-to-date, as of at least August 2011)
LOGON installation, a command like the following can be used to
establish a point of comparison (adjust the --count value to the number
of cpus you have available)

      $LOGONROOT/parse --binary --reset --erg --count 4 mrs

In general, the next step would be to invoke a different configuration
on the same data, and compare the results in depth. For use with PET,
the LOGON environment includes precompiled binaries (which are used in
the predefined cpus), and the above command will by default use the
current stable binary. For comparison to a binary external to the LOGON
tree (e.g. the result of locally compiling a modified PET source tree),
the parse script (or, strictly speaking, the LOGON wrapper for PET:
$LOGONROOT/bin/cheap) can be made to use a different binary. This is
accomplished by setting the environment variable $LOGONCHEAP to a
suitable value, for example

      LOGONCHEAP=~/src/pet/repp/debug/cheap/cheap \
        $LOGONROOT/parse --binary --reset --erg --count 4 \
          --suffix ".n" --gold magic --compare pedges,readings \
          mrs

In the above command, the reserved value magic to the --gold option will
determine the value of the 'gold' profile dynamically, viz. as the name
of the (new) 'target' profile, stripped of the --suffix value.
Alternatively, one could provide the full name of an existing 'gold'
profile, of course, for example gold/erg/mrs. A clean 'bill of health'
for the comparison will record no differences, e.g.

      compare-in-detail():
        `erg/1010/mrs/11-08-04/pet' vs `erg/1010/mrs/11-08-06/pet.n'
        on {`pedges' `readings'} with [`readings' `total']:
    
      compare-in-detail(): 0 differences.

In contrast, when there are differences in at least one of the files to
be compared, the item identifier and string for all mismatches are
printed out, one per line, followed by pairs of values for the active
fields. For example, when comparing just the number of readings and
using the number of passives edges and total parse times for decoration
(the default), one might obtain a result like the following:

      compare-in-detail():
        `erg/trunk/cb/11-08-07/pet.tmr' vs. `erg/trunk/cb/11-08-12/pet.native'
        on {`readings'} with [`pedges' `total']:
    
        [2000] |No longer was I just contemplating ...| {384} {480} [3145 0.59] [3358 0.67]
        [5000] |The rc (control) file syntax includes optional `noise' keywords ...| {500} {152} [1916 0.40] [1384 0.40]
        [6170] |We may view Linus's method as a way ...| {57} {500} [49790 60.01] [50179 53.02]
        [6330] |On Management and the Maginot Line| {18} {40} [191 0.06] [294 0.07]
        [6760] |This answer usually travels ...| {40} {0} [53096 60.00] [50265 60.00]
        [7680] |De Marco and Lister cited research ...| {7} {0} [38624 59.99] [38222 59.99]
    
      compare-in-detail(): 6 differences.

Here, the timing figures (final in each of the square bracket pairs)
suggest that items \#6170, \#6760, and \#7680 run into the (default)
60-second timeout; thus, their reported numbers of readings cannot be
compared meaningfully. The remaining differences, on the other hand,
probably would warrant closer inspection.

Note that the PVM daemon (that is created for each run of the parse
script, unless there is an existing daemon running in the background)
preserves its calling envionment, in this case the $LOGONCHEAP variable.
Thus, to avoid confusion down the road, it is vital to either
force-shutdown the PVM daemon after completion of the above command
(using, for example, the make reset target in $LOGONROOT), or simply to
remember to include the --reset option in the first invocation of the
parse script following the use of the $LOGONCHEAP variable (which will
then shutdown the PVM daemon from the previous run).

The in-depth comparison of parsing results (using the *pedges* and
*readings* fields, in the above example) will print out one line per
item, where either of the fields show different values across the two
profiles.

Last update: 2014-07-24 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/LogonProcessing_BatchParsing/_edit)]{% endraw %}