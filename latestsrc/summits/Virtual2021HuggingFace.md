{% raw %}Scribe: Olga

Emily (via chat): Neither Angie nor I bear any responsibility for the name! (HuggingFace)

Angie: Brief overview of what HF is, what they offer, what their audience (see slides).

Will any of that be useful to DELPH-IN?

HF is a set of open-source python libraries for NLP: transformers, datasets, tokenizers, accelerate; a community forum, docs etc. Also some teaching resources, introductory course (on what?)

A web catalog, portal, searchable by task and other criteria. Including: which datasets models are trained on. Licenses.  Angie shows a picture from the portal. For each model, a "model card", usually hand-written. 

Key point: algorithmic choosing of what input/output is, for the type of model. Similar for datasets, e.g. searchable by task. Also, "dataset cards".  Links to related information, all the relevant tags displayed.

Shows the Dataset Viewer (found in the slides).

The audience of HF: a bunch of organizations (commercial and organizational) as well as individuals.

Everything is hosted on Github.

How does it relate to DELPH-IN?

Maybe we could increase visibility for our datasets. Also engage with the community. But, HF is very ML-focused. The UD for example are there but aren't really engaged with anything; nobody seems to be training on it. People there probably aren't familiar with the concept of HPSG and MRS.

Emily: seems like an important venue for people who think of NLP as all-ML, could learn about different types of NLP such as DELPH-IN.  But, that's work for us! As for mismatches: parsing isn't even an available widget!

Eric: I came to ERG to build an application; I had found HF very early and it didn't help me with what I needed. I wish I found DELPH-IN earlier. But the learning curve is very steep indeed. Python libraries got me in quickly but then learning MRS was very hard.

Glenn: seems like HF is narrow in terms of types of models. They don't look like they are set up to offer things like the ERG.

Dan: Glenn is probably largely right but if the UD is there, maybe we should be, too. Maybe at least some of the treebanks. Need to figure out the "right", learnable annotation scheme. E.g. dependency structures, or something resembling AMR. Maybe something like a conll. Maybe, start with examples of what annotations they have, try to come up with something similar. Also: how to expose our generation capabilities? 

Guy (via chat): Are AMR, UCCA there? Anything other than UD.

Angie (replying to Guy via chat): Only UD, looks like. And not as a parser; as a dataset. conll2000,2002,2003 are there in the catalog.

Alex (via chat): UD uses https://universaldependencies.org/format.html

Emily (via chat): Maybe we could put out the EDS data from MRP: HTTP://mrp.nlpl.eu/2020/index.php?page=14

Glenn: maybe get foot in the door, then actually educate people about our resources.

Dan: Yes, probably plenty of people wanting slightly richer annotation. Give them a gateway drug.

Eric: What sold DELPH-IN for me was seeing the results.

Emily: maybe exposing Redwoods in different formats, and Wikiwoods, to show we are scalable.

Dan: Maybe also expose some derivatives; our maxent models may be obsolete but they are interpretable by the ML-people. Also what Woodley is doing based on Zhang's work. 

Glenn: Aren't the maxent models in cahoots with the phrase structure rules?

Dan: Maybe but the granularity can be dumbed down. I was able to coerce a model work with a different grammar, and the models proved robust. One can do this rather systematically. It's about collapsing multiple rule labels into one. But people are creative once given something to play with. Important to make clear what the product, the intent is in principle.

We would have to invest a lot more in documentation, presentation, to build this bridge. 

Emily: Seems to be a lot of enthusiasm. The question is: who is positioned to do this liasing?

Angie: Whoever comes with the artifact is expected to take on the PR.

Emily: We need to decide what the minimum required work is. Sounds like this may happen if someone volunteers to be responsible for this.

Dan: Luis has been producing maxent models nad treebanks. The ability to mark a sentence as not quite wellformed is what's important, and that's something that's just not really present in ML models. Maybe mal-rule derived grammars are of more immediate interest. Restrictions on input. Something that's slightly robust. Then the datasets don't need to be so large to produce something interesting.

Emily: There may be CLMS students interested on a project (not a thesis). Maybe one of them could produce a draft of what could go on HF.

Dan: we could talk to Nancy (Eynd? OZ: not sure about the last name) who worked on annotation a lot; maybe she found a point of "purchase". Other people who have tried to build the bridge between symbolic and ML. 

Olga: Someone in the UD?

Alex: I am part of UD. Mal-rules for sure, very particular to D. Accelerating the process of annotation is very important. More consistent annotation. Btw UD is also very costly, not only us. Being able to quickly update annotations, etc., would be very popular.

