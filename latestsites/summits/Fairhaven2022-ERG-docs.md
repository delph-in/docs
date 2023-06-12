{% raw %}Eric: does the intro (see slides)

People would generally love to have more docs, in principle

Regarding the audience: the existing docs aren't great for non-linguists (learning curve too difficult)

Idea: take existing stuff and expand/adapt it to non-linguists

Idea: restructure linguistic background so that it is still there for linguists

The text of the "rewritten" part is not intended to be perfect, merely to give the idea

The current reliance on the few existing experts is too much (not sustainable)

For this purpose: less important how and why something was built; more important how to use it in practice

Users will have CS experience, maybe even people who could learn languages like Prolog or maybe "Logic 101" is a requirement

Case studies: some of it is already there but not sufficient to figure out how to do something with the ERG. Would be good to have examples of how something was built (a system using the ERG, not the ERG itself...)

At some point, people building systems will have to actually edit the grammar. This is more difficult to explain "in simple terms". 

The "system" of documentation should be sustainable, so, can't be complicated. Each new item may require technical/accessibility review

Goes through Issues slide

EMB: Goal is good (make accessible). If you can recommend Logic 101, should also recommend Linguistics 101. 

Eric: Should be able to use the ERG without being a linguist. And that's a big audience.

Guy: For something like ERGEssence, there is value in adapting that for broader users, but something like semantic inventory, it does not make sense. Maybe include pointers where to study up on the more difficult pages?

Eric: Maybe in the Intro sections, can still have some general overview. Sometimes you don't need to understand why something works, only need to understand what it does. 

Luis: Need some ground pages to point people in relevant directions.

Eric: E.g. what "event" is

EMB: Important not to lose the linguists audience either :) Better to have two parallel sets of docs. Do not delete them, do not subsume them into newer, diffrerent pages

Dan: There is a version issue. People don't always use the most recent version of the ERG. So agree, there need to be sets of docs per version. As we do that, we can also do the split into audience types. There is probably more than two audience types... 

EMB: For semanticits,  .....

Dan: There is some messiness as two mentioning of the versions [in the wiki?] right now

Eric: Even for the conceptual stuff

Dan: Yes

EMB: There are some "Getting started" page already. For the Matrix, and then there is the ERS tutorial. There is Grammar Engineering FAQ.

Mike: There is a User Welcome page which was not really finished. There is a Quick Start page. 

Mike: The Wiki is like developer notes. We tried to make it more polished but maybe we could use something that is more published, not the wiki, perhaps through the docs repo (currently published as the github.io site)

Eric: What about search?

Mike: Search is integrated with the .io site currently (as a plugin). 

Allison: Learning curve in DELPH-IN is indeed noticeable. Can we crowdsource from new members or students what they need the most? 

Eric: We could use the Forum for that, at least to check what gaps we might have in the existing draft. 

EMB: I point people to these things in the GE class, but it is harder to get the specific feedback

Mike: There are custom footers to solicit feedback

Guy: But students is a different audience

Mike: Can include a top into each page stating what you need to know to understand the content

EMB: That would be a good way to emphasize that linguistic knowledge is necessary for certain things

Guy: Again, for something like semantic inventory, can't imagine how to adapt that to non-semanticists

Eric: I still needed to understand some of that page for my work

Guy: I mean that it doesn't make sense to try and split ERGSemantic_Inventory into two pages

Dan: Seems like Eric and Guy disagree on this one

Eric: We can have a page that describes the idea

Dan: We can have a page about "here" and "there", Eric was able to extract some useful information from that page without being a semanticist. He needed to know something he could expect from the ERG, though he needed to be a pretty aggressive user to achieve that. I am still on the fence, because to me, both versions look good. I probably have lost sensitivity to some of the barriers that are in the current version.

EMB: I'm fine with having a "partially digested" overview and then everything as it was at the bottom.

EMB: For the case studies, those would be different case studies. Not different presentations, but actual different things that are being built.

EMB: Lascarides's students are working on pragmatics with the ERG; that's one case study for linguists

EMB: Asks students to contribute

Liz: Re tutorial vs reference: there is a website documentation.divio.com -- a great unified theory of documentation, they have the same concept. Tutorials only show you how to do something. In addition, there will be explanations for particular audiences, and there will be examples of very specific tasks.

