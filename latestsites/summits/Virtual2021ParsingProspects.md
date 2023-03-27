{% raw %}Parsing Prospects

Scribe: Angie

**Olga:** I am looking for advice on parsing for my upcoming postdoc position with Carlos Gómez Rodríguez at A Coruña. It needs to be on parsing performance, and I’d like to connect it to DELPH-IN.

Slide includes some ideas from discussions from last year: parsing longer sentences. There are datasets which may be relevant that have really long sentences which cause problems. 

Word embeddings may help with the core parsing problem such as lexical type prediction.

Bottom-up parsing can be frustrating for some constructions that may be accessible with type-down parsing, like fronted constructions (German, verb fronting; Russian, multiple wh-word fronting). 

Exploring the parse chart for ambiguity may or may not be related to parsing speed.

I’m looking for literature. There are some resources such as John and Stephan’s chapters, but not an expert yet. I’ve created some simple parsers in courses, and have the CS background to be able to engage with various technologies. Can anyone recommend any general literature on parsing? I tried searching and it came up with little of use. I need something between compiler literature and the DELPH-IN notes.

**Guy:** I would suggest looking at CCG on supertagging? Try a Transformer model to predict lexical types

**Berthold:** There was work in 2006 from Tokyo group building on context free approximation. Can do top-down prediction. Were in the same ball park performance wise as [] crowd.

