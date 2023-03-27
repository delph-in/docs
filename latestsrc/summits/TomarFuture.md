{% raw %}# Discussion: The Future of DELPH-IN

Moderator: StephanOepen; Scribe:
EmilyBender

# Subjective Impressions

- a generation of ‘unification’ pioneers is leaving the scene;
- no (direct) contribution to current language technologies;
- shrinking interest in (and knowledge of) linguistics in NLP circles;
- declining momentum in DELPH-IN (and HPSG, [ParGram](/ParGram), LFG).

# Questions

- recruitment and training of new grammarians;
- long-term maintenance of complex existing grammars;
- relating to more theoretical work or ‘divergent’ interpretations of
(LFG and) HPSG;
- standardizing (semantic) interface representations to parsing and
generation, to support downstream tasks like entailment or
reasoning;
- connecting to third-party (semantic) resources like
[BabelNet](/BabelNet), [VerbNet](/VerbNet), or [WordNet](/WordNet);
or
- demonstrating the utility of deeper linguistic analysis in practical
applications.
- what's the point?

# Discussion Notes

TomarFuture notes

oe intro: You might interpret this as sabbatical depression. Might get
better once I'm allowed to go back and teach. But this past year, I'm
increasingly worried about our community, what was once the Unification
Underground I think is the Unification Underground again. My current
sense is that there's a generation of pioneers retiring. Whats going to
happen in our immediate future? We don't currently make direct
contributions to current, highly visible applications. Not much interest
in or knowledge of linguistics in evidence at ACL 2014. Looking closer
to home, there's arguably declining momentum within DELPH-IN and within
similar networks ([ParGram](/ParGram), HPSG, LFG)… You might disagree
with my findings, and I'd welcome that.

António: That is known as sabbatical year syndrome.

oe: I'm here for treatment.

oe intro cont: Recent message to participants about trying to start a
discussion with [ParGram](/ParGram) cousins, who are suffering from
retirement syndrome. What are we doing about interesting new students?
Not teaching grammar engineering regularly outside of UW. It's been ages
since we've taught grammar engineering at ESSLLI…

Emily/Francis: And Singapore!

Berthold: Trying to get grammar engineering going at Paris again.

oe intro cont: What are we doing about the long-term maintenance of the
large grammars? Many of the [ParGram](/ParGram) grammars are not
maintained. Dan is surely making plans for retirement (Dan: in 20
years...), Jacy is a spare-time project; rarely have we seen clear
succession of grammar maintainers (exception: GG). Also aren't
interacting enough with theoretical HPSG folks, other HPSG grammar
engineers (St. Müller and colleagues). More on downstream applications,
standardization, connecting to fashionable resources. Will that increase
visibility? Not doing so bad on demonstrating usefulness. But where are
we headed?

