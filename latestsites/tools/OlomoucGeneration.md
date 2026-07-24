{% raw %}[Slides](https://github.com/delph-in/docs/tree/main/summits/2024/generation-notes.pdf)

*Scribe: Emily*

Ann: Discussion of generation usually heuristic; lack of clarity around some corner contexts. Can we be clearer what the sem representation is and maybe make it clearer for people who are trying to produce MRSes as input for generation.

Ann: We have to talk about the strings explicitly in the definition of a TFS grammar -- not like the theoretical HPSG approach of appending strings in larger feature structures. Input to a parser is a list of strings (already tokenized).

[Scribe isn't copying down text from [slides](https://github.com/delph-in/docs/tree/main/summits/2024/generation-notes.pdf).]

Ann: Chart parsing assumes you know the order of the strings; chart generation assumes you know the way that things are coindexed. To do this, have to be able to find the lexical entries, because that's what you start with in the chart.

Ann: Want to talk about efficiency/flexibility trade off. Maybe should be parameterized.

EMB: Does no merging or relation names rule out having classifiers specialize noun relations?

Guy: It's already being done in e.g. Petter's grammar and it works there...

Ann: Not sure what you mean exactly.

Guy: Each relation name is just a type, with subhierarchies. Unify two relations to get to shared subtype.

Dan: If they started as to relations in one MRS list, there is no mechanism to push them together. Can't say that the two words (classifier and noun) each start off with their own predicates, which then get merged. That's not supported.

Petter: All my lex entries start off underspecified...

Ann: Two issues: (1) Can you find a bag of lexical entries from the MRS which are guaranteed to be the only ones you need when you generate. (2) If the output has somehow merged two MRSes so they've overlapped, then the system would have to have some way to finding the two different lexical entries.

Ann: The algebra says there's a bag of EPs and those are combined from daughters to produce the phrase. It doesn't allow for there being an overlap there.

Emily: What if the classifiers are semantically empty and the nouns get put into the initial bag through underspecified PRED matching well enough.

Ann: Assumed the classifiers also had a semantic contribution, and further specializes the noun's semantics.

Guy/Francis: Need a unary rule for generic nouns when classifiers are used without nouns.

Dan: Like "many/some are here".

Francis: There are some logical equivalences that it's hard to know whether or not they are allowed: I have no bananas/I don't have any bananas. Don't know which one a language/grammar allows. Maybe do something outside generation that tries the second if the first doens't work.

Ann: Yes a paraphrase component is something we could have. Another way of parameterizing it.

Guy: A set of acceptable operations that can be used to be counted as equivalence.

Ann: Paraphrase is a separate thing to do completely outside. I'm thinking about things like sorts on variables (tense, etc). Does it matter that something ends up being generic past, vs. something more specific.

Guy: Could extend notion of equivlance to include paraphrase.

Ann: No -- part of generation is checking equivalence, and need to be able to check that along the way. Accepting arbitrary paraphrases wouldn't work as a component in that sort of equivalence for the generator.

John: Right, because otherwise we'd be back to shake and bake, with no filtering.

Guy: Notion of MRS equivalent needs to be strong enough to be fit into this generation paradigm?

Ann: Paraphrase rules can talk about semantic equivalence, but not MRS equivalent in terms of what's formally included in the generator.

John: Very strong design constraint that the indexes are not string positions as in parsing, but EPs covered in the input. Can't cover one EP more than once and you've got to cover all of them. Without that it's not tractable. MRS equivalence has to satisfy that -- has to have all of the EPs in some form or other.

John: Difference in sorts within an EP is fine. But coalescing two is not good at all. Nor is losing one.

Emily: And specializing a PRED value is okay?

John: Should be.

Dan: Yes, we use it for e.g. can v. be-able-to. Have an underspecified relation type, which can be used in generator input and gets specialized to whichever fits (e.g. in a given tense).

Guy: Triggers more than one lex entry?

Dan: Yes.

Francis: Same for much/many, articles.

Alexandre: Those entries never appear in parsing, right?

Dan: Never is really strong. In can/able-to always end up with most specific. But e.g. underspecified prepositional predications sometimes stay underspecified in parsing.

Ann: Breaks heuristic of parsing to see what the input MRSes should be.

Ann: Obviously can't do this too much, or the search space gets too big. Don't konw if we constrain that ahead of time, or what happens if you put in a whole sequence of coindexed EPs with no PRED values.

John: Differences between ace and lkb often seem to boil down to MRS equivalence, because it's not fully specified.

Ann: I think we should be able to specify it tightly.

Dan: If we can get LKB and ace to implement same specification and then see if both ace and LKB give the same outputs.

John: MRS equivalence testsuite would be nice.

Dan: Thoughts about semantically empty lexical entries?

John: No new ideas, sorry.

Dan: There's a messy long file of descriptions of which MRSes are compatible with semantically empty lexical entries. E.g. is in "The dog is barking" -- is contributing tense/aspect but no predication. Need to know from that MRS that which forms of be should be added to the chart.

Ann: Interesting experiment would be to look at how important the tight specification of those rules is. Make things less error prone by relaxing them, but check efficiency hit. It's not just the problem of having to introducing one lexical entry --- because the sentence can be arbitrarily long.

John: A parse bank might help in writing trigger rules.

Ann: Tried that about 20 years ago (autogenerating trigger rules). MPhil student found some examples that were missing in the existing trigger rules. But could be maybe a bit sloppier ...

Dan: I was thinking more of other ways to improve the robustness of that brittle resource, but not trying to think big brain about how to do it differently.

Ann: ML problem where input is MRS and output is predict which null semantic entries should go into the chart based on input MRS.

Guy: Analogous to supertagging? MRS input and try to predict what lexical entries should be. Maybe analogous because the trigger rules are something we use to cut down the search space.

Ann: Interesting because you could think of the list of indicies in the MRS as equivalent to the things you are tagging. Does this trigger or not?

Dan: If you thought of the supertag as directing you to put in two -- _bark_v_rel triggers both bark and be.

Francis: And it will be linked to it, right?

EMB: Do sem empty things stay linked to the parts of the MRS that triggered them?

John: Clever stuff with modification that has a filter at every point that drops impossible bits of MRSes because of modification needs ... 

Dan: The dog is barking and was sleeping.

John: Oh that's different.

Ann: Skolemization might help here, but don't remember the details here.

John: It's not just modification -- when you lose access to the index and you still need to attach things to it.

Ann: What we call skolemization isn't really skolemization at all. (Potentially dramatically misleading, but we've always called it that.)

John: Something like reifying...

Ann: If you're doing DMRS then that happens becasue of the links anyway. That's where that information is stored.

EMB: Do we try to unify is(TENSE present) with sleeping(TENSE past) and fail, or do we know not to try?

Ann/John: Think so, but don't remember.

Guy: Four things to formalize:
1. MRS equivalence
2. how to initialize the chart such that we can definitely reach everything that is MRS equivalent

Ann: 2. doesn't need any new formalization.

Guy: But isn't it dependent on notion of MRS equivalence?

Dan: Doesn't can/able-to thing fit in here?

Guy: We want to ensure that the notion of MRS equivalence is strong enough that we can make sure that given lexical look-up can be sure to reach everything.

Ann: There are some notions of MRS equivalence that you might like but where you can't do that.

John: Semantically contentful rules also need to be thrown in with the right indexing as well.

Dan: In some sense part of lexical look-up.

Guy: 3. How to efficiently construct the chart. Back to Emily's point about unnecessary unifications.

Ann: Lots of work on that one already.

Guy: 4. Whether we can prune that space; trigger rules which constrain lexical lookup and still get the generation you want.

Ann: Trigger rules are a heuristic. Important for practical generation, but not for the formalization of what the meaning space is.

Guy: Could still be important practical generation.

Ann: Even if ace and the lkb did different things there, and one was more liberal than the other, so long as one wasn't excluding something that had to be there, it wouldn't matter. Free for a developer to do something clever.

John: Trouble with something like supertagging is that it makes mistakes. Generation chart filtering might do the same. We might want to make that trade-off for efficiency (make it toggle-able).

Ann: That's not about what generation does formally. And the sort of thing that only Woodley and John can do.

John: If it's separate like a supertagger, then I think anyone could do it.

Guy: Then we need a formal definition of that interface.

Ann: Trivial: For this MRS, these are the entries we needed.

John: MRS equivalence is the biggest pain for developers. Behind most problems in generation have to do with it. Berthold pushes the generator quite hard and finds places where lkb/ace differ that are really hard to track down.

Ann: I think it was cleaner but slower, and I think it was made less clean but faster. Would rather it was parameterizable, built on a notion of equivalence which was clean, then with clear things added to it.

Ann: There might be a definition embedded in code that I wrote when the LKB was somewhat efficient, and we might be able to look at that and work out what the definition of it. There are probably some things where we all agreed on what we were doing, and others where we didn't.

Dan: In an ideal world... [scribe got distracted]

John: I'd like to do that. No, wait. I'd like that to be happened.

Last update: 2024-07-01 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/OlomoucGeneration/_edit)]{% endraw %}