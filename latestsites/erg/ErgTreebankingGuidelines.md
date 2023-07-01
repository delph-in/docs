{% raw %}# Heuristics for efficient treebanking

Contents

1. [Heuristics for efficient
treebanking](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Heuristics_for_efficient_treebanking)
   1. [Top-down](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Top-down)
   2. [Bottom-up](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Bottom-up)
   3. [Prefer Simpler](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Prefer_Simpler)
2. [Technical choices](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Technical_choices)
   1. [Complex proper names](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Complex_proper_names)
      1. [Titles](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Titles)
      2. [Capitalized words in name](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Capitalized_words_in_name)
      3. [Profession modifier](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Profession_modifier)
      4. [Native names preferred when
available](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Native_names_preferred_when_available)
   2. [Proper names and punctuation](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Proper_names_and_punctuation)
   3. [PP/modifier attachment](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#PP.2Fmodifier_attachment)
   4. [Temporal modifiers](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Temporal_modifiers)
   5. [Complex compound nouns](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Complex_compound_nouns)
   6. [Coordination](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Coordination)
   7. [Passive verb vs. adjective](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Passive_verb_vs._adjective)
   8. [Punctuation](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Punctuation)
   9. [Adverbs](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Adverbs)
   10. [Measure phrases](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Measure_phrases)
   11. [Quotations with explicit
attribution](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Quotations_with_explicit_attribution)
   12. [Partitive NPs](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Partitive_NPs)
   13. [Modification in noun phrases](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Modification_in_noun_phrases)
3. [Notes from Tomar meeting](https://delph-in.github.io/docs/erg/ErgTreebankingGuidelines#Notes_from_Tomar_meeting)

## Top-down

- Choose the construction that spans the whole sentence
  - Typically SUBJH
  - Typically not one of the FRAG\* rules

## Bottom-up

- Disambiguate lexical entries early, to reduce remaining ambiguity

## Prefer Simpler

- in general prefer the simpler choice
  - e.g. for nominal *seating* prefer NP over intransitive V, rather
than NP over transitive V with an optional complement.

# Technical choices

## Complex proper names

### Titles

- \|Mr. Browne\|
  - Choose NP-TITLE-CMPND, not APPOS

### Capitalized words in name

- treat as parts of name, not ordinary words
- \|Rolls-Royce Motor Cars Inc.\|
  - \|Motor Cars\|
    - NP\_NAME\_CMPND, not NOUN\_N\_CMPND
  - \|Rolls-Royce\|
    - Choose multi-word entry when available
  - \|Rolls-Royce Motor Cars\|
    - NP\_NAME\_CMPND
  - Attach \|Inc.\| with NADJ\_RR

### Profession modifier

- treat as appositive
- \|Howard Mosher, president and CEO\|
  - First combine \|Howard Mosher\|
  - Then combine it with \|president and CEO\| using APPOS\_NBAR

### Native names preferred when available

- Company names
  - \|Rolls-Royce\|
    - Choose n\_-\_pn\_le, not NP\_NAME\_CMPND
- Country names
  - \|U.S.\|
    - Choose n\_-\_c-nm-pd\_le, not n\_-\_pn-gen\_le

## Proper names and punctuation

- Unknown names
  - \|Elianti.\|
    - Choose PUNCT\_PERIOD\_ORULE (period is not part of name)
- Name abbreviations containing periods
  - \|U.S.\|
    - Choose PUNCT\_PERIOD\_ORULE if word is at end of sentence

## PP/modifier attachment

- Choose highest attachment point consistent with meaning
  - \|remain steady at 1,200 cars\|
    - attach to VP, not to \|steady\|
  - \|reserve a room for Browne\|
    - attach to VP, not to \|room\|
  - **but** disprefer modifier attachment to semantically vacuous
heads
    
    - e.g. attach modifiers to *hiring ...*, not *be hiring ...*
- In copula constructions (with forms of verb "be"), attach PP inside
  - \|be payable Feb. 15\|
    - First combine \|payable\| with \|Feb. 15\| with HADJ\_I\_UNS
- Complement vs. modifier - choose complement when available
  - \|based in Los Angeles\|
    - Choose HCOMP, not HADJ\_I\_UNS
- PP modifier inserted between verb and its complement NP
  - \|publish in statements the names of insiders\|
    - First combine \|publish\| with \|in statements\| using
VMOD\_I

## Temporal modifiers

- When precede VP, attach to subject NP
  - \|the maker last year sold cars\|
    - attach \|last year\| to \|maker\|
- Treat as modifiers, pumping temporal NP to a PP
  - \|last year\|
    - Choose NPADV, not ADJN
  - \|Feb. 15\|
    - Combine with HSPECHC, then choose NPADV
- Complex phrases
  - \|early next year\|
    - Combine \|early\| with \|next year\| using NADJ\_RR

## Complex compound nouns

- Choose bracketing with intended sense
  - \|luxury auto maker\|
    - first combine \|luxury\| with \|auto\|
- When intended bracketing is not clear, group from right to left
  - \|airline ticket counter\|
    - first combine \|ticket\| with \|counter\|

## Coordination

- if you have a choice between *XP CCONJ XP*vs *X CCONJ X* choose the
XP (or S), that is, the highest constituent
  
  - e.g., for *cats and dogs*, prefer NP coordination over N
coordination with a bare NP rule on top
- Nominal phrases
  - Choose N\_COORD\_TOP\_2, not N\_COORD\_TOP\_3 when given the
choice
- Sentence-initial conjunction - treat as incomplete coordination of
clauses
  - \|But Abrams arrived early.\|
    - Combine \|But\| with \|Abrams arrived early.\| with
HMARK\_CL

## Passive verb vs. adjective

- Choose verb if the meaning is agentive; otherwise choose adjective
  - \|A date hasn't been set\|
    - For \|set\|, choose v\_np\*\_le, not aj\_-\_i\_le

## Punctuation

- Attach punctuation to the preceding words
  - except for some rare conjunctions
- Paired commas marking off a modifier: choose "paired" rule (-PR
suffix)
  - \|Bell, based in Los Angeles\|
    - Choose NADJ\_RC\_PR to combine modifier phrase with \|Bell\|

## Adverbs

- Negation - always attach \|not\| to preceding auxiliary if possible
  - \|did not meet\|
    - First combine \|did\| with \|not\| using HCOMP
- Other adverbs between auxiliary and main VP - attach adverb to
following VP
  - \|can really sing\|
    - First combine \|really\| with \|sing\| using ADJH\_S
- Sentence-initial - Prefer attachment without extraction when
possible
  - \|Apparently the commission met\|
    - Choose ADJ\_S, not FILLHEAD\_NON\_WH\_IG

## Measure phrases

- Degree modifiers - combine with the number word
  - \|about 25 % of them\|
    - First combine \|about\| with \|25\| using HSPECHC
    - Combine \|%\| with \|of them\| using HCOMP
- Dollar amounts - treat the symbol \|$\| as the head (the unit of
measure)
  - \|$ 80 billion\|
    - Combine \|$\| with \|80 billion\| using MEAS\_NP\_SYMB

## Quotations with explicit attribution

- treat as extraction from 'saying' verb
  - \|They arrived, Browne said.\|
    - Combine \|They arrived,\| with \|Browne said.\| using
FILLHEAD\_NON\_WH

## Partitive NPs

- First pump determiner to noun, and treat of-PP as complement
  - \|some of the books\|
    - Combine \|some\| with \|of the books\| using HCOMP
- For \|all\|, \|not all\|, \|both\|, and \|half\|, treat following NP
as complement
  - \|not all those who wrote\|
    - For \|not all\|, choose native entry n\_np\_mc-neg\_le
    - Combine \|not all\| with \|those who wrote\| using HCOMP

## Modification in noun phrases

- Modifiers to the right of the head noun are always attached
\_before\_
  - any modifiers to the left
  - \|important changes by the SEC\|
    - First combine \|changes\| with \|by the SEC\| using NADJ\_RR

# Notes from Tomar meeting

1. Where lexical ambiguity is hard to decide (e.g. even-deg vs
even-conj), choose based on frequency in redwoods/deepbank
2. Disprefer modifier attachment to semantically vacuous heads e.g.
attach adverbs to *hiring...*, not *be hiring...*
3. For there-copula:
   1. Avoid double-object choice and avoid modification of there-cop
   2. Also prefer low attachment of modifier after obj NP
   3. Accept extraction of PP for there-cop as is
4. When choice of verb-particle or verb-mod as in *go away*, if you can
modify the \`particle' as in *go far away*, it is not verb-particle.
5. When choice of spr-hd or mod-hd for Adv-Adj, choose mod-hd
6. Avoid adv-add except for *not*
7. When WH-Q of form NP-be-NP \[EMB: guessing this is choose subj-head;
Dan please confirm\]
8. For complement of saying, if there's a main clause option for the
quoted material choose it:
   - \|"Who did Kim hire" asked Mary\| not \|\*Who Kim hired, asked
Mary\|
9. No free relatives
10. Attach three-dot punct as low as possible
11. Reject ellipsis
12. For ndash between clauses, use run-on
13. For degree specifiers, when there's a choice, take the shortest
lexent type name
14. Attach subord clause high \[EMB: subordinate clauses are understood
as clauses with all arguments overt; do not include in+order+to
purposives, etc.\]

Last update: 2020-07-23 by AlexandreRademaker [[edit](https://github.com/delph-in/docs/wiki/ErgTreebankingGuidelines/_edit)]{% endraw %}