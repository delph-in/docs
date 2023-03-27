{% raw %}FIXME: Add link to overview slides

\[Scribe: EMB\]

EMB: Quick clarification before I dive into scribing: Lexical threading
problem is also about heads making their SLASH lists out of arguments'
SLASH lists.

Guy: Yes, that's what I meant by underspecification.

EMB: In terms of what's to be voted off the island, what benefits are
there from lexical threading, beyond early adjectives?

Dan: Not just those. Also: *too tall to hire*. The *too* specifier
causes the need for a SLASH some place, which is still lexically bound.
There's no filler in *That basketball player is too tall to hire.* A
family of such degree specifiers and it's even recursive --- degree
specifier of degree specifier and the first of the two is the one that
launches the dependency. The lexical launching of a gap that doesn't
need an overt filler is more general than just easy adjectives, but that
is the class of phenomena that motivates: *He is too obviously
incompetent to hire.*

Berthold: Our presentation tomorrow picking up an analysis of Claire
Grover's from the mid-90s. In French, the tough constructions aren't
unbounded (but involve more predicates that we thought). Grover: this is
a local dependency, both tough and too. Turning the downstairs object
into a secondary subject and percolating via a kind of raising
construction. Tomorrow: How strong is the evidence really that these are
unbounded (out of finite clauses)? Philipe Miller rejects P&S examples
of tough constructions out of finite clauses.

Dan: *John is too incompetent to think that Bill would ever hire.*
Perfect English for me.

Guy: Not suggesting that we don't need control over the SLASH list, just
suggesting that rather than doing the appending in the lexical entry,
having the lex entry control how the appends will happen later in the
derivation.

Dan: Giving the lexical threading a life boat after throwing it off the
island. Responding to Emily's suggestion that it's not so narrow. It
also occurs in other (at least European) languages.

Emily: Right -- not suggesting not analyzing them, but analyzing them
differently (e.g. with extra HC rule). Pushing the complexity elsewhere
in the grammar.

Woodley: Dropping lex threading only solve the problem if you are
willing (as you probably should) to have the computation features on the
deleted daughters list. The underlying problem is that these computation
features record the history of the computation of the append list.
Append list structure records not just the list but how we got there.
Expedient solution is delete history once we have the result. The
problem with lex threading is that deleting that feature means we don't
have the info when we need it.

Guy: Would still be possible to have the other proposal that doesn't
rely on using deleted daughters... The append lists keep the number of
appends, so if you want to identify two of them, lexical thread analysis
makes them dissimilar when we don't want them to be. Can get round that
by being more careful in what you refer to.

Woodley: Isn't that equiv to your third option of what to kick off the
island? Be more careful about what we identify. If you do that, don't
have to get rid of lex threading either.

Guy: You would still have the list being defined lexically...

Woodley: The whole problem happened because coordination wants to
identify two append lists computed differently but have different
contexts. But doing that as a grammarian seems like it's going to be
pretty fiddly and cumbersome.

Woodley: How does dropping the arg/adj distinction help, even if there
were an appetite?

Guy: Because we can make sure that ... there's only going to be a
certain number of different lexical types. Between the transitive and
the intransitive, they had different numbers of appends b/c of whether
or not it had to look at the COMPS list. But if I say there's always a
DEPS list, then it's always the same number of lists.

Woodley: Is the idea that slashed adj and slashed args both get
lexically threaded from the beginning? How do you do that w/o knowing
the number of adjuncts?

Guy: I think this is the reason we don't have that analysis in the first
place. You need to know the number of adjuncts. That's the DEPS
proposal, right?

Olga: All, or just the extracted ones?

Dan: Is there an upper bound on how many adjuncts you can extract in
Russian?

Olga: One max.

Dan: It would be a strong claim to put in our machinery, like the wrong
strong claim that there's just one. But if we knew there was always just
one, then you could always just anticipate that one extracted adjunct in
the SLASH list.

Olga: The literature would say it's not possible. I have encountered
some, but I think it's pretty rare. I have encountered exactly one
example, in an embedded clause: "I don't know where and when to put
commas." (in Russian.) Someone happened phrase a 'how' question as
'where and when'.

Guy: Is there coordination in the example, 'where and when'?

Olga: No, but seems like an accidental phrasing. Said 'where when'
without the 'and' in between.

Dan: If you were right about that hypothesis that there's only ever at
most one adjunct extraction, then one could take a Bouma like view where
every head takes exactly one modifier on it's DEPS list and that one can
be extracted. Every structure you build, the first adjunct is privileged
and comes in via the head-compl rule. You never get to extract adjuncts
otherwise. I don't think that sounds beatiful, but mechanically I you
could get the effect that way.

