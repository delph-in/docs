{% raw %}# Demonstrating the Utility of ‘Deep’ Linguistic Processing

SIG at [Stanford 2016 summit](https://delph-in.github.io/docs/summits/StanfordSchedule)

===

Ping Xue: Boeing had a project lasting many years, sponsored by the US
and UK - we used the Stanford parser - purpose was for information
extraction, reasoning, and planning - concluded Stanford parser was not
sufficient, recommended ERG instead.

Alex Lascarides: The place where you need logical forms instead of
semantic dependencies is when testing against the world, but there, what
you're competing with is other parsers that produce logical forms, e.g.
Boxer. So we need to explain, what's wrong with Boxer? e.g. 'existential
there', garbage out of the C&C parser. But (coming back to the last
talk) robustness stops people using the ERG.

Emily Bender: We could go through papers that use Boxer and try to do
better. For some tasks we may not need full coverage. Or we need a
fallback.

Antske Fokkens: Ghent images to text, contacted me because they wanted
to use my Climb grammar for Dutch. Also a master's student, but haven't
heard back. Every couple of months I get a request from someone.

Tracy King: Focusing on parsing... Grammatical string generation. e.g.
sentence condensation tasks, where you want good legible
English/German/etc.

Alex: That's often done statistically these days. So they've picked
tasks where you can get away with that. We need to pick tasks that
exhibit the advantage of generating good quality text.

Berthold Crysmann: In the Hausa case, tone is not represented in the
orthography, but there are phenomena such as bipartite negation, where
what you have at the end determines the tone at at the beginning - so I
hope having the constraints will be better for restoring tone.

Luis Morgado: Summarisation would be somewhere MRSs could be nice. AMR
people have been trying summarisation, but generation is basically bag
of words. If we do graph pruning correctly, we can generate simpler
sentences.

Emily: With an evaluation metric cleverer than ROUGE. So it's not just
the definition of the task, but also the evaluation metric.

Ping: Language teaching tools and error detection would be something
that demonstrates the usefulness of these tools. If we don't analyse the
structure of the sentence, you won't be able to correctly detect errors
and provide feedback.

Emily: Generalising there, between error correction and summarisation:
they're tasks where well-formedness is needed.

Zina Pozen: Facebook search... built vocabulary and grammar for how
people search. They ran into issues of low coverage. They would
exemplify things you could search for, and hired linguists...

Glenn Slayden: I don't know if someone's mentioned MT. People would say
that statistical approaches have been particularly successful in the
last 10-15 years. But as a hobbyist, I don't have access to the kind of
resources to develop that kind of system. It seemed, at the time I
started, that deep processors would be more manageable. That's what
motivated me to come into this community (besides philosophical
considerations).

Emily: MT is currently colonised with people who are on the BLUE score
treadmill... There was an interesting keynote at NAACL given by Ehud
Reiter, and he had many interesting things to say about metrics - need
good correlation with human ratings or real-world performance. Chris
Dyer objected... videos online in July...

Francis Bond: One of the things we found was specific things that
statistical systems get wrong, such as negation, which drastically
change how people view the quality of the translations. Questions are
often translated badly, too.

Martin Kay: Google - just forget it!

Emily: Foreground with error analysis.

Alex: Influencing rules of the game.

Glenn: My experience of English-Japanese translation is horrendous.

Luis: At ACL, one of the top papers was complaining about BLEU, and
people are becoming aware...

Francis: Callison-Burch on BLEU

Emily: And Susanne! We've been careful to say: we're taking an
off-the-shelf product, as a black box (ERG), and we're doing something
with it. Without insisting on that, people say that they don't want to
write a grammar.

Dick Crouch: What do we mean by 'deep' processing? Do things no one else
can do. But then someone else can come along and do that. It's not so
much depth, but having a flexible intermediate representation, which you
can take out of the box and do reasonably well on the task. You can
always get more data... You can get more bang for your buck building on
these tools, but calling them 'deep'...

