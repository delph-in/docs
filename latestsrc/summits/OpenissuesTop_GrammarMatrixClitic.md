{% raw %}# Open Issue: Clitics

Mentors: EmilyBender (ebender at u dot washington dot
edu, <http://faculty.washington.edu/ebender>), JesseTseng

Co-mentors welcome!

## Problem Statement

Many of the DELPH-IN languages (all the Romance languages, Modern Greek)
display elements traditionally called "clitics". This seems like a
fruitful area to explore from the perspective of computational typology.
That is, can we develop a general analysis of these phenomena that works
well in all of the languages concerned? Can we then abstract it out of
the grammars and create a Matrix extension?

## Further Extensions

Beyond Romance-style clitics (which are affixes on verbs, but also
display interesting phenomena such as clitic climbing) there are also
other kinds of clitics (e.g., second position clitics found in many
Slavic languages, clitic-auxiliary clusters in Australian languages,
Dutch clitic pronouns, etc). The phonological dependence of clitics
combined with their syntactic independence often gives rise to
interesting challenges in word order, which would seem a fruitful area
of research to test the boundaries of our current systems which assume a
rather strict mapping between phenogrammatical structure and
tectogrammatical structure.

Inventory of possible clitics

- pronominal and pro-PP clitics (Romance, Slavic, Mod Greek, Germanic,
...)
- negation (Romance, Slavic, ...)
- tense/modal auxiliaries (Slavic, English, ...)
- possessive (Mod Greek, ...)
- definite article (Norwegian, Bulgarian, Arabic, ...)
- weak prepositions, complementizers, conjunctions?
- English *'s*, *a/an*

Dimensions of variation

- word order:
  - same distribution as corresponding full form? (Zwicky's *simple*
vs *special*)
  - clitic cluster with fixed template?
  - special case: "second position" clitics
- identity of host: word or phrase? fixed category or variable?
- degrees of morphosyntactic independence:
  - allomorphic variation with host or other clitics
  - projection properties (can they be modified? coordinated?)
  - wide scope over coordination of hosts
- orthographic considerations: To what extent should our treatment be
guided by crazy orthographic conventions?

## Existing HPSG Literature

Kupsc, Anna. 2000. *An HPSG Grammar of {P}olish Clitics* PhD
Dissertation, University of Warsaw and Paris VII.

Miller, Philip H. and Ivan A. Sag. 1997. French Clitic Movement without
Clitics or Movement. *NLLT* 15:573-639.

Monachesi, Paola. 1998. Decomposing Italian Clitics. In S. Balari and L.
Dini, eds, *Romance in HPSG* 305-571. CSLI Publications.

Penn, Gerald. 1999. A Generalized-Domain-Based Approach to
Serbo-Croatian Second Position Clitic Placement. In G. Bouma et al.,
eds, *Constraints and Resources in Natural Language Syntax and
Semantics* 119-136. CSLI Publications.

Last update: 2006-07-11 by JesseTseng [[edit](https://github.com/delph-in/docs/wiki/OpenissuesTop_GrammarMatrixClitic/_edit)]{% endraw %}