Guy: I'd be hesitant to have that as a cross-linguistic assumption.

Dan: Dubious, yes.

Chris: In vein of what's cross-linguistically feasible or possible, one
thing that surfaced in working with the valence change library is the
assumption that we only care about these things in the order in which
they are added. Downstream impact on how we want to resolve diff-list
and append-list issues. I don't know that there is a deep question
there, but I just wanted to resurface that as in trying to solve this
problem, do we think that there is a potential world in which we need to
deal with them out of order and should that affect our solution.

Olga: Exactly. In order to have the various orders of one extracted
adjunct and the subject and all complements (all of which can be
extracted). I have a little doubt they can in fact appear in any order
(though not everyone agrees with that). As it is now, I can only have
the adjunct appear first and then the arguments, because I have just one
adj extraction rule and one filler gap rule, and I cannot have the
arguments first and then the adj, or the adj in between the args, but
these are all valid orders. It's not that it's not possible, but it
becomes quite fiddly. To have that and lexical threading, need multiple
rules to extract in multiple ways (append or prepend)...

Glenn: Have you identified a case where there are three items on the
SLASH list?

Olga: Yes.

Glenn: So four is the max then?

Dan: It might be seven ... I don't think this is a good road to go down.

Glenn: Is it infinity or not?

Dan: It's more than 2. And that for a linguist is infinity.

Ann: Back to the deleted daughters business. It seems to me really
impossible to rely on removing the history by getting rid of some of the
feature structure. It's not in tune with the formalism at all. Could
restructure things so that the rules were written so that mothers &
daughters were separate, as discussed years and years ago, but to rely
on the hack of removing some of the structure seems completely ... might
as well just say we're not using this formalism anymore.

Woodley: I tried to make a similar comment a couple of months ago. I
agree htat it doesn't seem principled. Using deleted daughters as an
efficiency measure is fine. Using it to change the fundamental behavior
of the system feels wrong.

Ann: You can do it by changing the way the rules are written (separate
structures with mother & daughters), and that works fine in the LKB. So
you could do it, but not in another way conceptually.

Guy: I think it's not not using the formalism to want to use the
computations. Others want relational constraints...

Ann: That's not the argument. Unification/fs formalism are supposed to
be monotonic, etc etc. Relational constraints are supposed to be an
additional the formalism. You could add a proper append and the problem
would go away. This is making it non-monotonic, which is throwing it
away.

Guy: How?

Ann: You're saying I can take part of the structure and throw it away.
That's non-monotonic. There's a whole story about the formalism that
says you're accumulating constraints, and if you throw some away
(deleted daughters).

Emily: How does lexical threading survive with append lists + DEPS?

Dan: intransitive V + adjunct can only coordinate with transitive VP
w/adjunct if the...

Emily: But don't the append-lists still look different, for transitive &
intransitive verbs?

Guy: Two different ways in which they carry along their computation
history: one that can be dealt with by deleted daughters, but if we
can't do that, then we have to go with option 3 (careful about which
structures we identify).

Dan: Example?

Guy: The append-list still has the APPEND feature which knows how many
lists it's appended, even if they're empty as in *The monkeys ate
bananas and slept* or *The monkeys ate bananas quickly and slept.*

Guy: Treating intransitives as appending an empty list of comps...

Dan: Decide what our maximum number of complements is, and then make
sure that everything else has the right number of appends. Only the
number of complements and the one distinguished modifier that could get
extracted.

Guy: But also could be something extracted form within an adjunct.

Dan: *Which part did you sleep in...*

Guy: So not just the number of extractions, but also the number of
adjuncts.

Dan: But you don't have to do an append for the adjunct when it's an
overt adjunct. Special rule that combines an unslashed adjunct doesn't
have to do any appending.

Guy: How about special append operation that doesn't append if the
arguments are empty, but just copies up?

Emily: And problem of getting them in the right position in that set of
appends.

Dan: *Which book did you give Kim and hand to Sandy.* So the silly
solution is extra silly because it's actually wrong.

Emily: Does that example torpedo Guy's clever suggestion about smarter
append?

Dan: I don't think so.

Berthold: Back to: Take the copy and not the whole list object.

Guy: The way I've currently implemented it, the copy is in a feature of
the list. It would be possible to implement it differently so we have
two separate features, one which has the clean list and one with a
diff-list which is appended to. And then make sure you only identify the
list and not the diff-list.

