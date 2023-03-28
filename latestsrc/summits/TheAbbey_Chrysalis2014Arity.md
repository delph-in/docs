{% raw %}oe: … under certain assumptions about the object language.

Woodley: I agree with the goal of abstracting away from the object
language, but to make decisions about the design MRS based on the
comfort that yes it would be possible to assign some interpretation to
that, rather than whether it would be an interpretation someone would
want misses the point about why we want a meaning representation.

Dan: example?

Woodley: If you're going to try to assign an actual LF in some object
language that looks like anything I've ever seen, it's going to look
very different depending on whether the argument is scopal or just a
variable and what you can do with that (model builder, theorem prover
etc) … the shape of those predicates being different is going to be
relevant. The information that they have the same name and are related
is also of course relevant, so they don't have to be two totally
separate things. Don't have to decide now what the relation between
\_believe\_v\_1 and \_believe\_v\_2 (nouny v. verby arguments) is.

oe: What in the syntax is maybe a much softer boundary/comparable
distribution, in logical forms are very different things: operators v.
predicates taking logical variables or constants. The reason Ann and
Alex have to hold strongly to the position that in a real MRS each
predicate has fixed arity (n scopal and m non-scopal arguments) is
because they have to maintain the possibility of a bridge into
conventional predicate calculus.

oe: Underspecification is often motivated by synsem interface and
parsing efficiency etc. But OTOH trying to understand better the other
end (relation to logic) is also interesting. Ann and Alex are probably
much better equipped in that space. Save for Ann time?

oe: Reading up on Montagovian and Davidsonian semantics and trying to
understand the relation to what we're doing.

Woodley: Not necessarily incompatible, but there's a gap.

oe: A big gap, due in part to the range of phenomena we're trying to
approach, and self-imposed problems that Montagovian semantics is trying
to solve.

Francis: Under the influence of rabid functionalists who hold the
position that LF is not the correct thing to do, worth keeping in mind
that LF is a way of expressing things, but it's not a given that it's
what humans are doing when they're interpreting language.

Emily: Regardless of how what we're doing relates to what people
actually do, it's formal so it has to be internally consistent.

oe: But that's a different position from saying it has to support
inference.

Woodley: If not, what do we want to do with it?

Woodley: That leads to a nice broad question: What's the point?

Dan: Tiny point: There is a move we can make in the grammars we write to
exploit the naming conventions a little more like their original design,
since we don't usually know much about the actual sense distinction.
Maybe we should be saying this is \_discover\_v\_rel, and I can't tell
you whether it's the one relevant for an index or a proposition. You go
look in the SEM-I and see which one it must be depending on whether it
has a scopal or individual argument. Not currently using
\_discover\_v\_1\_rel consistently in this way.

Francis: In a case where we there's two very different discovers --- a
cross-classification between different types of arguments and other
kinds of sense distinctions e.g. *I see* as in I physically see v. I
understand. Want to keep that distinction while folding in *I see what
you're doing* and *I see your point.*

Woodley: Can mentally see either a NP or proposition, but can only
physically see a NP

Emily: *I saw him swimming*?

Dan: *I can see that he's swimming.*

oe: *I came to the pool and saw that my daughter was swimming for the
first time.*

Emily/Francis: So there's two dimensions of underspecification: sense
distinctions and types of arguments.

Francis: So in that case, still all the same predicate? (If we can find
one where syntactic factors can at least sometimes tell us which sense
we have.)

