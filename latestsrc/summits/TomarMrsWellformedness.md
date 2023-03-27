{% raw %}See also: [RmrsWellformedness](https://delph-in.github.io/docs/tools/RmrsWellformedness)

Glenn intro: Are MRSs which correspond to fragmented graphs well-formed?
Ex: *Nearly every dog barked*. (see
[slides…](http://www.delph-in.net/2014/mrs.pdf))

Emily: This came in part from a discussion at UW where we wished for a
checklist of things that can be asserted to be true of ERG-MRS or
DELPH-IN-general MRS.

Berthold: Example: grammatical gender, where the input is \[GENDER
neut\] but in the lexicon the variable property is constrained to
something else.

Woodley: If input MRS is something that came from elsewhere (not the
grammar) then maybe the subsumption test should be done leniently.

Ann: Historical background to subsumption check: It was partly because
at some point, in order to guarantee to generate in the semantic input
(*the dog barked* not good enough if input were *the black dog barked*)
we check to make sure you got it all. There are different things that
one means by subsumption, but that was one reason.

Glenn: Skolemizaton?

Woodley: A lot of things that would be caught by the subsumption test
are ruled out otherwise, but there are still some that it catches that
others don't.

Ann: I don't think that subsumption check is the right notion, but at
least it's declarative, while skolemization isn't.

Glenn: In agree skolemization is declarative.

Ann: It can be declarative in terms of feature structures, but what
you're doing is imposing additional information on the MRS when you
skolemize the input in the first place, and that's the step where you'd
have to formally say what's going on, but no one's done that yet.

David: Thinking out LOUD as a user of MRS. Are we interested in making
the MRS look nice in some polished sense or… In the example, it doesn't
matter to me as a user if it's not absolutely connected, so long as it
always comes out the same way. To be consistent, we want an
understanding of why the things are there.

Ann: I want to ask in what sense is that not connected?

Woodley: To answer David's first question, the MRSes already are
beautiful.

Dan: Whew!

Glenn: [EdsTop](https://delph-in.github.io/docs/tools/EdsTop) page on the wiki.

oe: The phenomenon we're looking at here is degree specification of
quantifiers. For as long as I can remember, we've always said we don't
really know what would be the right thing to do in the logic, and the
best Dan can do is connect the degree modifier to the quantifier by
having it share a label.

Ann: What graph is not connected?

oe: When we reduce that MRS to EDS, don't have a connection. In DMRS,
non-directed eq only link. In both views, we're being reminded about the
lack of underlying analysis. (DMRS: something that's not a directed
glass.)

Ann: I agree that there's something problematic about the analysis, but
not sure about the notion of graph connectivity. In DMRS, I'm pretty
sure that one doesn't end up with an undirected link. There are other
ones that do, and we want to say that's a correct analysis.

oe: If we say high-level that the handles are something formalism
internal, and the other links are formal variables, then we don't have
something connected here.

Ann: There's a way of arguing that that's a reasonable representation,
which involves making a new predication in the every, and that makes a
valid MRS. Don't particularly like this analysis, but I can see why it's
done. When talking about graph connectivity, be careful to say what
graph. Here, the graph without the labels.

Glenn: Which is a directed graph in TFSland, as opposed to a DMRS which
can have bidirectional links.

Ann: Even if you're not talking about TFS, but talking about various
formats of MRS, then there some notions of whether or not that's a
connected graph. If you took that as an MRS, and said I'm going to take
all the qeqs introduce links from those and links between the labels,
then it's a connected graph. You've got to say what you're doing when
you talk about a graph.

Emily: Can we list the low-hanging fruit of what's true of all
well-formed MRSs?

Mike: Re not having an undirected eq link --- my code does that there,
because of what's in the Slacker Semantics paper.

Ann: To be honest, I need to check the details, but I don't think this
particular example comes up with an undirected link, but I could be
wrong. Not talking about fundamentals, just trying to make some things
clear in this discussion.

Glenn: The type of MRS graph that I normally think of is a directed
graph where each EP is its own entry point where it has to have its bag
semantics as a special case. You're talking about graph rooted at LTOP?

Ann: A label graph, a label plus qeq graph, a graph that involves the
other variables and so on --- need to say which of those you're talking
about.

Ann: Notion of wellformedness in the MRS paper --- not interested in
that one? If your'e going to talk about types of wellformedness, should
include the official one.

Glenn: Would you like to remind us?

Ann: Talking about this in terms of underspecification of fully scoped
structures, and there has to be at least one.

Emily: There's more we can say, right? E.g. about a quantifier for all x
variables? Is that subsumed?

Ann: The notion of a fully scoped structure is relative to a particular
logic. If you make certain assumptions in that logic like not allowing
unbound variables in the class x then it follows.

Emily: Looking for an enumeration of the assumptions we're making.

Ann: That one is in the MRS paper.

Mike: Can you have more than one CARG on an EP?

oe: Not a property of the formalism … there was a variant of the ERG
that allowed it. Important to distinguish between properties of the
formalism and best practices.

Ann: Not best practices, but what's DELPH-IN MRS. Things we're depending
on in the way we use the MRSs.

Emily: Yes, that.

oe: So relevant conventions.

Francis: Does this break the conventions? Can you have something linked
both directly through an argument and through a discourse relation.
E.g., topicalized subject in Jacy is both ARG1 of the verb and linked
via topic\_d\_rel to the verb. Only allow that config with \_d\_rel…

Ann: If you think of anything with \_d\_rel as something that belongs in
a different piece of the world, that would be true. Not done yet…

Dan: Trunk ERG had moved those to ICONS.

Dan/oe: It's just the Lisp code that doesn't represent ICONS.

Ann: I'm happy that \_d\_rels have been replaced by ICONS, but when you
still have \_d\_rels, no one is supporting putting them elsewhere in the
structure.

Woodley: Even with \_d\_rels, why is that a problem in well-formedness?

Francis: Because we have reentrancy already, we can have that too?

oe: The only formal problem would have to be that there's no way of
scope resolving it, but I can't work that out on the fly. Woodley has
already thought about that and worked out that there's a scope resolved
structure.

Dan: Pretty sure there is, because the scope machinery was happy with
the previous version of the ERG with \_d\_rel.

Emily: But Ann seemed to share the intuition that there's something
fishy…

Ann: … something fishy about \_d\_rels, not the configuration, because
of characteristic variables.

Dan: That brings up the assumption that any given characteristic
variable comes up only in one EP as ARG0.

Glenn/Dan: A variable should be introduced in exactly one EP, and shows
up elsewhere only as a variable.

Woodley: DELPH-IN assumption, doesn't follow from formal wellformedness.

Dan: Not all DELPH-IN grammars necessarily follow this.

Ann: If you don't follow that, can't have a DMRS. That is explicit in
the DMRS paper.

oe: That property forced events as ARG0 on adverbs, comp\_rels and all
sorts of things where those events are not easily explained to at least
some formal semanticists. Hence the assumption about the distinguished
variable/characteristic variable. Not a formal property.

Ann: That was not introduced in adverbs for the purposes of having
characteristic/distinguished variables. Already in adverbs, didn't want
hard adverbs/adj distinction.

Dan: There are good linguistic reasons for having them, because adverbs
and degree modifiers can themselves be further modified. If you don't
want to say that that's always scopal, you have to have some way to talk
about them. But your point is well taken in other corner cases:
\_am\_rel/\_pm\_rel is an example of somewhere where we had to stuff in
ARG0s, but for adverbs and adjectives that was linguistically motivated
and not about the formalism.

Ann: That trick is why you can have a variable-free version of the
formalism which is equivalent to a version with variables. That's the
point I'm making, not that it's about DMRS --- the characteristic
variable property allows you do to away with the variables.

Glenn: Any grammar writers knowingly violating this?

Francis: Jacy, but it's a bug.

Glenn: So shall we vote on it?

Bec: Switching tangents to other properties: What about cycles? MRSs
shouldn't have cycles?

Glenn: Again, which graph?

Bec: Problems I hear about seem to have to do with cycles in EDS… DMRS?

Ann: If you think that an undirected link is actually a bidirectional
link, then I guess DMRS has cycles. Not absolutely certain you can make
cycles, but you probably can.

Bec: These are the properties that turn the MRS colors in the GUI?
Fragmented, cyclic, ...

Woodley: I thought you were going to say when you burned them…

Glenn: Not sure which GUI you're referring to?

Bec: \[incr tsdb()\]

Berthold: Connectivity is the third one.

Emily: Documentation of the code underlying that check?

Bec: Took my definition from the EDS Lisp code…

\[oe comes back into the room\]

oe: All of this is based on the EDS, in 2002 or so. A way of giving Dan
some additional feedback. There are two things that I test there:
fragmentation (does the EDS graph hang together), cycles (is there a
cycle in the EDS graph). I don't remember the exact colors that are
associated with these properties.

Dan: Oh, I do.

oe: Showing the treebanker a concise representation of the core semantic
info, and visual info about the status of that graph. That led Dan to
add more ARG0s to many EPs.

Dan: I did. There were also cyclic structures that weren't meant to be
cyclic. I still attend to red (cyclic) with some interest; the yellow
ones (fragmentation) I have learned to live with and sleep well at
night. I rarely find the yellow coloring something indicative of
something I should fix in the grammar.

Bec: So that's just an indication that something might be wrong, not a
hard check.

Dan: It has through the years been informative.

oe: I suspect in 95% of the cases it's a reminder of us not having a
good analysis of degree specifiers…

Woodley: Regarding cycles: Can be ill-formed for varying reasons. qeq
cycles -&gt; MRS that can't be scoped. Cycle within the logical
structure -&gt; logical sense, but does not correspond to English: x
chased y and y chased z and z chased x. Are we talking about both of
those as being ill-formed in the same way, or drawing a distinction?

Ann: I think there's something very interesting that goes on in terms of
the definition of well-formedness in the cases where we can perfectly
happily say something logically but it doesn't correspond to English,
but it isn't quite the same as … There are other cases where you at
least get an undirected DMRS link where I believe Dan is proud of the
analysis: the relative clause case; *the dog whose toy the cat bit
barked.*

Dan: Still proud of that analysis.

Ann: So something pretty interesting going on there. The fact that you
can't get the Woodley-style example … if you could get those, the
scoping machinery wouldn't' work, but it's perfectly happy with the
relative clause example.

Berthold: Question to Dan: You don't make the link from the ARG0 to the
\[in degree specification example\] … because otherwise the scope
resolver wouldn't like it? It seems like you'd have richer information
if you did have that.

Ann: Link from ARG1 to what?

Dan: Quantifier labels need to be free, like whales.

Ann: The correct analysis of *nearly every* is that you have *nearly*
taking scope over *every*, not over *every dog*, but if you have the
ARG1 being the handle of *every*, you get that latter prediction. Dan's
analysis corresponds to making a new quantifier, a new concept, *nearly
every*.

Dan: If we could make on the fly predicate names, we could turn that
into something that's okay, but then we'd have an open-ended set of
quantifier predicates \_almost\_but\_not\_quite\_every\_q\_rel.

Ann: it's not enough --- not just a matter of creating predicate names,
but creating a tree structure. At one point I thought we could do it by
creating a predicate name.

Dan: Because you want the internal structure.

Ann: There was a thesis on this around 2008/2009: the notion of
modifiers of quantifiers. There was almost no literature on this when we
first looked at this. (Haven't had time to go back to this.) It's all
very well to make up MRSs, but unless you have some clue about what
you're saying the thing means, one is a bit lost. The notion that that's
a new quantifier in terms of the logic …

Woodley: The near paraphrase *it's nearly the case that every dog
barked* is wrong from your point of view? Wrapping the scopal *nearly*
around the whole thing is just not the right analysis?

Ann: What I was objecting to was the analysis with *nearly* wrapped
around *every dog* which is what you'd get with label of *every* as ARG1
of *nearly*. Not sure about an analysis where you turn it into a
sentential adverb, but I'm dubious.

Woodley: If nearly outscopes *every*, doesn't it also outscope *dog* and
*bark*?

Ann: (nearly(every))\[x, dog(x), bark(x)\] : only thing I could think of
that's plausibly okay logically. Would have to add some sort of new
thing, given our machinery, that just points to the predicate symbol
(the quantifier symbol) … just decided it wasn't worth the hassle.

Dan: This is a conversation we've had with very smart logicians over 8
years, and after about 3 hours, they scratch their heads and say, "Yup,
that's a hard problem" and go home for dinner. Ann and Woodley aren't
going to solve it in the next 20 minutes.

Ann: As I say, there's a thesis.

Berthold: Resurrect BV as distinct from ARG0?

Ann/Dan: Been there, tried that.

Dan: Other places where we have started to adopt conventions/best
practices. One which is almost but not quite consistent in the ERG:
Attempt not to allow propositions to be directly arguments of scopal
predications; always have a qeq intervening between the argument and the
LTOP of the lower clause. Mostly because that's the only right thing to
do, to allow quantifiers to scope in between. Argument positions of
predicates like modal operators or a verb like *believe*, need to put a
qeq there. Not completely consistent yet in the ERG, keep finding places
where it's failed.

Ann: Do you think it's valid to do that when you're decomposing a
lexical structure.

Dan: Like nominalization? Found at least one place where I didn't and
regretted it.

Francis: Matthieu often asked, because Jacy has it sometimes and not
others, and wanted a guideline.

Dan: Coordination of clauses … not really clear, maybe an
over-application there. But more cost in forgetting to do it.

Guy: Do you have an example?

Dan: *Mary can hire a consultant* the VP *hire a consultant* you might
say just take the label of *hire* and make that directly the value of
the ARG1 of *can*. But then you can't get a quantifier between *can* and
say negation over the embedded VP. We want quantifiers to be empresses
that can float freely through the universe, even though they might never
bother with that particular landing site.

Ann: Don't need negation. *Mary can hire every consultant.* Arguably you
want the *every* to scope above or below *can*.

Woodley: Blanket policy seems dangerous and like a strong linguistic
prediction that may or may not be supported. This example clear. But
what about *can't hire a consultant*, not can't move there, can it?

Emily: *not* is always fixed by its position in the string, but the
quantifiers can go above or below. More interesting examples of lexical
decomposition are *everybody*, etc.

Dan: Even there, I worry about complicated examples.

Ann/Dan: We found one back in 2006…

Francis: If you find it again, can you put it on the wiki?

Mike: As a developer of a tool that manipulates MRSs, would like it to
be correct and to be consistent with the grammars. What I'd like to see
is a list of conventions of DELPH-IN MRS, and then grammars can say
whether or not they follow and tools can point to what they assume.

Mike: At the Abbey talked about augmenting the SEM-I with predicate
arities, to avoid having to load the grammar to find this. See
[SemiRfc](https://delph-in.github.io/docs/tools/SemiRfc).

\[Scribe is done\]

Last update: 2015-11-19 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/TomarMrsWellformedness/_edit)]{% endraw %}