{% raw %}July 21 2021

Data statements for DELPH-IN treebanks

Emilly and Angie present; Olga scribes

Emiily: Brief overview re data statements (DS), where we got with Redwoods; or discuss other treebanks. Angie has done the lion share of the work.

DS is a proposal we’ve been working since 2017 with Batya Friedman. In ML, important to know what language, whose, what variety, etc. That was the main motivation. Meg Mitchell: model cards; XX: data sheets. Similar ideas. That’s about what’s IN the DS. As opposed to how to develop or something else.

Collected info on the process at LREC, and have been analyzing the responses. Revised a schema and produced a how-to guide (link, which cannot be shared for now because it is work in progress; later will publish the official version on a website).

Some things we have been analyzing: which distinctions are and are not worth making, etc. 

Angie: There is also some streamlining of how this should be presented to people. 

Emily: So should we work on Redwoods or discuss other datasets more generally? Silence means Redwoods :)

Dan: In the DS, I see there is discussion about language varieties. If we end up with a treebank for Singlish, how to categorize it specifically (in this system)? Where do I go to figure that out?

Emily: The recommendation is two-fold: Use the BCP47 standard (language code + locale); also, provide a prose description. There are no standards for a range of things including L2 varieties. For Singlish, see if there is a iso-639-3, then look at BCP47.

Luis: Yes, there is more than one variety in Singapore as well. Singlish is more like a creole, but there is also Enlish which is influenced by asian englishes and british english.

Emily: Let’s look at Redwoods.

Emily: Glossary. We want to define terms to make this process/practice accessible to different types of people. What are important shared definitions for Redwoods?

Alex: Format of the data. “Profile”, “skeleton”, “mrs”...

Emily: Skeleton may be beside the point.

Luis: Sure. But is the data delivered in form of [incr tdsb()] profiles?

Dan: In earlier versions of Redwoods (RW), there is not just a single format. I wonder about generic terms like “annotation”?

Emily: We should define the terms as we use them in the document. So annotation as used here.

Dan: Manual annotation perhaps?

Emily: One of the things we frequently struggle with is how much of info belongs to the DS vs elsewhere. There is also metadata etc. Publications, manuals. DS can just point to that. Maybe formats could be described in manuals as well to which DS can point.

Tuan Anh (via chat): Is there a section for assumptions made for data collection (theory choice, language model…)

Emily: Yes (points to the relevant section), but not sure theory belong here.

Tuan Anh: We make some assumptions for the Singlish corpus, e.g. elicitation strategies. Steps which happen before data collection.

Emily: These questions (elicitation etc) should probably go in “curation rational” or also “speech situation”.

One interesting thing was, for speech situation, for some data there isn’t one. E.g. the CSLI test suite. No communicative purpose.

Olga: Maybe there is a communicative purpose of sorts happening implicitly in a person’s mind. Links wikipedia page to Bakhtin’s “dialogue” in the chat (philosophy).

Glenn: you have predefined sections, but within each one, you don’t want to go over all the different parts of the resource each time.

Emily: As a DS author, I have to do that no matter which loop is the outer loop. But afterwards the DS can probably be made more compact. Dan, do people usually want the whole thing or just one section?

Dan: I don’t have a good sense here. But the notion that we can carve it up into tiny bits I think is not realistic. Brown is in some ways like Redwoods (OZ: missed the connection here). I doubt it’s useful to try to carve data up into tiny pieces; seems like infinite recursion. Usually people want diverse data. So important to track what’s in common, and then track which components vary. There is probably no pretty solution. Different uses of English, they are going to differ.

Angie: We have about 30 DS so far.

Luis: What happens if you use corpora which are still in development? E.g. the NTU corpus, changes every semester. I see Redwoods as a collection; and maybe some data are created from scratch, some are collections...

Emily: We thought a lot about this. Useful to distinct between “found” and “elicitied”. Redwoods has some of each.

Dan: you can also say Verbmobil was elicited. People were pretending to have conversations.

Emily: When comparing schemas, we developed a strong concept of versioning.

Glenn: Maybe in some cases you specifically should not update the DS when the dataset gets updated, if the DS still stands.

Emily: Exactly.

Emily: Luis, it would be lovely if the NTU corpus had a DS.

Luis: I was thinking specifically about annotation. 

Emily: Talks about DS pointing to other stable sources.

Glenn: Some sources are not maintained anymore. E.g. the Cathedral and Bazaar. Maybe all future revisions of DS can point to that one document.

Emily: Says that somehow, that would mean the project will never be finished and it is easier to port a link from version to version (OZ: I missed something here).

