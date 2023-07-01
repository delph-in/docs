{% raw %}*Partitive Case*

Present: Olga (OZ), Antoine (AV), Berthold (BC), Kristen (KH), Emily
(EB)

OZ: In Russian “how many” questions, you must use partitive case on the
noun, frequently but not always syncretic with genitive.

BC: Do numerals generally take that same case?

OZ: Yes. Same with “many”

OZ: Partitive case not okay in place of accusative in positive
sentences, but it is allowed in negated sentences (but optional —
accusative still okay).

KH: What about “Ivan sees no books”?

OZ: You can’t do NP negation like that in Russian. Can do double
negation: “Ivan doesn’t see not a single book”. In that case, partitive
is required. (Same as “how many” again.)

OZ: There are lexical classes of verbs that allow more. Drink can take
partitive on its object where it means “some”. But not allowed by e.g.
see.

EB: Trying to construct a plausible context for “Ivan sees tea-PART”
involving looking at a partially obscured hillside of tea trees.

OZ: Still ungrammatical.

BC: Meaning difference?

OZ: With accusative, all of the tea. With a partitive, some.

EB: Is there an interaction with aspect? As in “drank some tea for an
hour/\*in an hour” and “drank the tea in an hour/\*for an hour”

OZ: Yes, like that.

KH: Can you get imperfective?

OZ: Partitive makes less sense with imperfective, but you can construct:
Every day, he used to drink a little bit of tea.

OZ: So is this part of the grammar?

EB: How about a lexical rule, restricted to specific verbs, that says
object isn’t accusative but rather genitive and adds the “some of”
meaning.

OZ: Analysis: Two bare-np rules: Mass noun one doesn’t constrain case,
but non-mass nouns only for non-partitive case.

OZ: Didn’t get to modeling partitive with negation. Currently allowing
“he sees tea-part”. Not modeling diff between see and drink.

EB: So right now you’re allowing all transitive verbs to take gen
object, even if not negated?

OZ: If it’s a mass noun.

EB: This doesn’t happen with count nouns?

OZ: Disallow partitive of count nouns in bare NP.

EB: Okay, so let’s think about how to do this with negation. Simplifying
for now and say that the complement of drink must be part+acc, but the
complement of see must be acc (if not negated).

OZ: Except with the modifiers, like “how many”?

EB: I think those ones are relatively easy: Can have the NP be \[ CASE
acc \] while the noun inside is \[ CASE part \].

EB: So, negation — how does it work?

OZ: Negative adverb that goes before the verb, even if there is also
“nobody”, but other adverbs like “today” can intervene.

EB: Ok! So a special rule that does V -&gt; Neg V, where the COMPS on
the mother has \[ CASE part+acc, INDEX \#same \] as the first element,
and the daughter is COMPS &lt; \[ INDEX \#same \], … &gt;. Would need a
separate one of these for intransitive verbs.

BC: Or argument composition?

EB: But that would be inefficient — Wambaya grammar ran into that
problem. Also, this is always neg first, not free order.

BC: But Adam P writes about long-distance genitive of negation in
Polish: I didn’t want to write letters-PRT. I didn’t want Mary to write
letters-PRT.

OZ: Yes happens in Russian too.

EB: Okay, so then look at what Joshua Crowgey does for two part negation
to allow the adverbs to check for presence of other negator (or vice
versa). Can probably generalize that.

BC: Or there is Adam’s analysis which probably involves argument
composition…. in which case the Neg+V analysis from above would still
work.

*Moving on to pragmatically determined word orders*

OZ: Right now the Matrix allows free word order, but doesn’t do the
pragmatics.

EB: But can’t you combine with that Sanghoun’s library?

OZ: Works to an extent, but not completely. For one thing, this example
involves a ditransitive verb, not yet supported in the Grammar Matrix
customization system. And there’s nothing in Sanghoun’s library for
ditransitives.

BC: How does free word order work in the Matrix?

OZ/EB: head-subj, subj-head, head-comp, comp-head.

EB: Oh, need head-2nd-comp and 2nd-comp-head too, which Sanghoun
wouldn’t have added yet.

EB: What info-structure is going on here?

OZ: Assume that with neutral prosody topic-background-focus.

\[EB was talking too much to take notes.\]

OZ: If I pursue this, is there any way around a gazillion rules?

EB: The other thing is what Berthold hinted at was mixing around the
argument lists.

BC: The German’s prefer that, because thanks to argument composition,
the extra rules are often reaching into underspecified lists and the
processing blows up.

OZ: And what to do with the interaction with prosody?

EB: Ask Sanghoun…

BC: Again the German literature has lots of argumentation about the
interaction with e.g. complex quantifiers… it’s not hard and fast.

EB: Agreed. It quickly seems like the kind of thing where maybe
unification is not the right tool, and we might want to say less rather
than more.

\[BC: More complicated German data…\]

OZ: Getting ambiguity with all these rules not with the ditransitives,
but with the simple transitives I get extra parses.

\[Explore some parses & rules jointly\]

EB: Problem seems to be that the FOCUS-SAT and TOPIC-SAT information is
getting lost, probably by the wh-ques rule. In fact: you probably want
that rule to require \[ FOCUS-SAT — \] on the daughter, and to make the
wh word the focus. And then underspecify between topic & bg…

BC: Main value of this is probably in generation, where you would need
to choose a good ordering based on at least partial info about
information structure. In parsing, it seems a long way off, unless we
learn how to work with actual speech data…

AV: Why is it more expensive to use lots of phrase structure rules
rather than reordering the arguments?

BC: It has to do with argument composition. The worst case in German is
partial VP-fronting. Have to combine the auxiliary that doesn’t know
anything about its complements with complements. Burden is on the side
where you have the least information. If you do the permutation on the
lexical lists (on the lexical verb), that’s the one that combines late.

Last update: 2019-07-17 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/CambridgePartitiveCase/_edit)]{% endraw %}