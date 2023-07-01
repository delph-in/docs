{% raw %}# Discussion: Small2Large

## Lead by: Francis Bond

\[summary by Francis\]

- use testsuites from early on ---
  - they give you peace of mind to experiment
  
  <!-- -->

  
  - phenomenal test suites (which you should treebank)
    - add new phenomena as you deal with them
  - naturally occurring text for sanity checks
    - try to choose text that is not to far out of your grasp
    - e.g. learner text, dictionary definitions, short sentences
- when you want to look at more unrestricted text
  - it can be useful to add words from other resources
    - NTU is trying to identify syntactically interesting words
through wordnet
  - it can be useful to add unknown word handling
    - if you have a POS tagger you are satisfied with
- try to find an application that can work with the grammar you have
  - Woodley's robot world
  - extracting relations from dictionary definitions
  - language corpora

\[scribed by Luis\]

FCB: “Small to Large” sounds like a spam title… Ahem…

Basically how can we make it easier for someone who wants a broad
coverage grammar, starting from a Matrix grammar? Many people are doing
it! The traditional thing is to entice Dan to come for 3 months, or to
go and stay with Dan for 3 to 6 months.

What we found useful at NTU was doing similar phenomena in different
languages on the same day (e.g. Chinese in the morning and Indonesian in
the afternoon). We haven’t done much on test suites.

EMB: having a test suite allows people to experiment. You can try it and
see what happens. Having an approachable test suites is essential. And
back in my day test suite was an overnight thing. Nowadays is almost
instantaneous.

Glen: I tend to be ambitious… I think my work would be so much easier if
I had a tool to do X… this wasted lots of my time!

DPF: For the grammarians who don’t have the ability to build tools. And
you pointed to one of the good things of a test suite which is to
measure hypothesis. Let me put in the change and check what happens to
my 1000 sentences. The other benefit of the test suite is to use it as a
roadmap to where you want to get to in the next few time. You know the
phenomena, and the ones that don’t parse will start to annoy you —
pushing you to fix them. Not everything in the test suite must succeed.
And it has the addition is that you sometimes also get signals that your
grammar is too permission (i.e. it starts to parse things you didn’t
explicitly did work on).

EMN: Ambiguity is also shown. And with the ambiguity, the sentences
which ambiguity just doubled shows that something small can be fixed.
It’s how combinatorics works.

DPF: There are profiles like the cathedral and the bazaar, that I don’t
really care too much, still signal that things have changed but I don’t
go and check them all the time. But I also have profiles that I know in
a very detailed way (the CSLI ones), that I want to track every change
that happens.

FCB: But going from medium to large, we should also thinking of adding
phenomena to the testsuites. Do you still do that?

DPF: No, but some very sensible grammarians do that. As long as you
don’t mess around with the numbering scheme. Just add to the bottom and
you’ll be fine.

EMB: You can also check the MRSs or derivations. TSDB ++ does that. Does
GTest, compare MRSs?

Mike: Yes… I do isomorphism, I don’t care about the variables, but the
graph must have the same structure.

Glen: So you’re just looking at the topography in detail?

Mike: Yeah. And if you've gained analyses, or lost analyses… I will let
you know. It’s a graph comparison, not a string comparison. I can
explain it in more detail later. \[redacted discussion on graph
isomorphism\]

LMC: Then do you need to treebank?

DPF & EMB: Not really. Since if you see a change in sentences that don’t
have adjectives, while you were only playing with verbs. There may be
some changes that you don’t really care about (because you know that
what you generated is junk, or something alike) but seeing differences
light up in sentences can remind you that you can’t make certain changes
to the grammar.

EMB: I also find that having broader test sets is good to see what there
is in common between a few sentences that show up as changed.

Glen: When you have no good analysis, do you reject all possible
analysis?

DPF: Yes we throw everything away.

LMC: But not necessarily, I think you can make some partial choices in
the treebank (Woodley’s)

DPF: How do you save it? The saving button only lights up when you have
a final parse.

LMC: Maybe I’m wrong, but even if that is true, it could be a feature
request. \[Update: Luis was wrong! But this could still be a feature
request.\]

FCB: Ok, so the recommendation is both more regression testing, with
curated test suites and naturally occurring text.

