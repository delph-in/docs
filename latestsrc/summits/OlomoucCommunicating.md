{% raw %}# Discussion on Communicating DELPH-IN Research

Presenter: Emily M. Bender

Scribe: Guy Emerson

* * *

Emily M. Bender: Who to talk to? Why? How? What obstacles? What strategies? (See [slides](https://github.com/delph-in/docs/blob/main/summits/2024/how-to-talk-discussion.pdf?raw=true))

Olga Zamaraeva: On my last grant application, applied to a humanities panel hoping for more linguists, but instead got NLP reviewers. Geared text to linguists but wasn't a good choice.

Eric Zinda: Users of my library. In the game world, people ask "why don't you just use ChatGPT?"... Can quickly get that to go away ("well, why aren't you using it?"), but that's the kneejerk reaction. Need to quickly describe the value of Delph-in.

Luís Morgado da Costa: Students. Want to create bridges, provide a broad introduction to computational linguistics; what has been done, what are the trends, what are the risks, how does it impact how we see language, what is relevant when solving a problem.

Alexandre Rademaker: Agree!

Alex Lascarides: Using ERG to help students appreciate how ambiguous language is, find wild interpretations of less likely parses -- a tool for unlearning what they think they know about language.

John Carroll: Students complain, "you're teaching us about old-fashioned technologies; teach me how to get a job at Google!"

Ann Copestake: Talking to AI people, who have suddenly realised that language is out there, it's a different conversation. Just making sure they realise what's been done. They have concerns about checking correctness, and are more interested than NLP people.

Alex L: Small companies can't afford to use ChatGPT etc., still using old-school NLP. John Hopkins still teaching old-school NLP because there is demand for it. Need control over outputs.

John: From Sussex, most graduates go to a local company, e.g. crawling social media for opinions.

Alexandre: Can compare time needed to develop a system.

Eric: I know a company where they use machine learning to find ideas to improve their systems, but then develop a predictable rule-based system.

Dan Flickinger: People interested in logic and reasoning. One of the main drivers is to explain what the machine did and why, give sequence of internal steps that can be checked by a sceptical user, know where something went wrong, verify correctness or better align user expectations with what the machine can do.

Chris Curtis: Illustrate that you can get richer, more reliable, explainable semantics, with relative likelihood of different interpretations.

Ann: Automatic proof checking has taken off in the last few years. That community is a potential target for us. Development in computer science that could be useful for us.

Olga: Common complaint "oh but this doesn't scale". The theory is what scales (easier to build the next grammar).

Dan: AMR people might be interested, aligning of efforts.

Guy Emerson: Align via Cambridge Grammar of the English Language?

Dan: Possible way to build common ground, but it doesn't say what the semantics should look like, and AMR has different goals from MRS.

Alexandre: Also the UD community.

Ann: People interested in inference, like Martha Palmer and Annie Zaenen.

Emily: So far no one mentioned reviewers?

Olga: Similar to grants?

Ann: Mainstream NLP people fed up of people coming from industry who expect bigger compute budgets.

Alex L: Have encouraged AI researchers in HRI to use ERG, so have access to truth conditions.

Emily: So there's possibility of more ins. What else gets in the way?

Alexandre: Lack of evidence that richness of the output is useful.

Olga: We're awkwardly between theory and computation: attached to linguistic theory but lacking in research papers pursuing linguistic research questions.

Ann: Around 2016, we collected examples where we had done well in shared tasks, but maybe difficult to do now?

Alexandre: Need better shared tasks?

Ann: We would have to develop them...

Alexandre: Old papers about dynamic treebanks and consistency of annotation, could be of interest to UD community? Big problem for them. Follow discussion in the UD forum, on topics where we may already have better answers.

Ann: Could be good "alternative" to UD (could be complementary or could be direct alternative).

Dan: We've worked on quite a few languages in Delph-in, but overall under-resourced in multilinguality. "Does this community have enough breadth and depth to be self-sustainable? Still here in 5 years?" Here a long time but small. Are we aging out?

Francis Bond: And longevity mainly English?

Dan: Petter has been working on Norwegian for a while.

Emily: And Olga is resurrecting the Spanish grammar.

Olga: Breadth of Grammar Matrix is impressive.

Ann: Find the Grammar Matrix the most impressive thing when talking to a general audience.

John: Software tools that go along with the grammars. But from a software engineering perspective, they're not up to current standards.

Olga: Not that hard to describe the system, but actually running it can be difficult for a newcomer.

Alexandre: LOGON scary, but nowadays much easier.

John: Pydelphin very helpful.

Mike Goodman: Hard to make a cost comparison against other tools, because don't always apply in the same situations. 30 years and still not full coverage of English. To solve a specific task, how would you go about using this or fine-tuning an LLM?

Emily: 30 years but now we're there, don't need to do again.

Dan: Fine-tuning is not trivial, takes big machines, costs money. What remains, what expertise do you need? What tools would smooth the tuning process?

Alexandre: Make it clear what would be needed to adapt the machinery to a new task.

Ann: Positive: our stuff runs so much faster. Negative: difficult to find someone who knows what a verb is, almost no understanding of what it would take to write a lexical entry, much harder to explain how to do this for their own system. If people started doing it, then there could be a community to help.

Dan: We might be far enough along to assign a rough category to new words, so a user could give an example.

Ann: Can get people to the situation where they can download a system without talking to anyone, but need to bridge from that to: yes, you can get this to work, but you need to adapt it and may need to talk to some humans. We need to make it clearer what to do if you parsed something and it doesn't do what you want.

Alexandre: Connect with Martha Palmer: PropBank and WikiData. More available and consumable.

Emily: For translation to logic and back, CLMS students might be good candidates for being a bridge.

Dan: Still some university centres who produce people with these skills. IBM crowd aren't necessarily looking to hire right now, but want reassurance they could in 5 years.

Francis: HPSG getting smaller?

Ann: Computational linguists often have no knowledge of what happened. Potentially, pool of people who want to do it, but we don't seem to have reached them.

Olga: For many, "theory" just means POS tags, or maybe UD tags. Space there to bridge things? Connect UD to ERG output: here's an alternative toolkit.

Emily: Like MRP shared task?

Dan: Stephan's student, and then Weiwei did very well on that.

Ann: Probably the biggest market: [synthetic data](https://delph-in.github.io/docs/summits/OlomoucSynthetic), e.g. ShapeWorld got traction with a lot of people, and now there's an even bigger market for it.

Carly Crowther: Concern that we're running out of data. PR of these tools as an alternative to that: we won't run out because we don't need it.

Emily: Non-dependence of data? What kind of data?

Ann: Grounded synthetic data at a massive scale, potentially. ShapeWorld is a good start. Grounded visually or in a logical model. From a logical model, can generate both pictures and sentences. Can be very focused on gaps in a machine learning system. If they're not dealing well with a particular kind of construction, or with a small language and need to bootstrap.

Luís: BabyLMs shared task, potential for ERG to guide learning by selecting data. And fine-grained evaluation.

Alex L: Current metrics for evaluating performance of an NLP model don’t always fit purpose of application. Sometimes doing proper evaluation is really expensive (e.g. summarise movie, or generate movie trailer).

Mike: For hallucinations, we could have basis for some sort of metric?

Guy: Like Huiyuan's thesis?

Ann: I can talk about this in the session tomorrow, but it turns out to be difficult. Works well for ShapeWorld, but in other scenarios gets seriously difficult. Should first test on limited domains, like ShapeWorld.

Dan: Way of doing a negative test.

Emily: i.e. "don't trust a machine that can't pass this test"

Ann: Yes, and wouldn't go the other way. Interesting topic, e.g. whether a machine can learn a quantifier. If you're going to use a system to evaluate economics, you're going to want it to know what "most" means.

Alex L: My student Rim used ERG and ShapeWorld to showcase novel model of interactive symbol grounding.

Chun Hei Lo: We process single sentences, and unresolved ambiguities undermine usability. LMs are more flexible at the cost of imprecision.

Olga: Writing a large grant that involves different universities in different parts of the world could give us an opportunity to work on Delph-in? Hard to direct funding towards Delph-in.

Ann: SIG on funding? I now have more experience from an evaluator's point of view.

Last update: 2024-07-06 by Guy Emerson [[edit](https://github.com/delph-in/docs/wiki/OlomoucCommunicating/_edit)]{% endraw %}