{% raw %}* * *

The starting point for this discussion was the question of whether words
like *performance* should be given a decomposed semantic representation
so that there is an ARG1 position into which to slot the NP in a *by* PP
on the ARG1 interpretation. Along the way, we decided that this is
actually two orthogonal questions: should the semantic representation
for deverbal nouns have an argument position one way or another for the
argument that corresponds to the verbal subject, and should the semantic
representation be \_performance\_n\_rel or \_perform\_v\_rel +
nominalization\_rel.

On the long walk to coffee, we started this topic, and noted the
following interesting examples:

1. *The performance and cafe by the symphony*
2. *Kim's arrival and rejection happened within 5 minutes*
3. *The performance and dance by Mary*
4. *The arrival and dance by Mary*

\(1\) shows that though *by the symphony* can in principle be either a
by-adjunct or the selected *by* that marks ARG1, the coordination with a
non-relational noun forces only the adjunct reading. This means that
there are cases where the grammar does disambiguate for us, so there is
some gain to be had by ambiguating these two different uses of *by* PPs
with relational nouns (as we already do with passive verbs).

My notes for (2) say "no hope for resolving poss\_rel, but maybe hope
for resolving *by*.

For (3), we believe that both *performance* and *dance* admit both the
ARG1 and adjunct readings of the *by* phrase, but that the coordinated
structure forces them to both combine with the *by* phrase semantically
in the same way. So this is another case of the grammar constraining the
interpretation that might otherwise be ambiguous.

My notes for (4) says that coordinating with *arrival* forces the COMPS
list of *dance* down to one complement, though I can't just now
reconstruct how this example demonstrates that.

Woodley asked whether these examples should best be analyzed with RNR.

* * *

\[ Much more was of course discussed on that walk, but notes resume when
we got back to the meeting room:\]

Francis: Concern with performance as nominalization + perform\_v\_rel,
not sure they mean the same things. Sometimes more than one
nominalization with clear different meanings: replacement ---
thing/person that is the new stand in, v. the act of replacing.

oe: Isn't *Kim replaces Abrams* ambiguous in the same way?

Francis: *The two replacements have arrived.* these are persons, not
events. Not \_v\_rels, don't have ARG1 and ARG2.

