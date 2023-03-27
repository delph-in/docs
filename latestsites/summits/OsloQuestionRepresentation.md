{% raw %}Summary: The current representation of questions has two parts -- a
sentence force feature on the verb's event \[SF: ques\], and a
wh-quantifier (for wh-questions). However, if there is an embedded
clause, there are two verbal events. Either of these may be a question,
and either may have wh-constituents, but there is nothing in the MRS
that directly linking the wh-quantifiers to the correct verbal event.
This linking could perhaps be done using ICONS, from the question event
to the wh-individual.

A previous discussion brought up cases with questionably-grammatical
gaps inside embedded clauses:

- Do you know who Kim saw?
- ? Who do you know whether Kim saw?

Supposing the latter sentence is grammatical, there is no difference in
the MRS between the two. The first is a polar question embedding a
wh-question, and the second is a wh-question embedding a polar question
(with the wh-constituent from the embedded clause). I prefer the
sentence with a resumptive pronoun, although this is also questionably
grammatical. It sounds better with some context:

**SCENE 1**

A: As you know, Kim has been accused of financial fraud. I need to know
all the people she saw yesterday.\
B: Okay.\
A: Did she see Sandy?\
B: I think so.\
A: But you're not certain?\
B: No, not completely.\
A: What about Alex?\
B: Probably not.\
A: But you're also not certain?\
B: No.\
A: Okay, so who do you know for certain whether Kim saw them?  

To avoid extracting a wh-constituent from the embedded clause, we can
use echo questions, so the wh-constituents are not fronted. It's also
possible to echo what was already a question. To start with a simple
example:

**SCENE 2**

A: Good afternoon, I need to ask you a few questions.\
C: Okay, but please speak up, because I'm hard of hearing.\
A: Do you know Kim?\
C: Do I know \*who\*?\
A: Kim.\
C: Oh, yes, of course. I know everyone who works here. In fact, I've
been working here since...\
A: Okay, that's enough.\
C: Sorry, carry on with your questions.\
A: Who did Kim see yesterday?\
C: Who did \*who\* see yesterday?  

Scene 2 was not presented at the discussion, but a request was made for
simple examples of echo-questioning a question.

**SCENE 3**

D: Right, I've got a list of everyone Kim saw yesterday.\
A: Okay, but I've been getting conflicting reports.\
D: Well, this is what I've been told.\
A: So who told you who Kim saw?\
D: Well, Jimmy told me that Kim saw Alice and Bob.\
A: At least he's being consistent.\
D: And Jinny told me that Kim saw Alison and Bobby.\
A: That's new. Did you get to speak to the rest of Jinny's team?\
D: Yeah.\
A: Okay, so who did Jenny say Kim saw?\
D: Wait, who did \*who\* say Kim saw?  

Technically speaking, in this particular example, we could look at the
SF of the embedded clause, and deduce in the second case that it's a
proposition, so both of the which\_q's must belong to the matrix clause.
If the embedded clause is also a question, this approach won't work.

**SCENE 4**

Kim's associates Kimi and Kami are now also under investigation.

A: Any new information?\
D: Yes, Sandy told me who saw Alice.\
A: Wait, Sandy told you who saw \*who\*?\
D: Alice. Not Alison, who doesn't seem to be involved. Sandy said Kim
and Kami saw Alice.\
A: Okay.\
D: Sandy also said who Kimi saw.\
A: Sorry, Sandy said who \*who\* saw?  

Scene 4 was not presented at the discussion, but similar examples were
given. The additional context makes the intended readings clearer. The
contrast is between:

(1a) Sandy said who saw Alice.\
(1b) Sandy said who saw \*who\*?\
(2a) Sandy said who Kim saw.\
(2b) Sandy said who \*who\* saw?  

In (1b) and (2b), both clauses are wh-questions, and there are two
which\_q's, but we don't know which which is which.

Unfortunately, such echo questions are not reliably parsed by the ERG.
With the 1214 grammar, (1b) parses. During the discussion, I mistakenly
said that (1b) parses with the correct reading. However, I think this is
actually an polar question (an intonation question), based on a
proposition with both wh-constituents in the embedded clause, as shown
in (3a). The questions (3b) and (3c) are equivalent.

(3a) Sandy said who saw who.\
(3b) Sandy said who saw who?\
(3c) Did Sandy say who saw who?  

To see that echo-wh-constituents in embedded clauses don't parse, we can
look at the simpler case below. (4b) and (4c) don't parse with the
intended reading.

(4a) Sandy said Kim saw Alice.\
(4b) Sandy said \*who\* saw Alice?\
(4c) Sandy said Kim saw \*who\*?  

Supposing that the ERG should be extended to allow echo questions with
embedded clauses, we need to extend the MRSs to distinguish between
(1b), (2b), (3b/c). This could perhaps be done using ICONS -- we could
add a link from the event variable with \[SF: ques\] to the instance
variable quantified by the which\_q. In each of (1b), (2b), (3b/c),
there would be two such links.

This would roughly match what Ginzburg and Sag propose in "Interrogative
Investigations". Their semantics has two features: PROP, whose value is
a proposition; and PARAMS, whose value is a set of parameters, one for
each wh-constituent. A polar question has an empty PARAMS set. With the
above proposal, ICONS would take over the role of PARAMS.

