{% raw %}TomarGrammarScaleUp

# Questions

1. what are the most useful practices for developing grammars further?
2. do different techniques become useful for medium -&gt; large grammar
development (versus small -&gt; medium work)?
3. What would you have done differently? Were there areas that had to
be revisited or redone? Is there any way to predict these in
advance?
4. How to prioritize lexicon elaboration versus phenomenon-based
modeling?
5. Are there steps in the grammar development process that might be
automated? Are there mundane tasks that definitely should not be
automated?
6. What are the main tasks involved in going from small to medium and
medium to large, beyond adding analyses of particular phenomena?
7. Best practices for selections of corpora to develop against?

# Discussion

Glenn: If no one answers, I'll call on those I think know.

Mike: To spare those Glenn will be calling on, my observations of
working with Jacy: folks should test generation regularly; fixing
generation usually improves parsing.

Antske: On \#4: lexical elaboration and phenomenon-based extension
really go hand in hand. When tried to put Bart's lexicon in gCLIMB found
that the grammar and the lexicon have to work together. Can't do just
lex elaboration without looking at how it interacts with the grammar.

Glenn: Separate idea of merging two grammars (e.g. with Mandarin or
German). If there are special comments, I can add a question. Best
practices for merging two grammars.

Emily: Dan, what's your experience with expanding the lexicon. Did you
get to a point where you could do it without adding phenomena?

Dan: Have to think about the sequence of events. The strategy of picking
a particular corpus and chewing through it is pretty much what I've done
… working with different corpora over time. There was a stage where we
were working with short tokens ([VerbMobil](/VerbMobil)); pretty
gratifying positive feedback. Email was \~12 words long and messier,
still within reach. Later, LOGON data where it's still longer and
different kinds of complexity comes in (inverted conditionals, gapping,
… stuff that doesn't fit in shorter sentences). The constant challenge
is to find a problem which you can get your arms around and make
measurable progress with. If it had been *The Cathedral and the Bazzar*
from the beginning, I'd never have bothered. Finding a coherent corpus
which is not way out of reach is a good idea. Want to be able to show
measurable progress and the ability to do regression testing (which
becomes increasingly expensive as your corpus grows).

Glenn: Does that approach lead you astray ever? Make a wrong turn based
on the simple data?

Dan: Is there a danger of 'over training'? Still an unsolved mystery. It
always seems to be monotonic --- don't seem to be local maxima in the
coverage. Can of course decide to solve only part of a particular
phenomenon (e.g. we won't live long enough to finish
comparative/superlative, but can pretty quickly get to 50% and then with
some criticism from Ivan, 75% … most of it). The strategy I like is to
keep removing the underbrush so you can see the next interesting
objects. I don't think there's much danger in picking the wrong corpus
leading to a waste of time. Zipfian.

Olga: I myself was very interested in Q5, especially the first part. As
a builder of a small grammar, most often I was frustrated about having
to look for a particular rule that I just broke. Much easier to pick
parse failures than over generation bugs. Even having that picture in
front of you, it's so difficult because it doesn't fit into the screen,
can't figure out where in the FS to look… I felt constantly that this
could perhaps be automated further, especially linking the picture to
the tdl should be possible.

Antske/Glenn: agree has that

Francis: We also had the frustration of picking too difficult of a
corpus, so we sorted the sentences by length and worked on the short
ones first. Relatively rewarding. For Japanese where it's very strongly
verb final, we also sorted based on the end of the sentence and that
made it easier to do things. No real difference to the grammar what
order the sentences were in, but it made a big psychological difference
for us.

Francis: I think when Dan adds words to the lexicon, he's very careful
about trying to get all of the different usages of the words. If you
don't do that you get bitten later on. We found that impossible to do
because we couldn't yet predict what all the usages would be (especially
the non-native speakers). Maybe less of an issue in Japanese because
less N/V ambiguity. Can get quite a long way like that.

Berthold: Does it make sense to do error mining early on, at any point?

Francis: What kind of error mining?

Berthold: Trying to find gaps in the lexicon, missing readings, etc.

Francis: Until you have a certain amount of coverage it doesn't make
sense.

Emily: One thing we haven't said out loud yet that's important is that
treebanking is part of grammar engineering. Check the analyses (esp
semantics) and make sure you aren't losing the good ones as the grammar
changes.

Glenn: That's good enough for checking semantics? Just that it hasn't
changed?

Emily: If you're confident of your ability to check it in the first
place, yes, but also batch generation is a good idea. Could use more
easily set up batch generation work flows…

David: Another relevant use case: someone adding to the ERG, e.g.
mal-rules. \[…\]

Glenn: \[Demo of agree GUI for looking at tdl from feature structure
browsing.\]

Ann: Comment on particular case that David fell over and why I couldn't
debug it. Not sure that your particular tool would have coped with it
well. It was one where a constraint was getting instantiated by a
combination of unifications which were only happening in the rule, where
Dan had set this up very carefully in order to save feature space. It's
a complete pain to debug that because you have to go through the entire
chart to find out where exactly this thing is not happening that you
expected it to happen. There are tools, but the search space is huge
(for the human).

