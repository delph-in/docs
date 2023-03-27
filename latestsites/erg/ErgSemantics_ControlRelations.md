{% raw %}# ESD Test Suite Examples

    The dog tried to bark.
    Abrams persuaded the dog to bark.
    It is easy for the dog to bark.

# Linguistic Characterization

‘Control’ (also know as ‘equi’) refers to a class of predicates that
take at least one individual type argument and at least one clausal
argument and furthermore have the property that the individual is also
an argument of the predicate inside the clausal argument. This
phenomenon lexically-specific, that is, it is mediated by a class of
lexical items that, in the composition, build the link between the
individual and the embedded clause. The class of lexical items has many
sub-classes, characterized by part of speech (verbs and adjectives) and
argument structure patterns. While most of the argument structure
variation is only syntactic (e.g., PP v. NP complements; base form VP
complements v. *to*-marked VP complement v. progressive VP complements),
there is still some variation at the semantic level. Control is
distinguished from other configurations in which the same individual
appears as the argument of multiple predicates by the relationship
between the predicates themselves.

# Motivating Examples

Shared argument is subject/ARG1 of matrix clause:

- *Kim tried to leave.*
- *Kim refrained from laughing.*
- *Kim will try and find it.* ;; Note that this use of ‘and’ is
treated as semantically empty.

Shared argument is non-subject of matrix clause:

- *Kim invited Sandy to stay.*
- *Kim imagined Sandy taller.*

Control adjectives:

- *Kim is anxious to leave.* ;; Shared argument is ARG1
- *It is easy for Kim to leave.* ;; Shared argument is ARG2, clausal
argument is ARG1

# ERS Fingerprints

Because the shared argument and clausal argument can each fill different
argument positions of the control predicate, and similarly the shared
argument can have different roles in the embedded clause, if the
fingerprints had to specify precise argument roles (ARGn), we would have
many different sub-phenomena here. Instead, we make use of
underspecified argument positions (see
[ErgSemantics/Conventions](https://delph-in.github.io/docs/erg/ErgSemantics_Conventions)).

    [ARG0 e1, ARG1+ x2, ARG1+ h3]
    h4:[ARG0 e5, ARG1+ x2]
    { h3 =q h4 }

# Interactions

- v\_np-vpslnp\_oeq\_le is a lexical type that does both control and
lexical binding of a long-distance dependency (akin to
*tough*-adjectives).
  
  - *I have boxes to get rid of.*

# Reflections

At first glance, control relations are not obviously a semantic
phenomenon in their own right, but rather a sub-case of
predicate-argument linking (i.e. just part of the basic components of
semantic analysis). What distinguishes control from other types of
predicate argument linking is the particular configuration of argument
sharing: the ‘matrix’ or ‘upstairs’ predicate takes both the
‘downstairs’ predicate and one of its arguments as arguments. This is in
contrast to the syntactically similar relation called ‘raising’. Raising
predicates also relate one of their syntactic arguments to an argument
position in another, but in this case the shared argument has no
semantic role to play with respect to the matrix verb:

- *Kim seems to like sushi.*
- *Sandy expected Kim to like sushi.*

In these examples the shared argument (*Kim*) is semantically only an
argument of the embedded verb (*like*). In our MRS representations,
there is no connection between *Kim* and *seems* or *expected*; from a
semantic point of view, raising is unremarkable.

Because raising and control are syntactically very similar, however, it
is often not obvious which is in play in any given example. Sag et al
(2003, Ch 12) list four tests for distinguishing them, all of which turn
on the semantic difference (whether or not the shared argument has a
role to play with respect to the matrix verb): (i, ii) Raising, but not
control, predicates can accept the expletives *it* and *there* in the
shared argument position provided the embedded predicate selects for
that expletive; (iii) Raising, but not control, predicates can accept
idiom chunks in the shared argument position, provided the embedded
contains the rest of the idiom in an appropriate configuration; and (iv)
It is possible to create paraphrases by passivizing the embedded
predicate (and thus promoting a different argument into the shared
position) with raising, but not control predicates. There is the added
complication that any given lexical form might in fact represent more
than one lexical entry (and thus be ambiguously both raising and
control), although such cases of ambiguity appear to be rare.

The ERG recognizes a very broad range of lexical types which involve
control phenomena. The shared argument may appear as a subject, direct
object or object of a preposition. The embedded predicate may be verbal
or not, if verbal a *to*-infinitive, a base form VP, an *-ing* form VP,
or a passive, and may likewise fill different argument positions.
Finally, both adjectives and verbs instantiate control relations.

# Open Questions

- Are there any three-place adjectives where the clausal argument is
ARG3 and the shared argument is ARG2?
- Are there any two-place verbs where the clausal argument is ARG1 and
the shared argument is ARG2?
- Controlled ARG4?
  - *A team member tried to be traded to the Giants for a pitcher.*

# Grammar Version

- 1212

# References

- Sag, I. A., Wasow, T., and Bender, E. M. (2003). Syntactic theory: A
formal introduction (Second edition). Stanford: Center for the Study
of Language and Information.

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_ControlRelations/_edit)]{% endraw %}