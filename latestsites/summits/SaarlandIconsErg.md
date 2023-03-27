{% raw %}## Implementing ICONS in ERG and Jacy SIG

Leader: Sanghoun

Participants: Francis, David, oe, Emily

Scribe: Emily

* * *

Sanghoun's starting point:

Russian: Need trigger rules for info-str clitics, but they aren't
working. Not trying to trigger off of ICONS.

English: *I know*; *Kim is a curious student*

ARG2 of *know*, ARG1 of *curious*, *student* are unbound.

Selecting heads are putting in the info-str icons for these, and they
have no value.

oe: As I understand it, you put in an info-str constraint for each
argument in each clause, even when there's nothing the grammar has to
say about that info-str. So the ICONS list will be a very long list. I
had anticipated a mechanism where there was a notion of optionality and
the ICONS would only be used when there was something contentful to say,
e.g., there was topicalization or passivization and the effect is
recorded. For English SVO clauses (unmarked order), why should there be
anything to be said about information structure? I see why what you do
is sound and makes sense, but is there a way to represent the same set
of contrasts and same information with fewer statements.

David: Yesterday there was a long discussion about icons for tense ---
they seem to be generalized well beyond info-str.

oe: If we set things up so that when there's nothing to say we're forced
to say there's nothing to say, at the very least it'll make our
representations that much more unreadable.

Emily: The reasons have to do with composition…

oe: Sometimes I take the position that I don't care about composition
and we should just talk about appropriate output representations, but
maybe this isn't the right place for that.

Emily: How about a post-processing step that removes all uninformative
info-str ICONS.

oe: That has the potential of making everything more complicated,
possibly breaks (or undermines) reversability.

oe: So far it looks like what you're doing is equivalent to putting
binary relations in the RELS list that are forced to have GTOP as their
label. I thought part of the point of ICONS was to be able to allow new
kinds of underpsecification for example absence.

Sanghoun: Original idea of ICONS had to do with binding constraints.

    Kim loves kimself.
    x1   e2     x3
    x1 eq x3
    
    Kim loves kim.
    x1   e2     x3
    x1 neq x3

oe: Why do we need the neq there?

Emily: Binding theory --- this is all we can say.

oe: But doesn't different variables already say that?

Emily: *Kim thinks Sandy loves kim*

oe: Could use eq and possibly eq and a default assumption that when we
say nothing then they cannot be equated.

Emily: But that's much more work than just putting in eq and neq when
the grammar says so.

oe: Now you're using arguments about compositionality to design the
semantic representations.

Emily: I believe that that's what this sessions about.

Francis: Only within sentences then? I'd hate to have to put in the
'possibly equivalent' statements across a whole discourse.

Francis: Segueway: For unexpressed arguments, there would be some people
(e.g., Fillmore) who have classified them into different classes…
definite null instantiation, indefinite null instantation.

Emily: That's info status

oe: Same as cognitive status?

Emily: Yes.

Sanghoun: Want to talk about unexpressed arguments because they have the
constraint that they can't be focused.

oe: Can we go back to the examples and add the example of topicalization
in English:

- \(i\) *Kim likes cookies.*
- \(ii\) *Cookies, Kim likes.*

What do we say about *cookies* in (i)? That it's non-focused.

Sanghoun: Current idea is that focus\_d should be replaced by the
focus-or-topic info-str type.

oe: That sounds attractive because the \_d\_rel eps are no good, and
don't give us the underspecification we want. focus-or-topic ICONS
element: thumbs up. But now in *Kim likes cookies*, what do you say?

Sanghoun: It's underspecified, just info-str.

Emily: Purpose of the \_d\_rels is to allow an underspecified
representation (? not sure how underspecification works here --EMB) so
that from one representation, both topicalized and non-topicalized
variants can be produced, but also exactly one of those can be requested
via the input MRS.

Emily: We can almost do that: *Kim likes cookies* is underspecified,
*Cookies, Kim likes.* has info-str constraints. Can be sure not to get
*Cookies, Kim likes* but as far as I can see right now *Kim likes
cookies* will always come out.

Sanghoun: \[quick description of pitch accents\] but this is hard
because we don't have acoustics.

Emily: And in fact if the input is originally text, there was never any
acoustics, but we could in principle tag ahead of time and then use that
info.

oe: Somewhat akin to what we're doing with markup.

Emily: how did underspecification work with d\_rels?

