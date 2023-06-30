{% raw %}# Parallel Corpora for DELPH-IN

Contents

1. [Parallel Corpora for DELPH-IN](https://delph-in.github.io/docs/summits/FeforParCorp#Parallel_Corpora_for_DELPH-IN)
   1. [Collections/Samples of available parallel
corpora](https://delph-in.github.io/docs/summits/FeforParCorp#Collections.2FSamples_of_available_parallel_corpora)
      1. [Europarl Corpus](https://delph-in.github.io/docs/summits/FeforParCorp#Europarl_Corpus)
      2. [OPUS: Technical Documentation (plus Europarl and European
Constitution)](https://delph-in.github.io/docs/summits/FeforParCorp#OPUS:_Technical_Documentation_.28plus_Europarl_and_European_Constitution.29)
      3. [The Sofie Treebank](https://delph-in.github.io/docs/summits/FeforParCorp#The_Sofie_Treebank)
      4. [The JRC-Acquis Multilingual Parallel
Corpus](https://delph-in.github.io/docs/summits/FeforParCorp#The_JRC-Acquis_Multilingual_Parallel_Corpus)
      5. [Cathedral and the Bazaar](https://delph-in.github.io/docs/summits/FeforParCorp#Cathedral_and_the_Bazaar)
      6. [Universal Declaration of Human
Rights](https://delph-in.github.io/docs/summits/FeforParCorp#Universal_Declaration_of_Human_Rights)
      7. [Scroogled](https://delph-in.github.io/docs/summits/FeforParCorp#Scroogled)
   2. [Some criteria for choosing a
corpus](https://delph-in.github.io/docs/summits/FeforParCorp#Some_criteria_for_choosing_a_corpus)

## Collections/Samples of available parallel corpora

### Europarl Corpus

- \- URL: <http://people.csail.mit.edu/koehn/publications/europarl/>
  
  \- [Samples of Europarl
Corpus](http://www.dfki.de/~frank/Europarl_sample) - Languages: da,
de, en, el, es, fi, fr, it, nl, pt, sv - Size per language: 600-700k
sents - Format: currently distributed over approx. 400 files -
Alignment: implicit by basename of file and relative position in raw
sentence-separated ascii files - Todo: complete cross-lingual
alignment (currently only pair-wise implicit alignment). Possibly we
can get something along these lines from Andreas Eisele.

### OPUS: Technical Documentation (plus Europarl and European Constitution)

\- URL: <http://logos.uio.no/opus/>

### The Sofie Treebank

\- The treebank was developed by the participants of the Nordic Treebank
Network, in which academic institutions from Denmark, Estonia, Finland,
Iceland, Norway, and Sweden took part. Information about status,
availability, formats and analyses can be found at - URL:
<http://www.hf.uio.no/tekstlab/prosjekter/SOFIE.html>

This is not redistributable:

- "Permission to use the corpus can be given to those signing an
agreement that they will only use the corpus for research,
development and teaching. A web-form will be available soon, in the
meantime, contact Lars Nygaard. If you already have got a
permission, click here to use the corpus."

Translations in other languages exist (including Japanese), which we may
be able to get permission for.

### The JRC-Acquis Multilingual Parallel Corpus

- \- URL: <http://langtech.jrc.it/JRC-Acquis.html#Introduction>

### Cathedral and the Bazaar

- \- URL: <http://catb.org/~esr/writings/cathedral-bazaar/>

We decided to use this as a corpus, the full description is now up at
[MatrixMrsCatb](https://delph-in.github.io/docs/grammars/MatrixMrsCatb).

### Universal Declaration of Human Rights

- \- URL: <http://www.unhchr.ch/udhr/navigate/alpha.htm>

The preamble (a multi paragraph sentence) is impossible, but apart from
that it isn't too difficult, and gets some nice universal quantifiers
and modals. It is a little short (65 sentences), but there are many
other declarations. There are 369 different translations (4 more than
last year), most of excellent quality --- the multilinguality is the
main selling point. It is freely available. There is a little synergy as
it is the de facto standard for testing Unicode fonts --- it should
print nicely.

### Scroogled

<http://craphound.com/?p=1902>

A short story with many free translations. It is a bit short: about 500
sentences.

## Some criteria for choosing a corpus

1. difficulty -- we need to have some hope of parsing it
2. size --- to build statistical models it has to be a certain size
3. quality --- the language should be natural (often a problem for
translations)
4. availability --- we need to be able to share the data
5. multilinguality --- it would be nice to have exisiting translations
6. relevance --- the genre should be one you are interested in
7. synergy --- it is nice to reuse/complement existing markup
8. diversity --- it can be interesting to experiment with a mixture of
corpora, of different text types

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/FeforParCorp/_edit)]{% endraw %}