{% raw %}# Parallel Corpora for Grammar Evaluation

During our recent DELPH-IN meeting in Berlin, many of our participants
have agreed on a joint exercise of creating parallel corpora/treebanks
for multiple languages, in order to facilitate cross-lingual grammar
evaluation. As a first step, participants may edit this page to link to
their collected texts, and provide a basic description of the data
(addressing, among other things, the source of the texts, license
status, level of cross-lingual parallelism, etc.). You are also welcome
to contribute your ideas under the section *Individual Reflections*.
Please bear the following time table in mind.

- Raw Text Collection Deadline: 30th November, 2007

|                    |                    |             |           |
|--------------------|:------------------:|:-----------:|-----------|
| Language           | Participant Group  | Description | Data Link |
| Catalan (ca)       |     Barcelona      |             | TBA       |
| Chinese (zh)       |    Saarbrücken     |             | TBA       |
| English (en)       |   Stanford/Oslo    |             | TBA       |
| French (fr)        |      Toulouse      |             | TBA       |
| German (de)        |    Saarbrücken     |             | TBA       |
| Greek, Modern (el) | Saarbrücken/Athens |             | TBA       |
| Japanese (ja)      |       Kyoto        |             | TBA       |
| Korean (ko)        |       Seoul        |             | TBA       |
| Norwegian (no)     |     Trondheim      |             | TBA       |
| Portuguese (pt)    |       Lisbon       |             | TBA       |
| Spanish (es)       |     Barcelona      |             | TBA       |
| Swedish (sv)       |     Linköping      |             | TBA       |

