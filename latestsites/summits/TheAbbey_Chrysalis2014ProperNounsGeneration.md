{% raw %}oe: \[erases objection to analysis of Grumpy as grumpy(e,x) thing(x)\]

Dan: *The Grumpy I met yesterday*: need Nbar -&gt; A rule, which then
interacts with the proper NP-&gt;Nbar rule.

oe: Want to look at interactions with other phenomena that might force
different interpretations.

Woodley: *He is Grumpy* will have two structures.

Dan: But in the new proposal *He is President* will have just one
structure (as opposed to two now).

Dan: Adding the entity\_rel when converting the adjective to a noun?

Emily: Seems like the time to do it.

Francis: Ann's proposal \[over email\] was a direct reply to my attempt
to take us down the path that since we're abandoning the common/proper
distinction for nouns could be adapted for idioms.

Francis: The concept of proper name is that we want to give New York the
referent of the whole of New York at some point. We want to also keep
the internal structure.

Emily: I thought we were assimilating proper names to idioms and now
you're saying we have to assimilate idioms to proper names. Why the
second step?

Francis: We're expanding the domain of idioms to include named entities.

\[Textual interpretation … maybe should wait for Ann.\]

\[Switching to generation issues.\]

Dan: What is the expected input we might imagine for someone who wants
to generate *Modern Gardening*. Probably come in with a named entity.

Woodley: Where are they coming from?

Dan: Outside…

Woodley: If it's MT, might come in with the Japanese translation of a
title.

Dan: I was assuming it might be a named entity that's Modern\_Gardening.
If we have that long list with the surface/canonical string (in the
gazetteer) can look up the semantics we want to put into the input MRS.

oe: Making the assumption that the gazetteer is a list of surface string
to MRS fragment pairs (some with big long \_n\_rel press), though there
may be some noise (parse selection)

Francis: Two possible inputs, one from another gazetteer in another
language, so we might have a direct mapping, but we might also have
something external that just gives us Modern\_Gardening +NE.

Woodley: If the generator input has told you what string it wants, then
it seems a step in the wrong direction to take that back to the semantic
structure.

oe: What about those cases where the things are coordinated.

Woodley: If the input includes coordinations, then they didn't give us
the string they parse.

Woodley: I'd like the generator and the parser to handle things that
aren't in the gazetteer, and for the generator, that can be done, even
if it's harder for the parser. *If on a Winter's Night a Traveller…*
especially if that's not all capitalized, can't necessarily handle it.
But if the generator already has the information that that string is
wanted, why balk?

oe: Want to preserve the ability to generate unknown names where we put
the CARG into the output. I think we always want that option.

Francis: because it might be not in the gazetteer.

Woodley: If there are cases where going to MRS representation allows us
to generate more outputs, I'm in favor of that. Examples?

Francis: Secretary of State and Secretary of War/Secretaries of State
and War.

Dan/oe/Woodley: With a suitable paraphrase rule.

Dan: Also trying to think of a case where we have something sg in the
input and we need plural.

Woodley: Or in languages with case marking, can certainly imagine that.

Dan: Want to avoid saying *The Andes is tall.* Need at least the plural
marking info from the gazetteer. Not really sure that plural marking is
a property of the named entity in the semantics. (Though this might be a
systematic fact of mountain range.) Want to know if it's true in the
same language over.

Emily: Why care about another language, if that's a feature of English?

Dan: MT. How do I put it in?

Emily: The gazetteer. It'll have that info in the MRSs, if it's in the
grammar.

Dan: Expect Ann to wrinkle her nose at the claim that *The Andes* is
plural.

Woodley: How to do that in parsing (block *The Andes is small*).

Dan: In the lexicon I can record both syntactic and semantic information
in the lexicon. We're talking about having an idiom storehouse of these
entities, and so I won't have them in the lexicon.

Woodley: I don't see how you can get away with not having Andes or
something like it in the lexicon.

Dan: Or at least have the info that this is a mountain range, in case
they're not in the lexicon.

Woodley: That is at least a fact about English, which has to be encoded
somewhere.