oe: Classic example in that space is the count/mass paper. Currently
we're looking for something parallel in the verb space. It's almost an
hour into the meeting, so time to bring up the causative/inchoative
alternation. No doubt we want a predicate distinction between *The
window opened*/*Kim opened the window.*

Emily: Can't decompose?

Dan: Can. Maybe think of it as a notational variant.

Dan: *The windowed opened onto a beautiful vista.* *The glass broke.*
*The earth shook.*

Woodley: Say that *The glass broke* is one place, and *Kim broke the
glass* is a different predicate with two arguments.

Dan: \_break\_v\_1\_rel and \_break\_v\_cause\_rel: different
predicates, different roles for ARG1.

oe: We've felt that what we're doing is equally adequate to the
decomposed representation.

Francis: With explicit links would be equivalent. But some things don't
take the alternation and then you have to decide which one…

Francis: When we talk about predicates, for the discussion have a
distinction between predicates that are completely different and those
that share something:

### Terminology

- *same lemmas different senses*: bank-river-bank, bank-finance
- *same lemmas with different predicates shared semantic root*: cases
with variable arity: shared something between the two
- *predicate*: the symbol in the MRS (value of PRED)
- *relation*: what the MRS predicates map to in the logic language

Francis: I thought many years ago we agreed that predicates in the MRS
would have a fixed arity. Though implementation may not have followed.

oe: May have to be more deliberate about what we mean by MRS. MRS: an
underspecified description of a set of logical forms. Ann and Alex
consistently say that they have fixed arity. Grammars find it convenient
to break that, so the things that grammars produce are underspecified
descriptions of MRSs.

Emily: Even if predicates have fixed arity, it's useful to keep the
description between MRS-predicates and LF-relations.

oe: Three levels we can discuss: underspecified descriptions of MRSs
(one we love and understand very well), MRSs (one that is formally
defined) and the logic language (on that is least understood).

Woodley:

**UDMRS** (Underspecified descriptions of MRS) predicate (possibly
variable arity)

**MRS**

**Object language** (logic) relations: fixed arity

Francis: Leave room for semantic root at the top.

Emily: I don't understand the dimension that lines up semantic root with
these other things. I think that's a separate independent dimension.

oe: Orthogonal.

Emily: Do we need distinguished terms for UDMRS and MRS?

Woodley: Having the same terms for different levels leads to confusion.

Ann: Don't think you need to make the grammars more structured, can go
down the RMRS route and get an underspecified version of that predicate
symbol.

Woodley: What would the implications be of the same UDMRS predicate
having different uses with scopal/non-scopal arguments?

Ann: Don't know. The Alex et al formalization of RMRS didn't address
this.

Woodley: not claiming that a single UDMRS would resolve in one case to
scopal and non-scopal arguments, but rather that two different UDMRS
produce by a grammar using the same underspecified predicate name might
resolve to those situations.

Ann: But that any MRS that came out, you would know which it was.

Emily: With the help of the SEM-I.

Ann: The MRS coming out of the grammar tells you which way it is
deterministically. Does it? If not you have the underspecification
problem where you don't have any clue what the tree is.

Woodley: Looking at the predicate symbol plus what's assigned to fill
that role does tell you.

(Emily: What about dropped arguments?)

Ann: I don't see that there's any serious problem with that. The
external MRS should probably specialize one way or the other.

Woodley: So that's the MRS that's described the UDMRS produced by the
grammar.

Ann: That's the MRS that goes through some well-specified …

oe: That is a well-formed MRS where the same predicate symbol is always
used with the same arity of scopal and non-scopal arguments.

Ann: With ordinary arguments (individual), I think you could have an
external MRS which underspecified the arity and fitted in with the
general RMRS way of doing things. If the grammar deterministically tells
you the type of each argument, could straightforwardly figure out which
predicate symbol to use.

oe: Unless some of these arguments were unexpressed.

oe: At Cambridge, didn't Alex say that even in RMRS you have to assume
that predicates have a fixed arity. Even eat would have to be broken
down into eat/1 and eat/2.

Ann: If it's going to be a predicate in logical terms yes, but the RMRS
universe does allow that sort of underspecification to happen. That's
the whole point of allowing the RMRS fluidity about number of arguments.
The RMRS language allows you to not know ahead of time how many of those
things you've got.

Emily: The grammar question is whether we get dropped arguments of the
ambiguous type, like *I see.*

Dan: No, the grammar prohibits that.

Dan: Two separate entries for *see* with different types of arguments,
that happen to use the same predicate symbol. But only the NP complement
one can drop its argument.

oe: I thought the move to RMRS gave the additional great flexibility of
underspecification of argument roles v. modifiers.

Ann: The move to RMRS gives us the ability to have underspecified role
names, and role names which aren't mentioned at all in the grammar, and
to do things like have just an ARG1 and an ARG3 mentioned in the
grammar.

oe: What means 'mentioning' in the grammar? The grammar already does
this with the current UDMRS.

Ann: The assumption is that if there is an ARG1 and an ARG3 there is
some unexpressed ARG2. But the point here is that with a standard
approach to semantics you can't leave out some argument, but with RMRS
you can. Gives you the option of not mentioning all the arguments which
in the fully resolved MRS you do have; hallucinate the rest based on the
SEM-I. The formal way of doing that is fairly well understood.

Emily: What about under specifying the argument/modifier distinction?

oe: Currently make a black and white distinction between Ps that are
semantically vacuous and just mark a role v. those that introduce their
own predication.

Dan: *the rejection of Sandy* seems to be a place where we'd like to
have an underspecification. Sandy could be ARG1, ARG2 and yet another
where Sandy is the vague possessor of that rejection. We would paint
that in the loosest case as just a poss\_rel. Maybe *that rejection of
Sandy's*.

Ann: How would you want the poss\_rel to go.

Dan: We were thinking that the link between those indices is either an
ARG1 link, or there's another predication in there.

Ann: Can't don't that in the RMRS universe (as underspecification) but
could imagine someone else making another universe where you could do
that. poss\_rel is a completely different type of object in the RMRS
universe from ARG1 or ARG2.

Francis: But if prepositions are collapsed into semantic roles, could
underspecify over that larger set of role.

Ann: Could imagine an approach where you make the poss\_rel a special
sort of del like arg1\_rel … but probably better/easier to go down the
route that Francis is suggesting where you invented another set of role
names. But that would make for a different LF for the possession of
rejection by Sandy from what we have at the moment.

Woodley: Doesn't that somewhat close to the door to the possibility that
Ps have modifiers of their own? (*The letter apparently to Sandy*)

Francis: Yes

Ann: If you think of this in terms of things that we do think of as case
marking appositions, there are arguments that those shouldn't be treated
as case marking. That possession relation is already very
underspecified. Need to work out a way of making that underspecification
(like its kin the compound relation) cache out as… normally thought of
as relations between entities, as opposed to ARG1 which is thought of as
a relation between an anchor and an entity.

oe: What forced the interpretation of anchors instead of events?

Ann: We never talked about it (ARG1) hanging on the event.

oe: But that's classic Parsons-style. I know you started with handles,
and that forced you into in-groups…

Dan: Was it that at the time we hadn't settled on the notion of
characteristic variables?

Ann: Yes that's true, but there's another problem, even if you have
characteristic variables. In some sense I think of this as a bit
irrelevant as I'm now in the DMRS universe where many of these
distinctions have disappeared anyway. It really doesn't matter whether
you say that the arc of an argument relation is going from an event or
an anchor or even just from the predication entity itself as it is in
the DMRS universe. The point is that poss\_rel is still a different type
of thing (e.g. a node in the DMRS universe). Could change that and turn
it into an arc in the DMRS universe, but then you've changed the logic a
lot . I've always had the assumption that we have rather a small number
of possible links (DMRS) or argument names (RMRS) and the specialization
can go down to ARG1/2/3 but that there's not some sort of indefinitely
large number of different roles, even if you went to a sort of more
[FrameNet](/FrameNet)-style approach, I've always assumed there was a
finite, small, enumerable set of those things. There's a fairly
fundamental distinction between the relation entities and the link
entities.

Woodley: Still it's possible to think about underspecifying between
arg/adj for PPs… *I put the book on the table*

Ann: That ones a special case (resultative). But *Kim ran to the store*,
some people would say that's a complement syntactically some say it's an
adjunct complement, but semantically it's the same.

oe: Currently we say that's a syntactic complement that introduces
modifier semantics.

Ann: modifier semantics is not a good term either, since modification is
a syntactic notion.

Dan: *Kim put the book on the table.*: *on* builds a proposition. I
don't think we have any cases where a preposition is two-place
predication and is directly the argument of a verb.

*I handed the book to Sandy*: *hand* treated as a three place relation,
like give.

What I think we don't have is any place where the preposition lands
directly as one of the arguments.

Emily: Prepositions can:

\(1\) Show up as a separate proposition (2) Show up as predicated of the
verb (3) Not be represented in the semantics.

oe: What's wrong with the semantic modifier terminology? Ann:
intersective modification is ok.

Woodley: I thought we found some examples of complement/adjunct
ambiguity over the summer.

Emily: I think those cases are all really attachment ambiguities, not
role ambiguities.

Dan: We did look at some cases where there might be some benefit in
ambiguity of which argument is being filled.

*Kim was seen by Sandy.*: don't know if that's locative or passive
agent; treebankers have to pick (possibly arbitrarily)

Would be nice to be able to say we just don't know.

Emily: But that's not role underspecification.

Francis: A slightly different view is that we're possibly missing a
generalization in something like *I gave it to Sandy* and *I read it to
Sandy*: in both there's some sort of benefactive role for Sandy, but
we're not capturing it.

Dan: We're not? What about *I read Sandy a book.* That's just a gap in
the lexicon: *I read Sandy a book*

Ann: Would have to do that with a very productive lexical rule, and need
to constrain that.

Dan: There should be a lexical rule that is very productive and
surprisingly idiosyncratic in its

Emily: And you want that to be ARG3 in all cases?

Dan: *give* is the canonical instance. *Told Sandy a story.*

Emily: *I ran Sandy a marathon*?

Dan: Utterly different. One is canonical, occurs all the time. The other
…

Francis: Seems strange to say these are ARG3s.

Dan: But even if they're not all ARG3s, then surely you would say that
*hand* requires there arguments.

Francis: I think we are missing a generalization. But I don't have a
solution.

oe: I can recommend a solution: We don't have capture all
generalizations. Surely there are meaning postulates…

Emily: A little bit of semantics textbooks is a dangerous thing…

Dan: Maybe RMRS gives us the flexibility we want. Maybe there's a ben
role (extend the range of roles a little bit). Lexicalized cases like
*hand* still assigns the ben role, since ARG3 is heavy-handed.

Woodley: Slippery slope?

Dan: Reduces the distances. sing is always two place, but there's this
other benefactive that can show up.

Emily: So it's a syntactic fact that *hand* is always three place, where
*sing* is somethings two-place?

Dan: Yeah.

Ann: Other issues re whether you want to lose the to/for distinction in
that putative benefactive. *I read it to Sandy*/*I read it for Sandy*.
I'm actually fairly neutral about whether we have a benefactive role as
opposed to ARG3, then you have to ask whether you are losing something
that you want. In the case of *read*, I don't think you can say the
*to*/*for* are the same.

Dan: *I wrote Kim a letter* is underspecified between the two.

Ann: But if you just have a benefactive role, when the to and for are
overt, you lose information that you have in the sentence.

Dan: Slippery slope… if it's only to/for, maybe we're okay.

Ann: I had worked on benefactive things years ago.

Dan: There is a potential hope that the way a language does valence
changing things in the syntax corresponds to a limited range of
distinctions in the semantics. So maybe we can still hope to live in a
universe with a limited finite set of role names organized in a
hierarchy…

Emily: Even if we're hoping for a finite set of role names we can't hope
to have the same interpretation of them across predicates.

Ann: That's why ARG1/2/3 (because Dowty)

Dan: Could extend that to/for and say that the actual interpretation of
to/for depends on the predicate that it goes with.

Ann: That's only possible if you've got the to/for in the MRS and if
you're going to do the dative-alternation style thing so that you've got
a role name for the NP NP case then you end up with MRSs that look very
different if you have the to or for as a semantic thing.

Dan: imagining ben. ben\_1 (to), ben\_2 (for) \[ben\_2 and ben\_4\] …
get underspecified ben in the NP NP case, and ben\_2 or ben\_4 if the P
is overt or if the verb tells you have it has to ben (*bake Sandy a
cake* is ben\_4, not ben\_2).

Ann: Losing information about what for means by saying it's benefactive.

Dan: The preposition will (through magic) produce a ben\_4.

Ann: But when does it do that? *The book for Sandy*: is that for, or
ben\_4? Going to push the problem of ambiguity somewhere else if you're
going to do this. For clearer cases, think of deverbal nouns… by going
away from the surface representation with the for, have to decide where
to draw the line, which moves the lack of generalization there.

Dan: *I baked a cake for Sandy for my mom.* and even *I baked Sandy a
cake for my mom.* and *I baked my mom a cake for Sandy* with the same
meaning. (But never: *I baked my mom Sandy a cake*, unless she's called
Sandy.) I see that it doesn't scale very well.

Woodley/Ann: They are both benefactive in that example, which is an
argument against benefactive actually being a role.

Last update: 2014-02-16 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/TheAbbey_Chrysalis2014Arity/_edit)]{% endraw %}