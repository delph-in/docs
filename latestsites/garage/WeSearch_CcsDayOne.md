{% raw %}NB: Rough notes; may not accurately represent either what happened or
what anyone thinks.

### Control/Calibration

Tim: Nice to start with AMR because to a certain extent it has the most
boring treatment of control. AMR has annotators mark all arguments that
seem to semantically fit, so there is no control in AMR. ARG0 of t goes
to they because the annotators think that the agent of voting is they.
There's no grammatical reason behind it.

Alex: It's the annotator that understands control.

Tim: Yeah. We have no theory of control essentially. The core thing with
AMR is it's purely what you think, on some underlying mental model, the
arguments exist. A weird thing is in a pro-drop language, if you have
control over something not mentioned in the sentence, there's no links
to the underspecified variable. Because there isn't one.

Emily: Can't they just add it?

Tim: The constraint is that they can't add things that aren't mentioned
in the sentence --- but 'what I want' could be 'the thing that I want.'

Ann: If you do 'forgot to vote' (pro-drop) then what?

Tim: For imperatives we add a you, but otherwise no. AMR hasn't been
applied to aggressively pro-drop languages---I would hope we extend this
in that case.

Alex: 'Someone close that door' it would be 'someone'.

Tim: Yes, that should be refined...

Tim: Each variable is a node in the graph, repeats are loops back.
Numbered arguments are linked up to [PropBank](/PropBank). ARG0 tends to
be agent, ARG1 theme, but you don't know without checking with the lex
sem resource.

Alex: If you're annotating with graphs, is the two ARGs going back to
the same node distinctive of control, or do you see that in other
constructions that we don't call control?

oe: I expect there are other instances of reentrancy in the graph. e.g.
relative clauses.

Alex: Or coordination.

Tim: Or nominalizations mentioned later on in the discourse.

Alex K.: Design decision that I find interesting is that each node
stands for one referent, and that includes coreference. You can get an
unbounded number of reentrancies/parents of that node.

Alex: What are the instructions for annotation for things like 'he' ---
sentence internal antecedents, are they to make one node?

Woodley: If the two coref elements are both def descriptions, then what?
Predicate info from both sides appears?

Tim: Redundant info is dropped. You can end up with 'Abrams barked and
then that wild animal ran down the street' --- get 'Abrams' and then
modified with wild and animal. This is a hack.

Ann: Syntax questions: The node labels are always in parens, and the n
is a separate node for Abrams? Why is Abrams an animal?

Tim: Somewhere there's an example where Abrams barked.

oe/Dan: \[History of Abrams/Browne/Chang/Devito\]

Tim: AMR does minimal named entity typing on all names, which out of
context gets ugly.

Ann: Not allowed to underspecify.

Tim: Within the ontology: Could have said 'a thing named Abrams'.

Dan: What's the inventory for role labels?

Tim: Discourse rels, :condition, :time; Names get numbered operators
:op1 etc because there's no clear semantic role between name and a
listing of the components of a name.

Alex K.: In coordination :op1 :op2.

oe: A complex name like 'Peter Abrams' would have :op1 :op2?

Tim: Right.

Alex K.: Can have as many as you need for a really long name.

Ann: Sense inventory?

Tim: For persuade-01 definitely, but for entities that don't have an
sense inventory, no.

Ann: So dog the verb yes, but not dog the noun? Adjectives.

Tim: Most adjectives are now in our inventory.

oe: Back to the data...

Tim: For easy, seem we don't mark anything else. It's just easy
modifying the dog bark.

Tim: *I have a plan to respond*: I am planning, I am responding.

Alex: So you're not representing an ambiguity then for *It is easy for
every dog to bark.*

Dan: In each case, we have all picked a reading and represent that
reading.

Alex: I can't see how this is expressive enough to get the other
reading.

Tim: What other reading?

Dan: *It's easier to bring your own lunch* (meaning it's easy for me.)
Need an exp role in that easiness.

Tim: Definitely not encoded here, but theoretically could be through
predicate sense distinction on easy.

oe: You accepted *I had a plan to respond.* as an instance of control.

Johan: It was a trick example.

oe: You would know best.

Alex K: What's tricky?

Johan: No verb, it's a noun that seems to be mediating the control.

Emily: I think you're overstating it to say that AMR has represented
this as control, since Tim said there's no distinctive representation
for control.

Tim: Right. The annotators just read it that way.

Tim: *Abrams left without paying* --- even here we have the reentrancy,
because one would assume it's Abrams who was\[n't\] paying.

Johan: Where does :polarity - fit in in that graph?

Tim: Just the whole variable is marked as negated.

Alex: I'm really confused now. Are these words labeling the nodes?
You've got them labeling the arcs.

Alex K.: Let me redraw your graph. We'll make big nodes so we can put
labels on them. Predicates label nodes, roles label arcs.

Emily: What does subevent mean?

Tim: The annotators use it relatively loosely, but in the larger leaving
event, the paying can be construed as part of that scheme.

Alex: Really? I wouldn't say that a lack of paying is part of leaving,
even though the state of being unpaid is still in pay.

Woodley: What about the unexpressed arguments --- left the restaurant
without paying the restaurant.

Tim: Repeated unexpressed arguments are not represented,

Ann: *Abrams left the restaurant without paying.*

Dan: *Abrams left the building without paying.*

Alex: They put the arcs in when pragmatics says its okay.

Tim: Right. In the restaurant case, they would link back for :arg1 of
paying-01, but not in the building case.

oe: I'm reminded that the ESD group discussed amongst ourselves whether
control is a semantic phenomenon. You may have found that some of the
phenomena we proposed to be syntactic rather than semantic. E.g.
'(Closed) Clausal Complements.'

Dick: You just try having those conversations with Ron Kaplan around.

oe: It's a shame he can't be here...

Johan: These are boxes generated by Boxer and hand-corrected in emacs.
There are three things you see in a DRS box: the variables for object,
relations between objects, and contexts (represented by boxes). Each box
you can also label (labels for contexts). On the left of + is
presupposed information, on the right is asserted information.

oe: So the plus does mean something like 'and'?

Johan: You could see it that way.

Alex: But at the discourse level, the thing on the left has a different
status/different processing. Not really 'and' which implies
commutativity.

Johan: I don't have context here. That's the only underspecified bit.
After years of underspecification, I don't believe in it anymore.

Alex: You spent too much time with Mark Steedman.

Alex K.: He believes in underspecification, he just doesn't know he
does.

Johan: I left out tense/aspect stuff. The only things that are
underspecified are the non-logical symbols. I assume some background
ontology that they come from (e.g. [WordNet](/WordNet)).

Johan: Neo-Davidsonian semantics, using objects for events.
[VerbNet](/VerbNet) roles (approximately). p1 is a particular world or
context that is labeled.

Alex: Would you get this for 'They forgot that they had voted.'? Well
no, because there are two theys there. You'd have an x1 thing and an x2
thing, which pragmatics would say they refer to the same thing. But not
from the C&C parser.

Johan: This is after resolving it.

Alex: No, you've still got to resolve they.

Johan: The most probable thing is that the two theys refer to the same
thing.

Alex: But you can't tell that syntactically --- I don't want that coming
out of the parser.

Johan: This isn't just the output of the parser.

Dan: Once you've done the resolution, *They forgot that they had voted*
could have this representation?

Johan: Yes.

Alex: What part of your system?

Johan: The anaphora resolution system.

Alex: Why have you got the + there at all?

Johan: Don't have the context.

Dick: *They forgot to vote* but *They forgot that they had voted.* ---
how do you get the difference?

Johan: This is a potential bug in the presupposition trigger. The
presuppositions that we do correspond to noun phrases.

Alex: It's controversial whether you call it a presupposition or not,
there's a piece of content about their intent to vote that projects out
like presuppositions do.

Dick: Lauri Karttunen on implicatures that covers this.

Alex: For *They forgot that they voted.* there's *that they voted* to
the left to the +. but not an intention to vote.

Johan: Not modeling this aspect of verbs yet.

Alex: But you are doing factives?

Johan: Yes, but it's very simple/it's a trick. thing(p1). Doesn't always
work.

Alex: I think all that should be outside the grammar.

Ann: There's a label on each box, but you haven't bothered to show all
of them.

Johan: Right. I always want to see what it really means, and have to
translate into logic to see that. Need to put p1 into agent(p1,e2,x1).

Silvie: What's p?

Johan: Mnemonics: events are e, entities x, propositions p.

oe: Word senses: *They forgot the story.* *They forgot that they vote.*
Are they the same senses?

Alex K.: Truth conditions/entailments/projections of implications
differ, so different senses.

Dick: That's assuming that those differences align with senses.

Alex: I'm not sure it's the same forgetting.

