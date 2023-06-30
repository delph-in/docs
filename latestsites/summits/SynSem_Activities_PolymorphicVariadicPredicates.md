{% raw %}# Problem Statement

In the ERG meaning representations (and in logic-based semantics, more
generally), how to deal with variation in the number and types of
semantic arguments?

Survey what other broad-coverage initiatives do, e.g. EngValLex,
PropBank, FrameNet, OntoNotes, AMR, etc.

# Reading List

- [Fillmore
1986](https://journals.linguisticsociety.org/proceedings/index.php/BLS/article/download/1866/1638)
Pragmatically controlled zero anaphora
- [Fillmore
2007](https://books.google.no/books?hl=en&lr=&id=2iiLDr9FJJYC&oi=fnd&pg=PA129&dq=fillmore+definite+null+instantiation&ots=mFM3r34jH5&sig=nBccOt1vplGN-uqMK8d_EjwNs4c&redir_esc=y#v=onepage&q=fillmore%20definite%20null%20instantiation&f=false)
Valency Issues in FrameNet
- [Johnson and Fillmore
2000](http://delivery.acm.org/10.1145/980000/974313/p56-johnson.pdf?ip=193.157.118.135&id=974313&acc=OPEN&key=4D4702B0C3E38B35%2E4D4702B0C3E38B35%2E4D4702B0C3E38B35%2E6D218144511F3437&__acm__=1523876575_25770daa723fe7d7737cea01327f479f)
The FrameNet tagset for frame-semantic and syntactic coding of
predicate-argument structure
- Grimshaw -- Dan to fill in which paper this is
- [Koller & Lascarides
2009](http://aclweb.org/anthology/E/E09/E09-1052.pdf)
- ([Kilgariff
1997](https://link.springer.com/article/10.1023/A:1000583911091) I
don't believe in word senses)
- [Flickinger et al
2005](https://pdfs.semanticscholar.org/57e3/8ae47e81824a74f8af46e8d90c0d4c540211.pdf)
Sem-I Rational MT
- Asher 2011 *Lexical Meaning in Context: A Web of Words* (Recommended
by Alex L. as an example of flexible types in lexical semantics)

# Resources to Review

- ERG Lexicon
- Prague valency lexicon
- VerbNet
- FrameNet
- Levin, B. (1993) English Verb Classes and Alternations: A
Preliminary Investigation, University of Chicago Press, Chicago, IL.

# Other Wiki Pages

- [FeforDroppedArguments](https://delph-in.github.io/docs/summits/FeforDroppedArguments)
- [TheAbbey/Chrysalis2014Arity](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014Arity)
- [TheAbbey/Chrysalis2014OpenEndedPredicates](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014OpenEndedPredicates)
- [SaarlandSententialArgument](https://delph-in.github.io/docs/garage/SaarlandSententialArgument)
- [TheAbbey/Chrysalis2014Nominalization](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014Nominalization)

# Clear Cases

- Argument still there semantically even when dropped: *eat*
- Argument gone semantically if not satisfied syntactically: *kick*
- Argument can be NP or CP/S: *report*
- Accepts clausal complement only: *contend* ... but FrameNet provides
an example with *and X contends the latter*, so we need a better
example here.

# Examples

## deny

FrameNet lists two frames for *deny*,
[Affirm\_or\_deny](https://framenet2.icsi.berkeley.edu/fnReports/data/lu/lu18238.xml?mode=lexentry)
and
[Prevent\_or\_allow\_possession](https://framenet2.icsi.berkeley.edu/fnReports/data/lu/lu14972.xml?mode=lexentry).
On examining the annotated data, we found the following valence frames,
and aligned them with the *disavow* and *decline* like senses:

|       |               |             |
|-------|---------------|-------------|
|       | disavow (1,3) | decline (2) |
| V-ing | ✓             |             |
| S\|CP | ✓             |             |
| NP    | ✓             |             |
| NP NP |               | ✓           |
| NP PP |               | ✓           |

With example arguments:

|       |                   |                                          |
|-------|-------------------|------------------------------------------|
|       | disavow (1,3)     | decline (2)                              |
| V-ing | cheating          |                                          |
| S\|CP | that they cheated |                                          |
| NP    | the rumor         |                                          |
| NP NP |                   | the petitioners; the request; Kim a kiss |
| NP PP |                   | a kiss to Kim                            |

Note1: In the NP, NP frame, either of the NPs can go missing, but not
both at once: \*Kim denied. Note2: FrameNet has one instance of
something like *deny a request* classified with the frame that otherwise
has the disavow senses. We think this is probably an annotation error.

### Options

    deny_v_1(e,x,h)                      deny_v_1(e,x,p)
    deny_v_3(e,x,x)
    deny_v_2(e,x,x,x)                    deny_v_2(e,x,x,x)

Would like to know how each of these options (as well as always getting
the same predicate symbol) look to a logically-inclined semanticist.
Which is preferable? Is there yet something different that would be
better?

Observations: In this case at least, the analysis is consistent with the
approach to having the Sem-I do the refining, since the information
needed to distinguish between the predicate symbols is all apparent in
the ERS. Exception: Since both ARG2 and ARG3 are syntactically optional
in deny\_v\_2, how would we know which way to specialize *NP denies NP*?
Alternatively, how do we know when to put in ARG3, especially given that
in *NP denies NP*, the second NP could be either ARG2 or ARG3?

- *Kim denied the rumor.*
- *Kim denied the request.*
- *Kim denied the petitioners.*

This entails two separate lexical entries, which could then have
different PRED values.

## Notes from discussion on 20-Apr

(Emily, Dan, Cleo)

More data:

- *Kim denied to Sandy that Pat arrived.*
- %*Kim denied the rumor to Sandy.* -- corpus study needed
- \**Kim denied to Sandy cheating.*
- \**Kim denied cheating to Sandy.*

Interesting that the addressee is available for CP complement but not
the VP one. Necessarily unexpressed in VP frame, but still there in the
semantics?

- ?*He denied my having received any bribes.*
- \**He denied me having received any bribes.*

Are gerunds similar in semantic type to CPs and nouns like *rumor*?

- *I resent that he sang that song.*
- *I resent his singing of that song.*

Is *rumor* something like a proposition in its semantics? But:

- *I deny most rumors that circulate about me.* -- clearly quantified
- *Kim denied every annoying rumor.* -- what is *annoying* modifying?
Is it the content that's annoying? The frequency of the repetition?
- *I deny every false rumor.* -- clearly the content is false.
- *The whispered rumors of his affairs*
- *The frequent rumors of his affairs*

The word *rumor* requires something above the content, that the story
had been passed from person to person --- but what *deny* targets is the
content.

- *It was frequently rumored that Kim would quit.* -- Suggests that
*the frequent rumors* has *frequent* modifying the event of
rumoring.

Are there predicates that just want the propositional content in their
complements and can't take individuals? *hope*, *insist*, ... Dan has
created a list.

Deny seems to want to take as its complement a proposition that has been
asserted to be true --- some nouns carry this for the propositions they
package, some don't. So one can deny a rumor, a claim, a conclusion but
not a hypothesis, theory, hope or suspicion. The nouns that deny can
take denote a communicative event with a truth value assigned. Deny
asserts the opposite of that truth value. *belief* can't be a complement
because it's an attitude about truth but not communicative. Deficient in
both ways: *wager*, *likelihood*.

*Deny* with a CP complement presupposes that someone believes that the
CP is true.

*Deny a request* similarly involves one actor pushing for one state of
affairs (that they request) and the other pushing back the opposite
(denying the request). Both *rumor* and *request* case involve flipping
like this.

Request case also has the communicative act property: *Kim denied Sandy
a kiss* suggests that Kim knew Sandy wanted a kiss.

*The supervisor denied the employee a raise* in the case where the
person who put in the request was HR (and the employee never knew).

*The guard denied the prisoner his 10 minutes in the sun.* Allowed every
day, standing request/expectation. Guard prevents it happening one day;
*deny* is still good here even if prisoner said nothing.

In basketball --- player A goes up to make a shot which player B blocks
at the basket: Denied! *Cleo was on her way to Oslo. She had even gotten
on the plane. And then: Denied!* That *denied* is passive not past
tense.

*I denied him his rights.* *I denied her the privilege.* Again: Standing
expectations?

@*The deputy president said for those such as MaMbeki, the struggle
against apartheid was inherently a struggle to reclaim their birthright
as a people, as successive racist regimes denied them their citizenship,
dignity and identity.*
([source](https://mg.co.za/article/2014-06-14-mambeki-a-heroine-of-peace))
--- what's being denied is the ability to claim or benefit from
citizenship, dignity and identity.

*NdT denied the solar system its 9th planet*: What's being denied is the
community's shared belief in 9 planets, but also the thing we enjoyed
which was having 9 planets.

*Mom denied my sister her green peas* -- not okay if said sister hates
peas.

Attempting to get just one sense for request/rumor cases, with all
differences following from unsettled v. settled:

|                                                    |                                              |
|----------------------------------------------------|----------------------------------------------|
| **request type**                                   | **rumor type**                               |
| prop content *p* through coercion from NP          | prop content *p* directly or through package |
| unsettled                                          | settled                                      |
| for some agent it's a good thing that p (become) + | communicative event asserts p -&gt; +        |
| rights? attempts? states?                          |                                              |
| flips potential for + to -                         | flips + to - by asserting                    |

*request* type takes a much broader range of nouns, but can get that
from "p (become) +" being good for agent A.

The only thing that doesn't fall out is the lack of communicative event
on the unsettled/request side.

Antonym: *grant*, seems to work in both cases. *I grant you that belief*
--&gt; only works in the unsettled case, which is predicted. *I grant
you the ability to hold that belief.*

More ex from [FrameNet](/FrameNet): *deny any wrong-doing* *deny any
mistakes* ... interpreted as charges/claims that there had been
wrong-doing or mistakes. Needs to be coerced into proposition with
presupposed communicative event.

In settled case *denied the rumor to everyone* : everyone can include
people who didn't assert the rumor in the first place; addressee of
second assertion, not speaker of first. In unsettled case *denied x y*
or *denied y to x* : y has to be the person for whom "p (become) +" is
beneficial.

Would we see the same thing for *grant*?

## Notes from WG on 24-Apr

(Emily, Dan, Cleo, Dag, Stephan, Adam)

oe, introducing the topic:

Problem statement: Variation in arity, variation in type of arguments;
desire on our part to understand better the formal challenges for
compatibility to logic on the one side and maybe forming a reading group
to do a survey of what others who have worked in this space in broad
coverage (annotating running text) have done.

Null instantiation: Does *I ate* mean *I ate something*, but *I kick*
doesn't have the same entailment: can make a kicking movement without
kicking anything. *Deny* shows type variation in its syntactic valency.

Side discussion of *deny* plus V-ing. *Kim denied singing the song* ---
how to test whether that's a (verbal) gerund v. a participial VP. (Cf.
*Kim relies on singing that song the same way everytime.*)
Unfortunately, verbal gerunds don't always give clear indication that
they've been turned into an NP, just an optional determiner.

Dag: Can you have intransitive *deny*?

Dan/Emily: No.

Dag: Norwegian deny does -- but with anaphoric interpretation of the
argument.

Emily: Four kinds of dropped arguments? DNI (like *notice*), INI (like
*eat*), no argument there at all (*kick*), some syntax going on to
suppress the argument that also dictates its interpretation (CNI;
dropped *by*-PP in passive, dropped subject in imperatives...)

Dag: And reciprocals, like *They kissed*?

Emily: I don't know which type that is ... lexically-specific, right?

Dag: Yes.

oe: Back to variation in valence of *deny*.

Cleo: We made an interesting observation about content bearing nouns,
you can deny a rumor or a conclusion, but not an hypothesis.

Dan: *Hypothesis* by its lexical sense doesn't give you something with a
putative truth status to deny.

Dag: Can you do *deny whether*?

Dan: No, and probably for the same reason.

Cleo: And it has to give you a communicative event --- can't deny a
belief.

Dan: We were interested in that exploration because Cleo was teaching
Emily and me about the tools in the toolkit of a formal semanticist ...
what you can ask about: polarity, factivity...

Emily: The connection I see here to the main problem statement is: Is
*deny* in fact polymorphic, or does it always take a proposition as its
complement, but it knows to dig for it when the complement is a noun
like *rumor*?

Dan: And we're curious how to build a compositional semantics that
allows *rumor* to expose different aspects of its semantics for
different things in the sentence to grab onto (package, content) in one
and the same use, as in *the whispered rumors of his affairs*.

Dag: Co-predications: *The false, whispered rumors*

Dan: So it has to be just one word, can't do a lexical alternation.

Dag: As with *Heavy, informative books*

Adam: Pustejvosky talks about a lot of this stuff, right?

\[...\]

Emily: One thing that I found very interesting on Friday was that there
seemed to be a space between the string and the manipulations that Cleo
wanted to do. So that brings me back to the question of what would
someone who wants to do a theoretical analysis of *deny* like what we
were doing want to come out of the grammar? And how much munging is
allowed while still calling ourselves compositional?

Cleo: Maybe it makes sense to start with these hard cases,
methodologically.

oe: Also brings up the dichotomy between individuals and propositions,
which maybe aren't in as sharp a dichotomy as logic would lead us to
expect.

Dan: We might get a prediction about when we get -ing v. infinitival.
Can we prdict this pattern from something?

    continued making that claim
    continued to make that claim
    *continued that we made that claim
    continued the rumor 
    denied making that claim
    *denied to make that claim
    denied that we made that claim
    denied the rumor

\[Side conversation about why *premise*, not *proposition* is allowed as
complement of *deny*\]

Cleo: Even with just a plain that complement, you get the implication
that someone else had held the position.

Dan: Where we have this range of slightly different syntactic packaging
(nouns, gerunds, controlled complements, full clauses) it would be nice
if we could predic that from the semantics.

oe: At least one necessary condition we considered was the noun taking a
propositional argument.

Cleo: And it has to be packaged as a communicative event.

Emily/Dag: But that doens't answer Dan's point.

Dag: Clear contrasts: *I remembered to buy the fish* / *I remembered
buying the fish* ; *I forgot to vote* / *I forgot that I had voted.*

oe: So these ones definitely need different predicate symbols, because
there might not be enough info in the semantics to say we can recover it
from an underspecified one. Like what we do with *paper*, allowing
ourselves not to ambiguate when the grammar doens't tell us. For *to* v.
*-ing* there's nothing left, right?

Dan: There's the aspect...

Dag: What about *He forgot to be playing the piano when his teacher his
came in.*?

Cleo: I think what's happening with infinitivals: There's a class of
verbs for which it is forward-shifted. You have to have understand the
infinitival clause as having temporal reference forward-shifted from the
time of the main embedding predicate, where *-ing* doesn't do that. In
*forgot to be playing the piano when the teacher arrived*, there was a
preceding expectation/obligation.

Dag: My worry was more that distinguishing the infinitival and the
*-ing* in the semantics...

Emily: But in *I remembered buying the fish* couldn't that be a gerund?

Dan: Sure, most of those verbs can... *keep*, *stop*, *began*,
*continue*...

Emily: Those are all very aspect-like main verbs.

Dan: This is a cline in every direction.

Dag: *It kept raining*

Dan: Maybe we can use raising to distinguish between gerunds & V-ing?

Emily: And control, too, surely. For *I deny cheating*

Dan: Why?

Emily: Well, it's definitely control, right? *I deny cheating on that
paper.* *I saw you cheat! You're lying.* *I meant I deny Dag's cheating
on that paper.*

Dan: And in *I deny any cheating*?

Emily/Dan: More plausible deniability there...

Dan: It would be nicer if we could make a sharp distinction between
raising and control here.

Emily: You want things that will show up in the string, don't you?

Dan: I want to be able to avoid unnecessary ambiguation, especially when
the semantics comes out very much the same.

Dag: What other verbs do this?

Dan: Verbs of perception? *hear*, *see*

    I heard him sing
    I heard him singing

Dag: But with the infinitival marker. Will we see other sharp
distinctions like with *forget* and *remember*.

Dan: \[Searches his lexicon\] *bother* (NPI), *dread*, *fear*, *hate*,
*like*, *love*, *start*, *continue*, \**stop* (ing only), *began*,
*stand* (NPI), *try*

    He didn't bother to come to the party.
    He didn't bother coming to the party.

Emily/oe/Dag: Same meaning, both control.

Emily: There is a contrast in entailments for *try*

    I tried eating the cake
    I tried to eat the cake

Cleo: Difference in how long the state of affairs hold:

    I fear going to department parties
    I fear to go to department parties

Dan: That's older English anyway...

Cleo/Dan: Difference in how they relate to repeated events.

    I hate to go to parties
    I hate going to parties
    I would hate to go parties
    I would hate going to parties
    ??I would hate to go to that party
    ??I hated to go to that party
    ??I loved to go to that party

\[Scribe's notes: This isn't quite the right set of strings; didn't keep
up.\]

    *I hated to do this to you, but I had to.
    I hated doing this to you, but I had to.
    I hate to do this to you, but I have to.

Adam: Difference between particular event and kind of event? (Cf.
Chierchia.)

Dan: *He hated to sing Christmas songs at Easter* --- it happens
multiple times and he hates it each time.

Adam: *He would hate to give an after dinner speech* --- no specific
event. Can refer to kinds without a particular instance of this kind.

oe: So there is something that appears reasonably robust.

Dan: A property here that distinguishes *ing* form from the *to* form.
Distinguishes kind from particular event.

Dan/oe: \[Tongues in cheek\] it's the same as mass/count

Cleo: Trying to figure out a connection with *forget*. In both *forget*
and *remember* you get the implication that it actually happened with
the *-ing* form. Could it be the *ing* form that is used to encode that
something actually happened, when something in the verb requires it to
happen, and that's what the infinitival resists?

Dan: Not just the infinitival --- *continue to do* --- maybe it fails to
provide something that is needed in some cases.

Dag: Is there a contrast for *continue to V* and *continue V-ing*?

Emily: No.

Cleo: But when there is a difference, maybe the *-ing* migrates to the
cases where the thing happens.

oe/Emily: What was the contrast with *remember* again?

Cleo: *Remember that* is factive, *remember to* is implicative (implies
complement except it flips under negation), and *remember -ing* is also
factive.

Emily: And *remember to* and *remember -ing* are control.

Dan: ... for *to*, definitely, for *-ing*, maybe... Then we're back to
the gerund problem.

Emily: \**I remembered for Toby to bring a key.* but *I remembered Toby
bringing a key.*

Dan: That's a gerund: *Toby brining a key is what I remember* It's one
constituent.

oe: Does that constituency test say anything about *I remember bringing
a key*?

Dan: Still open --- could be a simple control structure or could be a
gerund.

Dan: *keep* doesn't take an NP complement in that same sense, so it's a
nice clear case of control into *VP-ing* complement.

Cleo/Dan: Why does it have to be *I remember it raining*, and not *I
remember raining.*?

Dan: Would like a sharper test for necessarily controlled *-ing*-form VP
complement v. gerund. *keep* being a nice clear case.

oe: So let's find other cases of expletive-taking predicates as gerunds,
to see if we can side-step what might be an idiosyncractic property of
*raining* blocked by *rain*.

Cleo: So gerunds start verbal and become nominal, right?

Dan: Yes, because they can show up after prepositions.

Cleo: So you can have: *frequent raining*?

Dan: Not great...

Dan: Maybe we're too far down in a corner here with worrying about when
I have to posit the legit but infrequent V-*ing* controlled complements.

Cleo: Can I try out an argument that they're really not nominal? Because
you get this implication that this thing happened --- *I forgot the rain
in Oslo*, *I forgot the frequent rains in Oslo* nominal arguments need a
marker of definiteness. *I forgot bringing the key.* Doesn't have a
marker of definiteness. If it were nominal you'd expect a determiner
that is by default definite.

Dan/Emily: Why?

Cleo: If you have an indefinite, it would be a specifc one.

Emily: So *remember* wants a specific indefinite, if the argument is
indefinite?

Cleo: Yes (including partitives). The argument is that the V*-ing*
doesn't take any marking of definiteness, so they aren't nominal in this
use (with *remember/forget*).

Emily: So the arugment hinges on specific properties of *forget* and
*remember*, that they want definite or specific indefinite.

Cleo: Yes, or *every*...

Dan: *I remember no singing of pop songs in this cathedral.* What does
it means in terms of what actually happened? Still trying to understand
what the constraint is on the NP meaning.

Cleo: What I thought was the descriptive content of the NP was
presupposed to be instantiated... there were signings, there were rains,
and then you quantify over this domain. But you're right that in present
tense... there has to be something in the discourse, where someone has
claimed there was some.

Dan: I see the direction you're taking and it's tempting, looking for
constraints on the denotation of the NP, and whether it's definite or
indefinite could be a differentiating property... could at least be a
place to look for a piece of evidence for controlled complement v. NP
gerund.

Dan: That's convoluted; would take a week of calisthetics to be able to
try to take that on.

Dag: Hold my beer.

Dag: Even more convoluted arguments: Controlled pro is only supposed to
give you de se readings, where the attitude holder is aware of the
identity. Scenario: A guy watching a sports show on TV, and he doesn't
know it, but it's footage of himself winning a race and he says, "Oh I
remember that," but he's not aware that it's him. Can you report: *John
remembers winning the gold medal.*?

Emily: Two weeks.

Dag: John reads a paper and really likes it, not aware that he's the
author and says, "This author is a genius!" Can you report *John claims
to be a genius*? Clearly no. Surprisingly clear judgment.

Adam: Connected to Madame Tussaud sentences. Ringo Starr goes to the wax
museum and sees that the statue of himself is dusty. Can you say: *Ringo
Starr dusted himself*? Long form v. short form reflexives differs on
this in other languages.

Dag: Different to control examples, because there is only one referent
in the world (and lack of knowledge about the identity).

Emily: So I'm still wondering how to take this rich discussion and use
it to inform the question of whether we have to ambiguate in the
grammar's output.

Dan: *John bought the paper* --- can still leave it underspecified. But
what we've been told by logicians is that we have to change the
predicate symbol as soon as the number or type of arguments change. But
can we hand off the underspecified symbol anyway and let the mapping to
target representations do the specialization? My problem? Seems like
someone else's, but also seems like part of the grammar.

oe: But will an annotator require context to decide? I expect that will
often be the case.

Dan: As they would for the paper case. The author of the text probably
weren't vague --- they had a clear opinion of what was intended.

Dag: Is *-ing* v. *to* an interesting case to look at for that?

oe: Because it's not going to be black and white. Can't always
underspecify --- the contrast with *forget* should be projected and
currently isn't.

Emily: That's not a problem for the annotator.

oe: Right -- it's a problem for making available all information that
comes from the grammar.

Dag: Has to be stored either in the governing predicate or in the form
of the complement.

Cleo: That's where the other story becomes attractive. You get *forget*
and what kind of complement it takes.

Emily: But we don't want to stop there. We want to get all we can out of
the syntax.

Cleo: This looks like a case where I like the two-step position. It
doesn't force me to do something when I shouldn't. What really matters
are the properties of form, and that's what I'm going to build my
inferences on.

Emily/oe: \[Surprised\]

Cleo: Lexicon says: *forget+that* factive, etc. And then I'll know what
to do. And depending on what kind of task you have, you might want just
the inferences about the complement.

oe: If you're happy to do that after parsing, then that forces the
parser to include that contrast in its interface representation --- a
very overtly morphosyntactic ... something we would find appalling...

Dag: Like the DRSs that Matthew and I make.

Cleo: I'm happy to play the other game too. Just trying it out in my
head.

oe: The other game has the benefit and challenge of potentially forcing
some separation of powers.

Dan: There is a theory of that in LFG. f-structure imposes some theory
of what of syntax is available for semantics.

Cleo: It's a constraint problem; trying to satisfy multiple constraints.

Dan: With two potentially unrelated engines. One composing the interface
representation, and one taking that do something with meaning
constructors. Hard to have an argument with that. Just defining the
rules of the game in a different way.

Cleo: If I were to teach semantics to a class, I wouldn't adopt this
perspective.

Adam: For me, one argument for having a single valency frame is
coordination (*Kim remembered the appointment and that they had to be on
time.*). Also maybe co-predication.

oe: *Kim remembered that it rained for an hour and the mess that it left
outside the house.*

Dag: How does it apply to *ing* and *to*?

Adam: I've been trying to construct an example...

Dan: *I remembered buying the milk and to pick up some milk.* ... so
maybe that *remember* isn't the same *remember*?

Cleo: But: *I remembered buying the book and that Mary was there with
me?* What's shared here is the factive use.

Dan: So doesn't that suggest that the *ing* is a proposition and not a
property?

Dag: There are too many moving parts here, hard to tell. Don't have to
say that a VP denotes a property.

Dan: Is that right in general for control structures?

Dag: There's a big debate about that.

Dag: And as Adam said, it's tempting to make some of these denote
events.

## Emily's notes on Levin 1993

She explicitly only looks at NP & PP arguments, not clausal complements,
but does include diathesis alternations that change the arity.

The project is very much framed in terms of understanding the meaning
components that predict the possibility of the various alternations
(plus the meaning of derived nominals and adjectives) and she argues
(briefly) for decomposing predicates, which seems to fly past our notion
of predicate symbols. She also talks about alternations (at least in the
intro) that involve predictable changes in verb meaning --- e.g. verbs
like whistle can be used as verbs of motion, but not bark (I'm assuming
that the X's way construction is something different still; she doesn't
mention it), and concludes that in something like *The train whistled
past the station* that sense of *whistle* is better treated as a verb of
motion (with an accompanying sound) than as a verb of sound emission
(with an accompanying motion). All this to say that she sees these
different uses as the same verb (at some level of abstraction), but sees
them as having different meanings, presumably differentiated by specific
meaning components.

In sum, I don't think the question "Does Levin think that predicate
symbols should have fixed arity?" is usefully answered in that book, but
it does provide interesting further context for our discussion.

Last update: 2018-05-14 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/SynSem_Activities_PolymorphicVariadicPredicates/_edit)]{% endraw %}