{% raw %}## Improved representation of semantics of tense/aspect in MRSs

Leader: Dan Present: David, Rui, Glenn, Guy, Berthold, Joshua, Emily,
Bernd, Ann, Lars Scribe: Emily

* * *

Back in the Verbmobil days, Jacy, \[gig\], and ERG and used a semantic
representation much like Francisco's representation (Reichenbach-style).

Moved away from that because of generation considerations: can't easily
underspecify the number of EPs --- if you didn't know if you wanted a
perfect, didn't know how many EPs to put in. It was also becoming
increasingly annoying to have extra EPs around that got tangled up in
the scope trees. They don't really seem to have a home anywhere in the
scope tree --- kinda like the \_d\_rels in the ERG (information
structure). Don't really have a truth-conditional set of constraints,
don't play with scope directly --- was annoying. cf. Francisco's
conundrum that came about because he needed to worry about the scope of
these things.

This all goes away if one combines with the elegance of the
Reichenbachian account with the machinery of ICONS.

*Kim had gone to the party.*

Two temporal precedence relations --- would have those same two
constraints on the three time points, but they would be two pairwise
constraints on the ICONS list. Number of EPs doesn't change. No more TAM
features on the event variables, either. Believe we can map the ICONS
into some application semantics at least as easily as we currently do,
and also have a nicer analysis of language to language mappings.

Doesn't magically solve the Laurie Poulson problem (cross-linguistic
variation), but removes the problem of many current grammars where they
carry along very obviously morphosyntactic, language-specific info into
the semantics (with TAM values).

Joshua: e has internal values or R, E, S

Dan: no, just events --- and we won't be careful about difference
between events and time. Talk instead about speech times and actual
events.

*Kim sings*: ICONS &lt; e t-includes s &gt; … where s is the speech time
is a constant, supplied by some external context.

Emily: For our purposes, it's just a distinguished symbol.

Dan: Like what Francisco does with something like utt\_time.

Berthold: The generator will just call the unix date function…

Dan: Unless you're summarizing a newspaper article.

David: Is this a specific case of something more general? Perhaps the
general case is that you have propositions with meta-data associated
with them, which is important for inferring truth. Time might be one,
but there are other things like assumptions, beliefs, falsity. We're
trying to generalize that into an approach in which there are many ways

Dan: Not just one of those: Time is crucially an element that many
languages impose interesting and surprising morphosyntactic constraints
on. And as we build a sentence can learn a lot about the speech,
reference, event time. This means time is of heightened interest to the
grammarian --- the grammar imposes tight restrictions on the
interpretation, no matter what else is in the context.

David: Your original motivation was that the MRS is getting cluttered up
with stuff. Maybe it's worth thinking about MRSs about propositions and
MRSs about other things.

Emily: MRS isn't a general way (for us) of representing propositions,
but a way of representing sentence meaning.

David: It is false that Kim left. --- is there negation somewhere?

Joshua: No --- that's not a negated sentence morphosyntactically.

Dan: There is a clear point of mutual interest in making linguistically
expressed information compatible with other information. But the
inside-out grammar-driven approach means that the MRS that comes out of
the parser should be as lossless as possible a representation of what
the morphosyntax of the sentence is saying about the meaning.

*Kim realized that Sandy was crazy* --- can infer that Sandy was crazy,
and that's something about the meaning of *realize* contrary to
*believe*. In a more sophisticated representation we might want to put
that kind of stuff in, though for now we've pushed that kind of
information out to someone else. We haven't lost the information though:
the MRS is sufficient to detect that.

We're in some deep sense lazy. Trying to do the least that we can
without losing information to try to get from the string to the meaning
representation or vice versa, and do no more than that because it's
already hard enough.

David: Not saying you're having to, just that your representation should
make it possible for someone else to, and that time is similar to other
kinds of metadata.

Glenn: I don't think it doesn't solve the Laurie Poulson problem. A big
problem of tense and aspect is to expose it and make it normalized and
visible. That goes a non-trivial ways towards wrangling it down,
especially with Thai which has a very enthusiastic aspect system, which
I've been struggling with expressing in substructure (and the associated
rich vpm). I heartily agree and think it's fantastic.

Dan: Hadn't thought about how the ICONS approach allows for the
definition of a little type hierarchy.

Emily: Pushing more into ICONS will bring more urgency to the questions
of how generation, transfer etc are treated.

Glenn: agree does it now.

Dan: Where's the spec?

Emily: I was busy doing the schedule last night…

\[various\]: discussion which engines have it, when PET will