Eric: Sounds like a useful taxonomy

Tara: Examples are very important. Often the examples are too "unique"; more general examples often missing (of phenomena)

Liz: Even the discussion of where what is on the wiki is confusing. Where to start? Seems disorganized.

Eric: I had the same problem. Need a clear pointer to the official "start" page for the docs.

Guy: Can have a filtered, more user-friendly front end of the wiki

Francis: We could have several wikis, now that we use github

EMB: What about the existing cross-links those things

All: Old discussions are fascinating

Francis: But perhaps no need to have all of that in the same place

Eric: There are a lot of other places where things are documented. Coming to a wrong place from Google can trap you in a local minimum.

EMB: Old places should point to the current places. Include in the top: newcomers, go here

Mike: Reminds of forwarding from delph-in.net to the newcomers welcome

John: One problem is the way github displays the wiki pages (starting with A...). Could we have a better index/table of contents

All: Probably not customizable (on GitHub's side...)

Guy: But we can customize our front end (our .io site)

Woodley: Good to encourage more people to come on board. But the scientific mission of DELPH-IN depends more on the other direction: attracting linguists is more important. Need to make sure we do not turn away scientists who will continue DELPH-IN work.

Luis: But don't interesting applications draw attention?

Woodley: Not from linguists. 

Luis: What about funding? Applications bring money. Nobody will fund grammar developers now. If that's the way for us to pay grammarians, we should do this.

EMB: Maybe there's three doors to go through: linguistc research, applications, delphin tools

Guy: Let's build a shiny page for potential funders

Luis: Education people are very important now

Francis: It's the incompletenes of documentation that turns people away, not so much the style. If we had complete docs for ANYTHING, it would be better than what we have now. Realistically we gain linguists either through Emily or Francis. Maybe also through HPSG conferences. But not through the wiki pages. 

EMB: Some docs is better than no docs!

All: Agree

EMB: Unserious docs will turn people away

Luis: The issue is also keeping students and sending them off to post-PHD work

Olga: Difficult to get tenure track positions with GE background

Eric: The message you get when you land on the start page needs to be clear and effective. After I decided I wanted to try DELPH-IN technology: (1) looked at the license; (2) is this still being maintained? How much? Summit notes were the most convincing thing here! It would be nice to get a clearer message regarding this.

Glenn: This message in part should be conveyed by the style of the website 

Olga: Disagree; style can be any style and still convey the message clearly

Woodley: Agrees

Olga: There is a Wikipedia page which needs to have updated info on the upcoming/latest summit

* * *

From the chat:

Weiwei Sun to Everyone (2:30 PM)

I am trying something similar to semantics-oriented treebanking for English as a second language. Annotators are given the bi-lexical semantic dependency graph associated to the best parsing result. the task is to select the graphs without any error. the the selected good parses are used to re-train statistical/neural models, which hopefully provide better analyses for "non-standard" English sentences. (I haven't been in the retraining stage.)

Weiwei Sun to Everyone (2:40 PM)

thanks

Weiwei Sun to Everyone (3:11 PM)

，们, i think, is attached to phrase rather than words.

箱 is used as a measure word.

Emily M. Bender to Everyone (4:28 PM)

https://github.com/delph-in/docs/wiki/ErsTutorial

https://github.com/delph-in/docs/wiki/GrammarEngineeringFAQ

Emily M. Bender to Everyone (4:48 PM)

https://github.com/delph-in/docs/wiki/MatrixGettingStarted

https://github.com/delph-in/docs/wiki/DelphinWelcome

https://github.com/delph-in/docs/wiki/UserWelcome

https://github.com/delph-in/docs/wiki/DeveloperWelcome

Emily M. Bender to Everyone (4:49 PM)

https://github.com/delph-in/docs/wiki/QuickStart

Allison Dods to Everyone (4:50 PM)

i have some thoughts on this as a relative newcomer to DELPH-IN but don't want to interrupt the current conversation! (can't hear the room super well)

Emily M. Bender to Everyone (4:51 PM)

https://delph-in.github.io/docs/

I see your comment, Allison and will try to grab the floor for you at an appropriate moment!

https://documentation.divio.com/


Last update: 2022-07-20 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/Fairhaven2022-ERG-docs/_edit)]{% endraw %}