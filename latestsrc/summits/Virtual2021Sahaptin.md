{% raw %}Implemented grammars for pursuing linguistic research questions (starting a project on Sahaptin)
Olga Zamaraeva, Sharon Hargus
DELPH-IN 2021
July 22

Olga: Sharon is familiar with DELPHIN work, having been a committee member on several DELPHIN member’s PhDs. During my dissertation, we started talking about applying HPSG to pursue linguistic questions that she may be interested in while documenting Sahaptin.

We are interested in the descriptive value that implemented HPSG grammars may provide. What could be some of the next steps for using grammars or developing our approach such that these questions can be meaningfully pursued such that the work can be published in non-HPSG venues. Is it possible, what needs to happen, what are some pitfalls? 

Sharon: I work with a native speaker, Virginia Beavert, and her resources to work on the language and create documents for Sahaptin, spoken in southern central Washington state. 

Olga: Recalling Emily’s Wambaya project, that may be the most similar project, but only the first portion. This means it has to be a long term collaboration and project in order to bring results. In that project, Emily put together a grammar of Wambaya in which she had some descriptive sources, but also collaborated with the linguist who wrote the grammar description. As she was putting the grammar together she was able to consult the linguist. 

Olga: Scott Drellishak’s dissertation contains a chapter on another variety of Sahaptin, but it’s concerned mainly with the Matrix, and we would like to go beyond. How do we go beyond that?

Olga: The lexicon and the morphophonology are also going to take significant effort, either to import the lexicon or spend several hours adding it manually. But again the goal is to generalize beyond HPSG.

Olga: Data includes, a dictionary, text corpus, Virginia as a native speaker (others on slide)

Olga: SD had a minimal lexicon, which is typical for matrix grammars. He constructed the test suite such that several ungrammatical sentences parsed, and when Virginia was consulted, she confirmed that they were actually grammatical.

Sharon: I wouldn’t have thought to ask her, without the grammar prompting, though the phenomenon is unsurprising. 

Emily (in chat): Think about David’s Nuuchahnulth and Joshua’s Lushootseed.

Olga: Can we learn from this sort of work, if yes, what other things come to mind? We want to recognize that some work already exists on Sahaptin. How do we weigh these risks of wasting Sharon or Virginia’s time and the advantages of adopting a new technology?

Olga/Sharon: Our initial ideas are word order, since word order in Sahaptin is free, and it would be nice to quantify it in some way. In short sentences there are some trends, but I haven’t done a systematic search. One of these involves a direct/inverse construction which has to do with topicality. wh words > neg particle > adverbs compete for sentence initial position. We have a corpus of 25 hours of text that is glossed at the level of words, maybe could apply parsing to work on it better. About 7500 examples, including both sentences and words. Olga’s dissertation was about wh-questions so that was a natural starting point.

Sharon: Scott investigated the direct/inverse construction in his dissertation. It co-occurs with a nominal affix to form the phenomenon. It involves topic continuity, where the patient becomes more topical than the subject. One thing that might be interesting to see, since the sentences don’t always contain a full noun subject and object, maybe the positioning is relevant. Where do the subj and obj tend to occur with respect to each other in these inverse constructions?

Olga: Wisdom/advice, please :)

Emily: From what Sharon was talking about, it sounded like there was going to be a lot of gain from a morpho analyzer. There’s 2 ways to go on that, you probably want to do a FST. It might be possible to get away with subrules in the LKB. There’s significant value there, like Lonny’s work building an FST for Yupik and is currently making it available for community members. There are platforms that can be made available to community members with an FST plugged in. 

Emily: For the purposes of what Sharon was talking, having more annotations is going to help. If you could do it with morpho analysis and X to spit out glosses, or have it map to underlying phonemes.

