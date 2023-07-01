{% raw %}This page describes how to take a grammar without chart mapping, and set
up the basic infrastructure for chart mapping.

It is being written based on my (FrancisBond's) own
experiences with setting up Jacy, and should not in any way be
considered a reliable introduction, although I will do my best:
PeterAdolphs and StephanOepen hold the
hidden truth.

## What do you need

- types for token manipulation tmt.tdl
- token-mapping-rules tmr/\*
- generic-lexical-entries gle.tdl

These are all read in your grammar definition language.tdl:

    :begin :type.
       :include "matrix.tdl".
       :include "fundamentals.tdl".
       :include "rule-types.tdl".
       :include "principles.tdl".
       :include "letypes.tdl".
       :include "tmt.tdl".
    :end :type.
    
    :begin :instance :status token-mapping-rule.
       :include "tmr/prelude".
       :include "tmr/pos".
       :include "tmr/pos-ipa".
       :include "tmr/finis".
    :end :instance.
    
    :begin :instance :status generic-lex-entry.
       :include "gle.tdl".
    :end :instance.

These do the bulk of the setup (you can get them from Jacy and if your
grammar is reasonbably Matrix compliant they may just work.

You also need to explictly set the \#FROM, \#TO labels for rules that
add their own content, helpfully identified by having non-empty C-CONT.
For Jacy, we never have more than two things, so the rules were all made
to inherit from one or the other of c-cont-1 and c-cont-2, which
effectively say the introduced predicate is treated as though it spans
the entire construction.

    c-cont-1 := phrase-or-lexrule &
     [ STEM [FROM #from,
             TO #to ],
       C-CONT.RELS <! [ CFROM #from, 
                        CTO #to ] !>].
    
    c-cont-2 := phrase-or-lexrule &
     [ STEM [FROM #from,
             TO #to ],
       C-CONT.RELS <! [ CFROM #from, 
                        CTO #to ],
                    [ CFROM #from, 
                      CTO #to ] !>].

You also need to add the following to the matrix.tdl:

    ;;; make STEM of type orthog(raphy) to pass up from/to/form
    sign-min := avm &
      [ STEM orthog ].
    
    orthog := cons &
      [ FROM string,
        TO string ].

Last update: 2012-08-13 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/ChartMappingSetup/_edit)]{% endraw %}