Dan: Even the requirement for the is an idiosyncrasy about syntax.

Woodley: CARG \_the\_Alps in generator input, how do we make sure that
you pull in the constraints form the grammar?

Dan: Want to avoid *the French the Alps*, while allowing *the lowland
Rockies*, *the foothill Rockies*

Emily: The gazetteer.

Dan: The gazetteer will say that this is just Alps, and the lexical
entry from the grammar will have the constraints needed (as an instance
of a mountain range).

Francis: cf my dissertation

Dan: So needed a sharper example.

Emily: Woodley's point about case marking is very apropos, you can't
just take the string from the generator input and use it directly if it
needs to inflect based on grammatical function.

\[Die die the the\]

Woodley: But surely Secretary of State changes with different case
marking in German?

oe: Yes, but it's one long morphological compound.

Dan: And *The current Secretary and former Treasury of State?*

oe: \[works out how to say that in German\]

Woodley: In English, that sounds like one person to me.

Dan: Can always make it one person, but *… had an affair*?

Woodley: With who?

Dan: *… had an affair with each other.*

Dan: And now let's get back on topic. When we get an input which is
string based, it shouldn't take long to remember that strings don't
always correspond to underlying representations, so we should remember
to do processing of that English string to figure out what the idiom is
that corresponds to that string. So we do parsing before generate?

Emily: No, we just look it up in the preparsed gazetteer?

Dan: But they might give us a different case form or something else
weird.

oe: I think Dan's assuming that's the string in what's currently the
CARG.

oe/Woodley: We don't want to allow them to give long coordinated
strings.

Dan: What about plural/singular?

Woodley: One canonical input for each entity.

Dan: *The Clintons arrived.* ??

oe: Clinton\_n(x) NUM pl.

Dan: That's not in our lexicon. Can't have both sg and pl versions for
each.

Emily: Leave it underspecified.

Dan: But we just said that Alps has to be plural.

Emily: But Alps are special.

Dan: How do I create the four million entry lexicon? How do I know that
Alps has to be plural, but Clinton can be either?

Emily: The linguist says that Alps are special, the other ones
(ordinary) start of as ordinary.

Francis: Will have to be some work by hand in the early stages.

oe: There are names that have surprising properties, and these have to
be known in the grammar.

Emily: But the claim is that these are the minority of cases.

Francis: \_Alps\_n\_rel/\_Clinton\_n\_rel

Woodley: But Dan says he doesn't have a theory about whether Alps is
semantically plural.

Emily: But we know that it's syntactically plural, since this is an
idiosyncrasy that has been discovered and can be written down in the
grammar so it does the right thing.

Dan: Might be able to handle this via a generic entry for "name of
mountain range", don't need to record that info in the idiom lexicon.

Emily: … because that's a syntactic fact.

Woodley: Doesn't need to interact with the gazetteer/idiom dictionary.

Dan: New example: star configurations like *Cassiopeia*, *the Pleadies*.
Where is it recorded that one is plural and one is singular.

Woodley: Like the Alps.

Dan: Not the same, because with the Alps it's predictable, based on
what's in the world. But probably not true for astronomical features.

Emily: It's going to come down to someone writing it down, either
gazetteer side or grammar side.

Francis: Not yet clear to me which side it will be, and I'm interested
in talking about this more.

Woodley: Is this a special problem for named entities?

Francis: If we can put this kind of info into the grammar rather than
the gazetteer, it gives us a wider range of gazetteer it gives us a
wider range of gazetteers we can use.

Woodley: It's not information that's likely to be already available
annotated out there somewhere, and will have to be manually done at a
lexical level.

Francis: Or in lexicons we can't get access to. It's in Alt-JE for
240,000 named entities.

Dan: The piece that's still a little blurry to me because I was thinking
of doing some curation of that lexicon and you all sneered at me because
it would take a lifetime. So what's the back off? Emily suggests punt,
live with error.

Francis: I was thinking of the curation of the internal structure, and
it seemed to me there was rather a lot of that. But the number
distinction, I'm expecting a small minority of named entities to have
number distinctions, so that seems more manageable and doable.

