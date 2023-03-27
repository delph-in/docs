{% raw %}# DELPH-IN Educational Applications

Chair: Olga

Scribe: also Olga

## Context

Less selfish agenda can easily be constructed off the below selfish
agenda, e.g.: Discuss resources which are usually required for DEA
projects How can we scale from the ERG-based projects better? To do this
with other grammars, what is required? Which next steps will make most
sense? Modernizing ranking models (neural?)

Olga’s selfish motivation: MCSA postdoc fellowship opportunity with a
host institution in Galicia (Spain). The host institution is willing to
support my application but I need to write an application still :). Was
thinking about something along the lines of offering learners feedback
But specialize it either wrt the location (Spain, Galicia) or wrt the
host professor’s specialization (neural parsing)

Constraints for the application: 3 year scope (maybe 2) But OK to be a
little ambitious

My concerns: I am certainly not an expert in Spanish let alone Galician
(nor in parsing!) Of course there are students there who are (and the
host professor) Hardly realistic to build a suitable grammar of
something like Galician AND some kind of a learner corpus AND do
anything else in 3 years? What’s the situation with the Spanish grammar?
Maybe just focus on an application relying on just the ERG? Not ideal
for the MCSA application Then the specialization needs to be wrt parsing
There was not a single paper at ACL BEA SIG mentioning grammars While
this is a concern, it does not in and of itself mean anything, I guess

## Discussion

Luis: MCSA like localization of research-type of projects (so like Dan’s
ERG project). Methods of delivery also important. Maybe focusing on data
collection would be most realistic. Localized also to the supervisor.

Francis: [FreeLing](/FreeLing) groups, NLP group with lots of resources
for Galician, wordnet, etc. Turning SRG into an Iberian grammar is a
great idea but not being an expert in Spanish is problematic.

The idea that Spanish speakers make different kinds of errors than
Chinese speakers etc., might be a way to go. Example: complex
constructions, something “has been had” etc. Much simpler ways of saying
this in English.

Olga: And this touches on semantic space.

Luis: What is missing is research on how feedback actually works (does
it really help, etc.). So maybe focus on this.

Guy was making suggestions about how to make improvements in performance
in error correction; also could measure sentence readability etc, by
doing some computation on how many constructions etc.

Also could abandon the educational domain and focus on improving ERG
performance in shared tasks etc.

Ping: Statistical approaches won’t have high enough precision for
grammar correction

Luis: Statistical approaches might be popular right now but their
precision has got to be poor

Olga: Define precision

Luis: Like Dan’s 4 classes, precision within each class, the false
positive traditionally being the most important. The second level is
incorrect feedback (which confuses the student). Current systems just
correct, they do not really educate.

Olga: Ranking feedbacks is statistical in nature

Luis: Yes but it must not be strictly statistical. There needs to be
space for integrating intended meaning, perhaps via (transfer-based) MT.

Luis: About feedback: if you have fewer mal-rules, you can have more
general feedback with is less often incorrect. (But, more general
feedback tends to be more abstract and so students don’t understand it).

Luis: Could leverage expertise on syntactic form of questions. Joanna
Sio and I were doing web-based games, write an answer to a question
etc., write a dialog

Dan: Not too many mal-rules for questions in the ERG right now; most
about the choice of wh-word.

Luis: There are some papers on creation of closed-formed (MCQ - multiple
choice) questions. Can produce materials for exercises (then teachers
construct their own exercises). There is a market for corpora of
good/bad sentences

Ping: Need to find a task where you can actually compete with ML systems

Luis: That can be hard. But it is also on us to show better that our
methods are relevant. It is about engaging with other people’s research.
A hybrid system which provides good error analysis and, ultimately,
gives better results all around.

Olga: Should we always compete with statistical systems on all tasks?
Perhaps different systems/approaches are ultimately solving different
tasks?

Ping:

