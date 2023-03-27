{% raw %}Woodley: What's the point?

- Is this a string of the language, but more than that.
- Emily: Who did what to whom?
- Francis: Do I know enough about this to say it in another language?

oe: Then we might as well stop...

Woodley: Questions like which of these representations are better, could
make sense to view that from the perspective of better for what?

oe: That's utilitarian.

Woodley: Did you have a different type of science in mind?

Emily: If you're not asking better for what, that assumes you have some
sort of ground truth to compare it to.

Woodley: There's intrinsic or extrinsic, and for intrinsic, what do you
compare it to?

Woodley: The argument/adjunct distinction discussion was interesting,
because I was convinced there was something we were failing to
underspecify that could be grasped by RMRS, but that seems not to exist.
But if it did exist, how would we tell which is better?

Woodley: Dan's question of why distinguish between \_dog\_n\_rel and
named\_rel \[ CARG Fido \], but how do you approach the question of why
these are better?

Woodley: The design principles could be a stand-in for intrinsic
evaluation of design choices. But in cases where that doesn't fully
determine there should be some way of still having progress.

oe: Close paraphrases should lead to similar or identical structure. I
think we have intuitions about what is a close paraphrase and about how
well we achieve that.

Woodley: *The window opened/The window was opened*

oe: *Kim gave a book to Sandy/Kim gave Sandy a book*; *The fierce
dog/The dog is fierce*

Francis: *I went yesterday/Yesterday I went* still info-str differences.

Woodley: We have a list of these close paraphrases where that principle
has already been applied and makes great sense. We've been bumping up
against cases where that seem to quite get there, because our intuition
doesn't go that far.

oe: Can be that, but there can be cases of competing forces/design
principles in competition.

Dan: In quite a few cases there are two different near targets which
diverge.

Woodley: Non transitive property of being similar.

Francis: *I lost my temper/I lost my cool/I got angry*

Dan: Mostly stayed pretty close to the metal in terms of close
paraphrases having the same vocabulary. As soon as there's a different
content word, don't try to get the paraphrases *Kim's age is 10
years/Kim is 10 years old* not trying to make these the same.

Woodley: Certainly would be nice to have something to say about that
relationship, but not necessarily right out of the grammar.

Emily: Meaning postulates!

Dan: Meaning postulates are a very powerful tool, why not use it for
*Kim gave a book to Sandy*/*Kim gave Sandy a book.*

oe: Notion of economy.

Woodley: If the meaning postulates aren't written down anywhere, not
very satisfied.

Dan: Now have about 100 meaning postulates written down (implemented)
for logic course. Not all actually meaning preserving. *A and B are
cubes/A and B are both cubes/Both A and B are cubes* (1st and 3rd
already have same semantics) also *A B and C are all cubes*/*A B and C
are cubes*. David B-P insists they are exactly paraphrases.

Emily: This is where I think the logicians are interested in the full
range of meaning of NL.

Dan: No, but they have the advantage that they can be precise, and they
have a good test.

Emily: So they've carve out a small space. Most NLP applications aren't
doing block worlds.

Dan: Even that small space is hellishly hard. I haven't seen any cases
where the NLP application wants something that breaks what the block
world wants --- more like sentiment analysis just doesn't care about
those things.

Emily: Don't you have the linguist's intuition that *A and B are cubes*
means something different from *Both A and B are cubes*?

Dan: No.

Emily/Woodley: Maybe truth conditionally equivalent but would be said in
different situations/different distributions.

Francis: Would be interested in trying slightly larger block-world type
applications

Dan: I bring it up because it is an interesting application. Can try
lots of different linguistic things.

oe: One approach to meaning postulates is MRS rewriting (like what Dan
does). Another would be to map into a suitable form of logic and use a
reasoner.

Woodley: That one is out of reach because we don't have a suitable
object language.

oe: How much damage do I have to do to use something that can be used
for reasoning. How much damage would I have to do use FOL? Would we lose
any embedded clauses?

Emily: Yes, but Josh Cason says …

oe: Third approach currently exploring in Oslo is dumping EDS/bilexical
dependencies/MRS to RDF graphs, in the first instance to make them
searchable. Worked out how to do that and build an index that can be
efficiently searched for [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) and
[WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods). Then there are also reasoners. Would be
interesting to ask how much damage will result from interpreting MRSs