Emily: machinery to build domain-independent meaning representations

Glenn: If they're going to steal 'deep' from us...

Francis: Just submit...

Alex: 'proper' grammar

TJ Trimble: A complaint from industry is speed. Google and Facebook
might be willing to invest money in this, but for a startup, they feel
like they can't expend the resources to parse one sentence a second, so
they won't even put in the work to see how to use it.

Glenn: You ran through the Acquaint corpus.

Woodley: Two of them. Took a month, running on three machines each with
three dozen cores, so fairly big machines for a startup.

Dick: Aside from processing speed, there's also learning curve speed.
Throw up hands at MRS. With all of these things, you've got to pay
attention to packaging things so they can pick it up and start using it.
Hardly anyone will spend time...

Tracy: Lapse time. You can spend a month learning something before you
get started, or you can get started and then invest a month in learning
the system better. Psychologically speaking, it's a different month...

Dick: There's also a popularity thing. Prepared to invest time if it's
popular. Not if it's too task-specific. One of the reasons people pick
up on the Stanford parser, dependencies... Processing times aren't
always great.

Bec Dridan: Maybe we could use Stack Overflow?

Glenn: We have tried to make it easier - representations that are
easier. Use the simplified versions as our flagship.

Dick: This is the reason I went for graphical notation.

Guy: That was also one one the main reasons we developed Pydmrs.

Emily: Coming back to Bec, we do this on the developers' list, but it's
not visible.

Stephan Oepen: It's Google indexed.

Francis: Repost questions to the developers list.

Emily: We need a norm of asking questions on list.

Glenn: Questions from strangers?

Ping: More marketing. When telling friends that we're using the ERG,
they'll say they've never heard of it. Chief scientist at
[BaseNet](/BaseNet), sentiment analysis said to me, "Oh, you're still
talking about the ERG?" Yes, it can do so much! What the Stanford parser
can do is limited. One of the best marketing things to do is to find
applications.

Emily: Delphin applications page! Link work there, and if publishing,
make it completely reproducible, so someone can get back to the numbers
in your paper. It can also serve as a model for reading in MRSs and
manipulating them.

Ping: A general mindset in industry is, what can you do for us? If we
have a killer application.

Emily: 'killer' high bar, but if we have some...

Dick: have to be careful; need to gear it to a few cases, and if what
you're showing isn't quite what someone wants (even if you could adjust
it), the conversation stops all too easily. People often like to
innovate by bundling applications together, that do exactly what they
want. As far as industry is concerned, bakeoffs are not very helpful,
don't play into product demands.

Valeria De Paiva: It's not marketing, or branding - it's interface
design - make things look easy and available.

Dick: The risk in going for a particular task, even if it's a reasonable
evaluation metric, is that you go too far on that. If you have the right
training data, you're going to have a hard time beating that. So you
could shoot yourself in the foot.

Emily: Tasks where there's just enough gold standard data to evaluate!

Dick: Similar tasks across different domains.

Emily: Cross-domain, in languages we have grammars for.

Dick: And maybe no one else enters...

Luis: We have valuable data in hard-to-grasp formats, e.g. MRSs, where
the person who's just arrived doesn't want to spend their time getting
to grips with them. Perhaps we need to make these corpora available in
easy-to-consume formats.

Emily: Like Stephan's SemEval and [SDP](http://sdp.delph-in.net) work?
If we're going to publish corpora with 'our' annotations, it's important
to ensure a high level of consistency before doing so.

Luis: But even the top parse is useful.

Emily: For a resource like [WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods), we should clearly
label. Formats?

...

MRS, DMRS, EDS, DM

...

Dick: Also an issue about simplification. How easy is it to recover the
complicated version? This is why we went for different layers. You lose
information by leaving something out, but should someone realise they
need something, it fits in easily on top of that. As opposed to saying,
oh what you really need is something else - no trap doors.

Stephan: Time... for the bus...

Last update: 2016-06-27 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/StanfordUtility/_edit)]{% endraw %}