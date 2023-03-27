{% raw %}# ESD Test Suite Examples

    Dogs barked.
    Abrams barked.
    Five bothers Abrams.
    Three dogs barked.
    Many dogs barked.

# Linguistic Characterization

Given the convention that every instance in any utterance-level MRS is
bound by a quantifier, the ERG introduces implicit quantifiers (those
not directly corresponding to a determiner lexical entry) in a variety
of constructions, as well as in some lexical types other than those
instantiated by determiners. The inventory of implicit quantifier
predicates in some cases draws distinctions which are redundant with
distinctions already drawn in the nominal predicates that introduce the
instance variables as their ARG0, as indicated below. Each quantifier
predication has three arguments: the bound variable instance, and the
handles for its restrictor and body.

The most commonly used implicit quantifier is udef\_q, which is
introduced in the constructions for the following, many of which are
discussed separately:

- bare plural (and mass) noun NPs
- nominal and verbal gerund phrases lacking a specifier
- infinitive-VP subjects
- WH-clausal subjects
- compounds with nominal non-heads
- appositives with an N-bar non-head
- measure phrases
- numerical partitive phrases ("five are arriving")
- cardinal adjectives in bare NPs ("five cats")
- coordination of nominal phrases
- N-bar fragments
- parenthetical nominals

More specific implicit quantifiers are used in each of the following
types of phrases, where the distinction is in each case drawn as well in
the corresponding nominal predicate of the construction:

- proper names: proper\_q
- pronouns: pronoun\_q
- cardinal number names: number\_q

# Motivating Examples

- For cardinal numbers: *Is two hundred nine a prime number?*

# ERS Fingerprints

      quant[ARG0 x, RSTR h2, BODY h3]
      h4:[ARG0 x]
    
      { h2 =q h4 }

# Interactions

- Many of the constructions listed above interact in relatively
straightforward manner with the implicit quantifiers, which are
simply present to ensure the binding of instances lacking an overt
quantifier.

# Reflections

- It is tempting to consider changing the three more specialized
implicit quantifiers to just the one udef\_q.

# Open Questions

# Grammar Version

- 1212

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-12-21 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_ImplicitQuantifiers/_edit)]{% endraw %}