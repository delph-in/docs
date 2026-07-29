{% raw %}Moderator: Ann

Scribe: Emily B. (EMB)

* * *

*MONIAC -- can we agree this is non-symbolic?*

EMB: There is a symbolic relationship here between the water and the money, but the processing is not symbolic.

Ann: In the sense of one thing symbolizes another yes, but not in the modern use of symbolic v. non-symbolic system, probably non-symbolic.

Dan: How do you get the machine to simulate different behaviors?

Ann: Putting more water into one thing than another. Non-symbolic because the quantity is effectively indefinitely variable. Notion of dense that people talk about. Money, molecules of water not indefinitely variable, but this is indefinitely dense.

John: Do people talk about discrete and continuous?

Ann: Not much, but that's what they're after.

Spencer: I think of mathematics that involves continuous relationships as highly symbolic.

Ann: Trying to get some intuitions now, and then we can think about how they work or don't work.

*Embeddings as non-symbolic?*

John: There are labels there (DIM1, DIM2)

Ann: Labels because I wanted to put some there. But if it's compressed or like word2vec or a modern embedding, those don't have a real straightforward interpretation. Maybe a pseudo-interpretation, but not in themselves meaningful.

oe: By construction, they are positions.

Ann: They are not first class objects in any sense.

Glenn: Dimensions of meaning?

Spencer: Not first class objects in the way we usually think about meaning.

Ann: Not in any sense. Because which you end up with depends on data you started off with, plus compression.

Spencer: But could also look at the model as its own thing, so those numbers are first order objects.

Ann: Numbers are, dimensions aren't. Okay -- keep that thought.

Luis: One-hot embedding style embeddings?

*Early work on distributions (Harper, Spark Jones)*

EMB: Symbols as signs -- signifier (T/F) and signified (attestation in the data). But is that the level of symbolism you care about?

oe: Is distributional the same as distributed?

Ann: Gemma is trying to bring together distributional and symbolic (logical) approaches. Special issue >10 years ago, bringing together distributional lexical representations with symbolic representations of phrases. In Gemma's terms, the distributional work (lexical distributions), contrasting with symbolic.

oe: Boolean vectors symbolic, vector-space ones not. Depends on how we arrived at the dimensions, and whether they are interpretable. (Glove or later.)

Ann: Or even earlier work where those dimensions come from dimensionality reduction ... there is work showing that Glove etc are ...

oe: Depends on whether you consider the dimensionality reduction to preserve interpretability.

Ann: Work showing that word2vec and earlier dimensionality reduction, get the same thing if parameters are set correctly.

Spencer: It sounds like you could have two predictive models that produce the exact same predictions, while one is symbolic and the other is non-symbolic.

Ann: Not presupposing anything at the moment, but saying it depends on how you got there is uncomfortable to me.

Ann: Booleans, the counts, then... Even with Boolean have a continuous measure of similarity (Jacquard).

EMB: Two things to pin down -- what the symbols are representing (what level do we care about) and what we are doing with them. Boolean distributional representations (symbolic) but then talking about similarity between them.

Ann: Word senses of "symbolic" include "symbolic logic" so-named because there were squiggles.

EMB: So when Gemma said combining distributional and symbolic, would it be better to say distributional and compositional?

Ann: There are two types of ideas there -- composing distributional representations, but also looking at whether distributional representations can be symbolic [scribe missed the details there]. Most of the papers in the special issue were looking at distributional + compositional (the former).

Spencer: Rationally-valued -- metric space will also be discrete rather than continuous.

Ann: You mean because there's always going to be separability between the points, even if very fine-grained?

Spencer: Yes. Continuous/discrete more a property related to openness and closedness of sets, rather than distances. There's a difference between density that rationals have, vs. openness.

Ann: People talking about this formally outside compling talk about density rather than continuousness. Should probably be talking about density.

oe: Why does ability to define a continuous similarity metric make something less symbolic? Can do edit-distance over Dan's predicate values, for ex.

Ann: Symbolic representations can have derived non-symbolic properties, and maybe for logical representations. Can always start counting things and diving by other things.

Emily: Maybe it depends on why we might care about the metric. Jacquard metric across boolean vectors is probably interesting in a way that edit distance over Dan's predicates isn't.

oe: disagree(1) that could be a meaningful metric!

Luis: Are we talking about the string rabbit or rabbits in the real world? Things that are true about a symbol that represents something in the real world, vs. something that is true about a string of letters.

Ann: Aurelie & I worked it out in terms of a model--three white rabbits in the model, can define a relationship between the model theory approach to logic and then the distributional approach. You can say that that's non-symbolic if you like, but that's what I am curious about.

Spencer: Getting the sense that the construction is actually really important to the intuition that is floating around. Word2vec + sigmoid = Boolean values. Not fitting the intuition of symbolic that we're talking about anymore than... has to do with the construction rather than the type. It has to do with what we care about. Anything can be symbolic. Numbers are symbolic of the quantity that they represent. Does the construction and what we hope to get out of it matter?

Ann: I don't agree. I think there is something about dense/density that comes up in this modern understanding of symbolic vs. non-symbolic.

Ann: It's possible that what's under discussion in the compling literature is "is this a symbolic notation" in the sense of Nelson Goodman (1969). Notion of "symbolic" in compling may not be

EMB: What does "density" mean here?

Spencer: A mathematical system of numbers where between any two there is another one.