Dan: Let's pretend we have nice python tools which convert our mysterious parses to datasets paired with something interpretable. Then we can say: in addition, here's the pipeline to reproduce what's e.g. in the wikiwoods. We can then see if there's room in this HF bridge: you like this small bit of data; here's what you could do with your machinery and our pipeline. 

Glenn: Is there anything wrong in them training models as if the data were human-annotated?

Dan: It's a matter of degree.

Angie: We did consider human-annotated vs machine annotated as a tag. So that could be very explicit.

Dan: Or maybe there could be something in between; wikiwoods derives from human annotation.

Emily: HF is interested in being flexible and extendable. Angie is currently working for them so we even have our own person there, to influence things. And resources can be linked to one another.

Jan (in the chat):  The simplest representation would be a linearized representation of parses, as that can be used in seq2seq models. 

Guy agrees with Jan in the chat.

Emily (in the chat): Angelina Ivanova was working on projecting syntactic dependencies from ERG derivations. https://aclanthology.org/W12-3602.pdf -- and her PhD thesis would be relevant here.

Emily: Is there interest at HF in adding structured predictions?

Angie, possibly, but not sure if would be parsing. Rather, other NLP tasks (speech, vision)

Emily: As a pydelphin developer, I had good experience talking to people who are used to AMR when I was working on DMRS conversion. Generally, I am for getting something out there. And our data is good, it's clean. It's impressive in that sense. MRS usualy results in improvements. There was someone at Edinburgh (with Alex Lascarides) working on something similar, making our data more accessible. We want a coherent story (?). 

Alex: Could there be a plugin or core of pydelphin, to convert of ERG trees to US.

Dan: MRS to UD is more manageable.

Alex: Didn't we decide on the opposite in Paris?

Dan: not sure.

Mike: formatting ourselves as UD or conll is doable, but actually converting our labels would be more work.

Ann: Another topic. There seems to be a change in terms of the appetite to use delphin to produce datasets (as in: it's bigger now). Artificial data is in this week and out next week, so you never know. But when it's in, we are probably unbeatable there. We could put Alex Kuhle's work on HF, to start with. ShapeWorld is actively used by Jesse Mu, for example. https://arxiv.org/abs/2106.02668 -- this is about Lewis Games.

Emily: how do we turn this enthusiasm into resources! Let's now talk a bit about our concerns. What should we be careful about. This may become the image of D. for a larger community.

Olga: amplify the "symbolic, no ML" image?

Alex: The complexity of the tools. Maybe people explicitly emphasize simplicity. But: need honest perspective e.g. as to how much it takes to e.g. develop a new grammar. 5 years, 10 years more?

Emily: Except ERG, is anyone ready to expose their work. Zhong with malrules? 10 years ago, even the ERG didn't have enough coverage, but now it is there. But other grammars aren't. This shouldn't stop us but could inform the framing. Grammar Matrix could be put there, maybe? 

Glenn: if we put one of our less developed resources, we would need to consider how that would color the perception of DELPH-IN. ERG shows what DELPH-IN really is capable of; don't want to undersell by e.g. only exposing a smaller grammar.

Dan: part of the strategy could be a convention for the model cards. Quick mini-tutorial on our dimensions

Emily: interesting documentation problem/scenario! 

Glenn: How do these model cards relate to Data Statments which Emily has been working on?

Angie: model cards and data statements actually come out of very different perspectives. I am trying to steer their model cards a bit closer to data statements but it's for now a bit forward looking endeavor, with mixed results.

Emily: Semi-structured documentation is used across both kinds of documentation. What's new to me here (in HF) is we have multiple different resources, and within that schematized documentation, we can do sub-standartization. 

Olga: Back to what Glenn was saying about exposing "minor" resources: But mainstream NLP doesn't even have resources for most languages that we do have some stuff for! So, what Glenn said could go either way, we may impress someone by having resources for Thai or even the smaller, 567 or even baseline matrix grammars. 

Ann (in the chat): We can generate data in those languages with smaller grammars. Generally artificial data is relevant here. And generation with small grammars is actually easier than with the ERG. 

Dan: Yes, focus on what's unique for DELPH-IN. We could engage Matrix grammars: here's some sentences which the grammars accommodate. 

Mike: Performance benchmarking. If we choose the ERG as our standard, we could come up with a metric which puts other resources in relation to ERG.

Angie (in the chat): Here's the BliMP dataset, one of the more linguistic ones on HF: https://huggingface.co/datasets/viewer/?dataset=blimp

Emily (in the chat): Remember that Grammar Catalog we started back in 2011?

Emily: Was great to see lots of enthusiasm for the topic.


Last update: 2021-07-19 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/Virtual2021HuggingFace/_edit)]{% endraw %}