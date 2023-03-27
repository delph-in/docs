{% raw %}# ESD Test Suite Examples

    Abrams is Browne.
    Browne is a manager.
    The reason: the dog.
    The theory is that Browne arrived.
    The reason: Browne arrived.
    The plan is to sleep more.
    All Browne could do was arrive.

# Linguistic Characterization

In contrast to uses of the copula which we analyze as semantically
empty, there are cases where the copula verb itself introduces a
predicate which (roughly speaking) denotes identity between its two
arguments. The simplest cases are the ones where both arguments are
expressed as noun phrases, but we also find uses of the copula with
clausal complements (both open and closed).

# Motivating Examples

In the simplest cases, such as *Abrams is Browne*, the two arguments are
expressed as NPs and the predicate introduced by the copula describes
identity between the referents of the NPs. We also use the same
predicate in the analysis of predicative nominals, like *Browne is a
manager.* In another class of cases, the second argument of the copula
is clausal (open as in *The plan is to sleep more.* or closed as in *The
reason is that Browne arrived.*). This is represented by having the
label (local top handle) of the clause be the identity predicate's
second argument. We sometimes find punctuation (namely \`:') as the form
of the copula, in both nominal and clausal complement cases as
illustrated in the test suite examples.

Finally, we have grouped the *do ... be* construction (Flickinger &
Wasow, 2014) under this category:

- *All Browne could do was arrive.*

In this construction, both *do* and *be* introduce special predicates
(**\_do\_v\_be** and **\_be\_v\_do**, respectively). **\_do\_v\_be**
takes as its second argument an instance variable representing what was
done. This instance is then also the ARG1 of **\_be\_v\_do**, which like
like **\_be\_v\_nv** takes a handle as its second argument.

# ERS Fingerprints

There are currently a wide variety of identity copula predications, so
we do not have one unified set of fingerprints for this phenomenon.
Rather, any of the following represent identity copulae:

    _be_v_id[ARG1 x1, ARG2 x2]
    h1:[ARG0 x1]
    h2:[ARG0 x2]
    { h3 =q h1, h4 =q h2 }
    
    _colon_v_id[ARG1 x1, ARG2 x2]
    h1:[ARG0 x1]
    h2:[ARG0 x2]
    { h3 =q h1, h4 =q h2 }
    
    id[ARG1 x1, ARG2 x2]
    h1:[ARG0 x1]
    h2:[ARG0 x2]
    { h3 =q h1, h4 =q h2 }
    
    cop_id[ARG1 x1, ARG2 x2]
    h1:[ARG0 x1]
    h2:[ARG0 x2]
    { h3 =q h1, h4 =q h2 }
    
    _be_v_nv[ARG1 x1, ARG2 h2]
    h3:[ARG0 x1]
    h2:[ARG0 e]
    { h4 =q h3 }
    
    _be_v_do[ARG1 x1, ARG2 h2]
    h3:[ARG0 x1]
    h4:[ARG0 e]
    { h2 =q h4, h5 =q h3 }

# Interactions

While the identity copula predications are mostly introduce by lexical
items, the same EPs are in some cases introduced by syntactic
constructions. In particular, in identity N-bar
[coordination](https://delph-in.github.io/docs/erg/ErgSemantics_Coordination), as illustrated by the
following test suite example:

- *My friend and colleague arrived.*

the two conjuncts are interpreted as referring to the same entity. This
is represented with an **id** predication taking them each as arguments.

Similarly, in absolutives with NP predicates, we posit **cop\_id** as
mediating between the two NPs inside the absolutive modifier:

- *With Browne the manager, Abrams arrived.*

# Reflections

Huddleston & Pullum (2002, p.266) distinguish ascriptive and specifying
uses of the copula, where the specifying use (illustrated by the most
salient reading of the first example below) ‘defines a variable and
specifies its value.’ The ascriptive use in their terminology, on the
other hand, relates a property (the complement) to a theme (the
subject). They thus group together ascriptive uses of the copula with NP
complements and the copula that takes adjectival or PP complements, as
in the second example below.

- *The chief culprit was Kim.*
- *His daughter is very bright / a highly intelligent woman.*

Huddleston & Pullum (2002, p.267) also note that while NP-complement
uses of the copula are in general ambiguous between the ascriptive and
specifying readings, it-clefts are unambiguously specifying:

- *His first proposal was a joke.*
- *It was a joke that he proposed first.*
- *What he proposed first was a joke.*

Similarly, they note on p.270 that interrogative *who* can only be used
to question specifying uses: *Who are they?* and on p.271 that personal
pronouns as predicative complements of *be* are necessarily specifying
and certain NPs with singular (count) noun heads but no determiner are
necessarily ascriptive (*She is secretary of the bushwalking club.*).
The fact that syntax disambiguates in these cases suggests that we might
want to create finer-grained representations of the possible
interpretation of the copula with an NP complement. On the other hand,
assimilating ascriptive NP-complement copula uses to the AP/PP
complement cases (where we treat the copula as semantically empty) seems
unnecessary.

In a later chapter, Huddleston & Pullum (2002, p.402, fn 35) note that
the use of *be* in examples like *Max was Macbeth* is a special use
‘that cannot be subsumed under either the specifying or the ascriptive
use.’

# Open Questions

- No examples in esd.txt yet --- I put together a list based on the
CCS sentences for this phenomenon, but with some modifications.
- Is there good reason for the colon to introduce a different EP from
forms of *be*?
- Why no qeq between the ARG2 of \_be\_v\_nv and its complement?
- I don't yet fully understand what the analysis analysis of do-be.
Should both of those verbs really be contentful? Is there a reason
that \_be\_v\_do isn't assimilated to \_be\_v\_nv? Is there are
reason that \_be\_v\_do does have a qeq for its second argument
while \_be\_v\_nv does not?
- Why is id in identity n-bar coordination not \_be\_v\_id?
- Why is cop\_id distinct from both id and \_be\_v\_id?

# Expert External Commentary

# Grammar Version

- 1214

# References

Huddleston, R., & Pullum, G. K. (eds) (2002). *The Cambridge Grammar of
the English Language.* Cambridge: Cambridge University Press.

Flickinger, Dan and Wasow, Thomas. (2014). A Corpus-driven Analysis of
the Do-Be Construction. In Hofmeister, P. and Norcliffe, E. (eds). *The
Core and the Periphery Data-Driven Perspectives on Syntax inspired by
Ivan A. Sag.* Stanford: CSLI Publications.

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_IdentityCopulae/_edit)]{% endraw %}