EMB: Symbolic system: each piece is a symbol on its own and there is rules for how they interact. If this is what Goodman means by symbolic notation, that would be comfortable to me.

Ann: Don't know where "symbolic system" comes from (e.g. at Stanford).

Ann: Nunberg wrote about all of the difference senses of "information" blending into each other. Haven't yet seen someone wrting about "information theory" and "information retrieval" explicitly differentiating between those senses of "information". CS (and compling) very capable of using words in a way that is completely not coherent. Looking at Gemma's paper, realized I don't konw what symbolic means. Seems like a blend of these uses, rather than a coherent idea.

Ann: Additionally confusing because Peirce uses "symbol" in contrast to "icon" and "index" (simplifying here) and possibly some of the uses derive from that, while the use in cognitive science is different again -- because what's happening in human brains are not symbolic in some sense of symbolic, but still used in cogsci to talk about properties of representations that connect to language but sometimes are independent of language.

Luis: Back to symbolic notation: Boolean vectors, count vectors are fine. But when you generate embeddings where you don't know what the values represent, as a notation, you've lost a meaning link between a dimension and what that should be.

Ann: When does it stop being a notation?

Dan: Is there a notion of reversibility of the mapping that's relevant? Symbol to signified and back => still in a symbolic universe. Once you've lost that anchor, can't go back again.

Luis: And then complexity comes into it. Anything simple enough you could trace back.

EMB: I want Boolean vectors to be distributional, not symbolic, vis a vis the meaning of the word being represented.

Ann: Logical rules have the same problem, but I look at distribution as distribution over models and assume that there is a relationship between what people say and the real world.

Luis: Counts over how language is actually used and that's more fair game. Even the ERG just tells how the string "rabbit" is used in his model of language use.

Ann: Back to the interpretability thing. MONIAC is nicely interpretable. Levels of liquid indicate M1. Symbolic system with a huge number of rules like GPSG allegedly having more rules than atoms in the known universe. Not very interpretable (and probably also dense).

Ann: Can a system without a formalism be symbolic? In the backformation from symbolic logic, by definition no.

EMB: Back to MONIAC--the thing as a whole symbolizes, but the way it functions (gets to the values) isn't symbolic.

John: Do people talk about simulations? Could probably simulate it to levels of accuracy, including a system that represents all of its processing in terms of symbolic rules.

John: Easier in the old days -- symbolic rules, statistics and connectionism off to the side not interacting with either. You had symbols and you had numbers.

Ann: We used to say probabilities were the non-symbolic bit, functioning as a surrogate for world knowledge, but maybe modeling some linguistic aspects not covered in the symbolic notation of the rule-based system. Symbolic system + corpus of many different speakers, where the probabilities don't apply to individual speakers.

Spencer: Thought experiment, for interrogating the importance of intentionality or how something is constructed or interpretability -- all of these so-called non-symbolic could run on a turing machine, which is a type of symbolic computation. If you really wanted to, you could define a precision. All rational numbers matter up to 13 decimal places. Take every possible rational number and assign it a symbol. Then all computation would be symbolic, manipulating a system of symbols using formal rules, finite number of rules given a size of problem, and get all of the same outputs you got by using ... Claude.

Ann: Could create a logic-based system out of fluids. That doesn't make it a non-symbolic system. The inverse is what you were talking about. But I think what matters is not the underlyingness of the underlying thing; you've got to think about what the thing is actually doing. You could have a logic-based systems coming out of humans heads, but I dont think human heads are symbolic in the sense that we are talking about.

Luis: Back to compling specifically, trying to make up terms: cognitive and/or symbolic tractability. Complexity is a continuous dimension, but talking abotu interpretability. Everything can be interpretable if you break it down to the mathematics of it, but then you lose track. Changing a word changes everything, and can't track why.

Dan: You want explanation as a part of that symbolic representation.

Luis: There needs a potential to be cognitively tractable.

EMB: So is this about approaches within CL and maybe more rule-based (hand crafted rules vs. machine learning).

Luis: If you can give meaning to an embedding or what the rule is supposed to do, you feel cozy within yourself. But if you have a complex system that accomplishes the same thing that you can't put your finger on in the same way.

EMB: To paraphrase do you mean "Can the scientist working with the system treat individual parts of that as symbols, where they can assign meaning to each of the parts of it"

Ann: Coming back to MONIAC: it's very clear what it means.

Luis: But you don't know how the water moves through the process, etc.

Ann: It always means "money" in some sense of "money", but economists have different notions of money depending on where the money is.

Luis: Is it chaotic? Is the process itself a little bit chaotic, so you cannot award symbolic to it?

Ann: It's dense. You can attach labels to various outputs at various points, but not everything that's going on in every pipe.

Luis: Is it a problem with measuring (setting aside the level of molecules). Measuring in grams of water.

Ann: I don't believe that with MONIAC the way that the water is running around the system --- not every bit of water at every point is symbolizing.

EMB: Can't talk about the pieces within MONIAC as symbols.

Ann: You can say it about some of them (M1, tanks that are the Bank of England).

Spencer: Quote from Gemma paper about distinguishing interpretability from symbolicness.

Ann: I want to get into the confusion around the underlying terms. Gemma talks about LLMs as producing symbolic or near-symbolic categories. There may be some problem with that, but what I want to talk about here is the assumption that we know what this term means. That assumption that can't necessarily be taken for granted.


Last update: 2026-07-28 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/BergenSymbolic/_edit)]{% endraw %}