{% raw %}Moderators: Guy Emerson, Emily M. Bender
Scribe: Emily M. Bender

Slides: [Problem statement](https://github.com/delph-in/docs/raw/main/summits/2021/Virual2021DefeasibleIdentity.pdf), [Proposal](https://github.com/delph-in/docs/raw/main/summits/2021/defeasible-proposal.pdf)

* * *

Dan: But this seems to affect whether or not you use types or features for things like different varieties of noun.

Woodley: But you couldn't do that before, even without defeasible identity.

Dan/Guy: True.

Berthold: How well behaved is language in this respect? Change head but keep MOD, change MOD but keep HEAD.

Guy: Works when they're on the level of sister features, not one inside the other.

Emily: So this might not be simpler in the end: less typing, more debugging. If we are telling the grammarian "it's all taken care of" we have to be very clear about what isn't.

Guy: True, but there is also a lot of reasoning about the thicket of types.

Olga (in chat): Similar considerations for the append lists.

Glenn: So that about priority?

Guy: Take as much as it can, but if they conflict, take neither. Difference to credulous default unification, which will give multiple answers. Woodley's example from chat. What is the value of B in the unification result x&y?

```
x := [A /#1, B /#1, C +].
y := [A -, B /#1, /#].
```

YADU says *\*top\**.

Glenn: That seems like throwing away info, which is also hard to reason about.

Guy: Or maybe I should say *bool* -- the most specific thing that is consistent with (more general than) what we get from credulous default unification.  It's a kind of mini-max operation.  And credulous default unification is somewhat like that, but the other way round.  And I'm suggesting applying YADU backwards, so an even longer series of mini-max operations.

Glenn: Do the grammar engineers think this would be workable?

EMB: My sense is that it would take some practice, but that I could learn the art of it, similar to how I have calluses around working with diff-list appends that help guide me away from the dragons. (This is different to Berthold's approach, where he just goes in a slays the dragons.) For these issues around defeasible identity constraints, I think I would learn best practices for tracing back up the structure to see what I need to specify directly, given a specific override. It would thus like be convenient for me, as someone working on/with the Matrix and dealing with lots of languages. Not so sure whether it would be as convenient for say a 567 student.

Dan: Do you have a 567 grammar available to use as a use case? To see if you could still get the same coverage? Might reveal some challenges -- comes from the Matrix that makes use of lots of multiple inheritance, etc. So an interesting amount of stress testing of the idea.

EMB: Yes, but have to go back a couple of years (pre-AGG). Maybe update to current Matrix first.

Dan: But why insist on the latest Matrix version? Just an apples-to-apples test with grammar over its testsuite.

EMB: Would need a separate test for compatibility with append lists then.

Dan: I remain optimistically skeptical that this might work. Just a level of complexity not usually considered in work like Carpenter 1993 or the original YADU work.

Glenn: Zeroing in on multiple inheritance and to what extent does that weaken the benefit.

Dan: We do lots of things in those tdl files... might be willing to do the experiment if it were for a language I could manage like English or Spanish.

Woodley: Does this exist in implementation, and when does it happen?

Guy: It happens at compile time. After type constraints are expanded, when instances are defined, YADU is applied to resolve the default constraints. Not implemented yet. Not a lisp programmer :)  Don't really know where to start in terms of implementing this.

Glenn: Does John or someone else remember unfilling? Your reverse YADU step reminds me of that. Does anyone else remember the details? It's present in PET, I know.

John: I think PET experimented with it as a potential efficiency improvement. Get rid of predictable constraints and fill them in later if you need to. Also implemented in the LKB once by a student at Essex (Fred Fouvry). That is there still in the LKB, but like YADU, I've not tested it to check whether it still works. Code might also need improvement. For PET, I think it was an experiment that didn't give great benefits in the end, but oe would know more about that.

Berthold: Used it for GG when I couldn't use packing (because gains lost in unpacking, at the time). Less effective on longer sentences, but actually quite effective unless you have a very carefully designed grammar with min types. Reduced the amount of copying that had to be done. But seems to be incompatible with restriction, where you are trying to cut out features you can't see, because unfilled.

Glenn: Seems like I misremembered and this doesn't seem to have much to do with conveniences for the grammarians.

Woodley: The min types might be an unfortunate interaction with the default unification idea. Default constraint says make the whole structure identified, and if you don't do things right, what you'll end up with is expansion only to the min type that lets you write the change, but then lose the upper-level identity and when the min type gets expanded to the full type, lose the other features. In Guy's example, suppose that *noun* is a type with more features than CASE and MOD, but you've only got *noun-min*.

Guy: If *noun* has a subtype with additional features, then those additional features won't get reentrancies. This proposal is sensitive to how and when features get introduced in the type hierarchy.

Woodley: If you have a situation where *noun-min* is sufficient for CASE, but noun(full) introduced MOD, then MOD wouldn't get covered. The grammarian doing this by hand might have been more clever.

Dan: You did say on an earlier slide that a consequence of the forwards-backwards approach is that you need a fully realized feature structure by the time you're done. All features need to be expanded is a scary conception to me, since it means I don't get a chance to use the *min* features to reduce the size of the things being manipulated at parse time, which gave us measurable gain. If you did this to apply defeasibility, could you go back up to min-types before parse time, like unfilling?

Guy: If you have nested min-types, you could put those additional features ... if you nest min types in the feature geometry instead of in the type hierarchy ... comes back to the distinction between expressing things on types rather than on features.

Glenn: Because the siblingness of features is a first-order concept in this proposal.

Woodley: Guy's proposal would not actually expand that nested min type on COMPS.

Guy: If *noun* had a third feature EXTRA, with value *extra-min*, that whole thing would get identified.

Woodley: Worry isn't that min types get expanded unnecessarily, but that they don't get expanded enough. But you could do yet another post-processing step to collapse situations that got expanded too much. What if explicitly expand the full geometry (but what about recursive types like lists?)....

Guy: Seems in the direction of what Ann suggested to Emily in Paris re having a separate processing step that does something with the grammar. In my proposal I'm trying to stay as close as possible to what's in the tdl.

Woodley: But you've already introduced the backwards step.

Guy: It's modifying the interpretation. In the LKB where YADU gets called, just changing that function. We're calling that function in exactly the same place.

Berthold: What seems to be working is the identity of ... the only thing that's left is the type identity of the node itself. Everything below it gets a reentrancy or gets an override. And that must be done at run time.

Guy: At compile time.

Berthold: Keep track of that there was a reentrancy that had been pushed down, so you enforce type identity by copying at run time. Just for that value.

Guy: Doing that would be going outside how unificiation is defined in the LKB. Quite a drastic change.

Dan: This is an awkward example because we can't do this even in the current machinery.

Guy: There are more general types of feature structure formalisms that allow identity of types with changes to contents of those types, but not doable in the LKB.

Dan: Let's try to rein in our wishes about the way the universe is organized. Let's pretend those stay the same and see if we can get the rest of it to work.

John: I thought YADU retained defaults forever, not just at compile time.

Guy: From what I understand, YADU has two settings for each defeasible constraint, to say whether it's persistent or not. All are kept as defaults within the type hierarchy, but at the instances, you say whether it remains default or becomes strict.

John: So that's there already.

Guy: If they are left as defaults after compile time, they will never affect grammaticality, just the FS you get at the end of parse time. Emily is talking about ones that should affect grammaticality.

EMB: Also as a grammarian I can't reason about persistent defaults.

Guy: It means you could have e.g. a different MRS at the end.

MWG: This is all convenience to the grammar writer and not increasing the power of the grammar. Seems like we're getting caught up on edge cases. What if we were able to detect edge cases and warn the grammar engineer about things that aren't supported. The difficult things are also difficult for the grammar engineer to reason about and that defeats the purpose.

Guy: I guess you could compile the grammar and then check back through the feature structure to where the default identity constraint was introduced and then see whether any of the types along the way have further subtypes -- and then say these are things that might potentially go wrong.

EMB: I think the edge cases are ones where the grammarian hasn't provided enough info to get what they want. So hard to check for at the level of sorry we won't compile that grammar, but maybe helpful as Guy says to flag where there might be more to think about.

Dan: Problems might be when you've gone through identity constraints? You've both said there was a reentrancy and an override of a feature inside, system should tell the grammarian they've asked for the impossible.

EMB: That's exactly the thing we're trying to do though.

Guy: The HEAD value can't be reentrant -- current system or otherwise.

Guy: We could maybe have a compile time warning about cases where there are types that introduce further features (EXTRA above) that might fit into structures with pushed down defeasible identity constraints.

EMB: Thanks all for the interesting discussion. Sounds like the next steps if we wanted to pursue this would be to implement Guy's idea and then test it out with a Matrix-defined grammar. Maybe even a new one from the customization system just slightly extended for e.g. Spanish or English.

Guy: Does anyone know the current code in the LKB?

John: There but not tested.

Dan: Woodley, do you support this in ACE?

Woodley: No. Emphatically no.

John: The most reliable test would be with an old image of the classical LKB from > 4 years ago.

Glenn: Maybe a KNOPPIX image?

Last update: 2021-07-23 by Guy Emerson [[edit](https://github.com/delph-in/docs/wiki/Virtual2021DefeasibleIdentity/_edit)]{% endraw %}