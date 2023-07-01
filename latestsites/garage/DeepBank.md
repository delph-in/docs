{% raw %}# DeepBank

This page describes the [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) project, which has produced
linguistically rich syntactic and semantic annotations of Wall Street
Journal newspaper text, now available in several output formats, as
version 1.0. For downloads and details of the output formats, please see
this [MetaShare
site](http://metashare.dfki.de/repository/browse/deepbank/d550713c0bd211e38e2e003048d082a41c57b04b11e146f1887ceb7158e2038c/).

Contents

1. [DeepBank](https://delph-in.github.io/docs/garage/DeepBank#DeepBank)
   1. [Background](https://delph-in.github.io/docs/garage/DeepBank#Background)
   2. [Development Methodology](https://delph-in.github.io/docs/garage/DeepBank#Development_Methodology)
   3. [Stages of Development](https://delph-in.github.io/docs/garage/DeepBank#Stages_of_Development)
   4. [Version 1.0: Available
Formats](https://delph-in.github.io/docs/garage/DeepBank#Version_1.0:_Available_Formats)
   5. [Acknowledgements](https://delph-in.github.io/docs/garage/DeepBank#Acknowledgements)
   6. [Publications](https://delph-in.github.io/docs/garage/DeepBank#Publications)

<a name="Background"/>


## Background

The **[DeepBank](https://delph-in.github.io/docs/garage/DeepBank)** project has the goal of annotating the one
million words of 1989 Wall Street Journal text (the same set of
sentences annotated in the original Penn Treebank project) with the
English Resource Grammar, augmented with a robust approximating PCFG for
complete coverage. [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) contains rich linguistic
annotation on both syntactic and semantic structures of the sentences
and is available in a variety of representation formats (see the
description on formats below).

The project is hosted at the Department of Computational Linguistics of
Saarland University and the Language Technology Lab of the German
Research Center for Artificial Intelligence in Saarbrücken, Germany, and
in close collaboration with CSLI Stanford. Other institutes, including
(but not limited to) Humboldt University of Berlin and University of
Oslo, have also contributed to the development and release of the
resource. In the long term, the [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) will be further
supported by the DELPH-IN community with updates and maintenance.

<a name="Development_Methodology"/>


## Development Methodology

The project is technically built on top of resources developed in the
long-term grammar and software engineering effort maintained under the
collaborative umbrella of DELPH-IN. Following earlier practice in the
development of Redwoods treebanks, manual annotations are done using the
discriminant-based treebanking environment provided by [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) to identify the correct full
analysis among the candidate analyses proposed by the English Resource
Grammar.

For the first public release of [DeepBank](https://delph-in.github.io/docs/garage/DeepBank), most of the data
has gone through at least two rounds of human annotation with
independent annotators. Also, the linguistic analyses in
[DeepBank](https://delph-in.github.io/docs/garage/DeepBank) were made independently from the previous treebank
annotations of the same data (i.e. PTB), distinguishing it from
PTB-derived treebanks including the Enju HPSG treebank, CCGBank, and the
CoNLL syntactic dependency bank, to name a few.

For completeness of the annotations over the full corpus, the public
release of [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) also includes analyses (trees) licensed
by an approximating PCFG for the sentences of the WSJ corpus not
correctly analysed by the current version of the
[ERG](http://www.delph-in.net/erg). Semantic structures are also
composed robustly for these sentences, which comprise some 15% of the
50,000-sentence total.

<a name="Stages_of_Development"/>


## Stages of Development

The development of [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) started in the fall of 2008 as
an internally funded project at the Department of Computational
Linguistics, Saarland University and the LT-Lab of DFKI, under the
supervision of Valia Kordoni and Yi Zhang.
Thanks to the partial financial support of the Erasmus Mundus European
Masters Program in Language and Communication Technologies (LCT),
part-time student annotators were employed and trained for the first
round of annotation. Dan Flickinger, the main
[ERG](http://www.delph-in.net/erg) developer, has provided grammar
updates throughout the project. He also went through a thorough (second)
round of annotation updates to arrive at the first public release of
[DeepBank](https://delph-in.github.io/docs/garage/DeepBank). Both the ERG and [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) have
significantly evolved over the years of the project, but the dynamic
nature of the annotation method has kept them synchronized through the
update cycles.

By the summer of 2012, the development of [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) reached a
mature stage where a significant amount of the data had gone through two
rounds of careful annotation. The resource was made available for
internal DELPH-IN review (alpha release) by several sites, including the
University of Oslo, the University of Washington, Melbourne University,
the University of Barcelona, then Bulgarian Academy of Science, and the
University of Lisbon. Many suggestions and detailed feedback helped in
preparation for the first full public release of [DeepBank](https://delph-in.github.io/docs/garage/DeepBank).

At the end of November 2012, a substantial portion of
[DeepBank](https://delph-in.github.io/docs/garage/DeepBank) (WSJ sections 00-15) was made open for public
preview through a beta release announced at TLT in Lisbon. The beta
version (v0.9) is still available for download upon
[request](http://www.coli.uni-saarland.de/projects/deepbank/request.cgi).
This beta-release only includes annotation for WSJ sections 00-15 in the
original [\[incr tsdb()\]](http://www.delph-in.net/itsdb) format.
Further sections and other formats are included in the public release,
v1.0, described below.

<a name="Version_1.0:_Available_Formats"/>


## Version 1.0: Available Formats

The public release (v1.0) of [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) includes annotation in
multiple formats. The combination of the raw [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) profiles with a corresponding
version of the ERG enables automatic reconstruction of all detailed
analyses. The HPSG [derivations](https://delph-in.github.io/docs/tools/ItsdbDerivations) and the
[MRSes](https://delph-in.github.io/docs/tools/MrsRFC) are recorded in these profiles and can be extracted
directly.

For convenience of usage, [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) is also available in
other representation formats (though not all details are preserved in
the converted representations), including the (modified) Penn-style
constituent tree representation with labeled brackets, and the
CoNLL-style syntactic and semantic dependency representation with
*tabbed* format. The conversion software is available to the public and
maintained collaboratively between Oslo and Saarbrücken. Please see
[DeepBank/OneZero](https://delph-in.github.io/docs/garage/DeepBank_OneZero) for further details.

Downloads are available through [MetaShare](/MetaShare) at [this
site](http://metashare.dfki.de/repository/browse/deepbank/d550713c0bd211e38e2e003048d082a41c57b04b11e146f1887ceb7158e2038c/).

For further information or feedback, please feel free to subscribe to
the [mailing list](http://lists.delph-in.net/mailman/listinfo/deepbank),
or contact the developers.

<a name="Acknowledgements"/>


## Acknowledgements

The primary work on the development of this resource was initiated and
carried out through [CoLi](/CoLi) and the DFKI in Saarbrücken, including
project organization and management, the first rounds of treebank
construction, the PCFG approximations for non-ERG-parsed items, and some
exports to alternative formats. Additional contributions were made at
the Center for the Study of Language and Information (CSLI) at Stanford
University, for improvements to the ERG and a second round of treebank
annotations; and at the University of Oslo in several enabling roles,
including preparation of the raw text, tokenization technology and
rules, parsing, support for the annotation tools, partial funding of the
annotation effort at Stanford, and packaging of the resulting
annotations. Ongoing support and expansion of this resource will be
provided by these three institutions, together with Humboldt University
as a participating institution in the ongoing QTLeap project.

We are grateful to the [Erasmus Mundus European Masters Program in
Language and Communication Technologies](http://lct-master.org/) (LCT,
EM Grant Number: 2007-0060) for financial support of the project in
Saarbrücken, and to the [WeSearch: Language Technology for the
Web](http://www.mn.uio.no/ifi/english/research/projects/wesearch/)
project for support of the contributions made at the University of Oslo
and, in part, funding of work at Stanford.

We are equally grateful to the following student annotators for their
diligent and patient work. All remaining errors in the treebank are of
course ours.

- Ming Wen
- Maria Sukhareva
- Lea Frermann
- Iliana Simova

The involvement of Yi Zhang in the project is also partially sponsored
by the [German Cluster of Excellence on "Multimodal Computing and
Interaction"](http://www.mmci.uni-saarland.de/) (MMCI) funded by the
DFG, and the [Deependance](http://deependance.dfki.de/) project funded
by BMBF (01IW11003).

<a name="Publications"/>


## Publications

1. Dan Flickinger, Valia Kordoni and Yi Zhang. [DeepBank](https://delph-in.github.io/docs/garage/DeepBank): A
Dynamically Annotated Treebank of the Wall Street Journal. In
Proceedings of TLT-11, Lisbon, Portugal, 2012.
2. Stephan Oepen, Dan Flickinger, Kristina Toutanova, and
Christopher D. Manning. LinGO Redwoods: A Rich and Dynamic Treebank
for HPSG. In Journal of Research on Language and Computation 2.4,
pages 575-596. 2004.
3. Angelina Ivanova, Stephan Oepen, Lilja Øvrelid, and Dan Flickinger.
Who did what to whom? a contrastive study of syntacto-semantic
dependencies. In Proceedings of the Sixth Linguistic Annotation
Workshop, pages 2–11, Jeju, Republic of Korea, 2012.
4. Yi Zhang and Hans-Ulrich Krieger. Large-scale corpus-driven PCFG
approximation of an HPSG. In Proceedings of the 12th International
Conference on Parsing Technologies, pages 198–208, Dublin,
Ireland, 2011.
5. Yi Zhang, Valia Kordoni. Discriminant Ranking for Efficient
Treebanking. In Proceedings of the 23rd International Conference on
Computational Linguistics (Coling 2010), Beijing, China, 2010.
6. Valia Kordoni, Yi Zhang. Disambiguating Compound Nouns for a Dynamic
HPSG Treebank of Wall Street Journal Texts. In Proceedings of the
Seventh conference on International Language Resources and
Evaluation (LREC'10), Malta, 2010.
7. Valia Kordoni, Yi Zhang. Annotating Wall Street Journal Texts Using
a Hand-Crafted Deep Linguistic Grammar. In Proceedings of the Third
Linguistic Annotation Workshop, Singapore, 2009.

Last update: 2022-11-01 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/DeepBank/_edit)]{% endraw %}