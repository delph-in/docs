{% raw %}**SIG Scribe Notes - WordNet and ERG**

Francis: Dan and I looked at all the words in the ERG and all the words in WordNet, and we tried to semi-automatically bring all the super-senses in the WordNet into the lexical entries in the ERG. Dan has been cleaning up the multiple senses by hand. He will tell us more about that now.

Dan: The strategy is to take a word like “bank” with multiple super-types and find a candidate in my lexicon for bank-institution and bank-landscape. I then create two further subtypes of count nouns, for example institution nouns and landscape nouns. This creates more fine-grained semantic categories. Now the name of the predicate has changed from bank_n_1 (with 1 always being there as a placeholder for multiple senses) to bank_n_institution or bank_n_landscape. I’m settling on this rather coarse-grain level of distinction because it is better than what we had. The full-forest treebank can now give me a way to discriminate and pick the trees I want. 

The motive for this is at least two-fold:
1. Make Francis (and Luis, if possible) happy with adding more semantic information.
2. I am personally not yet satisfied with the parse-selection, especially for prepositional phrase attachment. There is a hope to build a more informed statistical model, to build better parse selection by smuggling in semantic information. Instead of a blind guess, I can give a more informed guess.

Where I am now on that is way down deep in the mire. Let’s say there are roughly 100,000 decisions to be made; I am about two-thirds of the way through. That turns out to be taking longer than I thought, but I expect to conclude this exercise soon.

My hope is to use the ones I’ve done so far to train a statistical model to project that work onto the half a million more decisions. Then I would use further filtering and refined annotation to make adjustments and fix errors.

Luis: Have you started treebanking?

Dan: Yes, I did enough to convince myself that it will work. What Luis is suspicious of is, if when I added these extra ambiguities with the semantics, did they survive my pruning decisions? And the answer is yes, it is just seen as a new lexical type. This creates on average 20 additional decisions for each sentence. My expectation is that once I finish the painful filtering, I can get through the treebank again in a month and a half.

Alexandre: What are you doing that can make the process easier, because it does not seem like a one-man job, if someone else was going to do something similar?

Dan: Since this is coarse-grained, for example if I was not interested in flowers for my project, I can cut out the readings for “rose” as a flower and leave just “rose” as a color. I could provide a filter to discard sense-distinctions they are not interested in, and shrink the lexicon down to just a space they are interested in.

Alexandre: This could be a huge resource for lexical entries, I imagine we could have people add more lexical entries, at the same coarse-grained level as you have now.

Francis: I find it essential to have a button that says “I need an additional sense” so you don’t have to throw away a tree while you are waiting to add that later on.

Dan: Yes, we need a spot to note that this is a missing spot in the grammar.

Luis: Are you happy with the distinctions you made so far?

Dan: The nouns– yes. The verbs– very much no. There is a mixing of different levels and various kinds of expertise that has drifted into the verb sense distinctions. There is a paper in 1998/1999 (author name unknown) which explains that this is a confused way of sorting verb senses, and it proposed a new idea, which was ignored. I am collecting notes to eventually propose a better data-driven and conceptually-driven hierarchy, of maybe 30 types of verbs. But then they would not match WordNet, and we would have to consider that.

Francis: John McCrae in June of last year tried to finish the verb hierarchy, he had about 20 or 30 (Act, Think, Use, Feel, Behave, Reach, Exert, Be, Happen etc.). He had something that covered everything, but then took it out again because he was not happy with it. I am in constant communication with John so we could reach out to him about wanting to change the verb hierarchy.

Dan: I wonder if there is a way to preserve the work I’ve already done?

Francis: Probably, there should be a way to project the work already done automatically.

Dan: I would want to look through the lens of this newer classification to see if it actually makes more sense or if it's just another set of labels, before I start making all these decisions.

Luis: From what you have seen so far, is more fine-grained granularity helpful, or just using more of a basic sense? How many do you think, about 40 categories, with three or four for each lexical type?

Dan: That would take more than 10 seconds per decision, which would take my timeline from six weeks to a year and a half.

Luis: For grammarians who have a smaller treebank, what is the treebank to sense granularity ratio that we need?

Dan: That’s something the mathematicians can figure out pretty fast. If you have a small treebank, the data is too sparse to have fine-grained senses. What would you hope to learn?

Luis: I can learn from it, doing it post-hoc. Now I know I can add the distinctions from the beginning. I mean I believe in core senses. I would want to present them in a dictionary and I would collapse all the “banks” as an institution, all the “burns” as an injury.

Dan: We are recording another bit– the SYN-SENSE. I could expose this information that survives after I’ve done my cleaning up. And you can still do post-hoc annotation.

Luis: You might need to have a much bigger treebank, did you ask the mathematicians?

Dan: I get more to discriminate on, so I have more decisions to make, so you think I need more data. And I don’t know how to ask the mathematicians coherently.

Luis: You ask confidently, and make it their problem.

Dan: The 2025 version will be this big change, enriched. And I’ll put it on GitHub, and 2024 will be the last svn version.

Francis: The change will be so big we should probably call that release the ERG 3000.

EMB: We can grab the 2020 and 2023 so we can host them?

Dan: Yes.

Francis: October 7th is the deadline for the Global WordNet conference, we should try for that.

Last update: 2024-07-06 by carlycrowther8 [[edit](https://github.com/delph-in/docs/wiki/OlomoucWordNetERG/_edit)]{% endraw %}