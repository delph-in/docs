{% raw %}# Discussion: Semantic vs Syntactic Treebanking

**Moderator:** Berthold Crysmann

**Scriber:** Tara Wueger

**Slides:** 

## Minutes

### Overview

- treebanking ?Hausa grammar
- train up students to do disambiguation/annotations
- get students to understand what are semantic relations
- what is possible/can be made possible easily to allow treebanking remotely?
- 2 ways to treebank: people don't need to know what set of rules ... basic semantics vs. have to teach people to know what set of rules; much more in terms of machine to compute the meanings
- in lkb and switch between 2 ways; different syntactic rules (minority of cases)
- thinking of training up students; be more aware of ambiguity; understand output of mrs grammars; worthwhile skill to teach
- lkb linked to tsdb++ doesn't ?properly allow treebanking
- what you get in web demos in lkb/tsdb++ logon web demos: discriminators; pick/choose ones you want/don't want; not connected to database; not part of lkb-fos
- to what extent? where to look for? what could be done easily for treebanking?
- can that be extracted/used from full forest treebank?
- can web demos be connected?

### Discussion

- Emily: Why not the full forest treebanker? want semantic discriminator instead of little trees; but trees are more friendly than "here's the name of the rule and the spans"; get down to tree, then look at semantics; possible to set up as server to use for treebanking (Woodley helped Emily and Kristen set that up)
- Berthold: mrs discriminants would represent these relations in terms of trees; any value in that?
- Dan: in demo for 2014 version of grammar: used demo and found tree he (?Stefan) wanted, then added discriminants that were more semantically driven, not showing all discriminants and picking convenient ones
- Dan: extract information you want and show those choices; communicate with maintainer of full forest treebank; most people that want to do treebanking never do syntactic part of grammar (not sure if we want them to since it's all based on theory - doesn't constrain enough); treebank on eds/dmrs segments (would be more engineering)
- Dan: won't work great when being promiscuous with number of parses; constrained limited to class of grammars can afford to enumerate enough trees so mrs you wanted was somewhere in there
- Francis: less than 10,000 trees; top 100 trees tree we wanted was in there 2% of the time
- Francis: need bootstrapping to get it (partial model) to work
- Berthold: 2% of cases couldn't be found in top 100 but could be found further down; bootstrapping limiting explosion; less idiosyncratic way of looking at grammars
- Berthold: helping ppl getting involved; in summer school, big discrepancy in what you sell to novice; learning curve for Hausa is extremely high; does woodley think it's worthwhile?
- Woodley: question on whether you can do semantic discriminants on full forest? no
- Dan: could you present semantic discriminants on ??
- Woodley: would be a different tool. i would not be likely to write that tool
- Berthold: what would it take to write the tool?
- Woodley: not too hard; if enumerated, not too hard; not an enormous task
- Dan: a lot of reusable code
- Woodley: ace only exports ?? mrs
- Guy: for semantic discriminants, what is the technical issue?
- Woodley: data that would be needed is in mrs but mrs doesn't exist yet when looking at shape of forest; doesn't look at features structures even at all; no info about mrs
- Guy: would you need to change packing machinery?
- Woodley: would be easy but wouldn't do you any good; would be very slow
- Guy: something in between?
- Dan: i don't think this is a necessary branch to go down; we can well afford to compute 100 trees; present discriminations to differentiate those 100 trees; can afford all of that
- Dan: show people how to take the bootstrapping step based on small amount of relatively short setnences; can afford to build/train a model and use that in future treebanking; if experience carries forward then answer would be in top 100; avoids issue with packing (that would be unpleasant)
- Woodley: packing idea would not be easy
- Luis: right now, don't have to be limited by any number; i tried a hundred; didn't find it so try 100 more; not limited; go down what makes sense and go deeper if have to
- Woodley: life wasn't so bad when treebanking top 500 trees
- Francis: was way better when switching to 100
- Luis: i did 500; took time to preprocess
- Woodley burden on person treebanking higher than on full forest treebanking software; useful for grammarian with 20 billion ??
- Berthold: pydelphin has dependencies mrs style visualizations is that right?
- someone: yes
- Berthold: ... go in C code?
- Luis: would never go in C code; machinery that pydelphin offers (?pyviz); there is a [link in my slides](http://www.luismc.com/itell/delphin_analyzer); what would be next step of a tool like that; store x number of parses and then have discriminant on mrs
- Woodley: server side running something that throws up mrs; use pydelphin to extract dependencies/mrs; use discriminator extraction code adapted from (for example) the lkb; delphin viz stuff to throw discriminants as partial tree events
- Dan: set of mrs's; figure out how to design/what little arcs you want to show/show the necessary contrast; "i didn't want the attachment here i wanted it there"; need partial diagram of dmrs or dds to make choice you want; then render that using existing delphin viz code; want something conceptually coherent that's gonna take more thinking
- Weiwei: use erg to annotate english as a 2nd language so a lot of sentences would be powered by erg; many rules ?... main challenge; reuse erg and analyze sentences; not much experience as annotator (are students w/ some basic linguistics); to present annotators with full analysis but mrs is difficult to read by students; show them the bilexical semantic dependency graph; the students can also see bilexical dependency structure; they can say yes/no to an analysis; if bilexical is corrected, underlying mrs is almost always correct; reasonable way for students in 2nd/3rd year of ling or compling
- Dan: if we understand right, you have some code that will take set of mrs's (say 1 from 10 trees) can compute bilexical ??; can make choices
- Weiwei: no; 1st thing is to use erg for 500 parses; use ?? to train ranking model that can use those few ?? and select from these parses; method is quite reliable
- Dan: annotator is just confirming/denying that top tree is correct (saying good/bad for single tree)?
- Weiwei: yes
- Dan: ... mal rules; script to compile erg will bring 100-300 mal rules which will improve robustness for corpus you are trying to parse; have you seen that?
- Weiwei: no
- Emily: we are out of time
- Dan: i will follow up with that separately

Last update: 2022-07-19 by taraw28 [[edit](https://github.com/delph-in/docs/wiki/Fairhaven2022-Semantic-vs-Syntactic-Treebanking/_edit)]{% endraw %}