Glenn: Not sure it's a complete answer, but there's also a mode in agree
with unfilled feature structures showing only what's new here (incl
constraints brought in by making types well-formed).

Dan: Something even more evil in the ERG: There's an attempt to defer a
specialization of a verb to base form or non-3sg present tense. I hated
having to always have this multiplication in the chart that never packs,
all the way down at the lexicon. The cost is probably just too high. I
drive myself crazy whenever there's a need to debug something that's
part of that feature structure. Creates an insuperable barrier to having
anyone else work on that grammar.

Glenn: Does this fall under category 3?

Dan: Yes --- lots of attempts at efficiency in the grammar that are
almost always a bad idea.

Glenn: Would be nice if you could turn it off and on.

Emily: That's what CLIMB is for! Could have your cake and eat it
too---two versions of the grammar, one with the efficiency measure in
for general use, and one with it turned off to help debugging (when the
interaction isn't particularly with the efficiency measure itself).

Bec: How hard would it be to put the whole ERG in CLIMB?

Antske: Full CLIMB would be hard, but SHORT-CLIMB would work well if
it's not something that touches things all over the grammar. How simple
it is to pull it out depends on how complex the analysis is/how hard it
is to pull things out. Have played a bit with Jacy getting different
kinds of constraints out. Could be that what you just described could be
hard.

Glenn: Even more primitive than CLIMB is the ability to black list
certain rules during parsing … reduces the underbrush in the parse
chart.

David I.: Going back to increasing the scope of the grammar --- getting
sentences that should parse: find a corpus. As you grow the scope of the
grammar, what do you do about over generation, and making sure not to
parse bad sentences?

TJ: Worse for languages that you are not a speaker of.

David I: Even with English, coming up with ungrammatical sentences is
still labor intensive.

Dan: There's going to be some cost there, but coming back to the earlier
point that Mike was making, making sure you're always testing the
generator, helps a lot. You will always be astonished at the sentences
coming out that are not part of the language.

Dan: I also think that it's slightly painful and masochistic, but it's
worth spending part of your time each day looking at what's in the chart
and seeing if you could defend to your grandmother why that edge is in
that cell. Always rewarding. Like doing scales for piano playing. Should
always spend time doing chart gardening.

Berthold: Weeding charts --- starting with outliers that find mean
combinations of complexities to see where the bad combinatorics are.

Emily: For overgeneration, I find that it correlates with increases in
ambiguity, and contrary to Berthold's approach, going for the least
ambiguous sentence that also suffered an increase was a much easier way
to debug in Wambaya grammar development than going for the really hairy
examples.

David M.: How do you talk to field linguists?

Emily: First, take what they have (descriptions, IGT), and then ask
questions of the form: one analysis predicts you should be able to say
X, the other Y, which is/are grammatical?

TJ: Experience with importing large lexical resources. Has anyone gotten
that to work?

Glenn: Also: Experience with single button interfaces for vetting words
coming in.

Dan: Success cases of importing previously curated lexicons: Montse has
done that for the Spanish grammar, Lars has done something similar for
the Norwegian grammar, Bulgarian and Japanese as well. That's more the
norm for the medium to large grammars that we have around. I didn't do
that for English, because I want good behavior for the OOV predictions,
I want to be certain than any stem in the manual lexicon is
comprehensively in. The generics are only used when the stem is unknown.
Can't know to external resources that aren't exhaustive in the same way
(e.g. noun lexicons).

Glenn: What is your criteria for adding a new common noun that is not in
there?

Dan: I only add words that are linguistically interesting that are out
of the norm. If the generic would do the right thing, don't add it. I'm
inclined to go back to my lexicon and take stuff out.

Francis: This is unfortunate for downstream MT systems, because we get
very different predicates.

Dan: I think building and curating lexicon much of which is redundant is
a waste of our time. POS taggers work pretty well.

Glenn: How do you satisfy yourself that the POS tagger is going to get
it right? How do you sleep at night knowing that apple might not get
tagged as a noun?

Dan: Experience --- don't see that problem in tree banking.

Francis: LFG in Grammar Engineering Cookbook, said that 10-15 years ago.
Don't even put common nouns in

Dan: That's partly wrong --- belief, for example, takes a sentential
complement.

Emily: What about your experience with verbs?

Dan: Zipf --- distribution of verb frames is sparse in language, but
that sparseness is frequent. Just found *cost*, *That book will cost me
$4 to buy*: went for 17 years without making that verb frame with a
*tough*-like complement. There are so many relatively rare verb frames
that get instantiated that João's effort was very brave to try to do
that for OOV. I tried to get the verbs exhaustively, and free the OOV to
work on the easy stuff. Looked for all verbs that occur more than N
times in the BNC. Took a month or two, and the net result was really
quite visible --- went from getting some sentences to getting most
sentences.

Berthold: Ratio between particle and non-particle verbs in English?

Dan: Verb particles can't be predicted, can't be thrown out.

Berthold: You can throw out the others…

Dan: Once I put in any entry for a verb, I have to put in all of its
verb frames. … maybe talk about this afterwards. Not sure how to answer
--- would need to know how many verbs only have an uninteresting entry.

Last update: 2014-07-15 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/TomarGrammarScaleUp/_edit)]{% endraw %}