Dan: *The replacement had a long beard.*/*The replacement took two
months.* Two different senses, not related to the verb having two
senses. But: just an accident of the language. Need two entries. It's
all handwork anyway.

Francis: Have somewhere a hierarchy of meaning relations giving a link
between performance\_n\_rel and preform\_v\_rel; would be nice to have
the argument sets harmonized.

Francis/Dan: If we say *-ing* and *-ance* and *-ment* forms are all
perform\_v\_rel plus nominalization\_rel we're losing some information,
but possibly could be done by ambiguating nominalization\_rel. Plain
nominalization\_rel is transparent, but nominalization\_ment\_rel flags
that there might be some drift.

oe: And it's a way of having that extra EP do some work for us. Records
which derivational process has occurred productively or historically.

Emily: Generator inputs?

Dan/oe: They can underspecify which nominalization\_rel. Just like
leaving the subsense field underspecified.

Woodley: On the assumption that you still want a nominalization\_rel
seems nice.

Francis: Other consumers might want to say that *instruction* is similar
to *pedagogy*. Their lives become harder under this regime because there
no longer is an instruction\_n\_rel.

Emily/Francis: nominalization\_rel + perform\_v gets us to a transparent
link to perform\_v, but that can be gotten by an explicit link between
perforamance\_n and perform\_v, while maintaining the current ease of
linking those to other things.

Emily: [NomBank](/NomBank) might be a useful resource for looking at
relationship of deverbal noun argument sets to that of verbs.

Dan: Are there words like *pedagogy* that might behave like
*instruction*:

*The pedagogy/instruction of students by inexperienced teachers never
goes very well*

Francis: *pedagogy* isn't that word, but we may be able to find one.

Dan: I overstate the challenge. We don't have any particular reason not
to have *pedagogy* take of and by complements.

Dan: Convinced myself along the walk that finding the guys that can take
the *by* is the same problem is finding the set of relational nouns, if
intransitive reverbal nouns never take *by* phrase complements. (contra
Emily's judgments of *the dive by the Estonian competitor*.) Though
there are relational nouns that are not deverbal.

Woodley: Do all deverbal nouns become derived, or do they stay in the
lexicon?

Dan: They stay in the lexicon. Spelling is unpredictable, just making
the semantics more transparent.

Woodley: Can't inherit from the verbs, because they're not in the same
place in the lexical type hierarchy.

Woodley: Can't do that via a big irregs.tab?

Dan: Makes a much stronger claim, because the irregs table is just about
spelling.

oe: Does this call for the LKB's old mechanism to record pairs lexical
entry and a chain of lexical rules as first class information?

Dan: We could invoke that chain of rules and do something pretty artful
with *topicalization* --- and do all of that in the semantics, but I'm
not that excited about going down this road yet.

Francis: Possibly existing resources already have the links between
those forms.

Dan: If we agree we want this kind of link for deverbal nouns, what
about deadjectival nouns?

Emily: *Kim's ability to sing* --- relation to complement seems the
same.

Dan: *Sara's ability to admire herself.* seems to support
reflexivization.

Emily: Deadjectival nouns might be more straightforward than the
deverbal nouns because they just use the same marking of the arguments.
(Aside from possessive.)

Dan: Do we imagine that our imaginary consumers would thank us for this
decomposition in the same way the do for deverbal nouns?

Emily: So you're already parsing *ability* is a relational noun. So the
original motivation isn't there (can link the arguments), but once you
have the decomposition for verbs, nice to have the symmetry for
adjectives.

Woodley: *The foolishness by Woodley was surprising.*

Emily: I think that's a sentence, but I don't think that the *by* is
marking ARG1 of foolish, but rather that there's an extra layer of
something in there.

Woodley: *The absence of Ann*

Emily: Can that be deverbal? *absent yourself from*

Dan: Surely it's deadjectival.

Woodley: *The absence of Ann* seems syntactically clearly Ann = ARG1.
*by* is harder.

Dan: I'm fine with those being argument taking guys, but do we want
\_absent\_a\_rel in the decomposition.

oe: Any reason to do it?

Dan: I guess I'm going to find some places where I'm not sure if it's a
verb or an adjective, and there will be a sharp distinction.

Emily: But you have to make the choice either way, since you have to
choose what to decompose it to.

Dan: True, but the difference will be smaller.

Dan/Woodley: Different subtype(s) of nominalization\_rel for adjectives.

Francis: *runnable* --- and it's relationship to *run* Which I don't
think we should decompose, but I still want to say there's some relation
between them.

Dan: *retry*

Francis: I can *reretry* so unless the meaning has changed, want to
handle that productively.

Emily: Feels like another jungle.

Francis: The question is how far do we want to go?

Dan: Doing the decomposition of these nominalizations opens that
pandora's box, and we're never going to satisfy people entirely.

Francis: If we've opened the box, it seems that almost as regular and
equally as popular is the causative/inchoative alternation…

Emily/Francis: Decomposition and more argument structure for relational
nouns are separate questions.

Woodley: Seems related to *red deer* from the other day. *performance*
is almost compositionally a nominalization of peform\_v\_rel but not
quite. Why wouldn't you have both? (Schrödinger's MRS.)

Emily: But those were cases where there was something we wanted from
each one? What are the things we want in this case?

Woodley: There must be something because we're arguing about it.

oe: That suggests it must be aesthetic, so why are we arguing about it.

Woodley: Can't tell what's at the bottom of the slippery slope --- ice
shards or…

Emily: White striped no tailed tigers.

Dan/Woodley: We've been looking for those all day. Let's go!

Francis: There is no bottom.

Woodley: Really?

Francis: Every time I've tried to do this in dictionaries, I've never
been able to see how to do it thoroughly. Never happy with the result.
Like I said, I don't think that *performance* and peform\_v\_rel mean
the same thing. By removing the distinction or making it harder to see,
I think our grammar is not better. (Even understanding that we're just
spelling performance\_n\_rel as nominalization\_rel+perform\_v\_rel.)
Worry about antidisestablishmentarianism anti- refers to the specific
movement that disestablishmenttarianism referred to, not fully
compositional. … whereas linking performance to perform, and is
different from performing to perform.

Dan: I was persuaded by your reasoning that if the nominalization has a
different sense, we have to write down a different predicate name, even
if it's perform\_v\_1 v. perform\_v\_3. Why privilege that link over the
link between peform\_v and performance\_n. [WordNet](/WordNet) is about
to do these kinds of links across categories without batting an eye.
Maybe we're better off focusing on capturing the information we can, and
leave this carving up of the names and declaration of the hypothesis to
later or someone else. If there is some well-behaved subset, can
decompose that at a later date. But for now it's not really our problem
because we could imagine that the resource that someone needs to make
the link is one we can supply or point to, rather than making it look
like we have a theory of something we don't.

oe: We had identified another argument that would support that position:
the *by* can mark the ARG1, while the *of* can mark ARG1 or ARG2 as a
complement. If you decompose the noun into something that has the verbal
root, and pick up an *of* PP as a complement, …

Emily: That's skipping at step. The first observation was that *by* PPs,
when marking arguments, can only mark ARG1, while *of* PPs, while
marking arguments can mark either ARG1 or ARG2. We realized this could
be a possible use for RMRS-style underspecification of roles, and then
said that this could even be implemented in MRS by allowing (in external
MRSs) hierarchies of role names. The grammar could give us what we need
if we add features like ARG12 which are then interpreted in MRS-land as
the disjunctive underspecification between ARG1 and ARG2. In some
contexts, other information in the interpretation (such as the presence
of an unambiguous ARG1) will constrain that further, but this is done
externally to the grammar. We then realized that to do this for the
\_performance\_n\_rel representation, we would only need ARG1 and ARG12
as features, as there is (by hypothesis) never any unambiguous marking
of ARG2 in nominal complements. \[EMB notes later: marked by *of*. When
there are other prepositions involved, it can be unambiguous, but maybe
those are different nouns?\] On the other hand, if we wanted to reuse
\_perform\_v\_rel, then we'd have to have ARG1, ARG2 and ARG12 for that
one, because there is unambiguous marking of ARG2 for the verb.

Dan: Not so: Even if they have the same predicate symbol, the verb could
have ARG1/ARG2, while the noun ARG1/ARG12.

oe: pick up *of* PP as complement to the relational noun, is that on the
reading that rules out the agentive interpretation, and we leave the
ARG1 role as part of the general poss\_rel messiness, so maybe all of
that was misguided.

Dan: Not sure I see the objection.

oe: *The performance of the sonata* complement/*The performance of the
orchestra* not complement.

Dan: So far that sounds like religion. I'd like to see the test.

oe: Why do we have both here?

Dan: In general: *picture of me/picture of mine*: *of mine* ---
adjunct/*of me* --- complement.

Emily: But can't say *that performance of me*, so how to we get from
here to there.

Dan: It only shows that there are at least some places where that
distinction is motivated.

Woodley: *the rejection of his/the rejection of him*

oe: *of him* can only be ARG2 of reject and cannot be the ARG1, and so
there's no need for the underspecification in that case (with the
pronouns).

Dan: You haven't shown that.

oe: I'm also assuming that the poss\_rel interoperation is available
from the adjunct parse, which can be interpreted either way.

Dan: If we can do something like *Tuesday's rejection of Bill*

Emily: Does that mean we can't have poss\_rel for Bill?

Dan: *Tuesday's rejection of his was unexpected*

Emily: Sounds fine.

Woodley: Really?

Dan: *him* disambiguated, *his* remains ambiguous.

Francis: I'd like to reluctantly withdraw my objection to *dive by*:
@*The longest recorded dive by a whale* (corpus example) plus lots of
other examples easily turned up.

Woodley: *I've never dove the Hawai\`ian Islands.*

Emily: Choking on the morphology. How about *We finally dove the
Hawai\`ian Islands for the first time*? Still sounds bad.

Dan: Too little too late. (Trying to make *dive* transitive to preserve
the earlier generalization that deverbal nouns built from intransitives
can't take *by*-marked ARG1.)

Francis: No *sleep by*s though.

Dan: The ARG12 is only a cuteness thing. Can still ambiguate in the
grammar. If *of* can't mark ARG1, don't put that in, be happy.

Francis: 21 *nap by*s in 1.9 billion words in the new BYU corpus, but
none are an agent.

Dan: We have *picture of Bill* -- ARG1, or should it be an ARG2.

oe: I picture it as an ARG2…

Dan: Then a violation of the generalization that we never have ARG2
without of ARG1.

Woodley: *That picture by Ansel Adams* --- picture as a deverbal noun
from photograph.

Emily: Isn't that the authorial *by*? Keep the generalization, and say
that picture has only ARG1.

Dan: Worried about difference between *picture* and *depiction*.

Emily: We are capturing just that difference.

Dan: Possible source of bewilderment for someone trying to create inputs
for generation. Will have to always be on the lookout for nouns that
have been verbs at some point. Whether we decompose or not, will not be
able to get the name of the argument right.

oe: Is that almost an argument in favor of the decomposition, in that it
would give us reliable argument mapping?

Emily/Francis: There could be other ways of doing it. In the links
Francis creates, could also link the argument structures.

oe: So what are the strong arguments against the decomposition?

Dan: The slippery slope. How far back to do we go?

oe: The right amount.

oe: Wasn't it the more the merrier where we actually have a systematic
correspondence of argument structure.

Emily: Either way they have to look up in the SEM-I or otherwise, to see
if we decomposed, so can't they see then how many arguments there are.

oe: But wouldn't having the verbal rel be a good guide?

Dan: Someone giving us a generator input for *The performance of the
musicians was inept* would have to know to use poss\_rel.

oe: They'll just get *performance by the musicians.*

Dan: They'll have to look in the SEM-I either way.

Emily/Francis: Then if we have explicit links between the arguments of
the \_n\_rels and \_v\_rels that helps to.

oe: Helps with creating MRSs but not with underspecification. Don't we
want performance/performing to both come out?

Emily: The point about the semantic drift is that that makes sense for
performing/performance, but that we won't be so happy for other
non-productive nominalization examples.

oe: Would be helpful to go through a couple dozen examples and
conceptually try out both universes.

Francis: I can list a few thousand and randomly sample if you like.

Francis: Before that though, completely independently if we decompose or
not, what is the current plan for argument roles for 's or of relations?
Leave them unspecified?

Dan: All you know is that it's a poss\_rel.

Francis: So consumers of this won't get that link.

oe: So far we haven't' been able to find grammatical contrasts that
would force that.

Francis: It's a principled and probably defensible decision, but not
necessarily one that people would expect.

Woodley: If there are no argument positions then you know it's not
filling one.

Francis: But poss\_rel is still very underspecified.

\[ Emily briefly gone \]

Francis: Why does the current grammar ambiguate by adjunct from passive
by. To see the difference to the possessive arguments of relational
nouns.

oe: The story remains the same as in the Japanese relative clause
discussion. There's no reason for the grammar to do it, but the tree
bankers should.

Francis: In practice in DELPH-IN, if we don't ambiguate in the grammars,
it doesn't get ambiguated. I don't see the point of saying that
performance is the same as perform, and that it has the same argument
structure, if you don't tell me anything about that argument structure.

oe: In some cases we can.

Francis: I'm happy to get what I can get, I'd like to keep on the table
the desire for more.

Dan: In a slightly better world you would be happy if whenever you see
poss\_rel, there was a tool that would pop and say tell me if that
poss\_rel corresponds to argument or adjunct.

Francis: Looking the other way: if I could be an argument, I want to
know if it's in an argument.

Woodley: The notion that poss\_rel is underspecified between adjunct and
argument is incompatible with the idea that underspecification is
implemented by subsumption of MRSs. MRS with poss\_rel doesn't subsume
MRS without it.

Emily/oe: Same as the hope of using RMRS to underspecify argument v.
adjunct uses of PPs (more generally)

oe: Valid point, but doesn't invalidate the point about design principle
that we use for deciding the division of labor. We have to invoke
meaning postulates to solve that.

Francis: Worried that if we're trying to make our system more useable,
if there's a very ununiform distribution of what's ambiguated and what
isn't, it'll be unsettling.

Emily/Woodley: So if we're doing it for poss\_rel, then why not do the
same for the other argument/adjunct ambiguities involving PPs?

oe: *Jump in the water in the Pacific NW.* Only the first of those can
be the directional.

Woodley: I don't see which ambiguity is the problem.

oe: This is the reason I think why the grammar ambiguates because there
are cases where we know it has to be one or the other. Adjunct is
specialized to stative and complement to directional.

Dan: *I sent a letter to Paris* either Paris is the name of the
recipient (ARG3 of send) or the destination then it is an adjunct.

Woodley: So why not have an ep for that and just say 'meaning postulate'
to get to those two possible readings.

oe: Three-place send always takes a handle-valued ARG3.

Emily: What about *I sent Kim a letter.* --- three x arguments.

Dan: Don't want to have users see a difference between *I gave a letter
to Kim* and *I gave Kim a letter*. *send* seems a lot like *give*, but
it isn't just like *give*, it's also like *put*. It can't be like both
of them unless I ambiguate it.

Woodley: How about *I wrote a letter to Kim*

Dan/oe: Doesn't have the resultative, while *send* does. It ends up with
Kim having the letter.

Woodley: *I wrote a letter* --- predicate symbol is the same, though the
arity varies.

oe: Three readings, two relevant here: three place write, or two place
write with unexpressed recipient and an adjunct.

Woodley: Seems like an ambiguity that should show up a lot, why bother
putting them both in rather than having some to\_rel meant to be
interpreted as underspecified between these two.

oe: *I wrote a letter to Kim to Paris* in the sense of on the train to
Paris.

All: star

oe: So what's the to adjunct then?

Dan: A perfectly fine modifier of nouns, harder to see just now for
verbs.

Francis: I officially withdraw this topic.

Dan: You're asking us to peal back 20 years of our work and 50 years of
syntax before that.

Woodley: What if someone brings a generator input that has an actually
linked up ARG1 or ARG2.

oe: They get the by variant for the the ARG1.

Emily: and of for ARG2

Dan: I already assert that *performance of the symphony* takes an *of*
complement, which links to an argument (currently ARG1, but rather ARG2
in the new proposal).

Francis: So what does the annotator do?

Dan/Emily: Choose between ARG2 (marker of) and adjunct, if both are
available. (Sometimes grammar disambiguates with pronouns in accusative
case).

Francis: But for possessives?

Dan: Just underspecified. But could ambiguate to possessive or ARG1, but
grammar would never disambiguate. Compare of, where the grammar almost
never disambiguates, so why not do it for the possessive for the
deverbal nouns as well? Could say that the ARG1 marking one is only a
possessive determiner for deverbal nouns.

Francis: Then I think you're giving me everything I want!

oe: I think Dan's already giving you the reasonable requests.

Francis: I only made reasonable requests!

Last update: 2014-02-18 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/TheAbbey_Chrysalis2014DeverbalNouns/_edit)]{% endraw %}