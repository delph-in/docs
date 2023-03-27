{% raw %}Our hope is that this page will collect info on MRS wellformedness
constraints stated independently of any semantic analyses which motivate
them.

# Serialization Formats

- MrsRfc

# SEM-I

- [RmrsSemi](https://delph-in.github.io/docs/tools/RmrsSemi)
- Optionality of arguments: need to know how many roles an EP expects,
and provide dummy variables (u37, etc) to fill unrealized roles

# Cross-linguistic Constraints

- Each referential index needs a quantifier
- Each quantifier's RSTR must be linked to something -- typically a
nouny EP, and typically via a QEQ
- Have to get the right labels equal to the right other labels;
intersective modifiers and relative clauses, for example.

# Grammar-specific Constraints

- Each grammar will probably have its own quirks about where QEQs are
required
- Each grammar will have other syntax-determined constraints about
what is realizable, e.g. see the MRS below about a cat and a mouse
that chase each other.

## ERG

- For NP fragments, need to supply an unknown\_rel that can fit into
the lowest quantifier's BODY -- otherwise not scopable.

# Possibly Also of Interest

- [RmrsDiscussions](https://delph-in.github.io/docs/tools/RmrsDiscussions)
- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics)

A seemingly wellformed MRS that doesn't correspond to any English
syntax. Is it realizable in some other exotic language? (Note that with
the second "\_chase\_v\_1\_rel" deleted, it generates successfully with
the ERG). Is there some additional wellformedness constraint that could
be articulated to rule this one out?

    [ LTOP: h1 INDEX: e2 [ e SF: prop TENSE: pres MOOD: indicative ]
      RELS: < [ udef_q_rel LBL: h3 ARG0: x4 RSTR: h5 BODY: h6 ]
      [ udef_q_rel LBL: h7 ARG0: x8 RSTR: h9 BODY: h10 ]
      [ "_cat_n_1_rel" LBL: h11 ARG0: x4 ]
      [ "_mouse_n_1_rel" LBL: h12 ARG0: x8 ]
      [ "_chase_v_1_rel" LBL: h13 ARG0: e2 ARG1: x4 ARG2: x8 ]
      [ "_chase_v_1_rel" LBL: h13 ARG0: e14 ARG1: x8 ARG2: x4 ] >
      HCONS: < h1 qeq h13 h5 qeq h11 h9 qeq h12 > ]

Last update: 2013-11-17 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/RmrsWellformedness/_edit)]{% endraw %}