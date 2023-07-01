{% raw %}There are several ways to increase the performance of the grammar during
parsing and generation.

This page is now superseded by the
[GrammarPerformance](https://delph-in.github.io/docs/tools/GrammarPerformance) page.

Contents

1. [Quick Check](https://delph-in.github.io/docs/grammars/JacyPerformance#Quick_Check)
   1. [PET](https://delph-in.github.io/docs/grammars/JacyPerformance#PET)
   2. [LKB](https://delph-in.github.io/docs/grammars/JacyPerformance#LKB)
      1. [ToDo](https://delph-in.github.io/docs/grammars/JacyPerformance#ToDo)
2. [Key Arguments](https://delph-in.github.io/docs/grammars/JacyPerformance#Key_Arguments)
   1. 1. [ToDo](https://delph-in.github.io/docs/grammars/JacyPerformance#ToDo-1)
3. [Spanning Only Rules](https://delph-in.github.io/docs/grammars/JacyPerformance#Spanning_Only_Rules)
4. [Ambiguity Packing](https://delph-in.github.io/docs/grammars/JacyPerformance#Ambiguity_Packing)
5. [Restrictions on the application of morphological
rules](https://delph-in.github.io/docs/grammars/JacyPerformance#Restrictions_on_the_application_of_morphological_rules)
6. [Trigger Rules for Generation](https://delph-in.github.io/docs/grammars/JacyPerformance#Trigger_Rules_for_Generation)
7. [Current Issues](https://delph-in.github.io/docs/grammars/JacyPerformance#Current_Issues)

# Quick Check

Make sure the two quick-check files are kept up to date.

- LKB: ${JACY}/lkb/checkpaths.lsp PET: ${JACY}/pet/qc.tdl

Quick check is a method where paths where unifications likely to fail
are checked first, for efficiency. Which unifications are likely to fail
are found by preprocessing a text and seeing which points of failure are
common. It is described in, e,g,:

Ulrich Callmeier. *Preprocessing and Encoding Techniques in PET*. In
Stephan Oepen, Dan Flickinger, Jun-ichi Tsujii and Hans Uszkoreit
editors, Collaborative Language Engineering. A Case Study in Efficient
Grammar-based Processing, CSLI Publications, Stanford, 2002.

## PET

Make sure:

- \- you are using compatible versions of flop and cheap - your
grammar is up-to-date:

See ${JACY}/utils/make-qc.bash

    mv pet/qc.tdl pet/qc.tdl.old
    flop japanese
    cat testfile | cheap -limit=100000 -packing -compute-qc=pet/qc.tdl japanese;
    flop japanese

- The testfile must be segmented

<!-- -->


    grep -v '#' testsuites/mt-test-set-1.txt | chasen -F "%m " > testfile

After you have made the quick check file, you need to rebuild the
grammar

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

## LKB

See Copestake (2002: pp 196--197).

    mv lkb/checkpaths.lsp pet/checkpaths.lsp.old

from within the \*common-lisp\* buffer:

    (lkb::with-check-path-list-collection 
       "~/delphin/grammars/japanese/lkb/checkpaths.lsp" 
       (parse-sentences 
          "~/delphin/grammars/japanese/testsuites/hinoki-test-a.100" 
          "~/delphin/grammars/japanese/testsuites/hinoki-test-a.100.results"))

### ToDo

- This would be nice to automate
- It would be nice to share the config between PET and the LKB (or
convert)
- It may be worth doing a grid search to optimize how many quick-check
paths should actually be checkd.

# Key Arguments

You can gain some performance increase by setting the order in which the
daughters of rules are checked (Oepen & Carroll 2002: pp 204--206). The
order can be specified in the grammar or in the configuation files for
the lkb and pet.

\* In the grammar

- You can use KEY-ARG and specify it per rule in the grammar.

<!-- -->


    binary_rule_left_to_right := rule &
      [ ARGS < [ KEY-ARG + ] , [ KEY-ARG bool ] > ].

\* In the LKB (**lkb/globals.lsp**)

    (defparameter *rule-keys*
      '((HEAD-ADJUNCT-RULE1 . 1)
        (COMPOUNDS-RULE . 1)
        (KARA-MADE-RULE . 2) 
        (HEAD_SUBJ_RULE . 2)
        (HEAD-SPECIFIER-RULE . 2)
        (HEAD-COMPLEMENT-RULE . 2) 
        (HEAD-COMPLEMENT2-RULE . 2)
        (HEAD-ADJUNCT-RULE2 . 2)))

\* In PET (**pet/japanese.set**)

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

default is 0.

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

# Spanning Only Rules

In PET only, you can set rules to only apply over the entire span.

    spanning-only-rules := $frg-np $frg-pp $frg-s-adv $frg-i-adv
                           $frg-pp-np $frg-i-adv-np $frg-pp-int 
                           $runon_s.

Making the rules spanning only for pet reduces the number of tasks by
7.2%, and speeds things up by 5.1%. And we have only a few fragment
rules at the moment, compared to the ERG's almost 20.

Ann suggests that this could also be done using special start/end
tokens...

# Ambiguity Packing

See [PetSelectiveUnpacking](https://delph-in.github.io/docs/garage/PetSelectiveUnpacking).

# Restrictions on the application of morphological rules

(Depreciated)

# Trigger Rules for Generation

# Current Issues

- The Idiom optimizations don't seem to be working
- It would be nice to use supertagging

Last update: 2017-01-11 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/JacyPerformance/_edit)]{% endraw %}