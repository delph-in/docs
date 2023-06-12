{% raw %}# Background

LTG staff actively participates in the informal, multi-national research
collaboration on [Deep Linguistic Processing with HPSG
Initiative](http://www.delph-in.net) (DELPH-IN). At the annual
DELPH-IN Summit (i.e. gathering of the clique), partners often give
overviews of (more or less) relevant developments at individual sites.
This page is intended to develop into a stream of LTG updates related to
DELPH-IN.

# 2017 Site Update

Continuous, if sometimes low-energy: [ERG Semantic
Documentation](https://delph-in.github.io/docs/erg/ErgSemantics); [MRS-derived dependencies](https://delph-in.github.io/docs/tools/EdsTop) (in
2017 so far, [SDP](http://sdp.delph-in.net) about as popular as the
PCEDT; four papers and one keynote at ACL use ERG-based dependencies);
1214 [WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods) release imminent: new, ‘atomic’ export
format.

Ongoing doctoral project (Murhaf Fares): Joint learning for the
identification, bracketing, and thematic interpretation of nominal
compounds.
[Comparison](http://folk.uio.no/murhaff/nnbracketing/bracketing.html) of
bracketing in [DeepBank](https://delph-in.github.io/docs/garage/DeepBank), PCEDT, and PTB.

Completed MSc project (Kjetil Bugge Kristoffersen): Extract
‘high-quality’ corpus from Common Crawl: 130 billion tokens of English.

Sabbatical Syndrome Recovery:
[SynSem](https://cas.oslo.no/research-groups/synsem-from-form-to-meaning-integrating-linguistics-and-computing-article1805-827.html)
umbrella will bring together DELPH-IN and [ParGram](/ParGram) folks with
other NLP researchers in the academic year 2017–18 (as well as sponsor
the 2017 DELPH-IN Summit).

New initiative: [Nordic Language Processing
Laboratory](http://vectors.nlpl.eu) (NLPL). Among other things:
repository of very large corpora and re-usable word embeddings; on-line
explorer for semantic similarity and analogy; generic infrastructure for
[Extrinsic Parser Evaluation](http://epe.nlpl.eu) (EPE).

# 2016 Site Update

Currently not much funded project activity with near-exclusive focus on
DELPH-IN technologies; Linguistic Analysis Portal (LAP) now (almost) [in
production](http://lap.clarino.uio.no); ERG parsing stack to be
integrated in the next twelve months.

Angelina Ivanova has defended her [doctoral
thesis](https://www.duo.uio.no/handle/10852/48673), which contains some
encouraging results for grammar-based parsing; in-depth summary of
parser comparison recently published in [Journal of Language
Modelling](http://jlm.ipipan.waw.pl/index.php/JLM/article/view/101).

[Semantic Dependency Parsing](http://sdp.delph-in.net) tasks at
[SemEval](/SemEval) 2014 and 2015 attracted some 15 teams; emerging
visibility of ERG-derived (bi-lexical) semantic dependencies. All target
representations now available via the LDC; open-source sub-set available
for public download.

[WeSearch services](http://wesearch.delph-in.net) re-worked recently;
now client-side visualization (generic JavaScript packages) and semantic
dependencies. The code is [available](http://svn.delph-in.net/wsi/)
under an open-source license.

New, work-in-progress RESTful
[interface](http://erg.delph-in.net/rest/0.9/parse?derivation=json&input=Abrams%20arrived.)
to ERG on-line parser; see [ErgApi](https://delph-in.github.io/docs/erg/ErgApi) page.

ERG 1214 release, finally official (as of June 15, 2016).

Ongoing work on generation from Elementary Dependency Structures (later
on the programme).

# 2014 Site Update

The
[WeSearch](http://www.mn.uio.no/ifi/english/research/projects/wesearch/)
project (on methods for parser adaptation to user-generated content) is
wrapping up at the end of this year: Angelina is writing up her thesis;
Bec will be moving on (and will present on domain variation later in the
week).

LAP about six months behind schedule; working prototype, but not yet
publicly accessible; DELPH-IN technologies remain to be integrated.
Preparing to contribute to ToE initiative this fall: European Parliament
proceedings with meta-information and (linguistic) annotation; all coded
in RDF.

\[to be completed\]

Angelina

Milen Kouylekov

Arne Skjærholt

Norveig Eskelund

NeIC

# 2013 Site Update

Two funded projects currently use and extend DELPH-IN technologies,
[WeSearch](http://www.mn.uio.no/ifi/english/research/projects/wesearch/)
(on methods for parser adaptation to user-generated content) and
[LAP](http://www.mn.uio.no/ifi/english/research/projects/clarino/) (the
Language Analysis Portal, part of the Norwegian CLARIN(O) initiative).

Work in [WeSearch](https://delph-in.github.io/docs/garage/WeSearch) by AngelinaIvanova (on
relating bi-lexical dependency representations and DELPH-IN HPSG
analyses), by RebeccaDridan (on, among things,
ubertagging for faster and more accurate parsing), and by
StephanOepen and off-site collaborators (on working
towards documentation of ERG Semantic Analyses) are presented
individually at the 2013 Summit.

Another [WeSearch](https://delph-in.github.io/docs/garage/WeSearch) activity has been collaborative work with
DanFlickinger on enabling the ERG to analyse inputs
annotated (optionally) with (two types of) candidate phrase boundaries,
or candidate target bi-lexical dependencies. Following are some example
inputs (using GML mark-up; see below) that exemplify this functionality:

      She met the ⌊(⌋cat in the hotel.⌊)⌋
      She met the ⌊(⌋cat in the hotel⌊)⌋.
      the cat saw⌊←¦sb-hd⌋ runs.
      the cat saw⌊←¦sb-hd¦<29:34>⌋ runs.

This functionality is not in the 1212 release of the ERG but currently
coming together in the ERG *trunk*; in a first instance, it will be
validated in in-house projects at LTG.

In the LAP context, there now is a [live pilot
portal](http://lap.clarino.uio.no) providing Web access to
pre-configured tokenization, PoS tagging, and syntactic dependency
parsing tools for English and Norwegian (running on a Norwegian national
supercomputer, i.e. potentially making available high-performance
computing capabilities to non-technical users). The LAP architecture is
based on the LAF (Linguistic Annotation Framework) data model, but using
a distributed NoSQL database as the annotation store, where components
record and retrieve annotatons from earlier components in complex
workflows. In the year to come, it is expected that the core
DELPH-IN toolchain will be made available through the LAP.

Finally, two recent MSc projects at LTG have contributed to DELPH-IN
advancement. [Solberg (2012)](https://www.duo.uio.no/handle/10852/34914)
develops a generic infrastructure for extracting ‘*relevant linguistic
content*’ from Wikipedia dumps, preparing a forthcoming new revision 2.0
of the [WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods) Corpus, seeking to address some of the
shortcomings in the (somewhat ad-hoc and overly surface-orientated)
original procedure used in the construction of [WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods)
1.0. A side-effect of this project is an updated definition of the
[Grammar Markup Language](https://delph-in.github.io/docs/tools/ErgGml), an attempt at allowing non-intrusive
in-line mark-up of layout information that may be relevant to parsing.

In another recently completed MSc thesis, [Fares
(2013)](http://www.delph-in.net/2013/ltg/Fares:13.pdf) applies machine
learning (binary, CRF-based classification) to the tasks of
*tokenization* (i.e. deciding on token boundaries, in either the
PTB-like *initial* tokenization scheme, or the ERG-defined *lexical*
scheme) and *lexical categorization* (i.e. assigning morpho-syntactic
categories to lexical tokens). In this work, he advances the state of
the art in PTB-style tokenization, achieves nearly 95% sentence accuracy
for lexical tokenization, and about 93% token-level accuracy in
assigning ERG lexical types. When putting these together, i.e. parsing
inputs with disambiguated ERG tokenization and annoated with lexical
types (selectively, i.e. only constraining the parser when lexical
categorization was above an experimentally set confidence threshold),
improvements in parsing effiency of factors between two and three were
obtained, with mildly increased coverage (due to fewer time-outs) and
moderately better parse selection accuracy (due to the reduced search
space). End-to-end parsing results for these experiments are presented
in the slides from his [MSc
presentation](http://www.delph-in.net/2013/ltg/fares.slides.pdf).

Last update: 2017-08-09 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/LtgOslo_Delphin/_edit)]{% endraw %}