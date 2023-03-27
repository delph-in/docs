{% raw %}# Teaching old-school semantics to new people who are trying to reinvent semantics

Alexander and Dan's notes from Oslo:

- places where the simple syn-sem homomorphism breaks down
- types are needed to ensure that the output representation is
interpretable (even when there are diff semantic formalisms)
- existing mechanisms for dealing with scope (as one example of
non-homomorphism)
- semantic ambiguities and how to deal with them
- semcon methods for different syntax formalisms
- compositionality and its limits
- ugly corner cases: comparatives; plural/distributivity
- continuum from syntax to semantics; injecting mild bits of semantics
into syntactic representations (e.g. enhanced UD); where do you draw
the line?
- need to normalize meaning representations to use them for inference;
either in grammar or in KB. Advantages? Problem also arises in
cross-lingual information extraction. Can you believe in an
interlingua, and if not, what do you do instead, pragmatically?
- Certain things are simple and solved and don't need to be
reinvented.
- Control != anaphora.
- lexicon-grammar tradeoff
- how do you test a theory with problematic examples

Points in discussion:

- Tests for semantic contrasts: downward vs. upward monotonic
quantifiers. Donkey sentences -&gt; how do indefinites work.
Established example sentences for identifying quicksand.
- Negation and modals in English (“John can’t leave” vs “John mustn’t
leave” - not(can), must(not)).
- Collect repository of hard sentences/minimal pairs that illustrate
important semantic pitfalls.
- “Fixing semantics” post-hoc may be easier if the syntax is already
designed correctly.
- Thematic roles and word senses: before you figure them out, you
can’t do inference.
- Picture-based corpora only show you things that exist in the real
world; no quantifiers or weird negations needed. No intensionality
needed. A veridical

universe.

- e.g. “regret” vs “wonder” (whether the embedded clause refers to an
existing situation)
- One way of organizing material top-down: go by task? E.g. if you
want to do QA, here are some problems you will run into. What kind
of monsters are particularly scary for which quests?
- Cross-linguistic issues? Swimming across lake vs. crossing lake by
swimming; POS mismatches; different idioms.
- How much paraphrasing should sem rep normalize? AMR vs. MRS.
- Even “and” and “not” in English don’t usually translate directly to
logical operators.
- Push some problems down to pragmatics. Where do you draw the line?
- Semantics has a lot of layers; Emily’s distinction between “sentence
meaning” and “speaker meaning” in context; Alex L’s distinction
between public commitments and what can be inferred about what the
speaker things but they aren’t publicly committed to
- Solved problems vs. well-studied but unsolved problems
- Even adjuncts vs. arguments is a thing that computer scientists may
not know about, but should.
- Focus on practical approaches/solutions/challenges. Sidesteps both
CS criticism that linguistics gets bogged down in pointless debates,
and linguist criticism that we are not doing the phenomena full
justice. We are grammar \_engineers\_, not just pure linguists.

“Linguistic beasts and how to tame them”

- Video lectures could be useful resource. Be sure to break them up
into short segments (7 min) so people can navigate.
- Volunteers for providing content: Emily; Francis; Francis’s minions;
Antske
- Other people who might provide something: Johan; Cleo
- Aim at 20 articles before next DELPH-IN meeting

What to do about this

- Emily’s “100 things” book(s)
- Find a way to make contents of the book turn up in Google searches
- Crowdsourced collection of annotated examples?
- For syntax, there is <http://test.terraling.com/groups/7;> do
similar resources for semantics exist? Task-based?
- Use ERG-based parser as a frontend that points out interesting
constructions in your sentence and links to pertinent pages?
- High-level short list of problems (at syntax-semantics interface)
- ACL tutorial, with video lecture?
- Series of short videos (\~7mins)?
- [WikiBook](/WikiBook)

Last update: 2018-06-21 by AlexanderKoller [[edit](https://github.com/delph-in/docs/wiki/DiderotOldSchoolSemantics/_edit)]{% endraw %}