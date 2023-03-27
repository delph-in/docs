{% raw %}Brief summary:

The task is visual question answering. Previous datasets allow good
performance without using the image (50% without vs. 60% with). So,
there has been a move to artificial datasets.
[ShapeWorld](https://delph-in.github.io/docs/summits/MultilingualShapeworld) is a configurable and extensible
system for generating captions.

Glenn: There are infinite descriptions of even the simplest picture.
Where do you start?

Alex: You start by picking one description. From the deep learning
evaluation standpoint, you want a question to answer. How to get all of
them is not clear.

Glenn: How do you start with one?

Alex: Maybe clearer with the following slides...

1. Start from exact representation of world
2. Some "captioner" object generates sub-representations
3. These are mapped to DMRS

Angie: Can you block "the yellow circle" when there are two circles?

Alex: The captioner can check the whole world, not just one object.

John: There is existing work in the generation community, e.g. we don't
want to use the overly specific "two red circles" when there are only
two circles. Kees van Deemter.

Alex: Definitely interesting, try to do this to some degree, but there
are limits to what we can do. The system may generate unnatural
descriptions.

Dan: "both crosses" implies exactly 2. This works for the ERG. But for
"four rectangles", would that be exactly four? From John's example, this
would be used when there are more than 4.

Berthold: There must be some uncertainty in observing the scene - e.g.
if you're referring to chairs but you can't see if there are more in the
next room. But in [ShapeWorld](/ShapeWorld), we're omniscient. Would we
expect more than definite descriptions?

Dan: "two of the rectangles are blue" - we have a subset

Guy: These are pragmatic objections - whether we would use an utterance,
given the option to use other utterances. I think Alex is considering
literal meaning.

Alex: The focus for me is the deep learning evaluation, but there could
be other motivations. So just formal semanticcs. Pragmatics is not the
aim.

Dan: "four of the rectangles are blue" seems close to wrong when there
are exactly four.

Emily: That's uncooperative, but not false.

Francis: There is more than just true/false.

Chris: Difference in meaning between "four" and "four of"?

John: There is existing work e.g. generating weather forecasts, stock
price changes - these could be other domains.

Alex: As long as we can generate from some abstract representation to
natural language

John: Yes, from database objects.

Woodley: What's the benefit of using the grammar?

Alex: For very simple statements, there's an overhead. But if you extend
the system, say to introduce relative clauses - it's much easier. If you
have conjunction, you can compose the subgraphs. Adding plurals,
"a"/"an". You could do this without the grammar, but you're effectively
re-producing it. It also lets you port to a different language or a
different domain. e.g. Clipart scenes, not just shapes, but other
objects like "girl", "boy", "tree".

Emily: There are 12 (edit: 13!) languages in the room (only 2
Indo-European), and many of the phenomena are also covered by Ling-567
(just need the lexicon) - it would be exciting to test this.

Alex: Yes!

Berthold: Could you circulate your list of object names? Might need to
extend the lexicon.

Alex: Come to the SIG!

Dan: If you distribute the list beforehand, people can come prepared.

Alex: I'm currently extending the system, so the list could expand in
future - but I will distribute it before SIG.

Berthold: Is it always a 2D view? e.g. in Hausa, "before" and "behind"
follow the observer's axis, not the object's axis.

Alex: I may not extend to 3D in the coming year. Another extension would
be to add time. So far it's only 2D.

... examples on slide ...

David M: It would be good to have the lexical items, and phenomena
(comparatives, quantifiers, etc.)

Alex: Will provide, will be ongoing.

Dan: In the parapharase machinery, do you produce relative clause
variants?

Alex: For now, focusing on simple statements, e.g. spatial relations -
these didn't work in deep systems until \~3 months ago. So haven't gone
to more complex statements yet, but this should be doable.

Dan: "the square is green and it's next to the circle" / "the green
squre is next to the circle". We could add variation that makes it a
more interesting game.

Alex: Paraphrase rules maybe allow this. I'm partially working with more
abstract DMRS predicates, and then use paraphrase rules to realise them
as more specific language DMRS at the end.

John: We've done this in past - you could detect where you're generating
ambiguous descriptions (e.g. attachment ambiguities) - can't do this
with data-driven generation. This would be another selling point.

Alex: Yes, I've thought about this recently - we could generate and then
parse to check ambiguity. As another task, we could also train a system
to describe an image, and verify that it's correct. At the moment, other
evaluations compare the output with the human caption, but obviously
there are a thousand ways to describe an image. This allows it to
generate something correct but different.

Last update: 2017-08-11 by GuyEmerson [[edit](https://github.com/delph-in/docs/wiki/OsloShapeWorld/_edit)]{% endraw %}