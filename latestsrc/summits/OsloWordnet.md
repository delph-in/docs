{% raw %}## Wordnet Integration

*Integrated Semantic Framework* (Bond, Tuan Anh)

*Leader: Francis*

*Scribe: Glenn*

* * *

Glenn: Pre- vs post-processing... Your nomenclature when dealing with
Victorian English?

Francis: Post. Removing exuberant hyphenation: better to let ERG get a
chance first and then fix afterwards.

John: Is the wordnet tagging from semcore?

Francis: No there’s not enough semcore treebank.

Dan: Tim Baldwin challenged me to treebank 3000 sentences \[story…\]
Lost in the mists of time.

Francis: Chris \[?\] Doesn’t like people to use semcore. Because the
human tagger went mad.

John/Francis: It wasn’t sable enough. Things shifted underneath the
annotators.

Dan: Would there be value is a chunk of semcore that is stable and work
with that?

John: Not many people are doing WSD these days.

Francis: Trying to persuade people to use wordnet, but even more so the
MASC annotated portion of the ANC.

Ping: Do you have a way to traverse wordnet hyper/hyponyms

Francis: Yes. We use such to do cross-lingual alignment.

Ping: Which wordnet languages?

Francis: English, Chinese, Indonesian, Japanese

Ping: Where did you get the Chinese Wordnet?

Francis: We made it.

Ping: [HouNet](/HouNet).

Francis: Very good, but proprietary; we can’t use it.

Ping: What about granularity considerations when you built your Chinese
wordnet?

Frances: Yes and no, for Chinese we largely copied the structure of the
English wordnet, but that may not have been a good choice.

Ping: First-level concept vs. meta-concept…?

Francis: Justice is an abstract concept; I think it’s good enough if it
can exist in your head. I consider the things spoken by scholars to be
part of the language. Post-modern literary examples were weird.

Woodley: I think you partially solved the mundane problem of correlating
… with … so are we now ready to drop this into our paraphrasing
machinery. To use some of our tools for more non-trivial entailment. Are
you doing this by hand..

Francis: We are doing this by hand; we’re working towards it.

Emily: You said it would be useful to have give\_up\_v2 as “give” +
“up”; Seems like that would be something better off put to the side,
i.e. SEM-I, rather than mucking with pred values vs. stem forms.

Dan: “Turned on his friends”

Francis: “Give-up” will be indexed by … in wordnet. We need to be able
to find it.

Dan: There are verb predicates that say it could be selected by either
of two.. “Either of,” “either about”.. I’m with Emily, this doesn’t
belong in the grammar. We should figure out how to store it in the
SEM-I. It’s not a very mysterious mapping.

Francis: It can be.

Dan: We should keep straight what’s inside vs. what’s outside here and
not make mistakes as before.

Francis: As a user-grammarian, the process of learning to maintain the
SEM-I is an extra hurdle.

Mike: There are some tools in the logon dist that can help maintain this
stuff outside the grammar (SEM-I)

Dan: There’s a lot of chaff here, we need to capture patterns for these
particle associations.

Oe: Conceptually, what are the two pieces we trying to associate?

Francis: For this lexicon entry, if I’m looking it X dictionary, here’s
how you should look it up (under). “Give up” must/should be looked up
thusly.

Oe: You are saying there’s a conventional citation form for many
words...

Francis: ...all languages...

Oe: A conventional predominant citation form...

John: Different types of dictionaries have different conventions for
this.

Francis: Yeah, yeah, it’s always going to be slightly messy, but in my
experience, a well-known, well-understood citation form is sufficient.

All: it could be a separate table

Oe: Do we associate semantic predicates in the SMI with these
aforementioned citation forms? Then there’s also …. ? … There are
different arguments to be made.

Francis: \[...\]

Emily: Why do you want to do this? What are all these use cases...

Francis: Finding frequencies, I don’t want to throw information away.
But meanwhile, I’m happy to use a standalone table. And try to link it
through the SEM-I.

Woodley/Emily: Mapping to wordnet synsets contain lemmas or canonical
form already probably.

Francis: I was thinking of two tables. One that has the give\_v\_up to
“give\_up” and one that gives “give up” to “give\_up\_238948345”. A
single synset might have multiple…

Woodley: The pivot seems to naturally be through wordnet, maybe not the
table you’re introducing?

Francis: No, I prefer to keep them under my control as two separate
things because I may not agree with wordnet and want to override. Sounds
like some people might like to see these when they’re ready...

Woodley: What degree is the mechanism for maintaining these usable by
other grammars...

Francis: Not much, unfortunately.

Last update: 2017-08-08 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/OsloWordnet/_edit)]{% endraw %}