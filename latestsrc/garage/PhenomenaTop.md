{% raw %}Contents

1. [Overview](https://delph-in.github.io/docs/garage/PhenomenaTop#Overview)
   1. [Relevant discussions from past
summits](https://delph-in.github.io/docs/garage/PhenomenaTop#Relevant_discussions_from_past_summits)
2. [ERG Semantic Documentation](https://delph-in.github.io/docs/garage/PhenomenaTop#ERG_Semantic_Documentation)
3. [Phenomenon Corpus](https://delph-in.github.io/docs/garage/PhenomenaTop#Phenomenon_Corpus)
4. [Typediff](https://delph-in.github.io/docs/garage/PhenomenaTop#Typediff)
5. [Phenomenon Catalogue](https://delph-in.github.io/docs/garage/PhenomenaTop#Phenomenon_Catalogue)

# Overview

This page is intended to collect together various endeavours in the
DELPH-IN community relating to documenting and exploring linguistic
phenomena within DELPH-IN grammars. Please add your project to the list
or add any missing information to any of the existing entries.

## Relevant discussions from past summits

- [SuquamishPhenomenaCatalogue](https://delph-in.github.io/docs/summits/SuquamishPhenomenaCatalogue)
- [SofiaLinguisticPhenomena](https://delph-in.github.io/docs/summits/SofiaLinguisticPhenomena)
- [SaarlandPackagingPhenomenalCorpora](https://delph-in.github.io/docs/summits/SaarlandPackagingPhenomenalCorpora)

# ERG Semantic Documentation

This project is an attempt at working towards an ‘encyclopedia’ of
semantic analyses developed in the ERG. For more information see the
[ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) page.

# Phenomenon Corpus

This project is aiming to create a corpus annotated with linguistic
phenomena independently of existing grammars for the purposes of
investigating techniques into automatically detecting linguistic
phenomena within grammars. An English phenomenon corpus based on
[DeepBank](https://delph-in.github.io/docs/garage/DeepBank) and focusing on syntactic and morphosyntactic
phenomena is currently being developed by NedLetcher,
TimBaldwin and EmilyBender. For further
details and background, please see the paper *Constructing a Phenomenal
Corpus: Towards Detecting Linguistic Phenomena in Precision Grammars* in
the [proceedings of the Workshop on High-level Methodologies for Grammar
Engineering
2013](https://www.univ-orleans.fr/lifo/evenements/HMGE13/proceedings_HMGE13.pdf).

A dedicated page will be coming soon. Contact NedLetcher
for more information.

# Typediff

[Typediff](https://delph-in.github.io/docs/garage/TypediffTop) is a tool for exploring the types employed in
the processing of input to DELPH-IN grammars. Typediff works by
extracting the type identifiers found in the final AVM of a successful
parse and sorting this bag of types according to HPSG-theoretic type
categories such as 'sign' and 'synsem'. This data (which is not
otherwise readily available) can be further refined through two
different means in order to identify types correlated with linguistic
phenomena of interest. One is the ability to perform a 'diff' of the set
of types extracted from two different sentences: a sentence exemplifying
a phenomenon and an otherwise similar sentence not exhibiting this
phenomenon. The other feature is that types can be sorted in ascending
order of coverage over a treebank, with the assumption being that more
phenomenon-specific types will occur less frequently in a corpus.

# Phenomenon Catalogue

The idea behind this project was for grammar writers to choose 100
phenomena covered by their grammar and provide illustrative examples in
IGT for each phenomenon. The intention is to facilitate cross-grammar
comparison, grammar exploration and potentially even better grammar
documentation with phenomenon labels on constraints. Originally
[discussed](https://delph-in.github.io/docs/summits/SuquamishPhenomenaCatalogue) at the Suquamish summit,
currently there is only a [partial catalogue for the Wambaya
grammar](https://delph-in.github.io/docs/summits/WambayaPhenomenaCatalogue). Grammar maintainers interested in
developing a catalogue are very much encouraged to do so.

Last update: 2013-11-29 by NedLetcher [[edit](https://github.com/delph-in/docs/wiki/PhenomenaTop/_edit)]{% endraw %}