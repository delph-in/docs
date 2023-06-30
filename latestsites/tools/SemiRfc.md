{% raw %}# SEM-I

Contents

1. [SEM-I](https://delph-in.github.io/docs/tools/SemiRfc#SEM-I)
   1. [Sections](https://delph-in.github.io/docs/tools/SemiRfc#Sections)
      1. [variables](https://delph-in.github.io/docs/tools/SemiRfc#variables)
      2. [properties](https://delph-in.github.io/docs/tools/SemiRfc#properties)
      3. [roles](https://delph-in.github.io/docs/tools/SemiRfc#roles)
      4. [predicates](https://delph-in.github.io/docs/tools/SemiRfc#predicates)
   2. [.smi file syntax](https://delph-in.github.io/docs/tools/SemiRfc#A.smi_file_syntax)
      1. 1. 1. [Notes](https://delph-in.github.io/docs/tools/SemiRfc#Notes)
   3. [Including Files](https://delph-in.github.io/docs/tools/SemiRfc#Including_Files)
2. [Implementation](https://delph-in.github.io/docs/tools/SemiRfc#Implementation)
   1. [Redefined Predicate
Hierarchies](https://delph-in.github.io/docs/tools/SemiRfc#Redefined_Predicate_Hierarchies)
3. [Proposals](https://delph-in.github.io/docs/tools/SemiRfc#Proposals)

A SEM-I, or SEMantic-Interface, is a description of the semantic
structures output by the grammar, and may include entries for variables,
properties, predicates, and roles. SEM-Is can be useful for validating
the semantic output of grammars without having to load the entire
grammar.

A related, but separate, component is the Variable Property Mapping
([VPM](https://delph-in.github.io/docs/tools/RmrsVpm)), which maps grammar-internal variable types,
properties, and property values into grammar-external ones. A SEM-I
describes the valid grammar-external values, and hence the primary VPM
for a grammar is conventionally called semi.vpm.

**Note for Developers**

As of March 2016, the 1.0 version of the SEM-I is available, which
introduces support for predicate hierarchies among other changes.
Previous iterations of SEM-Is were underexploited and are not described
in the primary text of this wiki.

## Sections

There are four sections in a SEM-I:

### variables

Define variable type, their hierarchical relations, and allowed
properties. E.g.:

```
   1 u.
   2 i < u.
   3 e < i : PERF bool, PROG bool, MOOD mood, TENSE tense, SF sf.
```

### properties

Define allowed property values and value hierarchies. E.g.:

```
   1 bool.
   2 + < bool.
   3 - < bool.
```

### roles

Define allowed predicate roles and constraints on values. E.g.:

```
   1 ARG0 : i.
   2 RSTR : h.
   3 CARG : string.
```

### predicates

Define the predicate hierarchy and predicate synopses (required and
optional roles and constraints on role values). E.g.:

```
   1 _a+little_q < abstract_q : ARG0 i { NUM sg }, RSTR h, BODY h.
   2 _accuse_v_of : ARG0 e, ARG1 i, ARG2 p, [ ARG3 i ].
```

Predicate entries may be divided among several files. One file may
contain just the hierarchical relations (e.g. hierarchy.smi in the ERG
1214), another for [abstract
predicates](/PredicateRfc#Abstract_Predicates) (e.g. abstract.smi), and
another for [surface predicates](/PredicateRfc#Surface_Predicates) (e.g.
surface.smi). Some very top-level, perhaps extragrammatical, entries may
appear in the main .smi file as well (e.g. erg.smi).

## .smi file syntax

The .smi files (e.g. erg.smi, hierarchy.smi etc.) use a simplified
(non-TDL) syntax to characterize notions of inheritance (e.g.
specializations of predicates) and appropriateness (e.g. the frame of
arguments and associated value constraints associated with each
predicate). Here is a descriptive example:

```
   1 ; comments begin with semicolons
   2 
   3 ; sections begin at column 0 and are followed by a colon
   4 variables:
   5   ; definitions (by convention) are indented
   6   ; entries end in .
   7   u.
   8   ; inheritance is specified by < with supertypes delimited by &
   9   i < u.
  10   ; features/properties follow : and are delimited by ,
  11   x < i & p : PERS person, NUM number, GEND gender, IND bool, PT pt.
  12 
  13 predicates:
  14   ; variable property constraints are bound by { and }, and are delimited by ,
  15   _acclimitization_n_1 : ARG0 x { NUM sg, IND - }.
  16   ; optional roles are bound by [ and ] (note that commas appear outside of [ and ])
  17   _advance_v_1 : ARG0 e, ARG1 i, [ ARG2 i ], [ ARG3 i ].
  18 
  19 ; external files can be included
  20 ; sections in included files are merged with sections in the main file
  21 include: surface.smi
```

This BNF describes the general syntax (whitespace is allowed around
tokens):

```
   1 SEMI        := (Section | Include | EOL)*
   2 
   3 Section     := "variables"  ":" EOL (Variable | EOL)*
   4              | "properties" ":" EOL (Property | EOL)*
   5              | "roles"      ":" EOL (Role | EOL)*
   6              | "predicates" ":" EOL (Predicate | EOL)*
   7 
   8 Include     := "include"    ":" Filename EOL
   9 
  10 Variable    := VarType  VarParents? VarProps?  "." EOL
  11 Property    := PropType PropParents?           "." EOL
  12 Role        := RoleName ":" VarType            "." EOL
  13 Predicate   := PredType PredParents? Arguments "." EOL
  14 
  15 VarParents  := "<" VarType  ("&" VarType)*
  16 PropParents := "<" PropType ("&" PropType)*
  17 PredParents := "<" PredType ("&" PredType)*
  18 
  19 VarProps    := ":" PropVal  ("," PropVal)*
  20 Arguments   := ":" Argument ("," Argument)*
  21 
  22 PropVal     := PropName PropType
  23 Argument    := RoleVal | "[" RoleVal "]"
  24 RoleVal     := RoleName ArgValue Constraints?
  25 ArgValue    := VarType | "string"
  26 Constraints := "{" PropVal ("," PropVal)* "}"
  27 
  28 VarType     := Identifier  # e.g., x, h
  29 PropType    := Identifier  # e.g., +, subjunctive
  30 PredType    := Identifier  # e.g., _dog_n_1, mofy
  31 
  32 RoleName    := Identifier  # e.g., ARG1, RSTR
  33 PropName    := Identifier  # e.g., TENSE, PT
  34 
  35 Identifier  := /[^ ]+/
  36 Comment     := /;.*/
  37 EOL         := Comment? "\n"
```

##### Notes

- Filename is not defined above; it is an unquoted path on your
filesystem. Unlike regular entries, :include statements do not end
in a dot (.).
- VarType, PropType, and PredType could be more restrictive than
Identifier but I do not do this. Generally these strings are all
lowercase.
- RoleName and PropName, similarly, could be more restrictive than
Identifier but I do not do this. Generally these strings are all
uppercase.
- When VarParents, PropParents, or PredParents is empty, it may be
assumed that the entries inherit from a top symbol, like \*top\*.
- VarType, PropType, and PredType define hierarches through their
\*Parents production, but these exist in their own hierarchies (so,
for instance, there may be a property person and a predicate person
but these do not collide).

## Including Files

The directory of an including file is used as the parent directory of
the included file (i.e. the filename is relative). Thus, given the
following directory structure:

    start.smi
    next.smi
    subdir/
        a1.smi
        a2.smi

The start.smi file can include next.smi and a1.smi like this:

```
   1 include: next.smi
   2 include: subdir/a1.smi
```

And then a1.smi can subsequently include a2.smi like this:

```
   1 include: a2.smi
```

# Implementation

Details concerning the implementation of SEM-Is in a grammar processor
go here.

## Redefined Predicate Hierarchies

When a predicate's hierarchical relationship is redefined (with the &lt;
operator), subsequent definitions should completely override previous
definitions. This allows users of a grammar to dynamically make changes
to a SEM-I (e.g., for use in some application) without having to rewrite
the grammar.

For example, with the ERG 1214 release, there is a quantifier hierarchy
that has existential\_q as a relatively high-level node with many
subtypes. In translation, one may use such a type for an underspecified
quantifier, but this type may be too broad (e.g. for an MRS about dogs
barking, you might get "Dogs bark.", "The dogs bark.", "Those dogs
bark.", "Some dogs bark.", "Many a dog barks.", etc.). To restrict the
hierarchy so there's a quantifier predicate that only generates "The
dogs bark.", "The dog barks.", "A dog barks.", and "Dogs bark.", one
could rewrite the hierarchy by including an additional SEM-I file as
follows:

```
   1  predicates:
   2    def_udef_a_q < existential_q.
   3    def_explicit_q < def_udef_a_q.
   4    def_implicit_q < def_udef_a_q.
   5    udef_q < def_udef_a_q.
   6    _the_q < def_udef_a_q.
   7    _a_q < def_udef_a_q.
```

Here, def\_udef\_a\_q is the supertype that will generate those 4
sentences.

# Proposals

1. Linking preds that differ by sense (e.g. number of arguments, like
"he ate" vs "he ate a banana"), or mass/count distinctions ("every
paper" vs "all the paper"). This is not trying to recreate something
like [WordNet](/WordNet).
2. Making the semantics of the computed hierarchy visible
(<http://lists.delph-in.net/archives/developers/2016/002294.html>)
3. Improve or remove argument optionality marking
(<http://lists.delph-in.net/archives/developers/2018/002858.html>
and
<http://lists.delph-in.net/archives/developers/2018/002861.html>)
4. Use the relevant sections of the SEM-I to encode the preferred
serialization order of roles (currently done by
\*feat-priority-list\* in mrsglobals.lsp) and properties (currently
done by the VPM).
5. Encode the semantic effects of phenomena like control. E.g.,
   -       _try_v_1 : ARG0 e, ARG1 i:INDEX #1, ARG2 h:XARG #1.            ; subject control
               _force_v_1 : ARG0 e, ARG1 i, ARG2 i:INDEX #1, ARG3 h:XARG #1.  ; object control
6. Encode constraints relations (HCONS and ICONS) somewhere? E.g.,
   -       constraints:
         
                 hcons.
                 qeq < hcons.
         
                 icons.
                 info-str < icons.
                 non-topic < info-str.
                 non-focus < info-str.
                 focus < non-topic.
                 topic < non-focus.
7. Specify which predicates can take a constant argument. The SEM-I
specifies CARG as a role that takes a string, but this never shows
up in any predicates, and those that can take a CARG (like named in
the ERG) do not otherwise indicate that they can. The simplest
proposal is to just put CARG in the synopses:
   
   -       named : ARG0 x { IND + }, CARG string.
8. In a more radical departure from the current spec, could we consider
swapping the ordering of predicates and synopses such that
predicates with the same synopsis get grouped together? Below I've
called the section "frames" because "synopses" sounds odd outside of
a "predicates" section. There are some benefits to doing it this
way: (1) semantically-similar predicates are logically grouped so
you can see how many follow a pattern, (2) it's easier to insert
comments for documentation about semantic patterns, (3) it makes it
easier to have a SEM-I be a curated resource rather than a generated
one (which may be beneficial if, as we've seen for indicating
argument optionality and enumerating property constraints, the
auto-generation of synopses can be inaccurate), and (4) reduced file
size (synopses are not repeated). A downside might be that you no
longer see related predicates together (such as \_canadian\_a\_1 and
\_canadian\_n\_1), or multiple synopses for the same predicate (but
we shouldn't expect that, right?).
   
   -       frames:
                 ARG0 e, ARG1 p:
                   _a+few_a_1.
                   _a+good+many_a_1.
                   _agree_v_on.
                   _apologize_v_1.
                   _apply_v_to.
                   _babble_v_about.
                   _chat_v_1.
                   _complain_v_to-about.
                   _consult_v_about.
                   _converse_v_about.
                   _disagree_v_1.
                   _lie_v_1.
                   _many+such_a.
                   _range_v_1.
                   _several_a_1.
                   _some_a_1.
                   _speak_v_to.
                   _talk_v_about.
                   _write_v_to.
                 ARG0 e, ARG1 x:
                   ...

Last update: 2019-04-22 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/SemiRfc/_edit)]{% endraw %}