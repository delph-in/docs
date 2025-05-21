{% raw %}Type Description Language and other aspects of DELPH-IN Joint Reference Formalism

Contents

1. [TDL File Syntax](https://delph-in.github.io/docs/tools/TdlRFC#TDL-File-Syntax)
2. [TDL File Interpretation and Conventions](https://delph-in.github.io/docs/tools/TdlRFC#TDL-File-Interpretation-and-Conventions)
   1. [Layout of a type definition](https://delph-in.github.io/docs/tools/TdlRFC#Layout-of-a-type-definition)
   2. [Types versus instances](https://delph-in.github.io/docs/tools/TdlRFC#Types-versus-instances)
   3. [Type addenda (:+)](https://delph-in.github.io/docs/tools/TdlRFC#Type-addenda-)
   4. [Specifying the text encoding](https://delph-in.github.io/docs/tools/TdlRFC#Specifying-the-text-encoding)
   5. [Feature interpretation of lists](https://delph-in.github.io/docs/tools/TdlRFC#Feature-interpretation-of-lists)
   6. [Type documentation](https://delph-in.github.io/docs/tools/TdlRFC#Type-documentation)
   7. [Comments](https://delph-in.github.io/docs/tools/TdlRFC#Comments)
   8. [Case sensitivity](https://delph-in.github.io/docs/tools/TdlRFC#Case-sensitivity)
3. [Deprecated TDL Features](https://delph-in.github.io/docs/tools/TdlRFC#Deprecated-TDL-Features)
   1. [Subtyping Operator (:&lt;)](https://delph-in.github.io/docs/tools/TdlRFC#subtyping-operator-)
   2. [Single-quoted Symbols ('symbol)](https://delph-in.github.io/docs/tools/TdlRFC#Single-quoted-Symbols-symbol)
4. [Open Questions](https://delph-in.github.io/docs/tools/TdlRFC#Open_Questions)
5. [Discussions](https://delph-in.github.io/docs/tools/TdlRFC#Discussions)

## TDL File Syntax
The following describes the TDL language in [Lark](https://lark-parser.readthedocs.io/en/latest/index.html) [EBNF](https://en.wikipedia.org/wiki/Extended_Backus–Naur_form)
syntax. Productions are separated into thematic sections. ALL-CAPS rule names are for non-content terminals, which appear
at the bottom of the description.

Note that in Lark, forward-slash delimiters `/[Mm]atch me/` are used to designate regular expressions, and are not
themselves part of the matched text.

```lark
// File Contents
//
// Note: The LKB does not parse environments (:begin ... :end), nor does it
//       support :include statements, so the following are only applicable for
//       PET, ACE, and agree.

tdl_file      : ( environment | statement | SPACING )* EOF
environment   : BEGIN TYPE DOT type_env END TYPE DOT
              | BEGIN INSTANCE status? DOT instance_env END INSTANCE DOT
type_env      : ( environment | statement
                | type_def | type_addendum | SPACING )*
instance_env  : ( environment | statement
                | instance_def | letterset | wildcard | SPACING )*
status        : STATUS ( "generic-lex-entry"
                       | "lex-entry"
                       | "lexical-filtering-rule"
                       | "lex-rule"
                       | "post-generation-mapping-rule"
                       | "rule"
                       | "token-mapping-rule" ) SPACING

// Note: The LKB has several Lisp functions which open files in specified
//       environments, so the following are parsing targets for those
//       functions.

tdl_type_file : ( type_def | type_addendum | SPACING )* EOF
tdl_rule_file : ( instance_def | letterset | wildcard | SPACING )* EOF

// Note: Krieger & Schaeffer 1994 define a large number of statements, but
//       DELPH-IN grammars appear to only use :include.
// Note: :include's string argument is a path relative to the current file's
//       directory. If the filename extension is not given, the default ".tdl"
//       extension is used. The file is opened in the same environment as the
//       :include statements (e.g., :include in a type environment opens the
//       file and parses it as type_env)

statement     : include
include       : INCLUDE filename DOT
filename      : DQSTRING

// Types and Instances
//
// Note: Instances may be syntactically identical to type definitions, but they
//       do not affect the type hierarchy. They may also be lexical rule
//       definitions that include an affixing pattern to a definition.

type_def      : type_name DEFOP type_def_body DOT
type_addendum : type_name ADDOP addendum_body DOT
type_name     : IDENTIFIER SPACING

instance_def  : type_def | lex_rule_def
lex_rule_def  : lex_rule_id DEFOP affix? type_def_body DOT
lex_rule_id   : IDENTIFIER SPACING

// Identifiers are used in several patterns
//
// Note: The characters disallowed in identifiers are chosen to avoid ambiguity
//       with other parts of the TDL syntax.

IDENTIFIER    : /[^\s!"#$%&'(),.\/:;<=>[\]^|]+/

// Definition Bodies (top-level conjunctions of terms)
//
// Note: Definition bodies are most simply conjunctions, but several
//       variations require special productions:
//
//       (1) """Docstrings""" may precede any top-level term or the final DOT
//       (2) type_def and lex_rule_def require at least one type_name
//       (3) type_addendum may use a DOCSTRING in place of a conjunction

type_def_body : typed_conj DOCSTRING?
addendum_body : doc_conj DOCSTRING? | DOCSTRING

// Note: To accommodate type_def_body and addendum_body, three special
//       conjunctions are added:
//
//       (1) typed_conj has an obligatory type_name term
//       (2) feature_conj excludes type terms (including strings, etc.)
//       (3) doc_conj is a regular conjunction with optional DOCSTRINGs
//
//       Note that feature_conj is only necessary to reduce ambiguity (e.g.,
//       for LALR parsing); if ambiguity is allowed, doc_conj may be used.

typed_conj    : ( feature_conj AND )? DOCSTRING? type_name ( AND doc_conj )?
feature_conj  : DOCSTRING? feature_term ( AND DOCSTRING? feature_term )*
doc_conj      : DOCSTRING? term ( AND DOCSTRING? term )*

// Note: The DOCSTRING pattern may span multiple lines

DOCSTRING     : /"""([^"\\]|\\.|"(?!")|""(?!"))*"""/ SPACING

// Terms and Conjunctions

conjunction   : term ( AND term )*
term          : type_term | feature_term | coreference
type_term     : type_name
              | DQSTRING
              | REGEX
feature_term  : avm
              | diff_list
              | cons_list

DQSTRING      : ( /""(?!")/ | /"([^"\\]|\\.)+"/ ) SPACING
REGEX         : "^" /([^$\\]|\\.)*/ "$" SPACING

avm           : AVMOPEN attr_vals? AVMCLOSE
attr_vals     : attr_val ( COMMA attr_val )*
attr_val      : attr_path SPACE conjunction
attr_path     : ATTRIBUTE ( DOT ATTRIBUTE )*
ATTRIBUTE     : IDENTIFIER SPACING

diff_list     : DLOPEN conjunctions? DLCLOSE
cons_list     : CLOPEN ( conjunctions cons_end? )? CLCLOSE
cons_end      : COMMA ELLIPSIS | DOT conjunction
conjunctions  : conjunction ( COMMA conjunction )*

coreference   : "#" IDENTIFIER SPACING

// Letter-sets, Wild-cards, and Affixes
//
// Note: spacing is sensitive within these patterns, so many non-content
//       terminals are used directly with an explicit SPACE instead of in
//       a production with SPACING.

letterset     : "%(letter-set" SPACE? letterset_def SPACE? ")" SPACING
wildcard      : "%(wild-card" SPACE? wildcard_def SPACE? ")" SPACING
letterset_def : "(" LETTERSETVAR SPACE CHARACTERS ")"
wildcard_def  : "(" WILDCARDVAR SPACE CHARACTERS ")"
LETTERSETVAR  : /![^ ]/
WILDCARDVAR   : /\?[^ ]/
CHARACTERS    : /([^)\\]|\\.)+/

// Note: When a LETTERSETVAR is used in an affix_match, the same LETTERSETVAR
//       in the affix_sub copies the matched character, in order, so there
//       should be the same number of LETTERSETVARs in both, but this is not
//       captured in the syntax.

affix         : affix_class affix_pattern+ SPACING
affix_class   : "%prefix" | "%suffix"
affix_pattern : SPACE? "(" affix_match SPACE affix_sub ")"
affix_match   : NULLCHAR | char_list
affix_sub     : char_list
NULLCHAR      : "*"
char_list     : ( LETTERSETVAR | WILDCARDVAR | AFFIXCHAR )+
AFFIXCHAR     : /([^!?\s*\\]|\\[^ ])+/

// Whitespace and Comments
//
// Note: SPACE and BlockComment may span multiple lines. Also, while block
//       comments in Lisp may be nested (`#| outer #| inner |# outer |#`),
//       support for nested comments in TDL is mixed (ACE supports it, the
//       LKB does not), so this definition does not nest.

SPACING       : SPACE? COMMENT*
SPACE         : /\s+/
COMMENT       : ( LINECOMMENT | BLOCKCOMMENT ) SPACE?
LINECOMMENT   : /;.*$/
BLOCKCOMMENT  : "#|" /([^|\\]|\\.|\|(?!#))*/ "|#"

// Non-content Terminals

BEGIN         : ":begin" SPACING
TYPE          : ":type" SPACING
INSTANCE      : ":instance" SPACING
STATUS        : ":status" SPACING
INCLUDE       : ":include" SPACING
END           : ":end" SPACING
DEFOP         : ":=" SPACING
ADDOP         : ":+" SPACING
DOT           : "." SPACING
AND           : "&" SPACING
COMMA         : "," SPACING
AVMOPEN       : "[" SPACING
AVMCLOSE      : "]" SPACING
DLOPEN        : "<!" SPACING
DLCLOSE       : "!>" SPACING
CLOPEN        : "<" SPACING
CLCLOSE       : ">" SPACING
ELLIPSIS      : "..." SPACING
EOF           : ""  // end-of-file
```

## TDL File Interpretation and Conventions

### Layout of a type definition

Some parts of a type definition are mandated by TDL syntax, such as the
initial identifier, the main operator, and the final dot:

```scheme
identifier := (definition body) .
```

The definition body is just a conjunction of terms, maybe with
documentation strings, and there is much valid variation in how those
terms are arranged. Nevertheless, there are conventional locations for
these terms depending on what kind of term they are. For instance, the
supertypes are generally listed first, followed by an AVM:

```scheme
head_only := unary_phrase & headed_phrase &
  [ HD-DTR #head & [ SYNSEM.LOCAL.CONJ cnil ],
    ARGS < #head > ].
```

If a documentation string is specified, the conventional place is before
the AVM:

```scheme
n_-_ad-pl_le := norm_np_adv_lexent &
"""
<description>N, can modify, locative (place)
<ex>B lives overseas.
<nex>
<todo>
"""
  [ SYNSEM.LOCAL [ CAT.HEAD [ MINORS.MIN place_n_rel,
                              CASE obliq ],
                   CONT.HOOK.INDEX.SORT place ] ].
```

Or if there is no AVM, before the final dot:

```scheme
info-str := icons
  """Type for underspecified or "neutral" information structure.""".
```

### Types versus instances

Are <strike>instances</strike> entries distinguishable from types? Are they (or other
entities) restricted to having exactly one supertype?

There is a detailed discussion of this in §4.4.5 of "Implementing Typed Feature
Strucutre Grammars" (Copestake 2002, p.106; also footnote 18 on p.37). Grammar "entries"
are not present as types in the computed type hierarchy. The reason for the "one supertype"
recommendation is that if there is no such single type, then the authored rule is *a priori*
invalid due to unification failure. Having said this, the suggested implementation is that an
entry description *shall* be allowed to specify multiple conjoined parent types, and the
entry will be accepted if and only if those types successfully unify when the grammar is
loaded.

### Type addenda (`:+`)

A single type definition can be split across multiple TDL files by using the type addendum `:+` operator. The final
type definition includes the union of all the gathered TDL. For the identifiers and constraint AVMs, this implies
unification, so any duplication amongst disparate parts is vacuous and any conflicts are resolved by unification.
DocStrings and other metadata should be merged (concatenated) under `:+`.

Note that `:+` may only be used with types, and not grammar entries ("instances"). This is by spec only,
and thus could accordingly be changed. Since the usage is unexplored by known grammars, the behavior
across lkb/ace/pet/agree may differ here.

### Specifying the text encoding

The text encoding of TDL files can be specified using a special comment
on the first line of the file, as is done with many scripting languages.
For instance, the following sets the encoding to UTF-8:

```scheme
; -*- coding: utf-8 -*-
```

In some TDL files, attributes specific to the
[Emacs](https://www.gnu.org/software/emacs/) text editor may be
included:

```scheme
;;; -*- Mode: tdl; Coding: utf-8; indent-tabs-mode: nil; -*-
```

### Feature interpretation of lists

The `< ... >` and `<! ... !>` shorthand for lists ("cons lists")
and diff-lists, respectively, correspond to normal attribute-value
pairs. The implementation relies on an encoding scheme where the first
list item (the list's head) is at the feature FIRST while the rest of
the list (the tail) is defined recursively under the feature REST (e.g.,
REST.REST.FIRST is the third element). The types associated with open
and closed lists, and sometimes even the feature names, are configurable
by the grammar.

|                        |               |                     |                    |
|------------------------|---------------|---------------------|--------------------|
| **entity**             | **example**   | **LKB config**      | **ACE config**     |
| cons-list type         | \*cons\*      | (not configurable)  | cons-type          |
| open list type         | \*list\*      | \*list-type\*       | list-type          |
| closed list type       | \*null\*      | \*empty-list-type\* | null-type          |
| diff-list type         | \*diff-list\* | \*diff-list-type\*  | diff-list-type     |
| list head feature      | FIRST         | \*list-head\*       | (not configurable) |
| list tail feature      | REST          | \*list-tail\*       | (not configurable) |
| diff-list list feature | LIST          | \*diff-list-list\*  | (not configurable) |
| diff-list last feature | LAST          | \*diff-list-last\*  | (not configurable) |

For the examples below, I use the values defined in the above table,
which are taken from the ERG.

#### Cons Lists

Regular cons lists may be open (extendable) or closed (fixed-length).
The type of an open list as interpreted by, e.g., `< ... >`, is
\*list\* (rather, the defined open list type), but in hand-written TDL a
subtype of \*list\* is often used, such as \*cons\*.

```scheme
; an empty list is terminated (always empty)
[ ATTR < > ]             =>  [ ATTR *null* ]
; single item goes on FIRST attribute and REST is terminated
[ ATTR < a > ]           =>  [ ATTR *list* & [ FIRST a,
                                               REST *null* ] ]
; items after the first go on (REST.)+FIRST
[ ATTR < a, b > ]        =>  [ ATTR *list* & [ FIRST a,
                                               REST [ FIRST b,
                                                      REST *null* ] ] ]
; an empty list with ... is not terminated
[ ATTR < ... > ]         =>  [ ATTR *list* ]
; this also works with items on the list
[ ATTR < a, ... > ]      =>  [ ATTR *list* & [ FIRST a,
                                               REST *list* ] ]
; the . delimiter allows a non-*list*, non-*null* value for the last REST
[ ATTR < a . #coref > ]  =>  [ ATTR *list* & [ FIRST a,
                                               REST #coref ] ]
```

#### Diff Lists

Diff lists are regular lists under a LIST attribute, and LAST points to
the last item. Diff lists don't support the unterminated-list
functionality of cons lists, but they allow for appending lists of
arbitrary size (see [[GeFaqDiffList]]).

```scheme
[ ATTR <! !> ]           =>  [ ATTR *diff-list* & [ LIST #coref,
                                                    LAST #coref ] ]

[ ATTR <! a !> ]         =>  [ ATTR *diff-list* & [ LIST *list* & [ FIRST a,
                                                                    REST #coref ],
                                                    LAST #coref ] ]
```

### Type documentation

TDL definitions allow documentation strings ("docstrings") before any
term in the top-level conjunction or before the terminating dot (`.`)
character:

```scheme
n_-_c_le := n_intr_lex_entry
"""Intransitive count noun (icn)
<ex>The dog barked.
<nex>Much dog bark.""".
```

Multiple docstrings may be present on a single definition, but only the
first one encountered on a definition is considered its primary
docstring, and implementers are free to store or discard the other doc
strings as they see fit. Docstrings on type-addenda should be
concatenated with a newline to the previous docstring(s), or appended to
a list of docstrings, associated with the type.

In accordance with the BNF description above, an example maximal (*but not
recommended*) use case for DocStrings would be as follows:

```scheme
some_rule := """ds1""" headed & """ds2""" clause & """ds3"""
  [ SYNSEM [ LOCAL.CAT.MC +,
    NONLOC [ SLASH 0-dlist,
             QUE 0-dlist ] ] ] """ds4""" .
```

Of course, whitespace choices, such as the placement of DocStrings and
other TDL elements inline, versus on new lines of their own, are free to
vary.

Before the DocString specification was established, some [[LTDB|LkbLtdb]] users
deployed type documentation by a convention of structured text in a comment
immediately preceding the documented type:

```scheme
; <type val="case-p-lex-np-to">
; <name-ja>承名詞目的格助詞ト
; <description>case-p-lex-np-wo を参照。この type は助詞「と」。
; <ex>部長 と 会う
; <nex>ゆっくり と 進む
; <todo>
; </type>
case-p-lex-np-to := case-p-lex-np &
  [SYNSEM.LOCAL.CAT.HEAD.CASE to].
```

### Comments

The syntax description above allows for block comments anywhere that
separating whitespace is allowed (not including those within strings,
regular expressions, letter sets, etc.). This includes within a dotted
attribute path (e.g.,
`[ SYNSEM #| comment |# . #| comment |# LOCAL ... ]`), although
grammar developers may want to use this flexibility sparingly.

This is as opposed to `;`-style comments, since the latter are inherently
associated with exactly one line of TDL.

### Case sensitivity

#### Case Sensitive

- Things inside quotes (NB: strings passed from TFS world into MRS can
be treated as case insensitive in MRS processing (i.e. as predicate
symbols, but not CARGs)

#### Case Insensitive

- Everything in TDL not inside of quotes.
- Lexicon look-up.
  - Proper names?
  - Acronyms?
- .. approach these with token-mapping (preserve the info, and then
downcase anyway)

#### Unknown

- Orthographic subrules (agree: case sensitive, ACE: \[intended\] case
insensitive)

Notes: Arguments for case insensitive include shouting (call caps);
Arguments for case sensitive include the use of upper case vowels in
vowel harmony languages (linguistic representations, not orthography)

## Deprecated TDL Features

The following are deprecated features of DELPH-IN TDL. They are no
longer considered part of the format, but implementers of TDL parsers
may want to include them for backward compatibility. If so, they are
encouraged to print warnings upon encountering the deprecated forms so
grammar developers know to change them.

### Subtyping Operator (`:<`)

The `:<` operator was originally used only for declaring a type's
position in the type hierarchy (i.e., features could not be specified,
unlike with `:=`), but eventually this constraint was relaxed and it
became equivalent to `:=`. As of Autumn 2018, the form has been removed
and is no longer considered part of DELPH-IN TDL, but the change to TDL
syntax to support the operator is minimal:

```lark
DEFOP         : ( ":=" | ":<" ) SPACING
```

### Single-quoted Symbols (`'symbol`)

Double-quoted strings and identifiers are both type names, but there
used to be Lisp-like single-quoted symbols as well. These still exist in
some grammars, such as those using an old version of
[[matrix.tdl|MatrixTop]], which has the following:

```scheme
implicit-coord-rel := coordination-relation &
  [ PRED 'implicit_coord_rel ].
null-coord-rel := coordination-relation &
  [ PRED 'null_coord_rel ].
```

There is no difference between using quoted symbols and regular strings
or identifiers (although identifiers would need to be defined as types
somewhere), so recent versions of matrix.tdl have this instead:

```scheme
implicit-coord-rel := coordination-relation &
  [ PRED "implicit_coord_rel" ].
null-coord-rel := coordination-relation &
  [ PRED "null_coord_rel" ].
```

The change to the syntax to support quoted symbols is as follows:

```lark
type_term     : type_name
              | DQSTRING
              | REGEX
              | QSYMBOL
QSYMBOL       : "'" IDENTIFIER SPACING
```

## Open Questions

1. The `^` character is used to signal "expanded-syntax" in the LKB, but
is this only used for regular expressions? Are there other expanded
syntaxes? Do non-LKB processors support them? (see [this
thread](http://lists.delph-in.net/archives/developers/2009/thread.html#1082)
on the 'developers' mailing list)
2. Can we use 'status' to identify roots and labels (parsenodes)?
Something like
   
   ```scheme
   ;;
   ;; parse-tree labels (instances)
   ;;
   
   :begin :instance :status label.
   :include "parse-nodes".
   :end :instance.
   
   ;;
   ;; start symbols of the grammar (instances)
   ;;
   
   :begin :instance. :status root.
   :include "roots".
   :include "educ/roots-educ".
   :end :instance.
   ```

## Discussions

- [[ParisDefeasibleConstraints]]
- [[StanfordDefaults]]
- [(Diff)List Appends in TDL](http://www.delph-in.net/2017/append.pdf)
- [Mailing list discussion about docstrings
(Feb 2006)](http://lists.delph-in.net/archives/developers/2006/000419.html)
- [Mailing list discussion about type addenda
(Jul 2006)](http://lists.delph-in.net/archives/developers/2006/000550.html)
- [Mailing list discussion about docstrings
(Mar 2007)](http://lists.delph-in.net/archives/developers/2007/000762.html)
- [Mailing list discussion about docstrings
(Sep 2007)](http://lists.delph-in.net/archives/developers/2007/000868.html)
- [Mailing list discussion about the :+ and :&lt; operators
(Nov 2008)](http://lists.delph-in.net/archives/developers/2008/001037.html)
- [Mailing list discussion about regular expressions in TDL
(Jan 2009)](http://lists.delph-in.net/archives/developers/2009/001082.html)
- [Mailing list discussion about TDL syntax
(Jul 2018)](http://lists.delph-in.net/archives/developers/2018/002754.html)
- [Mailing list discussion about docstrings
(Aug 2018)](http://lists.delph-in.net/archives/developers/2018/002792.html)

Last update: 2025-05-20 by Michael Wayne Goodman [[edit](https://github.com/delph-in/docs/wiki/TdlRFC/_edit)]{% endraw %}