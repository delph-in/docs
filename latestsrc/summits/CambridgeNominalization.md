{% raw %}Semantics of Nominalization

(scribe: Woodley)

EMB: Goal here is clarity rather than closure.

    examples:
    (50)    a. The nominator was thorough.
            b. The nominee was controversial.

Relationships between verb and its arguments and the nominalized word —
the NP refers to an argument. NOT what EMB wants to talk about today

    (51)    a. The confirmation of the nominee sparked protests.
            b. The confirmation of the nominee took several weeks.

More interested in this space.

DI: protests can be ongoing while the confirmation is but — it can be
ambiguous

EMB: when we nominalize, and the NP refers to the event or some part of
the event, that’s interesting. Russian complement clauses that seem
nominalized sometimes involve unexpected case. In Matrix, we have two
options: one with nominalization\_rel and one without. How do we decide
which to use? What does nominalization\_rel mean?

DI: that’s why I’ve avoided it… I don’t know why it’s there.

OZ: literature?

KH: we passed on figuring that out and decided to just let the user
pick.

AAC: Grimshaw says: there’s a (syntactic and semantic) distinction in
English between things that go really nouny and more verby. There must
be some tests, which might or might not work well. "The purchase took 3
hours because the salesperson …." You should be able to distinguish
verbiness on the basis of whether you can drop agents or something
similar. (?) There is some difference in countability of nominalized
objects also. I don’t remember much more.

EMB: Literature tends to be focused on lexical level stuff in English.
Distribution is fairly free. But what about embedded clauses?
Countability is hard to apply. How about entailment?

DI and others: how about coordination:

    ? I want you go to the movies and a hamburger.

OZ: Russian: I saw Ivan’s writing of the dissertation and a deer.

GE: I want a hamburger and you to serve it to me.

WP: I’m not sure we understand the implication of want(x,h) any better
than want(x,y) & nominalize(y)

GE: You might need a theory of mind in your model.

AAC: It’s more of a structural question. Interpretability of want(x,h)
is not particularly worse than that of cat(x).

EMB: And nominalization\_rel(x,h)?

AAC: It doesn’t tell you much, but structurally it’s not problematic. It
looks a bit messy. (some other stuff the scribe didn’t understand).

\[EMB after the fact: I think this is where AAC said that
nominalization\_rel can be interpreted as "no op", i.e. not meaning
anything, and also that we are reassured about nominalization\_rel when
it corresponds to possibly overtly expressed rels like fact\_n.\]

EMB: Motivation for compound\_rel comes from the syntax. In this case
the syntax doesn’t give us a clear clue which to use.

EMB: How about the ERG — you nominalize clausal subjects.

DF: Yes, there’s an asymmetry at the moment between clausal subjects and
complements. That’s partly an artifact of my reluctance to split sb\_hd
into two rules taking different shaped subjects. I could also have a
"scopal subject" head rule, as I do with scopal modification.

    "Mary bothers John."
    "That Mary left bothers John."

the VP "bothers John" wants to know what to grab from the HOOK of the
subject.

EMB: Could you add homophonous entries for such verbs?

DF: There’s enough of them that I don’t like that idea.

EMB: You’re not trying to capture a meaning difference; it’s just a
compositional convenience?

DF: Possibly. There might be a meaning difference, I’m not sure. Verbs
that take either an NP or S complement can sometimes seem to have a
difference in meaning:

    "I believe Mary."
    "I believe that Mary left."

AAC: I want to be annoying about "believe." I think you’re right that
those two have different meanings. There’s also "Kim believes that
proposition." which has a meaning more like "I believe that Mary left."

DF: Yes.

EMB: "The fact that Kim left bothered Sandy." vs "That Kim left bothered
Sandy." — exact paraphrases?

DF: Not sure. "The assertion that Kim left bothered Sandy." is clearly
different though.

EMB: That supports nominalization\_rel, in the sense that it stands in
for "fact".

AAC: Yes.

EMB: Like Japanese こと.

DF: Slippery slope: "I want to go."? "I might leave."?

AAC: Wrong direction on the slippery slope. If we introduce
nominalization\_rel, we want it to paraphrase something. Not the other
way around. Compound\_rel is shaped like prepositions.
Nominalization\_rel is the same shape as "fact that".

DF: Slippery slope: "I doubt Mary left."? "I doubt that Mary left."? "I
doubt the claim that Mary left."?

AAC: The fact that you can do that doesn’t mean you should put it in. If
you \*can’t\* do that, it seems like an argument to NOT nominalize.

