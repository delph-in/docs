{% raw %}Analyzing the uses of the reflexive clitic **SE** in Romance.

For the (morpho-)syntactic realization of **SE**, see
[RomClitics](https://delph-in.github.io/docs/garage/RomClitics). This page addresses problems at the
syntax/semantics interface.

## General remarks

- The term **SE** encompasses 5 surface forms: 1st or 2nd x sing (e.g.
Spanish *me*, *te*), 1st or 2nd plur (*nos*, *os*) + 3rd sing/plur
(*se*).
- same form for accusative and dative (sometimes impossible to
resolve, for inherently reflexive verbs)
- special form in 3rd person (no sing/plur distinction) but not in
1st/2nd person

### Special remarks for French

- **SE** (in all uses) is incompatible with the verb *avoir* (temporal
auxiliary or main verb 'have'), induces auxiliary switch (to *être*)
in compound tenses.
  
  Ex. *Je lui ai dit, il m'a dit* (I told her, he told me) but *Je me
suis dit, il s'est dit* (I told myself, he told himself)
- Only accusative **SE** triggers past participle agreement (primarily
orthographic convention).
  
  Ex. *Elles se sont rencontrées* (They met each other) but *Elles se
sont parlé* (They talked **to** each other)

### Special remarks for Portuguese

This is not a special remark about Portuguese, but a hint for a paper
that addresses the exact issue of the present page from the perspective
of computational grammar (it's about Spanish, but its results can to a
large extent be extrapolated to other languages):

Randy Sharp, 2005, "A Unified Treatment of Spanish *se*". In Branco,
[McEnery](/McEnery) and Mitkov (eds)*Anaphora Processing: Linguistic,
Cognitive and Computational Modelling*. Amsterdam: John Benjamins,
isbn9027247773, pp.113-138.

### Special remarks for Spanish

## Semantic SE

i.e., reflexive/reciprocal **SE**

common properties

- realization of an accusative or dative complement
- receives the semantic role associated with that complement
- alternates with non-reflexive accusative or dative clitics/NPs/PPs
- alternates with strong reflexive pronouns

### Semantic SE in French

*se laver* (acc), *se parler* (dat)

examples and language specific properties, implemented or planned
analysis

### Semantic SE in Portuguese

### Semantic SE in Spanish

## Expletive SE

aka "inherent **SE**"

common properties

- lexically specified but assigned no semantic role (expletive)
- accusative (rarely dative, e.g. French *se plaire*)
- does not alternate with non-reflexive complements (or change in word
sense)
- does not alternate/co-occur with strong reflexive pronoun

### Expletive SE in French

*se taire*, *se suicider*

- Normative rule: **SE** triggers past participle agreement (i.e.,
analyzed as accusative)
  
  Les voix se sont tues/\*tu. (The voices-*fem* fell silent) currently
enforced in the grammar (perhaps should apply strictly only for
generation)
- But, the caused agent in the *faire*-causative is generally
accusative, not dative (as expected when the embedded verb is
transitive):
  
  L'auteur fait se suicider <span class="u">(\*à) son
personnage</span> (The author makes his character kill himself)

Possible cases of dative expletive **SE**: *se dire* *se demander*
(sense shift: 'tell oneself --&gt; think', 'ask oneself --&gt; wonder')

### Expletive SE in Portuguese

### Expletive SE in Spanish

## Mediopassive SE

common properties

- passive-like demotion of active subject and promotion of accusative
complement
- impossibility of agentive *by*-phrase

### Mediopassive SE in French

*se vendre*

### Mediopassive SE in Portuguese

### Mediopassive SE in Spanish

## Other uses?

E.g., melt/break/sink alternations

- how productive?
- how regular?
- how to analyze...?

Last update: 2007-06-29 by JesseTseng [[edit](https://github.com/delph-in/docs/wiki/RomSe/_edit)]{% endraw %}