Francis: One community that wasn't mentioned that is relevant is the CxG
community, which is larger (partly because it's so broad). At NTU
Linguistics more people interested in CxG than in HPSG.

Emily: Would that be a source of possible future grammar engineers?

Bec: This whole presentation seems to be aimed at the good old days. How
far back are you thinking? 10 years?

oe: It was surely great 9 years ago. Back then (and starting in the late
1990s, actually) what we did was put effort into documenting, packaging,
reaching out to others, helping them get started, seek funding… Held
tutorials with new grammarians to help them keep going.

Emily: The best place to start is with our students. I'd like to point
to Sanghoun and Antske who have moved on and are still here.

Antske: For now…

Ann: I don't recognize this picture. I think things are much better than
they were 10 years ago. I had never expected to convince Bill Byrne that
there's some point of doing semantics in MT. Now co-supervising a
project on MT with Ann. First time anyone in core MT community showed
any interest in what we're using. If this does work out, we'll suddenly
have the very large SMT community getting very excited about this idea.
Any time that there's a big community and we show an effect on their
application… All I think is we should be focusing on things which are
genuine end applications, rather than parsing the PTB. I was actually
going to ask you a question: I feel pessimistic about computational
linguistics a community. Compare to that, we're doing quite well.

oe: For my definition of computational linguistics, I worry too. I used
to think we were a core part of the computational linguistics community
that seeks to advance our understanding of language through
computational mechanisms and possibly advance applications.

Liling: Is the LOGON system in any of this future?

oe: As an MT system? Oslo not currently working on MT; Francis was the
other active user.

Francis: We haven't in the recent past, but we will in the recent
future.

David M.: 4th and 6th bullet points are exactly what we've been trying
to do in our project for some time: standardize interface
representations and demonstrate utility. I am evangelizing this stuff,
such as it's worth, with folks in ARL and elsewhere. Coming at it from
not the theoretical linguistics side of things, but more as a user. The
semantics that comes out it very close to the linguistics, and I've got
to go a long way to get to the domain representations.

oe: Great that you're doing that, and great that you're here. For
English, I'd agree with Ann that we have a good product. But what about
other languages?

Woodley: Before we leave English, a lot of progress in the last 10
years.

António: Progress from zero to really something for Portuguese.

oe: For Portuguese, Spanish, there are initiatives going strong, still.
I think 10 years ago or 9 years ago, I was hoping there'd be more
languages approaching that kind of robustness by now that allows
practical applications.

Berthold: Although I'm not on sabbatical, I see the concern. Gert
Webelhuth is very concerned about the future of HPSG as a framework ---
the submission to the conference has dropped once more. The big
advantage of processing with HPSG is that you have a linguistic theory
and you can do processing. Stefan Müller and Emily are the two people
who have students who know what HPSG is who could become grammar
developers at some point. To keep this community live, encompassing
theoretical and computational stuff is very important. Same is happening
with LFG---talk of merging the international conferences.

Antske: I somewhat share the concern of: it's a really hard path to take
if you want to stay in academics. How can you get money to build a
grammar? Where can one do a postdoc outside of existing DELPH-IN sites
if one wants to go that way? I'll use spare time to work on my grammar,
but that won't scale to a full grammar. For our generation, it's really
hard to get a permanent position in academia.

oe: For us it's hard to get funding for this kind of work. You've been
successful António.

António: The trick is to have some point of interest beyond HPSG on the
basis of which to sell the proposal on the basis of which you can
continue your work on deep processing. If you accept that you work in
this area, but you cannot work always in this area, and have a larger
portfolio (with [WordNet](/WordNet), etc) you can keep the ball rolling
in favor of deep processing.

David M.: It seems plausible that having more end applications will
raise the profile. When I look at the MRS, I've forgotten that it's
HPSG. I'm just wondering whether I'm missing something: what is the
relationship from the end-user or mid-user's point of view, and the
HPSG? What is it about HPSG that actually gives you the resulting MRS.
If you can make that connection, the end users might ask for it.

Ann: MRS follows from having the grammars, which happen to be HPSG.
Could be done with (many) other syntactic frameworks, but we wouldn't
have the infrastructure. Supposing we were successful in one of these
high-powered applications for English (e.g. sentiment analysis) and
someone said ok I want to do this for Korean. You write a grant proposal
saying we're going to spend the first three years writing the grammar
for Korean and then we're going to start using it. No one has grants
that long. That's a real problem in terms of the assumption that if we
can show it works for English, then it'll be useful for other languages.
I don't know what we can do about that.

Woodley: How did this fluke of history happen, that the ERG got to where
it is?

Dan: German and Norwegian tax payers.

Woodley: Well sure, grants, but we just heard you can't do that. Why was
it possible in that climate?

Dan: The issue there is one that Antske was raising. If one wants to
play by the regular rules of the academic business that we're in, then
you can't write grammars. The system is not constructed (then and now)
to reward that activity. There are a few people around this table (and
some who have been: Lars, Francisco, Montse today virtually) who find
that task interesting to the point that it's self-sustaining. My
reaction to Ann's query is that we should spend some time thinking about
the kinds of applications that can be sustained by grammars at different
stages of development. I think we probably know enough now to have some
counsel, best practice advice about those. We should maybe try to make
that more explicit.

Woodley: And I'm sure there was some sequence of applications for the
ERG.

oe: My observation as a bystander to the ERG, it is also a product of
Dan being a member of the Unification Underground with the ability to
meet weekly with Ivan Sag, Tom Wasow, Ann, Rob Malouf, Emily. This
configuration of people around Dan working together with him for more
than a decade. Harder to pull off nowadays; part of my concern.

Antske: With CLIMB I was able to create relatively small grammar that
could be used in a CALL application for foreigners --- Grammar Matrix +
CLIMB easy to do this as an approachable first task.

Ann: Limited domain system early ([VerbMobil](/VerbMobil)) helped the
ERG get started. For many years there was not much work that way; more
interest now. Could think about it as going the other way: have a
project that starts with a very robust system and builds up a grammar in
parallel to hand-off part way through. Would have to explain to people
how you might do it.

Glenn: If the development of the ERG was a historical fluke, my focus is
to capitalize on it going forward to enable development of other
grammars by looking at what is in the ERG (e.g. Typediff) --- accelerate
the development of other grammars.

Guy: If the ERG were developed out of interest, not some particular
funded project, could we have more undergrad courses that would teach
HPSG to get more undergrads who might then try to do something that's
not within a funded project.

Luis: Or MOOCs. We have to make it easier for people to use … but also
to learn. I think the ERG is beautiful, and I know that Dan has spent 40
years developing it, and wiki is okay, but there are more attractive
ways to get people in.

David: Crowd sourcing and Coursera.

oe: Crowd sourcing the grammar development? … that's a brave idea.

António: Topics of cistera (?) conference that is an incubator for
projects. Human Language Understanding is now a topic again there. No
one better placed than us.

oe: Thank you for that optimistic note, and thank you all for the
treatment.

Last update: 2014-07-15 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/TomarFuture/_edit)]{% endraw %}