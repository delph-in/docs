{% raw %}# Improving robustness in grammars

Main techniques:
- Expand lexicon (e.g. top N most frequent words in a corpus)
- Add generic entries (triggered by POS-tagging or chart mapping; see [slides](https://github.com/delph-in/docs/blob/main/summits/2023/robustness.pdf?raw=true) for examples)
- Add chart mapping for dates, measures, numerals, etc.
- Add rules for frequent but mildly ungrammatical constructions (e.g. dropping articles in headlines)
- For parsing a large corpus, reduce computational cost (e.g. shrink feature structures with "min" types, reduce search space with supertagging or chunking or PCFG)
- Use a PCFG (integrated with ACE) to approximate the grammar and provide MRSs when the grammar can't

* * *

Berthold: Could the extra entries be re-used across languages?

Dan: Messiest part, yes. Some conventions are language specific (e.g. 3,000 vs. 3.000), may need to edit regular expressions.

* * *

Berthold: Previous work combining fragments?

Dan: That work was displaced by the PCFG strategy. Tried to bracket off problematic chunks of the input, but it was difficult.

Berthold: PCFG requires lots of training data?

Dan: Yes, and lots of compute.

Alexandre: PCFG for pruning parse chart vs. providing analyses?

Dan: Yes, should have been clear that these are two different ways that a PCFG can be used.

Berthold: Both implemented?

Dan: ACE supports and I have experimented with only the second use (providing robust analyses)

* * *

Berthold: What about root conditions?

Dan: ERG uses root conditions to distinguish genre: formal and informal English, e.g. words like "gonna" and mildly ungrammatical constructions. Also used for strictness of punctuation.

Berthold: Punctuation as lexical rules?

Dan: Since ERG 2020, separate tokens combined with syntactic rules. Lexical rules true to how we write, but different from everyone else in the field. Sacrificed beauty for compatibility. Didn't lose linguistic elegance (haplology, etc.), but needed more care writing the rules.

Berthold: Could copy this?

Dan: Sprinkled throughout the grammar, but could help with this.

Berthold: Would recommend doing this?

Dan: As soon as you want to do POS tagging, you will want to do this.

Berthold: Other languages?

Francis: For Jacy, we were throwing away most punctuation for a long time.

Emily: Some languages morphologically mark questions, so less need for punctuation.

Berthold: How much bookkeeping?

Dan: Need features to keep track of all the punctuation to the left and to the right, must be combined before "normal" rules can apply.

* * *

Dan: Ewa Muszynska looked at chunking in the generation direction. Similar technology could be used for parsing.

Hei: Gives an approximate parse?

Dan: Doesn't have to be pruning. Could use as guiding search space: first try to parse respecting the chunks, and if no parse is found, continue to search.

Berthold: Processing engines?

Dan: Special tokens (unusual Unicode brackets) recognised by the grammar. Rules to recognise when the tokens have been found.

Guy: This is implemented, but not the guided search?

Dan: Yes. Would need both the oracle to give the brackets, and the processing engine to respect them. The oracle is crucial. The second step could be skipped with only a small cost: try parsing with brackets first; if no parse, start parsing again without brackets.

* * *

John: Percolating genre feature top-down? To restrict what can be built?

Dan: Feature which is unified, so whole sentence must have same genre.

John: Could the parser take advantage, to avoid building edges?

Berthold: Token mapping rule?

Dan: Yes, could map genre to every token.

Berthold: In Hausa, different conventions for indicating tone and vowel length. Or only partially indicating.

Dan: For genre, don't have a good sense of how much benefit there would be, haven't pushed this point. Worth measuring. In chart mapping, would there be a way to say, "I don't want robust"? Would need additional types.

Last update: 2023-06-29 by Guy Emerson [[edit](https://github.com/delph-in/docs/wiki/GaliciaRobustness/_edit)]{% endraw %}