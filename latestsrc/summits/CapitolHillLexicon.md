{% raw %}\[Transcriber: I apologize for just getting a rather 'partial' picture
of what every one said in this session. This is a paraphrased gist of
the original conversation based on my understanding. Please feel free to
modify if you find anything different from what you actually meant. \]

GCS: When I worked on my Thai grammar, I made a tool to increase the
grammar coverage by putting in lexicon. But Monday's discussion suggests
that we can use controlled vocabulary for testsuits, which allows the
handling of lots of phenomena without worrying about other words.

FCB: MRS testsuites are designed like this for handling specific
phenomena. Every time you make a change to the grammar, you need to run
through the testsuites to ensure no other things are broken.

GCS: I tried with a toy grammar and brought in lots of lexicons using
various resources. The efforts seem to be futile in increasing the
grammar coverage.

FCB: Zhong and Indra started by building in syntax based on testsuites,
but they can only reach medium size without a extensive lexicon.

DPF: MRS is designed to test semantics, but a lot of them are related to
syntax things. For example, "I make Mary do something", it's dependent
on the word "make". I have 1300 sentences in my syntactic testsuites.
They helped to catch a lot of my mistakes. I wish I had constantly
increased that testsuite along the way. Testsuites are critical as
something suprising might happen when phenomena interact with each
other. And it's tricky to answer how many words should be in your
testsuite.

GCS: Big test suite may distract you from your analysis.

DPF: Yes. You might be tempted to fix bugs you find immediately. In CSLI
testsuite, we control the vocab, but also try to make sentences sound as
natural as possible.

GCS: Maybe I should systemize a procedure to incorporate things into
testsuites.

DPF: One way is to have one sentence illustrating one interesting
phenomenon. The competing goal is to put as many phenomna into a
sentence as possible, since regression test is expensive. But that
requires careful debugging when that sentence (containing multiple
phenomena) fails.

FCB: What about our effort on using lexical database to add example and
comment to lexical types?

GCS: We may create a tree for testing. Each leaf is a sentence with one
phenomenon, and the nodes are sentences with multiple phenomena, created
from leaf or nodes below. Then we can just run test at the root.

FCB: For a sentence with 8 phenomena, we can run test on its sub
sentences.

XPG: It would be hard to make a sentence with just one phenomenon.

GCS: There is a useful book "Dictionaries: The Art and Craft of
Lexicography", by Sidney I. Landau.

WDP: My suspicion is that it might be hard to keep the lenth of the
sentences low when you go up the tree. It might be worth doing. You can
replay the derivation to blow through the 100k quickly.

DPF: There's a way to speed up. We can store the derivation and replay
those, which requires much less time. If I have broken something, it
will tell me, then I can focus on those sentences. But for negative
sentences, you don't have derivations to replay. You need to manually
curate your testsuite. You may make sure the negatives don't parse, or
be aware that they parse due to other reasons and you are fine with
them.

GCS: We need to avoid a grammar that allows everything. That's why we
need negative examples.

DPF: Testing is to see if things are reasonably healthy or there are
obvious problems. Sometimes we also need to see charts to see what edges
go in there. Root conditions save you from embarassment, but not from
unnecessary computation.

GCS: Can the mechanism be made to check the failure of the negative
examples?

DPF: Maybe we can store the previously happened failure (generated
ones), which have been fixed later and therefore disappeared. If they
appear again, something is wrong.

FCB: Question about the CSLI testsuite: how often do you treebank them
when you are frequently changing the grammar?

DPF: Everytime. At least once a day.

GCS: With traditional packing, you know the number of derivations. We
can check that number, too.

FCB: I think we need to do more regression test. We used to do that
regularly but not much treebanking.

DPF: It's still useful to test even without treebanking.

FCB: The small test suites need to be checked regularly. For larger test
sets, we need more vocabulary. I want to discuss different approaches of
entering lexical entries. When Dan adds a new word into ERG, he makes
sure all its lexical types are entered. Whereas since we wanted to get
more coverage quickly, we found it useful to have offline unknown word
handling by importing from resources. Then we go in to fill in the gaps,
finding a missing lexical type, then bring in more words of that type.
What's your current practice?

DPF: If you have a rich resource, you can use the second approach by all
means. We didn't have that in early 1980s. It's still not an option for
English (due to copy right issues). We then built our lexicon by hand.
The other thing is, I put in the ones I'm interested in by hand. Then I
let the tagger help me in dealing with the rest. As soon as one lexical
entry exists for that stem, I block the generic entries. It might be
better for you to allow the tagger to give more information about a stem
(as additional to its existing lexical entry), as this might be real
ambiguity.

GCS: You could fall back on the tagger based on its confidence value.

DPF: A coarse tagger can still give useful information for an incomplete
entry, which can be good enough for parsing, with slight
over-generation. You can be a little permissive in the properties of the
generic entries.

GCS: I use a hybrid approach to get interesting words and their
concordance, then eyeball to see interesting patterns.

DPF: I doubt it would be helpful to have a predictor of fine-grained
subcategory of lexical types.

FCB: How is generation for unknown words?

DPF: we made it work in 2014.

WDP: There are two categoreis of unknowns. One type is names with CARG
as unknown. ACE can generate this. The other type is real unknown words
with PRED containing an "unknown". ACE can't generate that. CARG and
PRED values are treated differently. We need a solution that will work
across grammars.

DPF: Maybe we should stop packing things into predicate names, so
unknown word mechanism can drop the orthography into the right spot.

WDP: You'll have to handle the semantic indexing for unknown words.

DPF: We don't have a way to say surface string is "sought", which is the
irregular past tense for "seek". We need morphological analyzing module
to put that in predicate.

FCB: An external tagger can give lemma, then we pass this information to
the system.

DPF: There may be ambiguity like "revered" as "rever-ed" or "revere-d".
This is orthographic ambiguity. May be Francis side can come out with a
specification of what things should be.

FCB: Your view will be different because of the language you are working
on. Irregular things can be listed. Let's assume unknown words are
regular, then we can rely on normal morphology.

GCS: Delphin has modularized pipeline.

DPF: It might not be easy to list all irregular things. The tail is
long.

FCB: If we do this, we'll get to the words that are unknown and
irregular and rare.

WDP: We have general morphological rules, in most cases. The morphology
make guesses. We are computing that morphology already. It seems silly
to throw them away. We can make this information accessible to the
generic entries. The issue is we create PRED names through regex, which
happens before morphology.

FCB: Great. With the information from both the tagger and the mophology,
the problem can be solved.

DPF: We want to take orthography of stem as a first class object instead
of using regex. It requires radical change of codes. I originally want
unknowns to have fancy predicate name, then postprocessing can fix
things.

FCB: For a langguage that has external morph analyzer, we can slightly
change the interpretation of YY mode to give the STEM for inflection
rules.

DPF: What do you do with multi-word proper names?

FCB: It's quite inconsistent. We may have multi tokens.

GCS: I tried to extract Thai names. I can take some surrounding context
and glue them (the tokenized ones) together. There are different
word-breaking philosophies. One is maximum agressive breaking, to make
the tokens as small as possible. I take that approach. The other is to
favor longer token. I have multiple hypothesis going into chart mapping.

WDP: Uber-tagging could be useful for that. It does this without
pre-committing what tokenization is.

FCB: Both character-based and word-based tagging have been used before.
And it (character-based) did lead to exponential chart building.

Last update: 2017-01-11 by ZhenzhenFan [[edit](https://github.com/delph-in/docs/wiki/CapitolHillLexicon/_edit)]{% endraw %}