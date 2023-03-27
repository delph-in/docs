{% raw %}Lars: Viewing the Grammar Matrix as something like a universal grammar
(ontology)

General component

Lars: Signs have three parts: phon, orth, meaning; constructions have
three: a grammatical function (gf), actant(?) (actnt), situation (sit)

Lars: Grammatical functions are things like SUBJ, OBJ, oblique, etc
\[charts demonstrating theoretical background\]

Bantu languages have complicated verb derivations. Lars walks us through
causativity and applicativity with some example AVMs. A feature D-BASE
for derivational base keeps track of what the valence operations operate
over. Lars also gives us a list of possible combinatinos (causative +
applicative + intransitive base verb, etc)

For Kwa serial verb constructions Lars shows us an AVM where we have V1
and V2 for the two verbs. Lars then analyzes the V2 as an adjoined VP in
the grammatical function. These then enter into the type hierarchy.
There is another mode of serialization: chaining, where V1 and V2 occur
sequentially. These are separate events. But there is no reason that the
situation (sit) could not be the same for different elementary
predications.

The extended verb complex is a verb with one or more preverbs that
attach to it, e.g. move-face-toward =&gt; Eng "trust." Lars models this
analogously to the modeling for SVCs.

David: SVCs share a subject and agree in aspect. This is interesting
because Nuuchahnulth is the same. For your V1 and V2 in your structure,
are these related to each other in the MRS with a predication?

Lars: No they share ARG0.

David: This is a problem if you need to modify one or the other. If they
have different aspect, mood, or tense, or if they are modified
separately. Can you go back up to a non-chaining SVC?

Lars: Here's one, Kofi throw leg pierce Kwame. (Kofi kicked Kwame)

David: What about adverbial modification? "Quickly", does it modify one
or the other?

Guy: "Quickly" isn't great. What about "painfully"? Who did it Pain,
Kofi or Kwame? Or push-fall, can you get quickly push but slowly fall?

Dan: You're making an interesting prediction with these grammtical
function structures, for example in control structures, you're probably
making an incorrect assumption that the control verb's embedded verb is
available through the grammatical function. This is one of the things
Ivan made a point of with locality. The only one that survives is this
external argument.

Lars: That's a good question. No it wouldn't be allowed...

Dan: It's sitting there in the grammatical function, what's preventing
you from grabbing a hold of it? A deeply embedded argument will still be
there at the top.

Lars: So there's no problem in making your rule inventory so it doesn't
happen. But should you write your formalism so that it cannot possibly
happen? You really believe you should have a formalism that prohibits
things from happening?

Dan: It's always a balancing act, but this is one of the things we do,
to have the formalism exclude possibilities that don't occur.

Berthold: Coming to Lars' aid, we can still make subjects more
accessible than objects, and so on. These structures are still nested
yes? So it's unlikely that you have some rule that says you are
accessing exactly three levels down.

Dan: But part of the theory is that argument structure is only there in
the lexicon. The claim was if you preserve that structure you have too
much information, information you don't want available in the syntax.

Emily: Does anyone remember what Emily did in her Wambaya grammar around
this problem?

Dan: We observed that the XARG attribute at the hook in a phrase allows
you to get to a syntactic subject, and she made a case for enriching
that inventory to include an additional one or two pointers. I think
that's a limited version of what Lars is introducing.

David: Sorry but why do we need another XARG?

\[some discussion\] V1 Obj V2

Olga: I have a question related to the locality discussion we just had.
What are other things that the formalism rules out in a similar fashion
that it does the locality violations? Is it just locality that we worry
about or are there other things we similarly worry about? What other
"silly crazy things" does the formalism allow that we don't care about?

Dan: I don't know how to answer that question, it's like "What wasn't I
thinking about yesterday?" Maybe an example you have in mind is the
rather annoyingly nested set of feature structures was trying to
accomplish something by saying there are general structures that hold
for feature structures that pick out parts of the feature structures and
say they are identical. If they aren't nested within each other we can't
pick them up and say they have to be identical. So that nesting of
SYNSEM, LOCAL, CAT, and so on is a cluster of features and I want to be
able to declare reentrencies. That rich nesting allows us to declare
principles that some groupings are identical. The groupings we didn't
collect we say will never be collectively identified.

Peter: I checked with my wife, she says it is very difficult to get this
quickly push slowly fall combination.

Berthold: Brings discussion to close.

Last update: 2019-07-15 by OlgaZamaraeva [[edit](https://github.com/delph-in/docs/wiki/CambridgeKwaBantu/_edit)]{% endraw %}