# ESD Test Suite Examples

    To bark bothers Browne.
    Chasing the cat is old.
    What the dog chased bothers Browne.

# Linguistic Characterization

Nominalization wraps the semantics of a verbal constituent into a
nominal predication introducing a referential index bound by a
quantifier, and a scopal argument for the handle of the verbal
constituent. This process occurs both in lexical rules and in
constructions, including nominal and verbal gerunds, interrogative
clauses as subjects of verbs or as complements of prepositions, and
infinitival clauses or verb phrases as subjects. Nominal gerunds are
related by lexical rule to verbs inflected as present participles, and
behave uniformly like nouns, being modified by adjectives, taking only
oblique complements, and combining with determiners and possessive NPs.
Verbal gerunds are nominalizations of full verb phrases, where the
internal structure of the phrase is clearly verbal, including adverbial
modifiers and NP complements. Interrogative clauses that appear as
subjects, or as complements in PPs also undergo nominalization to
introduce a nominal entity that forms a suitable semantic argument.
Similarly, infinitival VPs and clauses that appear as subjects are
nominalized to introduce the expected nominal entity.

# Motivating Examples

-   The hasty eating of fish can be dangerous. \[Nominal gerund\]
-   Quickly eating those fish can be dangerous. \[Verbal gerund\]
-   What he said surprised everyone. \[Interrogative clausal subject\]
-   They responded to what he said. \[Interrogative clause as object of
    preposition\]
-   To say that would compromise his secrecy. \[Infinitival VP subject\]
-   For him to say that would make his guilt obvious. \[Infinitival
    clausal subject\]

# ERS Fingerprints

      h0:nominalization[ARG0 x, ARG1 h1]
      h1:[ARG0 e]

# Interactions

-   Possessives: While nominal gerunds such as *the dog's playful
    chasing of the cat* use the ordinary possessive found in regular
    noun phrases like *the dog's tail*, verbal gerunds instead identify
    the possessive-marked NP as their external argument, and should not
    introduce the underspecified two-place *poss* relation (though the
    1212 version of the ERG erroneously still does). Thus in *his
    playfully chasing the cat* the index for *his* is the the subject
    argument (ARG1) of the chasing event, while in *his being chased by
    the cat* the role for *his* is the ARG2, the external argument of
    the passive verb phrase.

-   Clausal complements: The ERG normally treats verbal complements as
    scopal arguments, with the predication of the embedding verb taking
    the handle of the verbal complement as its argument, both for full
    finite clausalcomplements as in *they thought the dog barked* and
    for verb phrases as in *they wanted the dog to bark*. However, these
    verbal constituents undergo nominalization either when they are
    subjects, as in *that they bark should not surprise anyone*, or when
    they are (interrogative clause) complements of prepositions, as in
    *it depends on what the cat finds*. This asymmetry can be defended,
    but is the topic of ongoing discussion, as noted below.

# Open Questions

-   Asymmetrical treatment of clausal arguments in different positions:
    [SaarlandSententialArgument](SaarlandSententialArgument)

-   Spurious ambiguity with one-word gerunds, as in *complaining annoys
    him* where the subject could be elaborated either as the nominal
    gerund *constant complaining* or as the verbal gerund *constantly
    complaining*.

# Grammar Version

-   1212

# More Information

-   [ErgSemantics](ErgSemantics) main page

-   [Inventory](ErgSemantics_Inventory) of semantic phenomena (to be)
    documented

-   [How to cite this work](ErgSemantics_HowToCite)