There was some discussion of this subject at Fefor in 2006:
[FeforParCorp](https://delph-in.github.io/docs/summits/FeforParCorp). This includes several candidate corpora,
and some desiderata for choosing a text.

- I (FrancisBond) have filled out the description of
the "Cathedral and the Bazaar" test set at
[FeforParCorp](https://delph-in.github.io/docs/summits/FeforParCorp).
  
  - This is an essay on open source software, consisting of about
800 sentences. The main advantages are (a) it is released under
a free license, and the author is happy for us to use it; (b)
there are existing translations in all the languages we
currently want (and more); (c) other similar essays exist if we
want more data; (c) it is not as mind-boggling dull as some
corpora. The main disadvantages are (a) the source (English) has
gone through many versions, not all translations are up-to-date.
It would require a little work to make all the translations
match the current English version, I estimate about 1-200
sentences may need to be translated for some languages. (b) not
everyone wants to read one person's opinions about open source
software.

# Individual Reflections

## Stephan Oepen

Obviously, establishing a parallel corpus within DELPH-IN would have
many advantages, and it would likely pull participants and grammar
development more closely together. Each group has their own history,
interests, and constraints imposed by how they fund their work; hence,
it cannot be the expectation that everyone focus their efforts on the
same parallel corpus, but: (a) in some cases grammarians are relatively
free in deciding on their target domain, genre, et al., and then it
would be great if DELPH-IN could take advantage of such freedom and have
multiple efforts work on comparable data; (b) designed as resource
grammars, typical DELPH-IN efforts tend to avoid specialization to a
single domain or genre, thus even for a project working on its own
domain, it may be beneficial to devote some additional effort on a
different target text or texts, e.g. ones taken from the DELPH-IN
parallel corpus; and, finally, (c) with a growing interest in machine
translation among participants, it will be a lot easier to build
prototype systems and compare MRSs across grammars, where there has been
at least some development effort on a parallel corpus.

I would recommend the following criteria in looking for candidate texts:

- Following the DELPH-IN philosophy, we should be able to share
parallel texts freely among participants and re-distribute results;
it is possible to use copyrighted material, but then we should try
to obtain permission from the copyright holder to redistribute
freely.
- To establish an initial parallel DELPH-IN corpus, we do not require
large amounts of text; I would estimate that an initial collection
of, say, 1000 sentences (translated across many or all of the
languages in DELPH-IN) could be incredibly useful. Ideally, we would
draw on text where additional volume could be obtained if need be.
- It would be nice to have the parallel corpus exemplify a certain
degree of linguistic variation, e.g. include at least some
interrogatives and imperatives. At the same time, the style of the
corpus, ideally, should reflect current language use and preferably
not correspond to a very specialized variant (e.g. Wall Street
Journal English of the 1980s or, arguably, transcripts of parliament
debates).
- If at all possible, we should look for texts that already are
available in multiple languages, ideally as high-quality
translations from a single source. For small-ish amounts of text, it
may well be feasible to contract professional translations for
additional languages. As we envision a growing parallel DELPH-IN
corpus, it is desirable that there are segments with different
source languages, e.g. not everything should be translated from
English originals.
- Even though current grammars focus on sentential units, I believe
that the successful application of DELPH-IN technology typically
assumes a certain degree of fine-tuning to one target domain and
genre. This is especially true in aspects of pre-processing and
disambiguation, i.e. in stochastic parse selection we have reason to
expect that it is better to train domain-specific models, assuming
some reasonably coherent notion of domain (and genre). Hence, I
would recommend looking for running text from one source or a
coherent set of sources.
- To the extent that participants are interested in applications of
DELPH-IN technology, I find it attractive to search for a parallel
corpus where the domain and genre potentially carry a well-defined
application. Granted, in the EU at least, parliament debates tend to
be translated into many languages, but newspapers typically do not
get translated. Parsing the Wall Street Journal (or the like), I
find an artificial task, as it is hard to point to an NLP
application in this spirit.

At the Fefor and Berlin meetings, various text sources had been
proposed. There is at least one open-source advocacy text, [The
Cathedral and the
Bazar](http://www.catb.org/~esr/writings/cathedral-bazaar/), freely
available in many languages, even though it is not quite clear how to
envision an application around this kind of text. Open-source software
documentation is another candidate source of parallel text, and being
able to process it would have obvious applied value. However, often
(computer) manuals are not produced as direct translations, hence there
may be limits to parallelism; plus linguistic variation may be somewhat
restricted.

Works of art, specifically ones where the copyright has expired could be
candidate sources, e.g. *Pride and Prejudice* or *A doll's House*,
although it is not obvious to me which translations exist (freely), and
how relevant variation in national copyright laws would be. Also, a
large number of free translations of the bible are available, some
probably in contemporary language variants.

My personal favorite are tourism-related texts, e.g. the materials
produced for international events (say The Olympics or World Cup) or
large cities (Athens, Barcelona, Berlin, Lisboa, Oslo, Paris, San
Francisco, Seoul, Kyoto, you name it). These are instructional texts
(*How to get there?*, *Where to stay?*, *How to get around?*) that are
often prepared and translated with great care (at great expense). The
producers want such texts to be widely distributed, so getting
permission should be possible. And, over time and around the world, such
texts are produced in many source languages.

## Francis Bond

I would support work on multiple corpora if we can find them. If we
can't find anything better, then let's start with the Cathedral and the
Bazaar, it fulfills our most important requirements (multi-linguality,
availability) even though I agree it is hard to link it to an
application.

I am afraid that finding a corpus containing all the current languages
for which we have grammars is extremely difficult. The Opus corpus's
approach of looking at open-source manual documentation seems to be the
most promising, but our experience with the KDE corpus was that the
Japanese translations were not well aligned at all, normally being one
or two versions behind the English. Because annotation is so expensive,
I think it would be important to look for an application whose
documentation translations are up-to-date for most of the languages we
want. One candidate is the Emacs tutorial emacs/etc/tutorial, which is
about 600 sentences. It is available for most (but not all) of the
languages we want (bg, cn, cs, de, es, en, fr, it, ja, ko, nl, pl,
pt\_BR, ro, ru, sk, sl, sv, th, zh: missing ca, el, no, pt) translating
it into more would be a public service. As do most such documents, it
has a fair bit of hairy non-text.

I would welcome a freely redistributable corpus of tourism-related
texts, but am slightly skeptical of our chances of finding a collection
including Catalan, Norwegian and Korean, even without worrying about
licenses.

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/EvaluationParCorp/_edit)]{% endraw %}