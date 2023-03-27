[test](www.up366.com)
another test
# Introduction

The purpose of these pages is to document the semantic representations
produced by the [English Resource Grammar](http://www.delph-in.net/erg)
(ERG; Flickinger 2000, 2011). The ERG is a broad-coverage,
linguistically motivated precision grammar for English, associating
richly detailed semantic representations with input sentences. These
representations, dubbed English Resource Semantics or ERS, are in the
formalism of Minimal Recursion Semantics (MRS; Copestake et al 2005).
They include not only semantic roles, but also information such as the
distinction between scopal and non-scopal arguments as well as semantic
representations of linguistically complex phenomena including time and
date expressions, conditionals, comparatives, and [many
others](ErgSemantics_Inventory). ERS can be expressed in various ways,
including a logic-based syntax using predicates and arguments,
dependency graphs, and dependency triples. In addition, the
representations can be obtained either from existing large collections
(of close to 1.5 million tokens) of manually curated annotations over
texts from a wide variety of genres (the [Redwoods
Treebank](RedwoodsTop); Oepen, et al., 2004; Flickinger, et al., 2012)
or by [processing new text](ErgProcessing) with the ERG and its
associated parsing and parse selection algorithms.

As an example, below is the ERS for the sentence *The garden dog tried
not to bark.*

<img src="http://svn.delph-in.net/erg/tags/1214/www/esd/the-garden-dog-tried-not-to-bark.png" title="http://svn.delph-in.net/erg/tags/1214/www/esd/the-garden-dog-tried-not-to-bark.png" class="external_image" alt="http://svn.delph-in.net/erg/tags/1214/www/esd/the-garden-dog-tried-not-to-bark.png" />

# Structure of the Documentation

The ESD pages are organized as a hyper-linked collection of smaller
documents, each typically discussing a specific semantic phenomenon or
particular set of higher-level considerations. ERG meaning
representations take the form of underspecified logical forms, adopting
the framework of Minimal Recursion Semantics (MRS; [Copestake, et al.,
2005)](https://www.cl.cam.ac.uk/~aac10/papers/mrs.pdf) The
[ErgSemantics/Essence](ErgSemantics_Essence) page provides a high-level
characterization of what you can expect to find in these meaning
representations. An informal introduction to MRS, its use by the ERG,
and basic terminology is provided by the
[ErgSemantics/Basics](ErgSemantics_Basics) page. Beyond these more
technical foundations, the [ErgSemantics/Design](ErgSemantics_Design)
pages discuss broader linguistic design decisions, for example
assumptions regarding quantification, or the notion of eventualities
assumed. For first-time consumers of ERG meaning representations, these
pages aim to establish the ‘scaffolding’ for the core of the ESD pages,
viz. a collection of pages that present individual semantic phenomena.
The ‘table of contents’ for this collection is available through the
[ErgSemantics/Inventory](ErgSemantics_Inventory) page, and the process
we followed for selecting phenomena to document is described on the
[ErgSemantics/Discovery](ErgSemantics_Discovery) page. We recommend
starting the exploration of these resources via the following links:

-   [High-Level Characterization](ErgSemantics_Essence)

-   [Semi-Formal and Terminological Basics](ErgSemantics_Basics)

-   [High-Level Linguistic Design Decisions](ErgSemantics_Design)

-   [Inventory of Individual Phenomena](ErgSemantics_Inventory)

# Semantic Fingerprints

In capturing semantic phenomena on most ESD pages (and hopefully also in
future work on automated regression testing) we invoke a notion of
*semantic fingerprints*, i.e. characteristics of a specific MRS
configuration that identifies a token phenomenon. We utilize a compact
template language for MRS fingerprints (similar in form to the MRS LaTeX
style; called ERS fingerprints when specialized for the semantic
analyses of the English Resource Grammar) that makes the specification
of labels and (characterization) links optional, and further allows
wild-carding of predicate symbols and role labels (using ‘\_’, i.e. just
an underscore). For example, following is the semantic fingerprint or
plain N–N compounding (as in *garden dog*):

      h:compound[ARG1 x1, ARG2 x2]
      h:[ARG0 x1]
      [ARG0 x2]

In other words, the phenomenon is characterized by the appearance of the
two-place compound relation, linking together another two EPs in the
configuration indicated by the shared label h (of the compound head and
the two-place modifier relation) and the shared referential indices x1
and x2. These fingerprints will match the example given above, as well
all other examples in the collection being searched analyzed as
involving N-N compounding.

There is a [search interface](http://wesearch.delph-in.net) for
‘fingerprinting’ collections of ERG analyses, i.e. use patterns provided
on ESD pages or own variants to retrieve instances of semantic phenomena
from the comprehensive collections of manually annotated ‘gold-standard’
treebanks that accompany the ERG. In particular, these treebanks include
a fresh re-annotation, dubbed
[DeepBank](http://wesearch.delph-in.net/deepbank), of the venerable WSJ
Corpus annotated in the Penn Treebank.

# ESD Test Suite

One aspect of the documentation produced in this work is a [test
suite](http://svn.emmtee.net/trunk/uio/wesearch/esd.txt) illustrating
each identified phenomenon with one or more short, simple sentences,
attempting to balance restricted vocabulary size with the clarity of the
intended reading of each example. This test suite can be viewed as an
extension of the [MRS Test Suite](MatrixMrsTestSuite).

# Summary

The ERG Semantic Documentation (ESD) initiative is an ongoing effort to
provide ‘end-user’ documentation on the meaning representations that
provide the interface to parsing and generation using the ERG. While ERG
meaning representations abstract to a large degree from semantically
irrelevant surface variation, it can at times be challenging to
interpret (and appreciate) the nuances of particular semantic analyses.
The ESD pages seek to provide an ever-growing ‘encyclopedia’ of semantic
analyses available from the ERG.

Additional background information is provided by [Flickinger, et al.
(2014)](http://www.lrec-conf.org/proceedings/lrec2014/pdf/562_Paper.pdf).
These pages are jointly maintained by Emily M. Bender, Dan Flickinger,
and Stephan Oepen, with input and feedback from, among others, Francis
Bond, Ann Copestake, and Alex Lascarides.

# How to Cite this Work

-   [How to Cite this Work](ErgSemantics_HowToCite)

# References

Copestake, A., Flickinger, D., Pollard, C., & Sag, I. A. (2005). Minimal
Recursion Semantics. An introduction. Research on Language and
Computation, 3(4), 281-332.

Flickinger, D. (2000). On building a more efficient grammar by
exploiting types. Natural Language Engineering, 6 (1), 15-28.

Flickinger, D. (2011). Accuracy vs. robustness in grammar engineering.
In E. M. Bender & J. E. Arnold (Eds.), Language from a cognitive
perspective: Grammar, usage, and processing (pp. 31-50). Stanford: CSLI
Publications.

Flickinger, D., Bender, E. M., & Oepen, S. (2014). Towards an
encyclopedia of compositional semantics: Documenting the interface of
the english resource grammar. In N. Calzolari et al. (Eds.), Proceedings
of the ninth international conference on language resources and
evaluation (LREC'14) (pp. 875-881). Reykjavik, Iceland: European
Language Resources Association (ELRA).

Flickinger, D., Zhang, Y., & Kordoni, V. (2012). [DeepBank](DeepBank). A
dynamically annotated treebank of the Wall Street Journal. In (p.
85-96). Lisbon, Portugal: Edições Colibri.

Oepen, S., Flickinger, D., Toutanova, K., & Manning, C. D. (2004). LinGO
Redwoods. A rich and dynamic treebank for HPSG. Research on Language and
Computation, 2(4), 575-596.
