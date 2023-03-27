{% raw %}Joshua Crowgey

## Part I

- Lushootseed updates
  - Climb-like metagrammar
  - numerous new features (causatives, applicatives, passives,
possessive affixes, reduplication, ...)
  - now parsing \~50% of testsuite from Lushootseed Reader
- Valence Changing Morphology
  - All transitives are derived (from monovalent unaccusatives)
  - We could write alternate lexical entries for causativized
(transitivized) words...
    - but that's not satisfying
  - Instead treat them like ERG's periphrastic causatives (two
events: original and causative)
- An agent is already like a causer
  - I don't see why, if that's the case, why we need separate cause
events
  - Why don't we unify ARG1 and cause\_rel, in some sense
  - So I build an MRS where the ARG0 is shared by the verb and
cause\_rel
  - And this is where I'm doing violence to the intrinsic-variable
property

Dan:

- so you have one ARG0 and two ARG1s?

JC:

- that's right, but two predicates
- I could go with RMRS, but that would require a rewrite of matrix.tdl

## Part II

- variable types and derivation
- nominals can take subjects, sometimes need TENSE and MOOD
- I could say nouns have a predicative lexical rule

## Questions

Antske:

- \[some group, were at NAACL\] want to put all events on a timeline
(timeML or Red)

JC:

- I don't think I lose information; I have two predications, so their
respective ARG1s are distinct

Antske:

- But I think it becomes unclear

Guy:

- What not just add an ARG2? Leave it unspecified in the default case.

JC:

- I hadn't really thought about that, but ok.

EMB:

- If we are coming from English, we'd demote the original ARG1 to
ARG2, then the new thing becomes the new ARG1?

Antske:

- Do all verbs do this?

Guy:

- Ann has said that we don't explicitly say ARG1 is the agent, so
maybe in Lushootseed it's more like a patient?

David:

- On the second issue (noun phrases).. Do you have to have a
determiner for all of these?

JC:

- I think yes..

David:

- names?

JC:

- Not usually..

David:

- So what happens when we put the determiner thing in front of a
causativized thing?

JC:

- that's a really good question.

David:

- So you're saying that noun phrases are basically verbal.. I think we
should discuss this, because the same thing happens in (...)
- Do you get possessive marking only on nouns, or other things?

JC:

- only nouns

David:

- Even nominalized things?

JC:

- right, so that's one thing to distinguish nouns and verbs; verbs
can't take possessives

Woodley:

- ...prepositions?

JC:

- ...(scribe missed it)

Dan:

- I'm getting used to the idea of one ARG0, but I'm still surprised
about using the same ARG1, why not splurge and give an ARG2

JC:

- It's because it's predictable; i know what the ARG1 of a cause rel
is

Dan:

- I thought there'd be TENSE or ASPECT or some things that can happen
to one of the predications but not the other
- As soon as you do the ARG2, it seems you don't need the cause\_rel

Francis:

- It seems what would make this stronger is a way of telling the
difference.
- The intuition that this describes it better is often hard to
justify.
- Are there any tests where sharing an ARG0 makes a difference? So far
I haven't seen this.

JC:

- The only thing I've seen so far would argue for more than one ARG0

Guy:

- But you've said that there are still 2 predicates

JC:

- but I'm still unclear what a predicate is

## Back up scribe's notes

Antske: Your questions about causatives reminds me about the event
extraction community --- yearly workshop at NAACL. Going with annotation
guidelines that ask people to put things on a timeline. Two separate
things v. one annotated that way. Something to look into, but not sure
if we want to take that over. TimeML always does separate events. For
RED guidelines they don't do that. Not sure yet if the guidelines are
openly published yet. Making the causative the same event is appealing,
but you can't have entities playing a different role having the same
role label for the same event.

Joshua: But different PRED values! Isn't that enough, to give different
interpretations of ARG1?

Antske: If I were to go to a completely semantic representation, I'd say
there's one event with these roles, and then it becomes unclear who's
doing what.

Guy: Why not add an ARG2 with the causativizing suffix, keeping the same
predicate symbol. Just unify in an ARG2. Leaving the other
underpsecified.

Emily: Linking to ARG1 and ARG2 in that case? Do we want to interpret
ARG1 as undergoes and just have the added argument (agent) be ARG2?

Antske: Do all verbs do that, or just a group of verbs? Could say
they're ARG2 only, until the ARG1 gets unified in.

Guy: Ann's already said she doesn't want to attach any interpretations
to specific ARG1.

David/Antske: Can the unergative ones go through causative?

Emily: Is it the same causative?

Joshua: Not clear.

Guy: Does the internal causative only attach to things that are very
patientive to begin with?

Joshua: I've done some empirical grepping, but no generalizations stood
out. Each verb is attested with a couple different ones of these;
moribund language, can't do elicitation.

David: On the second issue of NPs. Do you have to have a determiner for
all NPs?

Joshua: I wonder that too. Mostly yes, aside from proper nouns.

David: Do names get determiners?

Joshua: Not usually.

David: Because this determiner can be put in front of anything, what
happens when you put it in front of something that's been causativized,
and does it differ depending on the determiner? If you treat the NPs as
basically verbal, I think there are some problems with that. There are
still reasons to think that NPs are underlyingly nouny, but it's
extremely subtle.

Joshua: You can tell the ones that are nouny v the ones that are verby
by their morphotactic potential.

David: Possessive marking only on nouns?

Joshua: Yes.

David: Even a determiner in front of a VP can't have a possessor?

Joshua: Right -- that's one of the main criteria for determining a noun
from a verb.

Woodley: Does the causative morpheme go on non-verbs?

Joshua: Transitivizers only attach to verbs; nouns can take subject but
can never become transitive.

Woodley: Prepositions, adjectives?

Joshua: Only two prepositions: one locative and one grammatical.

Emily: I'm wondering if we can Dan to expand on his reaction…

Dan: Getting use to the idea of the same variable showing up as ARG0 in
two EPs, but surprised by the repeat of the ARG1. Why not splurge and
use ARG2?

Joshua: Predicate-symbol specific interpretation.

Dan: What work it the event doing for you, other than serving as a
bookkeeping device?

Joshua: What more work should I want it to do?

Dan: Tense/aspect -- stuff that can happen to one of the events but not
the other if they are distinct? Negation negating one but not the other?
It seems like it ought to be possible to determine empirically whether
the grammar treats them as separate?

Joshua: That only goes one way, right? If I don't find evidence that
they're separate, then what do I know?

Dan: I was hoping you'd find some.

Dan: As soon as you use ARG2, why not just use one EP?

Joshua: I've got multiple different causatives -- internal, external,
out of control, in control. Encoding that with the predicate symbol.

Emily: But those could be intersective modifiers…

Francis: What would make the whole discussion stronger is some way of
telling the different. The intuition that this describes it better is
hard to justify. The one you've seen first or in a nice presentation
will make more sense. Are there any linguistic tests/things where
sharing an ARG0 makes a different prediction?

Joshua: The only types of things I know about so far are things that, if
you find them, would argue for more than one ARG0. Having a single ARG0
constitutes a hypothesis that you won't find them.

Guy: But you've still said two predicates, not just one.

Joshua: I'm still not sure what it means for something to be a
predicate.

Last update: 2016-06-17 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/StanfordCrowgeyIntrinsicVariableNotes/_edit)]{% endraw %}