{% raw %}# Discussion: Linking ERG lexicon and English WordNet

**Moderator:** Dan

**Scribe:** Mike

**Slides:** [ergwordnet.pdf](https://github.com/delph-in/docs/blob/main/summits/2022/ergwordnet.pdf?raw=true)

## Minutes

- Dan: We are aware that the ERG has a lexical coverage gap. Petter, how many does your grammar have?
- Petter: Around 75k
- Dan: Yeah, some of these grammars have had efforts of lexicon expansion. We also use techniques like POS tagging to get around the gaps. Comparing to some dictionaries with nearing 1 million entries, how to define what is a word is messy. A real issue with lexical gaps is generation; we don't have the same machinery as with parsing. We've done some work here with proper names, but it doesn't work in the general case, for reasons that Woodley or Stephan will remind me. Our POS technique generates predicates like `devined/VBD_u_unknown` with a convention on the predicate format, which we know how to deal with, but Manning, 2011 says that 97% tagging accuracy isn't great; it means about 1 in 2 sentences has an error. So I don't like this solution for parsing, and I really don't like the situation for generation. This is not a good base for downstream work. Furthermore, a word like *devine* has interesting syntactic behaviors which means that I need to record something in the grammar to properly handle them.
- Dan: Enter the WordNet -- 155K words in 176K synsets, 207K word-sense pairs. There are other lexical resources, but I like WordNet: Francis is working on it, etc. It's an ambitious goal to map the WordNet to the ERG. I estimate about a year. If anyone has ideas about how to speed this up, I'm happy to hear them.
- Dan: There are mismatches between WordNet and the ERG's lexical entries. I'm worried about proper names. We decided a while ago to reduce the number of proper names in the ERG. They are not interesting linguistically and it's an open class. There are some things, like *San Francisco* which turns into a noun-noun compound of *San* and *Francisco*. So how do we decide what to include?
- Dan: Naming semantic predicates is another issue. We have the word *lie* as in *He lies all the time.* and *The book lies on the table.* which look the same but their past tense is different. So we'll need two different predicates for these. Unlike, for instance, the financial *bank* and river *bank*, which always behave the same.
- Dan: There are a couple of risks. First: some processing engines may not work well with 150K+ entry lexicons. John (Carrol), do you think the LKB would work with a lexicon of this size?
- John: Should work
- Dan: And Woodley? Glenn? Mike? Francis?
- All: no issue
- Glenn: One thing is the docstrings, but you can discard those when loading. The files may be large, though.
- Dan: Ok good, so let's pretend this problem doesn't exist. The next issue: the parse selection may do worse on rarer unknown words. Woodley, any thoughts on this?
- Woodley: not sure
- Emily: So you think this will cause issues with backoffs? So you might find the frequency threshold for which you want to lump together things for parse selection purposes.
- Dan: Maybe, I don't understand that though.
- Francis: But it only requires the syntactic type.
- Woodley: Even if a treebanker doesn't need to distinguish anything, the parse selection might.
- Francis: So Emily is saying that we might just replace anything that appears only once with an `UNK` token.
- Dan: Ok, so there may be some techniques to deal with this.
- Glenn: What about homonyms?
- Dan: The tagger should be able to handle this using context.
- Luis: In the example where you want to distinguish two words... Do you see in this new, linked world that you would increase ambiguity where words do not differ syntactically?
- Dan: Let me rephrase that to a question I want to answer... Let's say that I see *lie* (v) and I need to decide if it's one or the other, and I've put info in the lexicon so when it's decidable we only choose one...
- Luis: Yes, but some may ask why you have 27 entries for *give*. I also want to do this for Zhong...
- Dan: There's a strong interest in being able to treebank **and** sense-tag. Let's say that after working on this, I no longer want to have a single entry for *bank*. So now the parser will have twice as large a chart to work through because of the ambiguity.
- Emily: But it may be packed right away.
- Woodley: Yes, I've said that's possible before.
- Dan: In that case, my workload increases to build this lexicon.
- Luis: Don't worry about those large numbers in the lexicon size. WordNet has been criticized for being too fine-grained for any real work, so it may need to be pared down. We also need to identify the "core" synsets.
- John: Sometimes senses cross-cut syntactic behavior.
- Dan: Another source of mismatch.
- John: It's more an issue when it's cross-lingual.
- Luis: I'm thinking the semantic predicate would have a direct link to the wordnet, or to a set of synsets.
- Dan: I'm not going to replicate Princeton's workload by mapping each predicate to structural elements of the wordnet.
- Francis: As John pointed out, you won't have 27 senses of *give* on a predicate because they have different subcategorization frames.
- Woodley: In WordNet, is there one word *lie* or two?
- Francis: Words in WordNet are surface strings, so there's only one.
- John: Going back to *devine*, you want to create an entry so you can look for its presence in WordNet...
- Dan: It's a cyclical process, like I did with Zhang Yi on the BNC where we categorize the first 5 patterns then iterate and refine.
- Francis: In fact, WordNet does tell you the distinctions between *devine* (well, only for *divine*, not with an *e*).
- Emily: About proper nouns. If you were happy with WordNet's notion of that boundary... well, does WordNet have such a notion?
- Francis: Yes, *San Francisco* is an **instance** of *city*. But they are largely grandfathered in. Current practice is to not put them in in most cases.
- Emily: Then this says we should not do it.
- Luis: But for those that are in, like *Sherlock Holmes*, we know it is an instance, but you cannot rely on it.
- Francis: E.g., *John Watson* is not in WordNet. But if we have *Glaswegian*, we need *Glasgow* to know that the former is a resident of the latter.
- Guy: There's a shared task on complex multi-word names. E.g., movie names can be anything at all. So it may be just that we have a gazette of these things that is separate from the WordNet.
- Dan: In Beijing, students were using things like *Thor: Ragnarok* which is not otherwise indicated to be a name, so we ended up preprocessing those to replace them with some stand-in token. So we decided that these are not our problem. But once I have the name, I know what to do with it.
- Eric: What I've done is put quotes around them when they are detected. Can we get support in the machinery or grammar to do something like this?
- Dan: We could define some API that goes beyond simple double-quotes, which have many other uses, so we come up with some unique, unlikely string to indicate them, then the grammar can treat the whole span as a single entity.
- Mike: And coordination always creates an issue
- Dan: Yes, like the *Universities of Washington and Illinois*. There are limits to what we do, but yes that issue of composition in names... if I have them marked I'll try to do something with them.
- T.J. Regarding AWS, it's $67 per hour for 16TB (editor note: could be wrong on the numbers).
- Alexandre: What about *make* and *have*, where *make* has N (>50?) senses?
- Dan: There's a blurring of the light-verb use of *make* with others, and I don't think WordNet has that conception, like *make a movie* and *make a mess*.
- Woodley: There will be situations where you want to disambiguate, but not as far as WordNet.
- Dan: But since I don't care how long the predicate strings are, we can just append the sense number when we know it.
- Luis: We could delay the decision
- Dan: And put in some `[ AMBIGUOUS + ]`
- Francis: And we can use the SEM-I
- Dan: But I've been told that it should not have too many types
- Woodley: Predicates don't care whether they are strings or types
- Francis: So if they are just in the SEM-I they could just be strings.
- Dan: So leave them as strings in the grammar and use the hierarchy in the SEM-I. That's interesting...
- Francis: For those unfamiliar, the SEM-I does... (explains [[SEM-I|SemiRfc]])
- Woodley: When we discussed using the SEM-I 4 or 5 years ago, there was a homework item to look into if the SEM-I could handle what we want. Did that get done?
- Francis: no.
- Luis: If we want to substitute names like movies and books, I'd like to have types of named entities. Even for mal-rules, types help here.
- Dan: Yes, but I'm not eager to make the lexicon into an encyclopedia.
- Luis: Someone has done that for you
- Dan: Then why should I replicate it?
- Emily: But this gazette would help you to just see `MOVIENAME` instead of the full name for each movie.
- Francis: We're interested in this for English, Japanese, and Chinese. Any other languages?
- Olga: Spanish, possibly
- Dan: What about Thai?
- Francis: It's not well maintained.

Last update: 2022-07-19 by Michael Wayne Goodman [[edit](https://github.com/delph-in/docs/wiki/Fairhaven2022-Linking-ERG-and-Wordnet/_edit)]{% endraw %}