**Emily (in chat):** If you're looking at the supertagging literature, Bec's disseration on ubertagging is also probably relevant, as an adaptation (and improvements) to DELPH-IN/HPSG. [Paper](https://aclanthology.org/D13-1120.pdf)

**Guy (in chat):** You could also look at shift-reduce neural parsing, i.e. neuralise the lexical predictions, and neuralise the choice of parser transitions. 

**Alexandre:** Are these contrastive perspectives (audio quality issues)

**Woodley:** I think he’s suggesting to use a smarter tagger to make better part of speech predictions. Like Rebecca Dridan did. Maybe more modern techniques could do better by throwing out large portions of the search space. 

**Olga:** Would like to go back to literature question. What Berthold was talking about is already in the DELPH-IN space. But before we get into the DELPH-IN space, how do I become a specialist in parsing.

**Glenn:** All of the major parsing tools use chart mapping. So that’s a subtask. I have printouts of relevant literature.

**Alexandre (in chat):** My question is if predicting POS is different from predicting lexical types?

**Emily (in chat)**: @Alexandre, lexical types can be conceptualized as very fine-grained POS. For getting a sense of what's going on in parsing now I think check out [IWPT](https://iwpt21.sigparse.org/) might be good

**John:** I’ve written a chapter on parsing, one for 1st ed one for 2nd ed, for the [Oxford Handbook](https://www.oxfordhandbooks.com/view/10.1093/oxfordhb/9780199573691.001.0001/oxfordhb-9780199573691-e-018) (in chat) will email the PDFs

**Woodley:** I assume you have Implementing Typed Feature Structures.

**Emily:** IWPT conference may be a good place to start. 

**Olga:** That would give me a good sense of neural parsing, but that may be a little more specialized than I need to start with. It won’t be all immediately accessible

**Emily:** You could look at the titles and abstracts for the kinds of questions that people are asking.

**Guy:** Also arguing for neural: How do we get to the one correct answer? You could take a problem with a very large search space and use a neural method to try to find the one best answer.

**Olga:** Syntactic vs. semantic parsing. I could focus on syntactic parsing with feature structures, or I could focus on MRS, which would be a different space altogether in many ways. Most people would respond with why think of syntactic parsing, nobody needs that. Syntactic parsing is clearly useful for educational purposes, for example, are there other connects to the mainstream world that make syntactic parsing relevant, apart from producing the MRS?

Or even if the goal is to produce an MRS, what are the ways to position the task of parsing and the goal of speeding it up such that it would be an attractive 

**Woodley:** I think we have always viewed syntactic trees as a means to an end, specifically to get to the semantics. So we aren't different from the broader community in that respect.

**Emily:** Except for grammar checking, in MAL rule territory. The MRS helps but you’re checking the rule.

**Eric:** Has there been success with using MRS for microworld things? Shapeworld may be another example. 

**Alexandre (in chat):** @Dan, you mentioned earlier that moving from the external prediction of POS to an internal curation of lexicon. But Guy and Woodley mention the use of neural models of modern ML tools to predict lexical types... it would seem to be an opposite direction. The 'layers of interpretation...' paper is the one that motivates the generation of semantic representations in a modular way driven by careful syntactic analysis, right?

**Emily:** Alexandre put in the chat about the layers of interpretation paper we wrote, but I don’t know that that connects to speed.

**Berthold:** Where in parsing is the information available? It depends on the language you want to work on. One thing would be to look into the lexical type prediction problem. Morphological classes need to be treated different according to the syntactic level, particularly with verbs. This would be more than replication. How do you get the right granularity to work between the morphology and the morphosyntax. It hasn’t been done and it’s not the same as English. Morphology tends to trip up neural methods, so it might be interesting.

**Olga:** That’s an established line of publishable things.

**Berthold:** Neural models have a longer memory, so it may help for e.g. SLASH features (did I need a slashed or unslashed entry at that earlier point?). Maybe because they have more memory they can help with not sending you down the garden path. You don’t have to dismantle the parser, you can enrich the annotations. There’s the chart mapping where you can analyze and locally prune.  

**Woodley:** If you use English, neural solutions have similar performance and do it faster. In another language, you’re going to run into the problem of not enough data.

**Alexandre:** It may even be the case for domain, not just language. Most of the statistical parsers fail in specific domains. One direction may be identifying the constituents using brackets. How much would that improve performance by constraining the search space?

**Berthold:** Paper ACL 2003 Anette Frank et al typological parser used to guide the search space of the parser

**Alexandre:** Results?

**Berthold:** Speed up by factor of 2. It was coded in PET at the time. It penalized any parses that crossed the brackets 

**John:** [Guided Earley parsing](https://aclanthology.org/W03-3005/). There was a paper in IPWT (in chat)

**Emily:** Faster things might require less compute. The neural parsers trained on Redwoods may stumble. Buying speed with also some other thing that people are interested in. Over tagging may be faster and less computer intensive.

**Alexandre:** Those models are so large that many people can’t train it themselves. So it’s all about where you pay the price. People don’t care as much about the performance.

**Olga:** Question from earlier?

**Alexandre:** Dan said he’s moving from approach of standard to more creative approach of lexical prediction. Maybe it could help to predict more fine grained classes.

**Berthold:** You can experiment with the cut off point. With supertagging you wouldn’t just go for the chain of N best. The efficiency depends on the sweet spot of having the relevant information. How much ambiguity reduction can you get? 

**Olga:** Want to ask Jan, in the experiments that you were doing with DELPH-IN stuff, was performance an issue? If so, what were the bottlenecks?

**Jan:** With a large neural model with a GPU that slows things down. Pretraining is also a computational tradeoff. It’s a question of whether you want the parser to be faithful to the grammar or not. You could even use a constituency parser to predict the derivation tree directly and read something off that, but it might not be consistent in practice. 

**Olga:** Like a CFG approximation?

**Jan:** Yes, like chart parsing but not explicitly constraining for a valid HSPG parse.

**Olga:** How does the faithfulness figure into what you were doing?

**Jan:** With Emily we did an error analysis at some point, but don’t remember the details. There are some specific places where the MRS graph would output something that wasn’t well defined. It goes back to the needs of the application. 

**Olga:** The familiar precision problem.

**Emily:** The error analysis was in the generation with Valerie. It would be interesting to pursue a diagnostic exploration of here’s the range of possible . What happens if you move away from the training domain? What are the kinds of inaccuracies and how do those stack up against those applications. A task may really care about negation but not number distinctions. In the generation direction, it will just throw in a synonym, for many application that won’t matter, but some will. Use cases to map out the terrain and determine the range of priorities. 

**Alexandre:** How to compare the ‘semantic parsers’ if the end results, the semantic structures, may be quite different regarding the information they hold?

**Berthold:** if you want to do anything like approximations, make sure that the grammar can generate because it’s a good way to spot termination problems. If it’s not constrained by a finite input, it can spin. For the german grammar, it always died in the fourth iteration. It was probably an unconstrained list. It may be good to use attribute grammars. Keep some attributes like agreement, but parse more efficiently by constraining the size of the CFG grammars.

**Emily (in chat):** [SustaiNLP](https://sites.google.com/view/sustainlp2021/home)


Last update: 2021-07-21 by mcmillanmajora [[edit](https://github.com/delph-in/docs/wiki/Virtual2021ParsingProspects/_edit)]{% endraw %}