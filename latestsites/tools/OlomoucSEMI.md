{% raw %}*Scribe: Emily*

Ann: Please explain again what the objective of your project is. Will help focus the history of SEM-I discussion.

Liz: Taking graphs of referring expressions and converting those to MRS fragments or MRS and then trying to generate from what I composed using the algebra. I use the SEM-I to -- when the user fills out the lexicon, they say things like for wall, the PRED is _wall_n_1. etc. I use pydelphin to get that, via the SEM-I, taking the first synopsis.

Ann: Starting from a graph of a referring expression. Where do those graphs come from.

Liz: They come from the Perplexity games, was given to me in Prolog, but I converted it into these graphs.

EMB: Not referring expressions, bits of a world representation.

Ann: Those things are initially Prolog expressions, nodes would be recognized as separate entities, somehow.

Ann: What's the range of those things? Do you have a specified vocab to start with?

Liz: That's the job of a user. Dream for this project is to go beyond referring expressions. They have whatever data they have, goes through their data, finds entity, property, property value and puts it into a JSON file that they then need to fill in. The vocab comes from the data.

Ann: There's an indefinitely large complexity of data there. At the moment, you're assuming that everything ends up as generating NPs, but could include relative clauses. Might come back with more basic questions at some point.

# What is the SEM-I?

Liz: In a sentence or two, what is it?

Dan: The SEM-I is, at on one view, intended as a way of exposing to the outside world or a downstream (or upstream) consumer those semantic entities in the grammar that should matter. These are both the leaf semantic objects/predicates that show up in EPs with their arguments tructure, but in some cases also abstractions over those. Ex: hierarchy of types that we use to express quantification. A notion of existential and universal quantification, but things like definiteness and deixis are encoded as more specific existentials. The aspect of that SEM-I you've probably msotly been looking at is the set of surface predicates, PRED values of EPs, but there is also a slight abstraction over some of those predicates (the ones that are not string valued, though the string/type distinction is hidden by design). There is also an attempt to enumerate the properties that can be assigend to referential indices and events (TMA, PNG). The overall intention is to give external users uninterested in the internals of the grammar a reasonable expecation of what you'll find in an MRS.

Ann: The only thing I've got to add to that is that the intention was that this should be fairly stable, so that when the grammar changed, teh SEM-I changed not at all or in ways that were reportable so that people relying on the grammar could update their systems.

Dan: In the least ambitious case it's a kind of explicit report that can be used to compare versions of the grammar. More ambitious view (unsustained) to allow some kind of script based adjustments so that downstream developers could automatically accommodate any changes. Haven't figured out how to do that.

Liz: So in this erg.smi file are these all of the things that I have available as properties that I can use when creating an MRS?

Dan: Yes, these are guys you should expect to see in MRSes that we export.

Alex: m-or-f is something you'd see?

Dan: Could be. I think we were probably erring on the side of more communicativeness. I want to show that those things can be grouped, as distinct from n. We don't provide m-or-n or f-or-n.

Ann: One thing you haven't said is that most of the SEM-I is automatically generated from the lexicon. Relation names and synopses can be constructed automatically. A relation name in the auto generated part of the SEM-I is guarnateed to be in the grammar.

Luis: "Kim did that themself" - Kim is m-or-f.

Dan: In the collection Ann was just referring to (surface.smi). I have been attempting to make some improvements. Even in 2023 and probably even the trunk there are a lot of these arg psitions where we attempt to give you a type constraint (x and e, but unfortunately a lot of i and u). p = abstraction over x and h. "I believe Kim/I believe that Kim left." In this file there are a lot of u-type ones and I've been trying to tighten up the descriptions in the grammar itself so I can be more informative in this auto-generated SEM-I file. As Mike has often reminded us there's an annoying custom of using the letter i in two very different interpretations. One sense is that it's going to be an x when it gets populated, but it's optional. (This is for the MRS well-formedness checking, which wants quantifiers for every x.) The other use of that i is the technically correct one: an abstraction over x or e. Ex: ARG1 of prepositions. You'd never know which one I meant.

Alex: Don't the square brackets indicate optionality? ex: _spread_v_out.

Dan: It's possible that if that [ ] machinery is reliably generated, it could help with the disambiguation, but I've never carefully checked that mechanism. But it doesn't quite serve: "the dog chased the cat" -- won't get [ ] on the ARG1 because active verbs require their subjects, but in the passive it can be not instantiated.

