{% raw %}## Gender and Animacy

PNG.GENDER and PNG.ANIMACY are neceesary especially for blocking
overgeneration. For example, 他-he;她-she;它-it.

## Semantically Empty Items

In order to create semantically void items in generation without
overgeneration, trigger.mtr should contains generator rules like the
followings.

    了_pfv_gr := arg0e_gtr &
    [ CONTEXT.RELS <! [ ARG0.E.ASPECT perfective ] !>,
      FLAGS.TRIGGER "了_pfv" ]. 
    
    吗_qp_gr := arg0e_gtr &
    [ CONTEXT.RELS <! [ ARG0.SF ques ] !>,
      FLAGS.TRIGGER "吗_qp" ]. 
    
    在_r_gr := arg0e_gtr &
    [ CONTEXT.RELS <! [ ARG0.E.ASPECT imperfective ] !>,
      FLAGS.TRIGGER "在_r" ].
    
    被_v_gr_1 := arg0e_gtr &
    [ CONTEXT.RELS <! [ ARG1 individual & #i ] !>,
      FLAGS [ SUBSUME < #i >,
              TRIGGER "被_v" ] ].

Note that unwanted parse trees in parsing also cause problems in
generation. For example, "\*狗 在 在 在 ... 叫" is ill-formed, and it
should not be generated as well as parsed.

## generation.ignore

There can be some items (including lexical entries and some
lexical/phrasal rules) that should be ignored in generation process.
Discarding such items in generation contributes to the speed of
generation as well as the felicity of generated sentences. When LKB is
used, the ignored items are specified in lkb/globals.lsp

    ;;; Blocking Generation (lexicons)
    (setf *duplicate-lex-ids*
      '(
        了_pfv_robust 着_dur_robust 过_exp_robust
        ))

When ACE is used, the items are listed up in generation.ignore (under
the root of Zhong). Note that generation.ignore should be evoked by the
ACE configuration file.

    generation-ignore-signs   := "generation.ignore".

## STYLE feature

This flag feature exists outside of SYMSEM and plays a role to generate
only proper sentences following the theorum **parsing robustly,
generating striclty**. This means that even a little bit awkward
sentence should be parsed, but the sentence should also be filtered out
in generation. For example, although "张三 去 着" may not sound good to
Chinese native speakers, our grammar provides a parse tree for the
sentence with a flag \[STYLE robust\]. Nonetheless, our grammar does not
generate such a sentence, and the STYLE feature keeps the sentence from
being generated.

    sign :+
     [ STYLE style,
       IDIOM bool ].
    style := avm &
     [ WRITTEN luk ].
    strict := style &
     [ WRITTEN + ].
    robust := style.
    spoken := robust & 
     [ WRITTEN - ].
    unproductive := robust.
    dialect := robust.

In order to realize **parsing robustly, generating striclty**, there are
two types of roots: roots.tdl and roots-strict.tdl. The former, an
ordinary one, works in parsing, and the latter with \[STYLE strict\] in
generation. Thus, when we compile a grammar for parsing, we can create
an ACE data file (e.g. hans.dat) with roots.tdl. On the other hand, we
can use roots-strict.tdl for creating the other ACE data file for
generation separately (e.g. hans-strict.dat).

## LE ZHE GUO

There are three basic aspect markers in Mandarin Chinese; namely 了
(le), 着 (zhe), and 过 (guo). Not all these three items can be
necessarily attached to all verbs. That is, a verb can choose these
markers, and the choice seems to be registered into the lexical
information of each verb. For example, "张三 去 着" does not sound
perfect, because 去 does not co-occur well with 着. If we do not impose
any constraint on this choice, there would be a number of overgenerated
sentences. For this purpose, there is a head feature for verb:
LE-ZHE-GUO.

    lzg := avm. 
    le := lzg.
    zhe := lzg.
    guo := lzg.
    no-lzg := lzg.
    le+zhe := le & zhe.
    le+guo := le & guo.
    zhe+guo := zhe & guo.
    le+zhe+guo := le & zhe & guo.
    
    verb :+ 
     [ LZG lzg ].

Each marker is divided into two subtypes; one for an ordinary
attachment, and the other for a robust parsing. For instance,
着\_dur\_robust in the following can be attached to 去 whose LE-ZHE-GUO
feature value is le+guo (i.e. 了 +, 着 -, 过 +).

    着_dur := adv-dur-v-post &
      [ STEM <"着">,
        SYNSEM.LOCAL.CAT.HEAD.MOD < [ LOCAL.CAT.HEAD.LZG zhe ] > ].
    
    着_dur_robust := adv-dur-v-post &
      [ STEM <"着">,
        STYLE robust,
        SYNSEM.LOCAL.CAT.HEAD.MOD < [ LOCAL.CAT.HEAD.LZG le+guo ] > ].

Note that 着\_dur\_robust has \[STYLE robust\]. When we parse and
generate sentence in a strict way, this item will be sorted out. In
addition, this item will be filtered out in generation because of the
following rule in trigger.mtr.

    着_dur_robust_gr := arg0e_gtr &
    [ CONTEXT.RELS <! [ PRED "non_existing_rel" ] !>,
      FLAGS.TRIGGER "着_dur_robust" ]. 

Additionally, 着\_dur\_robust is included in the list specified in
generation.ignore and globals.lsp.

## Punctuations

The current grammar regards only sentences with punctuations as regular
(strict) ones. When we use a strict version, all sentences show up with
punctuation markers depending on the sentence force (SF).

    period-marker := punctuation &
      [ STEM < "。" >,
        SYNSEM.LOCAL.CONT.HOOK.INDEX.SF prop ].

That implies punctuation markers in Chinese should not be ignored by
repp.

## Questions

1\. Can a plain sentence be used for expressing questions? (e.g. 张三 叫
了 =&gt; 张三 叫 了 吗)

This is contrained by STYLE and punctuation markers explained before.

2\. Can a sentence without 了 be generated into a sentence with 了?
(e.g. 张三 叫 =&gt; 张三 叫 了) Likewise, can a sentence with 了 be
generated into a sentence without 了? (e.g. 张三 叫 了 =&gt; 张三 叫)

No! A plain sentence 张三 叫 does not have to be paraphrased into a
perfective one 张三 叫 了, and vice versa. In order to handle this
constraint, a lexical rule was added in lrules.tdl. Now main-verb-lex
and some related verbal items inherently have \[MC na\], and this
feature makes the verb by itself cannot constitute a sentence (or
clause).

    non-aspect-lex := aspect-lex-rule &
     [ SYNSEM.LOCAL [ CAT.MC +,
                      CONT.HOOK.INDEX.E.ASPECT non-aspect ] ].

Last update: 2014-09-11 by SanghounSong [[edit](https://github.com/delph-in/docs/wiki/ZhongGeneration/_edit)]{% endraw %}