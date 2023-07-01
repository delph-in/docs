{% raw %}# Overview

This page describes the transfer rule formalism used for, among other
things, [machine translation](https://delph-in.github.io/docs/tools/LogonTop),
[paraphrasing](https://delph-in.github.io/docs/tools/RmrsParaphrasing), and (pre-processing in)
[generation](https://delph-in.github.io/docs/tools/LkbGeneration). This page presents user-supplied
information, hence may be inaccurate in some details, or not necessarily
reflect use patterns anticipated by the original LOGON developers. The
functionality documented here may still change. This page was initiated
by FrancisBond; please feel free to make additions or
corrections as you see fit. However, before revising this page, one
should be reasonably confident of the information given being correct.

A little more information is available as an unfinished draft technical
report: Oepen (2008) *[The Transfer Formalism: General-Purpose MRS
Rewriting](http://www.emmtee.net/reports/11.pdf)*, LOGON Technical
Report \# 2007-11.

# Table of Contents

Contents

1. [Overview](https://delph-in.github.io/docs/tools/LogonTransfer#Overview)
2. [Table of Contents](https://delph-in.github.io/docs/tools/LogonTransfer#Table_of_Contents)
3. [Basic Structure](https://delph-in.github.io/docs/tools/LogonTransfer#Basic_Structure)
4. [An example transfer rule (from
JaEn)](https://delph-in.github.io/docs/tools/LogonTransfer#An_example_transfer_rule_.28from_JaEn.29)
   1. [Regular Expressions](https://delph-in.github.io/docs/tools/LogonTransfer#Regular_Expressions)
   2. [Optional Rules](https://delph-in.github.io/docs/tools/LogonTransfer#Optional_Rules)
5. [Interlingua](https://delph-in.github.io/docs/tools/LogonTransfer#Interlingua)
6. [Trouble Shooting](https://delph-in.github.io/docs/tools/LogonTransfer#Trouble_Shooting)
   1. [To ensure something is a noun](https://delph-in.github.io/docs/tools/LogonTransfer#To_ensure_something_is_a_noun)
   2. [Limit the effort in transfer](https://delph-in.github.io/docs/tools/LogonTransfer#Limit_the_effort_in_transfer)
7. [Loading the rules](https://delph-in.github.io/docs/tools/LogonTransfer#Loading_the_rules)
8. [Setting up an MT system](https://delph-in.github.io/docs/tools/LogonTransfer#Setting_up_an_MT_system)
9. [Other uses](https://delph-in.github.io/docs/tools/LogonTransfer#Other_uses)
   1. [Clean Up (post parsing)](https://delph-in.github.io/docs/tools/LogonTransfer#Clean_Up_.28post_parsing.29)
   2. [Fix Up (pre-generation)](https://delph-in.github.io/docs/tools/LogonTransfer#Fix_Up_.28pre-generation.29)
   3. [Trigger Rules (for
generation)](https://delph-in.github.io/docs/tools/LogonTransfer#Trigger_Rules_.28for_generation.29)
   4. [Idiom Rules](https://delph-in.github.io/docs/tools/LogonTransfer#Idiom_Rules)
   5. [Paraphrase Rules](https://delph-in.github.io/docs/tools/LogonTransfer#Paraphrase_Rules)

# Basic Structure

A transfer rule is a quadruple &lt;*F*, *C*, *I*, *O*&gt;, where each
element is a partial MRS, with:

- \- *F*: an input filter; when F matches against the input MRS, the
rule is
  
  - blocked; *F* is evaluated after *C* and *I* have matched;
  
  \- *C*: the input context; needs to match for a rule to apply and
binds
  
  - variables, but is preserved in the output;
  
  \- *I*: the input description; matches against the input MRS;
everything that
  
  - was matched in the input will be replaced by the output part
*O*;
  
  \- *O*: the output description; everything in the output part is
inserted
  
  - into the MRS, respecting variable bindings that have been
established in matching earlier components.

There is also a mysterious fifth element FLAGS, which has several
subtypes (OPTIONAL, EQUAL, SUBSUME, BLOCK).

- \- EQUAL: takes a list of identifiers and forces an equality
comparison instead of a subsumption
  - test wherever they appear in the rule.
  
  \- OPTIONAL: has value of + or - and makes application of the rule
optional. if the rule matches,
  - the MT system will fork creating an instance where the rule
applied and another where it didn't.
  
  \- BLOCK: takes a documentation string. A rule marked with
FLAGS.BLOCK will prune that path from the
  - transfer process.

# An example transfer rule (from JaEn)

This takes an input ep with a predicate of "\_inu\_n\_rel" (犬) and
transfers it to one with a predicate of "\_dog\_n\_1\_rel" (*dog*),
preserving the values of the LBL and ARG0.

    inu_n := noun_mtr &
    [ INPUT.RELS < [ PRED "_inu_n_rel" ] >,
      OUTPUT.RELS < [ PRED "_dog_n_1_rel" ] > ].

which is a subtype of:

    noun_mtr := monotonic_mtr &
    [ INPUT.RELS < [ LBL #h1, ARG0 #x1 ] >,
      OUTPUT.RELS < [ LBL #h1, ARG0 #x1 ] > ].

## Regular Expressions

You can use regular expressions in predicate names, by starting them
with a tilde **\~**. They cannot be used with variables. Regular
expressions are commonly used in the *C* element, both for transfer and
generation.

Here is an example of a pair of rules to switch the arguments of
prepositions. The first rule identifies prepositions using a regular
expression \~\_p\_ and marks them with a special, transfer-internal
predicate. The second rule removes the special predicate, and reverses
the arguments.

    prep_mark_jf := monotonic_mtr &
    [ CONTEXT.RELS < [ PRED "~_p_", LBL #h0, ARG0 #e1 & e ] >,
      FILTER.RELS < [ PRED "prep_swap_mark", LBL #h0, ARG0 #e1 ] >,
      OUTPUT.RELS < [ PRED "prep_swap_mark", LBL #h0, ARG0 #e1 ] >,
      FLAGS.EQUAL < #e1 > ].
    
    prep_swap_jf := monotonic_mtr &
    [ INPUT.RELS < [ LBL #h1, PRED #pred, 
                     ARG0 #e1, ARG1 #1, ARG2 #2 ],
                   [ PRED "prep_swap_mark", LBL #h1, ARG0 #e1 ] >,
      OUTPUT.RELS < [ LBL #h1, PRED #pred, 
                      ARG0 #e1, ARG1 #2, ARG2 #1 ] > ].

A filter makes sure no special predicates remain:

    mark_ditch_cf := elision_mtr &
    [ INPUT.RELS < [ PRED "~_mark$" ] > ].

## Optional Rules

Optional rules cause the transfer to fork. This produces one branch
where the rule applied, and one where it didn't.

They are conventionally written as *name*\_omtr and are defined as
follows:

    optional_mtr := mrs_transfer_rule &
    [ FLAGS.OPTIONAL + ].

The last rule in a set of transfer rules should be terminated. That is,
the last rule for a word's translation should be a non-optional MTR. If
this isn't done, then many spurious transfer outputs will be produced.

e.g.

    hoeru_v_1-bark_v_1_omtr := arg1_v_omtr &
    [ INPUT.RELS < [ PRED "_hoeru_v_1_rel" ] >,
     OUTPUT.RELS < [ PRED "_bark_v_1_rel" ] > ].
    
    hoeru_v_1-roar_v_1_mtr := arg1_v_mtr &
    [ INPUT.RELS < [ PRED "_hoeru_v_1_rel" ] >,
     OUTPUT.RELS < [ PRED "_roar_v_1_rel" ] > ].

# Interlingua

In MT, if you choose predicate names and definitions wisely, you can
transfer some things without the need for rules. To do this, you list
the predicates in \*transfer-interlingua-predicates\*.

- In lkb/mt.lisp:

<!-- -->


    (defparameter *transfer-interlingua-predicates*
      '(lkb::named_rel lkb::proposition_m_rel))

# Trouble Shooting

When you are transferring and then generating and get a message like
this:

    [10:59:24] translate(): read 1 MRS as generator input.
    [10:59:24] translate(): processing MRS # 0 (4 EPs).
    [10:59:24] translate(): error `Problem in create-liszt-fs-from-rels'.

The most likely cause is types in the MRS being read that aren't in the
feature structure of the grammar used to generate. You need to transfer
them or delete them using the [VPM](https://delph-in.github.io/docs/tools/RmrsVpm).

## To ensure something is a noun

Check that its in the scope of a quantifier.

    [ CONTEXT.HCONS < qeq & [ LARG #h0 ] >,
      INPUT.RELS < [ PRED #pred, LBL #h0, ARG0 #x1 & x & [ NUM pl ] ],
                   [ PRED mass_noun_mark, LBL #h0, ARG0 #x1 ] > ]

## Limit the effort in transfer

    (setf mt::*transfer-edge-limit* 1000)

# Loading the rules

Rules are loaded using mt:read-transfer-rules. For example, from
[JaEn](/JaEn):

    (mt:read-transfer-rules 
     (list
      (lkb-pathname (parent-directory) "snug.mtr")
      (lkb-pathname (grandparent-directory) "erg.mtr")
      (lkb-pathname (parent-directory) "erg.mtr")
      (lkb-pathname (grandparent-directory) "finale.mtr"))
     "TL accomodation phase"
     :out :out :post :erg :filter nil :after "postprocess")

- :filter
  
  - If at the start of transfer, for rule sets that were loaded with
\`:filter t', all input predicates are compared (as strings)
against the \`dictionary' of known INPUT predicates in that rule
set. that test, currently, does not take into account regular
expressions (though it probably should).
  
  :before
  
  - This calls a function as a pre-process before the transfer takes
place.
  
  :after
  
  - This calls a function as a post-process after the transfer takes
place.
  
  :out
  
  - **no documentation here, move along**
  
  :post
  
  - **no documentation here, move along**

# Setting up an MT system

See [MtSetup](https://delph-in.github.io/docs/garage/MtSetup) for instructions on how to set up an MT system.

# Other uses

Transfer rules are used in several other places.

## Clean Up (post parsing)

An MTR file defining transfer rules to massage MRSes read off of TFSes.
It must be

- ambiguity-free, i.e. must not contain optional rules.

<!-- -->


    cleanup-rules    := "../cleanup.mtr".

## Fix Up (pre-generation)

An optional transfer grammar invoked to massage MRSes generator inputs
prior to lexical lookup. It must be

- ambiguity-free, i.e. must not contain optional rules. See
[LkbGeneration](https://delph-in.github.io/docs/tools/LkbGeneration) for more on generation.

<!-- -->


    generation-fixup-rules     := "../gen-fixup.mtr".

## Trigger Rules (for generation)

Used to add lexical entries with empty semantics to the generator chart.
See [Trigger
Rules](/LkbGeneration#Generating_Semantically_Empty_Lexical_Entries_.28trigger.mtr.29)
for details.

## Idiom Rules

MTR file defining idiom-checking rules for parsing (see
[IdiomTop](/IdiomTop)).

    idiom-rules

These rules only license idioms, they do not have output.

## Paraphrase Rules

Only supported by the LKB, not ACE (2017-03-15).

     (list
      (lkb-pathname (parent-directory) "paraphraser.mtr")
      )
     "Paraphraser"
     :filter nil :task :paraphrase)

Activated by the **rephrase** menu on the LKB: these rules allow simple
paraphrasing (and can include optional rules). (See
[RmrsParaphrasing](https://delph-in.github.io/docs/tools/RmrsParaphrasing))

Last update: 2017-03-16 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/LogonTransfer/_edit)]{% endraw %}