{% raw %}# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

# Overview

Contents

1. [Page Status](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbModeling#Page_Status)
2. [Overview](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbModeling#Overview)
3. [Training a Scoring Model](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbModeling#Training_a_Scoring_Model)
   1. [Scoring](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbModeling#Scoring)
   2. [Using a Scoring Model in PET and the
LKB](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbModeling#Using_a_Scoring_Model_in_PET_and_the_LKB)
   3. [Calculating a Baseline](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbModeling#Calculating_a_Baseline)
4. [Training a scoring model using a batch
script](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbModeling#Training_a_scoring_model_using_a_batch_script)
5. [Using TADM directly to train a ranking
model](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbModeling#Using_TADM_directly_to_train_a_ranking_model)
   1. [Calling tadm](https://delph-in.github.io/docs/tools/ItsdbTreebanking_ItsdbModeling#Calling_tadm)

# Training a Scoring Model

If you have treebanked a profile, and have Rob Malouf's [TADM: Toolkit
for Advanced Discriminative Modeling](http://tadm.sourceforge.net/), in
particular the program tadm installed, then you can train a scoring
model which PET ([PetTop](https://delph-in.github.io/docs/garage/PetTop)) can use. However, current [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) training and evaluation code
assumes a small number of patches to TADM that have yet to be
incorporated into the [SourceForge
repository](http://tadm.sourceforge.net/); feel free to contact
StephanOepen for details. A pre-compiled binary is
available as part of the [LOGON tree](https://delph-in.github.io/docs/tools/LogonTop), and quite generally all
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) machine learning and
experimentation (MLE) functionality is best supported in the LOGON
environment. Look in the sub-directory lingo/redwoods/ for examples of
how to create virtual profiles and run extensive batch runs, e.g.
populating a feature cache, training models, and executing a grid search
for optimal feature selection and estimation parameters.

Select the treebanked profile (left-click), or profiles (click in the
radio buttons) and then select *Trees \| Train* from the menus. It will
prompt you for the filename to put the scoring model in. The tradtion is
something like corpus-version.mem. You should have the grammar used for
treebanking loaded into the LKB ([LkbTop](https://delph-in.github.io/docs/tools/LkbTop)). Training is normally
fairly fast.

## Scoring

You can compare the ranking of a given profile with a treebanked gold
standard (assuming the same test-suite and grammar). The ranking can be
changed by changing the scoring model in the parser.

To compare: select the gold standard (middle click), then the profile to
be scored as the current database (left click); (make sure the current
version of the grammar is loaded into the LKB).

Set: *Trees \| Switches \| Implicit Ranks* and *Trees \| Switches \|
Result Equivalence*; and then go *Trees \| Score*.

     ;; score results in .data. against ground truth in .gold.  operates in
     ;; several slightly distinct modes: (i) using the implicit parse ranking in
     ;; the order of `results' or (ii) using an explicit ranking from the `score'
     ;; relation an orthogonal dimension of variation is (a) scoring by result
     ;; identifier (e.g. within the same profile or against one that is comprised
     ;; of identical results) vs. (b) scoring by derivation equivalence (e.g.
     ;; when comparing best-first parser output against a gold standard).

In order to make the scoring faster, you should do a thinning normalize
on the gold profile for comparison first. This thins (implicitly) to
only those trees marked as good by the annotator, i.e. you thin out all
dis-preferred trees. To get a 5-best comparison, play with the
Scoring Beam value.

## Using a Scoring Model in PET and the LKB

### Scoring in PET

The scoring model is referenced in cheap's grammar.set for PET:

    ;;; scoring mechanism (fairly embryonic, for now)
    sm := "hinoki.mem".

### Scoring in the LKB

The scoring model is referenced in the script and globals.lsp for the
LKB:

script

    ;;; if you have [incr tsdb()], load a Maximum Entropy parse selection model
    #+:tsdb
    (tsdb::read-model (lkb-pathname (parent-directory) "hinoki.mem"))

globals.lsp

    ;;; use the parse selection model for selective unpacking
    #+:tsdb
    (setf *unpacking-scoring-hook* #'tsdb::mem-score-configuration)

## Calculating a Baseline

You can calculate the baseline for a profile (the probability of a
random parse being correct) as follows:

    (tsdb::baseline "profile-name")
    (0.18341358 1.4064516 104.56272 1395)

The four numbers are the baseline itself, the average number of selected
trees, ??? and the number of items considered. The default condition is
readings &gt; 1 && t-active &gt;= 1, that is, all ambiguous parses that
have been reduced. You can add extra conditions, for example to only
consider items where the results are resolved to a single parse:

    (tsdb::baseline "profile-name" :condition "t-active = 1")
    (0.20147601 1.0 64.88867 1015)

# Training a scoring model using a batch script

Use the redwood script
[train.lisp](http://svn.emmtee.net/trunk/lingo/redwoods/train.lisp).

    ./load train.lisp

This should work if you have the treebanks and skeletons in the right
places. It first caches the values (fc.dbd) and then trains the models.
You must have **tadm** to do the actual training.

# Using TADM directly to train a ranking model

To create a ranker you just need to specify the number of options for
each event and indicate the number of observations for each option
(often 0 or 1 when looking at a single, uncondensed event). Say you were
doing parse reranking, and your first sentence has 2 parses and the 1st
is the correct one, and the second sentence has 5 parses and the 4th one
is the correct one. Then your event file would like like:

    2
    1 <features of the first parse>
    0 <features of the second parse>
    5
    0 <features of the first parse>
    0 <features of the second parse>
    0 <features of the third parse>
    1 <features of the fourth parse>
    0 <features of the fifth parse>

The difference with a classifier is that different events can have
different numbers of outcomes and the features won't include the class
label as part of their definition. The reason TADM can be used for
ranking is precisely because it doesn't pack in the class label into the
features automatically.

From Jason Baldridge
<http://sourceforge.net/projects/tadm/forums/forum/473054/topic/1992369>

Note that: &lt;features of the nth parse&gt; should be an integer giving
how many pairs of parses there are, and then pairs of integers showing
feature frequency. e.g.,

    3 0 1 1 3 2 1 

## Calling tadm

To train a model:

    tadm -events_in trains_df.eve.gz -params_out para_df-smooth.par -monitor -fatol 1e-32 -frtol 1e-7 -variances variances -malloc_log

To evaluate a model:

    evaluate para_df-smooth.par test_df.eve.gz

Last update: 2012-09-27 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/ItsdbTreebanking_ItsdbModeling/_edit)]{% endraw %}