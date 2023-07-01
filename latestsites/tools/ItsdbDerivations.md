{% raw %}# Overview

The [\[incr tsdb()\]](http://www.delph-in.net/itsdb) environment records
information about *derivations* (the 'recipes' of linguistic analyses)
in its database. Combined with the grammar originally used to derive
each analysis, the derivation structure needs to provide complete
information for re-building the analysis. In other words, the derivation
can serve as an oracle to a process that one can conceptualize as
deterministic parsing: the derivation records exactly which steps the
original [\[incr tsdb()\]](http://www.delph-in.net/itsdb) client
processor had taken in producing its analysis. Deterministically
re-building (or re-playing) an analysis, thus, will give rise to the
exact same structure as was associated with the original result.

In principle, the [\[incr tsdb()\]](http://www.delph-in.net/itsdb)
derivation format is applicable to any kind of processing client (be it
the LKB, PET, TRALE, XLE or ACE) and all types of processing (e.g.
parsing, generation, transfer, or translation). However, in practice
only parsing and generation derivations produced by
either the LKB, PET, or ACE are fully supported yet.

This page documents the format used internally by [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) to record derivations (this
specification is sometimes half-jokingly referred to as *Unified
Derivation Format* or UDF). This page was predominantly authored by
[Stephan Oepen](https://github.com/oepen), who jointly with Ulrich Callmeier developed the original UDF 1.0
specification. Please do not make substantial changes unless you (a) are
reasonably sure of the technical correctness of your revisions and (b)
believe strongly that your changes are compatible with the general
design and recommended use patterns for [\[incr tsdb()\]](http://www.delph-in.net/itsdb), and of course with the goals
of this page.

# An Example

Following is an example derivation taken from the [WeScience](https://delph-in.github.io/docs/garage/WeScience)
treebank. This derivation is the result of parsing item WS01/10021300:
*Many terms are ambiguous.*

      (root_strict
       (515 subjh 5.63927 0 4
        (511 bare_np 0.986543 0 2
         (510 adjn -0.115529 0 2
          (44 many_a1 -0.657932 0 1
           ("many" 41
            "token [ +FORM \"many\" +FROM \"0\" +TO \"3\" ... ]"))
          (509 noptcomp 0.277526 1 2
           (508 plur_noun_orule 0.274656 1 2
            (54 term_n1 0 1 2
             ("terms" 30
              "token [ +FORM \"terms\" +FROM \"5\" +TO \"9\" ... ]"))))))
        (514 hcomp 3.121 2 4
         (72 be_c_are -0.558293 2 3
          ("are" 32
           "token [ +FORM \"are\" +FROM \"11\" +TO \"13\" ... ]"))
         (513 hoptcomp 1.8935 3 4
          (512 punct_period_orule 0 3 4
           (80 generic_adj 0 3 4
            ("ambiguous." 40
             "token [ +FORM \"ambiguous.\" +FROM \"15\" +TO \"24\" ... ]")))))))

The derivation is a tree whose core is comprised of identifiers for
*grammar entities*, i.e. the names of grammar rules and lexical entries.
In our example, *subjh*, *bare\_np*, *adjn*, *noptcomp*, and so forth
name grammar rules of the ERG. Conversely, *many\_a1*, *term\_n1*,
*be\_c\_are*, and *generic\_adj* are the identifiers of the lexical
entries used in this derivation.

All internal nodes but the topmost one name grammar rules, and all
preterminal nodes name lexical entries. The topmost (or root) node is
special, in that it identifies the start symbol ('root' feature
structure) used to license the derivation. Also, this element of the
derivation tree is optional, i.e. may or may not be present. Finally,
the terminal (aka leaf) nodes of the tree correspond to the actual input
to the parser, i.e. a sequence of input tokens. Note that UDF allows
some format variation in recording leaf nodes, as token feature
structures will only be available in some configuration, viz. when
parsing in PET, using the so-called chart mapping machinery (see the
[PetInput](https://delph-in.github.io/docs/garage/PetInput) page for background). Thus, a legitimate variation
of the example above would be representing terminal nodes by just the
token string, e.g.

      (...
       (54 term_n1 0 1 2
        ("terms")))

Further note that the example above abbreviates some of the information
in the actual token feature structures.

# Unified Derivation Format — More Formally

All regular nodes of derivation trees provide five fields of
information, in the format

(*id* *entity* *score* *start* *end* *daughter*<sup>+</sup>)

The *id* is an integer uniquely identifying the corresponding edge (i.e.
tree node or other corresponding object, in non-chart universes), When
analyzing an ambiguous input, where a sub-structure may be shared across
distinct analyses, it is expected that such shared nodes (and only such
nodes, i.e. sub-trees occuring in multiple complete analyses) will have
the same *id* across derivations. This uniqueness assumption is only
made relative to one input, of course.

The *entity* field is the most important part of the information
recorded in the derivation, naming the grammar entity that gave rise to
this node.

The *score* field is a floating point number, recording the
probabilistic score (or heuristic weight, or whatever) of the node,
where applicable. In parsing with PET or the LKB, for example, the
*score* field will contain the unnormalized MaxEnt score assigned to the
underlying chart edge, i.e. the sum of all weights λ<sub>i</sub> for
features *f*<sub>i</sub> present in the edge, including its daughters.

Finally, the *start* and *end* fields record the sub-string
corresponding to each node, measured in inter-word positions, for
example chart vertices. Strictly speaking, this information is
redundant, as it could be derived from the nesting of nodes, relative to
the sequence of preterminals.

To record the exact 'recipe' used in deriving an
analysis, all but the *entity* fields are optional. However, the UDF
syntax requires all five fields to be instantiated on each (non-top and
non-leaf) node. By convention, numeric fields (especially the *score*)
can be underspecified under a value of '-1'.

# Export Format for Derivation

There is an extended variant of UDF, dubbed UDX, that decorates elements
of derivations with additional information, specifically redundant
information that can in principle be obtained from looking up *entity*
identifiers in the underlying grammar. Inlining such redundant
information can simplify data exchange, for example when exporting
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) profiles into a textual
interchange format, for downstream processing with greater independence
of the native DELPH-IN toolchain.

As of mid-2013, the two extra elements in UDX are

- indicating head daughters (according to the head percolation table
of the original grammar) in all branching syntactic constructions;
the *entity* identifier of a head daughter is prefixed with a caret
symbol (`^`).
- annotating preterminal nodes (i.e. lexical entries) with their
lexical type; here, the *entity* identifier will be suffixed with a
type name, separated from the *entity* with an at sign (`@`).

In UDX, and using current identifiers from the 1212 release of the ERG,
our running example will look like the following:

      (ROOT_STRICT
       (415 SB-HD_MC_C 5.11757 0 4
        (412 HDN_BNP_C 1.10304 0 2
         (411 AJ-HDN_NORM_C 0.356599 0 2
          (58 many_a1@aj_-_i-many_le -0.399859 0 1
           ("many" 54
            "token [ +FORM \"many\" +FROM \"0\" +TO \"4\" ... ] ]"))
         (410 ^HDN_OPTCMP_C -0.986635 1 2
           (409 N_PL_OLR -0.793365 1 2
            (73 term_n1@n_pp_c-of_le -1.23404 1 2
             ("terms" 45
              "token [ +FORM "terms" +FROM \"5\" +TO \"10\" ... ] ]"))))))
        (414 ^HD-CMP_U_C 2.90046 2 4
         (97 be_c_are@v_prd_are_le 2.53757 2 3
          ("are" 47
           "token [ +FORM "are" +FROM \"11\" +TO \"14\" ... ] ]"))
         (413 W_PERIOD_PLR -0.394208 3 4
          (106 generic_adj@aj_-_i-unk_le 0 3 4
           ("ambiguous." 53
            "token [ +FORM \"ambiguous.\" +FROM \"15\" +TO \"25\" ... ]"))))))

# Known Bugs

As of early 2009, PET is known to sometimes 'forget' to include the root
node in derivations returned to [\[incr
tsdb()\]](http://www.delph-in.net/itsdb); as the top-most node (with
only one field, which is how it is recognized) is optional in the syntax
specification, this is only a problem of missing information. However,
PET is also known to sometimes output root nodes (one field, naming a
root feature structure, not a grammar rule or lexical entry) as internal
nodes in derivation trees, which violates the UDF syntax. [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) works around these divergences
silently, i.e. the derivation reader will ignore such superfluous,
internal nodes with only one field of information. The current theory is
that both bugs are related to the same chart edge being used both as the
root of one analysis, and simultaneously as an internal node in another
derivation. This problem was resolved in early 2012.

# Pending

- comments about ACE related to UDF and UDX.

Last update: 2022-08-06 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/ItsdbDerivations/_edit)]{% endraw %}