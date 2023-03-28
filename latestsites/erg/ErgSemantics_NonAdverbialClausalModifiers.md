{% raw %}# ESD Test Suite Examples

    The dog arrived barking.
    Very tired, the dog arrived.
    Chased by the cat, the dog barked.

# Linguistic Characterization

Several types of sentence-level modifiers lacking a finite verbal head
nonetheless project a clausal semantics which is related to the modified
clause's semantics by a two-place subordinating predication. These
modifiers include depictive phrases as in *Angry at Browne, he stormed
out*, and absolutives as in *His plans ruined, he despaired*. Like
finite subordinate clause modifiers, these modifiers can appear either
sentence-initial or sentence-final, and can also appear as VP modifiers
particularly inside of conjoined VPs. For the depictives, the external
argument of the head of the modifier phrase is left unbound, though the
modifier is often interpreted most naturally as a modifier of the
syntactic subject of the modified clause. Since absolutive phrases
include an overt first daughter whose semantics supplies the external
argument of the second daughter, the elliptical nature of these
modifiers is more readily seen.

# Motivating Examples

- Depictives can be single-word modifiers or complex predicative
phrases: *Furious, he stormed out*.
- Depictives cannot always be interpreted as modifying the main clause
subject: *Furious at Browne, there was nothing left (for me) to do
but storm out*
- In both absolutives and depictives, the daughter supplying the
semantic head is predicative, whether headed by a verbal present or
passive participle, an adjective, or a predicative nominal:
*Singing, Browne departed*, *Amused, she smiled*, *Indifferent, he
yawned* *Her friend a veterinarian, Browne's pets were well cared
for*.
- These modifiers may include negation or internal scopal modifiers:
*Her friend not yet a licensed nurse, Browne had to get vaccinated
elsewhere*.

# ERS Fingerprints

      subord[ARG1 h1, ARG2 h2]
      h3:[ARG0 e1]
      h4:[ARG0 e2]
    
      { h1 =q h3, h2 =q h4 }

# Interactions

- These non-lexicalized clausal modifier constructions are closely
related to clausal modifiers with a prepositional head, including
*with* as in *With Abrams not speaking to Browne, the dinner was
awkward*, and *while* as in *While furious with Browne, he still had
to be polite*. So the non-lexicalized modifiers introduce a generic
*subord* relation which might be specialized to one of these
lexically introduced ones.

# Reflections

- Another construction that one might think could be treated as
subordination involves sentence modifying indefinite or definite
*frame-setting* noun phrases as in *A wealthy woman, she was admired
for her generosity*. At present, the ERG introduces an implicit
conjunction predication taking as arguments the instance of the
modifying noun phrase and the modified clause's handle. Treating
these instead like the depictives would be challenging, since we
would have to project the NP's semantics into some implicit event
relation whose handle could serve as the other argument of the
*subord* relation.

# Open Questions

# Expert External Commentary

# Grammar Version

- 1212

# References

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_NonAdverbialClausalModifiers/_edit)]{% endraw %}