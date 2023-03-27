{% raw %}# ESD Test Suite Examples

    Money to buy the dog arrived.

# Linguistic Characterization

Instrumental relative clauses are a subtype of infinitival relative
clauses. Their distinguishing feature is in the connection between the
head noun and the relative clause: in this construction, the head noun
fills the role of an instrumental adjunct with respect to the relative
clause. There is no lexical item carrying the instrumental semantics,
however. This is provided by the construction (as with\_p).

# Motivating Examples

The treebanked examples for this phenomenon range from ones where
with\_p seems a natural paraphrase to more subtle examples:

- *It's your turn to sing.*
- *Give her time to miss you.*

This construction is distinguished from [quasi-modal
infinitivals](https://delph-in.github.io/docs/erg/ErgSemantics_QuasiModalInfinitivals) in the relationship
between the head noun and the relative clause, and in that the
quasi-modal infinitivals but not instrumental relatives can serve as the
complement of the copula. Quasi-modal infinitival examples:

- *The plumber to fix the sink is coming at 10.*
- *The plumber who is to fix the sink is coming at 10.*

# ERS Fingerprints

      h:with_p[ARG1 e, ARG2 x]
      h:[ARG0 e]
      h:[ARG0 x]

# Interactions

# Open Questions

- Are there both wh- and non-wh variants of these?
- Is it true that we don't see these as complements of the copula?
- The fingerprints as written assert that the instrumental
relationship is always with respect to the highest clause in the
relative. I think this is true; is it?
  - *Money to convince Kim to buy the dog arrived.*
- The label-sharing between head noun and verb is characteristic of
relative clauses in general. Does it belong as part of these
fingerprints?
- Need a better label for with\_p, since not all of these can be
paraphrased with *with*.

# Grammar Version

ERG 1212

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_InstrumentalRelatives/_edit)]{% endraw %}