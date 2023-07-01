{% raw %}# Request For Comments: MRS

## Overview

Minimal Recursion Semantics (MRS; see Copestake et al., 2005) is a
framework for computational semantics characterised by a flat structure
(hence the "minimal recursion"). It allows for underspecification, so
true scopal ambiguities can be left ambiguous, or fully specified if
needed. This RFC aims to be a reference document for developers writing
code to process MRSs. See below for the formal
properties of MRS objects. For ways to
represent MRS objects textually, see the serialization
formats section.

Unless otherwise noted, most information below is adapted from Copestake
et al. (2005). The reader is referred to this paper for more information
on the theory of MRS.

Here is an example in the Simple-MRS serialization of the sentence "The
road rises from there."

```
[ LTOP: h1
  INDEX: e2 [ e SF: PROP TENSE: PRES MOOD: INDICATIVE PROG: - PERF: - ]
  RELS: < [ _the_q_rel<0:3> LBL: h3 ARG0: x5 [ x PERS: 3 NUM: SG IND: + ] RSTR: h6 BODY: h4 ]
          [ "_road_n_1_rel"<4:8> LBL: h7 ARG0: x5 ]
          [ "_rise_v_1_rel"<9:14> LBL: h8 ARG0: e2 ARG1: x5 ]
          [ _from_p_dir_rel<15:19> LBL: h8 ARG0: e9 [ e SF: PROP TENSE: UNTENSED MOOD: INDICATIVE PROG: - PERF: - ] ARG1: e2 ARG2: x10 [ x PERS: 3 NUM: SG ] ]
          [ place_n_rel<20:26> LBL: h11 ARG0: x10 ]
          [ def_implicit_q_rel<20:26> LBL: h12 ARG0: x10 RSTR: h13 BODY: h14 ]
          [ _there_a_1_rel<20:26> LBL: h11 ARG0: e15 [ e SF: PROP TENSE: UNTENSED MOOD: INDICATIVE PROG: - PERF: - ] ARG1: x10 ] >
  HCONS: < h6 qeq h7 h13 qeq h11 > ]
```

## Formal Properties

