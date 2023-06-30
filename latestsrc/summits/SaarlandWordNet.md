{% raw %}FB: We've already discussed WN, but I'd like to see who's interested and
what they're looking for, and discuss specific issues

FB: 2 main reasons for doing this:

### improve parse ranking

- Using Goi-Taikei worked fairly well; some but worthwhile
improvements.
- Trying to redo this with WN
- But we had few marked with ERG gold standard

Tim: Of the treebanked corpora, the intersection was very small

- [WeScience](https://delph-in.github.io/docs/garage/WeScience) with wordnet first sense, decent baseline
- We're mapping about 94% of predicates
- Standard semantic dependencies, from DMRSs
- "I treat dogs and cats with worms", dogs and cats have worms, not
treated with them
  - moving "with worms" to link directly to "and"
- wanted to do grandparenting, but ended up just taking long-distance
dependencies (e.g. dogs...worms), turned out it helped
- Adjectives and adverbs not very completely annotated in WN
- parse selection accuracy average \~ 26%
  - using supertypes, up to 28.2
  - oe;fb ... this is a smaller model, some lexicalized features
were thrown away
- Zina's work had little gains on [SemCor](https://delph-in.github.io/docs/garage/SemCor), but small gains on
[WeScience](https://delph-in.github.io/docs/garage/WeScience)

...

Oe: You're evaluating extact tree match?

FB: Exact MRS match

- Trained w/ Mallet comparing all good trees to all bad trees, perhaps
not the best setup
- Feature engineering and supersenses give some gains
- best model got 40% accuracy

### Idioms

- The existing WN taggers do not get MWEs
- If you want MWEs right, you're currently out of luck

Tim: There's the Mark Finlayson that does contiguous MWEs

- Some we get, some we don't know how to deal with
- Liling will try to solve some tokenization problems, then finding if
we want to work off of words or MRS predicates.
  - for English and German

### Discussion

FB: Anybody else want to do things with WN?

Liling: Does anybody know how to deal with the ERG having several
entries for one lexeme, but WN only has two.

FB: It's very uncommon, but it's mostly the frequent English words

Tim: I think the answer is carefully and painstakingly

Oe: It's possible to look at the list, there may be distinctions in the
ERG that are not sense distinctions. E.g. depends -&gt;
depends\_on\_...\_rel, it's possible there's an intransitive use of
depends with a diff predicate. This technique may have lead to an
inflation of predictate distinctions.

....

Oe: You should only be looking at predicates, not syntactic elements

FB: Yes, we are only looking at the semantic predicates

Liling: Does anybody else want to map them besides me (and Francis)?

FB: Woodley tried to replicate Zina's early numbers without success..

Woodley: yes...

Sanghoun: Other languages?

FB: Yes, we're working with Japanese and Chinese, ..

Sanghoun: Is there a Chinese wordnet?

FB: Like Poland, China has many wordnets, but they weren't free.
Annoyingly, a month before we released ours, (someone...) released
theirs. There's some available from Chinese academies, some from
Academica Sinica in Taiwan. If you want ours just ask.

Tim: Are you considering cross-lingual syntactic sense disambiguation?

FB: Yes, I'm doing the cross-lingual WSD, someone is working on
syntactic disambiguation; the idea is to use the linked WN senses. But
we'd like to have more working on it

Tim: The kuchi-wo-hiraku example, you have it sense annotated in
English...? You know the lexical entries in Japanese and English, and
likely they are not the same, can you use that difference to
pre-sense-annotate other alignments

FB: We're finding half of the predicates don't link to anything; they
are so far apart we don't want to make a strong claim initially. But yes
that's why we're looking at multiple languages, so we can try to find
common senses....

Tim: There are some similarities with POS tagging to lower-density
langauges by projection, aligning across things and so on... Here you're
doing it with synsets, etc.. Perhaps the data can be used to bootstrap
such a model

FB: Yes and we're currently doing that.

FB: One issue is that the coverage is far from perfect. We'd like to
know how much we are adding for English for each new corpus; are we
filling the bucket or pouring water into the ocean...

FB: Good news is we're not the only ones working with wordnets, so
things in other areas may expand out.

Tim: Perhaps some triangulation across multiple sense link annotations
can help with aligning things...

FB: We'd like to treat things like "hot dog" as not a "dog", unlike say
"guard dog". Does anybody have any thoughts about that?

Oe: I'd ask: are there diffs that are grammaticised. "Hot dog" I assume
is lexicalized an unambiguous. I don't see how there'd be a
distributional difference in syntax. It could be ambiguated at the SEMI
level.

FB: I'd like to have "hot dog" as a single word, and "hot dog" as two
words in the WN, but we'd almost always select the single word

Oe: We should maintain divisions of labor in these concerns, and decide
how to deal with these situations.

Mike: what about variations, like "chili dog" and "tofu dog"

FB: This just means the lexicon gets bigger, unfortunately.. It'd be
nice to combine them if possible

Oe: Is "Kick the bucket" in there?

FB: No, surprisingly

Oe: It is, in idioms.mtr

FB: Try parsing

Oe parses; gets idiomatic reading

FB: Oh. I parsed earlier and did not get them. Anyway, it's in WN as a
synonym of die.

Oe: These are transfer rules with only something on the input side, and
perhaps we need an output side. We could have kick+the+bucket\_v\_rel

FB: But for "let the cat out the bag" cannot be lexicalized like that.
Or "rack your brain", "rack your tired brain", if transfering to "think
hard", where do you attach "tired"?

Tim: Interestingly, it's listed as "rack" in wordnet... "to rack"

FB: If we do it as post-processing, research suggests we need access to
both the idiomatic and literal meanings, since people can play around
with the words.. True for metaphors, as well.

Liling produces example... e.g. getting paint from pigment... etc..

FB: We may find when mapping that the ERG is missing some
subcategorization frames

...

FB: So when we map, there's often not a 1-to-1 correspondence. I expect
the mapping to show interesting holes---it's one reason to do it. For
those have used WN, the noun part is better than the verb part, verbs
better than adjectives, etc..

FB: Finish with a plea: if people are interested in tagging more data,
I'll put something up on the wiki. We're trying to come up with a small
set of things that we'd like to all annotate together, e.g. Cathedral
and Bazaar, etc..

Last update: 2013-08-01 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/SaarlandWordNet/_edit)]{% endraw %}