EMB: How about w as supertype of x?

Dan: Immediately headache thinking about how to put that into the grammar, because so many things going on in that type.

Dan: Would rather try to drive things down into x in the semi in the case where it's not a true underspecification of e and x. The question I have is if the arguments were always going to be ref-ind were always driven down to x in this file, who would get mad?

Ann: For the application we're talking about it is important to know what's optional or not.

Dan: I have another mechanism to declare that optionality.

Ann: For subject particularly, we know that that is more or less always optional. The things you need to mark in the SEM-I are the lexical oddities. Need to have a mechanism for marking optionality. If the square brackets are marking optionality in the cases where it's a lexical fact, then that would be good enough for an application like Liz's. The SEM-I isn't about the grammar. It's about an interface to applications. Easy to handle ARG1, but impossible to know about ARG2 without indicating. If that [ ] mechanism could be cleaned up to do that would be fine.

Dan: Thoughtful about ... we tend to have a tight correlation between SUBJ/ARG1 OBJ/ARG2 but have played with causative/inchoative in different ways to keep patient the same across both uses.

Ann: I'm pretty sure you don't do it that way right now for good reasons.

Dan: It is probably true that syntactic SUBJ or normative lex entry assigns SUBJ to ARG1.  I think I'd want ot think through the other inventory of lexical alternation rules that messes things up in a way that causes problems. If we could make that work would it be useful to drive these i-s down to x-s?

EMB: So all i-s that could never be e would be x?

Dan: Yes.

EMB: Would that help?

Liz: My question is if there's an x in an MRS I create that doesn't get realized, will that cause problems?

Ann: There's a flag that says check or don't check for the well-formed MRS ahead of time. I think that there are certain types of ill-formedness which would be potentially okay for generation. Empirical question.

EMB: Existence proof -- 567 grammars with x-s without quantifiers generate just fine in LKB and ace.

Guy: MRS equivalence? Ah but no -- because input and output will both have x.

Liz: How can it be generating from an ill-formed MRS?

Dan: That word is probably too strong. There's a test I use to check my analyses (maybe default setting for ERG) that will report unbound x-s as a mistake. But Emily's existence proof strongly indicates that there's a way to set the lkb and ace that won't have problems with that.

Ann: This flag is for sentences, and an MRS which corresponds to sentences, but an MRS corresponding to a phrase could be incomplete but could be perfectly well-formed for a nominal phrase. Was in there partly because when we were doing translation it was very useful to avoid trying to generate from structures which hadn't been correctly transferred (so a historical reason). I don't think you should need to worry about it, or if it causes problems, could fix easily.

Dan: So that suggests little cost and big benefit to avoiding dual interpretation of i in the SEM-I. Drive to x and depend on the square brackets to indicate optionality.

Ann: The system constructing the MRS input to the grammar can avoid having optional arguments (in brackets) exposed. If someone wants to use this sort of machinery and doesn't instantiate an argument where that's not optional then it won't generate because it can't find a well-formed sentence.

EMB: But not a problem with dropping a subject in passive and having an x.

Ann: Only the subtlety of getting the p-arg in there.

Liz: So that brings us to my question about _strange_a_to which has two synopses. My system grabs the first one but only the second leads to generation. Why can't I generate from

_strange_a_to : ARG0 e, ARG1 u, [ ARG2 i ]

... when I don't fill ARG2?

Dan: Reminder that preds for adjectives and adverbs are the same, but the ARG1 is e for adverbs and x for adjectives. It looks like there's an entry for strange the adjective. But what's that ARG2?

EMB: "strange to me"

Ann: Why are you picking up _strange_a_to rather and _stange_a_1.

Liz: Because I tried parsing to pick it. And saw _strange_a_to.

Ann: You've got a case here where a single relation shows up in two different types of contexts, one of which always adverbial (the second one) and the first one is the one you actually got in that parse, which is adjectival.

Liz: The first one is the one that I wanted, but why can't I generate from it and why doesn't ARG2 show up in the MRS when I parsed?

Dan: A subtle question about the script that generates the SEM-I. Putting info from two entries together into a single line in the file. But there can be subtle syntactic restrictions on those two lexical entries.

Ann: Why isn't it parsing with _strange_a_1? By the normal convention _a_to is at least potentially "It's strange to do this"??

Dan: The reason is grammarian error in labeling. I have a lex entry for the positive entry "strange" and handbuilt entry for "stranger" and "strangest". _strange_a_1 goes in the handbuilt ones, but should be the same predicate, all with _strange_a_to.

