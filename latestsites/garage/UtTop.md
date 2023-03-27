{% raw %}## Overview

Ubertagging is what we have called the process of supertagging over
ambiguous tokenisation. This process filters the lexical lattice prior
to full parsing according to a statistical model (a trigram semi-HMM,
see [Dridan, 2013](http://aclweb.org/anthology/D/D13/D13-1120.pdf) for
details). As of the 1214 version of the ERG, mechanisams are in place to
use ubertagging functionality when parsing with PET and the ERG.

## Using the ubertagging-enabled binary

## Grammar setup

PET will look for ubertagging specific files in an ut/ subdirectory of
the grammar. There are two types of files you will find here:

- model files: these come in pairs (transition and emission), and you
select which set to use by using the basename in the settings file,
described in Runtime configuration below.
- configuration files: pending a more transparent way to extract this
information from the grammar directly, three configuration files
specify required information in an easily accessible fashion. These
files need to be kept up to date with respect to the grammar. They
are:
  - generics.cfg - a mapping from generic lexical type to the
appropriate native lexical type
  - prefix.cfg - possible surface strings for each prefix inflection
rule
  - suffix.cfg - possible surface strings for each suffix inflection
rule

In addition, various options need to be set. These are handled using the
standard PET settings mechanism, with .set files under the pet/ subdir.
See below for the actual settings.

## Runtime configuration

To use ubertagging with PET, give the -ut\[=file\] option to the parser.
The file should be a settings file in the pet/ subdir of the grammar.
The required options are:

- ut-model - the basename of the model files
- generics\_map - the name of the generics mapping file in the ut/
subdir
- prefixes - the name of the prefix file in the ut/ subdir
- suffixes - the name of the suffix file in the ut/ subdir

Other possible options:

- ut-threshold - this is the tag probability under which associated
lexical items are filtered. It can be set in the configuration file,
or else on the cheap commandline as -lpthreshold=n (0 &lt; n &lt;
1). The commandline option will override the config file option. If
no threshold is given, probabilities are calculated, but no
filtering is done. (This can be useful for debugging, with the right
output setup.)
- ut-viterbi - if set to true will filter all lexical items not
associated with the single best path through the lexical lattice, as
calculated by Viterbi. The threshold is ignored in this case.

The options regarding tag type, caseclass separator and whether or not
to map generics are all set at model training time, and as such are
selected by selecting the right model.

An example file, ut.set is shown below. This would be invoked by giving
cheap the option -ut=ut

    ut-model := tri-nanc-wsjr5-noaffix.
    ut-threshold := "0.01".
    ;; uncomment to turn on full Viterbi filtering
    ;;ut-viterbi := true.
    
    generics_map := "generics.cfg".
    prefixes := "prefix.cfg".
    suffixes := "suffix.cfg".
    
    ;;for model creation, set from model when tagging
    ut-caseclass_separator := ▲.
    ut-tagtype := NOAFFIX.
    ut-mapgen := true.

## Training a model

Code for training the ubertagging models (and also for running viterbi
on lexical profiles) is available at <http://svn.delph-in.net/ut/trunk>.
Training a model requires training data in the form of
&lt;word&gt;\\t&lt;tag&gt; and can use the same configuration file as
the parser, but requires some extra options:

- ut-tagtype - specifies the granularity of the tags. Currently, the
options defined are based on aspects of the ERG and are:
  - FULL - lexical type, plus all lexical rules including affixation
(punctuation) rules, concatenated with colon separators.
  - NOAFFIX - lexical type, plus all lexical rules except affixation
(punctuation) rules, concatenated with colon separators.
  - LETYPE - lexical type
  - MSCAFFIX - part of the lexical type before the first underscore
(major syntactic category), plus all lexical rules, concatenated
with colon separators.
  - MSC - part of the lexical type before the first underscore
(major syntactic category).
- ut-mapgen - set to true to map generic lexical types to their native
equivalent, as specified in the generics\_map file
- ut-caseclass\_separator - a special character that should not appear
in your text. This is a delimiter used to overcome a limitation of
the current parsing process that downcases most surface forms before
the point ubertagging takes place, while recording something about
the capitalisation patterns in the +CASECLASS feature. Ideally, this
sort of sequence tagging would use the actual surface form, but
since it is not available in the lexical lattice, we annotate the
surface form with the +CASECLASS feature, if it exists, using the
ut-caseclass\_separator as a delimiter. As such, the training data
also has to include this annotation, making the process a little
more brittle than we would like.

In order to train a model, checkout the code and then run:

    autoreconf -i
    ./configure
    make
    
    cat redwoods-train.tt |./traintrigram -c ./etc/ut.set redwoods-train

Training data can also be read from files given on the command line,
instead of via stdin. An example of the training data used to create the
models included with the grammar is shown below, with each token on a
separate line, and items separated by blank lines.

    well,▲non_capitalized+lower     av_-_s-cp-mc-pr_le:w_comma_plr
    i▲capitalized+non_mixed n_-_pr-i_le
    am▲non_capitalized+lower        v_prd_am_le
    free▲non_capitalized+lower      aj_-_i_le
    on▲non_capitalized+lower        p_np_i-tmp_le
    monday▲capitalized+lower        n_-_c-dow_le:n_sg_ilr
    except for▲non_capitalized+lower        p_np_i_le
    ten▲non_capitalized+lower       n_-_pn-hour_le
    to▲non_capitalized+lower        n_np_x-to-y-sg_le
    twelve▲non_capitalized+lower    n_-_pn-hour_le
    in▲non_capitalized+lower        p_np_i-tmp_le
    the▲non_capitalized+lower       d_-_the_le
    morning.▲non_capitalized+lower  n_-_c-dpt-df-sg_le:w_period_plr
    
    and▲non_capitalized+lower       c_xp_and_le
    i▲capitalized+non_mixed n_-_pr-i_le
    am▲non_capitalized+lower        v_prd_am_le
    free,▲non_capitalized+lower     aj_-_i_le:w_comma_plr
    on▲non_capitalized+lower        p_np_i-tmp_le
    tuesday▲capitalized+lower       n_-_c-dow_le:n_sg_ilr
    in▲non_capitalized+lower        p_np_i-tmp_le
    the▲non_capitalized+lower       d_-_the_le
    afternoon.▲non_capitalized+lower        n_-_c-dpt-df-sg_le:w_period_plr

Code for extracting this training data is also included in the ut SVN
repository:

    ./leafextract -h
    Usage: ./leafextract [options] grammar-file profile
    Options:
      -h [ --help ]             This usage information.
      -c [ --config ] arg       Configuration file that sets caseclass separator
      -g [ --goldonly ]         Only extract tags from 'gold' trees
      -s [ --single ] arg (=-1) Select a specific item, default (-1): all
      -r [ --result ] arg (=-1) Select a specific result number, default (-1): all.

To extract training data from an annotated profile (single or virtual),
run

    /leafextract -c etc/ut.set -g $LOGONROOT/lingo/erg/english.tdl $LOGONROOT/lingo/erg/tsdb/gold/redwoods > redwoods-train.tt

For unannotated data (for semi-self-training), leave off the -g option.
If your profile has more than one result per item, and you only want to
extract from the top result, use -r 0. For standardisation with the
ubertagging code, leafextract takes the same configuration file as the
other programs, but only reads the ut-caseclass\_separator option. If
this is not given, the code defaults to using ▲.

Last update: 2016-11-21 by RebeccaDridan [[edit](https://github.com/delph-in/docs/wiki/UtTop/_edit)]{% endraw %}