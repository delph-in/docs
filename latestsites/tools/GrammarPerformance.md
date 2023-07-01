{% raw %}
There are several ways to increase the performance of DELPH-IN
grammars during parsing and generation.

This page attempts to give a rough idea of how to tweak your grammar
for better performance. As people add new techniques, please link them
here.

This page aims to document DELPH-IN techniques. It was started by
Francis, inspired by the [Capitol Hill Grammar
Engineering Meeting](https://delph-in.github.io/docs/summits/CapitolHillTop) and based on a page originally
written for Jacy ([JacyPerformance](https://delph-in.github.io/docs/grammars/JacyPerformance)).

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->

**Table of Contents**

- [Things to tweak for overall performance](https://delph-in.github.io/docs/tools/GrammarPerformance#things-to-tweak-for-overall-performance)
  - [Quick Check](https://delph-in.github.io/docs/tools/GrammarPerformance#quick-check)
    - [PET](https://delph-in.github.io/docs/tools/GrammarPerformance#pet)
    - [ACE](https://delph-in.github.io/docs/tools/GrammarPerformance#ace)
    - [LKB](https://delph-in.github.io/docs/tools/GrammarPerformance#lkb)
    - [ToDo](https://delph-in.github.io/docs/tools/GrammarPerformance#todo)
  - [Key Arguments](https://delph-in.github.io/docs/tools/GrammarPerformance#key-arguments)
    - [ToDo](https://delph-in.github.io/docs/tools/GrammarPerformance#todo-1)
  - [Spanning Only Rules](https://delph-in.github.io/docs/tools/GrammarPerformance#spanning-only-rules)
  - [Trigger Rules for Generation](https://delph-in.github.io/docs/tools/GrammarPerformance#trigger-rules-for-generation)
  - [Don't copy things you won't use](https://delph-in.github.io/docs/tools/GrammarPerformance#dont-copy-things-you-wont-use)
  - [Ubertagging](https://delph-in.github.io/docs/tools/GrammarPerformance#ubertagging)
- [Things to do to reduce noise during grammar engineering](https://delph-in.github.io/docs/tools/GrammarPerformance#things-to-do-to-reduce-noise-during-grammar-engineering)
- [Things that magically just happen](https://delph-in.github.io/docs/tools/GrammarPerformance#things-that-magically-just-happen)
  - [Ambiguity Packing](https://delph-in.github.io/docs/tools/GrammarPerformance#ambiguity-packing)
  - [Packing under Generalization](https://delph-in.github.io/docs/tools/GrammarPerformance#packing-under-generalization)

<!-- markdown-toc end -->


# Things to tweak for overall performance

## Quick Check

Quick check is a method where paths where unifications likely to fail
are checked first, for efficiency. Which unifications are likely to fail
are found by preprocessing a text and seeing which points of failure are
common.

The canonical reference is:

Robert Malouf, John Carroll and Ann Copestake. [Efficient feature structure operations without compilation](http://users.sussex.ac.uk/~johnca/papers/malouf.pdf). *Natural Language Engineering*, 6(1). 29-46. 2000.

### PET

The file is read in flop.set:

    postload-files := "pet/qc".

To make the file, ensure:

- you are using compatible versions of flop and cheap
- your grammar is up-to-date

See e.g., ${JACY}/utils/make-qc.bash

    mv pet/qc.tdl pet/qc.tdl.old
    flop japanese
    cat testfile | cheap -limit=100000 -packing -compute-qc=pet/qc.tdl japanese;
    flop japanese

The testfile must be segmented (e.g., for Japanese)

    grep -v '#' testsuites/mt-test-set-1.txt | chasen -F "%m " > testfile

After you have made the quick check file, you need to rebuild the
grammar.

Note: This is slow, as quick-check is, off course, turned off. In
general, you should use the mode you would normally use (e.g. with
packing if you use packing).

The file is read in when you flop, so add the following to flop.set

    ;; list of files to load after everything else
    
    postload-files := "pet/qc".
    
    ;; `pseudo' types outside the type hierarchy. these are ignored for
    ;; appropriateness, expansion etc.
    pseudo-types := 
      $qc_unif_trad $qc_unif_set $qc_subs_trad $qc_subs_set
      $qc_unif_trad_pack $qc_unif_set_pack $qc_subs_trad_pack $qc_subs_set_pack.

### ACE

The PET quickcheck file can also be used by ACE.

ACE also has a native quickcheck format, which is read with:

    quickcheck-code           := "../ace/ace-erg-qc.txt".

ACE can also produce its quickcheck paths, but currently it is not made
available as a run-time option. In order to produce quickcheck files
from ACE, recompile the ACE code with the gen\_qc in 'chart.c' option
set to 1, then use that grammar to parse some sentences. At the end, the
quickcheck lines will be printed to stderr.

Note that ACE wants to parse with the same version of the software that
was used to compile a grammar, and the quickcheck producer (being a very
experimental feature) does not work well with grammar compilation, so
you can compile first with gen\_qc=0 to produce a version of ACE for
compiling your grammar, then again with gen\_qc=1 to produce the version
of ACE used for parsing.

### LKB

See Copestake (2002: pp 196--197).

The file is read in lkb/script:

    (lkb-load-lisp (this-directory) "checkpaths.lsp" t)

It is made as follows:

    mv lkb/checkpaths.lsp lkb/checkpaths.lsp.old

and then from within the \*common-lisp\* buffer:

    (lkb::with-check-path-list-collection 
       "~/delphin/grammars/japanese/lkb/checkpaths.lsp" 
       (parse-sentences 
          "~/delphin/grammars/japanese/testsuites/hinoki-test-a.100" 
          "~/delphin/grammars/japanese/testsuites/hinoki-test-a.100.results"))

### ToDo

- It would be nice to share the format between PET, LKB and ACE (or
convert)
- It may be worth doing a grid search to optimize how many quick check
paths should actually be checked.
  - around 50-60 seems to be ideal
  - ACE does something like this

## Key Arguments

You can gain some performance increase by setting the order in which the
daughters of rules are checked (Oepen & Carroll 2002: pp 204--206). The
order can be specified in the grammar (used by the LKB, ACE and PET) or
in the configuration files for the LKB and PET.

- In the grammar

Use KEY-ARG and specify it per-rule:

    binary_rule_left_to_right := rule &
      [ ARGS < [ KEY-ARG + ] , [ KEY-ARG bool ] > ].

This can then be combined with a rule:

    hcomp_rule := binary_rule_left_to_right & head_comp_phrase.

- In the LKB configuration file

lkb/globals.lsp:

    (defparameter *rule-keys*
      '((HEAD-ADJUNCT-RULE1 . 1)
        (COMPOUNDS-RULE . 1)
        (KARA-MADE-RULE . 2)
        (HEAD_SUBJ_RULE . 2)
        (HEAD-SPECIFIER-RULE . 2)
        (HEAD-COMPLEMENT-RULE . 2)
        (HEAD-COMPLEMENT2-RULE . 2)
        (HEAD-ADJUNCT-RULE2 . 2)))

- In the PET configuration file

pet/japanese.set:

    ;; assoc (rules -> keyarg position) (alternative to KEY-ARG mechanism)
    rule-keyargs := 
    $HEAD-ADJUNCT-RULE1 1 
    $HEAD-ADJUNCT-RULE2 2 
    $HEAD-ADJUNCT-RULE3 1 
    $RELATIVE-CLAUSE-RULE 1 
    $COMPOUNDS-RULE 1 
    $SENTENCE-TE-COORDINATION-RULE 1
    $CONJ-RULE 1
    $KARA-MADE-RULE 2 
    $HEAD_SUBJ_RULE 2 
    $HEAD-SPECIFIER-RULE 2 
    $HEAD-COMPLEMENT-HF-RULE 2 
    $HEAD-COMPLEMENT-HI-RULE 1 
    $HEAD-COMPLEMENT-AFFIXBIND-RULE 2
    $HEAD-COMPLEMENT2-RULE 2 
    $HEAD-2OBL-COMPLEMENTS-RULE 2
    $VN-LIGHT-RULE 2
    $VEND-VEND-RULE 1
    $VSTEM-VEND-RULE 2 
    $VN-VEND-RULE 2
    $PREFIX-ATTACH-RULE 1
    $NP-QUEST-FRAG-RULE 2.

Key mode in cheap is set with:

    `-key=n' --- select key mode (0=key-driven, 1=l-r, 2=r-l, 3=head-driven)

The default is 0.

You get the data by creating two profiles one with -key=1 and one with
key=2, turning on -rulestats. First enable
\[Process,switches:write rule relation\] in [\[incr
tsdb()\]](http://www.delph-in.net/itsdb). Use the mode you would
normally use (e.g. with packing if you use packing).

Then \[Analyze:rule table\] for both profiles and you want to check the
daughter with the least number of active edges (the passive edges should
be the same modulo memory overflow errors).

### ToDo

- This would be nice to automate
- It would be nice to share the config between PET and the LKB (or
convert)

## Spanning Only Rules

You can set rules to only apply over the entire span.
The configuration file syntax for PET is:

    spanning-only-rules := $frg-np $frg-pp $frg-s-adv $frg-i-adv
                           $frg-pp-np $frg-i-adv-np $frg-pp-int 
                           $runon_s.

In the ACE config file, a similar option has the same effect (note the
lack of $'s):

    spanning-only-rules :=
      aj-r_frg_c np-aj_frg_c np-aj_rorp-frg_c
      pp-aj_frg_c j-aj_frg_c np_nb-frg_c np-cl_numitem_c.

In the LKB, the equivalent is:

    (defparameter *spanning-only-rules*
      '(aj-r_frg_c np-aj_frg_c np-aj_rorp-frg_c
        pp-aj_frg_c j-aj_frg_c np_nb-frg_c np-cl_numitem_c))

In one experiment with Jacy, specifying spanning only rules reduced the number of tasks
by 7% and speeded things up by 5%.

## Trigger Rules for Generation

You can control when to add lexical entries with empty semantics to the
generator chart using trigger rules. If they were all added all the time
then the chart would get too big.

See [LkbGeneration](https://delph-in.github.io/docs/tools/LkbGeneration) for more discussion (note that
trigger rules also work with [Ace](https://delph-in.github.io/docs/tools/AceTop)).

## Don't copy things you won't use

In general, you do not want to copy up all the information from lower
nodes in the tree to upper nodes (unless they are specifically linked
with a re-entrancy). You can control what is **not** copied with
deleted daughters. The Matrix sets this to
ARGS HEAD-DTR NON-HEAD-DTR DTR. If you add any more daughters, you
should list them here.

Some examples from the ERG's ACE config:

    deleted-daughters := 
      ARGS HD-DTR NH-DTR LCONJ-DTR RCONJ-DTR DTR DTR1 DTR2 DTRA DTRB.
    
    parsing-packing-restrictor := 
       RELS HCONS ICONS RNAME +TI +LL +TG.

## Ubertagging

Ubertagging is the process of supertagging over ambiguous tokenisation.
This process filters the lexical lattice prior to full parsing according
to a statistical model. It is especially sueful for long sentences.

See the [Uber Tagging](https://delph-in.github.io/docs/garage/UtTop) page for more details.

Ubertagging is available for PET and ACE, but needs some set up and
training over a corpus.

# Things to do to reduce noise during grammar engineering

You can have too many rules, some of which can be annoying if you are
focusing on a different phenomenon. In that case, comment them out and
recompile/reload the grammar. For example, comment out the fragment
rules if you only care for full sentences.

You can also do this with a masking file (so you can have sets of things
you want to ignore). E.g., from the ERG:

    cl-cl_runon_c := never_unify_rule.
    
    never_unify_rule := rule &
      [ SYNSEM.LOCAL.CAT.HEAD no_head & [ MINORS.MIN never_unify_rel,
                                          PRD + ],
        ARGS < [ SYNSEM.LOCAL.CAT.HEAD no_head & 
                                       [ MINORS.MIN never_unify_rel,
                                         PRD - ] ] > ].

It is worth checking your chart occasionally for chunks you don't ever
want, and see if you can get rid of unnecessary edges (dark matter).
Removing these will make your life easier and make things run faster.
You need to not be afraid of the chart! It can help to get another
person to look together. Testing with generation is another good way to
spot these.

Also, don't be afraid of taking some low frequency very ambiguous things
out (e.g. letter *I* for English, Hiragana *は* "tooth" for Japanese)
until you are really trying for very high coverage.

# Things that magically just happen

## Ambiguity Packing

See [PetSelectiveUnpacking](https://delph-in.github.io/docs/garage/PetSelectiveUnpacking).

## Packing under Generalization

ACE extends packing under subsumption to allow two edges to pack even
when neither subsumes the other, under some circumstances. Woodley calls
this packing under **generalization** (i.e. an AVM is constructed that
subsumes both).

This can lead to confusing edges in the chart, so it can be a good idea
to turn it off when debugging:

     --disable-generalization

Last update: 2022-12-19 by John Carroll [[edit](https://github.com/delph-in/docs/wiki/GrammarPerformance/_edit)]{% endraw %}