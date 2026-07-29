{% raw %}Moderator: Liz
Scribe: Emily B. (EMB)

* * *

Dan: Naming of functions -- it seems that there's never going to be a happy answer to that, but you might interpretability by having a name and then a small set of example phrases or sentences that are incarnations of that. If you have "object_of_verb" then include an example of a VP with verb + object and label the two. Likewise for figure/ground it would be useful to have an example that connects specific word in an example with each of those concepts. Entrypoint from text they understand to terminology you are exploiting.

Liz: Figure/ground is a good example --- tech terms which have definitions that can be explained in documentation. Would love to avoid calling it verb+ARG2 ...

Dan: But you don't care about active/passive unless you're going to include info structure.

Liz: I care because if you're going to say verb and object, that is not what is happening. I am plugging the ARG2, which may or may not be the object.

Dan: It's notionally the object. In the canonical "We eat cake", the cake is the object; no confusion, even if we can also say "Cake was eaten by everyone". Not talking about syntactic labels here, but notional ones. Want to help the user understand the labels, so ARG2 is canonical object. "The frosted cake" ... the cake is still the notional object in the event of applying frosting. If you move away from thinking of those as labels that correspond to what's happening in the syntactic structure but rather coarse-grained notions, not scientific terminology. Give 2-3 examples and say the one doing something actor/agent/arg1 (even though these sometimes break down as in "Mary resembles Bill"). Look for greatest good for the greatest number.

Dan: Relative clauses is a lot harder, because rel cl are harder. ARG1: "The person who ate cake", ARG2: "The cake (which) we ate". The element not actually realized in the relative clause. But you didn't include the possessive one: "The person whose cake we ate". You want to build something which can be extended. Appreciate the challenge you face, trying to give names to the ways English can compose things together. Cambridge Grammar of English 1800 pages, provides names for lots of things but not all of them. So set a more modest goal and look for reusable names in the simpler domains you are working with, not trying to solve the whole problem.

Liz: I initially called my rel cl functions subject and object rel clause.

EMB: Pushing for that to keep it clear that Liz's work is building semantic representations without the scaffolding of syntax.

Ann: If you've got something that could either be ARG1 or ARG2 relative clause, you've got the bits that you're going to use to compose that. Can you detect if it's going to be ARG1 or ARG2 and just have the user say relative clause?

Liz: Hard to visualize relative clauses in my mind. If you've got "eat" and "cake" couldn't cake be either ARG1 or ARG2.

Dan: Easier with "see" -- "The person who saw me"/"The person I saw". Don't have enough clarity about how you're building that up to know when you have to know hich of those indices you're going to re-identify.

Ann: Echoing Dan. I feel like I don't know enough about the input you're assuming in order to be clear about some of these questions, including that one. Would the input distinguish between those two examples that Dan mentioned in some way, and a way that could be automatically translated into ARG1/ARG2 relative clause.

Ann: Do you have a notion of what's modifying what in the underlying representation.

EMB: Would help to have an example with a relative clause so we can see how much info is in the underlying rep.

Liz: The SCL -- building an architure around it with lexicon infra where I can specify what functions I want to call. In the ideal world, the library stands on its own and you can just sit there and build things up without any graph, building reps by hand. Don't know why anyone would want to do this out of thin air like this.

Liz: There are some cases where I do make guesses about what needs to be filled in with heuristic constructions. Might be useful in filling out a lexicon. Could try the same thing with relative clauses, "do your best and about which thing needs to be filled in".

Ann: Either it is known from the input, or it isn't. And if it isn't then you want both.

Liz: The only example so far "the player who found the bottle". I knew I wanted the relative clause to be an ARG1 type ("who found the bottle").

EMB: I like the idea of a heuristic that calls the other two functions, so you have the full flexibility, and might be able to hide the confusing names from the user.

oe: How general/specific -- they should be as general as you can make them (a bit like EMB). They should be as general and as free of syntactic/grammatical knowledge you can make them. For relative clauses, where do you need to make that distinction. A rel cl is a kind of modifier structure. Input "cake -> tasty -> costs $10" The relation between cake and tasty, and that can be expressed as attributive adj or a a rel cl: "The tasty cake" and "The cake that was tasty". MRS should be the same. Why do you need to distinguish between the grammatical construction?

Liz: Have those functions because dataset has examples like "The player who found a bottle" and "The berry that wasn't eaten". Those graphs I was turning into referring expressions, where the end result is an NP headed by player or berry. In another world it could have just been "The player found the bottle". The rel cl only came up because I was trying to describe the player.

oe: One's a proposition (the player found a bottle) and one's a nominal thing (the player who found a bottle)

EMB: They don't just come out, because of variable property info. But also, I think with verb-headed relative clauses requires more work; doesn't just come for free with modification rules. 

Dan: Exploiting "untensed" for trigger rule control on getting the copula to show up. And the VPM is probably assigning a default value, probably getting untensed when underspecified. Could fiddle with that, and relax it.

oe: They're not perfect paraphrase in the distinction on the variable property. One says untensed, one says tensed, but there's a generalization over the two that could be used as generator input.

Dan: But it's blocked by the semi (vpm).

