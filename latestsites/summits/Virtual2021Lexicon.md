{% raw %}# Notes from the discussion about Large Lexicon and Grammars

aggregation project - minor resourced language. Data carefully annotated. Assumption: GE can be useful, but the linguists who work with these languages usually don’t have time or are engaged with GE. So AGG is trying to automate things for them.

Liz: shows toolbox data format. That’s what’s considered “raw” in AGG! You have interlinearlized data: sentences, morpheme segmentation, and then aligned glosses, and translations into e.g. English.

Shows FLEX format: same idea, but more xml-like.

Shows Xigt (also xml-like; that’s what AGG expects).

INTENT (Georgi 2016(?)): tool enriches Xigt, e.g. adds POS tags. Also phrase structure, dependency structure and other things. If the linguist didn’t add POS tags to their datasets, AGG uses projected tags from the structure tiers that INTENT added.

^^Reference of thesis

Lexicons: in choices files, there is a certain format for lexical types and instances (stems).

[Discussion about conversion to Xigt, and how converters may have bugs, but the point is, Xigt may create additional tiers e.g. by assembling words or morphemes into morphologically normalized phrases.]

Toolbox and Flex are tools used by linguistics. Xigt was created as part of AGG (and is pretty robust and easier to use maybe(?) than Flex (not to mention toolbox which is just text).

Alex: How important are translations? Could you do without?

Emily: For some components, maybe, such as the morphology (MOM; morphotactic inference). But the original purpose of the project was to serve languages for which most data is in the IGT (interlinear glossed text) format. For Portuguese, you have lots of data but probably very, very little IGT…

Alex: Tools like AGG can also serve as a communication tool (because it may help find relevant examples? OZ: I didn’t quite understand here)

Emily: Shows a Chintang IGT, explains how informative the format is, given the gloss line (in contrast to only having the language and the translation lines)

Berthold: Can we encode morphophonological abstraction in IGT?

Emily: That really depends on the linguist who is creating the dataset. At the moment, the MAtrix only works well with clean, straight concatenative morphology. Otherwise the grammar will have lots of allomorphs.

B: So, dashed glosses are better than dotted glosses?

Emily: Dotted glosses are good, but the way people gloss German is hopeless!

Olga: but maybe AGG is not what Alex needs; let’s discuss large lexicons generally.

Alex: We have a medium-size grammar, and the lexicon is already quite large. 

Francis: https://github.com/delph-in/docs/wiki/LkbLexDb TDL to SQL interface. You can add entries to the lexicon through an emacs interface to the database.

Dan: The above tool (lex database) was brittle, and it has no current engineering support.
The benefit was clean alphabetized set of lexical entries; predictable location of everything. But there was a learning curve and a memory curve, in the sense that you easily forget how to use the tool. But I may still go back to this tool when trying to expand my lexicon to accommodate wordnet. I would like our generator machinery to accommodate unusual words; there are probably deep reasons for this though. I don’t want to maintain a 100-200K-entry lexicon in a TDL file. So I expect to have to go back to a SQL database. May need to patch it up.

Dan: Even mass vs count distinction can be hard (for a POS tagger), or even adj vs noun in English. The taggers have 97-98% accuracy but this still means there is an error in every 3rd sentence. I think a big lexicon for a big grammar must have all the words (vs relying on a POS tagger? OZ: didn’t quite understand)

Dan: Maybe pydelphin tools can help in making the lexical database interface better

Francis: we put lexicons in SQL-light but there is no way to then go back. If we implement the conversion from SQL to TDL…

Alex: so: make the lex database an editor, not just browser

Dan: Need protection from silly editing mistakes

Tuan Anh: How hard would it be to reconstruct a TDL file from the database?

Francis: Not sure for the moment. 

Glenn: For English, SQL is an overkill. But for Thai, I had a bidirectional TDL-database setup. But SQL is not necessarily the best choice. A series of flat files (csv etc) , you can easily set up as a sort of simple database.

Dan: I appreciated familiar searching tools with SQL as well as flexibility in querying

Glenn: I had a standardized machine-readable comments for each tdl entry.

Alex: so maybe this lexical system would be a satellite tool for lkb in a same was as tsdb++ is

Berthold: follow up to what Dan said about POS taggers. With a more inflecting language, POS taggers work much worse anyway. Prtuguese verbs are certainly in this category. Lxdb was good for me in that it made me settle on a smaller number of parameters for types definitions. MAde for a cleaner German grammar. But I had to fix everything every time linux updated, that was a nightmare so much so I gave up.

Dan: Even I ran out of enthusiasm for similar reasons.

Berthold: Richard Stallman(?) developed some toon.

Dan: The search there is not great.

Michael: xsv tool is excellente for working with CSV/TSV files. Similar to SQL. https://github.com/BurntSushi/xsv

Bond: Ben's LkbLexDb allow lkb to access the lexicon directly from the database. We should switch to sqllite.

Dan: the move to manual lexicon is mostly driven by the bi-directional grammar (generation from generic entries is hard)

Alex: Another topic. Morphology. Issues for e.g. romance morphology, in current pipelines. FST should be able to deal with most issues. What is going on in our universe in that respect?

B: I stress-tested lkb-based morphology a lot. We can do our own parsing and generation (with morphology) without external tools, which is very nice. Two things I am not happy with (both not very relevant to Portuguese?): (1) compounding without spaces (as in German; need to guess the boundaries); (2) umlauts with arbitrary distance from an edge etc. (OZ: missed stuff here a bit).

B: The French grammar was using a lexicon imported from another source(?) but that only took a few days. Recommend: for Romance, stick to the LKB, you have more control this way. More flexible. I wouldn’t expect many pitfalls.

Leonel: I’ve been working with XLE in LFG for 15 years, had a midsize grammar for Portuguese there. Converted a large lexicon to a transducer format. I miss in LKB the XLE’s capability to plug in a transducer. Portuguese has suprasegmental morphology, stress change patterns. This can be nicely modeled in FST. One of our problems is very productive evaluative morphology (diminutive, augmentative). There is an interaction between the two suffixes, too (e.g. derive an augmentative from diminutive or vice versa). Must we convert the FST output to a large tdl lexicon? Or are there alternatives? We have 700K diminutives; must we convert that to a single tdl file.

B: There is a component in the LKB for spelling changes rules.  In my Hausa grammar, tone changes radically, so the grammar does suprasegmental morphology, reduplication. That can be done surprisingly easily in TDL, with character unification. Do not go for full-form lexicon; only stem lexicon + rules. And then just choose if you use an external tool or an integrated approach (via lkb). I think integrated is better.

Woodley: In Hausa, you use feature structures for diacritics?

B: You need to parse different forms: newspaper texts, linguist’s notes… So yes, you have lexical tone patterns done with unification, feature structures. 

Emily: 2005 paper by Jeff Good makes the case for handling morphophonology in an external component. But this doesn't mean (as suggest Berthold suggested) compiling to full form lexica:http://faculty.washington.edu/ebender/papers/Bender-Good-CLS05.pdf  . Rather, the ideia is that an external TST handles the mapping between actual orthography and a representation that is only polite concatenative morphology.

B: description about how he deals with lexicon morphology in the French grammar. 

Woodley: YY input mode. External tool to make the analysis. Not quite integrated. Spanish grammar used.

Last update: 2021-07-21 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/Virtual2021Lexicon/_edit)]{% endraw %}