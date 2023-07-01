{% raw %}JanBuys: Current deep learning replaces everything with a
neural network. Can we incorporate linguistic structure?

Use cases of MRS:

- general-purpose sentence representations, as input for downstream
applications
- intermediate representations for semantic parsing (text to
domain-specific meaning)
- intermediate representations for generation (domain-specific meaning
to text, translation, rewriting, summarisation, language modelling)

EmilyBender: If we don't get improvements, it's because
the tasks are tailored to this end-to-end paradigm. What are interesting
tasks?

JanBuys: Recently, there's more interest in designing
specific test sets, to show generalisation from the training data.

EmilyBender: We also need to generalise \*across tasks\*
– we can't just do 1500 end-to-end tasks and expect a general system.

JanBuys: There's recent work trying to show, if you have a
good language model, that knowledge is applicable to multiple tasks.
It's still not quite the same as what you're asking.

EmilyBender: Not meaning-sensitive.

JohnCarroll: What's an interpretable model? If there's
any deep learning, that part is not interpretable.

JanBuys: Interpretability is hard to define. You can have a
model which is interpretable in some sense, even if it uses machine
learning. If you have a more explicit intermediate representation, or a
probability distribution over representations, that tells you something.

JohnCarroll: Unless the deep model is ignoring all that
structure and just taking the words. To play devil's advocate.

AlexanderKoller: I'll raise your devil's advocate.
"Interpretable" is not the word I would choose – we want models that are
debuggable, where we can introspect into the model. We want to make this
easier for a neural model. We also want models that are explainable – an
end-to-end system will behave in a way, and we want to explain to the
user. We don't need internal structure that a researcher can understand,
we just need something that a layperson can understand.

JanBuys: "Explainable" might be a better word – potentially,
once you're using a vector, there's a limit to interpretability. We
could still formulate the model in a way that you can get an
explanation.

AlexanderKoller: That's not so different from
intricate symbolic models. If you have a dialogue system with HPSG and
it doesn't output the right thing, can this be explained to the end
user?

BertholdCrysmann: Do you remember the demo with the
boxes flashing up?

AlexanderKoller: I remember in my [HiWi](/HiWi) days,
where we had type hierarchies that filled the whole wall.

GuyEmerson: One answer is to design systems that are
modular. If you train a large network end-to-end, it can be difficult to
tell which part of the network is doing what. If the network is modular
in some way, perhaps using linguistic structure, then we might be able
to interpret each part of the system. Rather than having one huge black
box, we have many small black boxes, which could each be more
manageable.

JanBuys: Another answer is to use more probabilistic models,
with explicit latent variables, rather than multiple operations on
vectors. One challenge, when combining a neural and a symbolic model, is
that there isn't a way to know which parts the neural model will learn.
You want the symbolic representation to capture particular attributes,
but if you're not careful, you don't have a way to force the neural
model to use that.

EmilyBender: Maybe we should think about the ways in
which the symbolic representation can be brought in. You gave three use
cases, but are there other possibilities beyond that?

JanBuys: On one extreme, you would have a model which you
pretrained to predict MRS, but at test time, you don't do this
explicitly, but just use the representation that was used to predict the
MRS. All the linguistic knowledge is baked into the vector. You don't
have explainability, but in principle the vector has some knowledge that
you wouldn't have without training on MRSs. On the other extreme, you
explicitly predict the linguistic structure, and use that as a
bottleneck, in the sense that for further predictions you only use the
MRS.

EmilyBender: Presumably you could do ablation tests, and
see whether it helps compared to only using one or the other? But what
kind of task?

JanBuys: Learning sentence representations is not a task on
its own. One standard task is SNLI (predicting entailment). Another is
question answering (finding the answer in a long text).

