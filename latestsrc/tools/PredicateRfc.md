{% raw %}This document aims to specify the structure and interpretation of
semantic predicates in the DELPH-IN ecosystem.

# What are Predicates?

Predicates (often abbreviated as *preds*) are symbols representing
semantic entities or constructions. Examples of predicates in the
[English Resource Grammar](https://delph-in.github.io/docs/erg/ErgTop) are:

    _dog_n_1 : a nominal (n) predicate for a dog or dogs in general
    _a_q     : a quantifier (q) predicate for the "a" as in "a dog"
    _eat_v_1 : a verbal (v) predicate for an eating event
    named    : an abstract predicate for named entities
    poss     : an abstract predicate indicating possession

These predicates are used in **predications** (a predicate with its
semantic arguments and other constraints), as in the following MRS for
*Kim's cake was eaten by a dog* (see the MRS specification at
[MrsRfc](https://delph-in.github.io/docs/tools/MrsRFC) for more explanation of MRS semantics):

    [ LTOP: h0
      INDEX: e2 [ e SF: prop TENSE: past MOOD: indicative PROG: - PERF: - ]
      RELS: < [ proper_q<0:3> LBL: h4 ARG0: x5 [ x PERS: 3 NUM: sg IND: + ] RSTR: h6 BODY: h7 ]
              [ named<0:3> LBL: h8 CARG: "Kim" ARG0: x5 ]
              [ def_explicit_q<3:5> LBL: h10 ARG0: x3 [ x PERS: 3 NUM: sg ] RSTR: h11 BODY: h12 ]
              [ poss<3:5> LBL: h13 ARG0: e14 [ e SF: prop TENSE: untensed MOOD: indicative PROG: - PERF: - ] ARG1: x3 ARG2: x5 ]
              [ _cake_n_1<6:10> LBL: h13 ARG0: x3 ]
              [ _eat_v_1<15:20> LBL: h1 ARG0: e2 ARG1: x15 [ x PERS: 3 NUM: sg IND: + ] ARG2: x3 ]
              [ _a_q<24:25> LBL: h16 ARG0: x15 RSTR: h17 BODY: h18 ]
              [ _dog_n_1<26:30> LBL: h19 ARG0: x15 ] >
      HCONS: < h0 qeq h1 h6 qeq h8 h11 qeq h13 h17 qeq h19 >
      ICONS: < e2 topic x3 > ]

*Surface* predicates represent overt words in a sentence. Note that not
all words have a predicate, as in the semantically-empty but
syntactically-required "to" in *Kim gave a book to Sandy* (compare: *Kim
gave Sandy a book*, which has the same semantics). *Abstract* predicates
are used for all other non-lexical situations, such as implicit
quantifiers (e.g., the proper\_q quantifier for "Kim") or semantic
constructions (such as poss for the possessive construction above).
Abstract and surface predicates are further discussed below.

# Surface and Abstract Predicates

Surface (also called "real" or "object-level") predicate symbols and
abstract (also called "grammar" or "meta-level") predicate symbols can
be identified by their form, where the presence of a leading underscore
indicates a surface predicate, and conversely the lack of a leading
underscore indicates an abstract predicate (compare \_the\_q\_rel and
udef\_q\_rel). Surface predicates have an internal structure that
combines a **lemma**, a **pos** (part of speech), and a **sense**, all
separated by underscores. Thus we have two basic forms for predicates:

    _(lemma)_(pos)_(sense) : surface predicate form
    (name)                 : abstract predicate form

## Limitations and Conventions

Conventionally, the grammar-internal types for predicates end with \_rel
which creates a namespace so they don't collide with non-predicate
types. The semantic outputs of a grammar are usually "exported"
according to the grammar's [SEM-I](https://delph-in.github.io/docs/tools/SemiRfc) and [VPM](https://delph-in.github.io/docs/tools/RmrsVpm) and the
\_rel suffix is removed.

Spaces may not occur in a predicate, except for possibly escaped or
non-breaking spaces, but these usages should be discouraged. When a
predicate represents a lexical unit that contains spaces, the + may be
used (e.g., \_all+too\_x\_comp, \_a+bit\_a\_1, \_act\_v\_seem+to). The -
character is used where it appears in the original word, or to show
alternates in the sense (e.g., \_tri-state\_a\_1, \_ally\_v\_to-with,
\_from\_p\_place-in). Other non-word characters sometimes appear in the
lemma (e.g., / in \_24/7\_a\_1). Unicode characters may also be used
(e.g., \_お昼\_n\_unk).

## Type vs String

Both surface and abstract predicates can be specified as a grammar
**type** or as a quoted **string**. Grammar-type predicates are defined
somewhere in the grammar, perhaps in a type hierarchy (also see
[Limitations and
Conventions](https://delph-in.github.io/docs/tools/PredicateRfc#limitations-and-conventions), above). A
predicate type-hierarchy means that predicates used in an MRS may unify
with other predicates (e.g., via underspecification or a common
subtype). Preds specified as a string are atomic types that do not exist
in a hierarchy, and are not required to be specified in a grammar except
by their lexical entries or lexical types. Quoted string preds may only
use surrounding double quotes (e.g., "\_quote\_n\_1\_rel"). An
open-single-quoted variant (e.g., 'null\_coord\_rel) used to be
available, but it has been deprecated.

## Surface Predicates

Surface predicates always have three fields: lemma, pos, and sense. The
sense field is occasionally unspecified (e.g., \_and\_c).

The lemma field of a surface pred may be just about anything that does
not contain underscores or spaces.

The POS field must be a single character, and specifically one of n, v,
a, j, r, s, c, p, q, x, u, or d (see [RmrsPos](https://delph-in.github.io/docs/tools/RmrsPos); also note that
use of the d POS is discouraged).

The sense field is specified like a lemma, although for practical
reasons it should not be a single letter (so as to distinguish it from
the POS field). Often the sense field is just a number (e.g,
\_angstrom\_n\_1), but it may be more descriptive (e.g.,
\_argue\_v\_about" vs \_argue\_v\_for, etc.).

### Serialization: Real vs Surface

When \*MRS representations are serialized, surface predicates may appear
decomposed to their lemma, pos, and sense values. In this context, they
are called **real** predicates and are contrasted with **surface**
predicates that use the underscore-delimited form discussed above. For
example, in the XML format for MRS:

    <realpred lemma="dog" pos="n" sense="1" />

## Abstract Predicates

Abstract predicates do not have the 3-part internal structure that
surface predicates do. The only constraints on their form are that they
do not start with an underscore and do not contain spaces. Some example
from the ERG include: season, some\_q, place\_n,
free\_relative\_ever\_q, interval\_p\_end.

**Note for Developers**

Notice that, despite the lack of internal structure, the abstract
predicates listed above do seem to generally follow the format governing
surface predicates, with POS and sometimes sense values. Tools may
benefit from decomposing abstract predicates as if they were surface
predicates, i.e. in order to detect quantifiers by looking for the q POS
value, but this is not a sanctioned use of abstract predicates and
should not be relied upon.

# Predicate Equivalence

Predicates are always **case-insensitive**. Quotes and \_rel suffixes
are ignored. Therefore the following predicates are equivalent:

    _dog_n_1
    _DOG_N_1
    "_dog_n_1_rel"

Furthermore, a surface predicate and its corresponding decomposed "real"
pred (see the [Real vs Surface](https://delph-in.github.io/docs/tools/PredicateRfc#serialization-real-vs-surface) section
above) are equivalent:

    _dog_n_1
    <realpred lemma="dog" pos="n" sense="1" />

An abstract predicate and a surface predicate with the same apparent
values (e.g., place\_n and a hypothetical \_place\_n) are *not*
equivalent, and grammar writers should avoid creating such similar
predicates in order to avoid confusion.

Last update: 2022-09-12 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/PredicateRfc/_edit)]{% endraw %}