{% raw %}# ESD Test Suite Examples

    Did you?
    There were.
    Abrams tried to.

# Linguistic Characterization

English allows the complement of an auxiliary or of the infinitival
marker *to* to be omitted, if it can be reconstructed from context.
Sometimes called VP ellipsis, this construction is better identified as
post-auxiliary ellipsis, since the missing constituent need not be VP if
the auxiliary in question can take a non-VP complement (e.g. *Who is at
the door?*/*Kim is.*). The interpretation of elided constituents is an
interesting and complex area of English grammar, especially as it
appears to be constrained by the linguistic context, though that can be
from a prior sentence, including one uttered by a different speaker.
\[FIXME: Citation Needed\]

# Motivating Examples

A sample context that would support each of the test suite examples is
given below:

    I saw the movie.  Did you?
    I thought there weren't any dogs, but there were.
    Browne didn't want to go, but Abrams tried to.

# ERS Fingerprints

From the point of view of the sentence-by-sentence processing done by
the ERG, the interpretation is not given by the sentence itself.
Accordingly, the elided element(s) are represented via one of two EPs.
These characteristic EPs can be used to trigger the search for an
appropriate antecedent, which will typically be not just a single EP but
rather a subgraph of some MRS from some utterance in context.

The first, used when the subject is referential (non-expletive) has an
ARG1 role.

      ellipsis_ref[ARG1 x0]

This serves two purposes: First, it reflects the fact that the subject
in such cases will be interpreted as playing some role within the
reconstructed subgraph after the antecedent expression has been found.
Second, it ensures that the MRS produced by the grammar in cases of
ellipsis with contentful subjects will be connected graphs. Without that
ARG1 position, the semantic contribution of the subject (of the head
licensing the ellipsis) would not be integrated.

The second characteristic EP appears when the subject is an expletive:

      ellipsis_expl[ARG1 u0]

This EP also has an ARG1 role, but it is not linked to anything.

# Interactions

- When the auxiliary verb licensing the ellipsis is negated, as in
*They didn't.*, the ellipsis\_ref or ellipsis\_expl is represented
as the argument of neg (via a qeq constraint).

# Reflections

- The grammar provides two analyses for *Were there?*, one with two
predications (\_be\_v\_there and ellipsis\_expl, and one with just
ellipsis\_expl). On first glance, it might seem that the analysis
with \_be\_v\_there is the only plausible one, since something must
be licensing the expletive *there*. However, the second one, with
just ellipsis\_expl is motivated by examples like *I thought there
were going to be dogs, but there weren't.* where one possible
resolution of the ellided constituent is (the semantic
representation of) *going to be dogs*. On that reading, the
\_be\_v\_there predication is provided by the resolution.
- Note that the predicative copula and then identity copula are not
distinguished in ellipsis. The claim is that ellipsis\_ref could
resolve to either antecedent.
  
  - *I'm hungry. Are you?*
  - *Who is Macbeth? Kim is.*

# Open Questions

- ARG1 is meant as an underspecification over several possible roles
(at least ARG1, ARG2, ARG3; others?). Should we choose here a
different symbol for that underspecification (ARGn, ARG)? \[Decision
on 4/15/14: go with ARG.\]
  - *Abrams wasn't hired, but Browne was.*
  - *Abrams wasn't given an assignment, but Browne was.*
- I can't get ellipsis\_expl to show up with it, even in the example
from the testsuite (1212). \[Identified as grammar bug.\]
- Why would ellipsis\_expl need an ARG1? \[No. To fix in the
grammar.\]
- Possible case of conflicting desire for symmetry: VP ellipsis and
NP-taking auxiliaries (identity copula, *there* copula, British
possessive *have*).

# External Expert Commentary

\[To be solicited\]

# Grammar Version

1212

# References

Dalrymple, M., Shieber, S. M., & Pereira, F. C. (1991). Ellipsis and
higher-order unification. Linguistics and philosophy, 14(4), 399-452.

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_Ellipsis/_edit)]{% endraw %}