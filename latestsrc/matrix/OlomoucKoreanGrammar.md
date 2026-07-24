{% raw %}# Notes from SIG on reanimating the KRG

*Scribe: Emily*

Francis: Goal of this session is to be able to parse a sentence with the KRG, using ace. Current status is that it compiles in ace, but doesn't parse.

Francis: KRG originally written by Kim Jong-Bok and Yang Jaehyung and extensively updated by Sanghoun Song (with input from me). Original version was a linguist's grammar, with an external morphological analyzer for tokenization (beyond the phrase level segmentation provided by white space). Sanghoun rewrote it to treat case markers as inflection so that there is no need for the external tool. Research continued until ~2013 (but version said 2011).

Francis: 363 rules, including root types, 157 lextypes. Not very small. There was some work on lexical acquisition from King Saejong corpus. Hand-built core lexicon + automatically acquired core lexicon. Small treebank.

Francis: Treebank contains parses, so can find sentences that did once parse.

Dan: In the LKB.

Francis: Tries parsing in ace: see parse chart without spanning edge.

[Interactive unification]

[Result: We were able to build the spanning edge interactively. So now faced with the mystery of why it's not in the chart.]

EMB: Points to FAQ -- [list of cases where interactive unification succeeds but the edge is not in the chart](https://delph-in.github.io/docs/matrix/GeFaqUnifySurprise/)

EMB: If the LKB and ace show the same behavior, then we're looking in the grammar.

Dan: Another source of that situation is if one or more of the morphology rules required was skipped.

[LKB fails to load grammar, complains about ' notation and :< notation.]
[Fixing ' to " " leads to grammar that gets further, but LKB crashed during indexing.]
[Loaded on second try.]
[One of the sentences from the pre-set parse history list did parse.]
[LKB does parse the sentence in question.]

Dan: Compare the unary chains up to the largest constituents in the chart between LKB and ace?

[They check out.]

EMB: When you compiled with ace, did it complain about anything?

[Just irregular morphology, which is not relevant in this sentence.]

EMB: Are the scripts for ace/lkb actually loading the same files?
Dan: First, with the recompiled grammar, can we reproduce the same surprising unification result?

[Same]

Dan: What else can cause the engine to not put something in the chart even if the unification succeeded?
Were there any token mapping/chart mapping rules? (something about punctuation missing)

Francis: I chose to add a very simple repp that basically does nothing. There is no chart mapping.

Dan: Okay, line by line through lkb script and ace config.tdl, which points to a file chosen by the grammarian.

[Here: krg.tdl]

Francis: Worth looking at user-fns.lsp?

Dan: Unlikely.

[mtr.tdl is one diff]

EMB: But if we had any types dependent on these, ace would complain on compilation.

Dan: Ace might be checking the append of the orthographies before recording it in the chart (grasping at straws, but maybe??)

EMB/Sanghoun: Trying a different sentence (the dog barks) with ace.

[Also works in LKB, but not ace, with spanning subj-head missing again.]

Dan: Can you do a different sentence where the topmost edge isn't subj-head?

Francis/Sanghoun: Try OSV sentence.

[comp-head is now what's missing; subj-head works if it's not the spanning edge.]

Dan: Can we do an embedded sentence, so that whole sentence works together?

EMB: Can just add any word.

Dan: Right, to see if the edge we want is there if it's not on top.

[Succeeds]

Dan: So ace agrees that the grammar licenses that structure, but not as a spanning edge.

EMB: Does ace check the initial symbol before putting it in there?

Dan: No. Suspect that it has to do with some ace config setting.

Francis: config.tdl comes from yue grammar, which works. But took lower level file from existing pet one.

Francis: If I change the root to lex-root, and just put in a word, getting results.

Dan: But your chart only has one cell in that example.

Dan: There's some check for something like token length or something else that's not working. Sensitive to tokenization methods and how those are declared. Trivial tokenization method you added is maybe not quite right.

Francis: How do I look at tokens?

Dan: Yes, looking at the token chart might be informative here.

[ace with -vvvv gives 'not using rule 'subj-head' in spanning cell]

Dan: Does it think there are the wrong number of characters?

Francis/Sanghoun: 5 (including space)

Dan: How does it know that the characterization is right? Do you have character positions in the tokens?

[file inside pet the same]

Dan: Dumb experiment to try -- add copies of those three lexical entries but use just ascii characters as the spellings.

Francis: But the yue grammar works just fine, so it's not that.

Dan: To see the token chart, in the ace engine -- type ":break all" and carriage return and then enter the sentence.

[Nothing comes up.]

Dan: So chart mapping isn't being used.

Francis: Maybe that's the problem.

[Confirms that yue grammar still doesn't have chart mapping either.]

[Trying small Matrix-derived grammar for Korean.]

[Success]

Dan: Okay, so compare the config file between these two Korean grammars.

Francis: Could it be quickcheck?

Dan: Could be anything at all. Since we haven't been able to logic our way to it, it must be something obscure.

[Diff in deleted features, with krg config file deleting features that it doesn't have -- APPEND, END-LIST, NEW-LIST.]

[Not it.]

[That was it for config.tdl]

[Nothing in krg.tdl]

Sanghoun: Look at the roots files?

[parsing-roots wasn't pointing to a type that's defined!]

[fix that and ...]

[SUCCESS!!!!]

EMB: Bug report for Woodley -- it would be helpful if ace pointed out at compile time that the parsing-root parameter pointed to something undefined.

Francis/Sanghoun: Get longer sentence up, edges in spanning box, but no parse result. Now can do interactive unification.

Francis: Emily please add an item to the FAQ page for this scenario.

Francis: Sanghoun, can you remember what the profiles are?

Sanghoun: KPSG (Jong-Bok's book, example sentences)

Sanghoun: seri is test items made by the institution Seri, 20 years ago.

Francis: A general grammatical test set + one small one.

Francis: MRS testsuite (but short) inside KPSG. Doesn't have e.g. the dog barks. But I'm sure we made it at some sage.

EMB: There's an old wiki page that has the parallel MRS test suites.

Francis: Gold testsets are very small, but at least there's something.

EMB: You can create an initial state profile but just running them all now before any other grammar modification.

Francis: Want to try to update to current matrix.

Dan: Interested in doing punctuation? Have done recently for Spanish and Portuguese. Portuguese is probably the easier one to look at -- config files, etc. Importing that would almost immediately give you the basic raw machinery (token mapping types, token mapping rules, placeholder ... file). Then add a punctuation mark. [Scribe could not keep up.]

EMB: I'm not keeping up with what you just rattled off Dan, but I heard you say something about "I could write up a..." and I encourage you to do that.

Dan: Yes, can do that.

Francis: If you do, then we want to put it in Cantonese, etc.

Francis: Miša -- When do your students get to relative clauses?

Miša: End of first year.

Francis: This grammar won't be up to newspaper type sentences, but should hopefully keep up with student sentences.

Dan: How many different subcat frames for verbs?

Sanghoun: IIRC, I added a lot at that time.

Dan: 12 or 200?

Sanghoun: Between that. 50-60.

Dan: That's a good start! Should be good for a learner corpus.

Francis: per ltdb, 157 lextypes total. 43 verb types.

Francis: And Sanghoun, you said you also had a student interested in using this for learners?

Sanghoun: Yes.

Francis: Any idea what type of phenomena?

Sanghoun: Don't know yet.

Francis: Let's keep in touch!


Last update: 2024-07-05 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/OlomoucKoreanGrammar/_edit)]{% endraw %}