Emily: It should be pretty quick, building on existing work. It could be turned into IGT. Links to papers: [Baldwin et al 2005](https://www.degruyter.com/document/doi/10.1515/9783110197549.49/html), [Bender et al 2012](https://scholarspace.manoa.hawaii.edu/handle/10125/4535)

Lonny: I come at it from the perspective of a community member, and I saw the value in creating an FST and implementing it into a website and it would be directly beneficial to the language community. I also see the benefit of having a FST and an HPSG grammar in that Yupik also has free word order so finding the statistics of the word/affix order would be beneficial. In the literature they don’t really make that distinction so I couldn’t make those hard rules in the FST. What I’m missing is a database in order to answer those questions for Yupik. Having those resources will definitely help with this work. Website

Luis: I think educational purposes for the grammar has been shown to be a potential use early on. Zhong was built as a broad coverage parser, but if you’re going for precision, it’s probably easier to build language games and other apps. There is also a lexicon/dictionary that is beneficial. Having a bot as a moderator for large group chat to ask questions about words to support learners. I think having an FST or even a toy grammar that can analyze very simple sentences can help teach people but also can help gather data with consent when interacting with the bot. I think this can be very helpful to the community.

Olga: Luis, do you have an implemented grammar for Kristang?

Luis: Not yet. Getting close.

Dan: For the ERG, I’m a native speaker. For Wambaya, Emily had an advantage in building the grammar because there was never going to be more data. I think the task you’re proposing is interesting in a different way because you have at least one resource to help answer questions of grammaticality, and if you go for precision you want to avoid overly ambiguous rules. But you will often come up against points where you have to make decisions about constraints given the data you have immediately in front of you.

Emily: For Wambaya, there were a few places when I went to the linguist and I had questions but there were no answers. What I used to guide myself in terms of coverage and rules, was keeping ambiguity in check.

Glen: Wambaya didn’t have community members right?

Emily: There are community members to whom the language belongs, but it’s important to describe the language as in a state that is respectful to the 

Luis: Would you be comfortable with your resource being used as the descriptive resource for rebuilding?

Emily: The easier way to answer that question is is there a way for the grammar to be useful. If someone want to make a grammar checker with it, I’d say this is relatively far away from speaking to an elder, and I’d not recommend it. Maraim Butt gave a presentation talking about when to use lingusitic knowledge and when to use ML, and FSTs were an example of when to use linguistic knowledge to get a reliable product. Not that they’re not useful, just not in that way.

Dan: Could they be useful for crosslinguistic comparison? They represent hypotheses for particular phenomenon and wonder if you could investigate related languages.

Emily: On the HPSG over descriptive side of things, we find reuse of hypotheses over vastly different languages. Eg 2nd position clitic approach for Wambaya has been useful in other places. In terms of could this help answer questions about contact between languages, maybe? You would need a comparable grammar. 

Olga: David would probably be interested in collaborating too. 

Emily: If you dig into these questions of word order and information structure and wh questions, that will tie into the questions you were asking about Russian. 

Dan: One of the virtues of a grammar is it’s reversible. You could have the grammar generate as a sanity check. That could be a quick way to get grammaticality judgments. 

Olga: Generation is a unique and powerful tool that we have and we should take advantage of it more. Glen, when working on Thai, what did you rely on for judgments?

Glen: I lived and traveled there, but finding judgments was easier since I have more access to native speakers. The grammar was progressed just a few working months beyond a 567 grammar. 600 sentences? Since I have developed much larger corpora. I got to very complete coverage on the 567 grammar about 200 sentences. On the larger corpus, I have about 3% coverage.

Emily: We keep saying there’s the S curve of coverage development. Slow at the start, then lots of progress, then plateau as things get to long tail phenomena. But at the end you have something that has interesting coverage. Coverage over dictionary and coverage over corpus would be a good target. You could probably build a good morpho analyzer in 4-6 months, then could probably get the steep part of the curve for a grammar in a similar amount of time.

Olga: The goal is to think really hard about what the target is. Always a bit of a gamble.

Emily: Time spent grammar engineering is a win in and of itself :) Also have a great community to synergize with.

Sharon: Sounds like the priorities are working on the choices file and working on the analyzer and looking for funding.

Olga/Luis: Funding means commitment and responsibilities.

Last update: 2021-07-22 by mcmillanmajora [[edit](https://github.com/delph-in/docs/wiki/Virtual2021Sahaptin/_edit)]{% endraw %}