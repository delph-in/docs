{% raw %}## Meaning Representations for Entailment or Reasoning

### Scribe: EmilyBender

### Alternate title: Deep Linguistic Processing and the Rest of the World

\[End of discussion from Dick's talk\]

oe: There's something that I would consider grammatical knowledge. *It
needs to rain* or *I need to have my car checked* … you're not getting
these distinctions explicitly from syntactic dependency trees.

Dick: No, leveraging the LFG lexicon in the mapping from the
impoverished dependency structure to the concept graph & the ? graph.

oe: So you refuse to take a firm position on what one should expect from
grammatical parsing.

Dick: I'd like to, but no one's going to listen to me. I'm easy; have to
work with whatever I get.

Ron: Does the dependency parser give you an adequate representation for
distribution over coordination -- *Kim ate and baked the pie.* That's
not a lexicon thing.

Dick: No. I think it probably doesn't do anything like that. If you
really want to capture that, you're going to have to declare it as a
semantic distinction. You've got all these graph structures interacting
with each other, but the dividing line between syntax and semantics
becomes fluid.

\[oe gets up\]

oe: For several years we've said we should talk more with our close
cousins (from [ParGram](/ParGram)); now we're here and we're excited to
have you join us. Big questions to be discussed tomorrow!

Ron: Do you do Deep Learning?

Emily: Sshh!

Cleo: Question: What do you want from your syntactic parsing? Given what
Dick was saying, you want enough info to keep track of the dependencies
that will give you the contextual structure. Of course you're going to
get the basic PASs, and that gives some of the contextual structure. But
you also want the info that will help you keep track of context and all
those elements that Dick called 'modal' -- connectives, modal adverbs,
modal elements. You want those in a way that would relate to the right
predication they modify. If you don't have that, all the context
technology in the world won't help you. Wrt things like arguments and
NPs, getting back to Alex's question, you want the right kind of info
about kind of quantifier, kind of modifiers, because that's what will
determine instantiability inferences in a particular context and in turn
at the top level.

Annie: Listening to you, I agree with all that, but then listening to
Dick, I think how are we going to get all of that stuff? When we worked
on making these very precise frameworks on which we thought we could
build these things. And then I listen to what Dick is doing now and we
see the rather impoverished syntax that for some reason or other one had
to adopt in certain cases. You have to kind of improve all these things
and reconstruct all these things we discovered are important in a
painful way, and that's the way the field seems to go. I am wondering
why. It shows the importance of the work we have been doing, because you
have to have figured it out to use it. But on the other hand, it gets
put in in such a way that leaves you asking "Why this?" Why can't we
start with a cleaner interface than bad dependency graphs. I'm baffled
by the way the field goes from a social point of view.

Emily: Just so everyone knows, I'm taking notes...

Ron: The service we've provided community is to create these
intelligent, complex artifacts, so that the field can dumb them down.

Annie: They think they can get away with less, and then use something
that doesn't have the features they need, and then painstakingly put
them in again.

Alex: Ron's talking about serving the community. My question is what
community are we serving and what's the community trying to do? The
community we serve is amorphous and changing. We serve few people these
days, because they focus on tasks that they can do with bothering with
the stuff that goes on in this room. You go to ACL and the innovations
are finding tasks where you don't these stuff.

Emily: There is also interest out there. Our NAACL tutorial on ERS was
reasonably well attended, and other people I spoke with afterwards who
couldn't come were interested in the slides, too.

Dick: I agree that the community is fractured. The part of it that I'm
in is industrial. Speech bg people working on dialog agents assume
there's a fixed set of atomic actions… leads to an approach that works
very well if you can get the data.

Alex: On some tasks!!

Dick: The data-driven methods are very generalizable, but they're
attacking end-to-end systems where the end point is completely different
for all the tasks. So although the techniques scale, the data doesn't.
One of the reasons I've been trying to push this kind of approach in
that environment is that if you're not working in a consumer-facing
space but (B2B, e.g. different banks will still have different policies;
nothing generalizes). You have to go back to something that's not
end-to-end, but actually exploit the kind of language models you get
(rule-based or statistical), so long as they go after some intermediate
level of representation.

oe: Keyword 'intermediate level'. Syntactic analysis in the form of
relatively shallow bilexical analyses is a commodity nowadays. Might
call that an accomplishment of our community.

Dick: Not everyone's convinced you even need that.

oe: Many more today than 10 years ago. And the bilexical dependencies
are easier to get used to than even the PTB. Credit to Nivre, Stanford
NLP, etc. Would we be in a good position to talk about doing something
at a more abstract level? There's one project already trying to do that
-- not AKR, A\*M\*R.

Ron: I asked them about this -- how do they decide what goes into AMR
and what doesn't? Whatever KK thinks would be useful for English
&lt;&gt; Chinese MT.

Annie: Social thing again.

Ron: The main thing is the ability to annotate reliably. They actually
don't care about any intermediate representations; a regression to
behaviorism. We should go back and read Chomsky's review of Skinner.

Alex: I disagree. I think it's about ease of understanding, of the
framework. People \*think\* they understand it.

Dan: This group has not had very much success in convincing external
users to use our meaning representations. For me it would be useful,
Dick, because you say you are of easy morals, and use dependency parser
but realize that it falls short and find ways to steal from your past
and enriched that. If someone walked up and said, 'I've got a new shiny
black box that does at least all that and more' what are the things that
would keep you from switching over? What are the drags?

Dick: The degree to which that black box is adaptable to different
domains. That's the big problem with trying to go off general language
models. Bank policies aren't going to look like the PTB -- particularly
the terminology, the compound nouns.

Bec: Meaning you have to have the annotation?

Dick: For compound noun structure, you can get a lot out of collocation.
If you're working with a statistical parser, there's nothing to prevent
you from using white-list and black-list rules on top of that. Not
trying to annotate data, just adapt the output.

Dan: In our terms, it just comes down to parse selection right? Nothing
unusual about the English, and the ways in which the constructions
attach is a particular set of terms, becomes a problem of how you rank
the analyses.

Emily: To Ron's earlier point about AMR and just what you can annotate,
puts in a plug for IWCS 2015 paper showing our annotations are far more
consistent than AMR.

Ron: Don't care about what's inside --- just interested in correlations
(image labeling, keyword searches). There's another class of problems
where the richness of the semantic representations matter more, which is
problems of interpretation, where you have some input and you want more
than just a transcription, but rather to use the output representation
to kick off a computation, where those computations aren't that closely
aligned with any data you can observe.

Alex: Completely agree.

Francis: Achoo.

Ron: I don't think these people mostly care about these problems. The AI
community does, not the NLP community.

Alex: Take for example learning by demonstration (subpart of robotics)
where people are taking a data-driven approach to teach robots new
skills by demonstrating the actions. For example, if you want the robot
to learn to bubble wrap vases. How many times do you have to do it for
the robot to learn? A gazillion. And even once it's learned it, you
wouldn't know how to add that knowledge to planning algorithms. But if
you have a person talking as well as demonstrating, they could just say
*bubble wrap fragile objects to protect them in transit*, and if you
have a black box that encodes that there's a relationship between bubble
wrapping fragile objects and protecting them in transit, you can use
that in a model and learn to discover and exploit unforeseen
eventualities, through interaction in lexicon. There's there value of
deep linguistic processing: logic representations feeds into logic.

Martin: To quote Koskenniemi -- if you know, don't guess.

Ron: Another one of my rants. You can't say nowadays that you're not
doing learning. So the way I've tried to deal with this is to talk about
two kinds of learning. (1) Learning by observation (from data) and (2)
learning by instructions, where someone who knows what's going on tells
you.

Alex: That's what I'm saying!

Ron: The trick is that they have to tell you in a form that you can use
to compute. Ex: subject-verb agreement. Why use 100,000 examples to
learn that, where if you had a notation, like a theory of grammar, where
an expert could write it down for you. Use your data for things that are
mysterious, and this isn't one of them. Save it for things like
disambiguation. That make a more efficient use of the data.

Glenn: The learning people are doing models too, they're just not
interpretable models.

Alex: Some of them are, but even those you can't add variables to
mid-process. If you have an unforeseen thing come up, there's nothing to
do about it except learn again from scratch.

Glenn: I think Emily has a story about a reviewer who rejected some work
because it was not reproducible. Shows a misunderstanding between the
communities.

Emily: Yes, what they were worried about reproducing was the process of
building the grammar.

Ron: The objects we build are complex, and require deep understanding.
If you try to move them into a different environment that doesn't have
the highly trained people. Can't maintain and support it can't extend --
maybe that's why people back off to weaker systems. If you don't like
what the CLEAR system is doing, get some other data, retrain it.

oe: And hope.

Ron: Just working from annotations doesn't require thinking about the
system itself, just thinking about the example at hand.

Annie: In response to Alex's comment before. If you want to get more
concrete --- take Alex's example (bubble wrap) and think about where the
data comes in, what goes in the representation? \[cf. Ron's two types of
learning\] Maybe we could discuss an example to get a better handle on
how the two things would play together in the world where we think our
stuff is valuable. These examples require sophisticated ontologies;
where do we get those?

Emily: Like a start-up in the Seattle area collecting knowledge through
human-in-the-loop NL-to-KR.

Cleo: We should focus on the kind of task that does require semantic
representations is the way to make this work relevant to the world at
large. The kind of tasks that appear compelling are often too hard ---
need something that is compelling and doesn't require humungous amounts
of non-lx knowledge and put it out there as a challenge. The way to make
progress in this community is to put out shared tasks. If we want to
ultimately center semantic representations, that's how we should be
thinking.

Guy: Following up efficiency of learning, keynote from Google at LREC.
They said that for one part of their pipeline in English &lt;&gt;
Japanese translation (reordering) the hand-written rules were better
than any learning system. Even Google says that sometimes rule-based is
the way to go.

oe: It was Ryan [MacDonald](/MacDonald). He also reported that in their
work on doing morphology they ended up seeing that it was beneficial to
write down the rules of morphology rather than annotate larger amounts
of data. So two glimpses of that observation.

Woodley: That sounds almost novel enough to publish. \[sarcasm mark:
flag waving\]

Francis: Several steps back to how we should be more Chomskyan. One
issue that is sometimes lost in these discussions is
competence/performance distinction. We tend to talk about competence
(what wonderful things we can do) not performance (doing it at scale).
That's one of the reasons people choose a stupider \[bleep\] system …
because it will given them consistently bad results, rather than
beautiful results in 7/10 cases and nothing in 3/10. Often what we want
to be doing is matching to large MWEs, and our parsers give single words
joined in many ways, and if we're matching to ontologies with the five
word chunks, maybe we don't need the intermediate structure or maybe
it's not what we want. Should remember that it's not just competence.

Glenn: We are not industry, we choose our problems because they're hard,
whereas industry chooses problems they can solve --- at liberty to
modify problems to where they can deliver something to consumers.

Emily: It's not just us (academia) v. them (industry) -- plenty of folks
in academia it would be nice to interest.

Glenn: Onus on us to not create shared tasks that suit ourselves. Make
our stuff reliable, and solve useful problems.

Antske: Towards other academics, it's also about showing them that
there's interesting problems that are not solved.

oe: Arguably, I think what Alex said earlier, many people in the ACL
mainstream community are manipulating the problems.

Francis: The evaluation criteria are biased towards what can be done.

oe: So why wouldn't we try to do the same thing? It would be doing the
field a service.

Ron: There was a really bizarre panel at NAACL, where the panel got onto
the question of whether NLP needs Linguistics.

Emily: That wasn't the main point of the panel --- Pascale was just
trying to be controversial.

Ron: She asked if Linguistics is a science. I say: What's the X such
that deep learning studies X?

Martin: There was a reading group here at Stanford a few years ago. The
grad students got together to decide what to read, and one small voice
from the back said "Maybe we should look at what linguists do" ---
someone else: "Why would you want to do that???"

Ron: When I interview people, they all say they have built a POS tagger,
so I ask them what a part of speech is. Invariably, they don't know.

Cleo: One thing we forgot --- Standardizing semantic representations
for…. tasks? What else? Could one build a task around the entailment
etc.

Dan: To follow upon that invitation --- it would seem to me like a task
that involves equivalence of paraphrases could well fit into that study
about entailment. I have selfishly such a task starting to emerge on the
horizon in the context of asking students to translate Chinese to
English. Checking student responses against teacher-approved list
quickly turns into a paraphrase equivalence task. We have been thinking
for years about paraphrases as something we ought to do … a
representation that sustains entailment would be a good step in that
direction.

Cleo: And it avoids the problem of needing to know everything about the
world.

Dan: And even if you needed to, it would be over the bounded domain.

oe/Dick: RTE (or its future variant: Entailment and Contradiction
Detection; ECD) as a task. Also STS.

Emily: STS is a really weird task and it has the world knowledge
problem.

Last update: 2016-06-22 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/StanfordMeaningRep/_edit)]{% endraw %}