EMB: Parallel to "fact" is reassuring. If the syntax forces it (e.g.
adjectives instead of adverbs as modifiers), go ahead and put the
nominalization in. Do we worry about asymmetries? Coordination test is
nice.

DF: "Mary reported the challenge and that it had been solved." I can
coordinate them. I don’t like nominalizing them. It’s a big surprise
that you can’t invert the coordinand order.

DI: Call it gapping/elision and move on?

AAC: Kim enjoys fast cars, strong drink and playing the guitar. The
coordination can in some circumstances imply eventfulness to the earlier
conjuncts.

someone: there seems to be some ellipsis in the "challenge" sentence,
which needs its antecedent — possible explanation for ordering
constraints?

DF: what other tests are there for this beside coordination?

EMB: Adverbial modification? Ann mentioned quantification. We want a
semantic test though, not a syntactic one.

DF: By that token, a nominalization/complementization morpheme is not
necessarily good evidence.

WP: Availability for anaphora?

EMB: I don’t think there’s a difference, because we already know that
anaphora can refer back to propositions.

GE: When we don’t want to commit to the truth, we need to either wrap it
under a scope-taking verb or else in a nominalization\_rel.

FCB: "Destroying the city three times was a mistake."

WP: Can I use a plural pronoun to refer to that? (different opinions
around the room)

DF: "Destroying the city three times was a mistake. They cost too much
every single time."

everyone: sounds terrible.

DF: Should be pragmatically perfect. What’s going on?

EMB: "The three purchases took a long time. They all had a lot of
subitems on the invoice." "The three readings of the poem were
entertaining. They were quite varied."

AAC: "The three runnings of the race… they…". Having the argument there
helps?

DI: Are there nominalizations outside of embedded clauses where we want
to distance ourselves from the truth of the embedded proposition?

DF: "The former running of the race" — can I use a modifier that wants
an X to argue that running should be X-shaped?

WP: The fact that we can’t think of cases where we want to distance
ourselves from the truth of the embedded proposition for subject
position casts some aspersions on the necessity of nominalization\_rel
in those cases.

EMB: "The claim that a unicorn was in the park surprised Kim." "That a
unicorn was in the park would surprise Kim."

EMB: Someone should look at more types of verbs. See if any of them
target ARG1.

WP: Possible claim: never use nominalization\_rel on ARG2’s, and for
ARG1’s, either use the 'e' directly or pump 'e' to 'x' instead of
pumping proposition to 'x'.

EMB: Interesting, but not yet fully supported, idea.

GE/EMB: "I want you to come to the movies." — what do we think about the
scopal position of "the"? (unclear sentiment)

EMB: nominalization that doesn’t mean anything is ok, but we don’t want
to go down the slippery slope of putting them everywhere. If we can’t
paraphrase with "fact that…" we shouldn’t put it in. If we can, maybe we
should but maybe we shouldn’t. How about: "It seems that there’s a
unicorn in the park." ARG1 here is "that there’s a unicorn in the park."
Woodley’s revised claim needs to only apply to verbs where ARG1 can be a
noun.

EMB: Are we done? This conversation stayed relatively low temperature.

DI: Is that a challenge?

KH: Grammar matrix implementation: you don’t get the option of no
nominalization\_rel until the embedded thing is an S. Is that a wrong
claim?

EMB: It should be driven by where you \*have\* to have
nominalization\_rel. At the lexical rule level, it’s easy to say things
about changing the case frame. It’s hard to say whether the claim you
make is right or wrong.

AAC: Should we perhaps have multiple types of nominalization\_rel?
Possibly for excluding resultative? If you underspecify, you should do
so as precisely as possible.

DI: "I want you to purchase the furniture." vs "The six purchases
cluttered the room."

EMB: "purchases" = "things that were purchased".

AAC: In English, one (nominalized) word can have 3 uses, so we
underspecify. If there are languages or cases where it’s just the event,
or just the verb’s ARG1, or whatever, we should be able to say so.

EMB: In (50b) if lexrule produces \[nominate\_v(-,-,x)\], there is no EP
whose ARG0 is x. Is that a problem?

AAC: It breaks lots of things. In DMRS and maybe MRS too.

DF: What set is quantified over?

EMB/WP: The set of things that are ARG2 of a nominate\_v.

AAC: For me, it’s cleaner to make it the same shape as other things. Put
in person\_rel or thing\_rel.

WP: What breaks in MRS if no EP has x as its ARG0?

AAC: I’m not sure it will break. Just a suspicion.

DI: I’ve tried something like this. It works. It scopes.

EMB: We’re done. Thanks.

Last update: 2019-07-24 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/CambridgeNominalization/_edit)]{% endraw %}