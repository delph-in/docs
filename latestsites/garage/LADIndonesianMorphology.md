{% raw %}# Argument Change and Reduplication in Indonesian: Some issues

DavidMoeljadi (FrancisBond and
LuisMorgadoCosta)

Indonesian is a Western Malayo-Polynesian language of the Austronesian
language family, spoken mainly in the Republic of Indonesia. Indonesian
is a mildly agglutinative language with a rich affixation system,
including a variety of prefixes, suffixes, circumfixes, and
reduplication. Most of the affixes are derivational. Two important
inflectional affixes are the prefix *meN-* which marks active voice and
*di-* which denotes passive voice (Sneddon et al. 2010: 29, 72). There
is no agreement in Indonesian. In general, grammatical relations are
only distinguished in terms of word order. Indonesian has a SVO basic
word order. Argument alternations are triggered by passive and
applicative constructions.

The purpose of this session is to show what we are currently doing with
**reduplication** in Indonesian and to discuss the connection and
complexity with voice and valence changing/applicatives.

The following topics will be presented:

1. [Intransitive and transitive verbs](https://delph-in.github.io/docs/garage/LADIndonesianMorphology#verbs)
2. [Voice](https://delph-in.github.io/docs/garage/LADIndonesianMorphology#voice)
3. [Applicative constructions](https://delph-in.github.io/docs/garage/LADIndonesianMorphology#applicative-constructions)
4. [Reduplication](https://delph-in.github.io/docs/garage/LADIndonesianMorphology#reduplication)

## Verbs

### Intransitive verbs

According to Sneddon et al. (2010: 71), verb bases can occur with
*ber-*, *meN-*\*, or without affixation unpredictably. There is no
explanation for the following forms other than usage:

- (without affixation) *mandi* "bathe"
- (with *ber-*) *baring* &gt; *ber-*+ &gt; *berbaring* "lie down"
- (with *meN-*) *inap* &gt; *meN-*+ &gt; *menginap* "stay, spend the
night"

\* When *meN-* combines with bases, a number of nasalization (sound
changes) or morphology process occur. [Moeljadi, Bond and Song
(2015)](http://aclweb.org/anthology/W/W15/W15-3302.pdf) discuss the
implementation of this morphology process in INDRA. See also [Transitive
verbs in INDRA](https://delph-in.github.io/docs/garage/LADIndonesianMorphology#transitive-verbs).

If the base is other than verb, either *ber-* or *meN-* must occur to
derive verb. Here also there is sometimes no predictability about which
affix will occur. For example,

- (with *ber-*) *teriak* "yell, shout" (noun) &gt; *ber-*+ &gt;
*berteriak* "yell, shout" (verb)
- (with *meN-*) *pekik* "scream" (noun) &gt; *meN-*+ &gt; *memekik*
"scream" (verb)

In this session, due to time constraints, *ber-* will not be discussed.

#### Intransitive verbs with ''meN-''

According to Sneddon et al. (2010: 69-70), Some intransitive verbs with
*meN-* have verbal bases. *meN-* is required to produce a well-formed
verb. For example,

- *ungsi* &gt; *meN-*+ &gt; *mengungsi* "flee"
- *ledak* &gt; *meN-*+ &gt; *meledak* "explode"
- *nyanyi* &gt; *meN-*+ &gt; *menyanyi* "sing"
- *inap* &gt; *meN-*+ &gt; *menginap* "spend the night"
- *luncur* &gt; *meN-*+ &gt; *meluncur* "slide"

Many intransitive verbs with *meN-* have noun bases. A number of
different meanings can be identified.

- Some verbs mean "go to \[location-base\]". For example,
  
  *darat* "land" &gt; *meN-*+ &gt; *mendarat* "(go to) land"
- Some verbs mean "become like, resemble \[base\]". For example,
  
  *gunung* "mount" &gt; *meN-*+ &gt; *menggunung* "pile up, mount up"
(lit. "become like a mount")
- Some verbs mean "produce \[sound-base\]". For example,
  
  *ngeong* "meow" (noun) &gt; *meN-*+ &gt; *mengeong* "meow" (verb)

<!-- -->


    1. a. Kucingnya akan mengeong.
          cat=DEF FUT meow
          "The cat will meow."
    
       b. Kucingnya akan mengeong.
          cat=3SG FUT meow
          "His/her cat will meow."
    
       c. Mengeong!
          meow
          "Meow!"

With adjective bases, the meaning is "become \[base\], take on the
characteristic of \[base\]". The number of such forms is limited and
unpredictable, although there is some degree of productivity. For
example,

- *hebat* "intense" &gt; *meN-*+ &gt; *menghebat* "intensify" (lit.
"become intense")
- *hangat* "warm" &gt; *meN-*+ &gt; *menghangat* "warm up" (lit.
"become warm")
- *merah* "red" &gt; *meN-*+ &gt; *memerah* "redden" (lit. "become
red")

#### Intransitive verbs in INDRA

Because *meN-* is required to produce a well-formed verb in the
declarative and imperative constructions, the verbs are listed together
with *meN-* in the lexicon. For example, for the verb *mengeong* "meow",

    mengeong := intr-verb-lex &
      [ STEM < "mengeong" >,
        SYNSEM.LKEYS.KEYREL.PRED "_mengeong_v_rel" ].

We do not specify the meanings in detail, e.g. "go to \[base\]",
"resemble \[base\]", "produce \[sound-base\]", and "become
\[adjective-base\]".

Try to parse and generate the following sentence in demophin!

- [Kucingnya akan
mengeong.](http://compling.hss.ntu.edu.sg/demophin/indra/parse?sentence=Kucingnya%20akan%20mengeong.)

### Transitive verbs

Transitive verbs can occur with *meN-*, *di-*, or without a prefix.
*meN-* marks active voice and *di-* marks passive voice. Prefixes are
omitted in imperative constructions and in passive constructions with a
pronoun agent. Voice is discussed in the next section.

#### Transitive verbs with ''meN-''

Most transitive verbs have verb bases. For example,

- *buka* "open" &gt; *meN-*+ &gt; *membuka* "open"
- *curi* "steal" &gt; *meN-*+ &gt; *mencuri* "steal"
- *kejar* "chase" &gt; *meN-*+ &gt; *mengejar* "chase"

<!-- -->


    2. Adi sedang mengejar Budi.
       Adi PROG ACT-chase Budi
       "Adi is chasing Budi."

Some transitive verbs have noun bases and mean "use \[base\] on the
object, apply \[base\] to the object". For example,

- *gunting* "scissors" &gt; *meN-*+ &gt; *menggunting* "cut with
scissors"
- *cat* "paint" (noun) &gt; *meN-*+ &gt; *mengecat* "paint" (verb)
- *gergaji* "saw" (noun) &gt; *meN-*+ &gt; *menggergaji* "saw" (verb)

#### Transitive verbs in INDRA

Because the verbs appear without affixes in imperative constructions and
in passive constructions with a pronoun agent (see
[Voice](https://delph-in.github.io/docs/garage/LADIndonesianMorphology#voice)), only the bases are listed in
the lexicon. For example, for the verb base *kejar* "chase",

    kejar := tr-verb-lex &
      [ STEM < "kejar" >,
        SYNSEM.LKEYS.KEYREL.PRED "_kejar_v_rel" ].

We apply lexical rules for transitive verbs.

    voice-lex-rule-super := add-only-no-ccont-rule & infl-lex-rule &
      [ INFLECTED.VOICE-FLAG +,
        DTR tr-verb-lex ].
    
    act-lex-rule := voice-lex-rule-super.

Regarding the sound changes or morphological process of *meN-*, in
irules.tdl, the rules are listed as follows:

    act-prefix :=
    %prefix (p mem) (b memb) (m mem) (f memf) (v memv) (w mew) (t men) (d mend) (n men) (r mer) (s meny) (z menz) (l mel) (c menc) (j menj) (ny meny) (y mey) (k meng) (kh mengkh) (g mengg) (ng meng) (q mengq) (h mengh) (a menga) (i mengi) (u mengu) (e menge) (o mengo)
    act-lex-rule &
      [ SYNSEM.LOCAL.CAT.VAL.COMPS.FIRST.OPT - ].

The rules for the irregular sound changes (e.g. with one-syllable base)
are listed in irregs.tab, for example:

    mengecek act-prefix cek
    mengebel act-prefix bel
    mengebom act-prefix bom

Try to parse and generate the following sentence in demophin!

- [Adi sedang mengejar
Budi.](http://compling.hss.ntu.edu.sg/demophin/indra/parse?sentence=Adi%20sedang%20mengejar%20Budi.)

## Voice

Consider this example:

    3. a. Adi mengejar Budi.
          Adi ACT-chase Budi
          "Adi chases Budi."
    
       b. Budi dikejar ((oleh) Adi).
          Budi PASS-chase ((by) Adi)
          "Budi is chased (by Adi)."
    
       c. Budi saya kejar.
          Budi 1SG chase
          "Budi is chased by me."
    
       d. Kejar Budi!
          chase Budi
          "Chase Budi!"

(Moeljadi, Bond and Song 2015)

In the above example (a), the verb *mengejar* is formed from *meN-* and
the base *kejar* and takes two arguments. *MeN-* is changed to *di-* in
passive type one (Sneddon et al. 2010: 256-257) and takes one argument
with optional agent as in (b) and without prefixes in passive type two
(Sneddon et al. 2010: 257-258) and takes two arguments with the agent
preceding the verb as in (c). Sneddon et al. (2010: 256-257) states that
in passive type one, the actor is third person or a noun, while in
passive two, the agent is a pronoun or pronoun substitute and it comes
before the unprefixed verb.

In INDRA, passive constructions have not been implemented yet.

## Applicative constructions

In Indonesian, a verb can have voice morphology as well as applicative
morphology *-i* or *-kan*, which changes the valence. In this session,
due to time constraints, only *-i* is presented.

In INDRA, applicative constructions have not been implemented yet.

Arka et al. (2009) states that *-i* shows applicative and causative
polysemy. At least four types are identified.

- **Type 1 (Intransitive -&gt; Monotransitive)**

Type 1 involves derived monotransitive *-i* verbs undergoing a
valence-changing applicativisation effect. The base is an intransitive
verb with an optional goal/locative PP (similar to v\_pp\*\_dir\_le in
ERG and INDRA). For example,

    4. a. Mangga jatuh ke rumah.
          mango fall to house
          "A mango falls onto a house."
    
       b. Mangga menjatuhi rumah.
          mango ACT-fall-i house
          "A mango falls onto a house."
    
       c. Rumah itu dijatuhi mangga.
          house that PASS-fall-i mango
          "That house is fallen onto by a mango."
    
       d. Rumah itu saya jatuhi.
          house that 1SG fall-i
          "That house is fallen onto by me."
    
       e. Jatuhi rumah itu!
          fall-i house that
          "Fall onto that house!"

Other examples are:

- *datang* "come" &gt; +*-i* &gt; *datangi* "come to" &gt;
*meN-*+ &gt; *mendatangi* "come to"
  
  - (roughly has the same meaning as *datang ke* "come to")
- *masuk* "go.in" &gt; +*-i* &gt; *masuki* "enter" &gt; *meN-*+ &gt;
*memasuki* "enter"
  
  - (roughly has the same meaning as *masuk ke* "go.in to")
- *hadir* "be.present" &gt; +*-i* &gt; *hadiri* "attend" &gt;
*meN-*+ &gt; *menghadiri* "attend"
  
  - (roughly has the same meaning as *hadir di* "be.present at")
- *duduk* "sit" &gt; +*-i* &gt; *duduki* "sit.on, occupy" &gt;
*meN-*+ &gt; *menduduki* "sit.on, occupy"
  
  - (roughly has the same meaning as *duduk di* "sit on/at")

The MRS of the derived monotransitive verbs should be the same as the
corresponding intransitive verbs with locative PP.

- **Type 2 (Monotransitive -&gt; Ditransitive, Three-place
Monotransitive)**

Type 2 is associated with ditransitive taking two objects with the
displaced theme being the second object. For example,

    5. a. Budi mengirim surat kepada Adi.
          Budi ACT-send letter to Adi
          "Budi sends a letter to Adi."
    
       b. Budi mengirimi Adi surat.
          Budi ACT-send-i Adi letter
          "Budi sends Adi a letter."
    
       c. Adi dikirimi (Budi) surat.
          Adi PASS-send-i (Budi) letter
          "Adi is sent (by Budi) a letter."
    
       d. Adi saya kirimi surat.
          Adi 1SG send-i letter
          "Adi is sent a letter by me."
    
       e. Kirimi Adi surat!
          send-i Adi letter
          "Send Adi a letter!"

The MRS of this type should be similar with the one in ERG for
ditransitive verbs. For example,

- [John handed Mary a
letter.](http://compling.hss.ntu.edu.sg/demophin/erg/parse?sentence=John%20handed%20Mary%20a%20letter.)
can generate:
  
  - John handed Mary a letter.
  - John handed a letter to Mary.
- [John handed a letter to
Mary.](http://compling.hss.ntu.edu.sg/demophin/erg/parse?sentence=John%20handed%20a%20letter%20to%20Mary.)
can generate:
  
  - John handed a letter to Mary.
  - John handed Mary a letter.

A bound verb root can also appear in this type. For this type of root,
*-i* is obligatory. The displaced theme can be non-core and surfaces as
oblique (PP). For example, the verb *menyuguhi* "serve" can be
ditransitive (without *dengan* "with") or monotransitive (with *dengan*
"with").

    6. a. *Budi menyuguh minuman kepada Adi.
           Budi ACT-serve drink to Adi
           FOR "Budi serves a drink to Adi."
    
       b. Budi menyuguhi Adi (dengan) minuman.
          Budi ACT-serve-i Adi (with) drink
          "Budi serves Adi a drink."
    
       c. Adi disuguhi (Budi) (dengan) minuman.
          Adi PASS-serve-i (Budi) (with) drink
          "Adi is served (by Budi) a drink."
    
       d. Adi saya suguhi (dengan) minuman.
          Adi 1SG serve-i (with) drink
          "Adi is served a drink by me."
    
       e. Suguhi Adi (dengan) minuman!
          serve-i Adi (with) drink
          "Serve Adi a drink!"

- **Type 3 (Monotransitive -&gt; Monotransitive with repetition or
plurality)**

Type 3 shows no valence change in *-i* derivation. *-i* signifies
repetition or intensification. For example,

    7. a. Budi memukul Adi.
          Budi ACT-hit Adi
          "Budi hits Adi."
    
       b. Budi memukuli Adi.
          Budi ACT-hit-i Adi
          "Budi hits Adi repeatedly."
    
       c. Adi dipukuli (Budi).
          Adi PASS-hit-i (Budi)
          "Adi is hit (by Budi) repeatedly."
    
       d. Adi saya pukuli.
          Adi 1SG hit-i
          "Adi is hit by me repeatedly."
    
       e. Pukuli Adi!
          hit-i Adi
          "Hit Adi repeatedly!"

A new predicate, e.g. \_repeatedly\_a\_rel can be added in the MRS of
this type.

Arka et al. (2009: 97) notes that the object is semantically linked to a
locative-goal role and the action is applied to a surface of an object.
For inherently punctual verbs like "hit", actions are given a repetitive
interpretation. For verbs where the object measures event completion
like "kill", *-i* gives rise to pluralisation or individuation of the
object. For example,

    8. a. Budi membunuh binatang itu.
          Budi ACT-kill animal that
          "Budi kills that animal."
    
       b. Budi membunuhi binatang itu.
          Budi ACT-kill-i animal that
          "Budi kills those animals one by one."
    
       c. Binatang itu dibunuhi (Budi).
          animal that PASS-kill-i (Budi)
          "Those animals are killed one by one (by Budi)."
    
       d. Binatang itu saya bunuhi.
          animal that 1SG kill-i
          "Those animals are killed one by one by me."
    
       e. Bunuhi binatang itu!
          kill-i animal that
          "Kill those animals one by one!"

- **Type 4 (Intransitive -&gt; Monotransitive)**

Type 4 of *-i* results in causativisation. For example,

    9. a. Airnya memanas.
          water=DEF ACT-hot
          "The water becomes hot."
    
       b. Budi memanasi airnya.
          Budi ACT-hot-i water=DEF
          "Budi heats the water."
          (lit. "Budi causes the water to become hot.")
    
       c. Airnya dipanasi (Budi).
          water=DEF PASS-hot-i (Budi)
          "The water is heated (by Budi)."
    
       d. Airnya saya panasi.
          water=DEF 1SG hot-i
          "The water is heated by me."
    
       e. Panasi airnya!
          hot-i water=DEF
          "Heat the water!"
    
       f. Budi membuat airnya memanas.
          Budi make    water  hot.
          "Budi makes the water hot." 
    
    
    10. a. Budi menguliti kambing.
           Budi ACT-skin-i goat
           "Budi peels the goat skin."
           (lit. "Budi causes the goat to be skinned.")
    
        b. Budi menguliti buku.
           Budi ACT-skin-i book
           "Budi covers a book."
           (lit. "Budi causes a book to be covered")

## Reduplication

Nouns, adjectives, and verbs can be reduplicated in Indonesian. We have
not implemented a rule for verb reduplication but we have successfully
implemented rules for noun and adjective reduplication in INDRA.

### Noun and adjective reduplication

According to Sneddon et al. (2010: 19), reduplicated forms can have
unreduplicated counterparts. For example,

- *batu* "stone(s)" &gt; +REDUP &gt; *batu-batu* "stones"
- *es krim* "ice cream(s)" &gt; +REDUP &gt; *es krim-es krim* "ice
creams"
- *mata* "eye(s)" &gt; +REDUP &gt; *mata-mata* "eyes"

In addition, reduplicated forms can have no unreduplicated counterparts
(treated as single bases) which cannot be further reduplicated. For
example,

- *mata-mata* "spy, spies"
- \**mata-mata-mata-mata* FOR "spies"

Sneddon et al. (2010: 20, 22) notes that the major function of noun
reduplication is to indicate plurality as illustrated in the examples
above. The non-reduplicated forms of nouns are underspecified for number
(can be singular or plural). The adjective reduplication occurs when the
noun it describes is plural. For example,

    11. a. Budi sedang melempar batu kecil.
           Budi PROG meN-throw stone small
           "Budi is throwing a small stone."
           "Budi is throwing small stones."
    
        b. Budi sedang melempar batu kecil-kecil.
           Budi PROG meN-throw stone small-REDUP
           "Budi is throwing small stones."
    
        c. Budi sedang melempar batu-batu kecil.
           Budi PROG meN-throw stone-REDUP small
           "Budi is throwing small stones."
    
        d. ?Budi sedang melempar batu-batu kecil-kecil.
           "Budi is throwing small stones."

The above example illustrates that the non-reduplicated form *batu
kecil* is underspecified for number. Both the reduplicated adjective
*batu kecil-kecil* and the reduplicated noun *batu-batu kecil* denote
plurality. The reduplicated form *batu-batu kecil-kecil* is considered
not standard.

### Noun and adjective reduplication in INDRA

We employ regular expression in handling noun and adjective
reduplication. In repp/vanilla.rpp a rule stating that any strings
reduplicated with a hyphen in between is changed to the string itself
with an iteration mark two square (²).

    !(.+)-\1                                \1²

Because noun/adjective reduplication mades a singular/plural
underspecified noun/adjective become a plural noun/adjective, the
reduplication rules is written in lrules.tdl. The rules state that for
any strings with the iteration mark two square (²), apply the lexical
rules redup-noun-lex-rule or redup-adj-lex-rule.

    redup-noun-suffix :=
    %suffix (* ²)
    redup-noun-lex-rule.
    
    redup-adj-suffix :=
    %suffix (* ²)
    redup-adj-lex-rule.

redup-noun-lex-rule makes the number plural (PNG.PERNUM pl) and
redup-adj-lex-rule states that the reduplicated adjective should unify
with a plural head noun.

Try to parse and generate these sentences in demophin:

- [mata-mata itu sedang melempar batu
kecil.](http://compling.hss.ntu.edu.sg/demophin/indra/parse?sentence=mata-mata%20itu%20sedang%20melempar%20batu%20kecil.)
  
  - can mean:
  - "That spy is throwing a small stone."
  - "That spy is throwing small stones."
  - "Those spies are throwing a small stones."
  - "Those spies are throwing small stones."
  - "Those eyes are throwing a small stone."
  - "Those eyes are throwing small stones."
- [mata-mata itu sedang melempar batu
kecil-kecil.](http://compling.hss.ntu.edu.sg/demophin/indra/parse?sentence=mata-mata%20itu%20sedang%20melempar%20batu%20kecil-kecil.)
  
  - can mean:
  - "That spy is throwing small stones."
  - "Those spies are throwing small stones."
  - "Those eyes are throwing small stones."
- [mata-mata itu sedang melempar batu-batu
kecil.](http://compling.hss.ntu.edu.sg/demophin/indra/parse?sentence=mata-mata%20itu%20sedang%20melempar%20batu-batu%20kecil.)
  
  - can mean:
  - "That spy is throwing small stones."
  - "Those spies are throwing small stones."
  - "Those eyes are throwing small stones."
- [mata-matanya sedang melempar batu-batu
kecil.](http://compling.hss.ntu.edu.sg/demophin/indra/parse?sentence=mata-matanya%20sedang%20melempar%20batu-batu%20kecil.)
  
  - can mean:
  - "The spy is throwing small stones."
  - "The spies are throwing small stones."
  - "The eyes are throwing small stones."
  - "His/her spy is throwing small stones."
  - "His/her spies are throwing small stones."
  - "His/her eyes are throwing small stones."

### Verb reduplication

Mistica et al. (2009) describes three functions of verb reduplication in
Indonesian.

**Purposelessness** The base can be intransitive or transitive verb. The
reduplication results in an action done in casual or leisurely way or
randomness, lack of specific purpose. For example,

- *duduk* "sit" &gt; +REDUP &gt; *duduk-duduk* "sit about"
- *lihat* "see" &gt; *meN-*+ &gt; *melihat* "see" &gt; +REDUP &gt;
*melihat-lihat* "have a look around"
- *tulis* "write" &gt; *meN-*+ &gt; *menulis* "write" &gt; +REDUP &gt;
*menulis-nulis* "write randomly"

**Repetition or plurality** The base can be intransitive or transitive
verb. The reduplication results in an action performed repeatedly. For
example,

- *pijit* "massage" &gt; *meN-*+ &gt; *memijit* "massage" &gt;
+REDUP &gt; *memijit-mijit* "massage repeatedly"
- *bagi* "divide" &gt; *meN-*+ &gt; *membagi* "divide" &gt;
+REDUP &gt; *membagi-bagi* "distribute, divide to many people"
- *cek* "check" &gt; *meN-*+ &gt; *mengecek* "check" &gt; +REDUP &gt;
*mengecek-ngecek* "check repeatedly"
- *amat* &gt; +*-i* &gt; *amati* "observe" &gt; *meN-*+ &gt;
*mengamati* "observe" &gt; +REDUP &gt; *mengamat-amati* "keep
observing, observe repeatedly"
- *masuk* "go.in" &gt; +*-i* &gt; *masuki* "enter" &gt; *meN-*+ &gt;
*memasuki* "enter" &gt; +REDUP &gt; *memasuk-masuki* "enter
repeatedly"
- *kirim* "send" &gt; +*-i* &gt; *kirimi* "send" &gt; *meN-*+ &gt;
*mengirimi* "send" &gt; +REDUP &gt; *mengirim-ngirimi* "send
repeatedly"
- *pukul* "hit" &gt; +*-i* &gt; *pukuli* "hit repeatedly" &gt;
*meN-*+ &gt; *memukuli* "hit repeatedly" &gt; +REDUP &gt;
*memukul-mukuli* "hit repeatedly"
- *panas* "hot" &gt; +*-i* &gt; *panasi* "heat" &gt; *meN-*+ &gt;
*memanasi* "heat" &gt; +REDUP &gt; *memanas-manasi* "heat
repeatedly"

<!-- -->


    12. a. Budi mengamat-amati orang itu.
           Budi ACT-observe-REDUP-i person that
           "Budi observes that person."
    
        b. Orang itu diamat-amati ( (oleh) Budi ).
           person that PASS-observe-REDUP-i ( (by) Budi )
           "That person is observed (by Budi)."
    
        c. Orang itu saya amat-amati.
           person that 1SG observe-REDUP-i
           "That person is observed by me."
    
        d. Amat-amati orang itu!
           "Observe that person!"

Similar to type 3 of the applicative *-i* mentioned above, a new
predicate, e.g. \_repeatedly\_a\_rel can be added in the MRS. The
difficult part is how we can build the reduplicated form
**meN-+\[base\]-N-+\[base\](+-i)** from the base.

**Reciprocals** The base is transitive verb and the reduplication makes
it to intransitive verb denoting a reciprocal action. The subject must
be plural as in example (9). For example,

- *kirim* "send" &gt; +*-i* &gt; *kirimi* "send" &gt; +REDUP &gt;
*kirim-kirimi* &gt; *meN-*+ &gt; *kirim-mengirimi* "send each other"
- *pukul* "hit" &gt; +REDUP &gt; *pukul-pukul* &gt; *meN-*+ &gt;
*pukul-memukul* "hit each other"
- *pukul* "hit" &gt; +*-i* &gt; *pukuli* "hit repeatedly" &gt;
+REDUP &gt; *pukul-pukuli* &gt; *meN-*+ &gt; *pukul-memukuli* "hit
each other repeatedly"
- *harga* "value" &gt; +*-i* &gt; *hargai* "respect" &gt; +REDUP &gt;
*harga-hargai* &gt; *meN-*+ &gt; *harga-menghargai* "respect each
other"
- *panas* "hot" &gt; +*-i* &gt; *panasi* "heat" &gt; +REDUP &gt;
*panas-panasi* &gt; *meN-*+ &gt; *panas-memanasi* "heat each other"

<!-- -->


    13. a. *Anak itu pukul-memukul.
            child that hit-ACT-hit
            FOR "Those children hit each other."
    
        b. Anak-anak itu pukul-memukul.
           child-REDUP that hit-ACT-hit
           "Those children hit each other."

In the MRS, we can add recip-pronoun and pronoun\_q\_rel. The difficult
part is how we can build the reduplicated form
**\[base\]-meN-+\[base\](+-i)** from the base.

## Questions

1. What DELPH-IN tools can be used to deal with reduplication and
morphology for Indonesian?
   
   In particular, **meN-+\[base\]-N-+\[base\](+-i)** for repetition and
**\[base\]-meN-+\[base\](+-i)** for reciprocals.
2. Semantics representation for applicative constructions and
reduplication

## References

- Arka, I W., M. Dalrymple, M. Mistica, S. Mofu, A. Andrews, and J.
Simpson (2009) A linguistic and computational morphosyntactic
analysis for the applicative -i in Indonesian. In *The Proceedings
of the LFG 09 Conference*, edited by M. Butt and T. H. King.
Cambridge
- Mistica, Meladel, I W. Arka, T Baldwin, and A Andrews (2009) Double
Double, Morphology and Trouble: Looking into Reduplication in
Indonesian. In *Proceedings of the Australasian Language Technology
Workshop (ALTW 2009)* Sydney, Australia, edited by L. Pizzato and R.
Schwitter, 44—52. UNSW, Sydney.
- Moeljadi, David, Francis Bond, and Sanghoun Song (2015) [Building an
HPSG-based Indonesian Resource Grammar
(INDRA)](http://aclweb.org/anthology/W/W15/W15-3302.pdf). In
*Proceedings of the Grammar Engineering Across Frameworks (GEAF)
Workshop, 53rd Annual Meeting of the ACL and 7th IJCNLP*, pages
9–16, Beijing, China, July 26-31, 2015.
- Sneddon, James Neil, Alexander Adelaar, Dwi Noverini Djenar, and
Michael C. Ewing (2010) *Indonesian Reference Grammar*. Allen &
Unwin, New South Wales, 2 edition.

# Notes from VLAD

David: We want to discuss the morphology of reduplication, and the
complexity with voice and valence, and sound change in Indonesian.

Indonesian intransitive verbs require the prefix meN to produce a
well-formed sentence. But in transitive verbs this is optional, and must
be left out in passive voice and imperative constructions.

(3b), (3c) and (3d) are not implemented yet.

Guy: Is meN required for all intransitive verbs?

David: Yes. But meN is usually left out in spoken Indonedian for
transitive verbs.

Guy: So what is the meaning of the base 'ungsi', if you need to use meN?

Francis/David: It's just the standard way of listing verbs in
dictionaries.

Guy: Are there any intransitive verbs with optional meN?

David: No... You always need it.

David: Concerning valence, both 'i' and 'kaN' are applicatives that
change the valence. I'll only present 'i'. There are 4 types.

We want to have the MRS for (4a) and (4b) be the same.

Emily: I'm worried about the claim that the MRS for (4a) and (4b) should
be the same. I think I see three possible ways of doing that: (i) The
preposition is semantically empty; (ii) the applicative morphology adds
an EP that matches that of the preposition; or (iii) they're not
actually the same. Is it that the preposition is semantically empty?

Guy: How about if the 'A mango falls into a bucket'? Can it use the same
preposition?

David: Yes.

Emily: How about 'A mango falls next to the bucket'? Can it use the same
preposition?

David: I would still use 'ke' but I also need to use something else.

Emily: And can you still have the form 'i'?

David: No.

Guy: So is it \[that something else?\] more a noun or a preposition?

David: I'd say noun, like a prepositional noun.

Francis: Like Japanese. How productive is it in Indonesian?

David: I don't know. This is not very well accounted for in reference
grammars. Maybe 50, at most.

Francis: Would you expect any intransitive verb with an optional pp
could undergo this?

David: No, not all....

Emily: The point of this discussion was to think about if these 2
examples should have the same MRS. Perhaps we now have more data to
think about this, for later.

David: For type 2, (5b) shows that Indonesian is similar to English. So
this should be similar to how the ERG handles "John handed Marry a
letter", and should also generate "Marry was handed a letter by John".

In (6b) 'with' is optional. I know it is a bit weird, but the examples
in (6) are actually not very productive.

Emily: In any case (6) doesn't look like it needs a rule. So you can set
these aside as you are designing the rules for the examples in (5).

Guy: How do you know that (6) is using the 'i' suffice and that 'i' is
not just part of the root?

David: Because you can have the applicative construction 'kaN' as well,
and I can use the suffix 'kaN' instead of 'i'.

For the MRS of Type 3, I can make the MRS have a \_repeatedly\_a\_rel
inserted. But In number (8), you can see that there is also another
sense of plurality for the object. But comparing to number (7), the
sense in (8) is much less productive.

Francis: Do you think these need to have a different semantics? Or that
the interpretation can be left for later, and not part of the MRS?

David: Yes, maybe left for later is fine.

Guy: In (8b) does it have 2 meanings? If you use the hit verb, can you
have the two readings 'repeatedly' and 'one by one'. (e.g. you have lots
of animals and you hit one by one)

David: My reading is that repeatedly (one animal).

Guy: How if you had the animals pluralised?

David: I think it's possible. It's ambiguous, and that's why Arka also
classifies these two as the same type.

Francis: Good that's a simpler analysis.

David: For Type 4, I think the MRS should be close to causatives. Like
'hit cause v2'. It's also possible to say 'Budi makes the water hot'
(e.g. Budi mambuat water hot)

Emily: In the ERG this is encoded by separate predicates, but it doesn't
mean you can't make it through affixes...

Guy: Can you use an intransitive verb that can NOT be used as an
adjective?

David: I don't think so...

Guy: Couldn't you do something like 'Budi makes the goat fall'

David: Yes, but with the suffix 'kaN', not with 'i'.

Guy: I meant 'fall', not 'full'.

David: Ahh, then no! You need to say 'makes Adi fall'. But it has a
metaphorical sense...

Guy: What if you wanted to make it literate?

David: In that case you can't use that 'i', you need to use membuat (to
make).

Francis: And for something like 'He walked the dog' as in 'He makes the
dog walk.'

David: Then I can't use 'i' either. I'll say 'makes the dog walk'.

Francis: And do you need 'meN' in this case?

David: No...

Francis: How productive is this? Can I 'table the wood' (i.e. make the
wood into to table)?

David: No....

Francis: Because, currently. we don't allow you to verb any noun in
English, although that can be done.

David: Yes I agree, not all noun can have this 'i' or 'kaN'.

Emily: The difficult thing is the triage between productivity and what
what you need to include in the lexicon. But I think you're on the right
track. In the cases were you can have both 'i' or 'kan' it's a bit
weirder, but you include the 'i' form in the lexicon and have a rule
strip it before applying 'kaN'.

David: But between 'kaN' and 'i' there are also slight changes in
meaning. Like "trying to boil the water" would use 'kaN', it can mean
unaccomplishment.

Dan: in (10a) and (10b) how do you get the magic interpretation of skin?
Both positive and negative?

David: Right! For (10b) we don't expect the book to have cover, so it
covers the book. But maybe it's only for this special case.

Francis: And interstitially enough, we also get this in English. we have
examples were skin means to peal, and to add skin.

Dan/Emily: Examples???

Francis: Can I skin the application to put my cat picture on it? I'm
fairly sure I've heard it used.

Emily: But also fairly different senses for the noun too...

Dan: How about covering with skin someone that has been burned? Can this
be cover with skin?

Wenjie: In 3D modelling there is also a sense of putting a skins on.

Francis: Well, if they are both reasonably common in Indonesian, should
we (Dan) have 2 single predicates or one ambiguous predicate?

Dan: If you have an ambiguous predicates, you can't predict the argument
structure.

Emily: You seem to be arguing in favour of some kind of selectional
restriction? Do we want to model that?

Dan: I don't know. Maybe?

Francis: I think you're right we don't know what to do, but I think we
can have 2 different predicates.

David: Now the main part -- reduplication! Nouns, adjectives and verbs
can be reduplicated in Indonesian. We currently have only noun and
adjective reduplication implemented.

In (11d), if you reduplicate both the noun and the adjective is possible
but not very standard, and it's not in reference grammars. It happens
often enough. So far we have implemented this with regular expressions.
and also have in l-rules.tdl, and these make the number plural for both
the noun and the adjective.

Emily: I'm using Demophin and batu is appearing as single, and I thought
it should be plural, for what you are saying.

Francis: Right, we decided to set the default to 3rd person singlugar,
to avoid over generation. And \[for fun\] one of the reasons we use this
superscript 2 is that, in Indonesian, people actually use 'mata2' to
mean 'mata-mata' when chatting or texting.

Emily: You might want to have a look to Berthold's paper, where he
explains how to treat the reduplication in Hausa.

Francis: Yes, we know. But I think he is doing stuff with chart
mapping... =(

David. The last example is also nice to see the interaction between
rules. We can have, for example. the enclitic nya (the / 3rd person
singular). So this is 'the spy' or 'his/her spy', and it still works
fine.

But even though we could implement this for nouns and adjectives, verbs
are more difficult. In verbs, reduplication can have the meaning of
purposelessness, or of repetition/plurality, The first sense is kind of
ambiguous, and it can relate to the second sense...

The difficulty we have concerns the sound change and the morphological
processes can co-occur with reduplication. See, for example, cek
"check". In the MRS, we can add the repeatedly relation.

Guy: Is this the same as the previous sense of 'repeatedly'?

David: In the reference grammars it's just written repeatedly... For me
the meaning is the same.

Emily: Can the verb from (7) go through the same process to mean
repeatedly?

David: Yes, pukul is there, you can add the suffix 'i', and and then
'menN' (memukul-mukuli).

Emily: So what's the 'i' doing there?

David: In Arka's paper, this is not mentioned, but this 'i' is sometimes
bounded, just like 'amati' for 'amat' does not mean repeatedly. In this
case 'amat' is the base, but it cannot be used standalone, even in
imperative!

There also another way of reciprocating verbs (i.e. each-other) through
reduplication. See the examples for pukul again.

Also, in (13a), even though 'anak' can mean mean both child or children,
I can't have the non-reduplicated form.

Emily: Is this only for animate nouns, or it also occurs for inanimate
(e.g. rocks hit each other).

David: I prefer with reduplicated form with the plural reading, but you
can find the not-reduplicated on google.

Guy: In the previous cases you handled these with [RegExp](/RegExp), I
think they could also work here.

Francis: You can write regular expressions, but you have to have gone
through the sound changes... and REPP happens before you go through the
LKB. It's the reciprocals verbs that are a challenging. For example from
pukul to pukul-mukuli.

Guy: I think this could still be done with [RegExp](/RegExp) though...

Francis: Yes, but then we would be applying the sound changes twice. I
think chart mapping could allows us to do this better, and I was hoping
to find some help here.

Emily: I think this could be done best with a combination of chart
mapping and morphology rules. Have you seen Berthold's paper (and
grammar)?

Dan: There is another radical strategy, which is to use syntactic rules.
You can have something like a compound rule to act at the lexical level
but as syntax. Then you'd be doing some of this composition
syntactically.

Francis: And treat some of these as semantically empty?

Dan: Well, you would have to keep agnostic until later, yes.

Guy: On this note, I would like to bring back the topic I raised on the
last DELPH-IN. But this could be a very simpler case of that.

Francis: I fear I lack the technical skill to implement it, but if you
implement it I'm happy to play with it.

Guy: It could be quite possible that I don't have the technical skill
either.

\[The scribe apologises, but he missed out on technical parts of this
bit of the discussion\]

Dan: We could say that the RELS list are underspecitfied, and keep
filling it in as necessary to accommodate these changes?

Emily: It seems as this would cause problems with the generator. do you
have this in ERG?

Dan: I don't see why it would be a problem, because you can still fix up
things on the generation side.

Francis: So this is similar to Petter's approach? To keep agnostic about
the semantics until it unifies further up?

Dan: Are there cases of ambiguity, where it looks like reduplicated but
it's actualy 2 predicates.

Emily: Why is this problematic?

Dan: If this never occurs, then you could easily predict that they would
always be reduplication, and if can have ambiguity you will need to
decide.

David: head 'kepala' can have both the body's head and department's head
senses. But this would use no hyphen. So 'kepala kepala department' can
mean head of the head of department. But with hyphen (kepala-kepala
department), it has to mean 'heads of department'.

Dan: So since there is a consistent orthographic pattern, you don't need
to be vague about it.

Francis: Ok, so far the suggestions are to play with things that don't
introduce a predicted until we know more about it, to play further with
regular expressions and to look at Hausa's grammar and play with chart
mapping.

Francis: Dan, does that mean that for every noun, we would need to have
2 in the lexicon?

Dan: You can create it on the fly, using chart mapping. There is no
point into listing them all. And it would still allow the LKB to do the
phonology

Francis: So can chart mapping see more than one token at a time? If so,
why not just say 'add something on the right and get rid of having to
decide later?

Dan: Because you gave a good argument why you needed this, to allow the
LKB take care of the morphology later.

Francis/Dan: David, tell me about the hyphen usage, can you also see it
inside a non-reduplicated word?

David: yeah you can also use it inside words, but I can't think of a
good example now.

Dan: You need the over generation of the chart.

Francis: Ok, and the magical thing about using the chart is that it
forks things, so I can say that if some things match then I can get rid
of the other things.

Also, do people have any wisdom about how to put these relations into
the MRS? I think we could use something like a \_repeatedly\_ predicate
that forms a small hierarchy with the word that means actually
repeatidly, but we probably should not want to give them identical
semantics.

David: But you should be able to paraphrase them...

Francis: Can 'can' and 'be able to' be paraphrased in English? I suspect
its about the same level of sameness as that! Currently what we do is to
say they are very similar, by giving them a super type, but don't
collapse them. if you can give me a good test.

Emily: I thought you were saying that it should have an under-bar
because it was introduced by the morphology, but that's not a strong
enough case.

Guy: In 'membunuhi' with reduplication, does it have the same meaning? I
mean, if they can have the repetition from the 'i' and the purposeless
of the reduplication?

Francis: Saying you're in a world where you're raising the same globin
and repeatedly killing it.

Guy: My example was bit different, but that's also a good...

David: I think it's the same.

Emily: This sounds like it could be interacting with aspect. Is there
other aspect marking?

David: Yes.... we have some aspectual markers.

Emily: And can they co-occur with reduplication and 'i'?

David: Yes, they can. It's fine...

Emily: It sounds like a separate EP should be a good choice, in a
interactive manner. And then the question is if the 'repeatedly'
introduced the same 'repeatedly' as the regular word.

Luis: Where should we go to get help with chart mapping?

Francis: Peter Adolphs!

Emily: I suspect that chart mapping and morphology change is Berthold.
These LAD meetings are designed to last 90 minutes, and we have extended
ourselves... So we should wrap up soon.

Francis: One other question, for this changing something to causative...
Should we use a lexical rule to put in the causative relation? For the
the hot and heat relation, for example, we have a heat and make 'cause
'to cause hot'. In this case should the ARG2 of the cause be QEQed to
the state of being hot? I force myself to always put this in, but I'm
unsure.

Emily: Putting one in is the same as to think about a quantifier making
scope. And I don't know what that would mean in this case.

Dan/Francis: Can you say 'to cause water becomes not hot'?

Emily: Well, for negation it's enough to make it a scopal argument, but
if you have negation you can possibly have other things...

Dan/Emily: The bottom line is to put the QEQ unless you have reason to
believe otherwise.

Francis: OK thanks! we'll do that!

All: See you all soon!

Last update: 2021-06-04 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/LADIndonesianMorphology/_edit)]{% endraw %}