Berthold: Picking the right list, should only target a very small number
of very general principles. Won't impact the readability of the grammar.
Do it right in one place?

\[Alex: For what it’s worth, I totally agree with Ann: in a
constraint-based framework, don’t drop constraints, or any information
in fact.\]

Emily: The problem here was coordination, so we want to do it very far
away so you can still just say: valence is the same between X & Y.

Guy: Don't need to do this out of the way in most cases of append, but
rather just one feature that's high in the structure that's just used
for SLASH. Don't need to do this for e.g. HCONS and RELS.

Guy: Still about being careful, but not about what's identified rather
careful about where the append happens.

Ann: I don't understand 'far away' and the copy idea. Are you saying
that lists are only in the lexicon? There's no copy operation.

Guy: Token identical things on the list, without having the list token
identical. Far away: we don't want to identify the append feature.

Emily: 'Far enough away' isn't like deleted daughters. Just position in
the feature structure outside of what the grammarian wants to identify.

Ann: Talking about copying is sort of worrying. What you're saying is
that nothing in the phrase gets its fingers on this thing so it can't be
a problem. But then it is because in comparing those two in
coordination...

Guy: If the substructure that's doing the appending is somewhere much
higher up (outside what we might want to identify in coordination). Here
are reentrancies to the list we want to append and to the output of what
we want to append. We have just the last reentrancy inside the
identified part.

Ann: I'd have to look at the details ... hard to see how you can avoid
the possibility of something in the structure pointing back to how it's
created.

Guy: It's there, but out of the way from what a grammarian might want to
identify. It's always possible to see it somewhere. It's just whether it
gets in the way of doing grammar engineering.

Ann: I'm not sure you can guarantee what you want to guarantee about the
cleanliness of the structure.

Guy: The larger structure that we want to identify in the Matrix ...
make sure it's higher than that.

Dan: I think what Ann is skeptical about is that you can maintain the
opacity of the structure inside the relevant part, that it has the info
you want, but that it doesn't include pointers to the 'hidden'
structure. You've managed to do it a lot, but can you do it in the
general case? I've been amazed at how much you've done it so far, but I
don't have the sense of clarity that you have deeply solved the problem.

Guy: It depends on whether we can rely on any manipulation of hte list
happening late enough that we don't expose any further copying. Because
the copying is implemented as subtypes, you can always take a type
that's there and force a copy. So can't say it's in the general case
never going to happen, but specifically in this case, can solve it with
moving things far enough away. Two types of reentrancies that need to be
avoided in this case. If we can't use deleted daughters, can still...

Dan: So long you can assume a cooperative grammarian and some nicely
constructed types, probably okay. I'm with Ann in just being unsure
whether that pure happy list that's in the valence structure contains
everything I want and nothing I don't want.

Ann: I'm worried about the terminology that suggests an order to things,
that distances matter... just being really really careful about this and
not using that sort of terminology would be very helpful in this sort of
situation. (At risk of channeling Georgia Green.)

Guy: When I say far away, that is structurally part of the feature
structure --- relative distance to root of feature structure.

Dan: I think talking about root etc is clearer. Trivially certain
lexical information that is part of the sign doesn't propagate to
phrases; since P&S94, only some structure goes up into phrasal types and
the syntax.

Guy: If I have a relational append feature at the very top level, only
used sparingly by a grammarian to avoid conflict, then you could keep
the machinery for doing the copying from being visible in the valence
structure. But that only gets the half of Ann's question --- not the bit
about avoiding procedural before/after language. The input/output
language comes from the way I came up with wrapper types. The conflict
with lexical threading is there, because lexical threading doesn't take
that view.

Woodley: You keep talking about valence structures and keeping things
out of valence structures. Given that it's coordination, we're also
worried about SLASH, which is not in the same part of the feature
geometry. Keeping the computation somewhere that doesn't intersect with
the valence structure and the SLASH list so that the SLASH list that's
visible to the coordination rule... then what happens when higher in the
tree something wants to append that SLASH list? It has to be of the
right sort of shape that it can play in the append lists, right? It's
going to have to be able to subtype into new-list...

Guy: This is why there are two ways there's a problem with append lists:
Keeping track of what you're appending and how many times you've created
a copy. The first can be solved by pushing appends high in the feature
geometry. The second one by controlling when you can do the appends.
That's why lexical threading can be a problem ... we've lexically
specified an append but haven't appended yet.

Last update: 2020-07-15 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/VirtualAppend/_edit)]{% endraw %}