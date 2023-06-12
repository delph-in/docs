{% raw %}\[For link to slides, see [SingaporeSchedule](https://delph-in.github.io/docs/summits/SingaporeSchedule)\]

Representation of DELPH-IN Pragmatics

- Discourse can improve language processing
  - info str, honorification, questions, rhetoric qs, anaphora
resolution, ...
- Presupposition
  - *Kim has two children that study linguistics* (Kim can
have &gt;2 children)
  - *Kim has two chilren, who study linguistics* (Kim only has 2
children)
- Assertion/Denial (e.g. Chinese ma-questions vs A-not-A); rhetorical
questions are different
- Speaker/hearer and inner/outer frame (w.r.t. quotes and things)
- see [JacyPragmatics](https://delph-in.github.io/docs/summits/JacyPragmatics) for implementations in Jacy
- some unresolved issues that, if resolved, could aid in things like
MT and IE
- two questions regarding implementation: what is the purpose of
"ACTIVATED" feature? and the PRESUP feature?

Emily: this is code untouched in a long time (maybe needs to be
revised?); I'm pretty sure I just copied it over from the ERG in 2001
when creating the initial version of matrix.tdl.

Dan: Used ACTIVATED to block *It, I like*.

Emily: The "ACTIVATED" name suggests it's to do with information
structure, but it's in CTXT which means the connection to the index
involved is lost.

Dan: I think these were added by Malouf from Pollard & Sag 1994, but
hasn't been touched since

Sanghoun: PRESUP is not used in any current grammars, right? (Dan and
Emily: true) I added "SPEAKER" and "HEARER" keys in C-INDICES, and 3 new
HOOK features (ICONS-KEY, SPEAKER-KEY, HEARER-KEY). (Sanghoun explains
implementation of ICONS for showing "addressor" and "addressee" in
quotes)

- "'You have been cruelly used,' said Holmes."

Emily: This looks like progress, but maybe we should use the INDEX
instead of the TOP handle?

Sanghoun: yes, that's one of the problems

(SS gives example of Japanese honorifics "ojiisan ga oyasumi ni
narimasu": this example yields 4 ICONS: addressor, addressee, higher x
2)

Guy: asks for clarification about the honorification

SS: there's 2 honorifications here, toward the old man (ojiisan, oyasumi
ni naru) and toward the hearer (narimasu)

EMB: I'm not too worried about not have the speaker in the RELS, but
rather the IARG2 pointing to the INDEX vs LTOP

Dan: \[defends the current state\]

Dan: concerning MSG, we had trouble deciding how many to put in; I'm
concerned ICONS may be on a similar path

EMB: there's a limit: one for utterance, and one for verbs that embed
the utterance (direct quotation), there's a small number of verbs that
have these constraints

Dan: where do I find this list of verbs?

EMB: This is in the syntax literature, I think, in discussions of root
phenomena. Also could look in [FrameNet](/FrameNet) for a list of
"saying" verbs?

Dan is skeptical of an exhaustive list or reliable diagnostic to find
such verbs, Emily thinks that such verbs that don't involve quotation
marks are of a small number, Dan points out that no one uses punctuation
consistently.

Emily: Still, there's a distinction between direct and indirect
quotation.

Dan: is this a cross-linguistic claim?

Emily: yes, I think this is like negation in that all languages do it in
some way

EMB: I don't think this is the slippery slope of MSGs

Guy: Whats the slope?

Dan: the constructs that yielded MSGs would explode, so you'd have an
MRS with many MSGs floating around, and nobody liked them. Instead we
have a SF (sentential force) feature on events.

Petter: in the Norwegian grammar we have \~114 of these verbs.

SS: for 2nd person pronouns (honorific vs non-), I use the "higher"
relation, where the HEARER is coindexed with the higher

Melanie: I object to the term "higher" because in, say, Japanese, it's
more about social distance than hierarchical relations; it's more
formal. E.g. with my students I'd use "-masu" form, even though they are
not higher.

EMB: it's also stylistic, rather than hard constraint, logical
assignment of social standing

Guy: can't we add a "higher-or-lower" as opposed to the "int"
(intimate), in order to get, say, the German "sie"? (SS: I'm doing that
for Korean currently)

SS: I wonder:

- if the representation I've given is plausible for MT?
- if ACTIVATED and PRESUP are still necessary for our grammars?
- if (something... didn't catch)
- how to represent pragmatic information in grammars?

EMB: I don't know, but I hope, we can represent things solely in the
MRS, but maybe we also need the syntax?

Dan: I don't think we do enough to contrast (1a) and (1b), the ERG fails
to do this. I want to represent the intersective semantics, but also
include new information (e.g. the presupposition).

EMB: Can we keep a separate list for these?

Dan: I'd rather not keep other stuff outside of the RELS list...

Woodley: Remember the example about camper vans? There was a proposal
about how to do this. (see: [AbbeyApposition](https://delph-in.github.io/docs/summits/AbbeyApposition))

Dan: but it didn't involve presupposition.

EMB: do you think having a separate diff-list is better than stamping
some EPs as "presupposed" rather than "asserted"? The tricky thing is
(something about) different kinds of presupposition. How much inference
do we need to do to get this info?

Dan: It's not that you can't say (1b) where Kim has more than 2
children...

Hans: if you want this for MT, don't you need to keep the parallelism?
\[ scribe couldn't follow \].. if one does something here, you need to
make sure it's useful for other things...

Dan: This might help for apposition, like "My brother, the doctor, makes
a lot of money". Right now we don't do this well; it hardly scopes. If
this works out, it makes a case the presupposition may work for other
langs.

David Inman: Can't you have a RELS value "presuppose\_rel" with ARG1 and
ARG2?

Dan: you may be misreading the presupposition as part of the syntax;
it's not a sign or anything like that; it's context.

FCB: what is it we're presupposing? That Kim exists. We're asserting she
has 2 children, and that they study linguistics.

Dan: if I say "My brother, the doctor, is rich" and you contend "he's
not a doctor", that's a strange thing to contend...

EMB: I don't know if these are the most relevant example... maybe "When
did you stop smoking", if you never smoked, there's a presupp failure.

MWG: how about "Kim's two children study linguistics"? (others: yes,
that'd be presupp)

EMB: if I say "both of Kim's children..." and you say "no, Kim has 3
children", there's a presupp failure; the goal is to capture this
presupp. The goal is to calculate all of these presuppositions by
looking at the semantics.

Guy: for relative clauses, could you have a diff in the restriction of
"two", change it's scoping. So "children who study linguistics" is in
the restriction of the "two" quantifier.

Dan: then you say it's like anaphora, as if you'd said it in two
different sentences

Woodley: I think it could be in BODY instead of RSTR

SS: (changing subject) what about different usage of questions? Chinese
-ma vs A-not-A, rhetorical..

EMB: this connects to conventional implicatures vs ... something..

Dan: I'm pretty sure we don't want to include things in the semantics..
e.g. if I say "it's cold in here" to mean "turn off the A/C", that kind
of implicature is not something we should directly model.

EMB directs back to -ma vs A-not-A

Wenjie: it has to do with speaker's bias. if I ask "you like dogs-ma", I
assume you like dogs. With A-not-A, I don't have the bias (simple
asking).

Zhenzhen: it also has to do with the focus. If you say "xihuan bu
xihuan" you are focusing on the verbs... "do you LIKE dogs?", or if you
say "xihuan gou haishi xihuan mao", you're focusing on the object of the
liking.

Dan: this is like tag questions, "you like dogs, don't you?". So if I
ask "you like dogs ma?" can you respond "As you know, I do" (others: no)

Zhenzhen: more like a tag question is -ba ("ni xihuan gou ba?")

EMB: I think the A-not-A is harder; I think the difference is a change
in the focus rather than a strong presupposition. So it's not your
problem. (SS: \*phew\*)

EMB: what about the ne\_rel (in German ne, in Japanese ne; (Dan: in
English, "you'll do that, no?")? ... that was a message rel. What is it
now?

Dan: Just an ordinary EP.

Zhenzhen: (slide 7) I think similar info is represented in CONT and in
ICONS... is it necessary to be so redundant?

EMB: I don't think SPEAKER and HEARER is doing much.

SS: So I think to remove CTXT (Dan: just ignore it, like other grammars)

EMB: I challenge you to do it without the HEARER-KEY and SPEAKER-KEY.
You'll have the relevant info in the ICONS.

EMB: \[Added afterwards, I think this comment was about here in the
sequence:\] The CTXT feature reflects an older conception of how
pragmatic information is gathered during linguistic processing, namely,
that it is done on the backbone of the syntax tree as the semantics is.
I wonder if it would be possible instead to use the MRS (i.e. the
compositionally constructed semantics) as the basis for computing the
semantics (together with lexical information, i.e. about predicates). Or
is there some info required from the syntax that is not reflected in the
MRS.

SS: If I drop CTXT, I don't need HEARER-KEY and SPEAKER-KEY.

EMB: there's also the question of 2nd person pronouns... 1st person is
tied to the addressor, 2nd to the addressee... but we shouldn't be
trying to do that in the syntax; the info you'd need would be there with
the variable properties on the pronoun's indices plus the info about
which clause they belong to to link them up to the right
addressor/addressee in post-processing. (NB: also not identity in the
case of pronouns.)

Hans: it seems dangerous to include presupposition, because the outside
world needs to learn how to deal with it. It seems like an appeal to
involve other people in coming up with a uniform solution, rather than
implementing your own solution that others have to deal with.

\*\*applause\*\*

Last update: 2015-08-10 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SingaporeRepresentingPragmatics/_edit)]{% endraw %}