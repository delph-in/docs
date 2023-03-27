{% raw %}# Overview

This document describes how to perform batch generation within LOGON. In
extension of this it also describes how to produce a *generation
treebank* on the basis of an existing parsing treebank. We first give a
step-by-step descripton of how to do this using only menu choices from
the [\[incr tsdb()\]](http://www.delph-in.net/itsdb) podium. Then we
show how the same steps can be carried out from the command line, using
the generate script provided in the LOGON source tree (i.e.
$LOGONROOT/generate).

# Using the Menu Options

For the podium approach, there are two main steps; 1) generate and 2)
update. In the first step we exhaustively generate all "paraphrases" for
the input MRS. In the update step we identify and label the references
among these alternative realizations by matching them against the
references in the original parse treebank.

## (1) Generation

- Load the grammar: (from the LKB top window) *Load \| Complete
grammar* (and choose for example logon/lingo/erg/lkb/script to load
the latest ERG version)
- Initialize the generator: (from the LKB top window): *Options \|
Expand menu*, and then *Generate \| Index*
- Select appropriate skeletons (e.g. English ones): (from the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) podium) *Options \|
Skeleton Root*
- Select the skeleton you want to process and create the target
profile: *File \| Create*
- Select the corresponding gold profile (assumed to be thinned, i.e.
containing MRSs for the preferred parses).
- Select generation as batch processing mode: *Process \| Switches \|
Generation*
- Optionally set the maximum number of edges (e.g. 50000): *Process \|
Variables \| Chart size limit*
- Launch the generator: *Process \| All Items*

## (2) Update

In this step we identify and label the references among the newly
generated sets of paraphrases. First we set some switches controlling
how the realizations are matched against the references of the original
parse treebank:

- *Trees \| Switches \| Update Exact Match*
- *Trees \| Switches \| Preterminal Yield*

Then, to perform the labeling step, execute *Trees \| Update*

PS: Some [\[incr tsdb()\]](http://www.delph-in.net/itsdb) parameters
that are relevant for the matching (labeling) of references include the
following:

- \*redwoods-update-exact-p\*,
- \*derivations-comparison-level\*, and
- \*derivations-yield-skews\*.

# Using the Command Line Script

The procedure described above can also be performed by using the
$LOGONROOT/generate script.

      cd $LOGONROOT
      ./generate --binary mrs

The first, *skeleton* argument to generate should name the skeleton you
want to use for the new target profile that will be created. We document
the available command-line options below, as well as some related and
relevant Lisp variables.

- --source or --binary\
compile the LOGON system from source (the default) or use the
pre-compiled run-time binaries.
- --suffix string\
append string to the name for the newly created profile (e.g. when
more than one run per day needs to be recorded).
- --jacy or --gg\
changes the grammar from the default ERG and sets the appropriate
language for skeletons correspondingly.
- --gold *profile*\
specify the gold profile (the default being
gold/*grammar*/*skeleton*).
- --update\
do *not* perform the update step (i.e. automatically identifying and
labeling references).
- --count *n*\
parallelize processing and start-up *n* full instantiations of the
parser client.
- --limit *n*\
sets \*tsdb-maximal-number-of-results\*.
- --best *n*\
sets \*tsdb-maximal-number-of-analyses\* (activating *n*-best
selective unpacking).

PS: In order to control the maximum number of edges allowed in the chart
during generation, look for \*tsdb-maximal-number-of-edges\* in the
generate script (the current default is 100,000)).

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/LogonProcessing_BatchGeneration/_edit)]{% endraw %}