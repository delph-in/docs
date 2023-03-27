{% raw %}## (Non-Virtual) Linguistic Analysis Design: サ変 --- Verbal Nouns or Nominal Verbs? Under-Specifying Events and Individuals

Moderators: Emily, Francis Scribe: Glenn

### Presentation of data

Let's begin.

Emily: A phenomenon which addresses more than just the language
mentioned. I.e. English, and especially Chinese.

Francis: These things are borrowed from Chinese. They have a verb with a
light verb

\[see Slide \#?\] "I Study-Japanese-do"

1. Wrap it (in a nominalization-rel)?
2. It's really a noun, sometimes we'll make it verb-y
3. Underspecify, allowing follow-on app to treat according to greater
context.

\[see Slide \#3\] (You can be more or less verby)

1. Tanaka NOM Japanese ACC \[study do\]
2. Tanaka NOM Japanese ACC \[study\]
3. Tanaka NOM Japanese ADN study ACC do

Dan: "Tanaka does Japanese studying" for the third?

Francis: It takes normal arguments when it's a heavy verb.

\[see Slide \#4\] note: 3rd example should be 'star'

\[see Slide \#5\] (Arguments get linked)

\[see Slide \#6\] (Arguments can change)

\[see Slide \#7\] (There can be some indirection)

Francis: Current analysis is unhelpful because it goes through
nominalization twice

Emily: If "study" is verby, you might be able to latch on to a
difference between the 3 examples, and we sabotaged ourselves with the
latter part of these examples.

Guy: Nouns can take arguments too, so how will you differentiate those?

Emily: I'm hoping for the best, that there will be \*any\* difference
between these.

\[see Slide \#8\] (There can be interaction)

\[these two examples are very close in meaning\]

Francis: there can be a coercing difference between the two re: event

\[see Slide \#9\] (You don't need a lot of support)

\[see Slide \#10\] (It's not just transitive)

Dan: give a noun-y thing for the third example:

Francis: "My hobby is \[retiring for the night\]"

\[see Slide \#11\] (More interaction)

Emily: You can use the verb to-go with a locative or infinitive.

Dan: Can you do a noun there?

Emily: not quite

Berthold: (question about CASE)

Francis: Bottom one cannot take genitive

Guy: What does it look like for a 'normal' verb?

Emily: Yes, you can do it.

Guy: But other words wouldn't use the *shi* infinitival light verb

Emily: Yes, exactly, this slide shows the difference between the two
situations

Francis: The 'normal' verb has to be put in the infinitval.

### Questions for the group

\[see Slide \#12\] (Things to discuss)

Francis: For MT, I spend a lot of time drilling down through the
nominalizer wrapper... Currently treated as inherently verb-y. But it
doesn't really behave like a verb without the support verb. I'd like to
say its underspecified (option 3, above). Does the MRS model always have
to be specialized all the way down? If it's noun-y, we're kinda
suppressing an argument. How do we implement that? If it's verb-y, when
do we put the nominalizer on, and do we always want it there. With verb
wrapped as a noun, wrapped as a verb, gets murky.

\[goes to online parse about Tanaka, \#1\]

\[next demo, with *no*, JACY loses the link and it's not clear that
Takana is doing the studying, which is way wrong\]

\[another bug-reading has "Japanese" doing the reading\]

Luis: How would/does ERG handle deverbal like this? (the Rome examples:
*X's destruction of Rome*)

Dan: I don't do deverbal like this. Destruction\_n\_rel is unrelated to
destroy\_v\_rel. And did I mention, totally unrelated. By the way, it's
totally unrelated.

Francis: The question here in Japanese is similar but not parallel.
There is a special class that really is more noun-verb balanced than the
*destroy* examples.

Dave Inman: why is *Tanaka* the subject of *suru*...?

Emily: It is not behaving as a subject-raising in the best current
example. What's exposed to us is the index. It is possible to build an
analysis where we do nominalization and also...

Luis: I don't understand the difference between two examples (speaking
Japanese) Theoretically, you, um even.. if you basically mark any of
these *suru* nouns, I see this now... You always force a nominalization.
Can you link this noun to *suru*?

Emily: It is possible to build a grammar where we treat *suru* as a
control verb, instead of raising. I'm not sure that's desirable.

Luis: Why not?

Emily: Because I don't think the nominalziation makes sense, so there
are two problems.

Luis: But I see it as a noun the undergoes verbalization rather than the
opposite...

Francis: If it's a noun, where does the argument structure come from?

Emily: And where would the CASE frame be carried?

David: And *suru* can't assign the case frame?

Francis: We could have several *suru*s

David: We don't have the machinery to assign case frames? Do we?

Guy: In this particular case, *suru* feels quite verb-y.

Emily: Here, the case frame is lost in the noun use, currently.

Francis: (refers to the 'star' example on slide \#4)

Luis: It's a style of writing

Emily: No, the grammar hasn't said noun-y, it's just...

Luis: Where's ACC

Emily: It's there...

Luis: can you have (speaking japanese)?

Emily: Yes

Guy: You don't have the *wo* here

Rebecca: It is there, but it's marking something else

Dan: So you created one set of unwanted elements... Inventing a CASE
frame...

Luis: You'll find many cases where a noun can be a noun unless...

Francis/Luis/Emily: Side discussion of *-na* adjectives in Japanese,
which are in fact adjectives and not adj-noun hybrids (according to
Francis and Emily).

Dan: Can we at least visit the 3rd proposal, which is by far the most
interesting: Lexent says I don't have an opinion about all this, I
supply a CASE frame.

Emily: I think that brings us to bullet point 6 on "things to discuss"

Dan: Nominalization doesn't come into the picture. *suru* just "does
what it does."

Francis: when it's behaving, *no* can behave like ARG2 of a noun?

Emily: So they get a verb-y case frame, nominalization rule doesn't put
in the rel, instead specializes to 'x'; alternatively *suru* combines
and "I see your case frame"...

Dan: Yeah that's all part of the general process that happens with verbs

Emily: These are the relevant cases (slide \#7). (begins to walk through
Dan's idea)

Guy: Is there a situation when you can, in a noun-y context, use this
kind of verb and then also use a infinitive (?) verb?

Francis: probably not. I don't think that is an infinitive verb, really.

Emily: It seems strange to say that all verbs are not verbs unless the
surrounding context says so..?

Francis: There has to be a transformation before it can be noun-ed.
(cites Japanese example) (to Dan:) I think Guy's saying fact of being a
verb is underspecified..? They can't take the adnominal alternation
shown on slide \#3 either.

### On non?-distinction between e and x

Stephan: We've gotten used to the notion that eventualities are not
quantified. There are properties that are appropriate for 'e' and not
'x' or 'i' and vice versa. A long time ago, didn't EPs have both INST
and EVENT features?

Dan: I don't remember. No memory of this.

Stephan: We could have two variables associated with...

Emily: We've seen some cases where we are injecting nominalization and
we don't want it, what about the reverse, are there cases whee
nominalization actually does some work for us?

JoshuaC: I have to switch to 'x' to get PNG features that I happen to
need.

Dan: Is there ever a case where you want to mark i.e. ASPECT and NUMBER
on the same entity? I suspect Joshua...

Joshua: Yes. That's one thing I could do is merge 'e' and 'x' ...
elevate the features to a common point in the type system...

Guy: But you'd have to quantify the 'e's at some point to preserve a
proposition that you can evaluate.

David: 'x's for things that are names, can never be events.

Glenn: yes, names are uniquely reified entities

Guy: we could deploy a type hierarchy with all mixtures of i, e, x in
the hierarchy.

Emily: yeah, x for when you definitely have i.e. ASPECT and NUMBER. We
have properties, relations, and individuals. This is where xs and es are
really different. But maybe it's just what I'm used to; can't quite
figure out why I don't like this idea.

Dan: It could well be that, in practice for this language, context
\*will\* always happen to result in delivering an e or x.

Emily: Doesn't seem to be the case for Lushootseed.

Dan: nonono, you simply get what shows up (referring to
verb-underspecification idea). We're not drawing this x-e distinction,
we're just going to "absorb" what's going on. Instances are not the same
as events, but the objects in the grammar don't have an opinion about
this. I need an e to anchor a proposition.

Francis: Are we talking about syntax or semantics.

All: Semantics.

Francis: (Compares standalone NP predication to "proper" predicate and
asks Dan if they're the same)

Dan: Out of my wheelhouse.

Woodley: If you don't wrap in the nominalization rel,... "Emily skewered
going to the creamery again"

Emily: you can get verbs that are coerced into nominalization

Dick: I think what Dan was trying to get to in e vs x, seems like all we
have is context to push the existential committment. "A book" on its own
is not triggering a context, however, "There exists a book" it's not
clear that you want to wrap that in an existential context. The latter
should really be \*not\* introducing any context or you'll be landed in
no end of trouble.

Valeria: Weren't there practical reasons for wanting *destruction* to be
related to *destroy*? Why shouldn't the ERG do this? Is there a
philosophical argument...?

Dick: A lot will be "identity criteria" for events. They have weird
properties with regard to time. A individual can change properties over
time, but an event cannot because otherwise it becomes a different
event!

Emily: interesting, where do we read?

Dick: Davidson.

Guy: Ann has mentioned that TENSE is an identity criteria for events.
i.e. German ("The erstwhile green lawn is now brown.")

Francis: We're not destroying the n-v distinction, we're discussing
where to put it. We'll still be specializing most of the time. But maybe
the lexicon doesn't know a-priori. It's interesting whether the context
will \*always\* be there.

Emily: That's the conservative interpretation of this discusion so far.
The more radical one is that 'e' and 'x' shouldn't be distinguished in
the semantics, either. We still don't know why nominalization might be
an important distinction to maintain...

Francis: can Luis recall the Chinese example?

Luis: (cites example)

Dan: No no no, those examples are not probative.

Berthold: "normal verbs" have certain aspect markers. One form is more
verbal (Speaks Hausa) masculine, genitive, but argument structure is
exactly the same, so you regardless of morphology, there are events that
take the same number of arguments and don't care about the nominalized
forms they may absorb.

Guy: If there's gonna be separate nominalization rel, there should be
some kind of scope inserted.

Emily: Yes the rel puts a place to hang the quantifier. *Going the the
creamery every night is not a bad idea*. If there's a reading where
*every* has to be able to scope down into the nominalization, we need a
qeq there and nominalization\_rel is giving it to us. (Not sure if this
example is the right one to motivate that, though.)

Dan: *Not swimming pleases me*. *Not* combines with e. Swimming is
doomed to be an e.

Emily: I think that's separate and interesting, but not my argument.

Dick: Actually *not* is not a thing applied to 'e', it's a thing applied
to propositions. I don't think it makes sense to say that it targets a
different kind of thing. I think *not* triggers proposition-hood. At the
level of what kind of thing does a noun refer to, there are interesting
tempero-spatial properties, but the bigger huge thing is what kind of
proposition.

Dan: *Every destruction of a monument angered the Middle Eastern world*:
*Destroy* can head a proposition, *destruction* cannot. Pretending it's
a proposition can't be enough. That *Not swimming* is not made event-y
can't be true because we need a place to carry compositional stuff.

Dick: Is that point semantic or syntactic? It does seem that difference
between using a verb vs. noun form depends on what you'e trying to
express.

David: can I propose that what bothers Emily about merging 'e' and 'x',
is that, in the syntax you are eventually get down to the point where a
role needs to get filled. But grammars differ about preference for where
this happens, whether something's a predicate or not.

Last update: 2016-06-21 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/StanfordVerbalNouns/_edit)]{% endraw %}