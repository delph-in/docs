{% raw %}# Background

This page provides (emerging) information on support in the LOGON tree
for the [Answer Constraint
Engine](http://sweaglesw.org/linguistics/ace/) (ACE). As of mid-2013,
binaries for parsing-generating and treebanking with ACE are included
with the LOGON tree, albeit (currently) only for 64-bit environments.
These binaries are maintained by the ACE developer,
[WoodleyPackard](/WoodleyPackard).

# Parsing

The LOGON Tree does not include pre-compiled grammar binaries for ACE,
thus as a first-time, preparatory step, one needs to invoke the ACE
grammar compiler, e.g. (using the answer wrapper script to ACE,
available only in the LOGON environment):

      answer --erg --compile

Once the above has completed (successfully), a command like the
following will invoke the ACE parser in a mode that will prepare
profiles for full-forest treebanking:

      $LOGONROOT/parse --binary --erg+tnt/ace --protocol 2 --best 1 --limit 0 --count 8 cb

# Full-Forest Treebanking

The answer wrapper script in the LOGON tree currently does not support
the full range of standard command-line options to activate grammars
(that come with the LOGON distribution), but only ‘--erg’ and ‘--terg’,
for the release and trunk versions of the ERG, respectively.

To invoke full-forest treebanking, in the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) podium, select
‘*Trees\|Switches\|External Treebanking Tool*’. While this toggle is in
effect, the ‘*Trees\|Annotate*’ and ‘*Trees\|Update*’ commands will
invoke the external ACE Full-Forest Treebanker. To give an illusion of
tight integration, the following [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) parameters will have an effect
on the external treebanking tool: (a) selection of a ‘working set’ of
items, through a condition on profile entries (e.g. as determined
through ‘*Options\|TSQL Condition*’ or ‘*Options\|New Condition*’); (b)
the selection of a ‘gold’ profile (by clicking the middle mouse button
in the [\[incr tsdb()\]](http://www.delph-in.net/itsdb) podium), as the
source for update information; and (c) the toggle for batch vs.
interactive updates (‘*Trees\|Switches\|Automatic Update*’).

Furthermore, the invocation of the Answer treebanker application can be
customized through ‘*Trees\|Variables\|Treebanking Tool*’ or setting the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) variable
\*redwoods-treebanker-application\* in the per-user ‘.tsdbrc’. The
default value, for the time being, is "answer --annotate --terg".

In principle, it should work to follow the ‘common’ release procedure
for treebank creation, i.e. first call for an automatic update
immediately following the parsing, by adding the option
‘--update/external’ to the ‘parse’ command line. This functionality
remains to be validated, though.

# Going Back to Derivation-Based Profiles

# Known Issues

Use of the Answer treebanking tool for updates from an existing ‘gold’
profile presupposes prior normalization of the ‘gold’ profile, i.e. the
treebanker will not honor in-profile versioning (through the ‘t-version’
field in the various relations used to record annotations).

During automated updates, the treebanking tool will always explicitly
flag items that remain unannotated, i.e. for which the update was not
successful. The [\[incr tsdb()\]](http://www.delph-in.net/itsdb) flag
‘*Trees\|Switches\|Update Flag Failures*’ (on by default) is currently
not communicated to the external treebanking tool).

The &lt;Control-G&gt; or &lt;Control-C&gt; key bindings in the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) podium are not yet enabled
during external treebanking. Hence, it is vital to exit from the
external treebanking tool by clicking on *Exit* in its browser window
(or otherwise making it terminate, e.g. through a shell command like
‘killall fftb’) to regain control in the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) podium.

Last update: 2016-05-24 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/LogonAnswer/_edit)]{% endraw %}