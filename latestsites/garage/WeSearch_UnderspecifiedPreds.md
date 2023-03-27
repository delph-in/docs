{% raw %}Rough notes on discussion of proto-agent/proto-patient,
causative/inchoative alternation, underspecification of arity in
predicates (in descriptions of LFs)

Proto-agent v. proto-patient

Generalization is that if there are two arguments proto-agent is more
syntactically prominent than proto-patient (in lexical arg-st)

But if there is just one argument, can't tell, so can't use these as
labels in e.g., [PropBank](/PropBank) (or can't correctly)

*Bruce Springsteen played \~ The music played*

Causative-inchoative

That alternation in English usually involves obligatory second argument
in the causative form. A few have optional direct objects, and so we
have two entries for play, both of which are available in *John played*.

Causative is grammaticalized, so we are making that distinction. But we
can't make a systematic distinction by equating ARG1 uniformly with
(proto-agent) etc.

Can end up with contradictions trying to push this through:

- *Kim galloped the horse*
- *Kim galloped*
- *The horse galloped*

Transitive is causative, but with the intransitive can't tell. In (1),
Kim is more agentive than the horse, but in (2) and (3) the sole
argument is still agentive.

Dowty: proto-agent will be (deep syntactic) subject when proto-patient
is object when they're both there. But can't make those role lables.

Current solution:

gallop\_v\_1 (e,x) gallop\_v\_cause (e,x,x) : second argument optional

Get two analyses for (2) and (3), and one for (1).

Possibility: gallop\_v underspecified between gallop\_v\_1 and
gallop\_v\_cause; part of the reason for allowing the subsense field to
be underspecified. Not talking about decomposed representations, but
interpreting it along the lines of:

- cause(Kim, gallop(x), horse(x))
- gallop\_v\_1(ARG1: horse)
- gallop\_v\_cause(ARG1:Kim,ARG2:u)

Replace that with:

- gallop\_v(ARG1:horse)

SEM-I specifies that there are two fully specified ones. But not built
that way because these open-class predicates are strings: handle this
not with the main predicate hierarchy. Hierarchies of predicates could
(easily, in principle) be handled separately. But this is distinct from
general hierarchies of predicates: it involves grammaticalization and
thus is our business in a way that [WordNet](/WordNet)-style hierarchies
are not.

Use multiplace "things" to store lexeme, sense, subsense, and then
output as the usual strings, but treat as separate pieces of
information. Then existing mechanisms for underspecification would work.
The only missing thing is code to support synthesizing the predicate
names.

Attempting to underspecify over predicates of variable arity. Alex said
she wouldn't be able to interpret that. But Lascarides/Koller paper did
interpret that in RMRS. Can build a representation that is syntactically
an underspecification of some more specific representations. At the end
of parsing, using the SEM-I, ambiguate. (Wrong: pick based on arguments
present.) Descriptions of representations, not representations.

[PropBank](/PropBank) scheme only has two choices:

- gallop\_v\_1 takes only ARG2, but that's an agentive argument: The
horse deliberately galloped across the pasture
- miss the generalization about the relationship between gallop\_v\_1
and gallop\_v\_cause

We don't quite get the generalization, but what we're doing is at least
defensible and could be extended as above.

In the parsing direction, we're always going to get two analyses for
"Kim galloped" (Kim as horse, Kim as rider), but it would be nice to be
able to give just one, underspecified generator input. Might also want
to be able to put the underspecified version in a treebank (if we don't
know if Kim is the horse or a rider). But: if what's being banked is
trees, there is no tree like that. For MRS banking it might make more
sense to allow the annotator to pick the underspecified gallop\_v
predicate.

Over waffles:

Can we treat \_bother\_v\_rel as underspecified between taking clausal
(h) and nominal (x) subject? In logic, no, but again MRSs are
descriptions, not directly representations.

Last update: 2012-05-01 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/WeSearch_UnderspecifiedPreds/_edit)]{% endraw %}