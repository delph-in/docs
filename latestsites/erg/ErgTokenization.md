{% raw %}# Overview

Aiming for a balance of linguistic precision and broad coverage, the
[English Resource Grammar](http://www.delph-in.net/erg) (ERG) includes
detailed analyses of punctuation and a wide variety of 'text-level'
phenomena (e.g. various formats for temporal and numeric expressions).
The grammar makes specific assumptions about tokenization, and for the
successful application of the grammar it is important to understand and
respect these assumptions. In early 2009, the ERG approach to
tokenization has undergone a major revision, and this page aims to spell
out some of the basic assumptions, specific decisions made, and
technology used in preparing input text for parsing with the ERG. When
using the ERG to parse ‘raw’ string inputs, for satisfactory results on
non-vanilla inputs, it is necessary to apply the ERG tokenization rules,
e.g. turn on support for [REPP](https://delph-in.github.io/docs/garage/ReppTop) in engines like PET or ACE.

This page was predominantly authored by StephanOepen,
who jointly with DanFlickinger developed the current
ERG approach to tokenization. As of early 2009, Stephan is the
maintainer of the ERG tokenizer and token mapping rules. Please do not
make substantial changes to this page unless you (a) are reasonably sure
of the technical correctness of your revisions and (b) believe strongly
that your changes are compatible with the general design and recommended
use patterns for the ERG, and of course with the goals of this page.

# Pre-Processing and Initial Tokenization

This section documents tokenization and a handful of other surface-level
decisions. Technically speaking, when parsing with the ERG and PET
(which is the reference setup for production use), the parser takes as
its input a lattice of tokens, each a structured object (aka typed
feature structure). Please see the [PetInput](https://delph-in.github.io/docs/garage/PetInput) page for
additional background. In this view, string-level pre-processing and
initial tokenization is the process of mapping a 'flat' string into a
token lattice. For further technical background and an example
demonstrating a broad range of tokenization aspects, please see the page
[ErgTokenization/ComplexExample](https://delph-in.github.io/docs/erg/ErgTokenization_ComplexExample).

In the standard setup for the ERG, this task is solved by means of
so-called REPP (Regular Expression Pre-Processor) modules, which are
included with the ERG sources (in the rpp/ subdirectory); for general
background on the technology, please see the [ReppTop](https://delph-in.github.io/docs/garage/ReppTop) page.
The REPP modules provided by the ERG can be configured in various ways,
to accommodate different input conventions, i.e. variation in
punctuation and markup conventions used in texts from various sources.
As of mid-2010, these REPP modules have stabilized to a certain degree
but remain to be documented (beyond the generous use of comments in the
REPP source files). In the following, we document the normalized
*result* of string-level pre-processing, i.e. the expected input to the
ERG (and result of the application of a set of REPP modules).

## General Principles

For compatibility with existing tools, specifically taggers trained on
the Penn Treebank (PTB), we assume a PTB-like tokenization in
pre-processing. The ERG internally (still) analyzes most punctuation
marks as pseudo-affixes (rather than as separate tokens, as in the PTB).
To accomodate any discrepancies, the grammar includes token mapping
rules to adjust (i.e. correct) externally supplied tokenization (see the
[ChartMapping](https://delph-in.github.io/docs/garage/ChartMapping) page for general background); specifically,
punctuation marks will be re-combined with preceding or following
tokens, reflecting standard orthographic convention.

The REPP pre-processing modules included with the ERG are inspired by
the PTB
[tokenizer.sed](http://www.cis.upenn.edu/~treebank/tokenizer.sed) script
and by and large yield quite similar results (with a number of
extensions going beyond 7-bit ASCII strings, as discussed below). To
actually tokenize (following PTB principles), we need to do more than
just break at whitespace. Some punctuation marks give rise to token
boundaries, but not all. Also, inputs (in the 21st century) may contain
some amount of mark-up, where XML character references for example have
become relatively common. Full UniCode support in the toolchain now
makes it possible to represent a much larger range of characters, e.g.
various types of quotes and dashes. In general, we aim to map mark-up to
corresponding [UniCode](/UniCode) characters, where appropriate, and
typically analyze those in parsing.

However, the original tokenizer.sed actually does not always yield the
exact tokenization found in the PTB. For example, the script
unconditionally separates a set of punctuation or other non-alphanumeric
characters (e.g. & and ! that may be part of a single token (say in
acronyms like AT&T or URLs). We aim to do better than the original
script, here, conditioning token boundaries on (transitively) adjacent
whitespace. See the examples discussed below for details.

## A Running Example

To exemplify the above basic principles, consider the following sample
input:

      The shipment, 'chairs', arrived.

This will be tokenized into a total of nine tokens, i.e. each of the
punctuation marks will form a token in its own right. In REPP, each
token will be annotated with so-called 'characterization', i.e. a range
of character indices into the original string (allowing one to recover
the distinction between immediate adjacency between two consecutive
tokens vs. intervening whitespace). Thus, in the so-called YY input
format to PET (see the [PetInput](https://delph-in.github.io/docs/garage/PetInput) page for background), our
example would be represented as follows:

      (42, 0, 1, <0:3>, 1, "The", 0, "null")
      (43, 1, 2, <4:12>, 1, "shipment", 0, "null")
      (44, 2, 3, <12:13>, 1, ",", 0, "null")
      (45, 3, 4, <14:15>, 1, "‘", 0, "null")
      (46, 4, 5, <15:21>, 1, "chairs", 0, "null")
      (47, 5, 6, <21:22>, 1, "’", 0, "null")
      (48, 6, 7, <22:23>, 1, ",", 0, "null")
      (49, 7, 8, <24:31>, 1, "arrived", 0, "null")
      (50, 8, 9, <31:32>, 1, ".", 0, "null")

Purely for PTB compatibility, albeit at the expense of linguistic
adequacy, contracted negations are also separated into multiple tokens,
e.g. ca n’t, do n’t, etc.

## Quotation Marks

In naturally occuring texts, there is a wide variety of conventions for
representing quotation marks. Much like in the PTB, the ERG expects its
inputs (after pre-processing) to distinguish between opening (aka left)
and closing (aka right) quotes. Note how REPP in the above example turns
the straight single quotes (so-called 'typewriter quotes') into
directional UniCode characters, i.e. ‘ (U+2018) and ’ (U+2019). This is
a prerequisite to parsing success for this example with the ERG, i.e. in
a setup by-passing the REPP layer (and allowing straight quotes in the
raw inputs), quote disambiguation (based on transitive adjacency to
whitespace) needs to be supplied by the tokenizer.

Note that, unlike the PTB, the ERG uses directional UniCode quotes
instead of the ancient LaTeX-like ASCII convention adapted for the
original PTB, i.e. interpreting a backquote (aka grave accent) as a left
quotation mark, and then reserving the straight quote for right
quotation marks. The same would be true for double quotes, i.e. instead
of the double-character representations used in the PTB (\`\` and ''),
the ERG expects genuine opening and closing quotation marks, viz. “
(U+201c) and ” (U+201d); see
[Wikipedia](http://en.wikipedia.org/wiki/Quotation_mark) for a more
general discussion of quotation marks in English.

In practice, today we observe three mutually incompatible conventions in
electronic texts: (a) the PTB- or LaTeX-like abuse of grave accents
(e.g. \`quote'); (b) use of plain ASCII, not attempting to differentiate
left and right quotes (e.g. 'quote'); and (c) modern, high-quality
typesetting, using genuine directional quotation marks (e.g. ‘quote’.
Variants (a) and (b) are both frequently found in electronic texts that
were 'typed' rather than 'typeset', i.e. originally written without the
goal of professional typography. Variant (c), on the other hand, is more
common in texts derived from carefully typeset sources, for example
scholarly manuscripts (for example when extracting a text stream from an
XML or PDF file). While (a) and (c) distinguish opening from closing
quotes, (b) does not; yet, the distinction is reliably recoverable at
the string level, i.e. in pre-processing (and not necessarily later on).

These are some of the reasons for the ERG to assume 'normalized' inputs,
where different configurations of REPP modules are provided to properly
handle the above conventions. Furthermore, the PTB decision to use a
double-character sequence to represent a single glyph (viz. opening and
closing quotes) is problematic in several ways: it complicates regular
expression writing; it potentially skews character offset computations;
and most importantly it makes inaccessible a legitimate character
sequence, viz. two consecutive single quotes (or apostrophes); in some
bio-medical journals, for example, it is quite common to distinguish
identifiers A', A'', A''', and so on. For further subtle points of
quotation marks, please see the
[discussion](http://www.cl.cam.ac.uk/~mgk25/ucs/quotes.html) by Markus
Kuhn, one of the UniCode pioneers.

## Apostrophes

The apostrophe, as used for contractions and possessives in English, is
typographically (almost) never distinguished from a single closing
quote. Because the possessive will be spelled as a sole apostrophe when
following a word ending in -s (as for example in Abrams’), and also for
reasons of syntax (the possessive attaches to complete NPs; its
homograph, the contracted present-tense, third-person, singular form of
the auxiliary, acts as the head of VP), possessives always need to be
tokens of their own in pre-processed inputs to the ERG, e.g.
Browne ’s chair, Abrams ’ chair, or Browne ’s efficient.

In practice, both forms of the single quote discussed above are found as
apostrophes in electronic texts, i.e. the 'typewriter' apostrophe
(typically in variants (a) and (b) above), as well as the UniCode
apostrophe (U+2019), mostly in variant (c). Seeing what we argued so
far, the grammar should probably only support the normalized UniCode
apostrophe, e.g. do n’t, o’clock, or Browne ’s, rather than do n't,
o'clock, and Browne 's. As of July 2010, this is unfortunately not yet
the case. For common contractions and the possessives, both variants are
currently supported; however, for rare words containing apostrophes one
or the other variant may be missing from the lexicon, e.g. a UniCode
version of the multi-word name Ayer 's Rock (note the tokenization into
three units, which follows from the seemingly possessive-like
structure).

## Other Diversions from the PTB

For reasons similar to those given in the case of double quotation marks
above, REPP also normalizes a few more multi-character ASCII
representations of UniCode glyphs, viz. em dashes (---; U+2014), en
dashes (--; U+2013), and ellipsis (...; U+2026).

# Token Mapping

## General Principles

## Light-Weight Named Entitities

## Token Merging

## Token Splitting

# Unknown Word Handling

Last update: 2013-10-24 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ErgTokenization/_edit)]{% endraw %}