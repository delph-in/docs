{% raw %}# Efficiency, robustness, precision: balance and control

Discussion at the [Cambridge Summit](https://delph-in.github.io/docs/summits/CambridgeTop) led by Dan
Flickinger; scribed by Guy Emerson (2019).

Bec: Angelina's work?

Dan: She made our work more palatable/consumable.

Woodley: Mapping between our dependencies and other dependencies --
could we take a statistical dependency parser, and constrain our parser?

Ann: Why not use a neural parser to produce ERSs, and concentrate on
improving the training data for those things (by treebanking and so on)?

Alex: This is what some groups involved in the UD project do.

Ann: Could focus on linguistically interesting things. Maybe you're
trying to solve too many problems with this engine!

Dan: These things have only recently come on the scene; my thinking may
need time to catch up. Any nervousness about those systems?

Ann: Someone should do a detailed evaluation to see if the impressive
numbers are just cherry-picking easy stuff.

Dan: Yes, simply baselines can be very high.

Woodley: And check that they scope!

Ann: If your job is about providing good linguistic analyses, rather
than a good engine, then you don't need to do all of this.

Dan: One case I still need: brackets for treebanking long sentences.

Ann: Empirical question about how important this is to do. If your job
is providing good analyses, are there any phenomena you would miss if
you skip long sentences?

Alex: Long-distance dependencies?

Dan/Ann: Same type seen in shorter sentences.

Woodley: But would a parser trained on shorter dependencies generalise
to sentences needing long dependencies?

Francis: Another use case: Sherlock Holmes corpus to show off the
grammar; want to show everything.

Dan: Possible take-home: all of this work on robustness by patching
fragments together is not worth it?

Ann: Devil's advocate: do you need to spend time on finding analyses for
messy stuff?

Dan: Example: different conventions for academic references.
Catastrophic for the grammar. Could try to write rules for this, but I
don't learn anything about English, but rather about technical writing.
But I would need to do this to analyse these sentences.

Ann: Similarly, for chemical names. Pre-processing step to replace
chemical names with a special token. Not your problem.

Dan: That would be nice. But it may be in the way of my problems. I
can't study Alexandre's text without solving this.

Alex: We could replace the citations with some kind of markup. Some
cases can be removed, but some are subjects, part of the syntax...

Ann: We had similar problems with chemical names, e.g. can interact with
grammar through coordination. People have studied citations in
computational linguistics.

Dan: It was clearly the right move for chemistry texts. Probably the
right move here.

Francis: If one of the things we do is produce more training data, one
approach is to process other people's markup. e.g. in
[WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods), use wikilinks to produce Dan's special
constituent brackets.

Ann: Basically treat as named entities.

Francis: Other work has found improvements by doing this (AR: Francis is
talking about <https://nlp.stanford.edu/pubs/markup.pdf>?).

Ann: Also, mine e.g. Wikipedia titles for named entities.

Dan: Currently not used in [WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods). We know we're
throwing away possibly useful information.

Woodley: But you use italics.

Alex: How is that related to <http://moin.delph-in.net/ErgGml>?

Dan: I could adapt analysis of quotes to italics in wikitext.

Dan: Pre-processing to add my special brackets would be straightforward.

Alex: All these techniques that you described, some of them are things
that users should be aware of.

Dan: In the current setup, there are some things you can call through
ACE: add top PCFG spanning edge to the chart, use ubertagging with some
threshold (empirically, I use 0.00001)

Bec: For the threshold, I can show pretty graphs.

John: Is it an absolute probability or relative?

Bec: Absolute.

John: For RASP, we use a ratio.

Bec: Difficult to do with different length spans.

Dan: We wrote [AceErgTuning](https://delph-in.github.io/docs/erg/AceErgTuning) which mentions these things.

Alex: How is the POS-tagger used?

Dan: For unknown words. The TnT tagger doesn't often make bad mistakes.

Ann: And we can define the mapping from the POS-tags to the unknown-word
lexical entries, which lets us overcome common mistakes. For example,
adjective vs noun (in this case, there is some arbitrariness in the
linguistic analysis, e.g. "oak table").

Dan: (illustration of tdl for lexical entries)

Alex: Does it make sense to correct the POS-tags and re-train it?

Ann: This is a lexical issue (adj vs noun) so it wouldn't help for
unknown words.

John: What about uses of a known word with an unusual type? e.g.
technical use.

Dan: This is an Achilles' heel. e.g. "I'm going to friend them" -- I'm
reluctant to allow the tagger to supply more variants.

Bec: Isn't there an option for this?

Dan: I could change the lexical filtering rule.

John: But the tagger could also get this wrong.

Dan: If you wanted to, you could change this without affecting anything
else.

John: Has anyone tried chunking? We tried this for RASP but didn't get
good results.

Ann: Ewa has been trying it.

Bec: "Blazing" pre-processing.

Francis: Given this part of speech tag, only accept certain types from
the grammar. We had a corpus that had been manually tagged.

Ann: Ewa has results for realisation -- you can identify regions of the
DMRS that don't interact with the rest, so you can realise more quickly
by realising each part and then put the results together. She has also
done this for parsing with manually written rules (e.g. look for
conjunctions), but she may or may not get to the point of turning that
into something where you can learn the potential chunks.

Dan: Looking for particular lexical entries?

Ann: It's not completely formalised, but some notion of semantic
coherence. There's often a lexical trigger.

Dan: I remember van Noord was looking for one or two barriers in a
sentence to cut down the parse chart.

John: Also done in machine translation.

Ann: The state of the art in machine translation (at least a couple of
years ago) was incredibly crude. These models aren't trying to do syntax
anyway, e.g. cut every 20 words.

Francis: We've mainly been talking about the ERG. For other grammars,
have people done much?

Petter: (shakes head)

Dan: I only know about the experiments we did in Singapore with bridging
rules. But I don't think that went anywhere.

Ann: We had a SIG some time ago -- how do you go from a relatively small
grammar?

Francis: It would be nice to have a PCFG, but maybe we don't have enough
data.

Ann: Crowd-sourcing? e.g. get someone to find more sentences that the
grammar can cover?

Woodley: If you just get more sentences?

Francis: But if you don't have a certain construction...

Dan: As long as you have some kind of recursion in the grammar, you can
probably find some interesting long sentences it can cover.

Dan: So perhaps efficiency gains are not so crucial, because we have
workarounds like inserting brackets. And perhaps robustness could be
left to a different trained system. Ease for end users is still
important

Francis: A way to train the in-built POS-tagger in ACE? The tagset is
built-in. It's one thing that would make it easier to use the system.

Dan: Yes, robustness for unknown words is important for grammar
development.

Dan: So perhaps the grammar developer can retreat into the monastery and
work on improving coverage. The bigger the better...

Dan: We can conclude that not all three of these dimensions are a good
place to focus, and precision is the hardest to substitute.

Francis: Are there places to search for neologisms? To automate the
mining of missing lexical types?

(agreement that there was some error mining thing a long time ago...)

John: What is the state of Alpino?

Dan: They took a different strategy of trying to improve their treebank,
separately from the grammar. The grammar is forever trying to catch up.
Our treebank always reflects our grammar.

Francis: His official position is that he has solved Dutch.

Ann: I'm not sure you should assume that everything in a corpus is
produced by people with the same grammar. Creating a single grammar
might not be the right thing to do.

Dan: You know I'm relatively tyrannical about which things I'm going to
do. I'm not going to do resumptive pronouns! But "the bigger the better"
is fine English.

Ann: The more you think about them, the easier it is to accept them!

Woodley: Didn't Shakespeare use this?

Dan: It's not a new feature of English.

### Comments and questions from AlexandreRademaker

- Where can I learn how to add/use the brackets to mark the
constituents? Ace accepted those brackets, right? Links?
- The discussion about Ace options ended up talking about the page
[AceErgTuning](https://delph-in.github.io/docs/erg/AceErgTuning).
- Dan presented the mapping of the pos tagger tags to lexical entries
(file gle.tdl I believe) but this is not the token-mapping
(preprocessing) rules, right?
- blaze tool ? a tool that Francis mentioned that were implemented/use
to pre-processing treebanks? Link?
- error mining project 1997-1998? (mentioned by Ann) Link?

Last update: 2019-07-17 by AlexandreRademaker [[edit](https://github.com/delph-in/docs/wiki/CambridgeEfficiencyRobustnessPrecision/_edit)]{% endraw %}