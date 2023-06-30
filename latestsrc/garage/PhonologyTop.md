{% raw %}Proposals for incorporating phonological representations into LKB
grammars.

# Phonemes

Depending on the level of detail required:

- character strings "a", "b", "c", …
- typed objects (e.g. [French phoneme
hierarchy](https://delph-in.github.io/docs/garage/PhonologyTop_FrenchPhonemes))
- articulatory feature bundles
  
      phoneme := avm &
         [NASAL bool].
      consonantal := phoneme &
        [PLACE place-of-articulation,
         MANNER manner-of-articulation,
         VOICING voicing].
      vocalic := phoneme &
        [HEIGHT vowel-height,
         BACK vowel-backness,
         PHONATION phonation,
         ROUND bool].   
        vowel := vocalic.
        consonant := consonantal.
        glide := vocalic & consonantal.
  
  - place: {bilabial, labiodental, dental, alveolar, postalveolar,
velar, glottal, …}
  - manner: {stop, trill, fricative, approximant, …}

# Syllabic structure

- division into segmental and suprasegmental features:
  
      syllable := avm &
        [SEG segmental,
         SUPSEG suprasegmental].
- segmental information:
  - either list of segments mapped to onset-nucleus-coda structure
(with possibility of unsyllabified "floating" segments)
    
        segmental := avm &
          [SEGMENTS list-of-phons,
           ONSET list-of-phons,
           RIME rime].
        rime := avm &
          [NUCLEUS list-of-phons,
           CODA list-of-phons].
  - or more simply: declare syllable with \[SEG list-of-phons\] or
\[SEG string\]
- suprasegmental features associated with entire syllable
(problematic?)
  
      suprasegmental := avm &
        [STRESS stress,
         TONE tone].

# PHON value

List of syllables, but also PHONS attribute for flat list of (realized)
phonemes or some other conveniently accessible representation.

    phonology := avm &
      [PHONS list-of-phons,
       SYLBS list-of-syllables].

# Prosodic structure

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/PhonologyTop/_edit)]{% endraw %}