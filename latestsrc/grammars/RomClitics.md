{% raw %}We love clitics.

## General remarks

The status of clitics (syntactic word vs. bound morpheme) is
problematic. Most Romance clitics have the properties of bound affixes
but for primarily orthographic considerations, the Delph-In Romance
grammars realize clitics in syntax (exceptions: post-verbal clitics in
Spanish and French).

Issues to be addressed:

- determining pre- vs. post-verbal position
- allomorphy and ordering constraints in clitic clusters
- clitic climbing (i.e., raising of complement clitics, realization on
a higher verb)
- clitic doubling
- the syntactic deficiency of clitics (restrictions on coordination,
modification, distribution)
- subcategorization issues (complements that must be / must not be
cliticized)

## Spanish

## Portuguese

## French

- preverbal clitics appear in a fixed order, with 5 slots
|                                          |                         |                 |       |        |
|------------------------------------------|-------------------------|-----------------|-------|--------|
| { m(e) \| t(e) \| s(e) \| nous \| vous } | { l(a) \| l(e) \| les } | { lui \| leur } | { y } | { en } |
  
  - maximum cluster length = 4 (at most one clitic per slot, and
slots 1 and 3 cannot both be filled)
  - can be extended to the left by a subject clitic and the negative
scope marker
|                                                        |      |
|--------------------------------------------------------|------|
| { j(e) \| tu \| il/elle \| nous \| vous \| ils/elles } | n(e) |
- post-verbal clitics
  - non-negated imperatives
|                       |                                                   |       |        |
|-----------------------|---------------------------------------------------|-------|--------|
| { la \| l(e) \| les } | { lui \| leur \| m(oi) \| t(oi) \| nous \| vous } | { y } | { en } |
  - post-verbal clitics (pronominal subject inversion) \[not
implemented\]
  
  <!-- -->

  
  - |                                                                      |
|----------------------------------------------------------------------|
| { je \| tu \| (t-)il/(t-)elle \| nous \| vous \| (t-)ils/(t-)elles } |
- Preverbal clitics are separated from verb and each other by a space
or apostrophe; Postverbal clitics are separated from verb and each
other by a hyphen or apostrophe.
- obligatory allomorphic effects throughout cluster and between clitic
and verb:
  - elision (reflected in orthography): deletion of *e*, *a*, *oi*
  - liaison: \[t\]-insertion (sometimes reflected in orthography),
\[z\]-insertion (non-standard)
- Clitic climbing is found systematically in compound past tenses
(auxiliaries *être* and *avoir*) and under some conditions with
causative *faire* and *laisser*.
- Clitic doubling in standard French is limited to the following cases
\[none implemented\]:
  - obligatory *les* in combination with direct object *tous* (all):
    
    - *Je vais \[tous (\*les) massacrer, (\*les) massacrer tous\]*
(I'm going to slaughter them all)
  - *en* in combination with direct object quantifiers (especially
numerals)
    
    - *Je vais (\*en) massacrer deux* (I will slaughter two (of
them))
  - NP subject in combination with clitic inversion:
    - *A quelle heure Paul va-t-il arriver ?* (At what time will
Paul arrive?)
- widespread left and right dislocation with clitic realization \[not
implemented\]

### Implementation

Miller and Sag (1997) established that French pronominal clitics are
bound affixes (pre-verbal subject clitics are possibly less bound). This
approach is not uniformly adopted in the LKB grammar, in order to
reflect conventional French orthography. Pre-verbal clitics are analyzed
as *lexemes* and inserted in syntax by "compounding" rules (which must
apply lower than ordinary syntactic rules). This is made possible by the
following hierarchy under *sign*:

    gram-cat := sign.
    lexical := sign.
      word := lexical & gram-cat.
      lexeme := lexical.
    phrasal := gram-cat.
      phrase := phrasal.
    compound := phrasal & lexical.

Post-verbal clitics are realized morphologically using inflectional
lexical rules.

Although vowel elision is correctly analyzed, the apostrophe is
currently thrown out (not generated). The hyphen is treated as a normal
character. Neither one of these approaches is adequate.

Clitic climbing is analyzed using Abeillé, Godard, and Sag's argument
raising analysis: temporal and causative auxiliaries systematically
inherit all complements of the participle/infinitive (which is not
allowed to project a VP). Currently untreated: downstairs cliticization
with causative *faire* and "clitic trapping".

Currently no analysis for any cases of clitic doubling.

## Modern Greek

Last update: 2006-07-11 by JesseTseng [[edit](https://github.com/delph-in/docs/wiki/RomClitics/_edit)]{% endraw %}