EMB: So that's why we don't see _strange_a_1 but why isn't that MRS leading to a generated result.

Ann: Try taking the ARG2 out and see whether we generate?

Liz: Yes. Dropping the thing with brackets made it generate here. If something is bracketed, it's optional but it's a slot that may be filled at some point.

Ann: My suggestion right now is that if you're putting something into the generator with an uninstantiated argument, you should prune that. This is part of this discussion that we were having about MRS equivalence because I think it's possible that the generator is saying incorrectly that this is a different MRS than the input and so won't output. This is one of the places where the discussion of MRS equiv was getting complicated. What do you do in the case of an unexpressed optional argument. I'm not particularly surprised by this behavior, but I don't think it's correct necessarily. So for now: prune. But maybe the behavior should change.

Dan: Probably good advice, it's not a satisfactory situation, because I still think the SEM-I producer is reporting the properties of strange. Compression is not being done correctly. It's not the case that you always have to drop optional arguments for the generator to be happy. [ARG2 i] in the output, and that works as input to the generator. I don't have to have that argument disappear to have the generator happy.

Ann: I think what's going on here is something funny with lexical entries, and I suspect that what's happening is to do with the MRS equivalence in the generator and the uninstantiated argument not being taken as equivalent to no argument...

EMB: So then Liz is stuck, because _eat_v_1 and _strange_a_to is have different behavior (possibly) and we can't know that a priori.

Ann: Liz, please test MRS for "the cat ate" without any ARG2 of eat, and see if it generates.

[Result: ARG2 missing from _eat_v_1 leads to no output]

Ann: It's the MRS equivalence being defined incredibly strictly -- more strict than we want. Want one that allows uninstantiated arguments to be there or not. Probably just a simple change to the equivalence testing function for the LKB. But don't know how quickly.

Guy: Also have a question about whether we want a difference between a predication that has an ARG2 that is unlinked, but doesn't have that ARG2 as feature?

EMB/Ann: Those count as equivalent.

Ann: In the generator. Different notions of equivalence for different use cases. Not sure if we need to check in the lexicon as part of that -- probably not, the syntax can take care of that.

Guy: Are there contexts in which we do want to treat those as distinct.

Ann: Probably. Somebody made the generator work in this way for some reason. May need flags (well-defined) but I can certainly see that there's an argument for saying that those two things are equiv. I have a vague memory of some unnecessarily acronomious discussion from many years ago about this, but don't remember content.

Guy: Dan are you deliberate in making a distinction between those two things?

Dan: Starting with some concrete exemplars. In the instance of this adjective strange, it has two quite different uses: "That is a strange cat." The other: "It is strange that we are discussing this." [ ARG1 h ] Also: "It is strange to discuss this topic." When it's used in that way, it can have an optional experience "for" phrase: "It is strange for me that we're talking about this." Two different predicates would accommodate that. Didn't have a deep reason to give it a different PRED name, but it leads to confusion in the SEM-I. The SEM-I construction tool chooses [ ARG1 u ] and then an optional [ ARG2 _ ]. What it's reporting in the SEM-I is true about the uses of _strange_a_to.

Ann: Strange aside, the behavior of _eat_v_rel is suboptimal and we should be able to fix it so that optional arguments can just be left off.

Dan: It bears on long discussions in the past couple of decades about what that predication should say about what can be inferred. Arguments that some verbs don't let you infer that there was a thing being eaten.

EMB: Your grammar is right. What Ann is saying is that the generator should be a bit more flexible in terms of what it calls close enough to give an output.

Dan: And if the input has only an ARG2 and no ARG1 you should be happy with "The banana was eaten"?

EMB: Yes.

Ann: I think this should be a relatively simple change to the MRS equivalence check. Nothing to do with hte grammars as such, unless you want to argue that there's a difference between cases like "The horse kicked" vs. "The horse ate" -- kick doesn't entail impact. The kick examples are relatively unusual in English, compared to the ones with implicit argument. So I would be in favor of people producing the input to the generator not having to know about the implicit argument cases, because that would mean decorating everything with implicit arguments.

Guy: Another example: "We rode" -- no ARG2.

Ann: I don't think we have a test set for making sure that the grammar is doing this suitably.

EMB: What about "That cat is strange to me" -- is the me not an ARG2.

Dan: Dunno.

