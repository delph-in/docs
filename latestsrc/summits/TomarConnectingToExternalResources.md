{% raw %}- matching to external resources
  - string match on predicate is common way of linking to other
resources
  - references Zina Pozen's work
  - For 65% of things, pred matches work well
  - For others, sense info in the pred is sometimes useful
(look\_v\_like), sometimes not (story\_n\_of)
  - does this generalize to: verb preds -&gt; yes, noun preds -&gt;
no ?
  - There are other subtypes of things that require idiosyncratic
methods of matching
  - There are many mismatches, e.g. sg vs pl distinctions (stair and
stairs), which the ERG treats as the same, but WN does not

Discussion

FCB: anybody else trying to link resources

GS: thai language bi-lingual dictionaries, or rather, thai lemmas with
eng definitions

DM: I'm linking the ERG to WN. I have done it before, but not to the
extent or quality of analysis you're proposing

RD: Not external resources, but I'm trying to link back to the surface
form, as have Ned and Angelina....many interesting problems, though a
small subset of your problems

FCB: \*\*Our\*\* problems

AC: How many items in WN have example sentences?

FCB: WN has example fragments (not sentences), for maybe a third. If you
include semcor, etc., you get maybe 60%. Example sentences for a synset
may have multiple lemmas.

TB: Do you annotate at the lexeme level or at the token level (parser
output). E.g. with the chinese or japanese grammars, deverbal nouns
etc., in a lexicon you might need an underspecified assignment it's
either a noun or a verb, or something else. What do you do with these?

FCB: We're working at the token level and in context, but I expect the
mapping to be more than a single predicate, so if we see a verbal noun
and a light verb (e.g. suru in Jpn), we can use that.

LT: Are the senses for preds in the ERG ambiguous?

FCB: Yes, almost always

DM: Like "he drives a tank" or "he fills his tank", tank are the same
pred. Are you looking just at MRS or at the parse as well.

FCB: Just MRS

DM: So verb subcategorizations are in the MRS

FCB: In terms of verbal arguments, yes. So it's possible that "tank of
water" is a relational noun in the ERG and other tanks are not.

FCB: So looking at the mismatches, the interesting ones are things like
"fasten" and "unfasten", where the ERG treats it as compositional "un" +
"fasten"

DM: Going back to the tank example, if you have verbnet, and the verb
"drives" or "fills", will that help disambiguate?

FCB: Disambiguation is another interesting question, but not what we're
doing now.

LT: Why do we have plural preds in the ERG?

DF: We have "he went into the woods", where "woods" has nothing to do
with the singular "wood"

LT: But if you put the lemma names from WN into the ERG, can you get
something from that?

EMB: I think LT is saying taking info from WN, we can get useful
information by putting it into the ERG, whereas the info is lost if we
go the other way around

FCB: ... What about morals? is that like moral? Isn't the plural
different than the singular?

DF: well that's like "principles", yes?

RD: Or "values" ...

DF: If there is really a difference, then maybe the distinction belongs
in the grammar.

oe: In \[...\] paper we actually argue for the opposite.

FCB: The "morals" of this story are: it's a difficult decision and we
should be careful.

AC: This is a problem that lexicographers deal with all the time, and
they don't just decide this across the board. They sit down and talk
about the cases as we do. If they chose to put the plural form in the
dictionary, there's a reason for it and we should take that reasoning
seriously.

FCB: The question of "take advantage of" or even "kick the bucket" where
WN is treating it as a single synset synonymous with "die", but the ERG
is compositional about it, this is where the idea of Schroedinger MRS
(or Quantum MRS because we don't want the cats to die) would be useful.
What do people think... for "Kim kicked the bucket", how many preds do
we want?

oe: At \[..\] we turned on the idiom matching machinery, and I think
that's a good first step. We should make a decision about what we think
is the right result when there's an idiom.

...

FCB: A more compositional idiom, say "take advantage of", you can do
something for your benefit, or exploit, perhaps to someone's harm.. Or
"let the cat out of the bag", where "cat" is the thing revealed, and
"bag" is the secret or veil of obscurity. You can modify bits of it (TB:
let the cat out of the velvet bag)

...

FCB: I had a student who found it very difficult to decide if idioms
were decomposable

EMB: In Bellingham earlier this year, I was convinced of qMRS for
compound names, but i don't see that use case here

FCB: For "i lost my temper", I'd like to have it also as "get angry"

EMB: why? Why do you need both?

FCB: Because I can lose my "hot temper", or maybe for "lose my mind",
you can "lose your tiny mind" and so on, but it still means "go mad",
but the inner bits are modified.

EMB: As long as you're changing the MRS, you can do coordination, e.g.
"go crazy and mind is small"

FCB: But what about the normal form, do we have "go crazy and mind"? Or
do we need idiom rules for the modified and the unmodified cases?

EMB: I still don't feel the use cases you're describing are the same as
we discussed earlier

FCB: For names, yes, the use cases are different, but perhaps I'm not
properly motivating the idiom case..

WP: If you have idioms with qMRS, why not other, non-idiomatic cases,
like "love" and "adore"? This seems like slippery slope

FCB: Yes, we don't want to link all synonyms, but when the paraphrases
have different shape in the MRS.

...

FCB: These thing are facts of English, and they should be encoded. E.g.
to lose one's mind is not the same as to lose one's wallet.

AC: We can do this with different senses of the verb, but I suppose I
don't have strong opinion at the moment about what to do here in
general...

GS: We can say "kick the proverbial bucket"

AC: That's a metalinguistic statement, and if we want to parse
metalinguistic content then there's a lot more to do

GS: "kick the freaking bucket"

...

FCB: Dan brought up sports metaphors, like "hit a home run", which means
to achieve success, or to literally hit a baseball outside the playing
field, so the absolute minimum we want is to say there's a hitting and
homerun, but is this different than "take advantage of"? I don't know
how far I want to go with these, there's always a large gray area of
unclear cases. But in MT we don't always want literal or idiomatic
readings, it changes by context.

AC: If you're doing a standard MT with alignment, you get the phrases
that are translated, but if you're working with the MRS, you get the
ERG's parse, which can make things harder

DF: But in phrases there can be distance that SMT would not capture,
like "the tabs kept on sandy were closer than the ones kept on kim", and
in the MRS they are where they should be, but in the sentence the ngrams
are quite far apart. I don't think it's true that the MRS is always
doing damage to the signal.

AC: Maybe what we need are monolingual transfer rules that convert
things to less idiomatic forms

RD: Aren't we already doing this in MT with paraphrases?

AC: Yes, but we should probably be doing this in the greater delph-in
ecosystem. I want it as part of the infrastructure, an obvious way to do
it if we're going to do it.

...

\*applause\*

Last update: 2014-07-15 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/TomarConnectingToExternalResources/_edit)]{% endraw %}