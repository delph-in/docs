{% raw %}# Semi-Useful Models; or, Do We Even Care About Fixed Arity Anymore?

Discussion at the [[CambridgeTop]] led by Michael Goodman; scribed by Kristen Howell (2019).

Participants: Michael Goodman (MG), Emily Bender (EB), Dan Flickinger (DF), Woodley Packard (WP), David Inman (DI), Francis Bond (FB), Guy Emmerson (GE), Anne Copestake (AC)

MG: For some tasks, MRSs must conform to the semantic model to be useful. The model involves several structures, including: variable hierarchy, role inventory, property hierarchy, predicate synopsis.

MG: Automatic generation of the SEM-I is not bug-free

MG: The wiki includes a list of open issues: [[SemiRfc]]

EB: (Re the issue: "Use SEM-I to encode order of roles") Why does order matter? Notionally it doesn't.

DF: Normalization

''Re the issue "Encode HCONS and ICONS..."''

DF: ICONS are contributed by phrase structure rules, not lexical entries

DI: Focus pronouns are topic pronouns

WP: Construction based predicates should be in there to

DI: Who's consuming the SEM-I?

MG: I do. Ace uses it to compile a grammar

FB: Some features are only grammar internal. The semi are the features that we think should be visible from the outside

MG: Can we make the model a curated resource? I'm hesitant to make it something the grammar must conform to; Dan already has to worry about enough with the ERG, but it would be nice if the SEM-I had some status and wasn't just a side-effect of the grammar.

WP: What's an example of something you don't think we could get at

MG: points to some examples where try is a control verb.

GE: Could you have some construction higher in the tree?

EB: Control is best viewed as a lexical property. For optionality, there is a whole other discussion to be had there. OPT is also lexical. But what do we mean by optionality? Doesn't it mean the argument is dropped or that it's not linked to anything in the MRSs

AC: Well it doesn't need to be dropped

DF: That gets vexed because we pretend that English requires an ARG1. So we never say that ARG1 is optional in the SEM-I

WP: It's useful for the consumer of the MRS to know what the pattern is. Eg. with active passive

MG: In the semantic model there are no constraints on what can be dropped. We don't know if an argument isn't valid for a predicate or if it's missing

AC: Origonally we thought that the SEM-I would help here

WP: What are the practical uses of the SEM-I other than predicting what could be generated

MG: Indexing MRSs with fixed arity, composition, validation

EB: Why composition

MG: I want to use it externally to the grammar to construct an MRS directly

AC: So the idea is for it to be useful as an API, so you know what can usefully be fed into a grammar. We've used it for that on and off but it's never been perfected

MG: In the ERG between 1214 and 2018, I noticed some differences: In an example with numbers the ARG0 of plus is an e in 1214 and an i in 2018. Why?

DF: That was intentional. The plus is more like a predication and I'm moving more and more towards treating them as "e"s in their ARG0s

DF: "23 is an odd number" we want that to be an individual. Others can be predications. I suppose I could coerce them into some eventuality so that you never see the i in the resulting MRS (when you have a plus or a times)

MG: If the i is meant to be underspecified, that's fine, but it should be documented
...looking at another example with numbers

DF: I don't know if I have a good justification for that. I don't know if I should be calling that an eventuality (is it a predicate?), so I took a more neutral view

EB: Is predicativeness the test that something should be an eventuality?

DF: It's a convincing test. I need an ARG0 to sew together modifiers

EB: So "very" won't modify a noun, so it needs an event ARG0?

DF: Yes

GE: If we have a model structure for evaluating the truth of a sentence, we can leave it underspecified

DI: But then in can be instantiated as an individual

AC: This is not an easy problem, if we want to return to it, we should give it its own SIG

DF: I've dumped this problem. And now Mike sees why.

MG: Let's talk about the use of 'i' for dropped arguments. 'i' in the variable hierarchy is used for both dropped arguments and underspecification between 'x' and 'e'. This is confusing. Consider a hierarchy with some variable type 'd' between 'u' and 'x' that isn't also a supertype of 'e'.

GE: Or make 'x' a subtype of 'd', which takes the former place of 'x'

DF/AC: Maybe we don't need a new variable type; 'x' can be left unquantified as long as it's not an ARG0 of some EP.

... later, discussing variable-arity with different argument types

DF: Alex L. has always scolded us on allowing arguments of different types to have different predicates

AC: Ann doesn't really care, we can just invent some more names

DF: Should that be part of the external MRS? From where does that arrive?

MG: If it's not in the MRS that came out of the grammar, it doesn't really help. I have to choose it its /HEQ or /NEQ

AC: There needs to be a deterministic way to decide how to add another argument

DF: Constructive take away: we should change the way we check for quantifiers

BC: Caveat, utool is also used for additional well formedness, so we might need to change that too

## A few extra notes from Emily, after the fact:

I think we came around to the notion that the well-formedness check (Ann noted, this is a short lisp function, intended to be grammar-specific) could be slightly more sophisticated. Rather than checking that every x is the ARG0 of some quantifier, it could instead e.g. check that every x that is the ARG0 of anything should (also) be the ARG0 of some quantifier. The idea here is that if there are no predicates that belong in the restrictor of the quantifier, we can assume existential quantification for unbound xes without loss of information. This would obviate the need for the use of i as underspecified x to avoid scope check.

There was some hope in the room (Dan and Francis?) that we could also get rid of the quantifiers associated with non-head elements in compound nouns. Ann pointed out that these normally have a generic interpretation in English, but not always, and the inclusion of that quantifier is a useful place to hang the distinction. Ex: ''the orange-juice seat'', without specific context, is interpreted a chair with orange juice spilled on it or similar. But if someone has set the table with four settings and only one has a glass of orange juice in front of it, then the interpretation of ''orange-juice'' in ''the orange-juice seat'' isn't generic, but in fact concerns the specific glass of orange juice present. [Ann attributed this example to someone, but I didn't catch who.]

Last update: 2021-09-16 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/CambridgeSEM-I/_edit)]{% endraw %}