Dan: The next steps in exploration that Francisco & I talked about
yesterday will be to take a copy of an mrs-comp grammar and experiment
with a version of that with ICONS for tense to create minimal examples.

Emily: How about using the mini-English grammar from the customization
page?

Dan: Okay.

Ann: Does it have auxiliaries?

Emily: Can check --- but if not will be easy to add.

Dan: Goal is: To come up with a good first past hierarchy of icon
subtypes for tense that works for Portuguese and English.

Emily: Trying to be interlingual?

Dan: Not fully language-independent theory, but trying to at least think
of more than one language as we do it. Expect a vigorous market exchange
in the types of these icon things.

Berthold: Worried about French/German differences, is there going to be
a mailing list.

Dan: Wiki page, with discussion. Don't try to do everything to a level
of interlingua.

Emily: Avoid mistakes and spurious different names for things that are
the same (Dan: e.g., before and after relations in the same grammar or
in different grammars), but still allow different grammars to have
different sets of these.

Dan: inclusion, proper-inclusion, overlap, precedence --- think of names
and stick with them.

David: …

Ann: There's a difference between what you want to use for temporal
logic and how you want to build the representations. There's probably a
mapping between them.

David: ? That might be a source of names.

Dan: Yes, worth looking at that.

Dan: A consequence of making this move is that grammarians are going to
have to do more thinking about tense/aspect temporal relations as they
build the grammar. So far been able to duck that problem, just writing
down what the morphology says. Will now have to go back and think about
what each morphological structure has to say about the interaction
between those elements. Presumably it's the grammarian in a good
position to do this, in a way that an MT person might not be able to.

Emily/Berthold: What about sequence of tense?

Dan: Francisco is doing it in Portuguese with ?some special EP and said
he'd need to think about how to migrate that. Not trying to do
everything about it, but where the grammar has something to say about
it, recording that.

Berthold: You might get disjunctions.

Dan/Emily: Ambiguity, underspecification.

David: Taking all temporal information about the MRS and putting it into
ICONS.

Dan: Clarifying: ICONS lists are now an inherent part of an MRS. But I
am taking this info out of the RELS list and relocating them to ICONS,
and my strong hypothesis I want to do all that movement out. In fact,
right now they aren't in my RELS list as EPs, but rather as variable
properties.

David: Is it going to be dangerous to have temporal information in two
types of places.

Ann: Things like *today*, *now* that provide temporal information is
staying in the RELS list.

Dan: *Before Kim opened the gift, Sandy made a speech.* There's temporal
information in there, but it's a whole clause, not moving it to ICONS.

David: So you will have temporal information in two places.

Emily: And this isn't a bad representation of what language does ---
tense and aspect systems are linguistically very different from
lexical/periphrastic ways of talking about time.

Ann: Does any language have *now* as a morphological marker?

Joshua: Lushootseed does.

Emily: But it doesn't fail to have *On Kim's birthday*.

Dan: What about *right now*.

Joshua: The thing glossed as *now* is used to emphasize different time
from previous sentence.

Dan: So you wouldn't be surprised if there was also a lexicalized way to
talk about now.

Emily: Are we mixing truth conditional and non-truth conditional stuff
in the ICONS now?

Ann: tense info is not truth conditional in the same way as we usually
talk about it.

Emily: What about a model with a representation of time against which to
evaluated *Kim is here* --- if Kim was but is no longer here, then that
should be false.

Ann: Yes there is information in there which affects the truth
conditions, but the information that's not in ICONS is the sort of thing
which we're using to construct a logical expression… I guess what I
think now that's maybe wrong is that the info in ICONS isn't needed at
all in construction of the logical expression, can be added later,
completely afterwards. That's not true about the HCONS and RELS. those
all interact in an intimate way with the construction of what the actual
logic says. THe ICONS can be added later.

Dan: They will further constrain the truth conditions. That also applies
to our use of ICONS for anaphoric binding.

*John saw him.*

Principle A says that *him* can't be coreferent with *John*. That's
surely important for the truth conditional interpretation of the
sentence.

Ann: I think I didn't mean truth conditions, but rather the building of
the logical form. Yesterday I was thinking that with contradiction
examples like *Kim is an aardvark. Kim is not an aardvark.* ICONS
wouldn't affect those … but I think that's wrong.

Dan: It's also the case that while we were thinking of them earlier, we
were thinking in terms of info-str constraints, where we really do think
they're not about truth conditional properties. But we have grand
ambitions.

Emily: Does it matter that we mix them together?

Ann: Doesn't really --- could split into two lists, either in the
feature structure or in the extracted MRS.