Dan: We worry about what we do to the text; not about the text per se.

(Glenn lost connection)

Emily: One question is: Should there be a canonical ordering of Redwoods datasets. What are logical ways to group the component datasets?

Dan: Impose a structure. They do group, but in different ways. We tend to group linguistically motivated sets. Then there is the WSJ; then there is the C&B. And the Wikipedia has separate structure. User-generated.

Emily: So, I should group them?

Dan: No maybe I should.

Emily: The spreadsheet that I am maintaining may not be useful in terms of this grouping.

Dan: I think you are right.

Emily: The Tanaka corpus is ?

Francis: pairs of jpn-en sentences created by students in a university course. Should be translations of each other but no guarantee for directionality; also heavily edited. Have now been repurposed, made more canonical and simple.

Emily: And that’s the version that’s in RW?

Francis: Yes

Luis: but pre-XXXXX? (OZ: Tatoia-ba?)

Francis: Yes.

Emily: Is there a paper about this which I can point to as a source?

Francis: Yes (promises to send the reference)

Emily: Is this discussion useful for other projects?

Tuan Anh: Yes

Emily: Another thing: we want to take it online; ended up putting people in pairs to elicit the info. Sit down with someone not from the project, show them the schema, have them go over it and ask you questions.

Luis: Maybe another direction. Will this include how to get the type of data they want to get? (OZ: didn’t quite understand) Would a how-to guide about processing(?) be included?

Emily: that is the kind of documentation we expect already exists.

Dan: The RW top page. There is the article (Emily, Stephan and Dan’s; Flickinger et al 2017, Sustainable development...).

Francis: Bond, Kuribayashi and Hashimoto (2008)
Tanaka (2001) (Compilation of multilingual…)

Dan: There was a section about which RQs were supposed to be answerable. E.g. distinguishing grammatical/ungrammatical sentences.

Emily: That’s in Curation Rational.

Emily: Batya always reminds us that DS authors aren’t responsible for being perfectly complete (imagining all possibilities etc.). No expectation to just read a DS and get all the technical aspects. More about whose language is being represented, what decisions were made which impact the resource. It’s natural to want documentation on technical issues but that’s a different problem.

Glenn: As EMB writes, a grammar is a personality (ERG is Dan :) ).

Emily: Speaker demographics. Hard to collect (if it’s not about Arthur Conan Doyle). In annotated demographics, there is tension with privacy. And then there are small groups sampled from small groups. So might use ranges instead of exact numbers.

Emily: It’s OK to not have all the info that the schema asks for but should state that (unknown, or can’t share)

Luis: Maybe state if it’s a first-order element in the data.

Emily: Absolutely.

Emily: Another two elements. Capture quality (noise in the room etc.) and Limitations (challenges that could not be fully address). Only sentences that the grammar can parse correctly end up in the treebank. So, some sentences are missing. Do they have something in common? If we know that the grammar systematically suppresses something, that can be described.

Luis: But aren’t those sentences in the corpus? Only the analysis is missing?

Emily: Really?

Glenn: Really?

Dan: There are versions which do not show you those. You would need to go back to the input file and map by item number.

Luis: Is the item file not provided with the treebank?

Dan: It’s a vexed question. Maxent has no record of what was not parsed at all. There is an export formats which have it but many don’t.

Luis: So, a matter of a definition of “treebank”

Dan: Maybe it’s a religious question. Maybe a treebank is a collection of trees. No tree, no sentence.

Emily: Well there is a fact of the matter re the artifact we are describing. So description should just be faithful to it. So, if some sentences are missing, should talk about that.

Tuan Anh (in the chat): In our document, we mentioned the devices used to record the sessions (hand-held recorder, laptop+lav mic, etc.), the output format, raw output bit rate, and environment info (in the lab, at home, via Zoom, etc.). we also include comments from transcribers for things like noisy background or unstable video call connections.

Dan: Emily was asking about interference in creation of the resource. Verbmobil: the transcription was not perfect, introducing errors which weren’t present in the original recorded speech. Especially with “there’s five people coming to the party” versus “there is five people coming to the party”, which is what the transcribers introduced, because they didn’t want any contracted forms. So that’s an example of a systematic error. Loss in translation.

Emily: Can go either in capture quality or limitation.

Luis: Another suggestion for capture quality: in Olomouc, we have been working with reference. When people are pointing… or in NTU corpus, we throw away images. References to tables.

Emily: If you are interested, email Angie and me. Datastatements at uw.edu


Last update: 2021-07-22 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/Virtual2021DataStatements/_edit)]{% endraw %}