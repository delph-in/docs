{% raw %}Mentor: EmilyBender (ebender at u dot washington dot edu,
<http://faculty.washington.edu/ebender>)

Co-mentors: [DorotheeBeermann](/DorotheeBeermann)
<mailto:dorothee.beermann@hf.ntnu.no>

# Open Issue: Serial Verb Constructions

## Problem Statement

Serial verb constructions (roughly, constructions where a clause
contains two or more 'main' verbs, which typically share some or all of
their arguments) are common in the world's languages, but not that
prominent in the initial set of DELPH-IN languages. I would love to see
an extension to the Grammar Matrix which allowed users to add serial
verb constructions through the customization system. This would require
first determining the target semantic representation, then working from
the typological literature to map out the range of kinds of serial verb
constructions, developing analyses for each kind, and relating them to
the customization questionnaire.

## Short Description of Serial Verb Constructions

A serial verb construction consists of at least two main verbs or verb
phrases, strung together without any connective markers. The verbs in an
SVC form together a single clause. Serial Verb Constructions fall within
two main categories: **clause chaining** and **integrated SVCs**. Under
**clause chaining**, the number of VPs have no upward bound and each
verb has its full independent meaning. The linear sequence of verbs
reflects strict temporal order and each VP expresses a complete event
distinct form its successor. Syntactically each verb has its full
inflectional possibility and the same argument frame as when acting as a
single main verb. Informally speaking, the verbs in a CC-SVC share their
subject while object sharing is optional. Object and adjunct sharing
patterns vary greatly. Likewise, the marking of tense and/or aspect on
verbs varies between languages. Below you find an example of a CC-SCV

- \(1\) AKAN (Kwa language spoken in the Volta-Basin area)
  - Ama tu-u bayere twitw-a no-a di-i Ama uproot-COMPL yam.OBJ
cut-COMPL cook-COMPL eat-COMPL N V N V V V
    
    *Ama uprooted (tuber of) yam, cut it in pieces, boiled them
(and) ate them.*

In Integrated SVCs only two verbs take part to express a clearly
identifiable situational profile, in, what one might call, a
constructional lexeme. More than one situational profile can be
recognized, and the syntactic-semantic composition varies in accordance
with the profile, leading to subtypes of ISVCs. It is the intuition of
many linguists, working on I-SVCs, that the patterns of composition are
restricted, as the semantics of the two verbs in an SVC need to
synchronize to derive a compositional meaning. Opposed to CC-SVCs, the
first verb in an I-SVC does not always display its full morpho-syntactic
potential and its semantics can only be understood in composition with
V2.

EXAMPLES from Akan:

\(2\)

- ?-de nkrante twa duabasa 3P.SG.MASC-take sword cut branch V N V N
  
  *He cut off a branch with a sword*

\(3\)

-  -de no fεm-m me 3P.SG.MASC-take 3P.SG.ANIM lend-COMPL 1P.SG. V PRO
V PRO

<!-- -->


- *he lent me it (e.g., the horse)* (Stewart 1963)

(Glossing adapted to a two-line glossing convention)

CC-SVCs and I-SVCs are attested in a variety of language families, for
instance West African Languages of the Volta-Basin area, and most of the
South and South-East Asian languages.

## Existing Literature

Melanie Owens's forthcoming
[dissertation](http://www-linguistics.stanford.edu/semgroup/mowens.html)
is a typological study of the semantics of SVCs.

Chikara Hashimoto's dissertation is an in-depth look at SVCs in
Japanese, and includes the description of a computational implementation
in [Jacy](https://delph-in.github.io/docs/grammars/JacyTop).

- *A Computational Treatment of V-V Compounds in Japanese.* Chikara
Hashimoto. [Kobe Shoin Graduate
School](http://sils.shoin.ac.jp/grad) Ph.D thesis, 2004
([pdf](http://www-lab25.kuee.kyoto-u.ac.jp/member/hasimoto/mypapers/thesis.pdf)
[ps](http://www-lab25.kuee.kyoto-u.ac.jp/member/hasimoto/mypapers/thesis.ps)).
- *A Computational Treatment of V-V Compounds in Japanese.* Chikara
Hashimoto and Francis Bond. In Proceedings of the 12th International
Conference on HPSG, pp.143-156. 2005 8.
<http://hpsg2005.di.fc.ul.pt/>

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/OpenissuesTop_GrammarMatrixSerialVerbConstructions/_edit)]{% endraw %}