John: Liz could choose to give unspecified for unspecified or tensed.

Liz: I don't specify that.

oe: Ordinarily, a provider like Liz shouldn't have to think abotu this.

John: Liz is doing the interface for someone who shouldn't have to think about this. The user should be able to say something like "I don't want a relative clause" or put the focus on "tasty".

oe: Tension between not having to do more than what you have to do to get generation out vs. control over what's generated.

Ann: Meta point -- Liz wants to get this done rather quickly, don't want to suggest things that make that take longer.

John: Could be in the discussion about where this should be located, in Liz's work or the ERG.

Ann: I would say just drop the relative clauses.

Dan: But then you wouldn't be able to express "The bottle somebody found" because that can't be a prenominal modifier.

Ann: It would be less expressive, and it would be clear what one would have to do to make it more expressive, but that would require a graph notation that makes it very clear whose modifying what. Seems reasonable, but beyond the scope?

Dan: I could find a more generous mapping for the filled-in values and that might give a broader range of values, and might make relative clauses start working.

Ann: That's the step I didn't see.

Dan: What's different about "The bottle somebody found" is that her machinery would need to identify the label of _find_v_1 with _bottle_n_1. The generalization is because it's a modifier, same as what we do with tasty.

Ann: The generalization is about what modifies what, and if we can assume that's in the input then good. And if we can't then we're lost and can talk about it in discussion.

oe: I think my question was aimed at making the generator maximally robust, so that hte provider of these inputs doesn't need to think abotu unnecessary nuances.

Ann: I think it's correct that the provider shouldn't have to think about whether it's a rel cl. I do think it's correct that any input that's semantically flexible has to have some notion of whose modifying what. I don't think it's a syntactic property, even though I use the word modifier. In this case the syntactic term that we use is taken from fairly general language use.

oe: I heard that as semantic modifier.

Ann: That distinction is something you wouldn't expect the user to know about, but it does track with general language use in this case.

oe: the underlying q is something we've discussed often in using the ERG to generate from MRSes after generation. The conflict between control vs. robustness to (uninteresting) variation in the input. I think we had gotten to the point where if the label is underspecified, then get the relative clause.

EMB: Really? I don't think we let the generator play with additional identities that aren't in the input.

oe: There are three entities, two relations, the who does what to whom is clear. That's what the provider should have to worry about. "The bottle Dan said the player found arrived." Find is the modifier is on the bottle, but the shared label is with say. I think we had been pushing in that direction.

Dan: But you're optimistic than I am about how far we got in that game.

Ann: For background, always had a trade-off between efficiency and expressivity. I don't think it actually affected labels, but would depend on what happened with one of the efficiency mechanisms. Not an inherent thing about the generator, various versions would have allowed for that, but we might have stopped that from happening because we wanted to reduce the search space.

Dan: In our next convo, you and I could talk about getting the generator to produce both "The cake which was tasty" and "The tasty cake". Right now not being introduced for a not very interesting reason. Worried will also generate "The cake that was/will be/has been/has been being tasty". So maybe fix default values for tense and aspect, but not for tensed/untensed given existing feature reps. Will get very long list of outputs... I don't know if you also want "The cake that has been being tasty."

oe: Isn't that beautiful and then the realization ranker just picks the most natural one?

John: "Just" is doing a lot of work there.

Spencer: Eric woudl say in the game world we would want to choose the tense based on what is happening.

John: Could you say if you want non-tensed than it can't be a relative clause, if you don't want tensed, then give me the value and I'll generate a relative clause.

Dan: Not always true: "The cake available to the client" --- untensed, but relative clause.

EMB: Is that actually a relative clause?

Dan: Treated as a reduced relative clause in the machinery, same as "The cake seen by Mary". In "the available cakes"/"the cakes available", one is prenominal modifier and one is a rel cl. As oe is rightly pointing out, there is no difference in those MRSes, but as soon as you get to verbs it gets a little more complicated.

Spencer: Could focusing on non-tensed rel clauses reduce this work?

EMB: I think that would cut out some, because some rel clauses have to have tense.

Dan: Participle headed ones.

Liz: A good point brought up: all I need to know is who is doing what. I know I have a player, there's a bottle, and there was some finding going on. I guess rel clause is a terrible name for that function. What would you call that relationship? There's some modifying happening, where the modifier is this situation of find a bottle.

Dan: I would like to think that you could move towards just calling it a modifier. A couple of points along that continuum.

"The found bottle" - _found_v_1, passivized to fit there. As long as you know that found takes the bottle as ARG2 (different from big, which uses ARG1). But it's picking out a subset of bottles the same way. Restricting the set of individuals to a smaller set that shares this property. Then if you can also provide the AR1, the player, then it has to be realized as a relative clause because of idiosyncrasy of English. You have to draw the distinction about whether the modified thing is ARG1 (like with adj) or ARG2 (as a verb).

It might be useful for us to sit down and look through a couple of examples, consider the target examples, and see what the range of generated variants is, and talk about where that ought to be fixed. Make ERG more generous/expensive or you try to sneak in some default values on your side that makes a smaller range of outputs that is still interesting.


Last update: 2026-07-28 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/BergenNonGrammarComposition/_edit)]{% endraw %}