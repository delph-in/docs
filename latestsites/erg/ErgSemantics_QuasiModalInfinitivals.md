{% raw %}# ESD Test Suite Examples

    This dog is to guard the tobacco.
    The dog who is to guard the tobacco arrived.
    The dog to guard the tobacco arrived.

# Linguistic Characterization

This analysis brings together what Huddleston & Pullum (2002) describe
in terms of a ‘quasi-modal’ use of the verb *be* (p.113) and what they
consider a ‘modal meaning’ associated with certain non-wh infinitival
relative clauses (p.1068). The *be* verb has all of the ordinary
auxiliary properties, shares with the modals the further property of
only appearing in finite forms. H&P further characterize its meaning as
‘modal’, without further elaboration. In the ERG, the modal semantics is
modeled with the eventuality relation, and this is associated with the
infinitival clause, which may appear as the complement of (semantically
empty) *be*.

# Motivating Examples

Treating these two phenomena as semantically equivalent is motivated by
the following pair of examples, which we judge to be paraphrases of each
other and to which we assign the same semantic representation.

- *The plumber to fix the sink is coming at 10.*
- *The plumber who is to fix the sink is coming at 10.*

We differentiate this use of infinitival clauses from the superficially
similar [instrumental relatives](https://delph-in.github.io/docs/erg/ErgSemantics_InstrumentalRelatives)
like the following:

- *Money to buy the dog arrived.*

In instrumental relatives, as opposed to quasi-modal infinitivals, the
head noun fills an instrumental role with respect to the relative
clause.

# ERS Fingerprints

      eventuality[ARG1 h1]
      h2:[ARG0 e]
    
      { h1 =q h2 }

# Interactions

# Open Questions

- Is eventuality the right pred to use here, or should this be
assimilated to something more clearly modal?

# Grammar Version

ERG 1212 (but there actually is no qeq there)

# References

Huddleston, R., & Pullum, G. K. (eds) (2002). The Cambridge Grammar of
the English Language. Cambridge: Cambridge University Press.

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_QuasiModalInfinitivals/_edit)]{% endraw %}