DanFlickinger: [Robot
control](https://delph-in.github.io/docs/home/DelphinApplications#Robot-Control) –
[WoodleyPackard](/WoodleyPackard) entered a competition, and crucially
used MRS as a bottleneck as you described.

AlexanderKoller: How much data there was in the robot
control challenge?

DanFlickinger: Relatively modest by today's standard. I
can't remember exactly.

EmilyBender: It was also crowdsourced and messy.

AlexanderKoller: Another contrast between symbolic
and neural approaches is that, for a neural method to work, you need
substantial amounts of training data. There is something to be gained by
mapping to something task independent, and then either the front or back
end could be hand-written to work around lack of data.

EmilyBender: Multilingual tasks? Could be seen as
transfer learning, because MRS has information beyond the surface
string.

JanBuys: That area hasn't been worked on enough.

EmilyBender: We don't have any grammars as large as the
ERG, but there are a couple of language pars where we could do
something.

EmilyBender: There are a few people here working on
neural models, and I would be interested to hear what reactions you get
when presenting your work to a deep learning audience. Jan, Weiwei, Guy?

GuyEmerson: I've had quite a mix of reactions. Some people
are convinced that you can do everything end-to-end, so ask things like,
"Can't you just put it in a vector?" – that kind of person thinks the
burden of proof is to show that linguistic structure is useful. On the
other hand, some people completely agree that we should try to use
linguistic structure but don't know how this can be usefully done in
practice. So maybe this comes back to finding the right tasks – to show
the first person that structure is useful, and to show the second person
a good way of doing this.

JanBuys: One potential way is to focus on datasets. If you
have a dataset, you can create a model for that dataset, have a
competition. But the dataset can't be too easy or too hard, or else
there's no motivation. One potential avenue to put focus on limitations
of models without linguistic structure.

EmilyBender: We need a task that isn't easily modelled
end-to-end.

[AngelinaMcMillanMajor](/AngelinaMcMillanMajor): Generating poetry and
stories? Maybe we need bigger tassks that are more human-like.

WeiweiSun: I would like to mention some empirical results.
As an example of the general issue of linguistic structure in neural
models – semantic role labelling for learner Chinese. We asked two
undergrads to annotate some learner text, and considered four different
mother languages, typologically diverse: English, Arabic, Russian,
Japanese. We found high inter-annotator agreement, so we can use this to
measure how much a human can understand learner text. Recently many
papers employ end-to-end learning, achieving state of the art. I tested
a very old system from 10 years ago. It uses parallel data, one is the
learner sentence, and the other is the correction. For corrections,
end-to-end is better, but for learner sentences, the opposite. Of the
four mother languages, the same result. If we use some grammar-based
method with semantic analysis, focusing on out-of-domain task is
important. Even though learner language is supposed to be ungrammatical,
grammar-based methods help.

Another empirical result is on generation – I will present more
tomorrow, but here is the main finding. We used [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) to
build a transducer-based graph-to-string model. We can compare this with
a end-to-end model – linearise the EDS graph and use a seq-to-seq model
to produce a string. If we just use [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) data, the
symbolic system performs significantly better. And we can interpret
every transduction rule. Deep learning is very powerful, and currently
end-to-end sequence-based models are dominant, but for our research,
structure is very helpful. With formalisms like graph grammars, or
automata, or HPSG, we can get better results. We must find where it
works.

EmilyBender: What kinds of reactions do you get from deep
learning people?

WeiweiSun: I didn't get negative reactions. They don't
challenge the data. Many still think linguistically motivated models are
important. Another reason why I submitted to ACL and got positive
reults, is magical numbers – I got state of the art. The quality of
reviews is not that good, and many only care about the magical number.
You get that and pass.

EmilyBender: That's one answer to, "how do we get people
to care?" – get the magic number!

OlgaZamaraeva: The numbers question is a good one, but
not necessarily easy. That paper of ours at COLING did show some
incremental improvement (maybe why it got accepted?) – we used DMRS to
improve the vectors. We still had unigram features for the vectors, not
deep learning. One algorithm was an off-the-shelf neural algorithm, and
we tried several algorithms to classify documents. The vectors were
enhanced by DMRS to hypothesise negation scope, and then we treated any
word under the scope of negation as a different feature. Improvements
looked almost random at times, so it's hard to say why the system
improved. But with DMRS, we can have a much richer error analysis, which
helps with the reviews as well.

JohnCarroll: Other communities, like the CCG community,
have also struggled with this problem. They produced a corpus of
raising/control, demonstrating that their parser could get it right and
other parsers got it wrong. It wasn't real data, and it was unbalanced,
but it showed something was happening that was right.

AlexanderKoller: Can I ask the opposite question?
Have people had a harder time getting non-neural papers published
compared to 5-10 years ago? Do you get the feeling, when you submit a
non-neural paper, "They're going to catch me this time"?

EmilyBender: From the COLING perspective, I don't think
so. Neural papers do not differentiate themselves from each other. A
paper doing something different stands out in a good way. I don't think
it's negative opinion of papers using linguistic structure, but then
COLING is meant to be more linguistics-friendly.

OlgaZamaraeva: Dirk Hovy has a graph of the change,
plotting ACL paper titles with "neural net" and "grammar", and you do
see the number of neural papers going up.

AlexanderKoller: Number accepted or rejected?

OlgaZamaraeva: Accepted.

FrancisBond: It might depend on the area. Machine
translation is very score-oriented – if it isn't better, the most common
question is, "Why didn't you use a neural net?".

BertholdCrysmann: How do you follow up after a
question like that?

FrancisBond: There's no follow-up.

DanFlickinger: In quite a few of these applications,
looking at scoring, the issue of robustness must come in somewhere.
Using MRS as a way of spiking your vectors, even in a successful
application, the grammar will fail at some point. For some applications,
these gaps are innocent, but some are catastrophic. Have you reflected
on this inherent shortcoming? We don't understand grammar in its
totality.

JanBuys: That's a definite limitation. One solution is to
have more statistical systems – we still want to predict the MRS, so we
can give up on high precision and use a statistical parser instead of
grammar-based parser. That's one way to go, but maybe not correct way.
The other thing is that during training, it's not that bad if you throw
away sentences for which you don't have coverage, as long as you have a
reasonably large corpus. You can just train on the sentences for which
you do get a parse. When you deploy the system, you need to combine it
with a robust parser, or just say that we're prepared to live with
giving up on linguistic analyses for some sentences. You could make the
counterargument, that maybe if the grammar can't parse, the structure
won't help?

DanFlickinger: Woodley has built on Yi Zhang's work,
training a PCFG on a corpus that was parsed with the ERG. The resulting
model introduces a level of robustness, because it isn't using as
fine-grained restrictions as the grammar. It's turning the dial between
robustness and precision.

JanBuys: I'll be talking about that trade-off this afternoon.

DanFlickinger: There's a place to do that without
abandoning the linguistic structure altogether.

FrancisBond: Whether we can throw away part of the
training data depends on the coverage of the grammar. For Zhong, there
are phenomena it can't handle – if you filter, the statistical system
still won't be able to parse those constructions.

JanBuys: We can still leverage the grammar even without full
coverage, for example for low-resource languages – we don't have much
training data so deep learning systems will struggle anyway, and we
could try to leverage the structure we do have.

EmilyBender: How do we get robustness? Can we mine the
parse chart for partial parses?

JanBuys: There is one avenue, of span-based neural parsing –
try to predict independently for each span, whether it should be a
constituent. In principle, we could use this model without enforcing
global consistency. We could train the model to be consistent with
complete parse trees, but at test time, if HPSG parsing fails, we could
still do a more greedy prediction. So we could use information that's
easier to work with than a packed forest.

EmilyBender: I'm thinking about places where the grammar
tells you something – I can't give you a spanning parse, but I can give
you the pieces I found.

JanBuys: There must be a way to represent these partial
parses so you can do something with it. We could convert a partial
analysis to a partial MRS, and treat as if it were a complete one.

EmilyBender: The way our composition works means they
will have partial MRSs, but there's the stuff you want to see, and all
kinds of weird stuff.

DanFlickinger: I've always been sceptical about the
ability to extract useful information from the chart – it means you only
have a few trillion possibilities left. 10^9/12/14... there's still a
huge search space!

EmilyBender: Maybe for the ERG. What about Zhong?

FrancisBond: Zhong covers many phenomena! Topicalisation,
dropped subjects...

DanFlickinger: Gaps, coordination in surprising ways...
analyses that a grammar writer doesn't want but can't see how to exclude
them in principle.

EmilyBender: Could we strip out extracted versions? Find
a subset of the chart in a principled way

DanFlickinger: Years ago, people tried to do some of
those straightforward ways to explore the chart.

BerndKiefer: Yes, but we were very restrictive. We looked
for big NP things that we could combine with the verbs floating around.
We didn't get far.

JohnCarroll: We did a similar thing with RASP, with
learner essays. It worked reasonably well, but just wanted to say, it's
a bad parse. The more glue we need, the worse it scores. RASP produces
more edges than the ERG.

BerndKiefer: With these new neural methods, can we do
better than a PCFG?

JanBuys: In principle, some of these neural models have shown
that greedy or close-to-greedy can work quite well, but this is not true
for PCFGs. If you have an underlying RNN encoding your sentence, you can
propagate some parsing information into the neural state, so if you make
predictions only on spans, you can make a reasonable prediction about
whether the span should be used, because it can use global context.
Something like that could help. But in cases where the number of
potential edges is still too much, it doesn't solve the problem.

BerndKiefer: If you wouldn't dare to put these things in
that would explode the search space, maybe we could let the neural net
work out what to do with it. I wonder if that would be feasible, or
worth trying?

DanFlickinger: It's tempting to let data-driven systems
find which things in the chart survive, and which are doomed – make a
good guess about constituent boundaries. That would dramatically reduce
the search space.

AlexanderKoller: Recent work used a neural tagger to
predict constituent boundaries – this was in the context of a PCFG, but
was also applied to TAG. It worked pretty well.

DanFlickinger: Efficiency in finding constituents, even
when using the deep grammar, gives much a smaller search space. Then we
can use John's method – not trillions, but thousands of trees.

EmilyBender: The training data could be a chart and the
best parse.

JohnCarroll: Often, context is the discriminating factor.
It's the combinations of constituents that explode – the number of three
consecutive edges in a chart is far too massive to explore.

JanBuys: [TurboParser](/TurboParser) uses dependency parsing
with higher order features – we can deal with that.

DanFlickinger: Using context?

JanBuys: It's not deep learning, just a general parsing
algorithm using dual composition or something. Has been applied with
neural features.

FrancisBond: One place a neural net has been effective,
is initial spelling correction in tokenisation – if something is wrong,
the whole thing breaks. You can put a neural system on the front.
Converting a tweet to normal text, or poorly typed text to reasonably
typed – that could make a big difference in how able we are to parse.

JanBuys: Models that work on the character level could be
robust to a misspelling. Using that to replace the first tagging step
might help. It could also help with unknown words.

AlexanderKoller: Neural models help a lot with
unknown words. In the same paper of ours that I mentioned earlier, you
use a simple supertagging model and all coverage problems go away.

BerndKiefer: I'm advocating one application where
linguistic structure helps (although I came to it late): dialogue
management, beyond recommending a restaurant. I was looking for good
applications for years, and I think really, dialogue is the thing which
jumped at me.

JanBuys: In research, people use neural systems for dialogue,
but not in practice, because it's not robust. There are no guarantees
about it doing the right thing.

BerndKiefer: There is much less complexity than in
written text, but there are other challenges, like incrementality in
production and recognition. You have a quite general analysis and
generation system, and something in between which can do symbolic
knowledge – and that can be combined. I can't combine my dialogue system
with any old vector.

AlexanderKoller: What do you mean?

BerndKiefer: If I have a vector from another system, I
can't just plug it in to mine.

AlexanderKoller: Some people try embedding all the
symbolic things, then you're in vector-land for everything. I'm torn – I
want to agree with you, and say that dialogue is surely the last bastion
of where you need reasoning and symbolic things, but I find it hard –
people have only tried neural dialogue systems for two or three years,
and it requires developing a lot of machinery, including inference,
which people made systems for based on logic in the 70s. If you give
them a few years to catch up...

Coming back to Emily's question – what are the applications, where we
think symbolic methods will provide a benefit? I'm trying to phrase this
as un-adverserially as possible – not "us" versus "them". We think
neural methods have something to offer, and the clever neural people are
hoping to find a place where symbolic things help. But it hasn't been
demonstrated that if you take a neural system and add linguistic
knowledge, it becomes better. We need linguistically informed resources
and techniques, where we expect it to be better than just having massive
amounts of data. It's not clear to me. But I want something like that.

BerndKiefer: I agree, and there have been fantastic
advances in neural dialogue models – but some things you have to build
from scratch, and you don't have massive data. What do you do? I find
myself in that situation. I don't have the resources and the data for a
neural system.

AlexanderKoller: If you think of digital assistants,
like Alexa, there are totally different backends for different domains –
even a separate one for pizza – each with very specific semantic
representations. All of those systems would collect separate semantic
annotations. Something simpler could be done with a general purpose
semantic representation.

EmilyBender: I was at Amazon, and they have no
linguistics going on. I met one person who was really into neural nets,
and sees language as an application. He said it was still to be shown
that language has structure... we had a conversation.

AlexanderKoller: Sometimes it's almost unusable –
it's not fun getting a train in Germany with Alexa.

JohnCarroll: Is there a gap in the market for a system
that's linguistically informed?

AlexanderKoller: You need to make it easy to use, so
that anyone writing an Alexa skill can understand it without knowing
linguistics.

EmilyBender: We're a long way from that being a killer
app.

JohnCarroll: At least it's a generic technology.

BerndKiefer: There's also neural work using AMRs, which
seem to be impoverished MRSs.

EmilyBender: "Impoverished" is not quite fair – they do
some things we don't do, so there are both sides of the Venn diagram.
But we're more consistent.

JanBuys: If people don't know enough about these different
formalisms, they partially try and reinvent the wheel.

* * *

Scribed by GuyEmerson.

Last update: 2022-11-02 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/DiderotApplicationDiscussion/_edit)]{% endraw %}