Dan: I hope we don't need to separate them in the syntax. Like
Sanghoun's pointers into ICONS for CLAUSE-KEY and ICONS-KEY.

Joshua/Ann: Simplify ICONS/HCONS to just CONS?

Dan: It's true that they're both just accumulator lists. Seems like it's
just a matter of convenience. Would still be nice to not break ability
to check for well-scoped MRSs if we have less-well-behaved ICONS.

Ann: Presentationally probably better.

Dan: Probably also better for backward compatibility.

Emily: Also more convenient for anything that actually has to interpret
the things on the list (e.g., HCONS and ICONS function differently in
generation).

Berthold: One more thing to keep an eye on is to have the web demo do
the right thing with qeqs --- will want the same thing with the ICONS.

Dan: Better off not creating trouble for ourselves while we're doing the

Ann: Are we thinking of introducing any elements into which are not
elsewhere in the MRS?

Emily: speech time.

Ann: That's a constant --- what about variables?

Joshua: reference time, event time?

Dan/Emily: Event time is represented by event time.

Ann: Speech time/reference time is constant.

Emily: True for reference time too?

Emily/Dan: There can be more than one of them, but we don't need to
quantify over them.

Emily: \[reaching\] *Every time Kim tells me Sandy left, it's a lie.*

Dan: Not a quantification at the level of MRS/sentence meaning.

Ann: *Sometimes Kim laughed.*

Emily: Even if the analysis of *sometimes* is decomposed, it'll still
introduce an ep on this view.

Joshua: Lushootseed has a morphological marker for repetition.

\[various\]: aspectual operator, not quantification.

Emily: habitual and similar --- are these binary? Alternatively: are all
ICONS elements necessarily binary?

Dan: Maybe not move everything to ICONS --- leaving those aspect-y
things in the RELS. Seems like there's utility in keeping the binary
hypothesis.

Ann: Another way of thinking about this is that there's no problem with
representing unary properties as event variables.

Emily: Then this isn't solving Glenn's problem in Thai at all.

Dan: Didn't claim to be.

Berthold: Handbook of French Semantics discuss treating imparfait via
additional hypothetical S' … so don't make E, R, S closed list of
constants.

Dan: Let people try hypotheses.

Ann: Doesn't matter how many things are on the lists, as long as you
don't expect anything to interpret them.

Dan: That might be true for S', but I do very much want to interpret
past v. present so that I can generate just the ones I want.

Ann: Not talking about literal consistency, that we can check --- rather
interpretation. Checking inference is a different matter.

Joshua: The relations within an icon is three things: E&lt;&gt;S,
E&lt;&gt;R, R&lt;&gt;S.

Dan/Emily: Each time I introduce a tensed event should expect up to
three separate icons.

Guy: Only two, right, to get all three fixed.

Dan/Emily: The language might actually be talking about all three pairs.

David: As part of a grammatical analysis do you need to know if temporal
information is consistent or inconsistent? If you do need to know that,
doesn't that mean you have to have unification of those temporal
relations?

Ann: We assume we can't try and block *Yesterday I will go home*

Dan: Maybe we could…

Emily: You may have languages with the grammaticized tense/aspect system
has a few separate parts which can jointly either lead to more refined
information (remote past v. just past) or parse failure, so long as we
maintain pointers to the ICONS list with the domain where that
grammaticized tense/aspect is being built up. This doesn't preclude
analyses where each tense/aspect thingy introduces its own icons.

Dan: Francisco and I will make a wiki page and put up what was done yet
(within the next week or so), and then will make that page public at
some point (can't yet say when, but probably after playing with the mini
English grammar and maybe talking with the processor developers).

Guy: A lot of languages bundle together tense aspect and mood. Is that
beyond what you plan to handle?

Dan: On Tuesday quickly mentally ran away from issues about the
representation of mood. We use it in *Kim demanded that we be on time*.
and similar selection restrictions. Happy to leave mood as a property of
the event, leaving tense and aspect out. Not closely connected to
Reichenbachian account.

Emily: Interesting that we're looking to draw a line between three
things that languages often conflate in their morphology, but mood
(modality) seems much more closely related to logical form construction,
and I doubt that in English at least this will lead to problems.

Dan: You're right that I'll have a feature structure on event anyway.

Emily: Want all the aspect in one place, even if some of it is
one-place.

Ann: If you can find a place where it actually makes a difference to
have a unary thing in ICONS instead of as a feature, that would be
interesting to see.

Last update: 2013-08-02 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SaarlandTense/_edit)]{% endraw %}