Alexandre: In industry, no doubt at this point human input and hybrid
systems are necessary. But there could be better ways of showing that
(what? I guess, the strengths on our system? maintainability,
consistency. Slow and steady improvements are valuable for the industry)

Luis: I don’t believe that we are after reverse-engineering some ideal
language model that’s stored in our head. Need bottom-up approach.

Olga: Will not steal Luis’s cognitive weights idea.

Olga: I meant that data is not the entire language, not so much about
stochastic nature of language.

Luis: There may be types of errors which only come up in the stochastic
domain.

Luis: Instead of trying to be on a pedestal (“one day I will solve all
problems”), more like: “I can solve 60% of these problems now, and if I
add your system to mine, we can solve 90% of the problems”, etc

Alexandre: Response time to produce quality result is important. There
is a competition between cloud services.

Ping: Pydelphin is worth exploring. Precise representation of semantics
is important. Precise diagnostics.

Olga: Asks Dan about his CX type of error (student’s sentence is correct
but the system says it is wrong). What actually gets sacrifices? Dan:
For example, is vs. has; I don’t always know whether it is a verb or a
past participle, so if I aggressively go for this kind of error, I will
provide wrong feedback in some cases. Better to make sure students have
confidence in the system, and they will learn the suppressed case from
other similar cases.

Ping: Does this happen when mal-rule competes with a non-mal-rule?

Dan: Sometimes, yes.

Luis: Are you ever tempted to take not the best parse?

Dan: Not very because the numbers don’t come in our favor. Sentences
which have &gt; 10 words, you will just have very near neighbours at the
top, no point to prefer of of them over another

Luis: I don’t think that’s true in all cases. I think it can diminish
FPs.

Dan: That’s an empirical study. Now that we have a stable version of the
grammar, you should be able to explore this hypothesis.

Dan: It’s an oversimplification to think that a non-mal parse is always
preferable to a mal-parse. Shouldn’t assume that, need to actually get
the numbers from the data.

Dan: Regarding resources, if you are developing something for a
real-life application, need to assume real-world resources, such as
servers, web-services etc.

Ping: how many mal-rules in the ERG?

Dan: 330 distinct error messages; maybe 40 mal-rules and lexical entry
types \[somewhere; missed\]

Ping: How much ambiguity did they add to the system?

Dan: I don’t know how to answer that; the numbers are too big; also, I
am never trying to enumerate all possible analyses.

Ping: How much more space we have?

Dan: Once we have a model that can make choices for every case, I don’t
think there is an upper bound. The annotation effort needs to be ongoing
however this is also true for grammars.

Luis: So we don’t always know which correction to make. Do we want a
treebanked corpus which allows us to consider 30-40 trees without making
the last decision, say all of them are possible. Save fftb (full forest
treebank) midway. Dan: I want this data to use it for training, so it
cannot be a bag of trees.

Luis: Can use a heuristic \[missed\] for annotators. Push all mal-rules
responsible for this sentence.

Dan: This is unlikely. In tens of thousands of sentences I have never
encountered \[something; when he is unsure which correction to choose?
But didn’t he just say the opposite?\].

Luis: But context is very important. The sentence itself should have
ambiguity quite often, if taken without context.

Dan: I am not really trying to determine what the student is trying to
say; I am more interested in robust situations where I can say with
confidence that that’s a mistake, judging from the structure. A
statistical model will be very important here (will replace the mask).

Luis: is less optimistic. Parse ranking is also context based, it
depends on the specific corpus that it was trained on.

Dan: About a million words of training data, and I can have pleasingly
good results on parse selection.

Luis: Are you planning a treebank for your Chinese learners (of
English)?

Dan: I may not need to build a separate corpus because it should be
similar to the one you are building at NTU.

Dan: We can get more money maybe if we show that annotation is
beneficial (with numbers).

Last update: 2020-07-17 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/VirtualDEA/_edit)]{% endraw %}