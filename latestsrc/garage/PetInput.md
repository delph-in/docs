{% raw %}# Overview

This page discusses some of the available input formats to the PET
parser cheap, viz. 'pure' textual input and the so-called YY mode for
lattice-based input. These two modes of giving input to the parser are
the most traditional ones, but in more recent developments, additional
XML-based input formats have been developed. Please see the
[PetInputFsc](https://delph-in.github.io/docs/garage/PetInputFsc) page for an alternate, lattice-based XML
input mode.

This page was predominantly authored by StephanOepen,
who is its current maintainer. Please do not make substantial changes
unless you (a) are quite certain of the technical correctness of your
revisions and (b) believe strongly that your changes are compatible with
the general design and recommended use patterns for PET input
processing, and of course with the goals of this page.

# Textual, Line-Oriented Input

By default, cheap expects plain text input, one sentence (or, more
generally, utterance) per line. The parser applies a very simple-minded
tokenizer, breaking the input string into tokens at all occurences of
whitespace. There are a few quirks and configuration options for this
input mode, e.g. the ability to convert LaTeX-style accented characters
into UniCode characters, or the historic, so-called LinGO tokenizer,
trying to handle contracted auxiliaries in (what in the 1990s seemed
like) the proper manner.

Punctuation characters, as specified in the settings file are ignored by
PET (removed from the input chart) for pure, textual input. Here is an
example of the punctuation characters found in the JaCY file
pet/japanese.set:

      punctuation-characters := "\"!&'()*+,-−./;<=>?@[\]^_`{|}~。？…．，　○●◎＊".

Note that punctuation-characters are defined separately for the LKB
(typically in lkb/globals.lsp) and that, in recent years, grammars are
moving towards inclusion of punctuation marks in the syntactic analysis.

Furthermore, there is a special handling for contracted negations like
don't, which are split into two tokens don and 't. To inhibit that, the
following can be put into the settings file:

      trivial-tokenizer := true.

Punctuation characters are not removed from the other input modes (YY
mode, PET Input Chart, or MAF). Rather, in these modes they should be
removed (or treated otherwise, as appropriate) by the preprocessor that
created the token lattice (in whatever syntax) provided to PET.

# YY Input Mode

YY (activated by the -yy option) input mode facilities parsing from a
partial (lexical) chart, i.e. it assumes that tokenization (and other
text-level pre-processing) have been performed outside of cheap. YY
input mode facilitates token-level ambiguity, multi-word tokens, some
control over what PET should do for morphological analysis, the use of
POS tags on input tokens to enable (better) unknown word handling, and
generally feeding a word graph (as, for example, obtained from a speech
recognizer) into the parser.

Following is a discussion of the YY [input
example](https://github.com/delph-in/erg/blob/main/pet/sample.yy?raw=true) provided
with the ERG (as of early 2009). In this example, the words are shown on
separate lines for clarity. In the actual input given to PET, all YY
tokens must appear as a single line (terminated by newline), as each
line of input is processed as a separate utterance.

      (42, 0, 1, <0:12>, 1, "Tokenization", 0, "null", "NNP" 0.7677 "NN" 0.2323)
      (43, 1, 2, <12:13>, 1, ",", 0, "null", "," 1.0000)
      (44, 2, 3, <14:15>, 1, "a", 0, "null", "DT" 1.0000)
      (45, 3, 4, <16:27>, 1, "non-trivial", 0, "null", "JJ" 1.0000)
      (46, 4, 5, <28:36>, 1, "exercise", 0, "null", "NN" 0.9887 "VB" 0.0113)
      (47, 5, 6, <36:37>, 1, ",", 0, "null", "," 1.0000)
      (48, 6, 7, <38:44>, 1, "bazed", 0, "null", "VBD" 0.5975 "VBN" 0.4025)
      (49, 7, 8, <45:58>, 1, "oe@ifi.uio.no", 0, "null", "NN" 0.7342 "JJ" 0.2096)
      (50, 8, 9, <58:59>, 1, ".", 0, "null", "." 1.0000)

An input in this form can be processed by PET as follows:

      cheap -yy -packing -verbose=4 -mrs \
        -cm -default-les=all english.grm < pet/sample.yy

Here -yy (a shorthand for -tok=yy) turns on YY partial chart input mode,
and we request ambiguity packing (which is always a good idea), some
verbosity of tracing, and the output of MRSs. The additional options
enable chart mapping (see [Adolphs, et al.
(2008)](http://www.lrec-conf.org/proceedings/lrec2008/summaries/349.html))
and turn the unknown word machinery into 2009 mode (see the section
*Unknown Word Handling* below). Note that these options, as of early
2009, are only supported in the so-called *chart mapping*
[branch](https://pet.opendfki.de/repos/pet/branches/cm) of the PET code
base (corresponding pre-compiled binaries are available in the LOGON
tree; see the [LogonTop](https://delph-in.github.io/docs/tools/LogonTop) page).

Each token in the above example has the following format:

- (*id*, *start*, *end*, \[*link*,\] *path*<sup>+</sup>, *form*
\[*surface*\], *ipos*, *lrule*<sup>+</sup>\[, {*pos*
*p*}<sup>+</sup>\])

In other words, each token has a unique *id*entifier and a *start* and
*end* vertex. Optionally, tokens can be annotated with a surface *link*,
an indication of underlying string positions in the original document;
currently (as of January 2009), *link* information is only supported as
character positions, in the format &lt;*from*:*to*&gt; (but in
principle, *link* could have other forms, with *from* and *to* being
arbitrary strings, e.g. stand-off pointers in whatever underlying
markup). We will ignore the *path* component (membership in one or more
paths through a word lattice) for our purposes.

The actual token string is provided by the *form* field, and this is
what PET uses for morphological analysis and lexical look-up. In case
the *form* does not correspond to the original string in the document,
e.g. because there was some textual normalization prior to creation of
YY tokens already, the optional *surface* field can be used to record
the original string. Until early 2009, the ERG had inherited a mechanism
called *ersatzing* where a set of regular expressions were applied prior
to parsing, associating for example a *form* value of EmailErsatz with a
*surface* value of oe@yy.com. In the newer, chart mapping universe, the
ERG no longer makes use of this facility and instead makes it a policy
to never 'mess' with the actual token string (but use other token
properties instead).

YY mode can be used in two variants regarding morphological analysis.
Our example above leaves morphological analysis to PET, i.e. using the
lexical rules and orthographemic annotation provided by the grammar.
This built-in morphology mode is activated by an *lrules* value of
"null", and the *ipos* field is ignored (but still has to be given,
conventionally as 0). Another option is to provide information about
morphological segmentation as part of the input tokens, in which case
*ipos* specifies the position to which orthographemic rules apply, and
one or more *lrule* values (as strings) name lexical rules provided by
the grammar.

Example from the Spanish treebank with a sequence of lexical rules
(the Spanish Resource Grammar relies on an external morphophonological processor):

```
(1, 0, 1, <0:6>, 1, "costar" "cuesta", 0, "vmip3s0", "vmip3s0" 0.94618834) 
(2, 1, 2, <7:14>, 1, "creer" "creerlo", 0, "vmn0000" "+pp3msa0", "vmn0000" "+pp3msa0" 1.00000000)
```

Finally, each token can be annotated with an optional sequence of tag
plus probability pairs. The ERG, for example, includes a set of
underspecified *generic* lexical entries which can be activated on the
basis of PoS information, obtained for example from running a PoS tagger
prior to parsing. We used to include the probabilities in (heuristic)
parse ranking, but since sometime in 2002 (when MaxEnt parse selection
became available in PET) they are just ignored.

YY input mode supports a genuine token lattice, i.e. it is legitimate to
have multiple tokens for an input position, or tokens spanning multiple
positions.

Example with several possibilities for POS tags remaining after the morphological analysis stage:

```
(1, 0, 1, <0:13>, 1, "explicación" "explicaciones", 0, "ncfp000", "ncfp000" 1.00000000) (2, 1, 2, <14:23>, 1, "oficial" "oficiales", 0, "aq0cp00", "aq0cp00" 0.9) (3, 1, 2, <14:23>, 1, "oficial" "oficiales", 0, "aq0fp00", "aq0fp00" 0.1)
```

# Unknown Word Handling: Basics

As of early 2009, there are two modes of detecting and handling unknown
words, i.e. input tokens for which no *native* lexical entry is
available. Common to both modes is their use of underspecified,
so-called *generic* lexical entries. In a nutshell, these entries are
instantiated for *gaps* in the lexical chart, i.e. input positions for
which no native entries were found. The variation in different modes of
unknown word handling relates to (a) how lexical gaps are detected and
(b) the selection of which generic entries to instantiate. For historic
reasons, we document the older unknown word handling mode first,
pointing out its limitations along the way. The newer, cleaner, and more
flexible approach to unknown word handling is summarized in section
*Unknown Word Handling and Chart Mapping* below.

Unknown word handling is activated by the command-line option
-default-les. For this option to take effect, the grammar has to provide
one or more lexical entries marked as generic, by means of their TDL
status value. For example, the ERG includes the following declartions
(in pet/common.set):

      generic-lexentry-status-values := generic-lex-entry.

Actual generic entries are defined in the ERG file
<http://svn.delph-in.net/erg/trunk/gle.tdl>, which is loaded (in the
top-level grammar file english.tdl) as follows:

      :begin :instance :status generic-lex-entry.
      :include "gle".
      :end :instance.

Turning on -default-les without additional settings, for each lexical
gap *all* generic entries will be activated; in other words, there is no
control over which entries are used at each gap position, and it is left
to the larger syntactic context to determine the category of the unknown
token(s). With inputs exhibiting a non-trivial proportion of unknown
words, this approach can lead to massive lexical and syntactic ambiguity
and, in the worst case, may be computationally intractable.

Since around 2002 the ERG has had the ability of using an external PoS
tagger to selectively activate generic entries; this mode of operation
assumes that input tokens are decorated with one or more PoS tags (as in
our example above), and that the grammar provides a mapping from PoS
tags to the identifiers of generic lexical entries. This mapping can be
provided by the posmapping declaration in one of the settings files, for
example (from older versions of the ERG):

      posmapping := 
        JJ $generic_adj
        JJR $generic_adj_compar
        JJS $generic_adj_superl
        CD $generic_number
        NN $generic_mass_count_noun
        NNS $generic_pl_noun
        NNPS $generic_pl_noun
        NNP $genericname
        FW $generic_mass_noun
        RB $generic_adverb
        VB $generic_trans_verb_bse
        VBD $generic_trans_verb_past
        VBG $generic_trans_verb_prp
        VBN $generic_trans_verb_psp
        VBP $generic_trans_verb_presn3sg
        VBZ $generic_trans_verb_pres3sg
      .

To further constrain the postulation of generic lexical entries, cheap
provides two optional filtering mechanisms (both somewhat ad-hoc). The
first of these can be used to impose suffix constraints on the actual
token string giving rise to a generic lexical entry. For example (again
from older ERG revisions):

      generic-le-suffixes := 
        $generic_trans_verb_pres3sg "S" 
        $generic_trans_verb_past "ED" 
        $generic_trans_verb_psp "ED" 
        $generic_trans_verb_prp "ING" 
        $generic_pl_noun "S"
      .

But this approach interoperates poorly with the ERG treatment of
punctuation (as pseudo-affixes), which was introduced sometime around
2005.

Another configuration mechanism can be used to let PoS tags *augment*
native lexical entries, i.e. attempting to address incomplete lexical
coverage, say a use of the word *bus* as a verb, but assuming the native
lexicon only provides a nominal reading. However, seeing that recent
developments have made this configuration obsolete too (where it was
never really used in production anyway), it shall suffice to 'document'
it by means of the comments from the file pet/common.set in earlier ERG
revisions:

      ;;;
      ;;; the setting `pos-completion' enables an additional mechanism to do with
      ;;; processing of generic lexical entrie: whenever we receive POS information
      ;;; as part of the input, we check to see whether the built-in lexical entries
      ;;; suffice to satisfy the POS annotations: each lexical entry retrieved for an
      ;;; input token 
      ;;;
      ;;;   <string, pos_1, pos_2, pos_3> 
      ;;;
      ;;; is mapped to an application-specific POS tag, using the `type-to-pos' map,
      ;;; and checking the type of each lexical entry for subsumption against the
      ;;; left-hand side of each `type-to-pos' rule.  some or all POS annotations
      ;;; from the input may be `satisfied' under this mapping by built-in lexical
      ;;; entries, e.g. for the example above, there may be lexical entries whose
      ;;; type maps to `pos_1' and `pos_3'; unless all POS annotations are satisfied
      ;;; after all built-in lexical entries have been processed, the remaining POS
      ;;; categories are processed by the regular `posmapping' look-up.  note that,
      ;;; as a side effect, an empty `type-to-pos' map will always result in having
      ;;; all generic lexical entries activated (modulo the filter described above),
      ;;; even for input tokens that were found in the native lexicon.
      ;;;
      pos-completion.
      type-to-pos :=
        basic_noun_word NN
        basic_noun_word NNS
        basic_noun_word NNP
        basic_pronoun_word NN
        basic_pronoun_word NNS
        basic_pronoun_word NNP
      .

# Unknown Word Handling and Chart Mapping

The approach to unknown word handling sketched above has several
undesirable properties (that we discovered through the years).

First, the method of detecting lexical gaps right after lexical look-up
and activating generic entries only in chart positions with *apparent*
gaps is failure-prone under two conditions: first, lexical look-up is
performed on the basis of stems that were *hypothesized* after the first
phase of orthographemic processing (i.e. morphological analysis). In
this phase, an input token UPS will be analyzed as the candidate stem
up, combined with either the nominal plural, or the verbal present
tense, third person singular inflectional rules. If we assumed that the
grammar contained only the prepositional lexical entry for up, then both
morphological analyses should actually be considered lexical gaps—in
lexical parsing, the inflectional rules will ultimately fail to apply to
the preposition. If we were to assume, on the other hand, that the
grammar contained a verbal stem up, then there is no lexical gap in a
technical sense. However, there may still be *incomplete* lexical
coverage, where instead of the present tense verb form, we would rather
require a (generic) proper name to parse successfully. The original
approach to unknown words in PET has no satisfactory way of addressing
either problem.

For these reasons, the order and nature of lexical processing have been
re-worked in the so-called *chart mapping* parsing mode for cheap.
[Adolphs, et al.
(2008)](http://www.lrec-conf.org/proceedings/lrec2008/summaries/349.html)
discuss this approach more generally, but in a nutshell this mode defers
gap detection and the decision on which generics to use until *after*
lexical processing is complete, i.e. the application of lexical rules
has reached a fix-point. This universe is activated by the command-line
option -default-les=all and should typically be combined with -cm
(turning on chart mapping). In this mode, the processing of *native*
lexical entries is unchanged, but generics are treated differently: for
*each* input token, *all* generics are always activated. To *activate* a
(generic) lexical entry, in this mode, means to unify the complete
feature structure(s) of the underlying token(s) into a designated path
(called the TOKENS path) of the lexical entry. This way, input tokens
can be decorated with various properties, for example PoS information
and a token *class* (ranging over, say, alphanumeric vs. numeric vs.
various sub-types of named entities) property. The generic lexical entry
designated for unknown singular nouns can thus be constrained to only be
compatible with tokens that carry appropriate PoS tags, and an entry
designated for email addresses can constrain its token class to the
appropriate sub-type.

Besides its shortcomings in lexical gap detection discussed above,
another unsatisfactory aspect of the older approach to unknown word
handling lies in the ad hoc nature of filtering mechanisms like
posmapping et al. There are many assumptions built into the software in
these mechanisms, and their semi-procedural status is problematic in
terms of the formalism definition (i.e. might be hard to re-produce in
another processing engine). Furthermore, these mechanisms do not allow
grammarians to flexibly (and on a case-by-case basis, if desirable)
decide on which generics to activate under which conditions, and on how
to combine native and generic entries. There are obvious coverage vs.
efficiency trade-offs in this space, and the new, chart mapping universe
aims to give the grammarian great power (and great responsibility) in
creating and maintaining distinct configurations.

Finally, the old code has been augmented over time with additional
procedural mechanisms, all aiming to 'transport' token-level surface
properties into the grammar-internal feature structure universe.
Examples of such mechanisms are so-called characterization (recording of
string-level start and end positions for each token) and the
determination of CARG and PRED values in the MRS component of
grammar-internal feature structures, in both cases reflecting the token
surface form of named entities or predicates introduced by other generic
entries. All such procedural mechanisms—destructively manipulating
feature structures 'behind the scenes'—become unnecessary in the new
approach to unknown words. Because lexical entries (generics and
natives) are given access to the full feature structure of their
underlying input token(s), whatever information needs to be picked up
from the tokens into the grammar-internal signs can be accessed by
simple re-entrancies within the lexical entry. The ERG (as of early
2009), for example, percolates characterization information (from input
tokens) on all lexical entries, making sure to pass up the left- and
right-most start and end positions when building phrases, and further
inserting this information into all semantic predicates, at the time
these are first introduced, i.e. both in lexical entries and
constructions. In a similar spirit, the generic entry activated for an
unknown singular common noun picks up a PRED value from its input token,
and the email NE generic entry determines its CARG from the surface form
of the underlying token. This is all very clean and pretty.

As regards the interaction of native and generic entries in the new
universe, the default-les=all mode will initially activate both kinds of
entries. Once lexical parsing (the application of lexical rules) has
completed, there is a phase of *lexical filtering*, operationalized as a
set of chart mapping rules that can inspect pairs (or, in principle,
sets) of edges in the chart and delete those that are deemed unwanted. A
baseline lexical filtering strategy that approximates the older approach
(modulo more accurate gap detection) could be to delete all generic
entries from chart cells where there is at least one native entry
(remaining after lexical parsing). More advanced strategies might aim to
reduce native entries on the basis of incompatible PoS values (for
potentially improved efficiency), or try to augment native entries with
generics to complement what we called partial lexical coverage above
(for improved coverage; essentially realizing the old pos-completion
mode in the new universe).

Returning to the above input example, recall that the YY token
description corresponds to the (moderately sensical) input

      Tokenization, a non-trivial exercise, bazed oe@yy.com.

Using the ERG revision of January 2009, combined with the new approach
to unknown words, chart mapping, and MRS extraction (i.e. the calling
example shown in section *YY Input Mode* above), one of the results will
look like the following (the MRS has been simplified, omitting variable
properties except for the top-level event)

      [ LTOP: h1
        INDEX: e2 [ e SF: PROP TENSE: PAST MOOD: INDICATIVE PROG: - PERF: - ]
        RELS: < [ appos_rel<0:37> LBL: h3 ARG0: e4 ARG1: x6 ARG2: x5 ]
                [ udef_q_rel<0:13> LBL: h7 ARG0: x6 RSTR: h9 BODY: h8 ]
                [ "_tokenization/NN_u_unknown_rel"<0:13> LBL: h10 ARG0: x6 ]
                [ _a_q_rel<14:15> LBL: h11 ARG0: x5 RSTR: h12 BODY: h13 ]
                [ neg_rel<16:27> LBL: h14 ARG0: e16 ARG1: h15 ]
                [ "_trivial_a_1_rel"<16:27> LBL: h17 ARG0: ARG1: x5 ]
                [ "_exercise_n_1_rel"<28:37> LBL: h14 ARG0: x5 ]
                [ "_bazed/VBD_u_unknown_rel"<38:44> LBL: h3 ARG0: e2 ARG1: x6 ARG2: x19 ]
                [ proper_q_rel<45:59> LBL: h20 ARG0: x19 RSTR: h22 BODY: h21 ]
                [ named_unk_rel<45:59> LBL: h23 ARG0: x19 CARG: "oe@ifi.uio.no" ] >
        HCONS: < h9 qeq h10 h12 qeq h14 h15 qeq h17 h22 qeq h23 > ]

This result exemplifies several of the mechanisms discussed earlier. The
input token *Tokenization* is an unknown word to the grammar and was
analyzed using a PoS-activated generic lexical entry. As the input
tokens to the parser provide no lemmatization information (yet), the
grammar, in this case, opts to compose the PRED value by concatenating
the surface form and PoS tag (which preserves all the information
available to the parser, and obviously some amount of semantic
post-processing is called for). The same is true of the
*\_bazed/VBD\_u\_unknown\_rel* predication, which was built using a
PoS-activated generic lexical entry for simple transitives. Finally, the
token *<mailto:oe@yy.com>* is recognized as a named entity, where a set of
*token mapping* rules prior to lexical instantiation looks for
string-level indicators of various kinds of NEs, in this case the
regular expression characteristic of an email address. In this case, the
token feature structure is annotated with a specific token class value,
which subsequently allow activation of the correct generic lexical entry
(and blocks any other generics). This entry, in turn, makes its MRS CARG
value parasitic on the input token feature structure (where token
mapping has done The Right Thing™ about the interactions with
sentence-final punctuation).

# LKB and \[incr tsdb()\] Back-End Support

The LKB includes a simple, finite-state tool to prepare textual input
for parsing with PET, the *Regular Expression Pre-Processor* (REPP);
please see the [ReppTop](https://delph-in.github.io/docs/garage/ReppTop) page for details. The ERG includes a
set of string-level REPP rules to normalize inputs and determine
(initial) tokenization; as one of its outputs formats, REPP supports the
YY 2.0 conventions.

With PET and [\[incr tsdb()\]](http://www.delph-in.net/itsdb) versions
dated February 15, 2009, or newer, the new approach to unknown word
handling (finally) has full support in [\[incr
tsdb()\]](http://www.delph-in.net/itsdb), including the Redwoods
treebanking tools. As all information about the flow of information
between the token-level and grammar-internal sign universes is now
encoded as part of the grammar proper (i.e. its feature structures for
lexical entries and rules), complete information about the derivation is
recorded in [\[incr tsdb()\]](http://www.delph-in.net/itsdb) profiles
(please see the [ItsdbDerivations](https://delph-in.github.io/docs/tools/ItsdbDerivations) page for
background). Specifically, the extended derivation format includes the
feature structures of input tokens as the leafs of the derivation tree,
such that re-building that derivation (deterministically re-applying all
unifications) will yield the exact same result as was produced during
parsing. Hence, characterization information, as well as dynamic PREDs
and CARGs for unknown words, will be present on structures built during
treebanking (or exported from [\[incr
tsdb()\]](http://www.delph-in.net/itsdb)) in just the same way they were
present during parsing. This should be true independent of the input
mode used with PET, though as of early 2009 most testing was done using
the YY token format.

# History and Alternate Lattice-Based Input Modes

YY input mode was first developed in 2000 and has undergone three
revisions since. YY input mode revision 0.0 was a purely internal
version that is no longer supported. Since 2001, YY 1.0 has been in
active use and is still fully supported. The format described above, and
the example given from the ERG, use YY 2.0, a conservative,
backwards-compatible extension made in January 2009. Compared to YY 1.0,
only the optional *link* field was added, i.e. the ability to provide
information about external surface positions. It appears, however, that
the PET-internal treatment of YY input tokens was changed in a
(theoretically, at least) non-backwards-compatible manner sometime
around the years 2003 or 2004, when the *start* and *end* fields (in YY
1.0) format were re-interpreted as *external* surface links, viz.
character positions—much like the new *from* and *to* values in the YY
2.0 extension. No real damage was observed from this change (because
interpreting chart vertices as character positions, and later
re-computing chart vertices from the resulting lattice topology should
usually arrive at an identical lattice), but as of early 2009, it is
recommend to adapt external providers of YY input to PET to the richer
YY 2.0 format.

Alternate, lattice-based input modes are available using XML markup to
encode the parser input. See the [PetInputFsc](https://delph-in.github.io/docs/garage/PetInputFsc),
[PetInputChart](https://delph-in.github.io/docs/garage/PetInputChart) and [SmafTop](https://delph-in.github.io/docs/tools/SmafTop) pages for the
so-called FSC, PIC (deprecated as of mid-2010), and SMAF (deprecated as
of mid-2010) mode, respectively.

Last update: 2023-09-12 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/PetInput/_edit)]{% endraw %}