What about something Glen brought up earlier… About the motivation or
‘depression’. You start off, make a change and there are still 5 other
wrong things with the sentence.

DPF: Within Verbmobil, we spent most of the first couple of years in a
closed set where we controlled everything. We knew what the next target
was. Our tools are not very good at showing partial success… You can’t
work with naturally occurring test.

EMB: Or you could do what Francis said, about working with the short
sentences before.

Glen: Also we need to be careful about what we think is a simple
sentence. We can be naive to think that children’s stories are simple
language…

FCB: We found that going for a corpus of text for learners was pleasing.
When we started with Zhenzhen and David’s PhD we said we were aiming at
60% of the NTUMC, but looking back it was possibly not the best
decision…

DPF: I think you are always going to find a gap between making people in
the real world happy and keeping yourself happy and sane. You want to
work to get a permanent rising slope.

Glen: That is why I spent time to build tools to show me very clearly
what gave me the best bang for my buck.

DPF: Every word you can avoid thinking about will help you!

Mike: I was quietly suggesting that we did less lexicon work, and focus
more about unknown word handling.

DPF: Yes. I agree… But I think that won’t work until you did some verb
and adverb building. After a year of working in Saarland on
subcategorisation, the POS taggers will fail you. Over time you will
have an inventory of lexical types. The first time you encounter a 4
argument verb you will have to spend some time to build it.

Glen: It seems unrewarding to me that you’re saying that every word have
specific types…

DPF: No no, I only have 170 types of verbs, it took a while, but I
rarely find anything that doesn’t fit in something that I already have.
There are only 1000 types in the ERG.

FCB: Going back, I was never against turning on unknown word handling,
but I am not satisfied with any of the POS tagger for Chinese.

DPF: Absolutely! When I understood that no POS tagger would give me
subcategorisation info for verbs in English I started work on that
hierarchy. You’re also lucky that for the languages you’re working with
have open source resources. That was not the case for English. We had to
do it from scratch. \[and walk uphill to school in the snow, FCB\]

Glen: I noticed you were very careful in your advice that saying this
high quality lexical dumps are not detrimental. But are they useful?

DPF: Yes, they can be useful. If the lexicon you import has high quality
information that someone has done you can benefit from it. But it’s
likely that HPSG will require things that lexicographers have not
thought about (e.g. some control verbs).

FCB: On control verbs, we actually used the ERG control verbs,
translated them into Indonesian with the wordnet and hand checked what
we got and it turned out that more than 50% were actually control verbs.
But if you ask someone to list all the control verbs in their language
you can’t really get it…

Glen: I agree we have to come up with ways to squeeze what the ERG can
give us.

FCB: And in fact the ones we got for Indonesian, and there is an overlap
with English, we can actually say that some synsets are ‘control
synsets’. And this will likely be true to the next language. Going back
to the idea of pivoting things, it would be interesting to see what
grammars are actually undergoing development, so some work can be
shared.

Glen: I think it’s a either-or situation, whether you get to maximize
the pivoting for one language, or to generalising to multiple languages.
You assume that the Wordnet is modelling the same kind of content as the
ERG.

FCB & LMC: It’s not either-or, you can have both.

FCB: The final thing that I wanted to discuss what we did with JACY,
which was try to find small worlds to work on — like the learner corpus.
We should try to identify tasks that are contained and easy to boost
work. Like David has the dictionary example sentences, that you can
possibly show progress on more easily.

DPF: Have you thought about translating the robot program that Woodley
used to win a task with. It’s contained, and it’s nice since it’s a very
hard check if it’s correct or not. You need to work on numbers, colours…

Glen: And can you do that without a treebank?

DPF: Well, no! You still generate many possible parses. But you can show
that the correct answer is there. I don’t really know about how much
work would be involved to produce the transfer rules to feed that piece
of software.

FCB: It would be nice to be able to do that. If we produce similar
looking MRSs…

DPF: You can be dragged into comparatives, relative clauses…

FCB: Which is nice, since it’s a good reason to look at it!

Everyone happily leaves the room to have some sushi.

Last update: 2017-01-10 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/CapitolHillSmall2Large/_edit)]{% endraw %}