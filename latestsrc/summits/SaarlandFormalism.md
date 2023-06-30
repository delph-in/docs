{% raw %}August 2nd, 2013

13:30 - 15:00 SIG: Vague, high-level, general formalism discussion (Yi)

Yi: I will talk about what we've been working for the formalism
extension under the Deependance project and its relation to DELPH-IN, in
terms of both benefits or potential "dangers".

Yi goes through some slides on TFS. The slides can be found at
[here](http://www.coli.uni-saarland.de/courses/syntactic-theory-09/slides/tfs.pdf).

Yi: The missing part is disjunction.

Emily: What's the benefits of using disjunction instead of two feature
structures?

Yi: Without named disjunction, you have to do full DNF expansion.

Emily: That causes processing problems?

Yi: Also description problems. You have to duplicate many of the
features.

Guy: Is it a more practical issue (vs. theoretical one)?

Yi: You lose generalization. You have to list them out. Take the example
of "Koffer".

Guy: The information is still there.

Yi: It cannot show the co-variance. The example is just for
illustration. For the moment, the processor just takes them as
independent alternatives, but in fact, they're not. We're ranking them
according to some specific feature paths. DELPH-IN does provide two
ways: 1) duplicate the entries; 2) through inheritance type hierarchy.
The problem is that the design needs to be very careful. Through
data-driven methods, it's extremely difficult to get generalization.

Emily: What are the use cases?

Yi: Statistical modeling usually has difficulty with re-entries (Abney
1996).

Emily: This is to remove re-entrancies?

Yi: No. This is to put the alternatives into the feature structures. In
terms of description, I think there are some benefits.

Yi shows the TDL parsing code (tdl.ypp) for the extended formalism,
highlighting the extended part, i.e., disjunction, named disjunction
(co-variant disjunction), and preferences.

Yi: Who will write the numbers is debatable. The disjunction was viewed
as an expensive operation in the past, but we could do some
quick-failure tricks to avoid the unification of disjunction early.

Emily: you may look at some lexical ambiguity cases in the current
grammar and see whether you can use disjunctions.

Yi: Yes, that's one thing we haven't tried yet. As for the disjunct
feature structure, on the upper part, there is the definite part; and
the other part is the uncertain part containing disjunctions. The whole
process will eliminate the indefinite part and finally get the finite
result; so as the unification process.

Rui/Yi: In another sense, it packs specific feature paths.

oe: 15 years ago, we used to be defensive about taking away such
powerful tools from the linguists, mainly due to the computational
efficiency reasons; advocated type underspecification instead of
disjunction.

Guy: Can we just have the underspecified types?

oe: It's not possible to access the substructure when you have
co-variance.

Yi: Another reason for not doing it in the inheritance type hierarchy:
it's almost impossible to do this practically.

Emily: What are you (machine) learning here?

Yi: We can just extract the probability distribution from the data
without changing the hierarchy.

Emily: There is something you learn from the corpus. But what's that?

Yi: We will have a core manually-crafted grammar and then we extract the
lexical information, constraints, etc. from the deep linguistically
annotated corpus and import into the dependency grammar, both the
lexicon and the preferences.

Emily: Redwoods or TIGER?

Yi: [DeepBank](https://delph-in.github.io/docs/garage/DeepBank). For German maybe TIGER, maybe also the work
done by Bart.

Emily: The grammar already gives you the hard co-variance.

Yi: We don't hope to learn all the co-variance, but to encode some of
them by hand and learn the distributions.

Emily: So the co-variance is already hand-coded, but the preference is
learned from the data.

Yi: Yes. Actually, I'm skeptical about putting the concrete values here,
since it depends on the other features in the feature structure. maybe
it could be the pointers to some ranking model.

Emily gave one example she might need this. \[EMB: This was probably my
remark about the strength of the social meaning associated with AAVE
copula absence being associated with the part of speech of the
complement of the copula --- the data are in my dissertation, but please
disregard my naïve remarks about stochastic modeling there.\]

oe said something and took it back.

Some discussions on the "real" OT.

oe: We should sometimes think about soft constraints.

Emily: I don't have problem of describing the soft constraint, but
quantifying it is not easy.

Rui/Yi: We thought about partial order vs. full order instead of
concrete values.

Emily: This reminds me of the mal-rules. There are also cases, where it
needs to decide which one to fix. (Distributed disjunction between what
is wrong and what the error message is.)

Yi: It's also not so clear for the processing, how to interpret them and
how to combine them.

Guy: Can we have some specific part and under-specific part.

Emily: The mal-rules are quite specific.

Yi: That's all for our part. we hope to test on a small set.

Mike: You might have some embedding within the disjunctions, otherwise
it will always pick the highest one.

Yi: Right. If we have complex named-disjunctions, it's hard to think how
to interpret/combine those numbers.

Emily: Is there any relation to the assigning lexical types for unknown
words? or super-tagging?

Yi: If the processing allows, it could be, but not sure whether it
causes problems.

Emily: Forget about the previous one. For valence lists of different
frames.

Yi: The example we thought about was the (free) word order. The naive
way is to enumerate all the possibilities, but we could learn it from
the corpus and choose the likely ones.

Emily: For grammar writers, it's easy to just have one lexical entry and
do the re-ordering automatically.

Yi: Hans once gave an example of different verbs have different
preferences of the order of dative and accusative complements, which are
lexical.

Emily: Dative shift: "I give the book to him" and "I give him the book".

Some discussions on linguistic phenomena.

Yi: For German, the modifiers are also involved.

Emily: Then it's complicated.

Mike: Generation?

Yi: For the moment, we only think about parsing. Given a word, we can
encode some ambiguous properties. but haven't thought about generation
much. In sum, for the whole DELPH-IN, this might be some thought out of
the box. We could do some experimental study about soft-contraints,
disjunctions, etc., brining them "back" to the formalism.

Last update: 2013-08-04 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/SaarlandFormalism/_edit)]{% endraw %}