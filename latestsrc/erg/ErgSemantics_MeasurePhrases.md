{% raw %}# ESD Test Suite Examples

    The dog is three weeks old.

# Linguistic Characterization

While most measure phrases in English are analyzed by the ERG with
relatively transparent semantics, there is one construction which
introduces a phenomenon-specific semantic relation, when a measure
phrase is used as a degree specifier of an adjective, as in the test
suite example. The measure phrase supplies the extent or degree to which
the property supplied by the adjective holds, and thus a two-place
measure relation is introduced to express this link between the instance
from the measure phrase and the ARG0 value from the adjective.

# Motivating Examples

- *The three week old dog barked.*
- *The dog is almost three weeks old.*
- *The dog is weeks old.*

# ERS Fingerprints

      h0:measure[ARG0 e1, ARG1 e2, ARG2 x]
      h0:[ARG0 e2]
      h1:[ARG0 x]

# Interactions

- Most but not all measure phrases also include a card predication
that modifies the measure noun, sharing its handle with that of the
noun's relation, and taking that relation's ARG0 as its ARG1.

# Reflections

- Measure phrases that are not used as degree specifiers of adjectives
simply make their lexically expected semantic contributions, and if
they appear directly as modifiers of nouns, as in *the ten meter
pool*, they are analyzed as a kind of nominal compound. This avoids
the difficulty of having to hallucinate an unexpressed adjective
relation to represent the property associated with length or width
or depth, but it leaves us with an asymmetry in the semantics of
*ten meter pool* and *ten meter long pool*. A similar asymmetry can
be seen in the pair *a tree of five meters* and *a tree of five
meters in height* (cf. *a tree of five meters in girth*), where the
dimension being measured is optionally expressed with a
prepositional phrase modifying the measure phrase.

# Open Questions

- Should we make more of an effort to directly express paraphrases
such as *the pool is ten meters long* and *the pool's length is ten
meters* or even *the pool has a length of ten meters*?

# Expert External Commentary

# Grammar Version

- 1212

# References

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-11-03 by DanFlickinger [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_MeasurePhrases/_edit)]{% endraw %}