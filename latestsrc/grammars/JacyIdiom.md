{% raw %}Contents

1. [Overview of LKB's idiom detection
mechanism](https://delph-in.github.io/docs/grammars/JacyIdiom#Overview_of_LKB.27s_idiom_detection_mechanism)
2. [Example](https://delph-in.github.io/docs/grammars/JacyIdiom#Example)
3. [Implementation](https://delph-in.github.io/docs/grammars/JacyIdiom#Implementation)
   1. [idioms.mtr and mtr.tdl](https://delph-in.github.io/docs/grammars/JacyIdiom#idioms.mtr_and_mtr.tdl)
   2. [The Lexicon](https://delph-in.github.io/docs/grammars/JacyIdiom#The_Lexicon)
   3. [Configuration of Relevant
Rules](https://delph-in.github.io/docs/grammars/JacyIdiom#Configuration_of_Relevant_Rules)
      1. [matrix.tdl](https://delph-in.github.io/docs/grammars/JacyIdiom#matrix.tdl)
      2. [fundamentals.tdl](https://delph-in.github.io/docs/grammars/JacyIdiom#fundamentals.tdl)
      3. [rule-types.tdl](https://delph-in.github.io/docs/grammars/JacyIdiom#rule-types.tdl)
   4. [roots.tdl, script, user-fns.lsp, and
globals.lsp](https://delph-in.github.io/docs/grammars/JacyIdiom#roots.tdl.2C_script.2C_user-fns.lsp.2C_and_globals.lsp)
      1. [roots.tdl](https://delph-in.github.io/docs/grammars/JacyIdiom#roots.tdl)
      2. [script](https://delph-in.github.io/docs/grammars/JacyIdiom#script)
      3. [user-fns.lsp](https://delph-in.github.io/docs/grammars/JacyIdiom#user-fns.lsp)
      4. [globals.lsp](https://delph-in.github.io/docs/grammars/JacyIdiom#globals.lsp)

This page describes how to implement idioms in a DELPH-IN Grammar,
taking [Jacy](https://delph-in.github.io/docs/grammars/JacyTop) as an example. The basic idea is that
[LKB](https://delph-in.github.io/docs/tools/LkbTop) checks if all the constituents (or PREDs) of an idiom
appear in an (MRS output of) sentence.

# Overview of LKB's idiom detection mechanism

LKB has an idiom detection mechanism that is realized by making use of
its Machine Translation mechanism.

The idiom detection mechanism is invoked after parsing a sentence. Then

1. It examines whether the sentence is specified as \[IDIOM +\]. Unless
\[IDIOM +\], no further processing is invoked.
2. If \[IDIOM +\], the mechanism consults with idioms.mtr (and
mtr.tdl), which is a list of idioms, to see if the sentence contains
all the constituents of an idiom. If so, the sentence is accepted
and certified as containing an idiom. On the contrary, if the
sentence does not have all the constituents of an idiom even though
it is \[IDIOM +\], it is rejected.

# Example

Imagine that you want to implement a Japanese idiom, *yaku-ni tatsu*
(part-DAT stand) "useful".

All the constituents of the idiom can be used independently and
represent a literal meaning, but this particular combination only
represents an idiomatic meaning.

Below are examples of how to use the literal meaning *tatsu* (a) and the
idiomatic meaning *tatsu* (b).

1. 1. *Ken-ga butai-ni tatsu.* (Ken-NOM stage-DAT stand) "Ken appears
on stage."
1. 2. *Ken-ga yaku-ni tatsu.* (Ken-NOM part-DAT stand) "Ken is
useful."

Then, imagine that you want to have both the literal meaning *tatsu*
(tatsu\_lit, hereafter) and the idiomatic meaning *tatsu* (tatsu\_idiom)
in your grammar. And you also want tatsu\_idiom to appear only when all
the other constituents of the idiom, *yaku-ni tatsu* (part-DAT stand)
"useful", appear in a sentence.

# Implementation

You need following configuration.

- List all idioms in idioms.mtr (and mtr.tdl).
- For each idiom, add one of its constituents in the lexicon file. In
the case of *yaku-ni tatsu*, *tatsu* is newly entered into the
lexicon as tatsu\_idiom. So there are tatsu\_lit and tatsu\_idiom in
the lexicon. Note that the newly entered lexical item for an idiom
introduces \[IDIOM  +\] into the feature structure of sentence.
- Configure relevant rules in your grammar so that the \[IDIOM +\]
goes up into the syntactic structure. This configuration would be
grammar-dependent.
- Configure roots.tdl, script, user-fns.lsp, and globals.lsp to invoke
the idiom dtection mechanism.

## idioms.mtr and mtr.tdl

Here is an example of how to list idioms in idioms.mtr (and mtr.tdl).

Below is the case of *yaku-ni tatsu*. Note that *yaku-ni* is the ARG2 of
*tatsu*.

idioms.mtr

    yaku+ni+tatsu := np_v_idiom_mtr &
      [ INPUT.RELS <! [ PRED "_tatsu_v_i_rel" ],
                      [ PRED "_yaku_n_rel" ] !> ].

mtr.tdl

    np_v_idiom_mtr := monotonic_mtr &
      [ INPUT.RELS <! [ LBL handle,
                        ARG0 event,
                        ARG1 ref-ind,
                        ARG2 ref-ind & #arg2 ],
                    [ LBL handle,
                      ARG0 #arg2 ] !>,
        OUTPUT.RELS <! !> ].

## The Lexicon

Here is the lexical entry for tatsu\_idiom.

    tatsu_idiom := v2-c-stem-lex &
     [SYNSEM.LKEYS [KEYREL [PRED '_tatsu_v_i_rel]],
      ORTH <! "立つ" !>,
      IDIOM +].

Note that v2-c-stem-lex is the lexical type for a transitive verb that
takes a dative argument, and that this introduces \[IDIOM +\].

## Configuration of Relevant Rules

Below are configurations of the grammar so that it lifts \[IDIOM +\] up
into the syntax. Most of them would be Jacy-dependent.

### matrix.tdl

    sign := basic-sign &
      [ SYNSEM synsem,
        ARGS list,
        INFLECTED bool,
        ROOT bool,
        IDIOM bool].

Note that the IDIOM feature is introduced.

    lex-rule := phrase-or-lexrule & word-or-lexrule &
      [ IDIOM #idiom,
        NEEDS-AFFIX bool,
        SYNSEM.LOCAL.CONT.RELS [ LIST #first,
                                 LAST #last ],
        DTR #dtr & word-or-lexrule &
            [ SYNSEM.LOCAL.CONT.RELS [ LIST #first,
                                       LAST #middle ],
              ALTS #alts,
              IDIOM #idiom],
        C-CONT.RELS [ LIST #middle,
                      LAST #last ],
        ALTS #alts,
        ARGS < #dtr > ].

Note \[IDIOM \#idiom\].

    basic-unary-phrase := phrase &
      [ STEM #stem,
        IDIOM #idiom,
        SYNSEM.LOCAL.CONT [ RELS [ LIST #first,
                                   LAST #last ],
                            HCONS [ LIST #scfirst,
                                    LAST #sclast ] ],
        C-CONT [ RELS [ LIST #middle,
                        LAST #last ],
                 HCONS [ LIST #scmiddle,
                         LAST #sclast ] ],
        ARGS < sign & [ STEM #stem,
                        SYNSEM.LOCAL local &
                                     [ CONT [ RELS [ LIST #first,
                                                     LAST #middle ],
                                              HCONS [ LIST #scfirst,
                                                      LAST #scmiddle ] ] ],
                        ROOT -,
                        IDIOM #idiom] > ].

Note \[IDIOM \#idiom\].

    basic-binary-phrase := phrase &
      [ IDIOM #idiom,
        SYNSEM.LOCAL.CONT [ RELS [ LIST #first,
                                   LAST #last ],
                            HCONS [ LIST #scfirst,
                                    LAST #sclast ] ],
        C-CONT [ RELS [ LIST #middle2,
                        LAST #last ],
                 HCONS [ LIST #scmiddle2,
                         LAST #sclast ] ],
        ARGS < sign & [ IDIOM #idiom,
                        SYNSEM.LOCAL local &
                                     [ CONT [ RELS [ LIST #first,
                                                     LAST #middle1 ],
                                              HCONS [ LIST #scfirst,
                                                      LAST #scmiddle1 ] ] ],
                        ROOT - ],
               sign & [ IDIOM #idiom,
                        SYNSEM.LOCAL local &
                                     [ CONT [ RELS [ LIST #middle1,
                                                     LAST #middle2 ],
                                              HCONS [ LIST #scmiddle1,
                                                      LAST #scmiddle2 ] ] ],
                        ROOT - ] > ].

Note \[IDIOM \#idiom\].

### fundamentals.tdl

    lexical_sign-rule := lexical_sign & phrase-or-lexrule &
     [IDIOM #idiom,
      ARGS <[IDIOM #idiom]>].

### rule-types.tdl

    unary-type-super :=   phrasal_sign &
                   [IDIOM #idiom,
                    SYNSEM [LOCAL [CTXT [C-INDICES [ADDRESSEE #add,
                                                    SPEAKER #sp],
                                         EMPATHY [EMPER #sp,
                                                  EMPEE #emp]],
                                   CONT [HOOK #hook,
                                         RELS [LIST #list,
                                                LAST #last],
                                         HCONS [LIST #sclist,
                                                 LAST #sclast]]],
                            NON-LOCAL #nonloc],
                    ORTH #stem,
                   C-CONT mrs & [HOOK #hook,
                                  RELS diff-list & [LIST #list,
                                                       LAST #middle],
                                  HCONS diff-list & [LIST #sclist,
                                                        LAST #scmiddle]],
                    ARGS <  [IDIOM #idiom,
                             SYNSEM [LOCAL [CTXT [C-INDICES [ADDRESSEE #add,
                                                                       SPEAKER #sp],
                                                               EMPATHY [EMPER #sp,
                                                                        EMPEE #emp]],
                                                         CONT [RELS [LIST #middle,
                                                                      LAST #last],
                                                               HCONS [LIST #scmiddle,
                                                                       LAST #sclast]]],
                                                  NON-LOCAL #nonloc],
                                          ORTH #stem] >].

Note \[IDIOM \#idiom\].

    word2word-rule := j-sign & phrase-or-lexrule &
                [IDIOM #idiom,
                 SYNSEM [LOCAL [CAT [HEAD #head],
                                BAR #bar,
                                CONT [HOOK #hook,
                                      RELS diff-list & [LIST #list,
                                                        LAST #last],
                                      HCONS [LIST #hclist,
                                              LAST #hclast]],
                                CTXT #ctxt],
                         NON-LOCAL #nonloc,
                         MODIFIED.PERIPH #per],
                 ORTH #stem,
                 INFLECTED +,
                 J-NEEDS-AFFIX #aff,
                 LMORPH-BIND-TYPE #lmorph,
                 RMORPH-BIND-TYPE #rmorph,
                 C-CONT [RELS [LIST #middle,
                                LAST #last],
                         HCONS [LIST #hcmiddle,
                                  LAST #hclast]],
                 ARGS <[IDIOM #idiom,
                        SYNSEM [LOCAL [CAT [HEAD #head],
                                       BAR #bar,
                                       CONT [HOOK #hook,
                                             RELS [LIST #list,
                                                    LAST #middle],
                                             HCONS [LIST #hclist,
                                                     LAST #hcmiddle]],
                                       CTXT #ctxt],
                                MODIFIED.PERIPH #per,
                                NON-LOCAL #nonloc],
                        INFLECTED +,
                        ORTH #stem,
                        J-NEEDS-AFFIX #aff,
                        LMORPH-BIND-TYPE #lmorph,
                        RMORPH-BIND-TYPE #rmorph]>].

Note \[IDIOM \#idiom\].

## roots.tdl, script, user-fns.lsp, and globals.lsp

Just copy and paste the following descriptions.

### roots.tdl

    ; Used to determine on which candidate root edges to not apply the idiom checks
    ; (for efficiency)
    root_non_idiom := sign &
      [ IDIOM - ].

### script

    (read-tdl-type-files-aux
         (list (lkb-pathname (parent-directory) "mtr.tdl") 
    ))
    
    (mt:read-transfer-rules 
     (list
      (lkb-pathname (parent-directory) "idioms.mtr"))
     "Idiom Tests"
     :filter nil :task :idiom)

### user-fns.lsp

    (defun idiom-complete-p (tdfs)
      (let* ((mrs (and (tdfs-p tdfs)
                       (mrs::extract-mrs-from-fs (tdfs-indef tdfs))))
             (transfers (and (mrs::psoa-p mrs)
                             (mt:transfer-mrs mrs :task :idiom))))
        (loop
            for transfer in transfers
            for mrs = (mt::edge-mrs transfer)
            thereis (loop
                        for ep in (mrs:psoa-liszt mrs)
                        when (idiom-rel-p ep) return nil
                        finally (return t)))))
    
    (eval-when #+:ansi-eval-when (:load-toplevel :execute)
               #-:ansi-eval-when (load eval)
      (setf *additional-root-condition* #'idiom-complete-p))

### globals.lsp

Finally, the presence of the following is what actually turns on idiom
processing in the LKB. When \*non-idiom-root\* is configured, *all*
completed parses (spanning parses which match a root condition) are
checked for idioms, *except* for those which are compatible with the
instance specified.

    (defparameter *non-idiom-root*
        'root_non_idiom )

Last update: 2011-12-06 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/JacyIdiom/_edit)]{% endraw %}