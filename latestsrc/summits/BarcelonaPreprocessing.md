{% raw %}# Discussion: Advanced Pre-Processing

# Moderator: Ulrich Schäfer; Scribe: Peter Adolphs

# Objective

Besides parsing 'clean' standard corpora for treebanking etc., there
seems to be a growing interest and need to use HPSG parsing with
DELPH-IN tools for larger-scale processing of unseen real-world text
such as the content of scientific papers, Wikipedia, and newspaper
articles. There are various ways to improve parsing coverage by
pre-processing, e.g.

- shallow divide-and-conquer approaches (separating subclauses,
splitting long sentences, recognizing titles, addresses, tables,
figures)
- punctuation/sentence boundary detection
- text repair
- unknown word handling
- integration with PoS tagging and named entity recognition, use of
(interchangeable) external ontologies
- chart mapping
- coreference resolution
- ...

Some of these methods have been implemented as part of LKB, PET, Heart
of Gold, or project-specifically and can be characterized as absolute
prerequisites (still not always optimally solved or fitting to the
domain), others have the status of 'good idea but never done' or go into
the direction of application- or domain-oriented pre-processing.

The aim of this discussion is to collect and discuss the efforts that
have been made by member of the DELPH-IN community recently, maybe
prospectively even try to unify them. There seem to be more
good-practice solutions than have been published or made available as
downloadable tools. Participants are encouraged to briefly report on
their needs and solutions (maybe even with a slide). The slot partly
overlaps with the chart mapping tutorial by Peter Adolphs and the
robustness techniques tutorial by Yi Zhang. Moreover, I will present
some of the efforts conducted at our site in my presentation on
[HyLaP](http://hylap.dfki.de).

# Notes

- processing PDF
  - Ulrich: Using [Apache
PDFBox](http://incubator.apache.org/pdfbox/) in
[HyLaP](http://hylap.dfki.de/) and [TAKE](http://take.dfki.de/).
It is possible to retrieve layout information with PDFBox.
  - Francis: There is a pipeline developed within the [KYOTO
Project](http://www.kyoto-project.eu/) for converting PDF into
[KAF (KYOTO Annotation
Format)](http://xmlgroup.iit.cnr.it/kyoto/index.php?option=com_content&view=article&id=141&Itemid=130),
based on [Poppler](http://poppler.freedesktop.org/), which
returned in general the best results. Sharing welcome.
  - Mike: Good experience with
[PDFMiner](http://www.unixuser.org/~euske/python/pdfminer/index.html).
Good unicode support. Turned out to be useful to use font family
for identifying consequent text blocks and font sizes for
identifying further logical text structure (like headings, text
body, captions, etc.).
- sentence splitting
  - Gisle:
    - tried tokenizer from [NLTK](http://www.nltk.org/) but
results were not good enough
    - now using
[tokenizer](http://www.cis.uni-muenchen.de/%7Ewastl/misc/)
by Sebastian Nagel from CIS München, which is also open to
adaptation to other languages
  - Ulrich: using JTok by Jörg Steffen (DFKI); it is part of [Heart
of Gold](http://heartofgold.dfki.de/). Can be adapted.
- divide-and-conquer approaches:
  - Dan: Gertjan van Noord in Alpino uses divide-and-conquer
strategy, with home-grown machinery, with good success. He is
supposed to use external tools he adapted to his needs.
  - Dan: We really need to consider divide-and-conquer strategies.
Especially for [WeScience](https://delph-in.github.io/docs/garage/WeScience), the biggest chunk of the
sentences in the 50-60 token length fail because of hitting the
resource limits. For half of the sentence where we don’t get a
parse, we hit a resource limit.
  - Berthold: Try the topoparser approach developed within the
Whiteboard project. PET was guided by shallow topological parser
output. Code is not in PET anymore, but Bernd Kiefer should
still have a copy of it.
  - Dan: We should evaluate what others are doing in this area.
  - Dan: We could enter chart items of length 0 to indicate chunk
borders, with a similar effect as punctuation right now.
  - Stephan: Something similar is currently done to preserve italic
markup.
- citations
  - Dan: planning to implement token mapping rules for treating
references and citations pretty soon (with a focus on
[WeScience](https://delph-in.github.io/docs/garage/WeScience)). Should not be difficult, since they
follow a quite restricted language, that might vary a bit though
between different sources. Definitely, they should be part of
the grammar.
  - Ulrich: using [parsCit](http://aye.comp.nus.edu.sg/parsCit/) so
far for finding references in the text. Problem: the output of
[parsCit](http://aye.comp.nus.edu.sg/parsCit/) seems to contain
only a generated reference string that often doesn't match the
original reference string.
  - Richard (answering Dan): in
[SciBorg](http://www.cl.cam.ac.uk/research/nl/sciborg/www/),
references and citations were ignored.
- coreference resolution
  - Problem: loosing a lot of sentence where pronouns are used to
refer back to some entity mentioned before. Relevant to all
sorts of IE tasks.
  - Ulrich: currently evaluating different tools for coref
resolution
  - Dan: Ann has been experimenting with semantics-based anaphoric
binding in
[SciBorg](http://www.cl.cam.ac.uk/research/nl/sciborg/www/).
Supposed to be ready in a couple of months.
  - Stephan: doctoral fellow in Oslo (Gordana Ilić Holen) will look
into coreference resolution soon. She considers building on the
[BART](http://www.sfs.uni-tuebingen.de/~versley/BART/) toolkit.
  - Bart: Charniak told him that the BART toolkit didn't return good
results for pronoun resolution. Bart also pointed out it's not
his fault.
  - Rebecca: Charniak is currently working on his own solution to
coref resolution.
  - Dan: Ann was planning to do some implementation on coreference
resolution on top of MRS.
- word-sense disambiguation
  - Francis: disambuation of [WordNet](/WordNet) senses:
    
    - [WordNet::Similarity](http://www.d.umn.edu/~tpederse/similarity.html)
by [Ted Pedersen](http://www.d.umn.edu/~tpederse/)
    - [UKB: Graph Based Word Sense Disambiguation and
Similarity](http://ixa2.si.ehu.es/ukb/), written in C, GPL
    - Francis himself plans to do something in the KYOTO project
on disambiguation of [WordNet](/WordNet) senses, based on
bilingual resources; willing to cooperate with other
DELPH-IN members
    - chicken and egg problem: people have shown a) disambiguated
word senses helps parsing and b) parsing helps word sense
disambiguation

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/BarcelonaPreprocessing/_edit)]{% endraw %}