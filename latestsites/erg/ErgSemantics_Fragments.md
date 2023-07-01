{% raw %}# ESD Test Suite Examples

    Hey!
    Dogs.
    Arrived.
    Because Abrams left.
    Probably Abrams.

# Linguistic Characterization

Many well-formed utterances in context are not complete sentences, but
instead consist of just a word or phrase (or a short sequence) which we
interpret as an argument or modifier of an implied eventuality we call
'unknown' which can be supplied by the context.

# Motivating Examples

- *Maybe tomorrow, but probably not with Kim.*
- *Who's going to send out the announcement?*/*Maybe Kim, but not on
Tuesday.*
- *How was your milkshake?*/*Yummy.* -&gt; predicative adjective
functioning like VP fragment.
- *How did John say that he reacted to his milkshake?*/*Yummy.* -&gt;
unknown stands in for possibly much larger structure.

# ERS Fingerprints

Nominal phrases are treated as an underspecified argument 'ARG' of the
'unknown' relation:

      h0:unknown[ARG0 e1, ARG x2]
      _[ARG0 x2]

Intersective adverbials and prepositional phrases are treated as
intersective modifiers of the 'unknown' relation:

      h0:unknown[ARG0 e1]
      h0:[ARG1 e1]

Adjectives are treated as intersective modifiers of some instance which
is an argument of the 'unknown' relation, but for compactness, the
adjective's relation identifies its handle with that of the 'unknown'
relation, as an abbreviation for adding an 'unknown\_n' relation (FIX?):

      h0:unknown[ARG0 e1, ARG x2]
      h0:[ARG1 x2]

Scopal adverbials are treated as scopal modifiers of the 'unknown'
relation:

      h0:unknown[ARG0 e1]
      h1:[ARG1 h2]
    
      { h2 =q h0 }

Verb phrases are treated as propositions missing the argument that would
have been supplied by the subject:

      h0:_v[ARG0 e1]

Sequences of an adverb and a nominal phrase like 'probably Kim' are
treated as a modifier and an argument, respectively:

      h0:unknown[ARG0 e1, ARG x2]
      [ARG0 x2]
      h1:[ARG1 h2]
    
      { h2 =q h0 }

# Interactions

- Fragments can also be constituents of a larger utterance, including
arguments of verbs of saying, and parts of run-on sentences.

# Reflections

- Similar to [ellipsis](https://delph-in.github.io/docs/erg/ErgSemantics_Ellipsis), in that the
characteristic EP serves as a stand-in for information to be filled
in in context while also maintaining wellformedness of the
compositionally created MRS.
- Form of utterance deviating from canonical S is part of the signal,
and what lets us know to search for the antecedent. Currently not
putting anything in in the case of VP fragments.

# Open Questions

- For verb phrase fragments, how do we distinguish between e.g. *Hired
Kim* and *Kim was hired*?
- Intersective modifier case seems to maybe pin things down a bit too
much --- two EPs corner the interpretation of unknown and its
relation to x2.
- Easy to find clear examples of PP fragments interpreted as VP
modifiers; harder to think of Adj or PP fragments functioning as N'
modifiers.

# Grammar Version

- 1212\.

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_Fragments/_edit)]{% endraw %}