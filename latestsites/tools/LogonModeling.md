{% raw %}# Overview

This page contains various code examples showing how to estimate and
apply statistical models within LOGON. For more detailed information on
feature types, estimation parameters, or the experimentation environment
in general, see [Velldal
(2008)](http://www.velldal.net/erik/pubs/Velldal08.pdf).

# Discriminative Modeling

In the following, we assume that **generation treebanks** for the LOGON
JHPSTG and Rondane corpora are available. For the HandOn release (of
November 2008) of the LOGON system, these treebanks can be installed
into the lingo/redwoods/ directory from SVN; see the
[LogonExtras](https://delph-in.github.io/docs/tools/LogonExtras) page for instructions on how to install
add-on LOGON components. However, in principle, these instructions
should be applicable to other Redwoods-style treebanks. Information on
how to create a generation treebank is given on the
[LogonProcessing/BatchGeneration](https://delph-in.github.io/docs/tools/LogonProcessing_BatchGeneration) page.

The examples below assume that the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) database root is pointing to
the collection of LOGON treebanks, i.e. the directory
lingo/redwoods/tsdb/home/, which is one of the SVN add-on components
(see the [LogonExtras](https://delph-in.github.io/docs/tools/LogonExtras) page). We further assume that the
complete LOGON system and correct grammar (the ERG from
lingo/redwoods/erg/, in our case) are already loaded.

Set the feature parameters. The system defaults correspond to:

      (let ((*feature-grandparenting* 4)
            (*feature-active-edges-p* t)
            (*feature-ngram-size* 4)
            (*feature-ngram-back-off-p* t)
            (*feature-ngram-tag* :type)
            (*feature-use-preterminal-types-p* t)
            (*feature-lexicalization-p* t)
            (*feature-constituent-weight* 2)
            (*feature-lm-p* 10)
            (*feature-frequency-threshold* nil))
    
        ...)

Create a feature cache for the (virtual) profile jhpstg.g (we typically
use the .g suffix for generation treebanks):

      (setq gold "jhpstg.g")
      (operate-on-profiles (list gold) :task :fc)

Intended as a one-time operation, the feature caching extracts all the
features from the treebank and stores them in a (Berkeley DB) database
within the respective profile directory (named fc.bdb). When running
experiments later, this means that we simply look up the features in the
DB, saving us the cost of extraction. A symbol table named fc.mlm (also
created within the jhpstg.g profile for the example above) records the
mapping from symbolic feature representations to numerical indexes (as
used for model estimation and DB storage). The symbol table is only
referenced when exporting or applying a model to new data (see the
example below), but it can also be useful to inspect manually, e.g. to
confirm that features have the correct form, plausible counts, plausible
value ranges, etc.

Example of how to run a single experiment using 5-fold cross-validation:

      (setq test "jhpstg.t")
      (tsdb :create test :skeleton "jhpstg")
      (rank-profile gold test :nfold 5)

The number of cross-validation folds is specified with the :nfold
parameter. An optional :niterations parameter may be used to specify how
many of these folds are actually run to save execution time.

Running a batch of 10-fold MaxEnt experiments on jhpstg.g, iterating
over different configurations of features and estimation parameters (the
top-level function batch-experiment() performs an exhaustive 'grid
search' over all combinations of specified parameter values):

      (batch-experiment
       :type :mem
       :variance '(nil 1000 100 10 1 1.0e-1 1.0e-2)
       :absolute-tolerance 1.0e-10
       :source "jhpstg.g"
       :skeleton "jhpstg"
       :random-sample-size nil
       :ngram-size '(0 1 2 3)
       :active-edges-p nil
       :grandparenting '(0 1 2 3)
       :lm-p 10
       :counts-relevant 1
       :nfold 10
       :compact nil)

The following gives a brief explanation of the various keyword
arguments. The :variance parameter governs the Gaussian prior on feature
weights.; :absolute-tolerance governs the convergence threshold.
Specifying a non-nil (integer) value *n* for :random-sample-size means
that only a random selection of (maximally) *n* non-preferred candidates
for each item is included in the training data. The parameter
:counts-relevant governs a frequency-based cutoff on feature values. The
keywords :ngram-size, :active-edges-p, and :grandparenting allow
iteration over feature parameters. Note that specifying :lm-p 10 means
that the value of the language model feature is divided by 10; this is
basically a hack to avoid numerical problems during estimation. To leave
out the LM feature, call with :lm-p nil instead. Specifying :type :mem
means that we are training a conditional maximum entropy model (aka
log-linear model). The value of :type could also be :svm if you have
SVM<sup>light</sup> installed (it is currently not part of the LOGON
dstribution). The boolean-valued :compact governs the naming convention
when creating target profiles, i.e. if the profile names for the 10-fold
cross validation experiments look excessively long (or even cause issues
with OS-imposed limits on the total length of pathnames), try *t* as the
:compact value.

After running the grid search, you need to evaluate the different
combinations of parameters to determine the optimal combination for
parsing accuracy. Running:

      (summarize-experiments :stream t)

will summarize various metrics for each grid search experiment that has
been run. This reports accuracy, variance, number of iterations as well
as the filename of the experiment (which allows you to determine the
parameters), with one item per line. Redirecting this to a file, you can
sort -n and manually determine the optimal parameter combination.

Having determined the appropriate parameters, you can use them to
estimate and export a maxent model, such as the following:

      (let ((*feature-grandparenting* 3)
            (*feature-ngram-size* 3)
            (*feature-lm-p* nil)
            (*maxent-variance* 8e-4)
            (*feature-frequency-threshold* (make-counts :relevant 1)))
        (train "jhpstg.g" "jhpstg.g.mem" :fcp nil :type :mem))

This writes the estimated model to jhpstg.g.mem (for more information on
the format, see Chapter 6 of [Velldal
(2008)](http://www.velldal.net/erik/pubs/Velldal08.pdf)). The keyword
argument :fcp nil means that we do not want to create a feature cache,
but rather use the one we already have.

Applying the model trained above to the generation treebank rondane.g:

      (tsdb :create "rondane.t" :skeleton "rondane")
    
      (operate-on-profiles
        (list "rondane.g") :model (read-model "jhpstg.m.mem")
        :target "rondane.t" :task :rank)

# Automating Experiments

Once the LOGON ERG add-on treebanks are installed (see the
[LogonExtras](https://delph-in.github.io/docs/tools/LogonExtras) page), there are several Lisp parameter files
and a shell script (called lingo/redwoods/load) to run the steps above
from the command line. For example, the creation of a feature cache (on
the default generation treebank jhpstg.g) can be automated as follows:

      cd $LOGONROOT/lingo/redwoods
      ./load --binary fc.g.lisp

The parameter file grid.g.lisp provides the default setup for an
exhaustive grid search for the best-performing combinations of features
and meta-parameters. Once optimal parameters values are identified, the
file train.g.lisp automates the training and serialization of a MaxEnt
model file, in this case called (by default) jhpstg.g.mem. All of the
Lisp files are intended for use with the load script, analogous to the
call example given above. Even on adequate hardware (we recommend a
64-bit Linux environment with at least eight gigabytes of available
RAM), each of these steps can take substantial time, i.e. between
several hours and many days (for the grid search, depending on how many
parameter variations are explored).

Note that there are 'families' of Lisp parameter files in
lingo/redwoods/, one for parse ranking (fc.lisp, grid.lisp, train.lisp),
one for realization ranking (used in our examples above), and another
one for end-to-end MT re-ranking (fc.r.lisp, grid.r.lisp, and
train.r.lisp). For each task, there is an additional file defining the
default environment, called parsing.lisp, generation.lisp, and
ranking.lisp). Furthermore, the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) configuration for automated
MaxEnt experimentation is determined by the file dot.tsdbrc in
lingo/redwoods/.

These files are distributed primarily to serve as *examples* for similar
experimentation. To vary the nature of each experiment (e.g. using
different treebanks, another grammar or MT configuration, or additional
feature types), it may be necessary to adapt dot.tsdbrc and the Lisp
configuration files appropriately (or even the load script). Where
possible, we recommend copying the existing files to create a new
'family' of parameter settings and tasks.

# Virtual Profiles

To keep the databases of a manageable size, individual profiles are
typically limited to between 500 to 2000 items each. If you need to work
with a larger data set set you may combine several profiles into a
single read-only virtual profile. Virtual profiles are (currently) only
used in parse selection experiments and are only supported in parts of
the \[incr tsdb()\] code base.

For example, the LOGON tree contains a virtual profile for the complete
JHPSTG corpus in the lingo/redwoods/tsdb/home/jhpstg/ directory. A
virtual profile consists of a single text file called virtual that
contains the list of the profiles it includes (in this case, the
individual JHPSTG sections), one profile per line, where the profile
names are double-quoted.

The parameter grid search process writes its output (fold and scoring
results from n-fold cross validation) to new profiles, which in the
default experimentation setup of the LOGON tree are created below
lingo/redwoods/tsdb/home/. In order to create these outputs for a
virtual profile, \[incr tsdb()\] requires a skeleton that contains the
parts of the profile that will be shared among all the outputs. The
skeleton for the full JHPSTG corpus is in
lingo/lkb/src/tsdb/skeletons/english/logon/jhpstg/. This was created by
concatenating the item and item-set files from all the profiles jhpstg
contains and copying in the relations file, essentially the following
sequence of operations:

      cd $LOGONROOT/lingo/lkb/src/tsdb/skeletons/english/logon
      mkdir jhpstg
      cat jh{0,1,2,3,4,5}/item {ps,tg}/item > jhpstg/item
      cat jh{0,1,2,3,4,5}/item {ps,tg}/item-set > jhpstg/item-set
      cp ../Relations jhpstg/relations

This skeleton is made visible to \[incr tsdb()\] by adding the
appropriate line to the skeleton registry file
lingo/lkb/src/tsdb/skeletons/english/logon/Index.lisp.

A new virtual profile can be defined by creating the appropriate virtual
file; in case it is to be used for the parameter grid search step, one
also needs to create the corresponding \[incr tsdb()\] skeleton.

# Generation model from non-treebanked underspecified MRSs

This section shows a procedure for creating a generation model without a
treebank for the items used for the model, and where the MRSs that are
generated from are underspecified.

## Creating a gold profile

The following command parses the English Tanaka Corpus sentences in
rtc006 and stores the 5 top ranked MRSs.

    cd $LOGONROOT
    ./parse --binary --erg+tnt/mrs --best 5 rtc006

The profile is stored in
$LOGONROOT/lingo/lkb/src/tsdb/home/erg/1004/rtc006/10-10-10/pet/, given
that the version of the ERG is 1004, and that the date is October 10,
2010. The next step is to make a gold profile from the parsed profile:

    TSDBHOME=$LOGONROOT/lingo/lkb/src/tsdb/home
    export PATH=$TSDBHOME:$PATH
    mkdir $TSDBHOME/gold/erg/rtc006/
    cp $TSDBHOME/erg/1004/rtc006/10-10-10/pet/* $TSDBHOME/gold/erg/rtc006/.
    python underspecify.py $TSDBHOME/gold/erg/rtc006/result

The
[underspecify.py;](/LogonModeling?action=AttachFile&do=upload_form&ticket=006099bd3f.4c8ac87827ce19dd7e2871833ee82a035f21590f&target=underspecify.py%3B "Upload new attachment "underspecify.py;"")
script finds the top ranked MRSs in the result file and under-specifies
them with regard to person, number, gender, definiteness, and some
location relations. This is useful if the generation model is meant for
generation with the [MtJaen](https://delph-in.github.io/docs/garage/MtJaen) translation system since the output
of the Jaen transfer grammar is often under-specified with regard to
these features.

## Creating a generation profile

A generation profile is created with the following command:

    ./generate --binary --update rtc006

The generation profile is written into
$LOGONROOT/lingo/lkb/src/tsdb/home/erg/1004/rtc006/10-10-10/lkb/. The
files preference and tree are given information about generated items
that match the original item by executing the
[gentreebank.py;](/LogonModeling?action=AttachFile&do=upload_form&ticket=006099bd3f.4c8ac87827ce19dd7e2871833ee82a035f21590f&target=gentreebank.py%3B "Upload new attachment "gentreebank.py;"")
script:

    python gentreebank.py $TSDBHOME/erg/1004/rtc006/10-10-10/lkb/result

## Training the generation model

A generation model based on the rtc006 generation profile produced above
can be trained as follows:

1\. Modify the fc.g.lisp file in the $LOGONHOME/lingo/redwoods directory
so that it operates on your generation profile.

    (operate-on-profiles '("erg/1004/rtc006/10-10-10/lkb/"))

2\. Modify the dot.tsdbrc file in the same directory so that the line

      (tsdb :home (format nil "~a/lingo/redwoods/tsdb/home" root))

becomes

      (tsdb :home (format nil "~a/lingo/lkb/src/tsdb/home" root))

3\. Modify the load file in the same directory. The line

      echo "(lkb:read-script-file-aux \"${REDWOODS}/erg/lkb/script\")";

should be

      echo "(lkb:read-script-file-aux \"${LOGONROOT}/lingo/erg/lkb/script\")";

4\. Do feature caching:

    cd $LOGONROOT/lingo/redwoods
    ./load --binary fc.g.lisp

5\. Modify the train.g.lisp script in the redwoods directory so that it
uses your generation profile for the training:

    (train "erg/1004/rtc006/10-10-10/lkb" "erg/1004/mrs/10-10-10/lkb/rtc006.g.mem" :fcp nil)

6\. Train the model:

    ./load --binary train.g.lisp

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/LogonModeling/_edit)]{% endraw %}