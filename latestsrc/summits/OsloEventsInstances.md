{% raw %}## Discussion: Appropriateness of separately categorizing events from entities in the MRS

Moderator: [DavidInman](/DavidInman) Scribe: EmilyBender

#### Discussion during presentation of slides:

Dan: What do you mean 'exactly the same morpheme'? Doesn't English use
exactly the same morpheme for 3sg present tense and plurals? Same
allophones and all?

David: Semantic similarity, not just form similarity.

--

David: PNG on events? Seems less coherent, even though some language
reuse plural morphology on verbs.

Guy: Does repetitive on verbs/events look more like plural on inherently
mass nouns?

--

Dan: The reason possessive still needs to be there is because of
anaphoric relations like *His reading the book was beatiful, mine was
not so much*. *Mine* is a possessive anaphor (at least analyzed as such
here, rather than something extra), and so it seems like *his* should
still be possessive to help with that coreference resolution.

Dan: Whether it should be definite or not, I haven't thought hard about
that. Possessives usually give a definite.

#### Post-slides

Guy \[channeling Ann\]: Not giving quantifiers for events, waiting for
someone to come up with a good solution that we can use. Having events
in the model is difficult anyway, not sure we want to commit to having
to deal with them in the same way. Same problem that you get when you
quantify over mass nouns as well--in deciding what to quantify over in
the model. You woudln't necessarily need a nominalization is you have
"the thing that's at something" --- quantifying over one of the
(unexpressed) arguments of the "at" event, without needing an
nominalization\_rel in there.

Emily: Maybe simpler to see with the wood gatherer -- it's person
gathering, not the gathering event.

Woodley: Can the event of gathering wood be modified now, or is it only
the wood gatherer is accessible?

David: Oh interesting. *=?i* is a clitic, so maybe that's not a good
test.

Dan: Can it be modified by either *daily* or *tall*?

David: *tall* for sure, not sure about *daily*.

Chris: I think you can in Lakota.

David: But if there's an adjective there, the clitic "moves" ...

Emily: tall-clitic gather.wood?

David: No, not in that structure. You'd get that with daily.

Emily: That's possibly an interesting contrast.

Dan: That difference might motivate keeping e vs. x distinct.

\[ Side discussion about nominalization ending with:\]

Guy: If gather.wood has the event in the hook, and the rule puts the
ARG1 in the hook, that would do it. But that's not nominalization.

Chris: In Lakota, you have *the tall wood gatherer* and *the
wood-gathering tall person* and they mean the same thing. Both are NPs,
either can serve as the modifier of the other. Always head final, but
either can be the head.

David: Pumping rule that turns one into a modifier.

Emily: Or a pumping rule that turns the ARG1 into the HOOK.INDEX.

Guy: The more convincing cases are where we're referring to the event
itself rather than to the arguments of the event.

David: Like Japanese (bonus slides).

Emily: What I want is a clear semantic test for e vs. x. I want the
distinction, but I want a better reason for it than "It makes me
comfortable."

Guy: What is the referent for 'study' in the model --- what are the
studying events?

David: So the problem is how do you quantify an abstraction? We do it
all the time when the abstractions happen to be nouns.

Guy: But it's still hard to pin down.

David: I don't understand why you would be uncomfortable quantifying
over the event student, but the noun study is fine.

Guy: I'm not saying it's fine. It's clear for concrete count nouns where
it's clear what we're referring to, and it's simple in the grammar to
extend this to other, abstract nouns. I don't know the history of when
the line was drawn.

David: No patience for people who reduce things to AI complete. If we
think quantification is real, why can't we extend that to event
variables.

Guy: We need to know what the things are that we're quantifying over.

David: But we don't have the time with instances. *It was a good read.*
*Time is slipping away.*

Dan: Take one of our more trusty quantifiers like *most* --- *most
information was true*. Abstract noun denotes a clump of stuff and we can
talk about most of it. *Most studying of Japanese turns out to be
painful* is fine, but not with verbal gerund. *Most studying Japanese
turns out to be painful.*

Guy: Isn't that syntax?

Dan: Just observing a data point. If we maintain a distinction about
what we do with events and what we do with individuals, I can capture
that.

Francis: If you choose the quantifier *a lot* --- *studying Japanese a
lot*

Dan: *a lot* isn't a quantifier. Give me a real one.

Guy: Defining quantifiers in terms of the structure of NP is syntactic,
not semantic. *most studying of Japanese* seems like quantifying over
the studying events. Could tell a plausible story about wanting to
quantify over events in our model, some of which are studying events.

Dan: So why doesn't it work with the verbal gerund? Just a syntactic
fact?

Woodley/Guy: Yes.

Guy: What's the semantic difference between *studying Japanese is
interesting* and *studying of Japanese is interesting*?

Dan: *Not studying (\*of) Japanese is pleasant* --- also just syntax?

Guy: It also follows from the syntactic types of those two phrases.

Dan: *Not one person showed up for the meeting* --- can put *not* before
something that looks like an NP.

Woodley: *\*Not John showed up*/*\*The not cat showed up*?

Dan: It's hard for some noun phrases...

David/Woodley: *not one* -- *not* modifying the number, rather than the
noun?

David: If you were to underspecify the lexical entry as **i**, the
syntax could specify it down to **e** or **x**...

Dan: Degree specifiers aren't always specialized.

Guy: Two distinct questions here. Can you completely underspecify it?
Can something be both at the same time?

Emily: What's the difference?

Guy: **i** or a type under both **x** and **e** with all the properties
of each.

Berthold: So if **x**s need quantifiers, would **xe**s need them both?

Guy: We should probably quantify everything.

Dan: *The tall boy jumped* --- going to quantify tall?

Guy: If we're going to have variables, we need quantifiers.

oe: In the MRS paper, there's something about assuming existential
quantifiers for **e**s at the top of the tree.

Woodley: Is the top the right place?

oe: No, not always, it's been pointed out.

Dan: Quantifiers for \_all\_ of them??

Woodley: What's so scary about that?

oe: That's the current party line.

Berthold: Makes the representation richer.

Chris: Is there a test for deciding which version is the default when
building the lexicon? Look at *wood-gatherer*, which is it?

David: Yes, there is, and it's a verb (for Nuuchahnulth).

Chris: So that's the test?

David: The article. It's optional except when making verbs arguments.

Chris: I don't have that in Lakota.

Glenn: We leave quantifiers for events off because they're not
interesting in most languages. Is it the case that you want them
explicitly in this language for all?

David: Not sure -- except maybe for **xe**s.

Emily: We know we get scope ambiguities with **x** binding quantifiers,
but do we get them for **e**s? And if not, is that a test or a property
we could correlate with other properties, at least.

Francis: For Japanese we're planning to try the leaving them
underspecified thing.

Woodley: Strawman argument for quantifier ambiguity with **e**:
*Everyone ate.* Not a stretch to say that there's two interpretations
--- everyone ate lunch but it wasn't the same eating event, and another
interpretation where everyone ate lunch together. Maybe semanticists
have other ways of handling the two readings, but it seems like scope
ambiguity is a pretty plausible way to do it.

Last update: 2017-08-08 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/OsloEventsInstances/_edit)]{% endraw %}