oe: It doesn't --- don't emulate those. It was back in the message days.
The messages had pseudo ‘roles’ for topic and passive argument --- could
leave those underspecified, but also say which we want or that we want
neither (with anti-variable).

Emily/oe: MRS = Meaning Representation System (not just semantics,
including other information that has a bearing on meaning)

oe/David: RELS = the propositional content, ICONS are a <span
class="strike">hammer</span> a mechanism to adorn that.

oe: We've currently lost the ability to parse an active and get back an
active and passive, and would like to get that back.

Emily: I think we solve the most important part of the problem right now
-- allow underspecification, but able to block the topicalized ones.
Maybe it's not wrong to always output SVO

oe/Francis: Would you take home encouragement to solve the whole
problem?

(Emily: gladly)

David: How is active/passive part of the meaning?

Emily: It's not part of the truth-conditional semantics (unless you look
at the interaction of scope preferences and voice, but that is
separable), but it is certainly related to the presentation of the
information, and that's related to what we're doing with info-str.

Emily/Sanghoun: But the relationship between passive and info-str is not
a hard constraint.

oe: So perhaps information structure is not the right level of
representation for the control we are hoping to achieve.

Emily: My intuition is that the right way to do this in the big picture
is to give the realization ranker information from which it can learn
that topics tend to be subjects and then choose passive when the
promoted argument is known to be a topic. It doesn't seem right to
micromanage the output of the generator on this point.

oe: But we often have the desire to do just that. Don't we Francis?

Francis: What's that? \[explanation\] My first reaction was yes, give me
control. But maybe we don't need to be able to micromanage that.
THinking purely practically, for some of the interface-y things that I'd
like to see the grammars used for now, I can see some scenarios where
you'd want to e.g., never use passive.

Emily: Then you can turn off passive in the grammar for generation…

Francis: For translation my default I want to be able to say active is
active, but in real life I don't. It's sometimes the case that things
will be … hmmm… Occasionally we have transfer rules in the current
system where something that's active in source should come out as
active, but also some specific rules that take active in one language
(for some specific lexicalization? -EMB)

oe: Passive has some function, it's a deliberate choice often. In two
languages where they are used in a similar way, in a translation system
it would be useful to be able to make sure they are the same in source
and target.

David: Shouldn't you be translating the function, not the structure?

Emily: Just because we want to make this general enough to get something
out of info-str marking in Japanese in [JaEn](/JaEn) doesn't mean we
should necessarily make it harder in e.g. German &lt;&gt; English
translation.

Emily: There are constructions in English whose sole purpose is to mark
info-str, but passive isn't one of them.

oe: When all that the grammar tells us is info-str, …. I worry that our
meaning representations will become unwieldy if we spell out those
info-str relations for each instantiated or uninstantiated semantic
role.

Francis: and that feeling I share very strongly.

Emily: Suggestions for what to do?

oe: Injection of non-vanilla statements into ICONS can maybe happen
later (when they are specialized to something interesting)?

Emily: Can't have every construction/lex rule/lex item that gives us
some information do the moving to the ICONS list, because then we might
get double copies.

oe: So the suggestion is to find some mechanism…

Emily: Sanghoun, can you remind me why the selecting heads are
introducing the underspecified ICONS, rather than the over lexical
items?

oe: Don't elements have info-str with respect to all clauses they are
in?

Emily: For a while at least we were maintaining that it is only the
clause in which they are overt:

Sanghoun:

    Kim tries to sleep
    x1    e2        e3
    
    e2 info-str x1
    e2 info-str e3
    e2 info-str e2

Emily: And in relative clauses we have the relative pronoun or relative
clause rule serves to gives us another overt point.

Francis: Why e2 info-str e2?

Emily:

- A: *Did Kim sleep?*
- B: *Kim TRIED to sleep.*

oe: message slippery slope …

Emily: Optimistically sketching an analysis where CLAUSE-KEY an analysis
where elements down inside modifiers and non-finite VPs have info-str
with respect to the matrix clause, including in cases like:

- *Kim tried to hire SANDY*
- *Hiring SANDY was difficult*
- *The \*IBM\* report was late.*

David: what about "The IBM report" --- no clause.

oe: Actually, in the semantics we have an unknown\_v rel.

Emily: One further potential argument for the underspecified info-str
ICONS elements cluttering things up is supporting an analysis of focus
projection.

oe: One could also argue that they should be introduced as they are
needed.

Last update: 2013-08-05 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SaarlandIconsErg/_edit)]{% endraw %}