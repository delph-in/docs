{% raw %}This page describes the transfer rule formalism used for, among other
things, \[wiki:[MachineTranslationTop](https://delph-in.github.io/docs/garage/MachineTranslationTop) MT\],
\[wiki:[RmrsParaphrasing](https://delph-in.github.io/docs/tools/RmrsParaphrasing) paraphrasing\] and
\[wiki:[JacyGeneration](https://delph-in.github.io/docs/grammars/JacyGeneration) generation\].

[TableOfContents](/TableOfContents)

# Basic Structure

A transfer rule is a quadruple &lt;F, C, I, O&gt;, where each element is
a partial MRS, with:

- \- F: an input filter; when F matches against the input MRS, the
rule is
  - blocked; F is evaluated **after** C and I have matched;
  
  \- C: the input context; needs to match for a rule to apply and
binds
  - variables, but is preserved in the output;
  
  \- I: the input description; matches against the input MRS;
everything that
  - was matched in the input will be replaced by the OUTPUT part;
  
  \- O: the output description; everything in the OUTPUT part is
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

An example transfer rule (from [JaEn](/JaEn)):

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
expressions are commonly used in the CONTEXT element, both for transfer
and generation.

Here is an example of a pair of rules to switch the arguments of
prepositions. The first rule identifies prepositions using a regular
expression \~\_p\_ and marks them with a special predicate. The second
rule removes the special predicate, and reverses the arguments.

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

They are conventionally written as rule-name-omtr and are defined as
follows:

    optional_mtr := mrs_transfer_rule &
    [ FLAGS.OPTIONAL + ].

The last rule in a set of transfer rules should be terminated. That is,
the last rule for a word's translation should be an mtr, not an omtr. If
this isn't done, then many spurious transfer outputs will be produced.

e.g.

    hoeru_v_1-bark_v_1-omtr := arg1_v_omtr &
    [ INPUT.RELS < [ PRED "_hoeru_v_1_rel" ] >,
     OUTPUT.RELS < [ PRED "_bark_v_1_rel" ] > ].
    
    hoeru_v_1-roar_v_1-mtr := arg1_v_mtr &
    [ INPUT.RELS < [ PRED "_hoeru_v_1_rel" ] >,
     OUTPUT.RELS < [ PRED "_roar_v_1_rel" ] > ].

# Interlingua

In MT, if you choose predicate names and definitions wisely, you can
transfer some things without the need for rules. To do this, you list
the predicates in **\*transfer-interlingua-predicates\***.

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
them or delete them using the \[wiki:[LogonVpm](https://delph-in.github.io/docs/tools/LogonVpm) VPM\].

## To ensure something is a noun

Check that its in the scope of a quantifier.

    CONTEXT.HCONS < qeq & [ LARG #h0 ] >,
      INPUT.RELS < [ PRED #pred, LBL #h0, ARG0 #x1 & x & [ NUM pl ] ],
                   [ PRED mass_noun_mark, LBL #h0, ARG0 #x1 ] >,

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

Last update: 2008-11-16 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/TransferRules/_edit)]{% endraw %}