{% raw %}# ESD Test Suite Examples

    Browne's barks.
    The dog chased that one.
    Three bark.
    That's enough.

# Linguistic Characterization

This phenomenon involves anaphoric noun phrases which either don't
include a pro-form at all (*Browne's*, *Three*) or have the pro-form
*one*, which is unusual among English pronouns in that it can take
dependents. All of these expressions take their interpretation from the
(linguistic or non-linguistic) context. Though one anaphora in
particular are famous in the syntactic literature because Baker (1978)
claimed that the antecedent could only be an N' (not a simple N), in
fact Payne et al (2013) convincingly argue that the constraints on the
possible antecedent of *one* in this use are semantic rather than
syntactic. In particular, they show that the antecedent can be any
pragmatically plausible expression of (in their terms) type &lt;e,t&gt;.
In MRS terms, this means that the antecedent should be a subgraph rooted
in a predication denoting an entity. Where Payne et al (2013) focus
specifically on expressions involving the form *one* (e.g. *The dog
chased that one.*), Nerbonne et al (1989) group these together with
‘null-head anaphora’ (e.g. *Browne's barked*) under the term ‘N-bar
anaphora’. The ERG's semantic analysis further identifies expressions
such as *Three* in *Three bark* and *Those* as in *Those disappeared* as
members of this class. While at first glance the demonstratives in
particular might seem like lexical NPs, examples like *Those from the
park disappeared* motivate an analysis where the NP is built
syntactically.

# Motivating Examples

- *Sandy has a blue glass, but we couldn't find another one for Kim.*
- *Sandy always likes the pictures of Kim better than the ones of
Pat.*
- \[Looking at a display of chocolates:\] *I want one!*

Note that one of the testsuite examples actually involves two instances
of this phenomenon:

- *That's enough.*

In this example, *that* and *enough* are both associated with (separate)
instances of generic\_entity.

# MRS Fingerprints

This phenomenon is characterized by the appearance of generic\_entity in
the MRS. This EP is meant to serve as a cue to further processing
components that there is anaphora resolution to be carried out.

    generic_entity(ARG0 x1)

# Interactions

# Reflections

- One and null head anaphora are to be distinguished from partitive
expressions (e.g. *Some of the books arrived.*), the latter being
characterized by part\_of predications.

# Open Questions

- In the current grammar, *one* introduces card analogously to other
numeral adjectives. In examples like the following, this seems
well-motivated:
  
  - *Sandy saw three dogs, but Kim only saw one.*

However, in other uses, it seems more surprising to see the card
predication:

- *The dog chased the red one.*
- *The dog chased the red ones.*
- *I have the one I found yesterday.*

Furthermore, the information provided by this predication (CARG 1 in the
case of *one* and CARG 2+ in the case of *ones*) is redundant to the
number information (sg v. pl) provided by the variable property NUM. It
seems probable that there is actually a cline in usage here, where some
examples clearly pattern with the other numeral adjectives, some clearly
don't, and others are more muddled. One approach would be to ambiguate,
creating two lexical entries for *one*, both of which would be able to
participate in the analyses of the items above. (Presumably *ones* would
be unambiguously non-card-introducing.) However, in the absence of any
syntactic cues that could rule out one or the other of these *ones* in a
given context, according to the design principle of minimizing
unresolvable ambiguity, we opt to choose only one analysis to stand in
for both. Given (a) the availability of the information that would be
introduced by card (through CARG) in the NUM attribute and (b) the
observation that an external source of MRSs for generation should not
need to know to provide card in these cases, a likely future direction
for the grammar is to drop card from *one* (except where it participates
in larger number names, like *one thousand one hundred and twenty one*).

- The example *That's enough* has two generic\_entity EPs in it, one
corresponding to *that* and one to *enough*. If generic\_entity is
supposed to be an instruction to find a relevant (linguistic?)
antecedent, we are claiming that these instructions are the same for
demonstrative pronouns as for one anaphora and partitives, modulo
what we can get from the quantifier EP. On the surface, this claim
is a bit surprising to me, but I'm not sure what kind of evidence
could be used to support or refute it.
- ‘subgraph rooted in a predication denoting an entity’ --- do we not
have a more streamlined term for that yet? Also, I couldn't find
‘entity’ anywhere on the [Basics](https://delph-in.github.io/docs/erg/ErgSemantics_Basics) page. Is it
meant to be there?
- ‘subgraph rooted in a predication denoting an entity’ --- do we
expect these to always correspond to &lt;e,t&gt;?

# Expert External Commentary

# Grammar Version

1212

# References

- Baker, C. L. (1978). Introduction to generative-transformational
syntax. Englewood Cliffs, NJ: Prentice-Hall.
- Payne, J. & Pullum, G. K. & Scholz, B. C. & Berlage, E.(2013).
Anaphoric one and its implications. Language 89(4), 794-829.
Linguistic Society of America. Retrieved May 12, 2014, from Project
MUSE database.
- Nerbonne, J., Iida, M., & Ladusaw, W. (1989). Running on empty: Null
heads in head-driven grammar. In Proceedings of the Eight West Coast
Conference on Formal Linguistics. Stanford: CSLI.

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2014-05-14 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_OneAnaphora/_edit)]{% endraw %}