Woodley: It's also this case something you could do with a relatively
straightforward test over unannotated corpora.

Emily: Isn't this really a precision problem. Can we say give us number
if you don't want *The Timberlakes make an appearance* for the input for
*Timberlake makes an appearance*?

Dan: I was looking for cases that must be plural (syntactically), so
*The Alp* never comes out.

Emily: The claim is that these are few and far between and can be noted
as they come up.

Francis: Wikipedia has this info for several of these.

\[Emily leaves room momentarily\]

Francis: What is the desired output?

Dan: If we think there is an instance of an entity of the same logical
real-world type out there, then yes I think we should be consistent
about what the number is, or we should have no opinion.

Emily: Why not just over generate?

Francis: Alps

Dan: What if someone tells me that they think the Alps is singular.

Emily: Constrain it in the grammar as a syntactic feature only. That's a
fact about English.

Woodley: That will fail the generation subsumption test … but that's a
separate issue.

Dan: *Kim ran* is going to be marked singular, not unmarked. But *Andes*
has an entry in the lexicon so it gets special handling where I know not
to strip off the s and not to put another one on.

oe: Don't need to decide today about the semantic number of mountain
ranges.

Dan/Francis: But in the gazetteer it will be unmarked for number.

Dan: Okay, that's clear; doesn't lead to any new burden to the lexicon
that we had before we added the gazetteer.

Francis: But now you may want to look at a larger number of these.

Dan: Will want to be careful to strip number off of every entity that we
put in --- as we are producing the MRSs for the MRS side of the
gazetteer. Prune them to make them suitable for generation.

Emily: So if someone gives us Alps-singular, then can't the gazetteer
head that off?

Dan: I expect that the gazetteer will protect me from over specification
in the input.

Emily: But you don't want that for "the Clintons" plural.

Dan: …

Emily: Two aspects to this: Grammar says syntactically plural, or
grammar says underspecified. Input gives a specific number, or input is
underspecified. Which is the problem?

Dan: If the grammar says that the thing is semantically singular, and
the input says plural, then we don't generate.

Woodley: Then it's not a valid generator input.

Francis: So we're not as precise as we could be…

oe: There is a ground truth about what the number for these is
semantically, but we don't know it now.

Francis: Can document that we want to things to be underspecified, or we
can strip info from the input.

Emily: Don't want to strip because of *the Clintons*.

Emily/oe: If they can't be bothered to tell you the number then giving
them both is valid.

Dan: So you want to treat proper names and common nouns as the same?

Emily: Yes, realization ranking.

Dan: But that's lots more work --- extra analyses for each proper noun.

Francis: Who is this source of input.

Dan: David B-P is going to give a set of constants.

Woodley: There's some mechanism that takes his LFs and turns them into
MRS that already does some accommodations. Can put in the singular then.

Dan: Okay, I have a babysitter in that case, but not for
Chinese-&gt;English translation. Chinese doesn't mark number.

Woodley: So have the transfer put in plural if there's a mark (men,
equiv of tachi --FCB), and stamp in singular otherwise.