EMB: If we updated the strange entry to have an optional PP[to] linked to ARG2, would that fix the SEM-I creation system's behavior here?

Dan: Maybe.

# How to get all the synopses out of Pydelphin?

Liz: It would be nice to get all of them back and just try them would help.

Dan: Do you know whether Pydelphin is always at least attending to those argument values when it gives you something? If you had two different synopses (one with ARG1 x and one ARG1 e) could Pydelphin give you back the wrong one, or does it attend to your request? So if I were to have that synopsis more precise, that might obviate a lot of the trouble here...

EMB/Liz: Just starting with the predicate name.

Dan: Then what I said isn't useful.

Liz: If I imagine someone else using this, you have to know too much to fill out this lexicon.

Dan: Where did that predicate label come from? How did you get that far without knowing what the ARG-ST should be?

Liz: By parsing in the demo.

Dan: Why stop with the PRED label? Why not hand in the x and e type things as well? They will drive you a more useful synopsis in the file.

Liz: I think I found it unwieldy.

EMB: If you're writing a tool to help someone do this, maybe they could grab more than the PRED value?

Luis: Pydelphin seems to believe it's returning a list.

Liz: Mike said on Discourse, by design it returns one.

Luis: That step gets you the predicate name, but then smi.predicate takes predicate name and then it returns more.

John: Coming back to the subsumption check. --disable-subsumption-test in ace (LKB provides similar) might get you the behavior you want. If you do, then you could pin the blame on the subsumption test.

EMB: Is it still the case that the LKB and ace versions are different?

John/Ann: Yes -- this is MRS subsumption (not fs subsumption) and so not precisely defined. (related to MRS equivalence)

Ann: Could be useful for generator users to get MRSes out of simple sentences and then also see what they would need to be able to input. Want to avoid having user look at MRS and work out exactly how the linkages work.

EMB: So simplified view that's enough for generator input?

Ann: Tools that prompt people to put in very simple sentences that help them create the MRSes that they want.

EMB: That sounds like what Liz is trying to build, so that people only have to find the predicates.

Ann: It's not just finding the predicates, but also finding the lexical arguments. So more general that what Liz wants to do. Maybe Liz will solve all of that and that would be great -- but utilities to help people use the generator would be great.

Ann: Maybe it's something that should be in py something or other.

# Anything else?

Liz: Is the official answer of the purpose of GTOP just so that you don't have to introduce another way for quantifiers to float above the main verb? What is the purpose of GTOP?

Ann: My version is that GTOP is there for a formal reason to make it possible to specify what's going on reasonably cleanly. Lighter weight way of doing it than other ways I could think of. (A good post-hoc reconstruction.) There were other reasons, but I don't think they're valid anymore. If we didn't have it, we'd have to add something else to the formalism, which would be clunkier. Shouldn't matter at all if a grammar has it.

Dan: I think I make no use of it, ordinarily.

Liz: What does "standard assumptions of the saturation in the syntax" mean?

Ann: We assume a VP -- COMPS is saturated before SUBJ. I was trying to respond rapidly.

Liz: I was trying to pass up slots and just fill them in where they get filled in. Because the algebra is meant to be tied to the syntax it doesn't happen, but it shows up for me because I'm trying to work in thin air without regard to syntactic order.

Ann: Yes. In some cases you might have to rename slots to make it work.

Dan: We did undergo some renaming -- extracted complements become gap slots.

Ann: In the second paper I wrote I allowed for slot renaming.

Dan: There are places where we attend to the problem you encounter by doing renaming carefully driven by the syntax.

Ann: THe purpose of formalizing that is to have the syntax/semantics interface be strictly parallel.

EMB: Cases where slots come up from the argument are modifiers of VP, which pass up the SUBJ slot from the argument (not functor). But maybe not a problem for Liz.

Ann: Second paper written because I tried to implement the algebra as something in parallel to the ERG. Those things in that second paper were there to support that.

Liz: ARG mapping could happen in any order as far as MRS is concerned, but the actual mapping is because of English word order.

EMB: (fill in later -- freer word order MRS doesn't care about order, but about some syntax) -- still worth trying to surmount

Ann: I think the ARG labels aren't going to work in general as replacements for the slot labels. It's possible that there might be a more subtle way of doing it that does work. It's not about the order so much, as about the signals as to what can happen. Even in a freer word or label there is going to be some slot labeling, but there has to be some syntax.

Last update: 2024-07-05 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/OlomoucSEMI/_edit)]{% endraw %}