As defined by [Copestake et al. 2005](https://www.cl.cam.ac.uk/~aac10/papers/mrs.pdf), MRS objects are partly composed of Elementary Predications (EPs), which are defined as the following 4-tuple:

```
EP : < h, p, a, s >
```

Where:
- h is the handle, or label, of the EP
- p is the relation, or ["predicate"](https://delph-in.github.io/docs/tools/PredicateRfc)
- a is a list of 0 or more variable arguments of the relation
- s is a list of 0 or more scopal arguments of the relation

An MRS structure is the following triple:

```
MRS : < gt, r, c >
```

Where:
- gt is the top handle (the label of the highest EP)
- r is a bag of EPs
- c is a bag of handle constraints

Modern usage of MRS, however, introduces several other elements that
were not discussed in Copestake et al. 2005, leading to these expanded
definitions:

```
EP : < h, p, a, s, c >
```

Where:

- c is a constant value (e.g. a string, for numbers, names, etc.)

```
MRS : < gt, ind, r, c, i >
```

Where:
- ind is an index (i.e. the top individual as opposed to the top
handle)
- i is a bag of individual constraints (i.e. ICONS)

The additional elements are explained below.

#### Constant Value

Proper names, like "Kim" or "IBM", do not always get their own
predicate, but rather their name value is a constant string on a
general-purpose named\_rel. The same thing happens with numbers and the
generic card\_rel. The value of a constant argument is not a variable,
handle, or hole, but just a string that is not reentrant to the MRS
graph. Most kinds of predications do not include a constant argument.

**Note for Developers**

The XML format for MRS clearly distinguishes &lt;constant&gt; and
&lt;var&gt; argument values, but other serializations do not make it as
clear. If one has access to grammar definition files, then there are a
definitions for the argument name for a constant argument
(\*value-feats\* for the LKB and mrs-value-feat for PET). These
definitions suggest that a predication may contain no more than one
constant argument. Without such definitions, a solution may be to look
for argument values that are quoted, or simply ones that don't look like
variables, and treat those as constant values.

#### INDEX

There is some debate about the status of INDEX. It is not part of the
formal definition of a complete MRS (see Copestake et al., 2005), hence
Ann has at times argued it should be suppressed when constructing an MRS
from its TFS description. On that point of view, INDEX is an element of
the composition process, but not the 'final' product.

Conversely, it has been argued (by Dan and Francis, among others) that
composition does not stop at the utterance level, i.e. if we were to
move into discourse-level analysis, we might still need access to INDEX.
Furthermore, in semantic transfer it is often convenient to have access
to the INDEX (even more so as the current ERG leaves the TOP
underspecified). In conclusion, as of mid-2011, I believe INDEX can be
considered a legitimate component of MRSs, even though it remains true
that it has a slightly different formal status than the others

#### Individual Constraints (ICONS)

Where handle constraints encode relations between holes and labels,
individual constraints encode relations between individual
(referential-index or eventuality) variables. One use of
[ICONS](https://delph-in.github.io/docs/tools/IconsSpecs) is for encoding Information Structure (see [Song and
Bender,
2012](http://cslipublications.stanford.edu/HPSG/2012/song-bender.pdf)).
Individual Constraints are supported by most processors of MRS, but,
being relatively new, are not yet used by most grammars.

**Note for Developers**

Unlike handle constraints, individual constraints may use variables that
are not instantiated on a predication (e.g., for a dropped or contextual
predication). Furthermore, they do not always co-occur with any scopal
or non-scopal arguments.

## General Remarks

Predicate names are *not* case-sensitive, but constants (CARGs) are.
Furthermore, even though much current MRS manipulation software
maintains a distinction between double-quoted predicate names
(corresponding to Lisp strings) and non-quoted ones (corresponding to
Lisp symbols, often naming types in some hierarchy); this distinction is
not meaningful either and arguably should be suppressed in MRS in- and
output. More information is available at [PredicateRfc](https://delph-in.github.io/docs/tools/PredicateRfc).

## Serialization Formats

### Simple

This is a BNF for the commonly used v1.0 form of SimpleMRS:

```
MRS          := "[" Top Index Rels Hcons "]"
Top          := "LTOP" ":" Handle
Index        := "INDEX" ":" Var
Handle       := Variable
Var          := Variable VarProps?
Variable     := /[A-Za-z][-A-Za-z]*\d+/
VarProps     := "[" VarSort ExtraPair* "]"
VarSort      := /[A-Za-z][-A-Za-z]*/
ExtraPair    := Path ":" Value
Path         := /[A-Za-z]\w+/
Value        := Token | QuotedString
Token        := /[^:\]>\s]+/
QuotedString := /"[^"\\]*(?:\\.[^"\\]*)*"/
Rels         := "RELS" ":" "<" EP* ">"
EP           := "[" Pred Lnk? Label Rarg* Carg? "]"
Pred         := StringPred | TypePred
StringPred   := QuotedString
TypePred     := /_?([^_\s]+_)*(_rel)?/
Lnk          := "<" /-?\d+/ ":" /-?\d+/ ">"
Label        := "LBL" ":" Handle
Rarg         := RargName ":" Var
RargName     := Token
Carg         := "CARG" ":" Value
Hcons        := "HCONS" ":" "<" Hcon* ">"
Hcon         := Var HconReln Handle
HconReln     := "qeq" | "lheq" | "outscopes"
```

The newer v1.1 format redefines some symbols to allow SimpleMRS to
encode nearly all the same information as the XML format, including
MRS-level Lnk values and surface strings. It also changes "LTOP" to
"TOP" and includes ICONS. The following are just the redefined and
additional symbols from the v1.0 BNF.

```
MRS          := "[" Lnk? Surface? Top Index Rels Hcons Icons? "]"
Top          := "TOP" ":" Handle
EP           := "[" Pred Lnk? Surface? Label Rarg* Carg? "]"
Surface      := QuotedString
Icons        := "ICONS" ":" "<" Icon ">"
Icon         := Var IconReln Var
IconReln     := Token
```

##### Other notes

The BNFs above are strict in some places, but robust in others. It also
leaves out possible variations.

- Variable, VarSort, and Path (variable property key) are perhaps too
strict
- Token, StringPred, and TypePred are perhaps too permissive
- IconReln and RargName (and even Path) could be more specifically
defined, but they depend on the grammar
- Lnk only includes the character-span lnk type, but there are 3 other
(uncommon and less-supported) types: chart-span, edge-number, and
token-list

### XML

This [RelaxNG](http://relaxng.org/) compact schema defines the XML
format for MRS (aka *MRX*). Note that this version includes ICONS, while
the [original
DTD](http://svn.emmtee.net/trunk/lingo/lkb/src/mrs/mrs.dtd) does not.

```
start = MrsList
MrsList = element mrs-list { Mrs* }
Mrs = element mrs {
  Label,
  Var,
  (EP|Hcons|Icons)*,
  attribute cfrom { xsd:int }?,
  attribute cto { xsd:int }?,
  attribute surface { text }?,
  attribute ident { text }?
}
EP = element ep {
  (Pred|SPred|RealPred),
  Label,
  FVPair*,
  attribute cfrom { xsd:int }?,
  attribute cto { xsd:int }?,
  attribute surface { text }?,
  attribute base { text }?
}
Pred = element pred { text }
SPred = element spred { text }
RealPred = element realpred {
  attribute lemma { text },
  attribute pos { xsd:string { pattern="[nvajrscpqxud]" } },
  attribute sense { text }?
}
Label = element label {
  ExtraPair*,
  attribute vid { xsd:int }
}
Var = element var {
  ExtraPair*,
  attribute vid { xsd:int },
  attribute sort { text }
}
ExtraPair = element extrapair {
  element path { text },
  element value { text }
}
FVPair = element fvpair {
  element rargname { text },
  ( Var | element constant { text } )
}
Hcons = element hcons {
  element hi { Var },
  element lo { ( Label | Var ) },
  attribute hreln { "qeq" | "lheq" | "outscopes" }
}
Icons = element icons {
  element left { Var },
  element right { Var },
  attribute ireln { text }
}
```

### JSON

**Non-final**

This format is largely decided, but it is not explicitly finalized and
may change in the future.

The development of the REST API called for JSON
serializations of many formats. Here is an example JSON serialization of
MRS for "It is Abrams that the dog barked at.".

```
{
  "top": "h0",
  "index": "e2",
  "relations": [
    {"predicate": "proper_q", "label": "h4", "lnk": {"from": 6, "to": 12},
      "arguments": {"ARG0": "x5", "BODY": "h7", "RSTR": "h6"}},
    {"predicate": "named", "label": "h8", "lnk": {"from": 6, "to": 12},
      "arguments": {"ARG0": "x5", "CARG": "Abrams"}},
    {"predicate": "_the_q", "label": "h10", "lnk": {"from": 13, "to": 16},
      "arguments": {"ARG0": "x11", "BODY": "h13", "RSTR": "h12"}},
    {"predicate": "_dog_n_1", "label": "h14", "lnk": {"from": 17, "to": 20},
      "arguments": {"ARG0": "x11"}},
    {"predicate": "_bark_v_1", "label": "h1", "lnk": {"from": 21, "to": 27},
      "arguments": {"ARG0": "e15", "ARG1": "x11"}},
    {"predicate": "_at_p_temp", "label": "h1", "lnk": {"from": 28, "to": 31},
      "arguments": {"ARG0": "e16", "ARG1": "e15", "ARG2": "x5"}}
  ],
  "constraints": [
    {"relation": "qeq", "high": "h0", "low": "h1"},
    {"relation": "qeq", "high": "h6", "low": "h8"},
    {"relation": "qeq", "high": "h12", "low": "h14"},
    {"relation": "focus", "left": "e15", "right": "x5"}
  ]
  "variables": {
    "h0": {"type": "h"},
    "h1": {"type": "h"},
    "e2": {"type": "e", "properties": {"PROG": "-", "SF": "prop", "TENSE": "pres", "PERF": "-", "MOOD": "indicative"}},
    "h4": {"type": "h"},
    "x5": {"type": "x", "properties": {"NUM": "sg", "IND": "+", "PERS": "3"}},
    "h6": {"type": "h"},
    "h7": {"type": "h"},
    "h8": {"type": "h"},
    "h10": {"type": "h"},
    "x11": {"type": "x", "properties": {"NUM": "sg", "IND": "+", "PERS": "3"}},
    "h12": {"type": "h"},
    "h13": {"type": "h"},
    "h14": {"type": "h"},
    "e15": {"type": "e", "properties": {"MOOD": "indicative", "SF": "prop", "TENSE": "past"}},
    "e16": {"type": "e", "properties": {"PROG": "-", "SF": "prop", "TENSE": "untensed", "PERF": "-", "MOOD": "indicative"}}
  },
}
```

Note the following:

- the short-form of predicates is used
- variable sort and properties are in a mapping called "variables"
- HCONS and ICONS are combined in a "constraints" list

There is no official schema format for JSON, but [JSON
Schema](http://json-schema.org) seems to be gaining traction. Here is a
schema that validates the above JSON format (see
[here](http://json-schema.org/implementations.html) for software that
can be used to validate documents with JSON Schema).

```
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "title": "MRS",
  "description": "Minimal Recursion Semantics",
  "type": "object",
  "required": ["relations", "constraints", "variables"],
  "properties": {
    "top": {
      "description": "The scopal TOP of the MRS",
      "$ref": "#/definitions/handle"
    },
    "index": {
      "description": "The semantic INDEX of the MRS",
      "$ref": "#/definitions/variable"
    },
    "relations": {
      "description": "A collection of elementary predications (EPs)",
      "type": "array",
      "items": {
        "type": "object",
        "required": ["predicate", "label", "arguments"],
        "properties": {
          "predicate": {
            "oneOf": [
              {
                "description": "A surface predicate",
                "type": "string",
                "pattern": "^_[^_]+_[a-z](_[^_]+)?$"
              },
              {
                "description": "An abstract predicate",
                "type": "string",
                "pattern": "^[^_][^ ]*$"
              },
              {
                "description": "A real (i.e. composite) predicate",
                "type": "object",
                "required": ["lemma", "pos"],
                "properties": {
                  "lemma": {"type": "string"},
                  "pos": {
                    "type": "string",
                    "pattern": "^[a-z]$"
                  },
                  "sense": {"type": "string"}
                }
              }
            ]
          },
          "label": {"$ref": "#/definitions/handle"},
          "lnk": {"$ref": "#/definitions/lnk"},
          "arguments": {
            "type": "object",
            "patternProperties": {
              "^[^ ]+$": {
                "anyOf": [
                  {"$ref": "#/definitions/variable"},
                  {"type": "string"}
                ]
              }
            }
          }
        }
      }
    },
    "constraints": {
      "description": "A collection of variable constraints",
      "type": "array",
      "items": {
        "oneOf": [
          {
              "description": "A handle constraint (HCONS)",
              "type": "object",
              "required": ["relation", "high", "low"],
              "properties": {
                "relation": {"enum": ["qeq", "lheq", "outscopes"]},
                "high": {"$ref": "#/definitions/handle"},
                "low": {"$ref": "#/definitions/handle"}
              }
          },
          {
              "description": "An individual constraint (ICONS)",
              "type": "object",
              "required": ["relation", "left", "right"],
              "properties": {
                "relation": {"enum": ["qeq", "lheq", "outscopes"]},
                "left": {"$ref": "#/definitions/variable"},
                "right": {"$ref": "#/definitions/variable"}
              }
          }
        ]
      }
    },
    "variables": {
      "patternProperties": {
        "^(h|handle)[0-9]+$": {
          "type": "object",
          "required": ["type"],
          "properties": {
            "type": {"$ref": "#/definitions/variable-type"}
          }
        },
        "^([-a-zA-Z0-9_]*[-a-zA-Z_])([0-9]+)$": {
          "type": "object",
          "required": ["type"],
          "properties": {
            "type": {"$ref": "#/definitions/variable-type"},
            "patternProperties": {
              "^[^ ]+$": {"type": "string"}
            }
          }
        }
      }

    }
  },
  "definitions": {
    "lnk": {
      "type": "object",
      "required": ["from", "to"],
      "properties": {
        "from": {"type": "integer"},
        "to": {"type": "integer"}
      }
    },
    "handle": {
      "type": "string",
      "pattern": "^(h|handle)[0-9]+$"
    },
    "variable": {
      "type": "string",
      "pattern": "^([-a-zA-Z0-9_]*[-a-zA-Z_])([0-9]+)$"
    },
    "variable-type": {
      "type": "string",
      "pattern": "^([-a-zA-Z0-9_]*[-a-zA-Z_])$"
    }
  }
}
```

### Indexed

Mostly for historical interest, here is an example of the Indexed MRS
format for the sentence "Abrams barked.":

    < h1,e3:PROP:PAST:INDICATIVE:-:-,
     {h4:proper_q<0:6>(x6:3:SG:+, h5, h7),
      h8:named<0:6>(x6, "Abrams"),
      h2:_bark_v_1<7:14>(e3, x6)},
     {h1 qeq h2,
      h5 qeq h8} >

It is one of the most compact formats because it omits role and property
names. This means, however, that it is necessary to use a
[SEM-I](https://delph-in.github.io/docs/tools/SemiRfc) for serialization and deserialization in order to map
argument/property indices to role/property names. A BNF, adapted from
comments in the [LKB
source](http://svn.emmtee.net/trunk/lingo/lkb/src/mrs/basemrs.lisp), is
as follows (with some productions borrowed from the SimpleMRS BNF):

```
MRS    := "<" Ltop "," Index "," Rels "," Hcons ( "," Icons )? ">"
Ltop   := Variable
Index  := Var
Rels   := "{" ( EP ( "," EP )* )? "}"
Hcons  := "{" ( HC ( "," HC )* )? "}"
Icons  := "{" ( IC ( "," IC )* )? "}"
EP     := Variable ":" PredName Lnk? "(" Arg ( "," Arg )* ")"
Arg    := Var | QuotedString | ConstName
Var    := Variable (":" ConstName)*
HC     := Variable HCReln Variable
HCReln := "qeq" | "lheq" | "outscopes"
IC     := Variable ICReln Variable
ICReln := ConstName
ConstName := Token
```

Last update: 2021-09-02 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/MrsRFC/_edit)]{% endraw %}