oe: Francis and I put a rule in for that for proper names in Jaen (with
a comment that it break on *the Andes*.

Francis: Want to try this as an empirical problem in Jaen and see what
it looks like both ways. Also: I care about computer expense, not Dan
space.

Dan: I wouldn't care either if we didn't have sentences with lots of
proper names.

Francis: Don't we pack in generation too?

Emily: Is it really a problem in parsing?

Dan: Okay, let's talk about purity, not efficiency.

Dan: So what does our idiom lexicon have a number? Nothing at all?

Emily: We're taking the position that the idiom lexicon knows nothing
about number, but the grammar's lexicon can constrain syntactic number.

Francis: *The Japan and Northern Japan Alps.* *I have climbed five of
the Alps. I have climbed five Alps.*

Dan: *The French and Swiss Alps.*

oe: So it's a common noun?

Dan: No the name of two mountain ranges.

Woodley: *I know three Clintons.*

Dan: That's not hard. The alps is more vexed because it's already
syntactically plural. I don't think it's a problem, because we can treat
Alps as semantically underspecified, and it can go through the plural
rule.

\[ Ann joins \]

\[ Woodley summarizes discussion so far \]

Francis: And one of the unfinished things is cases where you want to
represent something as both the internal structure and a single named
entity at the same time.

Emily: And that's where we thought your email was referring to Francis's
proposal.

Ann: I have been thinking about that for quite some time.

Dan: In the same soup with the semi-transparency: New York Stock
Exchange. It's pretty clear that I want to know that New York is part of
that. Sometimes even contrasted with Chicago: New York and Chicago Stock
Exchanges. But it's annoying to have to reassert that that's \[New
York\] \[Stock Exchange\] and not \[New\] \[York Stock Exchange\]. Would
be nice to be able to look it up.

Ann: Yes.

Dan: Generation direction. We were trying to decide about whether that
idiom-like lexicon should contain information about further properties,
like number information?

Ann: What's in that lexicon thing. There's an MRS structure, and what
else?

Dan: That resource is going to be a pairing of an MRS structure and
something like a sequence of tokens, probably stemmed. *Modern
Gardening* entity. That might or might not decompose in the MRS we're
going to store for it. In this case, probably three ep semantics. But we
also want the surface sequence, so I can say which thing is typically
capitalized (e.g., not the of in *Secretary of State*). So I think we
need something like the surface tokens including their case. Going to
have to have a pair of something surface plus the MRS.

Ann: I'm worrying about treating all these MRSs as compositional, in
some sense.

Dan: We have the fall-back strategy for those that don't sustain a
compositional analysis. Extreme default is calling it essentially a word
with spaces that is a named entity/NP.

Ann: The case which is problematic is the one where one of the words is
something you want to be able to interpret, and the other is a fw or
something, and they're both part of a named entity.

Dan: The two end points seem reasonably okay. Maybe can do something
more sophisticated in the middle.

Ann: Someone using this MRS will see *Secretary of State* as completely
compositional?

Woodley: At least that, plus also the info that we recognized it as a
named entity. We haven't discussed how that info is added to the
semantics (as another layer or what).

Ann: Any user of the semantics will want the named entity information
--- not *Home Secretary* as compositional. I think that also relates to
what you're thinking about for the generation perspective too.

Woodley: Likely that in the generation direction, would only get the
opaque form.

Emily: So we can look up the MRS we want from the gazetteer.

oe: Or generate as unknown words.

W/Dan: But then what do you do with *Secretaries of State*; how do we
know where to put the plural?

\[ Side conversation on how to talk about *words with spaces* in
generator input, but at any rate, it's a single ep.\]

Dan: We have to go through the unpacking in the named entity lexicon so
that we can generate the singular or plural form of that named entity.

Ann: We have a mechanism for putting the morphology in surprising
places, could use that.

Emily/Woodley: But unpacking would let the grammar do that for us;
that's exactly what the grammar is good about.

Ann: Sounds like a mechanism for creating named entities
semi-automatically without the grammar writer having to do too much.
Sounds reasonable.

Ann: Then in some sense internally what you want the semantics to be is
the compositional semantics, but externally you want a single entity so
some user doesn't have to decompose (parsing)/compose (generation).

Ann: The sort of general issue relates to conversations decades ago
about how to degenerate from a mixture of word sequences and proper
semantics. In certain circumstances you just parse the word sequences
and put that into the generator.

Emily: Publications?

Ann: No, it was a major factor in thinking about MRS in the way we did.
In principle the chart generator will allow you to do a mixure of bits
of words and bits of semantics, but in practice we never got past
small-scale experiments (sometime in the mid-90s).

Dan: Bumped into it again in discussions of names of books and silly
hotel names in Verbmobil, where the phrase itself because a named
entity. *I think that On Nomnialization is a better paper than \[name of
some other paper*. Want a uniform treatment of that that says that
despite the internal structure their function in the larger sentence is
just an entity.

Ann: Were also thinking about this in terms of AAC applications where
you take a chunk of text as input and need to make a valid, proper
sentence. Seems plausible that what you want to do is the same in hybrid
MT --- got some bits of text that are good, know they're good, and want
to stitch them together. If we did do this in a very general way, could
be useful more broadly than named entities.

Dan: One we have a mechanism that allows to take whatever source a chunk
of validated MRS and we have instructions on how to realize it in the
syntax… If you give me something that looks like it's a PP but is marked
as a named entity, then I know how to proceed. Might need coercions like
knocking out number information.

\[Summarizing previous discussion about number and astronomical
entities.\]

Dan/Ann: Dialect variation: *IBM are releasing a new product.*

Ann: That's got to be a general coercion in BrE, not just that IBM takes
plural agreement.

Ann: Trying to think of examples that are sometimes sg and sometimes pl
according dialect, or maybe how well you know the domain.

Dan: If we're dealing with a generator input where someone has tried to
give us number information. Would be nice to generate regardless of what
they did.

Ann: You're thinking of them putting in a mixture of an MRS and a
string.

Francis: \_Modern+Gardening\_n\_rel is I think what we should expect
from them.

Dan: Especially in MT input when this comes from a language when they
just keep the English name. There is an entity of the MRS there, but
it's just a single ep.

Ann: I don't think there's any way they're going to be putting in sg or
pl, and they could only be putting in sg or pl wrt to the denotation of
the thing, not actual number agreement.

Dan: We were thinking along those lines too, with the distinction
between syntactic and semantic number, where we already allow
mismatches. Were thinking about having these be underspecified for
number, but if someone hands me \_Clinton\_n\_rel: num plural, they and
we both know that it's plural.

Ann: *The Clintons* isn't a named entity.

Dan: *Clintons always run for office after a Bush has been in power.*

oe: *Clintons always run after Bushes*

Emily: We're moving to a world where there's less of a distinction
between common and proper nouns.

Ann: I'm thinking about cases where someone gives you a complex string
they've asserted is a named entity, and then you parse that and then use
the MRS, as opposed to saying this string is a named entity and here's
how it combines with the rest of the string.

Emily: That was the point of the German examples, and how we got to the
number question in English. \[See notes above.\]

Ann: So you're going to take in hints about the form of the string, but
not fully believe those hints.

Emily: Right use the hints to look things up in the gazetteer (or maybe
on the fly) and the build up the string according to how the grammar
says it should be.

Ann: Sort of worried about finding rules to integrate the thing in to
the MRS, but I can see the point.

Dan: Can you think of another approach to *Clintons always like to run
for office.*?

Woodley: Going off of Ann's email, don't have to get rid of named\_rel,
just understand that named\_rel Kim is always optional.

Ann: I like the idea of someone being able to give you a string packaged
up in the CARG or something, rather than having to take it through the
rel.

Dan: But then that's directly in competition with my hope of not having
to decide whether Secretary and State are opaque names. I'd like to say,
that's just \_secretary\_n\_rel and \_state\_n\_rel, and I know one
other thing: that they both occurred in mixed case.

Woodley: Not convinced it's in competition.

Ann: I'm still thinking of some set up in which you have both. Also
thinking of the more general MWE problem. I don't mind so much about the
exact representation of NEs (aside from general concerns about MRS
usability issues). Still sort of going on this idea that you have dual
annotations. If when you're treebanking, and you come across something
that's not in the gazetteer you'd want to add it, right?

Woodley: We were assuming an exhaustive gazetteer form external sources.
(pretending)

Ann: Thinking more in principle than practical: this is lexical
information; in some sense the gazetteer is a way to expand our
information.

Dan: Would be nice to apply that info after the analysis has been chosen
so that I don't have to contemplate that division of labor…

Ann: The advantage of doing it before is that you want that thing to be
a constituent.

Emily; A constituent, or a connected subgraph in the MRS?

Ann: Normally you don't want internal modification of a named entity. At
least you want to disprefer certain kinds of modification.

Emily: *The former Secretary of State*?

Ann: *former* should take scope over *Secretary of State*

Dan: *The new Secretary of State*

Ann: Whatever entity *the Secretary of State* refers to, I want *new* to
apply to that same entity. You don't want it to be applying to just part
of that named entity. The fact that it is a named entity gives you that
information.

Dan: In some sense it seems like we're imaging in that we've build up
the structure Secretary of State, and say "aha, my idiom lexicon tells
us we can coerce that into an entity". In some cases like *I saw Grumpy
yesterday* or *Old Angry just came in* it's obvious because without the
coercion it doesn't parse. Maybe we need something a little more
generalized that lets me do a similar decoration of the MRS for
*Secretary of State*.

Ann: Suppose you had a word with spaces type semantics of *Secreatry of
State*. Thinking of that as an analysis that's available, can be chosen
in tree banking, as opposed to something you do on the MRS as a
secondary step.

Emily: Wasn't that exactly the decision Dan was hoping to avoid making?

Dan: *The Chicago Stock Exchange*/*The Chicago stock exchange*/*The
Chiacgo Stock exchange*… not always clear if they mean a named entity.

Ann: I get it, but I don't know that stopping the possibility of you
annotating something as a named entity is the way to go. At the moment
the problem is that you are required to make a decision between named
entity and other, maybe you should have the ability to make it if you
can, but not be forced to.

Dan: So I could chose it if I want to, but then could leave it
underspecified, by not using the coercion rule.

Ann: Slightly worried by the use of coercion, because I want to think of
this in some sense independently of the implementation of the effect.
But: There is an indeterminacy sometimes between whether something is an
NE or not, but when you know, it's useful to be able to record that
fact. (Cuts out lots of parses, if the internal structure is complex.)
Also want modification to apply to that thing as the named entity
---might otherwise get incorrect analyses. Long term solution is in
terms of supporting a dual analysis approach.

Emily: Does it matter where the dual analyses come from---both from
grammar, vs. one post-treebanking from gazetteer?

Ann: Not thinking in terms of order of events. There are cases where
only the NE analysis is available, no compositional analysis (e.g.
*Grumpy*) so that has to come from the grammar. I guess that implies
that if you did it as a two stage process, could think of the treebank
leaving that as a compositional analysis where it worked…

Dan: You (pl) remind us that if we do it in a two-stage way, that's
going to require us to have an inventory of rules that allow us to get
it through the parser for the case when it doesn't look like an NP (e.g.
*On Gardening*).

\[ Emily gone briefly \]

\[ Topic picked up again towards the end of the day \]

oe: Simpler examples to try to clarify where we are:

- *Bill arrived*: only the name
- *The bill arrived*: only common noun
- *The Bill Arrived*: could be either
- *Old Navy opened a new store.*
- *Very Old Navy opened a new store.* -- star?

Dan: Not star. There's an entity named Navy (if it's capitalized), and
I'm telling you it's very old. If not capitalized, then won't parse
because it's a singular count noun (leaving aside the color name).
Taking the crucial property of the mixed case as something I get to see,
and it is involved in the licensing of that N' as an NP.

Francis: And if we want to parse annoying text like Twitter?

Dan: It's too expensive.

Woodley: You might have to start a new project: The Twee RG.

Francis: But they're short. Can we turn it on?

Dan: It's an open-source grammar.

oe: *I heard that very Old Navy opened a new store.* Should be star?

Dan: *very sunny Pittsburgh*/*very Sunny Pittsburgh*: both impeccable,
want to be able to parse that. What I wouldn't get was an entity called
Old Navy that was very something.

Emily/Woodley: Only Old Navy is in the gazetteer, but we build very Old
Navy, and then only the Old Navy part of that subgraph gets projected
out into the Schrödinger MRS.

Dan: The incoming arc might be a way to block the named entity from
firing.

Emily: What about *very sunny New York*?

Dan: Difference is that you can modify the main index, but not the
modifier.

Woodley: How does that work with coordination.

Emily: Same way.

Woodley: At least if it's top-level coordination, but what about
Secretaries of State and War?

Emily: We already have to do something special for those.

Last update: 2014-02-17 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/TheAbbey_Chrysalis2014ProperNounsGeneration/_edit)]{% endraw %}