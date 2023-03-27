{% raw %}# ESD Test Suite Examples

    The dog barks every day.
    Browne arrived the day of the garden dog.
    The dog barks there.
    The day the dog barked arrived.
    The meeting that day was local.

# Linguistic Characterization

English has a variety of expressions which express the location of an
entity or event in time or space but which do not specify any particular
relationship between the entity/event and the location. These
expressions include temporal modifiers, such as *now*, *when*, *every
day*, *the day after you met Sandy* as well as locative ones including
*here*, *there* and *where*. In the semantics, we characterize these
expressions as introducing both an entity (and its associated
quantifier) which denotes the location which the event is related to and
an EP with the predicate loc\_nonsp relating the event to that entity.
Another characteristic construction where a spatio-temporal modifier can
appear without an overt mark of the type of location relation is in
relative clauses whose head noun functions as a modifier within the
relative clause.

# Motivating Examples

This analysis involves a certain amount of ‘decomposition’ in the
semantics; the alternative would be to have predicate symbols such as
today\_n or here\_n which directly take events as the value of their
ARG1. The decomposition is motivated on the basis of the parallelism to
examples with prepositions contributing EPs analogous to loc\_nonsp:

- *The dog barked <span class="u">on Tuesday</span>.*/*The dog barked
<span class="u">every Tuesday</span>.*
- *The dog barks <span class="u">in the morning</span>.*/*The dog
barks <span class="u">every morning</span>.*
- *The dog barked <span class="u">in the yard</span>.*/*The dog barked
<span class="u">there</span>.*

Furthermore, while a lexical, non-decomposed analysis could in principle
be given to forms such as *today*, this analysis does not scale to
phrasal modifiers appearing the same use or to the relative clause
examples:

- *We arrived <span class="u">the week after the storm</span>.*
- *<span class="u">The day</span> the dog barked arrived.*

Examples like the following show that the modified element can also be
an entity (not just an event):

- *Exports increased 4% from the same period <span class="u">last
year</span> to $50 billion.* \[Attested example, WSJ\]

# ERS Fingerprints

    loc_nonsp[ARG1 i, ARG2 x]

# Interactions

# Reflections

- The expressions that give rise to loc\_nonsp are analyzed
syntactically as either lexical PPs (e.g. *here*) or noun phrases
(e.g. *today*, *the day of the first meeting*) which are of a class
that can be pumped to PP. In the latter case, the loc\_nonsp EP is
contributed by the phrase structure rule that builds the PP out of
the NP. Similarly, in the relative clause examples, the loc\_nonsp
is introduced by a syntactic construction.
- loc\_nonsp also appears in the decomposed meanings assigned to
expressions such as *earlier* and *overseas*.
- Some temporal nouns can only appear in this construction when they
have a modifier or a deictic determiner:
  - *Our meeting this week was interesting.*
  - *\*Our meeting the/a week was interesting.*
  - *Our meeting the week after that was interesting.*
- However, the word *every* can seemingly turn any noun into one with
this property; this likely involves a special lexical entry for
*every*:
  
  - *\*Kim phoned Sandy the last freeway exit before the state
line.*
  - *Kim phoned Sandy every freeway exit.*
- The interpretation of *every*-marked temporal locatives modifying
entities involves something subtle about the interaction of the
quantifiers. However, this is not specific to implicit locatives but
is also found with explicitly marked locatives:
  
  - *The earthquake the day after the eruption was barely noticed.*
  - *The earthquakes every ten minutes got old quickly.*
  - *The earthquake on the day after the eruption was barely
noticed.*
  - *The earthquakes on every third Tuesday got old quickly.*

# Open Questions

- Could on\_p\_temp et al be generalized to loc\_nonsp?
- ERG (1212) doesn't parse *Browne arrived the tobacco garden day.*
Are noun-noun compounds not the sort of thing that can take a word
of the *day* type and make it into a phrase that can function as a
loc\_nonsp modifier?

# Grammar Version

- 1212

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_ImplicitLocatives/_edit)]{% endraw %}