{% raw %}# ESD Test Suite Examples

    If Abrams arrived, Browne arrived.
    Had Abrams arrived, Browne would have barked.

# Linguistic Characterization

Complex sentences consisting of a main clause modified by a subordinate
clause include conditional expressions where the modifying clause
provides the semantics of the antecedent and the main clause is the
consequent. One of the two primary syntactic variants for this
construction introduces the dependent clause with the subordinating
conjunction *if*, while in the other variant, the dependent clause
exhibits the subject-auxiliary inversion used in yes-no questions, but
with a constrained inventory of permissible auxiliary verbs in
subjunctive mood. The only auxiliaries found in this construction are
*had, were, should,* and *might*. In both variants, the dependent clause
can appear either before or after the main clause, and the main clause
can be optionally modified by an overt *then* adverb. In the variant
introduced by *if*, the head verb of the dependent clause can be in
either indicative or subjunctive mood.

# Motivating Examples

- Subjunctive mood in both clauses: *If the dog were angry, it would
bark.*
- Indicative mood in both clauses: *If the dog is angry, it barks.*
- *if*-clause order variation: *The dog would bark if it were angry.*
- Inverted clause order: *The dog would bark, were it angry.*

# ERS Fingerprints

The two-place relation takes the top handle of the main clause as its
first argument, and that of the dependent clause as its second, in both
instances mediated by a qeq relation to permit quantifiers to scope
inside or outside.

    if_x_then[ARG1 h1, ARG2 h2]
    h3:[ARG0 e1]
    h4:[ARG0 e2]
    
    { h1 =q h3, h2 =q h4 }

# Interactions

- In the inverted clause variant, negation of the auxiliary verb is
not possible: *\*Hadn't the dog been angry, it would not have
barked.*
- The subjunctive form of the syntactic head verb in the dependent
clause (in both variants) is the morphological past-tense form,
though the semantics of the verb is not constrained to be in the
past.

# Open Questions

- Should non-clausal variants of phrases introduced by *if* be coerced
to the same clausal semantics? Consider *If chased, the dog will
bark.* or *If the victim, the dog will bark.* The grammar currently
does this coercion, and it seems justified for the predicative
phrases like *chased*, since we also see *If being chased, the dog
will bark.* where the complement of *if* is clearly a proposition,
but it's less clear with the NP-complement case. Even in the
predicative variant, the question remains about whether to try to
bind the external argument of the verbal predication; it is
tempting, but consider *If chased, I'm pretty sure the dog will
bark.* where there is no ready mechanism to provide the index to
unify with the XARG of *chase*. The same issue arises for the NP
complement variant, even if we choose to hallucinate an identity
relation where the overt NP is identified as the ARG2; binding that
relation's ARG1 to an index in the main clause is not
straightforward, as in *If the victim, it seems like the dog always
barks.*
- Should the semantics of *when* clauses be made the same or similar?
Consider *When the dog is angry, it barks.* alongside *If the dog is
angry, it barks.*.

# Grammar Version

- 1212

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_Conditionals/_edit)]{% endraw %}