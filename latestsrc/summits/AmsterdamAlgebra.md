{% raw %}MRS Algebra

* Convener: Liz Conrad
* Scribe: EMB
* [Slides](https://github.com/delph-in/docs/blob/main/summits/2025/MRS_Algebra.pdf?raw=true)

Prompt: What is the MRS algebra?

Alex: Formally an algebra is a set of things (at least a pair) and an operation whose domain and range is in that set. Think arithmetic. The integers & addition is an algebra. So is the integers addition and multiplication. It's not part of the formal def of an algebra that the result of combining to things has to be larger, but in our case it is, because lists get appended.

Guy: Is that just to clarify is that the only part of Liz's def that is more specific than the general definition is "larger".

Guy: Adding to that. The word algebra also describes many other systems in maths. Alex is clarifying why the MRS algebra is called an algebra.

Alex: A binary operation whose domain and range ar ein the same set of things. A closed set of things.

Prompt: What makes it an algebra?

David: Yes. That's the domain and range of the function.

Alex: Your understanding is spot on.

Prompt: What is the purpose of the MRS algebra?

Alex: I don't remember that, but I do remember other reasons we liked the algebra. Two things here.

Why do we like doing composition with unification instead of lambda calculus? Don't have to specify the order in which arguments will be filled as you go bottom up on the syntax tree. (With lambda calculus you're forced to give the order.) lambda-x, lamda-y love(x,y) will give the wrong result in a VP-having language. Lambdas force an order in a way unification does. The MRS algebra is working a bit more like unification in that respect. Don't specify w.in the algebra in what order the slots will get filled. Second: There was no constraint on what is unified with what when doing composition. That's missing a linguistic generalization. Can't pick just any old argument from within the EPs. wanted to constrain it. Constrained it by allowing only three elements within the HOOKs and slots. CLaiming that was enough. I'm sure Dan will tell us that's not true.

Dan: It's nearly true.

Ann: The algebra is an attempt to say something constrained about what semantic composition is wrt some syntax. If you talk about alternatives like lambda calculus it doesn't really do that.

Alex: It doesn't. The logic itself.

Ann: There is a thing called labeled lambda calculus that doesn't have the order problem.

Alex: Yes there are versions... but lambda calculus as a language is more expressive than is needed to do semantic composition from syntax.

Ann: Yes, that's the general point. We were tryign to say that we think and HPSG grammar has certain properties that we want to try an capture. Not just this grammar, but all of them. The syntax/semantic interface can be captured by this. The accessibility with only those three elements exposed means you can't go grab a new element from the list of EPs.

Emily; We don't always hold to that, e.g. Wambaya grammar.

Dan: It is interesting because it doesn't follow the algebra. The algebra makes a claim and your analysis of Wambaya challenges it.

Emily: And your do-be construction.

Dan: I think I've found a way around that, better than 10 years ago.

Ann: The slides later show us a place where this isn't going to work.

[Side quest into idioms headed off.]

Prompt: What is a SEMENT? How is it different than an MRS?

Ann: An MRS implicitly has equalities between variables. It's just that when you did the algebra you had to make the equalities explicity.

Alex: I'm also not sure what you mean by "finished"

Ann: An MRS is a structure that is associated with a-- it's not there to do composition. It's there to express some meaning representatoin.

Alex: What the result of composition was.