oe: Me either, but I don't know how to decide.

Dick: If you decide it's a different sense, what does that buy you?

Alex: It buys you a way to mapping out to additional content.

Dick: But you don't sense distinctions to do that.

Alexes: How? Are you going to show us?

Alex: How do you do presupposition projection?

Johan: Projective DRT. Every condition has a label, which are free
labels, so they can project out to different positions.

Silvie: Is the ambiguity you're talking about just in the
representation, or do you see it in the text?

Dick: That particular sentence is unambiguous, but *They forgot to
vote.*/*They forgot that they voted.*

Alex: It's two theys.

Dick: No --- whether there was voting or not. It's to do with *that*.

Silvie: Is this a problem of the representation?

Dick: Johan was saying you might want to put more info into this
representation. As it stands, you can't see whether there was voting or
not.

Alex: Are you assuming an architecture where all the info you need is in
the semantic representation so you don't have to go back to the
linguistic form?

Dick: Maybe we should wait until I show XFR. If you were shocked by
Johan giving up on underspecification, just wait. I don't care about
compositionality either.

Johan: Can distinguish between ...

oe: Let's agree that we're assuming perfect processing and/or manual
creation of gold standard representations.

oe: I note in passing that you do some named entity typing.

Alex: You've got some info-str going on here. That's great!

Johan: From CCG.

Johan: *It is easy for the dog to bark.* x1 corresponds to it.

Alex: Why not get rid of that entirely?

Johan: Non-compositional...

Alex: Not necessarily, just that CCG doesn't do a good job with
expletive it.

Johan: But that's not one of the phenomena for the meeting.

oe: You have states and events. Is that a deep distinction?

Johan: I'm still thinking about that.

Alex: At the pragmatics level, the topic is 'easy stuff', the theme is
dog barking, and that creates an alternative set and generate
implicatures...

Emily: It sounds like you're describing focus on topic.

Ann: Let's not do info-str.

Johan: Need to distinguish *John is tall* and *John was tall* so I need
a stative event variable to bear the tense (not shown here).

Dan: The chose of having the for role for the dog in the say state is
only one of the readings. *It's easier for the students to bring their
homework to my office.* --- probably not easier for the students. It's
easier for me.

Dan: Optional benefactive or whatever.

Johan: In my framework, would have 'easy' that is subcategorizing for a
'for' complement and one that not.

Dan: 'for' PP v. 'for' infinitival clause.

Johan: Have nouns in the lexicon that subcategorize for two complements
called 'control nouns' in my lexicon file. They are quite tricky. Who's
responding? I say that person (I) is responding. Again I don't have a
good theory about deictics --- all I can say about *I* is that it's a
person.

Alex: Did you edit that to get it?

Johan: Maybe a little bit.

Dan: For the 'to' role --- do you see that in *I plan to respond.*

Johan: You could call it theme or something. Non-logical symbols. I
could also put a number there.

Dan: By picking something different for nouns than verbs, you suggest
they are different.

Alex: Relational noun?

oe: Yes.

Johan: I think you're right it's better to make them the same

oe: \[Fixes gold standard then repairs the ascii art.\]

Johan: Without is interesting because of the polarity. No connection
between leaving event and the 'it's not the case that there's a paying
event', but maybe some connection.

Woodley: The same as *Abrams left and he didn't pay.*

Johan: Yes. I think that's a good paraphrase. But if he didn't pay last
week and he left today...

Dan: You are trying to interpret *without* into a logical operator
(negation).

Dan: *He left without his keys.* That's not negation.

Dick: It is. It's negation of with.

Dan: But you didn't put with in here...

Alex: Basically CCG has a gazillion entries for without. He's feeding
off of that and can wash it out when it's paying but not when it's keys.

Johan: I think you're right that there's something missing here about
the connection between the two.

oe: Embedding the pay context in the leave context is not enough?

Ann: That's not real subordination.

Dan: *Left while not paying* seems a little clearer that there's
subordination.

Johan: I could put a relation between e1 and e2.

Alex: Not inside the negation.

Dick: with(e1,e2)? in the e2 box?

Alex: Be careful about putting things inside that negation box. It would
be true if there was a paying event that lacked that relationship
between e1 and e2. That seems weird.

Woodley: Not to me.

Emily: Paid for drinks, had dinner, then left without paying?

Alex: Yes.

Emily: Not sure how that relates to the sentence anymore.

Dan: *John left without payment.* Then you just have a with --- where
does that show up? In the e2 box.

Dick: Can you go over why you think the truth conditions for that are
wrong again?

Alex: Can be true when x1 paid but the with relation is lost. But that's
not what *Abrams left without paying* means. There is no paying event.

Dick: Want some notion of a head assertion...

Alex: ... but DRT doesn't have that. You don't want this to be true in a
model where there's paying.

Woodley: This doesn't say that there's no paying, but that there's no
paying that x1 did associated with the leaving. The paying that's being
denied is x1s paying specifically with reference to leaving.

Johan: *Abrams left the restaurant without paying.* would get
coreference between theme of leave and theme of pay.

Emily: Really? This is after coref resolution?

Johan: No before. There's a structure for that involving a parasitic
gap.

Dick: But what about *Abrams left the restaurant without paying* meaning
paying me the money he owed me?

Johan: Okay, multiple structures.

Alex/Dan: *The dog arrived barking.* Do you want while(e1,e2) in one
box, or separate boxes? *The dog arrived not barking.* Negation is
evidence that you need another box.

Alex: For those kinds of free adjuncts, gotta have a discourse relation
not events.

Johan: While is temporal.

Alex: There's a whole bunch of discourse relations that impose a
temporal relation.

Johan: What would be the SDRT?

Alex: Background; subordinating.

Johan: Why were you interested in that example?

Dan: I was interested to know if you're going to put the reentrancy
there.

Ann: There's some example in Pollard & Sag that...

Dan: ...shows that the grammar doesn't require it. Would like to know if
there are context where you wouldn't force that reentrancy.

oe: *Fido chased Dumbo<sup>H</sup>HRover barking.* Would you still
expect to resolve it?

Ann: I think it's preferentially subject.

Dan: *I met my sister drunk.* It depends on whether you know my sister
or not.

Tim: AMR does the reentrancy. And it's got a :manner relation between
the instance of arriving and the instance of bark.

Alex K: Like Matthew Stone's question at ACL a few years ago. "What's an
every?" I like these pragmatic AMRs very much, but they don't answer
that question.

Silvie: Is it always :manner? What about 'Earthquake struck loc killing
more than N people' --- still manner?

Tim: No another label.

oe: Can you assume a hierarchy of these roles?

Tim: Like :manner drops tense.

oe: To go to a more general sense?

Tim: We don't really have a hierarchy for the relations.

oe: So you're not doing underspecification either...

Tim: We're having an annotator resolve things, so that's cheating.

Woodley: But you do have an ontology where person and animal are
subjects of thing.

Tim: Right.

Alex K: Can I make one remark about underspecification? I think that a
lot of people who think they don't do underspecification do do it, even
you (Dick) 10 years ago. But that's not the point I'm trying to make.
One thing I'd like to suggest for a topic of another session. We're
looking at just the representation and not the process that gets you
those. Underspecification is something that really belongs in the
syntax-semantics interface, so not surprising that you don't see it.
Even control, right, if you take a perfectly pragmatic perspective one
just one node w/multiple incoming edges---don't know if it's control
until you look at syntax.

oe: So what's the topic?

Alex K: Syntax-semantics interface.

Emily: I'm interested in a connected question about compositionality ---
not specifically how we're doing the composition, but what can/should
come from a grammar and what shouldn't?

Alex: Me too. AMR not interested in that boundary. They just want the
fully resolved thing at the end of the day.

Ann: Fully resolved with respect to what? There's always
underspecification with respect to...

Alex: What is it that a semantic representation discourse --- what
content? And I'm talking about the fully pragmatically resolved thing.
What do we want it to say? The cognitive effects on the interlocutor?
Probably not. For some people, yes it does. The way they do it in
dialogue systems...

oe: The topic is noted. We realize we come to these questions with
different assumptions about why we do it, and hope to understand better
those differences throughout the meeting---but also want to save time
for the specifics. And we've got three more representations to learn to
read before we can eat lunch.

Dan: Please disregard the variable property clutter in our
representation.

Dan: In *the dog arrived barking* we choose not to show the reentrancy.
Not assuming the functioning of any resolution component; just showing
(idealized) grammar output. Can't assume it's always controlled:
*There's a problem opening that window.*

Dan: One place where the ERS representation takes a slightly different
viewpoint that those we've seen so far is that we don't have a second
component in our pipeline.

Dan: We assume that every ref index has to get bound by a quantifier.
Have debated special casing pronouns and proper names. Probably do want
to do it for the former and not the latter and Alex goes hot and cold
from year to year on whether we can or can't.

Dan: Handle constraints allow underspecification of quantifier scope.
Not going to care about it today.

Alex: But for the Closed Clausal Complements...

Dan: You can see, once you've ignored all of that, that we're showing
the reentrancy for *They forgot to vote* because the grammar tells us.
But there's also another sense of *forget* that is simple intransitive:
*They forgot in order to vote.*

Alex K: *They forgot that they voted.* -- same, except for two different
theys.

Alex: So you have in this MRS lost the info that you need to infer
whether they voted or not.

Dan: That depends on whether I make a sense distinction between those
two entries for forget. Not sure what I actually do.

Emily: Remember that this is idealized grammar output...

Dan: Now that I've noticed that I want to remember that, yes, my
idealized grammar output would have a different sense of forget here.

Ann: We actually identified this case in Tomar in July.

Woodley: *They forgot that they voted.* do have that tense info, so we
can still distinguish them.

Dan: Would want to look across more predicates to see if this is a
cross-lexical generalization.

Dick: Probably not.

Ann: It's not that we couldn't recover this, and for each lex entry, but
we'd be writing lots and lots of specific rules. This is a case where
you definitely want two senses.

Silvie: If I understood the documentation,you have relatively few
syntactic and lexical rules. But you must have a very big lexicon? This
forget: is it a lexical entry or a rule?

Dan: This forget is the semantic predicate introduced by the lexical
entry that takes an infinitival complement.

Silvie: This resolution of the agent of vote?

Dan: Done in the lexical entry for *forget*.

oe: Should be obvious by now that this is an underspecification of a
logical form, neo-Davidsonian, with entities, eventualities, and the
ability to embed something like propositions.

Silvie: Relationship to Richard Hudson's Word Grammar?

Dan: It's very different. There's a similar expectation that one can do
a lot in the lexicon. But he's not very interested in the syntax part of
it.

Silvie: Is the lexicon introspection or data-driven?

Dan: By now both. Originally built introspectively, but as we wade
through Wikipedia, the WSJ etc, I often find new entries to add and
occasionally new types to add. No longer trying to put in the boring
ones (common nouns, transitive verbs, etc aren't in the hand-built
lexicon).

oe: An additional recommendation for reading these. For today we're not
very concerned with quantifier scope. \_q are quantifiers and can
probably be ignored today.

Ann: There is a non-lossy conversion into a graph structure and for this
example it's the same as AMR if you collapse pronoun and pronoun\_q into
a single nodes.

Alex K: Except the x5 is unlabeled --- no entity type labeling.

Johan: I'm pretty sure you can also translate that into an DRS. The only
difference is that you use Davidsonian, I do neo-Davidsonian.

Ann: RMRS is a neo-Davidsonian version which we can translate to.

oe: Right, I misspoke it's actually Davidsonian.

Johan: Ann claimed that you can covert into AMR, but the AMRs don't have
scope.

Ann: I claimed that there's an isomorphism for this example.

Johan: I'm interested in the differences. Do the nodes mean the same
thing there?

Ann: The nodes are the same, but the links are not. I always work with
the graph representation these days. In the graph representation, you
have a link between forget and vote, but the type of the link is a qeq
link which tells you can do the quantifier scope there. It's the nature
of the links where the interesting stuff about the scope comes in.

Johan: Why don't you identify across the qeqs?

Dan: We could do cheap scope but the print out might not be as pretty.

oe: That would take more than 10 seconds...

Dan: More generally, just thinking about the presentation.

Ann: Yes and no. The fact that those links are like they are and the
fact that the scope is underspecified might make the isomorphism clearer
to other representations. If we scope, we might get a quantifier between
forget and vote that would make the comparison with AMR less clear.
*They forgot that everyone voted.* with every scoped low, then you lose
the simple isomorphism.

Dan: To keep that clarity, we'd have to pull the quantifiers to the top,
which isn't necessarily the reading we want.

Alex: There's a scope resolved version where the quantifiers are all at
the top and then a subgraph would be isomorphic to...

Ann: Not always possible to put the quantifiers all to the top.

Johan: There's a reason the equations are still there, and not unified.

Ann: That's what comes out compositionality. But there's a deeper reason
too. Because I've got a standard relationship between *forget* and
*vote* easier to work with downstream, since there's some complicated
cases where you can't resolve.

Dan: *It's easy for the dog to bark.* -- the reading is the one where
the dog is the experiencer of easy, but there's probably another reading
where the experiencer is separate.

oe: In *It's easy for the cat for the dog to bark.* there's no control.
The syntactic linking is still interesting, but the argument sharing
isn't there.

Alex: Isn't *plan* like that too?

Dan: *I had a plan to respond.* we don't bind that argument of the agent
of responding, even though I agree that's a natural interpretation of
this example in context.

Johan: So are you happy with that or not?

Dan: I don't have a clear picture of what the next module downstream
would be---I'd love to have one. But I remain content with the notion
that the grammar itself is not doing this.

Johan: But for the control verbs you're doing it...

Dan: Yeah. In every instance where those show up, those are uniform.

oe: We should maybe acknowledge there is some internal discussion here
about whether there is any variation in the interpretation of this
construction. If there isn't: then we'd have to ask if we could build
the grammar that way.

Dan: But *The problem was the plan to respond.*

Emily/Alex: The control, if there is any is whether the planner and the
responder are the same.

Dan: *I didn't have a plan to respond.* ---

Ann: *There wasn't a plan to respond.*

Ann: *I had a plan* --- it could be someone else's plan.

Alex: plan has a planner which may be instantiated or not (may not exist
if there's no plan). The lexical semantics of plan would be okay to put
in an argument there for the agent doing the planning, and if you've got
that agent from other constructions somehow.

Dick: *I plan to respond* --- control verb that links planner to
responder. Here it's the nominal. There's an implied subject for the
planning, which is who's going to do the responding. But we don't know
if that's the I. That's a resolution step.

Alex: Exactly. Your argument structure for the noun plan is not
complete.

oe: We do have plan as a relational noun with the responding as its
argument, but our ARGns are not proto-roles.

Dan: *John('s) planning to respond.* *John's plan to respond.* You're
suggesting that the noun plan should have a nominalization
representation.

oe: That's coming up in the phenomena...

Ann: This is a resultative noun that could be a piece of paper, but
because you've got the 'to' you'd assuming this is a deverbal noun.
There's often at least a two-way ambiguity between the physical object
(resultative) and the activity of the planning. Grimshaw splits the
activity into two senses. I believe it's the case that if you have that
infinitival there you'll get the non-physical object type.

Dan: There we do have enough fine-grained lexical control that we have a
place to encode whatever the right answer is to that. But you'll see
that we have not taken that courageous step done in AMR exposing the
verb 'inside' the nominalized forms.

oe: I think we've kind of agreed that the deverbal plan would be open to
a control relation between the understood agent and the complement. Then
one could ask when it is the complement of certain kinds of verbs, does
that build a transitive control relation: *I made a plan.*

Dan: But *I made a plan for you to respond.*

oe: That would be a different *make*... \[potentially very expensive\].

Woodley: You have to open the possibility that when the for is there
it's a different plan (cf. easy).

Dan: *without paying* --- again sometimes the VP modifiee doesn't have
an available antecedent so we don't make the link in the grammar.

Dan: \_without\_p -- no negation predication. Would have to be
inference/reasoning/lexical semantics later.

oe: that's the same \_without\_p as in *I left without my suitcase.*

Alex: Do you lose any scope ambiguities when you do that nominalization?

Ann: There's nothing to stop the quantifiers skipping over the
nominalization.

Dan: subord links the two propositions. No nominalization. Again no
binding because there uses of the depictive where there's no controller
available.

Silvie: Our representation is a "deep syntax" representation; it was
never announced as a semantic representation. Focus on the right-most
graph, the tectogrammatical representation. *They forgot to vote* --- we
have a valency lexicon for verbs and certain nouns. This English
representation is a adaptation of the Czech one which has a richer
lexicon and is more elaborate. Each entry has senses which are actually
argument structure frames. The annotator has to assign the best matching
valency frame for each occurrence of the verb. The graph itself has to
contain all arguments that are prescribed by the lexicon. When not there
explicitly, we have to insert them. We have different kinds of
insertions. \#cor node means there is an agent prohibited from occurring
on the surface for grammatical reasons, but we know that it exists.

oe: So \#cor means 'control'.

Silvie: We use it for several more things: relative clauses *The car
that was stolen yesterday.*

oe: So grammatically controlled argument sharing.

Silvie: Yeah.

Ann: So these are always trees, plus those links.

Silvie: Yeah.

oe: The square means...

Silvie: This is a generated node. And \# means this is something
artificial; not anchored in a word.

oe: But they is \#[PersPron](/PersPron)

Silvie: We abstract number and person.

Ann/oe: Like our grammar preds.

Johan: Would you have a different arrow if it was *everyone forgot to
vote.*?

Silvie: No, it would be the same.

Johan: You don't want it to mean *everyone forgot that everyone voted.*
For those things control is really about the semantic variables, not the
surface things.

Alex K: You could interpret these coref links as meaning the same
semantic variable.

Silvie: We don't think about it. This is a more abstract surface syntax.
It's affected by the lexical semantics, but there are no rules for that.
It's what the annotators do when they understand a sentence, but we
don't encode how we understand it.

Johan: You could define rules on these graphs.

Silvie: The idea was to facilitate transfer in transfer-based MT.
There's no formal logic behind it.

oe: What would *They forgot that they voted.* look like? It would have
the same graph topology, but the node for the second they wouldn't be a
generated node.

Silvie: And the arrow would be a different color meaning it's textual
coreference (blue). We have a green one as well for depictives.

Silvie: For adjectives like easy the benefactive argument is part of the
frame and has to be added as a node even if it's not overt.

Alex: And even for *It is easy to bark.*?

Silvie: Yes, for someone it's easy and they're barking.

Silvie: There was some discussion of where to put the expletive 'it',
and put it under the 'be' node.

oe: Johan had be-easy, AMR had nothing for the be, we (ERS) have nothing
for this be; do you always have a be?

Silvie: Yes.

Dan: For *The dog is barking.* do you have a be and a bark?

Silvie: No, because that's a function word. But whenever you take the
-ing form to be an adjective, we have a be node.

Silvie: *I had a plan to respond.* *plan* is a relational noun, with
just a PAT argument which is obligatory.

Emily/Alex: So with *I had a plan* do you get a generated node for the
PAT?

Silvie: It would be that way if we had the lexicon to support it. But
the only process nouns in Czech are derived, and since English -ing are
usually verbs, we don't that.

oe: So are AGT/PAT proto-roles like in AMR or more like ERS ARG1 and
ARG2?

Silvie: There is a valency theory dating back to the 1960s. According to
the professor who developed it: they are semantic labels and all verbs
should have ACT and PAT so you have to shift the labels if there's a
verb that supposed to have something else. Makes everyone unhappy, but
that's the way the theory was developed. In the nouns it's impractical
to say the first argument always has to be ACT, so we got a variance
approved.

Dan: *The plan of the committee to respond.* committee could be the
agent role right?

Silvie: With nouns we've gone more semantic that the theory prescribes.

Silvie: We don't have an artificial actor in *plan* because we are lazy
to do that. In this context, I thought it's clear that the responder is
*I*, so we over-interpret it compared to you, by considering the
context.

oe: Would you reconsider that decision in light of Dan's examples?

Silvie: I think we are inconsistent here; there are contexts where this
is not a grammar thing.

Alex K: So maybe the arrow shouldn't be red?

Silvie: The arrow could be blue and there should be a personal pronoun
there.

Silvie: *Abrams left without paying* three prescribed/artificial
arguments for *pay*.

Alex: What is without doing there?

Silvie: That's the hidden preposition --- without is a function word.

Alex: So the ACMP is nothing to do with *without*

Silvie: This means it was an accompanying event. ACMP is *with* or
*without*. There is a sublabel not visualized here that distinguishes
these two.

Dan: In *Abrams left the restaurant without paying.* do you link ADDR of
pay to restaurant?

Silvie: That would have been too far-fetched. We aren't allowed to do
that.

Silvie: *The dog arrived barking.* COMPL is specific to depictives. Here
the dog is linked to ACT of barking. If the barking was complementing a
noun we would have had (another) arrow. We discussed whether the agent
of barking should be the dog, but the counterexamples are so rare we
decided this is grammatical coreference.

oe: So in *Fido chased Rover barking* is there a \#cor link?

Silvie: We would have to choose one from context.

Dan: Still a red arrow?

Silvie: Yes.

Alex: So you're saying that the grammar should produce two
representations, one with a red arrow to each.

Silvie: Yes.

### Lunch

### Control/Calibration (cont)

Dick: I actually cheated on this in that these are the results through a
system, reformatted a bit to increase readability (you should have seen
them before; lots of info about e.g. word senses taken out) and there's
just one case where I felt inclined to add info that wasn't there. (The
*plan to respond* case.)

Dick: Imagine that these are Johan's boxes. These representations assume
that intensionality is really important in NL semantics. *They forgot to
vote* --- two contexts. The top level, true context and then what they
forget is in the embedded context. There's been some lex semantics
pulled in making use of Lauri, Cleo & Rohan's list of factive and
implicative verbs. Forget subcategorizing for to puts in the verdicality
statements (anti-veridical).

Dick: There is no instance (has an empty extent) in the top-level
context. *They forgot that they vote* veridicality would continue to be
positive. Should we be just looking at the output of the grammar, or
what other processes are we bringing in? I interpreted this task as the
kind of processing you need to do to get something you can actually work
with; not just tying your hands behind your back and working with just
what the grammar gives you.

Dan: You're still sticking with stuff you can build a machine to do,
right? Still pretty close to the ground.

Dick: Yes, absolutely.

Emily: 101?

Dick: vote\_16\_101: position 16, sense 101.

Ann: Character position? We have that too.

Dick: Yes.

Alex: The projection is discourse context dependent. Does that positive
really mean positive, or just "I might project, depending..."

Dick: Again think of the DRS boxes ... previous sentences may have set
up the context. Taking this as the top without any prior context. But if
you take it and embed it below other stuff, then that depends on how the
projection works in those contexts.

Alex: Does Lauri does the finite state projection stuff beyond the
sentence level?

Dick: I don't think so, but in principle, it could work that way. It
doesn't matter what sentence the verb comes from.

Alex: But it's not always individual words that trigger...

Dick: Trying to have your cake and eat it to wrt to thematic roles, with
some notion of a role hierarchy. 'E' is for 'effector' kind of like
agent. I almost always ignore this and go with semantic subject/object
or A1. Lexical look-up for alternations like *break* to rename roles.
The role names are meant to carry no import across verbs. Should have
just suppressed that from the display.

Dick: These examples were run off the XLE, but the system is set up to
be grammar/parser neutral. Can infer stuff from even the much less
informative CLEAR parser, given a lexicon with info about control
relations. Ron Kaplan insists that that info is syntactic, and any
grammar that doesn't do that is deficient. I say it could equally well
be semantic, smuggled in past parsing.

oe: So you're happy to work with a deficient parser.

Dick: As most people have to do.

Dick: If you take the current crop of machine learned parses, the notion
of compositional rule-to-rule interpretation---don't know what the rules
are, what the lexicon is. Would like to have the outputs of those
parsers to at least have the possibility of enjoying a decent semantics.
Have to find alternatives to rule-to-rule compositionality. The hacky
way this interpretation is done turns out to be good for working with
these parsers.

Alex K: If you had say an AMR bank, and you run your machine-learned
parser you could learn a compositional mapping from parser outputs.

Alex: Not necessarily compositional.

Dick: That depends on what you're trying to learn.

Alex: If you're not doing a global decoding then because of the AMR
annotation instructions you could have the same sentence in different
contexts resolve to different things. If you attempt to do it
compositionally, you'll just pick the most frequent ones.

Alex K: Then I don't know that I buy this point.

Alex K: A more detailed questions. in\_context() --- is that possible
worlds?

Dick: Yes, something like possible worlds. The one wrinkle that doesn't
make too much difference here. Usually you assume these terms are
referring to individuals, but here they refer to concepts or
descriptions. vote does not refer to some arbitrary voting event ---
rather some arbitrary subconcept of the concept of a voting event. The
verdicality relations show what claims about the concepts having empty
or non-empty denotations. At no point does it ever go in and pick out
particular individuals. Pulling from description logics to work at
terminological and conceptual level. There are no individuals, but
rather lumps of stuff described in different ways.

Alex: If you had full-blown lambda calculus, the vote thing would be the
lambda term?

Dick: Yes. Actually denoting something like lambda(x) vote(x) with maybe
some other arbitrary modifiers to restrict its range. Gets you out of
nasty problems with quantifying in to ?modal contexts.

Alex K: in t context they is plural, and they is also accessible in the
other context. Is that plural info also available there?

Dick: Cardinality is a role restriction in a description (not very
informative, maybe they is person) and just making sure this doesn't
refer to subconcepts picking out individual people. The concepts remain
absolutely constant across all the contexts. The only thing that differs
is whether their denotation is empty/non-empty. Gets around problems
with talking about the same individual across modal contexts.

Alex K: The plurality is veridical in that top guy.

Dick: Right. *They forgot to vote.* There's a forgetting situation of a
particular type, and so the denotation of 'they' is not empty.

Dan: Implicit veridicality? Like of the voting within the embedded
context?

Dick: Yes --- it's the ones at the top level that we're most interested
in.

Johan: What do you mean pushing up to the top level. What about *They
didn't forget to vote*?

Dick: Interactions between *forget* and *not* that will flip things
around. That inference is part of building the semantic representation,
because I'm trying to produce something that's useful to other people.

Johan: What will you see in the end? Only the inferences, or the steps
along the way?

Dicks: The steps along the way --- they get expanded. Though the
veridicality can flipped.

Johan: So that's the non-compositional bit.

Woodley: *They didn't forget to vote ... they just decided not to.*

Alex: Back to what I was talking about about bits of content projecting
out or not, depending on the rest of the context. p doesn't mean true,
it just means possibly true. 'Go work it out.'

Dick: So part of this is a particular calculus to do that. There's no
reason why inferences from other sources can't come in and make you do
something different. It really is non-compositional, and I think that's
a huge benefit.

Alex: You kind of implied earlier about speaker commitment. But with
these ps it's like a defeasible inference about what they're committed
to, which may or may not survive other cues.

Dick: Let's just make sure we're talking about speaker commitment, not
speaker belief.

Alex: Agreed.

Dick: Persuade the same, but different projection.

oe: Control again is there because the grammar knows about it.

Dick: *easy*: a = averidical.

Emily: So this is neo-Davidsonian too?

Dick: Yes.

Alex: In description logic, the difference between neo-Davidsonian and
Davidsonian isn't so big.

oe: So contexts are Davidsonian events?

Dick: No. I always take the liberty of simplifying things. An
interesting question --- whenever you see something which carries tense,
does it introduce a context, even those are mostly veridical. Copula
constructions: John is old/John was old. There is tense marking, but
don't want an event or state variable. Be isn't introducing a concept,
but the tense is giving you a context, and you can hang the temporal
reference on the context. You can regard the context as being world-time
pairs.

Emily: Do you want an 'old' state?

Dick: *John is old* just has a context with John in it and *old* is a
restriction of John.

Emily: So what corresponds to the events if anything?

Dick: The bark concept here.

Dan: But you don't want to have states?

Dick: I don't really talk about events and states. You have certain
words that introduce concepts and there will be features of those
concepts, some are event like, some are state like.

Dan: I got the impression you're drawing a sharp distinction between
*The dog is sleeping* and *The dog is sleepy* --- a big difference
between adjectives and verbs. Does that seem right to you?

Dick: Yeah. Doesn't mean you can't have derivational relations between
them.

Dan: Not associating past property with the state sleepy but with the
activity sleeping?

Dick: Temporal references associated with contexts, not with the
events/concepts into the context. But I've been simplifying for people
to push that down onto the events.

Ann: Think of this as messages with the tense on the messages. Then the
question comes with *the sleeping dog*: where do you stop?

Dick: And one of the issues that comes up with relative clauses is which
way around does the restriction go? The system currently gives a weird
inversion to get the restriction right? Again you want to let context to
be part of it.

Alex: Not purely a matter of linguistic form to work out the temporal
relations there.

Ann: If you're going to say that verbs are somehow very different from
adjectives, but you've got *sleeping* which can behave more verby or
more adjectivey.

oe: *Sleepy* isn't maybe the best example just now...

oe: ... I was going to suggest maybe *asleep* as a closer match?

Emily: *The dog is asleep and that surprised me.* v. *I was surprised by
the sleeping dog.* there is an assertion of the dog being asleep in the
first one and a ?presupposition of it in the other, and that seems to
get washed out in this representation.

Dick: Yes.

Johan: \[...\]

Dick: The difference to DRT is that these are all descriptions, never
pointing to individuals. And that has follow-on effects not all of which
I can see yet. *The man was asleep.* ... don't have to care who it is.

Alex: But in subsequent discourse you can refer to that man with a
pronoun.

Dick: You can refer to the concept.

Ann: I talk about this as referring to linguistic individuals instead of
real-world individuals. There's lots of reasons you don't want to go
directly to real-world referents.

Dick: *I had a plan to respond.* Here's the one thing I added in,
because this is resolution, not control.

    null_pronoun_res(null_pro_9_104,i_1_104)

Dick: There's a relationship between the verb and noun lexical entries
such that the noun can inherit info from the verb.

Dan/Alex: What's the relationship between plan\_v\_104 and
plan\_v\_9\_104?

Dick: One is the planning process and one is the output of that process.

Emily: And they're both salient here?

Dick: Yes. We're talking about both of them. Both get this control
structure.

Alex: All in the same context, right?

Dick: Yes.

Dick: The null\_pronoun\_res statement indicates probable coreference;
never replace/rewrite, just add this statement. Done by hand here to
show how it could be dealt with.

Emily: Is there anything in this representation that relates
plan\_v\_104 to plan\_v\_9\_104?

Dick: There should be.

oe: derived\_word\_form(plan\_v\_9\_104,plan)?

Dick: Yes, maybe that was it.

Emily: That doesn't look very semantic.

Alex: All out of any context?

Dick: Yes, because these are just redefining the contexts, in the
contexts, it's just about whether there's anything in the denotation.
Cleo and others were working towards separating those out.

Emily: So the only thing that was added by hand was the null pronoun
resolution, and the rest came out of general rules somehow?

Dick: Yes.

Alex: Is that productive?

Dick: There are patterns, but there's definitely specific lexical
knowledge that needs to be collected.

Dick: *without*: My lexical entry doesn't have negation in it, but it
should.

Dick: *arrived barking*: Treated as control, but should be resolution.

Emily: Is that negated context a veridicality statement or a context
statement?

Dick: A context statement with veridicality consequences.

### High Level Goals

oe: We've heard so far: "Underspecification is out." "Compositionality
is overrated."

Ann: We could just stop now and then enjoy Berlin...

Emily: I'm interested in what people are hoping to get out of this
meaning. Johan, you mentioned being interested in finding the
differences.

Johan: Was it in Dublin? One thing we can't do very well is evaluate
meaning representations. How different are they actually? Can we map
them into a format that everyone will be happy with?

Dick: You mean a form that everybody will be equally unhappy with ...
equally.

oe: Didn't you say in Dublin that you don't think that's a worthy goal.

Johan: Right --- not a good way to evaluate meaning representation, but
we can learn about the differences.

Alex K: Maybe control was too simple. What's a thing that people are
actually disagreeing about, more concrete than compositionality?

Johan: Phenomena where you really have to make a choice in the
granularity of the analysis. Comparatives, or even adjectives in general
--- large(x) v. talking about size.

Dan: Probably also in nominalization.

Ann: Are we going to find disagreement in terms of what we would
actually want to do v. what we're actually doing, because we make the
cut in different places in terms of what we're attempting to do.
Differences in what we want to do are more interesting.

Ann: I've decided I don't want to do control for plan, and I only
decided that this morning, but that can come in the nominalization
discussion.

Alex K: If we can look at such disagreements, it would be interesting to
see what you would need to map one to the other. Differences in
granularity, maybe pulling in resources from the other guy...

Alex: I thought we were getting to a point of disagreement with Dick's
*sleepy* and *old* --- and that's a want disagreement.

Dan: If we can agree that we're looking to be able to understand whether
two analyses in different notations are making the same claims or
different claims we can keep that as a bg process and point it out when
we see difference or congruence.

Alex: I don't care about that. What I want out of the semantic form of
sentences is enough content so that I can do something with it at the
discourse level so as to construct multi-sentence discourse without
going back to linguistic form. Differences about e.g.
(neo-)Davidsonian... I don't care, can work with either.

Dan: Those differences are going to multiply out. If you're trying to
work with multiple sources to get their strengths, wouldn't it be nice
if those differences should be washed out.

Ann: You should be telling us whether we're giving you the info you need
or not. E.g. discussion about trying to do discourse stuff with Stanford
dependencies it was clear that if you can't distinguish between *Many
white cats are deaf* and *Many deaf cats are white* then you can't work
with that representation.

Alex: One thing that really matters is the relative scope of
propositions introduced by even sub-sentential phrases. Dick is doing
that with the veridicality stuff. MRS doesn't. But I'm hoping it would
be possible to break up the MRS into the relevant propositional bits and
mark them with a tendency to project or not.

Ann: I don't see any difficulty in doing that, but you need to tell us I
definitely want this. Because there are probably things we're spending a
lot of time doing that you don't actually care about.

oe: Your perspective is as a consumer working on discourse-level
processing. Are these representations enough --- encoding enough info?
--- and are they normalizing to the extent that I expect.

oe: My personal motivation is to understand better the procedures used
to choose between the many candidate analyses that could be pursued. I
think we agree to put aside the notational differences and try to
abstract from those.

Alex: There are standard tests in semantics to test whether one thing
means the same as another. You test whether they contribute the same
stuff to valid arguments.

Emily: Is that test flexible enough for the asleep dog examples?

Alex: There are other tests, including how you can continue the
discourse. Things are not going on just in the actual world. Sentences
change the context in which you say stuff. Paraphrase means 'means the
same thing in the actual world' but that doesn't mean you can continue
the discourse in the same way.

Partee's example:

*One of the balls is not in the bag. It's under the sofa.* *9 of the ten
balls are in the bag. \#It's under the sofa.*

The first two are true in the same cases, but they don't set up the same
discourse possibility.

Johan: Agree, but it doesn't help us too much here.

Alex: Formal semanticists are really bad at reaching consensus about the
details of the tests.

Alex K: We pretend that we can have universal semantic representations
that are equally good across tasks. QA systems might not care about that
discourse effect if you have to answer questions like "How many balls
are in the bag?"

Alex: Any system where you have to resolve pronouns you're going to care
about it.

Alex K: But in 95% of cases you don't crash so bad...

Alex: I though we were talking about what we want.

Alex K: Perfectly fine for different representation systems to come to
different conclusions because they are motivated by different
considerations. One possible motivation is support for discourse-level
reasoning, but there are other things that one could want. It would be
very interesting if we found differences between the representations
approaches that follow from different goals.

Alex: Take MRS and the output of the ERG. I see no reason you'd need
veridicality in transfer-based MT. If you're building a dialogue system,
you damn well do.

Dan: I think you're just wrong about MT. It's clear you can't do
phrase-by-phrase translation. You have to paraphrase and then you have
to know the right veridicality information.

Ann: Things to get out of the way about motivations: I think that there
are interesting things to do by looking at the semantic representation
that can come out of the grammar and just that, because it's an
interesting fact about language and cross-linguistically. There are
things about MRS that follow from that, e.g. not resolving pronouns even
in the cases where there's a reflexive. That to a certain extent comes
from the fact that if you don't do that you can say something
interesting things about the syntax-semantics interface. Not something
we're necessarily all trying to do, but there may be some things like
that that are part of a program of research and not there because of
end-users.

Alex K: This is a big difference between MRS/other compositional
representations and AMR bank. I find it striking out unaware people
outside of this room are of this distinction. JHU in Prague workshop
people talking about building a grammar formalism that does grammatical
coreference and anaphoric coreference at the same time. I feel like we
have a pedagogical mission.

oe: Related to distinction of how much is grammaticized, but not the
same distinction. I had suggested to try to identify subtasks in
semantic analysis: predicate-argument structure, sense disambiguation,
named entity classification, resolving scope ambiguities, and
coreference resolution). AMR tries to do them all in one representation
\[EMB: except scope\], Johan has different components... Do we agree on
such an inventory of subtasks? Which are missing?

Alex: Would add: information about the speech act. There's information
about the other things you're talking about that relies on speech act.
Can't recognize one without recognizing the other.

Ann: Be more specific about speech acts?

Alex: Discourse relations. How what I'm doing now relates to the
discourse as it develops.

oe: Is that part of the semantics of a sentence?

Alex: No, but you're going to have leave some stuff unresolved within a
sentence until you know what it's speech act is.

oe: Not a subtask, but an argument for underspecification?

Alex: Yes. When you take a sentence in isolation, given the default that
it's initial to its own discourse. *John knows Bill is a fool.* its
meaning is "Bill if a fool and John knows it" but in another context
that's not the relative scope. The scope of know v. is a fool depends on
what the speaker was trying to do.

Emily: Would you say that the grammar sometimes tells you something
about the speech act possibilities, like statement like question?

Alex: Those are just the surface acts. For all the interesting
relations, they can be statement or questions. *John went to the store.
He bought an apple.* *Did John go to the store? Did he buy an apply?* In
both cases we infer that the buying was at the store, because the
coherence relations are the same in both narratives. What coherence
relations do to the truth conditions of the thing as the whole is the
same when they are operating on both assertions and questions. Context
update is just a bit difference: assertions eliminate possibilities from
input contexts; questions partition things.

Emily: Is there never anything in the grammar that does this?

Alex: Cue phrases. Pretty hard not to infer explanation from *because*,
but what is an explanation of what is not constrained by the grammar.
Could go beyond the sentence grammar. If it's *A because B* then it's
got to outscope A. If it's sentence-initial because it's anaphoric.

Emily: So the grammar can tell you that.

Alex: Yes and I want you to, so I don't have to go back and look at the
string and say "This *because* is used 'sentence-initially'..."

Ann: Because has two arguments or one argument?

Alex: Explanation has two arguments; do what you like with because.

Ann: So *Because I said so.* has one argument linked in the sentence and
one underspecified, and that's not good enough?

Alex: No that's good enough.

Johan: Why don't you want *explanation* already in the MRS?

Alex: Put it in the MRS, but don't tell me what it's arguments are. Put
constraints on them, but don't fully resolve.

Johan: Maybe you should tell the MRS people what they are?

Alex: No, because inference is always defeasible, unlike in a grammar
where we hope that everything is always monotonic and behaves well. In
discourse you're always jumping to conclusion on the basis of partial
information and then revising later.

Dan: Do we mostly agree about monotonicity? Dick---I like to preserve
what I can in pronominal reference.

Dick: I think being reluctant to throw info away is not the same as
monotonically accumulating information.

Dan: Draw the distinction?

Dick: Monotonically accumulating means that something you put in never
subsequently becomes false.

Dan: ...

Dick: The assumption that what counts as being a semantic representation
isn't actually going to be augmented by subsequent discourse processing
and what goes in there may actually dictate paths you take in the
semantic analysis of the sentence. Assumption of tightly pipelined
processing. Can you pass any info from discourse processing back into
the semantics? I would want to be sure that you can't before committing
myself to an architecture that prevents it.

Dan: We have imperfect strategies for disambiguation, and can need to go
back and re-select the analysis.

Dick: Difference between making use of domain info to flesh out a
representation v. generate-and-test approach to making the
representations.

Alex: You're presenting this like it's a dichotomy, but in SDRT we've
got both going on. Monotonic accumulation of constraints even at the
discourse level. The definition of update is monotonic, but when you
want to solve those constraints, but the solution you get may not
persist when new evidence comes in, but the constraints are just added.
Set of constraints =&gt; set of solutions; defeasible bit is in the
ranking of those solutions.

Dick: Concrete example. Working on conversational interface for TV. One
thing that has caused immense confusion is *I want a movie tonight.*
Where does the *tonight* attach? *a movie tonight*? *want it tonight*? I
actually want it now. In this domain *I want N* is *I want some action
on the N*, where the domain model helps figure out which actions are
applicable. The temporal modifier attaches to the implicit action. Can
have the semantics just put in a place-holder underspecified action, but
I'm willing to bet that there will be other examples where integrating
sentence into discourse model and domain will lead to restructuring the
analysis. That's the kind of issue I'm concerned about. Worried about
working without spelling out the backward path for bringing info back in
within the same sentence.

Alex: The problems you get at the discourse level also show up at the
sub-sentential level. With coordination as well, sometimes you've gotta
resolve it with coordinated VPs.

Emily: I'm not convinced we can't get around this with
underspecification.

Dan: You don't even need the underspecified action if *tonight* is
interpreted as *for tonight*.

Emily: But the original example wasn't with *for*.

Dan: I'm just saying that *tonight* puts in an underspecified two-place
relation.

Ann: There's some grammaticization going on here. *I saw him Tuesday* is
good in AmE and not BrE so we have that underspecified preposition.
There's some grammatical reflex of that thing going on.

oe: Is veridicality a subtask?

Alex: Included in scope ambiguity.

Emily: There's more to veridicality than scope --- there's also n, p, a.

Alex: You can't resolve it without knowing the speech act.

Dan/Emily: But there's constraints that the grammar can tell you about.

Alex: p = defeasible I project out. a = who knows. n = 'negation'. The
scope of the complement of 'know' is different from the scope of
'believe'. p doesn't mean wide scope at the discourse level, but rather
I tend to take wide scope.

Emily: Do these scope relationships interact with quantifier scope?

Alex: *John knows that everyone's a fool* If *everyone's a fool*
projects out, then the quantifier must; if it doesn't then everyone
could go low or high.

Woodley: If you say that the inner context projects out, then what is
filling the second argument of *know* in the scoped representation?

Alex: It depends on the formalism.

oe: Pick your favorite one.

Alex: Just a normal modal classical logic:

\\forall x(fool(x) /\\ believe(j,fool(x))

In DRT (pis are like contexts):

\\pi\_0: Background(\\pi\_1,\\pi\_2) \\pi\_1: \\forall x fool(x)
\\pi\_2: believe(j,\\pi\_1)

Emily: How is that higher?

Ann: It's not lower.

Dick: \\forall x(person(x) =&gt; fool(x) /\\ believe(j,fool(x))

Dick: You could have the wide scope reading where every particular
person, John believes they're a fool, but he doesn't know that that
exhausts the population.

Alex: \\forall x(person(x) =&gt; (fool(x)) /\\ believe(j,\\forall y
(person(y) =&gt; fool (y))))

Emily: We've got fool and person multiple times in those, but they
appear only once in the sentence.

Alex: In the syntax-semantics interface, you shouldn't worry about
presupposition projection. Dick isn't doing it there either.

Dan: But I thought Dick was objecting to the pipeline strategy.

Dick: Some pipelining is useful, but I don't want to say it's all frozen
past a certain stage.

Ann: Artificial example: *That's the sharp box.* Meaning that's the box
for sharp objects. Not the normal interpretation ... not an NN compound
(*sharp* in that sense is not a noun). You have to invent an on-the-fly
concept which comes from the domain.

### (Closed) Clausal Complements/Propositional Arguments

Dan: \[Summary of what we've done.\] Now diving back down into the
weeds, maybe skimming more lightly over the formalization differences.

oe: A little bit about why we (ERS crew) were happy that this phenomenon
made the cut. In the MRS universe we have a sharp distinction between
individuals and propositions, and these are somewhat challenging. Need
to decide whether to create an instance variable/nominalize the
semantics associated with the propositional argument or be blurry about
the argument types that a preposition can take.

Ann: Or increase (lexical) ambiguity.

oe: So we always face the question of nominalize or not?

Emily: Which of these do we nominalize?

Dan: For prepositions always. *rely on*

Woodley: Isn't that a vacuous preposition.

Dan: The rely on predication excepts an instance.

oe: *think* takes as its ARG2 a handle-type argument (via a qeq). Same
for *forgot* and *know*, but *rely on* has a nominalization.

Alex: What are you nominalizing?

Dan: The complement of the preposition.

Alex: This is okay because *rely* is not referentially opaque. *believe*
and *think* are referentially opaque --- the NPs in the embedded
proposition might not refer to things that exist. I don't think you can
get that with *rely*.

Dan: Is that an accident of rely? Could there be other verb-selected PP
constructions that are referentially opaque?

Ann: Back up. Because we have the nominalization in the whole thing can
go high.

Alex: It has to go high.

\[...\]

Emily: The ARG2 of nominalization is not qeq to say, but directly equal
to it, so there is no room for quantifiers there.

Alex: If there were a qeq, you'd be nominalizing the whole proposition,
not just say. If there were a qeq, then it could be a referentially
opaque verb. Is this triggered by the verb+PP construction?

oe: It's the same rely as in *he relied on his brother*.

Alex: The nominalization rule, does it always do that direct thing
without a qeq?

Dan: At the moment, yes.

Alex: Potentially dangerous...

Dan: The first few are uncontroversial, but we're doing something weird
here. Let's look at the others for this one.

Alex: AMR is taking a scopal view.

Tim: And there's not much theory of scope in AMR...

Alex: But the graph has ARG1 dominating the whole subgraph.

Alex K: The ARG1-of points the other way.

Johan: DRS is the same as the AMR in this case. You rely on a thing and
the thing is what they said.

Emily: You don't have another box in there.

Johan: I think it's more like a relative clause.

Woodley: *He relied on what they said* is not a paraphrase of *He relied
on that they said something* which I think the MRS looks like.

Emily: What's the difference to free relatives?

Dan: There is a free relative reading which looks more like the AMR/DRS
version.

Alex: It's not the fact that they said it, but it's the content of the
thing they said. With *whatever* it doesn't matter what they said, it's
that they're saying it. With the non-free relative reading (in our ERS):
I want to describe this proposition that's true that John relied on, and
one way of describing that is that John said it.

Alex K: Strictly speaking it depends on what the meaning of
nominalization is. It can do some really fancy intensional magic.

oe: That's the intention.

Dan: This is maybe not the best showcase on the ERS side for what we
want. There are lots of places where we nominalize things to fit the
into these slots.

Alex: Do you do it for standard embedded interrogative cases?

Dan: No. Crucially not. But in general, if there's a P, clauses can
appear after them. Doesn't have to be just the selected-for guys. *I
stood near where John was.* *I prefer John's reason to why Bill came.*

Ann: What?

Dan: Is that English?

Ann: ok

Dan: I have to make *why Bill came* to something that can be the
argument of *to*.

Alex: I'm less convinced by the *where* cases, because the set of
possible answers are all locations.

Dan: It's probably best to stay away from the rest of the wh guys that
have the free relative readings lurking there. *why* doesn't.

Ann/Emily: Whyever not?

Dan: I did it whyever John did it?

Woodley: Just because you don't have that use of *whyever* how do you
know it's not a free relative? I think *why* is *the reason*.

Dan: It has the shape of the adverb.

Alex: In the semantics...

\[Ensemble: Looking for an example with a contentful preposition with a
why clause after it.\]

Ann: The trouble is, I can't find one.

Dan: *He was dismayed by why Bill went to the party.*

Woodley: *We're getting close to why we can't do this.*

oe: *This is about why we can't find the example.*

Dan: The issue of whether to have an ambiguity is an open issue. The
goal is normalize and allow composition in a reasonable way. I have an
inventory of prepositions that take instances as their second argument.
By making wh clauses but not that clauses into nominalizations, predict
the distribution.

Woodley: But what's the evidence that you can't just grab the x from the
wh word, rather than making a new one with nominalization.

Alex K: Scope issues in an MRS constrain the shape of the graph more
than in say AMR. (Fully scope resolved ones have to be trees.) Where do
you put the say?

Woodley: Conjoined with the rely.

Emily: Dan are you asserting that the AMR/DRS representation is the free
relative one?

Dan: Yes, I think so. And I think that's right for this one

Emily: Two separate questions: is this the free relative representation
and is that right for this sentence.

Alex: I'm not sure that this is the free relative. Whatever they said,
it could be a proposition, is what they relied on.

Dick: I don't think you need that universal.

Alex: There's a cause effect relation between them saying it and my
relying on it. It's not just that they happened to say the thing I'm
relying on.

Woodley: Three choices: Free relative, nominalization, scopal embedding.

oe: DRS = free relative but without the universal quantifier? And
similarly, setting aside the quantifier, for AMR?

Johan/Tim: Yes.

Dick: Parser took the complement of rely as a clausal object. rely\#on
being treated as a oblique.

Alex: Separate entry for *rely on Mary*?

Ann: There's no subcategorization in this. It's a robust parser.

Woodley: Puzzling that the rely\#on argument is what.

Dick: That's puzzling---there's no reason for he 'say' context coming
in...

Alex: So if you get rid of that context, it would be like Johan's.

Dick: If instead the argument was context of say, then it would be like
Dan's.

Emily: FGD is like MRS?

Alex K: No --- it's like taking the handle of say directly.

oe: Would be the same for *He relied on that they said what?* if that
were English.

Silvie: Yes, but we keep the distinction between that clauses and the wh
clauses then the inner representation would be the same.

Woodley: Because you're not trying to represent scope, the difference
between the nominalization reading and the scope embedding reading won't
be apparent anyway.

Alex: That depends on what they do with nominalization, what they mean.

Dick: XFR representation in fact is half each of two parses.

oe: We've observed in all five representations what goes into that slot.
What follows?

Dan: We haven't constructed a compelling reason for the nominalization.

Alex: use the wh variable...

Dan: It's the wrong one. *John worked on whose book he should read
next.* What's being worked on is the question, not the author and not
the book.

oe: Or *John worked on which author's book he should read next.*

Alex K.: That's really different from *He relied on what they said.*

Dan: That's maybe not the perfect outcome for rely on, but the
motivation comes from these other examples.

Alex: It's a propositional attitude thing.

Woodley: *There's some confusion about what to do.*

Alex: They feel to me like embedded interrogative.

Ann: It can be an embedded statement: *They thought about the dog
sleeping.*

Alex: Semantically it feels like an embedded interrogative, but about is
looking for an individual, so yeah you have to nominalize.

Ann: With *about* you can get things that look like a proposition as
well. And therefore it would be nice if the answer was relatively
similar.

Alex: It can be so long as nominalization does a qeq thing. I think you
need it for these guys.

Emily: Because otherwise there's no way for the wh quantifier to stay
down in the question.

Alex: Right.

Dick: I prefer *There's confusion about what to do.* Because *what to
do* could be *make breakfast*, and it's not saying there's confusion
about making breakfast.

Johan: *what to do* is more like a real wh thing, and I would probably
put a box there.

oe: Another example: *How they voted surprised me.*

Alex: You've taken that *how they voted* to be interrogative.

Johan: I make *how* a manner thing, with in(e2,x2).

Emily: What's &lt;WHQ&gt;

Johan: DRT duplex condition, like a generalized quantifier.

Dick: Isn't the surprise at x2, not that there was a manner of voting.

Alex: The denotation of that generalized quantifier will be all the
manners in which they voted. A question denotes all its possible true
answers.

Alex K: I'm not sure I buy the question interpretation of this. Do you
mean the way in which they voted or the outcome?

Alex: Do you represent that ambiguity?

Ann: I don't think we do. *How did they vote?* is underspecified.

Dan: Wouldn't it be useful to talk about ambiguity as something we could
choose to enumerate and underspecified as those where you couldn't?

Alex: At a discourse level...

oe: A few of us have the advantage of not being native speakers. Doesn't
vote take an optional argument.

\[Long discussion of *I voted Democrats*/*Vote Obama*/*They voted
yes*.\]

oe: So *how they voted* could fit into that ARG2 as a way of
representing that ambiguity.

Alex K: In an outcome reading, Johan's DRS is incorrect for the outcome
reading. I don't get why this has anything to do with wh. There is a
thing in the sentence which is the stimulus for my surprise, either the
manner or the outcome. Both of these are like relative clauses. Can just
be a normal individual.

Silvie: So you don't have to disambiguate outcome v. manner.

Woodley: *I expressed surprise about how they voted.* ... maybe there's
at least one reading with a proposition embedding analysis.

Johan: I guess I need another entry for *how*.

Dan: You were ready to take *We had doubts about which author's book to
read* as evidence for embedded wh clause. What about *We had doubts
about how they voted*. Do you want an asymmetry between these two, and
how?

Alex K: Can you paraphrase that with a relative clause?

Dan: I don't think so.

Alex K: That's why.

Dan: ???

Alex K/Johan: There's no question, there's an object.

Emily: It would be really distressing to me if this were a property of
how v. which and not a property of the embedding context.

Dan: So that's maybe not the same how as in *How did they vote*?

Johan: Yes.

Alex: Want to be able to capture a scope ambiguity between how and
doubt. So maybe there are two of them.

Woodley: *I know how they voted.*

Alex: *know* is factive, and you said, *I*. *John know how they voted.*

Woodley: That suggests there should be an opaque context there. In one
reading, is that manner an argument of know. More arugments for knowing
than we thought it had?

Alex: No. There's the experiencer and the scopal argument. How they
voted is a scopal thing, it's an embedded interrogative.

Alex K: Not in my world. There's the possible world that's John
knowledge. There, there's a manner in which they voted, not accessible
to me on the outside.

Dan: *I wonder how they voted.*

Alex K: I'm a little less certain about there.

Johan: There's a WHQ there.

Dan: I'm coming around to the notion that 'how' is just really
ambiguous.

Johan: Or all the wh guys.

Dan: Maybe not all of them. *whose* is in the wrong place.

Woodley: Can you stop pied-piping I think it's confusing th argument.

Emily/Ann: We need a summary.

Alex K: We should take a vote and then be surprised.

Johan: What I think now is that this DRS analysis wrong for this
example. Sometimes these wh determiners are used just like normal
existentials. That's what I think now, maybe tomorrow at breakfast I'll
think differently. Need to see more examples. Like the other examples.

Alex K: Then it's the entire fact.

Dan: *When they voted surprised me* different from *Their voting early
surprised me.* I began to get the sense that *how they voted surprised
me* because it can be parahprased as *the manner in which they voted
surprised me* suggests another entry for *how* that's not a wh guy...
but then it seems to drift over into these other context where we think
we have whole wh propositions, like complements of *wonder*. Is it
*wonder* that's doing all the work coercing how they voted and which
authors book to read into questions? What's the primitive and what's the
coersion? ERS view is that we're coercing a wh question into an entity
with nominalization. We could have an ambiguity, but...

Alex: We were getting the free-relative v. referential cases. You should
have a deriviation which can pick out the wh entity and another one
where you take the whole wh clause and nominalize it into an entity.
Either way you've got an entity. That will generate these different
reading, especially if you have the qeq for the nominalization.

Dan: If I already have nominalization and the real wh clause for
complement of wonder, do I also need to natively have how as the manner
in which.

Alex: Don't you get that reading by picking up that entity... how do you
represent how?

Dan: Right now I just have one. They voted in some manner.

Alex: I'm saying you pick up x10.

Dan: That's not available as the semantics of that constituent. *How
they didn't vote* is going to have the negation as the outermost handle.

Woodley: You're arguing from compositionality/semantic algebra. Isn't
the index on NON-LOCAL.QUE?

Dan: No, that's been flushed.

Alex: Dan is right that the semantic algebra won't let you pick up x10.
If you could, that would give you the manner in which reading.

Alex K: But the x10 needs to be bound.

Alex: It is bound.

Ann: I would have thought if you had the whole thing that the direct
manner reading is an aspect of it in some sense.

Dan: An interpretation of that nominalization?

Ann: Yes.

Woodley: Just a bit more opaque than necessary.

Ann: Well, I'm not sure, because we're talking about how many readings
this has. These various aspects are coming out as views on that reading.

Cleo: I'm very willing to be convinced by the nominalization of these
case, but I'm wondering about cases like *who came to the party
surprised me*. It's the fact that Bill and Mary and Jane came that
surprised me. It's really something about the full answers to the
question *who came to the party* that seems to be the cause of the
surprise.

Dan: What generates that set? That answer? Is it not the question?

Cleo: I think it is the question *who came to the party* --- you recover
the answers and collect them and that surprised you. Can you apply your
nominalization in that case?

Dan: I think I'm going to need it because I need it for *whose brother
came to the party surprised me.*

Ann/Alex: Not English.

Emily: *Whose judgments on this example differed surprised me.*

Dan: *Which linguists came to the party surprised me.* So don't I need
nominalization?

Alex K: I like that. There is the question around, and I'm uncertain
about the answer to it, or there is a concrete answer around and that
surprised me. In this case you would say the thing that surprises me is
the proposition *they voted in a drunk manner*.

Emily: Yeah. It's not just the manner (*drunk*) but the proposition that
they voted drunk.

Alex: Even *Mary surprised me* has a reading where Mary is an argument
in some proposition and that's the stimulus.

Alex K: *The manner in which they voted surprised me.* so there's hidden
proposition here too?

oe: Was starting to seem like it.

Alex K: Even though it looks like you have a nominal referent, the thing
that surprises you is still a whole proposition.

Woodley: So you think that there's a proposition reading in the relative
clause case?

Emily: Yes.

Woodley: But that's not compositional.

Emily: I'm not worried about that right at the moment. Our question
right now is what we want, and we should let what we know about how we
can get there constrain that.

oe: I'm with Emily. How do get there is Dan's problem.

Dan: So do we let all prepositions take scopal arguments, or nominalize?
*We didn't even get near which author's book we should read next.*

Alex K: Your languaged is fucked up. Can't we work on German?

Alex K: Can I go back to the question of why we're doing all of this.
Semantic representations are there to get stuff out of them not just to
be pretty. So you see a way I can build an inference engine/veridicality
that can get something out that?

Emily: We see that difference between that clauses and wh questions.
Maybe the nominalization is standing in for the answers.

Ann: I think we're using the symbol 'nominalization' too widely.

Silvie: Does it mean you would resolve even the whatever clause like
this? Think of an answer, and whichever answer you pick will be right.

Dan: MMmmmm...

Woodley: *Whatever they say will surprise me.*

Silvie: Any answer will do.

Dan: As usual I run to the possessor: *Whoever's book you read will
surprise you.* I think the book is doing the surprising, not the
authors.

Dan: *Whichever book you read will frighten me.*

Alex: I get an ambiguity. In a context where I'm afraid of you getting
any knowledge at all from books. Think ISIS: *Whichever book you read
will kill you.* It doesn't matter what you read, they'll kill you for
reading.

Emily: I still don't see why that's a proposition/question. How does
this relate to the question of assimilting the free relatives to the
embedded interrogatives.

Dan: Surely in *Whichever book you read fell on the floor* it's just a
book that did it.

Alex: Yes. I'm getting an ambiguity.

Emily: So that means we can't assimilate the free relatives to the
nominalization case; we still need something separate representations
for the two.

Dan: But you'll say that for *Any book will kill you.*

Alex: So that's like *John surprised Mary.*

Dan: Not part of the linguistic signal.

Last update: 2014-11-13 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/WeSearch_CcsDayOne/_edit)]{% endraw %}