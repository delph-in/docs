{% raw %}# TomarNames

## Dan's intro

This session I proposed for the agenda again for a fairly selfish
reason: In working through the [DeepBank](https://delph-in.github.io/docs/garage/DeepBank) treebanking, and
hearing quite reasonable complaints about inconsistent annotation…
there's a large class of cases where our formalism or our current use of
it doesn't quite guide us in the right direction of uniform annotation
as regards to proper names. A single word, capitalized, not so hard. Two
together --- not much ambiguity. Three tokens (*Jonas Klemper Schmidt*)
--- start to need to know about which names tend to be middle names or
last names to decide on bracketing.

A set of cases to illustrate how the situation is a little messy:

- Three or more token names from other cultures.
- Words which are also non-name words of English capitalized in
non-initial position. Non-nouns used in noun spots, not so hard. *I
believe that Grumpy is one of the dwarves that slept in late.*
Current machinery can posit a proper noun entry for *Grumpy*. If the
word is a count noun, can still find it because otherwise there
would be no parse. As long as there's not much ambiguity, fairly
robust.
- Bracketing conventions: sequences of proper names without high
confidence, just go for left bracketing. Creates tension when
there's a sense that you might want a different structure:
*International Business Machines*. In order to avoid the
inconsistency that would result from trying to make all those
decisions, name-name-name compounds treated as left bracketing,
unless you have reason to do something different. Leads to
annoyances with *New York Stock Exchange* --- almost no instances of
*New York Stock* without *Exchange*, so the left bracketing looks
weird.
- Can put in a declaration in a file establishing domain-specific
bracketing for particular frequent terms in a domain being
treebanked. Supports consistency without insisting on
left-bracketing everywhere.

The proposal on the table today is going to affect some of these earlier
decisions.

Case I'm worried about now are nouns that could perfectly well fit where
they are, and yet they're capitalized: *The Department of Defense which
used to be called the Department of War*. Orwellian capitalized words
that may or may not mean what they appear to. The annotator's decision
is between named entity analysis and transparent analysis. For a while I
was saying that the capital letter specifically flags opaque proper
names. But that leads to a radically different semantics in our
representation. Especially annoying in *The Departments of Defense,
Justice and state* with lower case *s* --- get weirdly different
representation of the departments. Always named\_rel for the named
entities, with interesting stuff in CARG. Ordinary common nouns (known
or unknown/generic), have \_\[lemma\]\_n\_rel --- content is in the name
of the predicate, not in CARG. Especially annoying in e.g. titles where
every word is capitalized by convention and it doesn't mean that the
author is using the words in a funny way. Does author of *Dept. of
Justice Shrinks.* mean *Justice* or *justice*?

In [Bellingham](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014ProperNouns), tried to figure out
how to minimize the difference between named entities and non-named
entities. The proposal I'm interested in exploring is having the
predicate name in all nouns be \_\[lemma\]\_n\_rel for *State* or
*state*, while recording the capitalization somewhere in the EP,
probably on the ARG0. We could fiddle with things like putting it in the
subsense field or something, but again we'd have two different semantic
predicates which is what I'm trying to avoid, for the purposes of easily
ignoring it when it makes sense to do so. Trouble is how to annotate
that info that we're not too embarrassed about---smuggling punctuation
info right into the semantics, so we can make a maximally common
specification.

In the case of adjectives, there doesn't seem to be a practical way to
do exactly the same word with only the caps info---*Grumpy* as
\_grumpy\_n\_rel + caps, *grumpy* as \_grumpy\_a\_rel. Maybe problematic
because you'd need some way to know that \_grumpy\_n\_rel can only be
there with caps. Still some vexation with the count nouns, like my
friend in San Francisco named *Tree*: *I think Tree is coming to the
party tonight.* *Tree* will be \_tree\_n\_rel +caps, and can't interpret
it correctly without knowing that it's a proper name, since count nouns
can't appear there without an article. If I said *The Tree is falling*
referring to a distinguished tree named Tree, don't really know if the
caps are indicating something important or not, would need to look at
contextual info. The decision about conflating the representations of
named and non-named things will address a large class of difficulties I
encountered.

Proposed grammar behavior: In common noun case, only a single lexical
entry with an annotation from the preprocessor, then a non-branching
rule sensitive to the property. Trying to avoid having two lexical
entries *Justice* and *justice* in the chart, so annotators don't have
to decide.

## Discussion

Ann: Why aren't you going for an account where you underspecify and the
specify further in the case where you know for sure (e.g. *Grumpy* and
*I think Tree went to the party.*).

Dan: *I think Tree went to the party* no choice.

Ann: Not in the chart, but in the MRS. What's showing the specification
there.

Dan: I'm still going to introduce a proper\_q\_rel in that case. Not
proposing to change the inventory of quantifiers.

oe: As I understand it, Dan is looking for a different semantics to give
to names that would allow underspecifiation where there is
uncertainty/ambiguity between common noun and proper noun. Gist of the
proposal is to eliminate CARG and have the predicate carry the lemma
info with PN variable property on the ARG0. PN means proper name, not
proper name, or don't know. Would closely correspond to capitalization,
but distinct.

Ann: I thought the property was about caps or non-caps.

oe: That often sets it.

Ann: Dan said that property is capitalized or not.

oe: *Tree is not coming to the party.* caps force \[ PN + \].

Ann: I would like the proper\_q\_rel to go along with the \[ PN + \].

Dan: Could be cases where \[ PN + \] is underspecified.

Ann: And there's a proper\_q\_rel?

Dan: Yes.

Ann: Why?

Dan: The only guys that the word *Mr.* can attach to are proper names.
*mr. jones came in*. The only way to accept that is by making him a
proper name. Risky: ambiguates lots of nouns where case is not indicate.

oe: I would think that *jones* can be \[ PN + \]. In addition to caps,
can be other signals that force \[ PN + \].

Ann: \_proper\_q\_rel has access to the ARG0 and can enforce \[ PN + \].

Dan: I want that value stamped in by the preprocessing to tell me it's
upper case. But that can be done in other places than proper nouns. If
you mean PN is has a cap letter, then this isn't going to work well.

Ann: I want PN and the caps.

Dan: But PNness is given by \_proper\_q\_rel. Why need it redundantly?

Emily: If \_proper\_q\_rel is there with proper and not common, then
you're not underspecifying, just bring the complex ones closer to common
nouns. And what about *the Department of Justice*?

Dan: Right -- don't want \_proper\_q\_rel to be the only sign of a named
entity.

Woodley: Does *Justice* ever get \_proper\_q\_rel?

Dan: No.

Ann: In *I think Justice won't come to the party.* it should.

Dan: Don't want to agonize over *Justice will be here, but not State and
Transportation.*

Ann: In *I think Tree isn't coming to the party.* get \_proper\_q\_rel.

Dan: There I know it has to be a proper name.

Ann: So proper names that happen to be mass nouns and those that happen
to be common nouns, we see a difference.

Dan: Feature, not a bug: With mass noun proper nouns, get
underspecification.

Ann: So many mass nouns that can be proper nouns, won't get
\_proper\_q\_rel for lots of names. Many nouns in the ERG are marked as
count or mass. Can we potentially think of a better proposal that
doesn't shift the problem to another type of annotation? Would depend on
a system knowing whether you had a mass-or-count sense for this
particular entity. A back-end system would be confronted with something
that \_proper\_q\_rel would be meaningful, but not the one that goes
with mass noun quantifiers. Can we find a version that doesn't have that
property where you can still do underspecification, but only in a way
where it really bites you.

Francis: In this world where the ERG in a principled manner pushes off
the decision, where do you anticipate the decision being made? Or the
output of our system is never going to tell us whether this thing is a
name or not?

Dan: We do it where we can, but decline to do it where it would require
real world knowledge to do so. That seems to me in keeping with our
general strategy. Could go back to asking annotators to make that
decision in treebanking, but the annotators would be stuck with
consistency problems. *I think Justice is really important.* --- is that
someone talking about the person or department \[Francis/Emily: both
names\] or the concept?

Ann: Would be happy with the mass term quantifier being underspecified
--- preserve the info when we know we have a real mass term, but don't
use that quantifier when it's underspecified between mass and proper.

Dan: Pumping rule says \_udef+or+proper\_q\_rel in the capitalized mass
noun case.

Ann: Want to keep all info there is, plus ability to annotate it when we
have it, so you can build an appropriate probabilistic model.

Dan: We have to be careful then to construct a representation that is
really underspecified that can be specialized to the precise
interpretation we want. Might imagine supplying another piece of
machinery (probabilistically driven) that resolves e.g. *New York* to
named entity. Might also be true for *Kim* in HPSG…

Francis: *Sandy*

Dan: Might even hardwire the fact that we're going to swallow the .0001%
of cases where it's wrong and coerce these to named entities, but not in
the parser, in a later component.

Francis: What sort of proportion of things are cases where the info is
there in treebanking, vs. not? How much effort is really required
currently for tree bankers?

Dan: It's like 50/50. Half the time I could not exactly tell you what I
wanted to do with that. Partially because of frequency of *Stock
Exchange*, *Department*, *Ministry* that are sometimes capitalized,
sometimes not. Get *Stock exchange*, *stock exchange* as well. *The
Chicago Mercantile exchange*, *the Merc*, *the Chicago Mercantile
Exchange*. Names of indices/composite stocks, sometimes caps, sometimes
not. There's just no way to be consistent about such frequently
occurring sometimes capitalized in a domain. Will be a new set in
another domain.

Francis: Isn't some annotator sometime going to have to make this
decision?

Dan: About the mercantile exchange? If it's a domain-driven decision,
and there's statistical info available…

Francis: Where do we get the \#s about that decision.

Dan: It's not an annotator problem, it's a processing problem. Could pay
annotators enough to do it, but don't want the grammar doing it.

Bec: I've certainly seen it in tagging and could work the numbers for
you---train a trigger on this and it's showing randomness, and it's
taking the 55% one, and wrong about 45% of the time.

Dan: In the whole proposal saying let's take a step back in our
ambitions, and I know you hate that. I think the amount of info in the
signal is insufficient to sustain the level of differentiation we'd like
to have.

Ann: It is for some domains: didn't come up in [VerbMobil](/VerbMobil),
not sure about LOGON, but probably not. When you see a single word by
itself with a capital letter, as an annotator can tell. Can see that
it's a problem in this domain, but we shouldn't end up with a solution
where we can't annotate it when it is possible.

Woodley: So you're saying it's speaker meaning and not sentence meaning?

Dan: To the extent that I understand and believe in that distinction,
yes. But I also take Ann's point. In [SemCor](https://delph-in.github.io/docs/garage/SemCor) and other data,
it's not a problem. It's when we move to a technical domain---I did see
it to some extent in the chemistry domain, but there we already had a NE
analyzer go before we went in.

Ann: I think Chemistry is a good example where it's not speaker meaning
or sentence meaning but really genuinely unspecified.

oe: I suspect the problem was there well before you got so irritated by
it. We didn't have the general mechanism for introducing names where
there is caps until after LOGON. I do remember much debate about
choosing between the analyses available in LOGON.

Dan: *The Jutenheimen \[m\|M\]ountains*

Ann: Not saying you should be able to do all of this in the ERG. Just
like with compound\_rel could specialize further with other machinery.
In cases where the annotator can decide reasonably, should be given the
option to leave underspecified.

Emily: I think that entails a different annotation set up, since we can
right now just decide among trees. Would need to be able to either say
underspecification over these trees, or to specify an additional bit of
information.

Dan: I'd be nervous about having individual annotators do that, but
rather use the machinery to create a list of things to be treated as
named entities--hardwiring choices on a per-domain basis. Maybe even
look at frequent up to 5-grams ahead of time as things to consider
putting into that list.

Emily: That doesn't answer my objection though---still choosing between
trees in that set up.

Dan: Right --- talking about the 99/1 problem. Would need additional
machinery to do what you're talking about. Maybe could even do some
repair afterwards of the MRSs without changing the syntactic structures.
Not proposing to do that now, just talking about a way to do it that
would be relatively modular.

Francis: The thing that potentially worries me there is if we have *Wall
Street Journal* that we list as something to always treat as a NE, if
other journals come up and they get the underspecified representation
(e.g. *Gold Street Journal*, occurring only once). Won't that weirdly
affect the statistical model if some things are specified and some are
left underspecified?

Dan: If our statistical model was sensitive to… would we have a
different looking derivation tree? If there's a non-branching rule which
either leaves the thing underspecified or fixes it to proper or not, but
I'm hoping to get away from that. Right now we have two different ones
for proper names and mass noun. The proposal comes to making that just
one each time that gives \_udef-or-proper …

Francis: But if it's *Wall Street Journal* and listed in the gazetteer…

Dan: It'll be different from what I'm doing now. Might be a different
mechanism so I can encode that derivation (possibly with something like
PN feature), possibly in the projection out of the MRS, and still have
just one rule rather than forcing a choice between two rules. Hand wave
hand wave.

Francis: Compound followed by journal name, would like the statistical
machinery to have a reasonable chance to come up with proper noun and
not just underspecified.

Bec:

Dan: Could still have a specialized statistically-driven engine that
affects the semantic representation before we ship it out the door,
perhaps sensitive to the CAPS feature. One trainable on some external
set of data.

Francis/Dan: So trying to do it not just in a sentence by sentence
context with the main engine.

Ann: For some domains you definitely need a named-entity resolver
preprocessor. In some domains it'll be very accurate. Don't want to lose
that in the output MRS. It's a similar sort of situation to when the
annotator knows.

Dan: If we build more sophisticated pipelines with either good
preprocessors or post-processing of the MRSs. What I'm aiming here to do
is to take out our pretense of being able to make that decision
sentence-internally with high reliability.

Woodley: With the kind of annotators we have.

Dan: Right.

Francis: The solution of better guidelines have been tried and rejected?

Dan: Not interested in trying to train the annotators better, because we
can't ever get enough training data to get the machine to do it for us.
And if we can do that, why

Ann: Different object: if you do it with a whole load of annotation
guidelines, whatever you're doing is not annotation, it's a fake.

Woodley: What about proper names like *CoNLL*?

Dan: *Johan van Benthem, Ponce de Leon,* … the only way to put these
together is proper name,

Woodley: Mixed case within a word.

Dan: *iPhone*

Woodley: Are you losing the info about what about the word was
capitalized with a binary CAPS feature.

Dan: Oh, CARG had the info before.

oe: We have an elaborate hierarchy of cap patterns.

Bec: Won't catch all patterns.

oe: Designed to capture all relevant patterns.

Woodley: All patterns are relevant.

Ann: What about the attribute SURFACE capturing the surface string.

Francis: CFROM/CTO point to SURFACE string of the whole sentence.

Ann: In some versions, it's on the individual EPs as well…

Woodley: Still not going to work for generation from an MRS. How to
generate *iPhone* or *CoNLL* form our scheme.

Dan: Where you do think it should come from?

Woodley: Currently, comes from CARG.

Francis: It's part of the lexical information for iPhone that it looks
like this.

oe: No, it's part of the semantic information on this analysis. From
this it would follow that nouns with surprising caps pattern have to be
in the generation lexicon.

Dan: Let's imagine the person supplying the input has a very strong
opinion about the capitalization of LaTeX. How do they specify that?

oe: Use a version of the generator that takes semantic info + another
channel as input.

Woodley: You're making fun of this, but it's a real problem that real
people care about that we solve currently.

Ann: I suggest we take what's in CARG and put it in SURFACE.

oe: Formal status is as parameter to the EP or an additional annotation?

Mike: pyDELPHIN allows SURFACE for the whole MRS.

Emily: In generation, don't have the whole SURFACE. Want to allow
generator input to specify spelling of specific tokens.

Ann: Some versions had EP-level SURFACE.

oe: That would be a way to allow that channel.

Woodley: What about inflection?

Dan: Would have to treat that SURFACE as the stem.

Ann: Right, like *iPhones*.

Mike: Isn't that the BASE attribute?

Dan: I think it's still the case that we're going to need CARG for
numbers. I don't want \_1578\_n\_rel for cardinal numbers. Still want
card\_rel with CARG. Could we leave it where it is for nouns, but not
instantiate it for normal nouns? If the CARG is different from the
relation name in anything but capitalization? Intended use is for LaTeX
or CoNLL?

oe: Don't we want to be a little more deliberate about what we consider
part of the semantics and what we consider annotation? CARG I take to be
a constant, a parameter. The SURFACE I wasn't aware of, but it looks to
me like it's not part of the semantics.

Dan: Neither is the capitalization feature.

oe: I had interpreted PN as a way of presenting that as semantics.

\[…\]

oe: Let's not overload CARG and maintain the distinction between CARG
and BASE/SURFACE.

Ann: There is a canonical spelling of *iPhone* --- it's a spelling error
if you don't follow. Currenlty we keep this in CARG and under the
proposal we'd lose that because the pred name wouldn't keep that
capitalization? Why?

oe: We'd have to undo the declaration that pred names aren't case
sensitive.

Ann: The strong claim was that caps could only be relevant for English
where there was CARG or other observable semantic properties … and we
wouldn't be treating iPhones as a proper name as in *There were three
iPhones lying on the table.*

Francis/Emily: Not a proper name.

Emily: *I broke my iPhone* --- how is that a proper name?

Dan: *I bought a Ford yesterday.* Surely *Ford* is a proper name?

Emily: Why?

Dan: You'll note that this will be avoided by the solution proposed
here. *I bought a new GlumP yesterday* --- the caps show that it's out
of the name of normalcy.

Francis: But there you get the \_a\_q\_rel, correctly, I think.

Francis/Emily: So not a proper name.

Dan: *My Jimmy is 10 feet tall* --- still a proper name, but the
language lets you do that. No proper\_q\_rel.

Francis: Other places where different spellings give the same PRED, like
*Thursday* and *Thurs* --- same lemma in PRED, but different
BASE/SURFACE.

Dan: Does the broad direction seem plausible?

Emily: Not sure yet what the hallmark of a proper name is.
proper\_q\_rel isn't always there. And PN/CAPS isn't yet really
semantics.

Dan: It's just recording for you everything I can see in the syntax, but
no more.

Emily: Not sure about the relationship between proper name and named
entity.

Dan: A terminology question?

Emily: I think you've been using *proper name* in this discussion where
I'd use *named entity*. The things that the formal semanticists have
worried about *Kim* and *Sandy* and even *the Alps*, but not *iPhone.*

Ann: Note the difference between *I drove my Ford.* and *I went through
my ford.* --- would have a caps difference. I don't either of those are
proper names. I think it's a common noun convenitally always spelled
with a capital letter. There are common nouns where it's always a
capital letter and it does sense disambiguation.

Last update: 2014-07-18 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/TomarNames/_edit)]{% endraw %}