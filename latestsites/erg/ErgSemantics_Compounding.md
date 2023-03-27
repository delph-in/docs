{% raw %}# ESD Test Suite Examples

      The garden dog barked.
      The Abrams picture arrived.
      Kim Browne arrived.
      Professor Browne arrived.
      The tobacco-happy dog barked.
      The state and local dogs barked.

# Linguistic Characterization

Compounding comprises a variety of (semantic) head–modifier structures
that can often be paraphrased using overt prepositions. But in instances
of compounding there is a syntactic construction contributing an
underspecified two-place relation. *Medicine delivery*, for example,
could be paraphrased as *delivery of medicine*, whereas *home delivery*
might be paraphrased as *delivery at home*. The phenomenon is
characterized by the underspecified compound relation, whose shape and
use are parallel to the semantics contributed by regular prepositions.
While prototypical heads in compounds are nominals (introducing an
instance), there can be exceptions: *tobacco-happy* is analyzed in terms
of an event head. Compounding can interact with coordinate structures
(e.g. in *state and local dogs*), when modifiers of the same head are
conjoined.

# ERS Fingerprints

The phenomenon can be sub-divided according to the (semantic) types of
the head and modifier. The most basic instances, arguably, involve
non-quantified or quantified modifiers to a nominal head, e.g. *garden
dog* and *Abrams picture*, respectively.

      h0:compound[ARG1 x1, ARG2 x2]
      h0:[ARG0 x1]
      [ARG0 x2]

With event heads, the structure is very similar, except for the type of
the ARG1 in the compound relation, e.g. for *tobacco-happy*:

      h0:compound[ARG1 e1, ARG2 x1]
      h0:[ARG0 e1]
      [ARG0 x1]

# Interactions

When conjoining different types of modifiers (to a nominal head),
compounding and coordination interact in syntactically subtle ways, but
result in a comparatively straightfoward semantics, e.g. for *state and
local dogs*:

      h0:compound[ARG1 x1, ARG2 x2]
      [ARG0 x2]
      h1:[ARG0 e1, ARG1 x1]
      h2:_and_c[L-HNDL h0, R-HNDL h1]
      h2:[ARG0 x1]

# Open Questions

Up until its 1214 release, the ERG made a distinction between compound
and compound\_name relations, but seeing that proper name heads in a
compound construction can be unambiguously identified by their
(proper\_q) quantifier, this distinction was judged redundant.

The compound relation is also used in what Bender, et al. (2011) call
the N-ed construction, as for example in *rabbit-eared dog*. Here, there
are in fact two instances of the two-place compound relation, one
relating the two elements of the N-ed construction (*ear* and *rabbit*),
and another one connecting the construction as a whole to its head noun
(i.e. *dog*). As the N-ed construction allows predicative use, this is a
rare case where compound can appear with its ARG1 realized as a
syntactic subject. A deeper understanding of which nouns should be
treated as relational may lead to revisions of this analysis. (For a
dissenting view, arguing that no nouns are relational, see [Payne et al
2013](http://muse.jhu.edu/journals/language/v089/89.4.payne.html).)

The N-ed construction is not the only construction where the 'compound'
relation can appear in predicative position, though it is the only one
where the subject of the predication is an argument of the 'compound'
relation. In a sentence like *The mountain is snow-covered*, the
relationship between '\_cover\_v' and '\_snow\_n' is expressed as a
'compound', to express the underspecified relation between the event and
the instance (here most naturally paraphrased by the preposition
*with*). The intent of the 'compound' with N-ed (used attributively or
predicatively) is to provide the necessary underspecified relation that
holds between the instance of the noun suffixed with '-ed' and the
instance of the noun that is either modified or the subject of
predication. Those two instances have to be linked together somehow, and
the only clear alternative would be to have every N-ed noun introduce a
two-place relation (as is the case in the ERG for kinship terms, for
example), where the instance of the noun modified or predicated of would
be the ARG1 of the N-ed noun's relation. This might be no more than a
notational variant of the current 'compound' representation, since there
would be a simple equivalence rule that converts from the one to the
other.

# Grammar Version

1214

# References

Bender, E. M., Flickinger, D., Oepen, S., & Zhang, Y. (2011, July).
Parser evaluation over local and non-local deep dependencies in a large
corpus. In Proceedings of the Conference on Empirical Methods in Natural
Language Processing (pp. 397-408). Association for Computational
Linguistics.

Payne, J. & Pullum, G. K. & Scholz, B. C. & Berlage, E.(2013). Anaphoric
one and its implications. Language 89(4), 794-829. Linguistic Society of
America. Retrieved April 22, 2014, from Project MUSE database.

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_Compounding/_edit)]{% endraw %}