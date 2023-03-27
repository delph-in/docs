{% raw %}# ESD Test Suite Examples

    Abrams, don't bark!
    It rained, Abrams.

# Linguistic Characterization

Vocatives are noun phrases used as modifiers of sentences which refer to
the addressee and do not fill a semantic role with respect to any
predicate in the sentence. Rather, vocatives function to explicitly mark
the addressee of a sentence. Leech (1999) identifies three general types
of pragmatic function for such explicit marking: summoning attention,
clarifying intended addressee, and establishing/maintaining social
relationships.

# Motivating Examples

In addition to the imperative and declarative clauses illustrated in the
testsuite examples, vocatives can also attach to questions, and sentence
fragments, as shown below.

- *Sir, are you alright?*
- *Abrams, what do you remember?*
- *That one, Abrams.*
- *Thanks, Abrams.*

These examples also illustrate the use of forms such as *Sir* and
*Madam* as vocatives. (Leech (1999) points out that such items are
marginal NPs, and somewhat specialized to the vocative usage.) Epithets
can also be used as vocatives:

- *Watch what you're doing, butterfingers.*

# ERS Fingerprints

Vocatives as analyzed by the ERG are characterized by the presence of
the addressee predicate, linking the instance from the NP to the
situation denoted by the rest of the sentence:

      addressee[ARG1 x, ARG2 e]

# Interactions

# Reflections

- Because vocatives don't contribute to truth conditions, but rather
serve pragmatic functions, this phenomenon is classified in our
pages as ‘quasi-semantic’.

# Open Questions

- Leech (1999) notes that in addition to NPs, adjectives can be used
as vocatives (as in, *Don't bark, silly!*). These don't current give
rise to vocative in the ERG's analysis. Should they?
- Leech also notes that NPs beyond proper nouns can function as
vocatives:
  - *It's alright, my dear.*
  - *Those of you who want to bring your pets along, please pay
attention.*
- ERG 1212 (demo) doesn't parse: *That one, Abrams!* =&gt; Works in
trunk
- The ERG currently allows for sentence-initial and -final vocatives,
but not those that interrupt a sentence. The latter are, we found,
characteristic of Sir Conan Doyle's representation of dialogue.
- For parallelism with other modifiers, should we switch ARG1 and
ARG2? =&gt; Yes, Dan will change.
- Leech doesn't consider imperative subjects to be vocatives, though
he notes that the distinction is not clear. I couldn't get an
imperative subject example (e.g. *Everyone bark!*) to parse. Are
these meant to be handled?

# Expert External Commentary

# Grammar Version

- 1212

# References

- Leech, G. (1999). The distribution and function of vocatives in
American and British English conversation. LANGUAGE AND COMPUTERS,
26, 107-120.

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_Vocatives/_edit)]{% endraw %}