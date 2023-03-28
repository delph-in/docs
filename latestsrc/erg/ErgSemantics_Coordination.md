{% raw %}# ESD Test Suite Examples

    Abrams and Browne arrived.
    Abrams, Browne, and Chiang arrived.
    The dog and cat arrived.
    The dog, cat, and picture arrived.
    My friend and colleague arrived.
    Abrams barked and was old.
    Abrams arrived, barked, and was old.
    Abrams arrived and the dog barked.
    Abrams wanted and expected to arrive.
    The old and fierce dog barked.
    The dog is old and fierce.
    The dog barked on Monday and on Wednesday.

# Linguistic Characterization

Coordination of two phrases introduces a relation which takes two
arguments; in coordination of nominal phrases these are the instances
(the ARG0) of the left and right conjuncts, while in all other
coordination the two arguments are the handles (the LTOP) of each of the
two conjuncts. N-ary coordination introduces an additional conjunction
relation for each additional conjunct, working from right to left, in
each step taking as arguments the instance or handle of the new conjunct
and that of the conjoined phrase to its right.

# Motivating Examples

# ERS Fingerprints

Nominal coordination:

      abstract_c[ARG0 x1, ARG1 x2, ARG2 x3]
      [ARG0 x2]
      [ARG0 x3]

Non-nominal coordination:

      abstract_c[ARG0 e1, ARG1 h2, ARG2 h3]
      h2:[ARG0 e4]
      h3:[ARG0 e5]

# Interactions

- Across-the-board extraction -- The grammar imposes the
well-formedness condition that if in a coordinate structure there is
an extraction from one of the conjuncts, the other conjunct must
also exhibit the same unbounded dependency. This presents a
challenge for specifying the desired MRS in the extraction of scopal
arguments, since the one filler of the unbounded dependency supplies
(of course) only one handle, which should then be identified with
each of the two *holes* in the two conjuncts. An example is *That we
won the game, nobody will believe or admit.*
- Right-node raising -- Another instance of this one-handle-two-holes
problem presents itself in right-node-raising constructions such as
in *We ought to but probably won't visit Paris*, where each of the
modals need a handle argument, but there is only one supplied by the
rightward-moved verb phrase.
- Run-On sentences -- The ERG returns one MRS representation per
analysis per input. That is, even if the input is linguistically
best analyzed as two separate sentences (or sentence fragments)
which have been stuck together (e.g. *Abrams arrived, the dog
barked.*), the ERG still needs to produce a single, connected MRS
representation for any analysis of the input. In order to handle
these cases, the ERG introduces an EP with the predicate
implicit\_conj, treating the run-on as the coordination of two
utterances (or recursively, of more). When part of a run-on consists
of a sentence fragment, the [fragment](https://delph-in.github.io/docs/erg/ErgSemantics_Fragments) rules
are also invoked, leading to unknown mediating between the
implicit\_conj predication and the internal semantics of the
fragment constituent. It follows that the coordination involved in
run-on constructions is always non-nominal coordination.

# Reflections

- Implicit conjunction -- Lexical conjunctions each introduce a
relation which serves for binary coordination, and in n-ary
coordination, an *implicit\_conj* relation is used for each
additional conjunct.
- Identity in N-bar coordination -- One interpretation of N-bar
coordination as in *my friend and colleague* has the two nouns
referring to the same individual; this is expressed in the
corresponding MRS by use of an additional *id* relation taking the
two referential indices as arguments.
- N-bar coordination -- Note that for each nominal conjunct, a
separate quantifier relation is introduced to bind the instance
which is the inherent argument of that conjunct, where for
coordination of NPs, each NP supplies its own quantifier; in N-bar
coordination, the coordination construction introduces a *udef\_q*
relation for each of the two conjuncts.
- Subordination - While the subordination relations appear similar to
clausal coordination, note that for subordination the ARG1 is always
the handle of the main clause, independent of surface order of the
main and dependent clauses, while in coordination, the ARG1 is
always the handle of the left clausal conjunct in surface order.
- Nominal coordination - In the fingerprint, it may be unnecessary to
stipulate the second and third lines, since these might follow from
the more general inherent argument principle.

# Open Questions

- The general fingerprint above does not currently work in practise,
because we still have to add hierarchical relations among predicates
  
  (i.e. predicate generalizations) to the ERG SEM-I; also, in 1214
what we call ARG1 and ARG2 above are still differentiated as L-iNDEX
and R-INDEX and L-HNDL and R-HNDL, respectively.
- The current analysis only accommodates constituent coordination,
where each of the conjuncts is of the same broad syntactic category.
So far, this does not extend to coordination of predicate nominals
with other predicative phrases, as in *My friend is a Republican and
proud of it*, even though the current analysis does admit *My friend
is in Washington and proud of it*.

# Grammar Version

- 1212, but forward-looking in naming conventions for the
fingerprints.

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_Coordination/_edit)]{% endraw %}