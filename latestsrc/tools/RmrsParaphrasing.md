{% raw %}This page discusses some of the known issues with paraphrasing, with
especial reference to (R)MRS. It also tells you how to paraphrase using
MRS in the [LKB](https://delph-in.github.io/docs/tools/LkbTop).

## Paraphrasing in the LKB

### Paraphrasing using rules

Put your paraphrasing rules in a file paraphraser.mtr, and load it in
the lkb/script file.

    ;;; transfer rules for paraphrasing
    #+:mt
    (mt:read-transfer-rules 
     (list
      (lkb-pathname (parent-directory) "paraphraser.mtr"))
     "Paraphrasing Rules"
     :filter nil :task :paraphrase)

Then when you parse something, a menu item **Rephrase** should appear,
and this will apply the paraphrase rules to the selected parse, and then
generate from the paraphrase. If you don't get generated output, try
first doing **Start Server** from the **Generate** menu.

Paraphrasing rules are done with the same [transfer
rules](https://delph-in.github.io/docs/tools/TransferRules) used in MT and generation. An example is given
below. This will paraphrase "*We gave a demo of the system*" -&gt; "*We
demoed the system*".

    give+demo_mtr := light_verb_mtr &
    [ INPUT.RELS <! [ PRED "_give_v_1_rel" ],
                    [ PRED "_demo_n_rel", ARG1 #arg1 ],
                    [ PRED _of_p_sel_rel ], 
                    [ PRED _a_q_rel ] !>,
      OUTPUT.RELS <! [ PRED "_demo_v_rel", ARG2 #arg1 ] !> ].

You also need to add the type definitions for the rules, in a file
called mtr.tdl and load it in the script file. **Note**: copying this
from the ERG is a good start, although your definition of \*list\* may
be different (e.g., list).

You may also have to set up the translation grid parameter. For Jacy it
is:

    (setf *translate-grid* '(:ja . (:ja)))

This says that the grammar can act as a generator server for Japanese
ourselves and will send off generation requests (from selection
\`Rephrase' on the parse summary view or \`Generate' on the LOGON MRS
browser) to a Japanese server, i.e. ourselves. likewise,

### Paraphrasing using Underspecification

- Underspecified lexical types (or rules) effectively lead to
paraphrasing
  - parsing *Which dog barked* and then generating gives
    
    - *Which dog barked?*
    - *What dog barked?*
    - *Which dog did bark?*
    - *What dog did bark?*

## General Discussion

From the meeting in Cambridge 2008-05-24

Dan showed off the paraphraser in the ERG.

- the rules can rewrite features.
- and whole clauses
- they can be made bidirectional if there is no CONTEXT or FILTER
- nice use of relational nouns in the light verb rule
  - "we gave a demo of the system" -&gt; "we demoed the system"

Two current approaches

- underspecification: in/on/at\_rel
- explicit mapping via rules

Uses of paraphrasing

- we can map representations to a canonical form
  - e.g. reducing variation before we do a task such as MT
    - (the hourglass model)
  - not always possible
- query expansion
- relaxed input to the generator
  - e.g. allow "possible\_rel" which maps to "can\_rel" and
"be\_able\_to\_rel". Non-English users shouldn't have to care.

Who is working on Paraphrase/rule extraction?

- Mischa, Wang, Eric, Stephan (dictionary) all MT
- It would be nice to share tools
  - Laurie: big dictionary building project at University of
Washington
    - <http://www.cs.washington.edu/research/panlingual/>
  - FCB: we could use wordnet

What are some phenomena we can handle now? (can we map them to situation
types: LH?)

- light verbs,
- compounds,
- serial verbs,
- classifiers,
- alternations
- relational nouns/prepositions,
- modal verbs and tense/aspect,
- "swim across the river"/"cross the river by swimming"
- by/gerund,
- verbal/nominal, "opening the door he found the revolver/he opened
the door and
  - found the revolver",
- done by underspecification --- adjective/adverb

Meta-discussion

- currently we don't have perfect world models so we normally
overgenerate and rank
  - want to be able to make things that work now && support deeper
processing when people can do it (AAC)
  - the statistical models on overgeneration leads to models useful
for analysis
- good to map paraphrase classes to situation types not just syntactic
types
- sometimes we need anaphora resolution
  - "Tom ate because he was hungry" -&gt; "Tom's hunger made him
eat"
  
  <!-- -->

  
  - no-one is working on this within the lkb
  - we can do some of this with paraphrase rules

Last update: 2011-12-13 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/RmrsParaphrasing/_edit)]{% endraw %}