Emily: It is a lossy transformation, but is the loss relevant for some
task at hand? (Back to Woodley's question.)

Woodley: Lossy; defining meaning postulates over the lossy
representation. If the task was to make statements about full-featured
meanings, not clear what you've gained.

oe: In MRS rewriting space can work with native representations, but
don't have a formal notion of inference. In logic, lose some
expressivity, but have a well-defined notion of inference. Trade-off.
Would be interested to see what we lose in expressivity. Make one
attempt to reach out to an object language and understand what the
limitations are that would be painful.

Woodley: Have to decide about quantifier scope.

Emily: Is that true about description logics? Aren't they
quantifier-free?

oe: I believe so, no room to represent quantifier scope.

Dan: *most dogs bark* is something you can't express?

oe: Express is one thing, but in terms of inference…

Dan: Can I infer from *most dogs bark* that more than half the dogs
bark?

Francis: In DL, no, I believe.

Woodley: Isn't that the kind of meaning postulate you'd like to write?

Dan: Although &gt;50% is not a good paraphrase of *most* for
non-logicians.

Emily: If we map to a target object language, we can see what's lost,
but to experience 'pain', we have to have a task, else it's just
aesthetic pain.

oe: J. Bos gives the impression that he can do adequate NL semantics in
FOL. I don't expect that be to true, but can't say exactly where I'd
feel what he does is not adequate.

Woodley: I think you can describe the shape of an MRS in FOL, but what
you interpret it to mean… end up with predicates for dog that have a
possible world argument and a time argument; it's going to get hairy,
but probably possible.

Emily: Do you mean predicate logic with GQ, or do you really mean FOL?

Woodley: FOL.

Emily: And embedded clauses.

Woodley: I think they end up with some kind of possible world analysis.

Dan: *John knows that Mary sings*. What does John know in FOL
representation?

Woodley: He knows a fact.

Dan: *John denies that Mary sings.* Then there is no fact; have to have
a proposition.

Woodley: He denies the reification of that proposition.

Dan: Does that work? I'm skeptical. Turn propositions into objects (=
reify). And then *John tried to sing* =&gt; John attempted the act of
singing.

Woodley: A lot of like nominalization\_rel, but everywhere.

Dan: Relative clauses: *The dog that barks sings*

Woodley/Francis: That's just conjunction, not a problem.

Dan: *Dogs that bark sing*. How do you get the subset relation?

Woodley: For all (x) dog (x) and bark(e1, x) =&gt; sing(e2,x); or maybe
it's an existential. Might even be ambiguous. Relative clauses are not
the problem. More like scopal adverbs etc. that get interesting.

Dan: Isn't it the case that you have a limited set of primitive
arguments? What do you do about *The dog probably barks*?

Woodley: Reify the barking. It's not beautiful. The question is what do
you want to do with this?

Francis: Or modal operators.

Woodley: If you don't want to stay with FOL, can go to modal logic etc.
Not necessarily first-order that's the problem. It's not that what we
want to use can't exist, it just involves elements of lots of logics
developed separately.

Woodley: These are all logics that have research on them and that you
can reason over, in a way that you can't do for MRS.

Francis: In the Kyoto project I was in, people at the level above took
MRSs annotated with [WordNet](/WordNet) senses and put into Dolce
ontology (search application). Not sure which interpretresting things
couldn't be done, but some stuff could be done.

Emily: What's the point? Bringing a linguistic, broad-coverage
perspective to questions of natural language semantics.

Woodley: I don't know that we've done this. We haven't taken the
ERG/Redwoods and said here are these 15 things that are hard to do in
logic.

Emily: That's what the ESD project is about. Documenting what's there,
so we can ask later what's hard in any given object language.

oe: Motivates the distinction between description and object language,
because we have the freedom to use the description language to work with
to turn this all up, while the object language isn't a solved problem.

Woodley: Like building a house: need to figure out what rooms, etc
before laying the foundation.

oe: Can even leave open the question of whether that foundation has to
be build from concrete (logic) or something else (something functional).

Emily: Or reinforced concrete (logic++). Like: information structure,
connotation.

Dan: cynicism?

Emily: So have we answered the question?

Woodley: Provided some candidate answers, not all of which I was
expecting.

Dan: We're pretty sure that the people who do logic can help with the
really large question we're asking (how do people use language, anchor
it to the real world), but we're a pretty long way from what logic is
currently doing or able to do. Part of our endeavor is to clarify that
specification of work. More clearly articulate what the short-comings
are of the available platform for logic.

Francis: One possible way towards that is to try producing some logical
form and see what we lose.

Dan: Can probably make any of these platforms do rather more dancing
around than you might think. (Though it might be ugly.)

Woodley: MRS describes the relationship between what the grammar
produces and a particular object language. The object language of the
ERG is not FOL+reifications.

Emily: Not mappable.

Woodley: Mappable. The Copestake et al 2005 describes a process for
mapping to a particular object language. (Scope-resolved MRSs.)

Emily: You think the a scope-resolved MRS is a logical formula? That
might be true for those in the MRS paper (oe: maybe not even that) but
not at the schedule for the full ERG.

Dan: Underspecified MRS for *Almost but not every dog barks* doesn't
resolve to any known logical form, except if you have a predicate
almost-but-not-every

Emily: Not interpretable.

Woodley: No, but still a formula.

Emily: So that's not an interesting object language.

oe: Wait, I need some more terminology:

- UDMRS
- MRS
- scope-resolved MRS (SRMRS)
- object language

Woodley: SRMRS == OL?

Emily: Can you call it (an SRMRS) a logical formula if it doesn't have
an interpretation?

Woodley: My understanding is that the mapping to a fully resolved MRS
was meant to be a mapping to something that corresponds to an OL
formula, and if there isn't an interpretation of that formula, then
that's a flaw in the ERG (naively).

Emily: I'd say it's a flaw in logic.

Francis: (quotes from correspondence theory). If we don't have a
semantics for the object language (target language), is it an object
language?

