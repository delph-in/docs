{% raw %}This page was adapted from [JacyGeneration](https://delph-in.github.io/docs/grammars/JacyGeneration) by
MichaelGoodman, and therefore many of the examples are
from the [JACY](https://delph-in.github.io/docs/grammars/JacyTop) Grammar.

Contents

1. [Overview](https://delph-in.github.io/docs/tools/LkbGeneration#Overview)
2. [Generating Semantically Empty Lexical Entries
(trigger.mtr)](https://delph-in.github.io/docs/tools/LkbGeneration#Generating_Semantically_Empty_Lexical_Entries_.28trigger.mtr.29)
   1. [How to list semantically empty lexical
entries](https://delph-in.github.io/docs/tools/LkbGeneration#How_to_list_semantically_empty_lexical_entries)
   2. [ToDo](https://delph-in.github.io/docs/tools/LkbGeneration#ToDo)
3. [Generating Unknown Words](https://delph-in.github.io/docs/tools/LkbGeneration#Generating_Unknown_Words)
4. [Selective Generation
(globals.lisp)](https://delph-in.github.io/docs/tools/LkbGeneration#Selective_Generation_.28globals.lisp.29)
   1. 1. 1. [In Ace](https://delph-in.github.io/docs/tools/LkbGeneration#In_Ace)
5. [Other Notes](https://delph-in.github.io/docs/tools/LkbGeneration#Other_Notes)
   1. [Make generation faster
(globals.lsp)](https://delph-in.github.io/docs/tools/LkbGeneration#Make_generation_faster_.28globals.lsp.29)
   2. [Fixup MRS (mrsglobals.lsp)](https://delph-in.github.io/docs/tools/LkbGeneration#Fixup_MRS_.28mrsglobals.lsp.29)
   3. [Reload generation rules without
reindexing](https://delph-in.github.io/docs/tools/LkbGeneration#Reload_generation_rules_without_reindexing)
   4. [MRS Semantic Equivalence
Check](https://delph-in.github.io/docs/tools/LkbGeneration#MRS_Semantic_Equivalence_Check)
   5. [Checking the Generator Index](https://delph-in.github.io/docs/tools/LkbGeneration#Checking_the_Generator_Index)
6. [Trouble Shooting](https://delph-in.github.io/docs/tools/LkbGeneration#Trouble_Shooting)
   1. [Morphology](https://delph-in.github.io/docs/tools/LkbGeneration#Morphology)
   2. [C-CONT](https://delph-in.github.io/docs/tools/LkbGeneration#C-CONT)
   3. [Loading and Activating a Generation
Model](https://delph-in.github.io/docs/tools/LkbGeneration#Loading_and_Activating_a_Generation_Model)

# Overview

Described below is generation using the mtr rule formalism developed in
the LOGON project.

Three files control the process mt.lsp, mtr.lsp and trigger.mtr. They
are loaded by the script file.

# Generating Semantically Empty Lexical Entries (trigger.mtr)

This file controls when to add lexical entries with empty semantics to
the generator chart. If they were all added all the time then the chart
would get too big.

- example of a rule for the past tense ending:

<!-- -->


    ta-end_gr := arg0e_gr &
    [ CONTEXT [ RELS <! [ ARG0.E.TENSE past ] !> ],
      FLAGS.TRIGGER "ta-end" ].

- example of a rule for copulas:

-- You can use regular expressions in the strings: "\~.\*\_a\_"

    ;; should use lexical type for na-adj
    na-cop-lex_gr := arg0e_gr &
    [ CONTEXT [ RELS <! [ PRED "~.*_a_"] !> ],
      FLAGS.TRIGGER "na-cop-lex" ].

- Example of a case marker:

<!-- -->


     ;;; ARG1 is ga
    ga_gr_1 := arg0e_gr &
    [ CONTEXT [ RELS <!  [ ARG0.E.PASS -, ARG1 individual & #i ] !> ],
      FLAGS [SUBSUME < #i >,
             TRIGGER "ga" ]].

## How to list semantically empty lexical entries

    ;;;
    ;;; automatically generate rules for all semantically empty lexical entries
    ;;; which don't already have trigger rules
    ;;;
     (loop
         with *package* = (find-package :lkb)
         for id in mrs::*empty-semantics-lexical-entries*
         do
         (unless (or #+:mt
                     (gethash id mt::*transfer-triggers*)
                     (member id mrs::*gen-rule-ids*))
           (format
            t
            "~(~a~)_gr := generator_rule &~%~
             [ CONTEXT [ RELS <! [ PRED \"non_existing_rel\" ] !> ],~%  ~
               FLAGS.TRIGGER \"~(~a~)\" ].~%~%"
            id id)))
    ;;;                              (25-dec-04; oe, 13-Jun-06 FCB)

This produces trigger rules of the form:

    tomae_numcl_gr := generator_rule &
    [ CONTEXT [ RELS <! [ PRED "non_existing_rel" ] !> ],
      FLAGS.TRIGGER "tomae_numcl" ].

which should go into the trigger.mtr file until you decide how to
trigger them.

Note, before redoing this (to see if you need any changes for a new
version of the grammar) you should:

- delete all existing automatically generated rules
- delete the lexicon and generator cache
- load the grammar, index for generation
- run the above loop and then add to the trigger file

## ToDo

- It would be nice to be able to access the grammar's type hierarchy
when writing trigger rules.

# Generating Unknown Words

You can trigger the generation of unknown words in the LKB by
instantiating \*generic-lexical-entries\*. There is an example of this
in the ERG's global.lsp file.

# Selective Generation (globals.lisp)

You can block generation of some non-empty predicates by putting it in
the list \*duplicate-lex-ids\* in globals.lisp. [Jacy](https://delph-in.github.io/docs/grammars/JacyTop)
currently does this to block informal and variant forms for which we
have no available filter. Note that this is a list of lex-ids, not
predicate names.

**Note**: If you want this list to also be seen by [ace](https://delph-in.github.io/docs/tools/AceTop), you
need to move it to a separate file (see a recent ERG for examples of how
to do this).

    (setf *duplicate-lex-ids*
      '(;; s-end1-decl-lex - emphatic sentence enders
        ga-sap keredomo-send kedomo-send ga-sap kedo-send shi-send
        yo-2 yo-3 keredo-send exclamation-mark ze zo zo-2
        ;; s-end1-decl-minusahon-lex - emphatic sentence enders
        i-emp
        ;; variant forms of numbers (hankaku)
        zero_card_a one_card_a two_card_a three_card_a four_card_a
        five_card_a six_card_a seven_card_a eight_card_a nine_card_a
        ;; variant forms of numbers (zenkaku)
        zero_card one_card two_card three_card four_card
        five_card six_card seven_card eight_card nine_card
        ;;; indefinite pronouns FIXME - improve semantics
        donna douiu dono-det
        ))

You can also block rules from being used in generation by adding them to
\*gen-ignore-rules\*, also in globals.lisp.

    (setf *gen-ignore-rules*
      '(punct_bang_orule)

#### In Ace

    generation-ignore-lexemes := "../lkb/nogen-lex.set".
    generation-ignore-rules   := "../lkb/nogen-rules.set".

# Other Notes

## Make generation faster (globals.lsp)

    (setf *gen-packing-p* t)
    (setf *gen-filtering-p* t)
    (setf *packing-restrictor*  '(RELS HCONS ORTH STEM RULE-NAME))

## Fixup MRS (mrsglobals.lsp)

## Reload generation rules without reindexing

This is useful when you are debugging.

    (progn
      (mt:initialize-transfer)
      (mt:read-transfer-rules
       (list
        "~/delphin/grammars/japanese/generation.mtr")
       "Generator Triggger Rules"
       :filter nil :task :trigger :recurse nil :subsume nil))

## MRS Semantic Equivalence Check

At the end of generation, the lkb checks that the MRS of the generated
string is subsumed by the input MRS. That is, it contains all the
information in the input. You can omit the check entirely by setting
\*bypass-equality-check\* to t. You can relax the check by setting the
post-generation semantic equivalence check to filter mode, i.e. prefer
results that satisfy the test when available, but if no outputs pass the
equivalence test at all, then output all complete generator results.
This is set in lkb/globals.lsp.

    ; output all complete generated results
    (setf *bypass-equality-check* t)
    
    ; prefer results with MRS subsumed by the input
    ; but if none exist then output all complete generated results
    (setf *bypass-equality-check* :filter)

## Checking the Generator Index

You can manually see if a predicate is on the generator's index with the
following command:

    (gethash "_inu_n_rel" mrs::*relation-index*)

Where \_inu\_n\_rel is the relation name.

# Trouble Shooting

## Morphology

If you try to generate but nothing happens for a very long time, even
though you have a very low number of edges set, the problem may be in
the morphology. You can test the morphology by running
batch-check-morphology: this checks all inflectional forms for all
words, so can also be very slow.

A quicker test is to comment out all inflectional rules except those
used in a single test sentence, reload the grammar and then try
generating that sentence.

## C-CONT

If a rule introduces a predicate somewhere other than in the C-CONT,
then it will not be indexed and generation will fail with the warning:

    Warning: invalid predicates:|"predicate-name"|

Make sure all predicates are either in lexical entries or C-CONT.

## Loading and Activating a Generation Model

    #+:tsdb
     (tsdb::read-model (lkb-pathname (parent-directory) "jhpstg.g.mem"))
    #+:tsdb
     (setf *unpacking-scoring-hook* #'tsdb::mem-score-configuration)

This should work in the LKB SVN as well as the LOGON tree, and is the
basis for ranking and selective unpacking in generation and also in
parsing.

Last update: 2020-05-21 by JohnCarroll [[edit](https://github.com/delph-in/docs/wiki/LkbGeneration/_edit)]{% endraw %}