Ann: Or the start of generation. SEMENT has the addition of the hook (sort of; these are in the MRS, but that's a hangover) and the slots are there to do composition.

Ann: (re GTOP) it was useful at some point to have the fictional GTOP label to say "This is the guaranteed highest point in the scope tree" but never identified because there can be any number of quantifiers in between. But it's never been important in actual grammars. At some point we thought we'd use it for some DRT-type stuff, but didn't get into that.

Guy: The HOOK -- don't we also allow an XARG as a third argument?

Ann: Depends on the version. Was left off early on for simplicity.

Liz: Ignoring it because I'm scared of it.

Alex: That's fine. If you're only interested in formal aspects, this is good enough.

Prompt: What are the possible operations used for composition?

Ann: Indefinitely many, each related to a syntactic operation (op_mod, etc). Every time you have a particular syntactic operation, in principle you have a different relation in the composition. You're right that those classify as scopal or non-scopal, but that's a classification not an exhaustive list.

[Slides showing non-scopal composition]

Alex: Op_mod, Op_spec all of that is telling you waht the X is.

Guy: Saying the hook is fro the functor, we wouldn't apply in modification.

Dan: There are two kinds of modification, scopal and non-scopal. In non-scopal it comes from the argument, not the functor.

Ann: I think that paper doesn't say that. And I think we're coming on to why it doesn't say that.

Dan: It's certainly the case that our views on modification evolved around the year 2000, so when you wrote the paper we were still under this illusion. We made sure that the adjective's shape was such that it would pass the right thing up when it combined with the noun. Since then, we discovered that the adjective's eventuality was important, but not the right index to pass up to the mother of *big cat*.  Used to preten that the adjective just passed up the index of the noun to the mother.

Alex: Looking at the paper, that's exactly what we did. Forgot about the event variables.

Ann: They weren't there yet!

Dan: Were still following P&S and this is their view.

Ann: Following a lot of people who don't put event variables on adjectives. In some sense this was a fairly standard notion of semantic composition reframed in MRS-y terms. In lambda calculus, the adjective is the functor and you expect it to be in charge of what gets passed up. Not just inventing things based on what we had done in the gammars, but a reconstruction of a fairly standard approach to semantic composition.

Alex: But it's not what's in the ERG.

Ann: Stopped working some time in the 2000s.

Dan: We started to see it as important to decompose those three elements of the HOOK. Not the case that all three always travel in the same way. LTOP always comes from the functor (still true; identified with the argument). The LTOP behaves the way you say still, but INDEX and XARG do not. Needed a more fine-grained description of propagation of information here.

Alex: What Ann said is still correct that you've got lots of operations, one for each slot label, and they broadly classify into two types.

Liz: Identifying LTOPs in non-scopal composition. Always true? not in the paper. Seems true.

Dan: Kind of true, but it's tricky. Can get negation of the functor. Ends up being right, but can't say it lexically.

Ann: We're agnostic about where it's being said.

Dan: Putting it on the construction works.

Alex: I thought the way we got round this in the paper, was within the lexical item for adjectives we made the hook label the same as the hook in the slot. The side effect of that is that the functor hook = argument hook, because of what the equalities do when you compose two things.

Dan: If you actually did that in a lexical entry there was trouble before we even started worrying about eventualities. *The unhappy cat* is going to be wrong.

Ann: The paper wasn't really about doing it in the lexicon.

Alex: I have no idea what's happening in the ERG. Just saying the way we got th equality in the grammar was using lexical entries like that.

Ann: In any case, it's a defined part of non-scopal composition that the label of the functor is equated with the label of the argument. It's got to be somewhere in the paper.

Alex: You could add it as an equality and then you don't have to lexically specify it.

Ann: It's part of what we mean by non-scopal composition that those two things are equated, wherever that equation comes from.

[Visualization of composition]

Liz: I labeled this slot as ARG1, but I've been told before that this doesn't work.

Alex: It's got to go with a syntax rule.

EMB: Liz doesn't have syntax.

Ann: What the algebra is about is the syn/sem interface. Could be anything -- in a categorial grammar wouldn't be very interesting. THe slot name is just "how do I link this thing to this particular operation". The trouble with doing ARG1 is that there are too many ARG1s around. Part of various theories of grammar is how to ensure that compositio works. What the constraints are on subject, complements, uniqueness is part of the idea of what constrains the syntax/semantics interface and that's what the slot naming is getting at.

Liz: When I show my use case it will clarify the tings I need help with.

[Slides showing scopal composition, question about "slight complication"]

Ann: Wiht non-scopal, can have a single operation to equate the hooks, in scopal, have to distinguish between the different bits of hte hook, so you have to write that out in detail.

EMB: So we don't add to the eqs, because we're equating hooks ... [gets stuck].

Alex: Wasn't this just a simple thing where we didn't want to overload the notation of equality.

Liz: Still not getting it, will ruminate.

Guy: [Something about HCONS]

Alex: YOu need the label in the slot, not the hole slot.

Liz: I think this something I didn't fully understand, and glossed over: that slots have both a label and a variable. I was thinking of ep for probably that has an ARG1 whose type is h anyway, but that's not really what the paper is saying.

Guy: Doesn't the ERG have an hcons rather than equalty for this case?

Dan: Right. To make room for quantifiers.

Liz: Why does a slot always have a label and a variable?

Ann: Because it's always filled by a hook.

Ann: Isn't this the part of the paper where we're takling about the qeqs?

Alex: No, it comes in the bit where we start talking about scopal relationships. So we introduce the handles to talk about scopal modification, so we can talk about hooks and holes. Gotta add them to the slots because the hooks have them.

Ann: I'm talking about the qeqs.

Alex: That's provided by the lexical entry for the scopal modifier like *probably*. Includes qeq between label in its mod slot and ?. You don't need to add the qeq in step 5. That's provided by the lexical entry for *probably*. What you need to do is to identify the hook of *sleeps* with the slot of *probably*.

EMB: I suspect this has to do with how Liz is doing things where she's got simpler lexical entries.

Ann: There's a later paper where I try to extend this to non-lexicalist grammars. Whether something is in the lexicon or not is not something that is a very criterial part of the algebra. So in a later paper I worked it through where it's in the constructions, not the lexicon. Much more comparable to what LIz is trying to do.

Prompt: Shouldn't there be two versions of scopal composition?

Dan: Maybe the confusion is that you were working from the assumption that there was just one kind of scopal composition, but in fact that's a class of composition operations.

Dan: In the ERG I go pretty heavily towards a lexicalist view, but you could also do more construction heavy. The algebra is agnostic to this.

Ann: The algebra isn't about HPSG or even unification. Should work for all sorts of style of grammar, all types of formalism.

Guy: Since Liz is taking a relatively constructional view, would it be fair to say that we need more composition operations?

Alex: Yes. And if you wanted to do this for CCG, it would have to fully lexical and you'd have loads of lexical ambiguity. E.g. special lexical entry *dog* for compound nouns involving *dog*. It's your choice whether you add semantics to the cx itself, or whether it's just an append of the daughters.

EMB: Let's get to what Liz is doing with this, because you'll see she doesn't have constructions in the usual sense.

Weiwei: oe told me years ago he did an experiment going from EDS (semantic graph) able to generate from that rather than MRS. MRS to EDS conversation is lossy but he was able to generate from EDS anyway. Maybe you can ask him about how he did that. If the original information is in graph form, maybe that's close?

EMB: The EDS graphs come originally from ERG parses of English sentences though. But these graphs aren't linguistic to start with.

Liz: Passing up slots - if I get two ARG1s, how do I tell which goes with what in a case like "locked box".

Dan: You're makign things too hard for yourself by keeping such a small inventory of slot labels. But also there is the option of just discharging or ignoring without filling a slot. The ARG1 of the adjective *locked* is a vestige of how the adjective came from a verb.

Ann: My intuition is that the solution is going to involve elaborating the names so you have identifiers for the components appended to ARG1, ARG2 or whatever. Something 1_ARG1, 2_ARG1 --- label the two components 1 and 2.

David: Is that going to be a problem when she passes this off to the ERG?

EMB: No, because those labels are just in the composition.


Last update: 2025-07-14 by Elizabeth Conrad [[edit](https://github.com/delph-in/docs/wiki/AmsterdamAlgebra/_edit)]{% endraw %}