Dan: SRMRS is an essential step to mapping to any OL.

Woodley: They can have names like almost-but-not-every-q.

Dan: No, not if you're going make me a OL robust enough to handle what
the ERG can describe, because these are open ended..

Woodley: You're making the assumption that FOL + GQ has a closed set of
quantifiers.

oe: There's a strong tradition of that.

Emily: Because they all need special treatment in the model theoretic
interpretation.

Dan: If we came to agreement about the terminology, what would it lead
us to?

Woodley: Quotes from MRS paper: MRS is not in itself a semantic theory
but can be most simply thought of as metalanguage for describing
structures in some object language.

Dan: for describing == can be used for.

Francis: MRS output gives us formally well-structured ?algebra/?formal
thing, but until we can link that to something interpretable just saying
is 'all' and 'but' and 'not' and 'every' and these are connected, it's
not the description of the world we're aiming at. It is the case that it
is a coherent consistent system of a description.

Dan: It provides some constraints on what we express.

Francis: I think we all agree that the straight output of a scope
resolved MRS is not the final target of what we're trying to do.

Woodley: I think it's an open question whether the right approach is to
translate that to something else that has an interpretation, or to
assign an interpretation directly to that.

oe: Then I would no longer hesitate to call them formulae.

Woodley: I always thought that was the long term goal, but it sounds
like what everyone else thinks it would be better to map to something to
that has interpretations already.

Dan: Speaking for the authors, that seemed like the smarter way to go,
to build on 2000 years of work.

Woodley: But that is still consistent with my interpretation of the
paper.

Dan: We never intended to do that interpretation ourselves. That was
never a design goal for the MRS, to produce something that would sustain
direct interpretation. That did give us license to be lazy, and to push
the interpretation off to someone else. We still do that, we glue things
together using the syntax of the language and hope that it can map to
something that is interpretable.

Emily: So to rephrase the earlier task: if we try to map to some object
language and find some things unmappable, flaw might be in the logic or
it might be in the ERG.

Dan: We may find that there's a better way, e.g., to deal with variable
arity.

Dan/oe: *He already ate.* if that means you have to say so in the
predication.

Emily: Do we need more input from outside (task-based)?

Woodley: Do you have a mechanism for taking sentence from Etchemendy
book and outputting one of their logical forms?

Dan: Yes.

Emily: For a very small subset.

Dan: Not perfect in the mapping from language to logic.

Emily: If what you want to say is things that logicians say about a
block world, it's possible to get from ERG to propositional logic.

Dan: Yes. And because there's a reasoner, can see if they're equivalent.

Francis: But *I put the block nearly but not quite on the stack.*

Emily/oe: What you can say about the block world is part of the block
world.

oe: Reading from the paper: goal is semantic *representations*. My
interpretation through the years has been that we don't know what the
object language will be, but that that shouldn't keep us from working on
the representations.

oe: 'the object language' is probably misleading here.

Emily: It's definite/non-specific.

Dan: It doesn't exist.

Woodley: There could be MRSs that describe sentences of FOL, there could
be MRSs that describe sentences of modal logic, of SQL etc.

oe: And all of these could be viewed as within 'predicate logic with
generalized quantifiers'

oe: predicate logic with GQ doesn't denote one language; it's a family
of candidate languages.

Francis: I think it's more important to talk about what we want to do,
rather than on what the authors of the paper meant.

oe: Harry Bunt started to work once on a model theoretic interpretation
of MRS.

Emily: What happened?

Dan: He retired.

Woodley: Summarizes 'the point':

- Facilitating applications like MT, search
- Maybe more surprisingly inform the logicians.

Emily: Not surprising: linguistic discovery has been part of the point
all along.

Woodley: Syntactic discoveries maybe more expected that input to
logicians.

Woodley: With that in mind, maybe can go back to some of these
questions.

oe: Paper ["Semantic underspecification and modifier attachment
ambiguities"](http://odur.let.rug.nl/egg/Papiere/dgfscl95.ps.gz) Egg and
Lebeth. Looks like they're attempting something similar to Dan/Woodley
discussions. Also a section on the interpretation of MRS.

Woodley: Ooh! lambdas!

\[ Reading that paper; Emily leaves room momentarily \]

Woodley: I approve of clean specs; I'm less concerned about the other
person.

Francis: I think it we do the second, we're more likely to come up with
something to people, then if we just try to come up with something
that's appealing to people. We've produced the most beautiful trees
known to man, but no one uses them because we haven't shown them how.

oe: I think the inform the logicians goal could be more foregrounded,
but we're a little short on tame logicians.

Dan: Tell me more?

oe: I think ESD could turn into something there. If we put together out
test suite with what we think are defensible representation, we could
approach peers and some of them could be logicians and solicit feedback
--- that second workshop in the series.

Dan: Not really talking to logicians.

oe: That depends on who we invite.

oe: To me, the what's the point question has been satisfactorily
answered.

Woodley: There are some good answers there, but it's not necessarily
complete.

Last update: 2014-02-16 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/TheAbbey_Chrysalis2014WhatsThePoint/_edit)]{% endraw %}