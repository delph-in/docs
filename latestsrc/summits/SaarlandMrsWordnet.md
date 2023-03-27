{% raw %}A page for the discussion of MRS-Wordnet mappings (part of the work on
[Lexical Semantics](https://delph-in.github.io/docs/garage/LexsemTop)).

Motivations:

- want to get semantic back-off in parse ranking
- want to get better tokenization for wordnet annotation (*three-toed
sloth*)
- combine structural and lexical semantics so we can show semantic
compatibility across languages

**Francis:**

- There is a [SemCor](https://delph-in.github.io/docs/garage/SemCor) mapping to DMRS on [SemCor](https://delph-in.github.io/docs/garage/SemCor)
page. There's a long tail of things where the representation in MRS
is different from the representation in WN. E.g. "here" in WN is
here\_a\_1, "here" in ERG (e10:loc\_nonsp = here\_a1; x11:place\_n =
here\_n1).
- Single words are easy, but Zina says if you have the gold mapping
and map to the correct tree in English, then mapping is good. But if
the English tree is wrong then the MRS-WN mapping is incorrect.
- Quantifiers are sometimes in WN and sometimes not, in particular
invisible quantifiers. If we use the ERG as tokenizers, then we are
not using the words but the predicates.

**Ann**: Is there anything useful in monolingual WN for closed class
word?

**Francis**: Closed class word are not in WN but things that have
synonymy and adj like are in WN.

**Ann**: Is there anything useful in the linked WN?

**Francis**: No, the assumption is that closed class words are not in
WN.

**Francis**:

- Complex semantics with decomposed things
  - WN has here\_adv is diff from here\_n, but ERG diff is the
presence of absence of loc\_nonsp.

**Woodley**: All of the EP are there but the not all of them are marked
with the WN tags?

**Emily**: Why is that ideal to map one of the "here"?

**Francis**: We want to "e10:loc\_nonsp = here\_a1" (scribe missed
explanation)

**Ann**: the decomposition only happens in such a way that some of the
things in decompose. You don't need to bother to link to WN but we
should rather characterize the elements of the decomposed things which
are all the things with underscores "\_".

**Francis**: We also don't want to lose info about "hereness", i.e.
"x11:place\_n = here\_n1"

**Slayden**: How many predicates without the underscore?

**Dan**: It's &gt;50 &lt; 1000

**Francis**: WN has very few superlative, things where they are
lexically different. ERG splits this into more\_good, more\_bad. WN has
very little to say about such adjectives.

**Emily**: Is WN producing the same sense for "quick" and "quickly"?

**Francis**: Maybe but they are linked. If there is an example where the
range of senses between adv and adj then we will be losing information.

**Francis**:

- For [MultiWord](/MultiWord) Expression (MWE), both ERG and WN has
gobble\_up
- Then we have the Noun-Noun compound, which we need to distinguish
between "hot dog" as one lexical item and "guard dog" as a composite
Noun-Noun compound

**Ann**: It will be nice to have an inventory where these Noun-Noun
compound occurs.

**Francis**: It's mostly Noun-Noun compounds.

**Francis**:

- For idioms, ERG says it's idiomatic but we don't know how to mark
the sense of the elements within the idiom.
- Then we have coordination, "grass and brown snakes" =&gt;
grass\_snakes and brown\_snakes
- And light verbs? Should we just list them and make entries into WN?
- We're building a token mapper from ERG+WN, where Dan will make the
ERG find compatibility when necessary and Christian (from WN) will
do the same with WN.

Last update: 2013-07-29 by LilingTan [[edit](https://github.com/delph-in/docs/wiki/SaarlandMrsWordnet/_edit)]{% endraw %}