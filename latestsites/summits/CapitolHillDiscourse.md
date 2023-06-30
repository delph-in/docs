{% raw %}# Discoursey Things

## A Discussion at the Capitol Hill meeting, January 2017

[CapitolHillTop](https://delph-in.github.io/docs/summits/CapitolHillTop)

### Discourse adverbs/short answers

FZZ: This session is inspired by the need to process Luis’s corpus. A
collection of sentences from a Chinese textbook used at NTU (Level 1).
796 unique sentences, from dialogues. First problem: Lots of fragments —
terms of address, greetings, other phatic communication (thank you,
you’re welcome). Can either stand on their own, or appear
sentence-initially or sentence-finally. Looking for inspiration from the
ERG … and from Dan directly.

FZZ: In ERG, these terms tend to be called ‘discourse adverbs’. Types:

- Greetings
- Answers to previous question in context: yes, no, or short form of
the verb in the question

EMB: Is there really a *yes*?

FZZ/SSH: Yes: *shi4* or the short form of the verb. But this is tricky,
since it looks like a clause with missing arguments. Should we call all
of these adverbs, or should we treat them as verby?

DPF: Do you mean in the *bought/not bought* case?

LMC: What is the semantics of these?

DPF: The semantics of *yes* is very similar to the semantics of
*probably* or *maybe* — a modifier of the clause, but pointed out at the
discourse. You might say that *hello* isn’t actually an adverb, but I
don’t really care. It seems to fit in the same places. If I was a bit
more careful, I’d say “discourse particle” and not pretend to care about
the part of speech assignment. Doesn’t have much other pos behavior —
just at the edge, or standing by itself. Function is to express
speaker’s attitude towards the content of the sentence, or to wrap
something around that sentence.

DPF: The shortened verb examples you give. That looks to me like
something where the ERG isn’t going to be that helpful, since we don’t
have the phenomenon (except in *can* in Singlish). I don’t have info
about the range of distribution. *Are you staying from Monday till
Tuesday* can you answer *From Monday* — ditransitive preposition, can
you just say one of the arguments? Same with ditransitive verbs. What’s
the range of fragmentation you can impose, how much can be dropped, is
this kind of dropping also used elsewhere? That whole class of responses
to a question is an interesting but separate problem. True, comes up a
lot in face to face conversations and pretty much nowhere else. You
should decide if that’s where you want to devote a lot of your time. …
this is a difficult problem of mapping across sentences, and very
restricted in its distribution (to f2f conversation).

EMB: My first pass would be to license the fragments with some sort of
pumping rule that gives you the discourse particle use of these, but not
try to match the verbs to the preceding context.

LCM: I would be happy with that too. Want to deal with the unfulfilled
arguments, but leave the anaphora resolution to some further PhD thesis.
Can we treat it as an adverb and still keep the arguments there?

DPF: Example?

FZZ: Example: *Do you have have business?* *Have, I have something, S*

DPF: Are you going to give that whole thing to your parser?

FZZ: This is a huge problem in Chinese. Undersegmented in the Chinese
PTB.

DPF/EMB: Agree that 100 character sentences is silly, but including the
fragment meaning *yes* as a sentence-initial adverb not silly.
Linguistic question.

PX/LCM/FZZ: *have, I have something* is one sentence, but then the rest
is a separate sentence.

DPF: So something that takes *you3* and turns *you3* into a
sentence-modifier.

FZZ: So a pumping rule?

DPF: Yes, and I suspect you’ll find very strong syntactic constraints on
what you can find there. For example, probably *at* without its object,
even if you don’t get that in Chinese. So the pumping rule selects for
things that don’t otherwise occur on their own. You can also have
aspect. Can you have more?

LCM/EMB: Yes negation.

DPF: What about ditransitives—can you say *give a book*, followed by a
further sentence with that same intonation pattern.

FZZ: That first element can only take aspect, negation and probably some
scopal modifiers.

LCM: How do you draw the distinction between these and two sentences
that are just juxtaposed: *Did you give him the book?*/*I gave the book.
I met him at three.*

EMB: To keep ambiguity down, only apply the pumping rule to the things
that need it — that can’t appear otherwise in that form.

GCS: Flag these rules so that they only apply when we’re in this genre.

FZZ: Doing this.

DPF: Convenient to have a complementarity in the distribution. If the
sequence of characters can already be a clause, you don’t need to do
anything more. If you have just zai4 at the start of a sentence, you
need to add something like this pumping rule. Seems to me it would be
wise to constraint it to only apply when it gives you new coverage.

LCM: If I asked David, *Did you buy vegetables* and he says *Buy-le. I
got three eggplants.*

EMB: There are some things the grammar doesn’t already parse, but they
don’t need the pumping rule. They can just combine with comma-marked
coordination.

GCS: I have a library of grammar books about Thai that say that that
means *yes*, even though it can be every verb in the lexicon.

EMB: So they’re teaching you pragmatics. But the teaching grammars
aren’t interested in telling you what’s syntax and what’s pragmatics.

PX: You really need to separate the set of words only used as a
response, v. other phrases that are shortened or omitted.

LCM: Do you have any verbs that disallow argument drop?

DPF: What’s an example of such a verb?

FZZ: *kan* (‘look’ or ‘see’) can take a full clause as its object, but
that one can’t drop its argument.

EMB: Same in ERG, right? DPF: Yes.

DPF: Can you use that verb all by itself as an answer to a question?

PX: You won’t be able to list them all.

EMB: Can you put them in the other order? Long first, short difference.

SSH: Some can also repeat — *dui4 dui4 dui4, shi4 shi4 shi4*

PX: Some have very general meaning, and you can list those.

FZZ: That’s one end, then there’s the verbs that can’t occur on their
own.

FCB: Worried about (spurious) ambiguity in cases where something is both
listed as discourse adverb and a verb that can go through the pumping
rule.

LCM: To Emily’s question — weird, but is it pragmatic or syntactic?

EMB: Pick an example from this data, where they didn’t use the same verb
in both clause.

LCM/FZZ: Can’t find those.

FCB: What about a modal w a main verb.

LCM: *Can you buy eggplants?* *Can. I love eggplants.*

DPF: Can you use *can* by itself in a story? Not simulating a dialogue?

LCM: If *can* is argument-drop plus in FZZ’s grammar…

EMB: What about *I woke up today, and I said to myself, “Today, can.“*

FZZ/PX: Yes, that’s okay.

EMB: So that’s evidence that *can* can occur with argument dropping,
outside the ‘yes’ usage.

LCM/EMB: Try to construct examples with *zai*. Everyday I woke up and
looked for presents under the tree. They weren’t there they weren’t
there. This morning, I woke up and thought “zai”. Meaning surely that
there will be presents there.

FZZ/PX: Can’t say that.

FZZ: Can construct an example with *zai* in the context with overt
subjects and complements and then dropping more arguments at each
repetition.

EMB: That’s a different kind of availability of dropping of arguments.
Some phenomena, like VPE in English, are very sensitive to the
linguistic discourse context, others less so. So it seems we have a
difference between *zai* and *keyi*.

GCS: I think it’s about context, not about questions, which are just one
kind of context. Question for Dan — does the ERG represent each sentence
as starting with no context.

DPF: It is a sentence grammar. It assumes that the fundamental unit that
the grammar is concerned with building sentences.

GCS: So you rule out anything that requires connections to context.

DPF: Not rule it out, just leave it unaccounted for. Like *it’s cold*
meaning *no* (in the context of *are you comfortable?*).

EMB: A perhaps sharper example is **ellipsis\_rel**, which the grammar
doesn’t try to resolve, just leaves it for a later component.

\[…\]

EMB: *the cat* is parsed by the ERG.

GCS: Not with root\_strict.

DPF/EMB: Still parses.

GCS: But what is the point of root\_strict then?

DPF: It is useful to me in some applications (e.g. the grammar checker)
to know when something is a clause.

FZZ: What’s the **unknown\_rel** there?

DPF: NPs don’t have truth values. Truth values have to have
predications.

EMB: The **unknown\_rel** is a flag to the discourse processor that
there is something to resolve.

FCB: Schlangen & Lascarides have a system that takes these things and
unifies them together into a discourse.

GCS: If you say *Who meowed*/*the cat*… what’s the event?

EMB/DPF/FCB: Meowing!

GCS: So why an event?

DPF: We assert that propositions are what can be true or false, and they
always introduce an eventuality. It’s an axiom. It’s Davidsonian.

GCS: The diagnostic that would prove me right and you wrong is whether
there is any response that does not invoke an event for the cat.

DPF: You can think of it usefully as anaphora.

### Vocatives

FZZ: A new topic: Vocative terms at the beginning of the sentence. SSH
has an analysis of speaker and addressee in the ICONS structure. To
handle vocatives, we have a pumping rule that makes NPs into ADVPs,
introducing an addressee\_rel. But that’s in the RELS, so we have
addressee linked to 2nd person pronoun in the main clause in the ICONS
and also the **addresee\_p\_rel** in the RELS from the pumping rule.

*Zhangsan, ni lai le*

FZZ: Do we need an additional step to link Zhangsan and you together for
coreference?

EMB: I don’t think so. That’s not grammatically required coreference. I
thought you were going to ask whether it’s strange to have something in
both ICONS and RELS … but maybe that’s the info you need to link them
(in postprocessing).

DPF: I do **addressee\_p\_rel** in the ERG in the RELS. The vocative has
to hook in somewhere. I haven’t experimented with addressee in the
ICONS. Need some way to join the NP describing the people you’re talking
to and the message you are saying to them.

FZZ: qeq?

DPF: No, it’s not scopal.

FZZ: What about between addressee and the pronoun?

DPF: I don’t think we care about that here. *I saw a guy and he was
tall.* Not a grammatical property.

DPF: Can you have addressee like *everybody in the room, open your
books*?

FZZ: That’s my next question. How constrained the rule be? Right now,
I’m being very safe and only allowing humans and names. But I don’t want
to open this up. It will overgenerate.

DPF: Parsing will give you too many analyses?

FZZ: Parsing is okay — can say sentence initial, must have a comma.

DPF: You won’t have generation trouble, unless the input MRS has
**addressee\_p\_rel**. It’s not a semantically empty rule, so it won’t
fire in the generator unless it sees the licensing from the semantics.

EMB: I think the problem is going to be with topic, comment sentences.
*Elephants, trunks are big.*

FZZ: Right, because topics often have commas.

DPF: *Children, it’s time for bed.* That’s just got to be ambiguous, and
that’s probably right.

EMB: As your grammar gets bigger you get more ambiguity.

FCB: Can we treat this as vagueness, where vocative is just a resolution
of ‘topic’?

DPF: What do you see in the MRS for *Elephants, ears are big.*

FZZ: This is not covered yet.

FCB: If we carefully give that a vague name, could maybe assimilate to
vocatives.

### Strategies for constraining parser search space

FZZ: We also found quite long sentences, surprising for this intro
textbook.

LCM: Do you ever decide to split long sentences in English, based on
commas?

FCB: We will be talking about things to do to make grammars faster
tomorrow.

FZZ: And here is one with lots of classifiers that are also legitimate
nouns, with coordination, which gives too much ambiguity.

PX: Chinese has lots of run on sentences. First thing you have to do is
segment them.

GCS: First thing you have to do is recognize that there is not a
cultural imperative to split sentences with punctuation.

FCB: You said with confidence something about the beginning of the
sentence.

FZZ: We have left periphery working…

FCB: What about the complement of ‘say’, ‘think’.

EMB: Certain verbs effectively introduce root contexts.

FCB: And are you sure that topics are always all the way to left? What
about *Prehistoric times, elephants, hair was long; nowadays, elephants,
hair is short.*

PX: Not that common.

FCB/FZZ: Okay, just single topics for now.

EMB: In the Wambaya grammar, I had an initial position (left of the
second position occupied by the aux/clitic cluster) and then a few
phenomena that target a position before that.

DPF: *Yes, Mary, do go to the store.*

FZZ: That’s sad.

DPF: Like Emily said, just create specific constructions that oddly can
take this left-peripheral construction as its right daughter.

FZZ: Can I ask for a clever solution for this: Can we use punctuation as
a boundary cue to block coordination across it? This is a special
punctuation for enumerated coordinated things. Can we make use of this
information?

DPF: One mechanism is to record the presence of that punctuation mark
and push it up as the phrase goes upward. In the ERG, done with the
PUNCT feature recording the presence over various punctuation marks, and
then carry that upwards. Coordination rule can then reject conjuncts
with something like that.

EMB/GCS: What about GML?

DPF: That’s human annotated.

EMB: But I think FZZ is saying she can get some of that from the commas.

GCS: Introduce the comma as a separate word, and the build rules that
take that single character and dispose of it. Less invasive in terms of
the feature structures (don’t need PUNCT everywhere). Opt in rather than
opt out.

FZZ: I’m treating it as an implicit coordinator already.

GCS: You need a separate type for the comma which is non-linguistic.

FZZ: But then how do you bring in the info that it’s a coordinator?
Unless I have a rule specifically for this thing.

GCS: Yes. That’s the proposal.

EMB: You don’t know about the stuff to the left of the first comma, but
between N and N+1st comma is definitely a constituent, etc.

GCS: Then my solution is applicable.

FZZ: But how do I get the coordination info back in?

GCS: Is the comma really carrying that meaning?

LCM: You can also have NN compounds with coordinated noun phrases.
Should that be legit?

DPF: *I have a toy, candy and hot-dog store.*

DPF: I think this is a doomed enterprise. You’ll eventually find
coordinated structures with recursive coordination. *The three groups of
people, A, B, and C, D, E and F, G, H and I.* do you know?

FZZ: The example of that in my corpus is using different punctuation.

EMB: I think the proposed solution will still work.

DPF: No, in *toy, candy, and banana store*, *banana store* is not a
constituent, and insisting on it would block something that should parse
if there’s another comma after store.

FZZ: Different kinds of commas…

DPF: *I went to a toy, candy and banana store, a pineapple and
grapefruit store, and …* Not a good thing to put in the grammar.

EMB: My solution isn’t the grammar. It’s automatically created GML.

GCS: My solution isn’t about insisting on particular constituents, but
blocking some of the others.

EMB: Would be helpful for FZZ to see GCS’s tdl.

Last update: 2017-01-06 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/CapitolHillDiscourse/_edit)]{% endraw %}