\[An afterthought while typing up these notes -- arguably,
echo-questions should be treated differently from normal wh-questions.
For example:

(5a) Who is here?\
(5b) Kim, Sandy, and Alice.  

(6a) Is Kim here?\
(6b) Is \*who\* here?\
(6c) Kim.\
(6d) Yes.  

The answer to (5a) is a list of people, as shown in (5b). However, the
answer to (6b) is a single person, as shown in (6c) -- having clarified
the original question (6a), the answer (6d) can be given.

However, Ginzburg and Sag also discuss "non-reprise" (non-echo) in-situ
wh-questions, which behave like normal questions.\]

* * *

oe: What does it mean for an eventuality to be \[ SF ques \]?

EMB: When we got rid of the messages, we pushed the info down onto the
event variables, but that doesn't mean it's really a property of them.
MRS needs reinflating in that respect.

Guy: Proposes using ICONS to associate wh parameters with the
appropriate \[ SF ques \] bearing e.

Woodley: Aren't these about truth conditions as in *John knows who saw
what*? And isn't ICONS only about non-truth conditional stuff?

Dan/Emily: ICONS will eventually also have constraints on anaphoric
binding.

Woodley: Okay that's also truth conditions.

oe/Dan: What's true about ICONS so far is that it's all non-scopal,
which is also true of this. Modeling only in terms of e & x.

Guy: Seems like the ERG doesn't allow multiple echo question examples.

Dan: *That's something that I don't know how to do.* Don't handle
multiple gap sentences.

Woodley: Which sky would fall if you extended the max length of SLASH?
Massive overgeneration or efficiency?

Dan: Both -- going all the way open. But changing the honest lie from
there's at most one thing on the SLASH list to there's at most two would
let us play with these examples and that might be reason enough to try
it.

Guy: If we had appends for proper lists rather than diff-lists we would
know the end (and thus when to stop popping), but that becomes messy.

oe: What's the summary of what needs to be captured in the semantics?

Guy/Emily: Equivalent of params list, ICONS seems to work.

Dan: Two-way distinction between wh words: Those that introduce a param
lists element (on ICONS) and those that don't.

Emily: But the echo question ones also go on the params list, they just
belong to the list associated with the top-most EP (e associated to ARG0
of EP with LTOP).

oe: *Did Sandy say who saw who?* -- I thought that the params list would
be empty, because we're not asking anything other than yes or no. But
now I see that one flat params list doesn't do it. So we need something
like binary relations ... like what's on ICONS.

Emily: Trying to get away from echo questions, working on constructing
data from Mandarin, because wh-constituents are in situ, rather than
fronted as in English:

    Sandy 说    谁     看   了  谁    吗
    Sandy shuo1 shei2 kan4 le  shei2 ma
    Sandy say   who   see  PRF who   Q

With *ma* -- only means 'Did Sandy say who saw who?' \[cf. (3b/c)\]

Without *ma* -- ambiguous: 'Who did Sandy say \_ saw who?' \[cf. (2b)\]
or 'Who did Sandy say who saw \_?' \[cf. (1b)\] or 'Sandy said who saw
who' \[cf. (3a)\]

Guy: So it's a strength of the current analysis for Mandarin that it's
all underspecified?

Emily: No, because we need to be able to model the fact that with the
*ma* the wh words must stay low. If we don't indicate somehow that the
wh params only attach low, we've lost information that the grammar
should give us.

Emily/oe summary: When we got rid of messages, we lost the place to
store the parameters as associated to a particular
message/clause/question. So instead, now proposing to do this as binary
relations on the ICONS list, with the e from the main verb as the
stand-in for the clause.

oe: So what about scopal modification then? If we pick the event of the
main verb, we've made a commitment.

Guy: G&S say that aren't scopally active ... but still somewhat? *Who
read every book?* is absolutely ambiguous.

Guy/oe/Glenn: The things we need to worry about are scopal modifiers:
negation, probably.

Guy: *Who didn't leave* isn't ambiguous --- so maybe it's fine to take
the event variable of the main verb. G&S might have a story about *Who
read every book?* that is other than ordinary scope ambiguity (cf.
collective/distributive readings).

Woodley: How does attaching to a particular event variable say anything
about scope?

oe/Woodley: ICONS aren't part of the scope tree.

oe/Guy: But using the event is saying we don't need the scope tree ---
we're saying they are independent of the scope tree. In *Who probably
didn't leave?* we don't need to say anything about scope.

Dan: If there were grammatical constraints, we'd be losing information.

oe: So we need to stack them, which is hard.

Guy: But even with just one, if there were ambiguity in *Who never
left?* ... but I can't see what it is.

oe: Earlier you stacked questions to motivate the need for associating
the params list with the clause. Now I'm asking whether the event
variable is the right way to get that.

Emily: Worries some about the notion of 'clause' which is ill-defined
for us and was part of the problem with messages (slippery slope).

Woodley: *How black was the cat?*

Emily: There you've used the construction that says that the wh word is
unambiguously associated to the Matrix clause. To really test that, we'd
need to embed the question in the nominal modifier, which I don't think
English lets us do, except maybe in echo question land.

Dan: This slope isn't slippery: The wh words 'launch' the param-icons,
and the grammar can have constraints on which constructions allow them
to attach (meaning which event variables are available to them).

Last update: 2020-07-22 by GuyEmerson [[edit](https://github.com/delph-in/docs/wiki/OsloQuestionRepresentation/_edit)]{% endraw %}