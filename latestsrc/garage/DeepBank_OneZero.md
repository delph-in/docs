{% raw %}# Background

This page documents Version 1.0 of [DeepBank](https://delph-in.github.io/docs/garage/DeepBank), released in
October 2013. In this release, there are annotations for Sections 00–21
of the venerable Wall Street Journal (WSJ) text from the Penn Treebank
(PTB). The selection of sentences included in [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) is
aligned with the PTB, but otherwise it is fully independent of the
original PTB annotations; i.e. none of the linguistic information in
[DeepBank](https://delph-in.github.io/docs/garage/DeepBank) is derivative of the PTB.

[DeepBank](https://delph-in.github.io/docs/garage/DeepBank) annotations are distributed through the
[META-SHARE](http://www.meta-share.eu/) infrastructure, under the
META-SHARE Commons Attribution Share-Alike license, which allows
adaptation and re-distribution of the resource, provided that the use of
[DeepBank](https://delph-in.github.io/docs/garage/DeepBank) is appropriately acknowledged and its license terms
preserved.

For communication with [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) developers and users, there
is an archived [mailing
list](http://lists.delph-in.net/archives/deepbank/) at
deepbank@delph-in.net.

# Tokenization Conventions

# Treebank Counts

Sections 00–21 comprise a total of 43,541 sentences, of which 37,085 (or
85.2%) have manually validated HPSG analyses. In a small number of cases
(167 sentences), there is more than one gold-standard HPSG analysis; for
another 27 sentences (not overlapping with the ambiguously annotated
cases), the annotator has indicated a minor deficiency in the HPSG
analysis. To reflect this latter distinction, we occasionally talk about
gold- vs. silver-standard annotations.

For the almost 15% of sentences for which the HPSG system either did not
provide any candidate analyses (within certain bounds on time and
memory), or where all available analyses were rejected during
annotation, we seek to fill the resulting ‘coverage gap’ in the treebank
through automated parsing with the robust, approximative parser of Zhang
& Krieger (2011). For another 5,927 sentences (or 13.6%), this release
includes what Zhang & Krieger (2011) dub HPSG *pseudo-derivations*, i.e.
a derivation tree similar in form and content to the ones produced by
the full HPSG parser, but potentially combining constructions and
lexical entries for which the unification of the full HPSG constraints
would fail. For these reasons, some percentage of these robust analyses
are lost in the various derived formats, as with increasing degrees of
inconsistency in the pseudo-derivations it may be impossible to convert
to the other formats (see below).

529 sentences (1.2%) from these 22 sections of the WSJ text have no
analysis at all in [DeepBank](https://delph-in.github.io/docs/garage/DeepBank).

# Corpus Organization

[DeepBank](https://delph-in.github.io/docs/garage/DeepBank) follows the section division familiar from the PTB,
and further sub-divides the data into sub-sections of at most 500
sentences each, e.g. WSJ00a, WSJ00b, WSJ00c, and WSJ00d. Across all
sections, sentences are assigned unique eight-digit identifiers, using
the scheme 2SSAAIII, with a two-digit section code, two-digit article
code (within each section), and three-digit item (within each article).
For example, identifier 20200002 denotes the second item in the first
file of Section 02, the classic *Ms. Haag plays Elianti.*

The not manually validated, robust analyses in [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) are
kept separate from the gold- and silver-standard annotations, in files
suffixed with an additional ‘.r’, e.g. ‘wsj00a.r’ for the robust
complement to the first sub-section in the collection.

# The Master Index

To keep track of the different levels of quality available for each
sentence, the file ‘Items’ in the top-level directory provides a ‘master
index’ of available annotations. For each sentence, the file contains
one line, constituting a tab-separated triple with the fields *id*,
*confidence*, and *active*. The first field is the unique sentence
identifier (see above); the second field is a numerically coded
indication of the quality of annotations available, distinguishing the
following levels:

- 3: gold-standard, manually validated
- 2: silver-standard, manually validated
- 1: robust, automatically parsed pseudo-derivation
- 0: no available annotation.

Finally, the third field, *active*, provides the number of HPSG analyses
accepted during annotation; i.e. it will be 1 for the vast majority of
items and an integer greater than one for the small number of items that
were not fully disambiguated. For the robust pseudo-derivations, the
*active* field will always be 1 (as the parser was run in one-best
mode); for unannotated items, the number of *active* analyses is by
definition 0.

# Available File Formats

The native representation of the HPSG analyses in [DeepBank](https://delph-in.github.io/docs/garage/DeepBank)
is in the form of what is called [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) *profiles*, essentially
flat-file relational databases. These are packaged in the download file
‘deepbank\_tsdb-1.0.tgz‘, and reside inside the ‘tsdb/‘ sub-directory
after unpacking, and are usually processed using [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) and other components of the
DELPH-IN tool chain.

A flat-file, textual representation of various views on the full HPSG
analyses is provided in the form of DELPH-IN export files
(‘deepbank\_export-1.0.tgz‘), inside the ‘export/’ directory. These
files contain (a) the original ‘raw’ string; (b) the initial sequence of
PTB-style tokens input to the parser; (c) the parser-internal lattice of
ERG-style tokens; (d) the full HPSG derivation
([ItsdbDerivations](https://delph-in.github.io/docs/tools/ItsdbDerivations)); (e) a simplified phrase
structure tree, labeled with common category abbreviations
([ErgTrees](/ErgTrees); to be documented); (f) a logical-form meaning
representation in Minimal Recursion Semantics (MRS; MrsRfc);
and (g) a reduction of the MRS into variable-free Elementary Dependency
Structures (EDS; [EdsTop](https://delph-in.github.io/docs/tools/EdsTop)).

For immediate compatibility with much mainstream work, there is a
conversion of the full HPSG analyses into bi-lexical syntactic and
semantic dependencies, using a token-oriented, tab-separated file format
inspired by the Shared Task of the 2008 Conference on Computational
Language Learning (CoNLL), packaged in the download file
‘deepbank\_conll-1.0.tgz‘, and reside in the ‘conll/’ sub-directory.
[Ivanova et al. (2012)](http://aclweb.org/anthology/W/W12/W12-3602.pdf)
coin the terms Derivation Tree–Derived (DT) and MRS-Derived (DM)
bi-lexical dependencies for word-to-word syntactic and semantic
dependency relations, respectively. Both these dependency views on
[DeepBank](https://delph-in.github.io/docs/garage/DeepBank) annotations are combined in the files below
‘conll/’, providing for each sub-section two variants, one using native
ERG tokenization conventions, another using PTB-style tokens.


Last update: 2022-02-14 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/DeepBank_OneZero/_edit)]{% endraw %}