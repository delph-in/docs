{% raw %}**Discussion: Mal-rules (@ [DELPH-IN
2016](http://moin.delph-in.net/StanfordSchedule))**

*led by [Luis Morgado](http://moin.delph-in.net/LuisMorgadoCosta)*

17 June 2016 (Day 2)

* * *

Scribes: Francis Bond, David Moeljadi, Wenjie Wang

* * *

\[Summary of discussion topic\] Luis introduced the idea of using MT to
help divine the student's intent when they have made a mistake (now
funded by MOE) --- see last year's slides. How can we integrate
mal-rules into the grammar development? Is it ok for the mal-rules to be
not so elegant? How much should we treat them as part of the grammar?
How can we coordinate work?

* * *

\[Discussion begins\]

Emily:

- Some experience in working on the grammars, with collaborators
living in timezones that differ by 9, 10 hours. A key piece of that
to that is regression testing; \[incr tsdb()\], and a good test
suite. I think one thing critical is documenting the malrules that
you intend to capture.
- Having test suite of malrules is critical.
- How elegant should one be in writing these rules? Two issues I would
worry about:
- 1. To what extend are these rules one-off?
- 2. The other question is how is the parse-selection machine going
to work?
- In practical applications, you not only develop them, you need them
to come up when you want them, and not when you don't want them. And
the right one to come up. And I don't know to what extend having
well-crafted systems where maybe certain rules participate together
to come up with the configuration with the error is better or worse
than "here's one weird rule that handles this case".

Luis:

- I think I may not have been clear about this. The idea would be to
strip down the grammar, building in an on-off switch. Ultimately, we
want a grammar for each student. So if I know which confidence they
have, and I know that they have not seen things, then this rule
wouldn't fire up. So it's useless; it's just noise, with a
complexity that I don't care for.
- So basically, I want a system that needs to be every rule. It needs
to be up to a point that encodes a level of complexity that ideally
will be based on your level of syntactic knowledge. The only thing
we found is by levels, basically.
- But ideally, it would be by student. But even by level, you can, for
example, say that this year has two levels (first and second
semester), and has two different complexities that I can parse in
the grammar. If it's out of the scope, we'd say something like
"don't try anything out of the bag! Just use the constructions that
you learnt in class." So we are not going to be "this doesn't
exist".
- We wouldn't care if they are doing perfect sentences — if it's not
in the curriculum, we would say something that reminds them to keep
to the curriculum. Show me what you know, that I've taught you.
Which is the kind of thing (we won't be able to do ??), to shave off
this kind of complexity and so that malrules can actually appear
when they are fired.

Rebecca:

- So you are thinking of having a parse-selection model, a really
generic one, or...?

Luis:

- I don't want a parse-selection model. I want a grammar building...
selection one.

Emily:

- You are going to need parse-selection model, because when the
grammar gets bigger, it's going to show some ambiguity. You will
have multiple versions of a grammar, and you might end up wanting
multiple parse-selection models, and there will be a lot of
treebanking to do.

FCB:

- Because the sentences in the corpus will be marked with different
levels, we can train on different subsets of the corpus.

Luis:

- We will have access to learner-corpora based on work done by
Singapore students. There will be some treebanking involved.
Ideally, it will be recursively improving. I don't want to have too
much treebanking.

Antske:

- The complexity, and also how you want to deal with different
versions of the grammar, really depends what you want to teach, and
what kind of feedback you want to get. There is in gclimb a version
that does adjective training. A simple grammar. It was written in a
way that can tell you what you are not paying attention to (you got
the wrong gender, wrong case, etc). For training at low levels, you
might not need a parse-selection model, because you just make the
variation small (?).

Luis:

- Yes, that's the idea. We will start small. Eventually, we can ask
for more years to work on it.

Antske:

- You should perhaps be climbing -- some code generation would be good

Luis:

- So the question is, to climb or not to climb? How difficult will it
be to implement it as a web service? Need something that can do
on-the-fly selection. I would like to understand the backend of
climb. We can discuss this in the SIG.

Emily:

- While you can get away, with the shared-grammar stuff in ZHONG, for
multiple versions of the same grammar, you'll really (really really)
want climb.

Woodley:

- You were talking about turning constraints on and off at the
sub-rule level... are you just talking about turning individual
rules on and off? (sub-constraints or whole rules?)

Luis:

- To turn rules on and off, you need to have a copy of the rule that
has been simplified in a way. I will have a simple rule that
constraints that constraints what I don't want the grammar to know
about just yet, and then if I am using the grammar for that
complexity level, then I use this version of this rule, and it's
blocking everything else. But if we do this for zillions of rules,
we will be losing all the elegance. So the other side of the
question was whether we need to do this for malrules or not. They
are more singleton.

Woodley:

- A request from Dan, to change the list of active rules as a command
line option The root condition was a list of rules that are enabled
or disabled. ACE can help you with this.

Glenn:

- We certainly have that for the generator, and I ?? has it for the
parser as well. It's just a list of which rules are active in the
parser, generator, or both. It's trivial for all the systems to
implement.

Luis:

- Difficult part of doing that is you will need some part of some rule
at some point. It depends on how they split. Might (??) rules
altogether.

Glenn:

- It puts the onus on you to create duplicate copies of each rule, and
modify it to each individual case, and make sure you only turn on
one at a time only.

Luis.

- Yes, but if you have multiple copies, you end up creating different
versions of the grammar. But yes, in the end, if you don't fire it
up anyway, it will probably be similar.

Glenn:

- That which Woodley and I alluded to is kind of the simplest way to
do meta-grammar.

Luis:

- When you change a good rule, what is the workflow? (For Dan) Are
your malrules independent enough, that you don't have to worry about
them?

Dan:

- Mostly I worry. I have separate file that contains a mix of copies
of the existing standard rules, plus some \[mal,?\] purely
phenomena-specific rules. They are gathered in one file. But the
documentation for this is not perfect.. Issue of coherence and
stability is crucial, and is not a solved problem.

Ping:

- Are malrules treated like standard rules?

Dan:

- They look exactly the same --- currently they are not used at all in
a treebank; I will do that if and when I have to they are loaded as
a different grammar.

Ping:

- When doing parse selection, do you take into consideration whether
this part is fired by the malrules or not?

Dan:

- If I had more resources, I would have trained a very large corpus
that contains malrule data, and so I can see the frequency of the
uses of those mal-rules, in competition with the main grammar rules.
Unfortunately, I have not built such a treebank, which would have
trained a customised model that could see when a malrule was chosen
or not.

Glenn:

- But they are all disabled by root choice, right?

Dan:

- In ordinary use, those wouldn't even load. If they were loaded, they
can still be constrained. I had different grammar config file for
the malrule case.

Luis:

- Before turning it off, there's no cost? If you turn them off, will
you still try to do anything with them?

Glenn:

- No, they are completely gone.

Woodley:

- Implemented for transfer rules. So you can turn transfer rules
on/off, but not for syntax rules.

Glenn:

- I thought you have that for syntax rules?

Woodley:

- It's configurable (?)

Glenn:

- So there are three ways to do it:
  - Modify whole config. of grammar; have a different grammar
config.
  - Could use trivial modification read from a list that says which
rule to turn on or off, given a single grammar.
  - Do in root condition, but it has a runtime impact.

Francis:

- In the current set of malrules, do you have a feel of how much they
expand the search space?

Dan:

- Some of those malrules can be really expensive. If I allow every
preposition "in" to be a possible mis-spelling of the copula "is"
(happens distressingly often enough...), that will be really
expensive. No simple answer, but certainly there can be malrules
that can be expensive.

Luis:

- We have a layer approach: we parse the good grammar first, and then
on the expanded and most important malrules, so that you can solve
the problem of full expansion.

Dan:

- That will take us backward. There are many instances where I can
find ridiculous but technically grammatical analyses for a sentence
which is just transparently the subject of an error. The parser
would have told me it's a really weird analysis.

Luis:

- Say you want to do that "in"/"is" conversion, as a desperation
robust grammar? The things I will never want to do at runtime, I'll
just have exhausted all the other malrules.

Glenn

- It's a burnt-in premise is that our parsers are exhaustive.

Luis:

- But if you have both of them, then you are doing an explosion of
prime combinatorics (?). If you just save it for last, the you
already know it's one of those five malrules that you'll never want
to try to combine with any other malrule.

Glenn:

- It will have to be two separate parse iterations.

Luis:

- Yes.

Glenn:

- Ok.

Dan:

- Short answer — no. I don't think will be productive. I haven't tried
it. Might be a safety net for certain classes of poisonous malrules.

FCB:

- We should list this down as an SIG.

(SIG topic proposed)

Last update: 2016-06-18 by WenjieWang [[edit](https://github.com/delph-in/docs/wiki/StanfordMalRules/_edit)]{% endraw %}