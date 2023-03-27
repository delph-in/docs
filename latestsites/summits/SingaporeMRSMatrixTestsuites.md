{% raw %}Sanghoun: This discussion is about MRS testsuites. First an overview.
Most know that it is a multilingual test suite (shows on the Matrix
website). We have a bunch of languages here. Let’s see an example (shows
Russian example)

Emily: Two letter codes should be changed to 3-letter ones!

Sanghoun: Originally we had 107 sentences in English. Also some other
languages are represented (Hebrew, Vietnamese, Korean, these are the
most recently added and will be updated soon) There is a number of
issues that we get. For example in Japanese this sentence corresponds to
two sentences (shows on the website), both grammatical in Japanese. Or,
in Russian, there is no copula.

Are there other languages that I missed?

(silence)

Sanghoun: Maybe not

Dan: Portuguese?

Sanghoun: here

Melanie: Arabic?

Dan: ?? (something related to Hebrew update)

Sanghoun: These are general tools that we use (shows on the website) And
these are the issues that we have: we need intended readings for the
sentences, esp. ambiguous

Dan: there is an answer to that in the ERG treebank

Sanghoun: it is difficult to use this system directly outside of this
group and we want people to be able to do that

Dan: I see the point

Sanghoun: This system is very nice in terms of multilingual parallel
testing For example Cantonese sentence \#5, ditransitives are not used,
so this (shows) sentence is ungrammatical. Maybe we can have another
sentence here whose translation is close to this one Also, hand can be
used instead of give be

Dan: You can’t say “I handed the book”

Sanghoun: For example, “barks” in Chinese, this verb in Chinese is very
ambiguous. Currently in the Chinese test suite we are using a different
verb instead of this other “bark”, but it does not directly correspond
to the English one and then gloss. This “le”, is a hot topic in chinese
linguistics. There are two “le-s”, sentence-final and verbal, and the
semantics is very different. We probably need a gloss in the teststuite
to show the meaning of the “le”. We also have some uncovered phenomena,
i.e. phenomena, like classifiers, that are not covered in the
testsuites. The choice of the classifier depends on the meaning of the
noun. This should be covered with additional test sentences. Then
verification. It was originally developed by ???, and then at NTU we had
a few native speakers, and they had some disagreements about
grammaticality. We need multiple native speakers for all languages.
(shows table Cantonese again) this table does not cover fully the
phenomena.

Melanie: why not use XML? It is easily convertible to tables.

Sanghoun: that is one of the options. It is similar to Melanie’s
discussion topic, it is about documentation issues.

Guy: Why not use XIGT?

Sanghoun: Great idea!

Emily: let’s clarify what the purpose of this wiki page is. This is
useful for someone who wants to understand the Mandarin grammar better,
for instance? Then displaying IGT is helpful. And yes, if go XML then go
XIGT.

Sanghoun: we do have IGT files for several languages.

Mike: there is a XIGT to incr() tsdb profiles

Emily: I want to know where that is! I was about to write one

Tuan Anh: ??? still use optional brackets, we cannot parse a sentence
with the brackets

Dan: what is recorded in the entry we have a pair with the brackets and
one without.

Tuan Anh: The second problem is the translation is very weird. In the
English sentence the tense is very clear

Sanghoun: that’s the intended reading, within the context. We need a
description for each sentence.

Dan: Should we be recording the MRS along with the verb properties in
XIGT?

Emily: XIGT is extensible

Mike: Yes, it is possible, we can talk about it later

Dan: I don’t think it will help this instance about barks and is barking
though because this is the enldless interlingual problem, whether the
speaker believes it to be true or not true, likewise the aspectual
differences, there will always be distinctions between languages, maybe
language A has more information than language B in terms of semantics

Tuan Anh: this is so strange “my cat barked”

Dan: But you can have a cartoon where a cat barks, I don’t believe there
is a language in which it is ungrammatical to say “cat barks”, even if
there is no such a cat in the whole Vietnam, it is still a grammatical
sentence

Emily: How much do we care if it’s funny but still working?

Dan: Is one of the issues on the table that we as a committee come up
with a solution to make better alignment, but why are we so obsessed
with this particular 107 sentences?

Emily: What was the original purpose?

Dan: We wanted to build a quick test suite to be able to check that we
haven’t lost something important after we changed the grammar. I now
have a 15 year history of using this test suite, so it makes sense to
continue to use it for me. It is a great idea to extend it though. It is
perhaps not so important that the idiosyncrasies of English aren’t
reflected in other languages. Perhaps we can take more of a Matrix
approach here, but that is a different enterprise. I as a grammarian
would be happy to try such a test suite if someone came up with it. I
don’t want to lose this pairing, bet generally English phenomena should
not dictate anything.

Hans: there are other things that are Cantonese specific, why not make a
monotonic extension

František: In descriptive linguistics, we often don’t get one-to0kne
match of sentences

Dan: it is good to have context

František: Second testate that compensates

Francis: some issues simply arise from taking one thing and using it
with something else, maybe we should use another name

Francis: people like to have culturally relevant names so sometimes we
get weird translations. It is good for training an MT system

Dan: if thats the case, then we should should give up on personalizaion
and use names that are culturally appropriate anywhere, let’s back off
to something unobjectionable

Emily: or you can just go through and replace all the proper names first

Francis: Ann1 Ann2, Ann3…

Hans: there are many sources of translation errors

Guy: is there a reason we need proper names?

Dan: we can stick with common nouns. We might want to have one sentence,
just to see what the grammar does, it is just a phenomenon, it doesn’t
need to clutter the test suite just move away from proper names

Francis: what are the most stable words across languages?

František: if you replace proper nouns with common nouns, then what
about definiteness indefiniteness

Dan: you change one problem to another

Francis: if we want to have a test suite for MT, should it be separate
from the MRS test suite? One of the adv of doing it this way, we don’t
need a central coordinator, you don’t have to wait on someone

Mike: it would be nice to have some metadata about each semantic
phenomenon

Francis: we started doing it and stopped

Mike: currently there is numbering for the items, and what if someone
wants to put more than 10 variations? numbers are not scalable

Emily: but would someone want more than 10 variations? Dan, would you
want to contribute?

Dan: I must have done it twice along the years, let me see if I can dig
up annotations, if not I can make them. Ann gave me another 12 or 13
(sentences?) to see if I will adopt them, and I didn’t Useful objects
are stable, they have a bound. If I use new objects all the time, what
am I learning? In every language there is need in a powerful test suite,
that is a different purpose than the MRS test suite. The MRS test suites
continues to be very useful to me, it is cheap to run and is very
precise. We need to be clear about the purpose about this new object, we
need to define the use case very clearly.

Sanghoun: We discussed DELPHIN promotion etc. I think the test suites is
our strong point. I met ?? in Kyoto, Japanese linguist, and he is
friendly to compling. Language CoLLAGE has Miako (?) grammar, we showed
it to him, but he cannot understand our system. I then showed him the
test suite, and he was very interested, because it had documentation and
linguistic explanation. This is an important contribution that we can
do, make out test suites visible to other linguists. These sentences are
totally parallel. We can also use Speckled Band texts in many languages.

Dan: My idea is (because I am lazy) to persuade NTU to suggest a 100
sentence suite which do a cleaner job and address the issues raised, no
cultural references etc., add slots for classifiers, show it grammarians
around, and use that as a public face of our dolphin work, rather than
try and push this old work. It had a different purpose. Should make a
new, more sensitively designed resource. It should not take too long.
Take any of these things, or put something else in their place.

Francis: One possible extension to this excellent idea is to have the
unit to be an MRS and not a sentence. If one MRS has two realizations,
we can include both.

Dan: So that pivot point is at MRS level.

Francis: This can be a bit fiddly?

Dan: Can solve some problems and create new ones. Having English there
is important as a pseudointerlingua

Emily: Does NTU want to take this on?

Francis: Noone said that! :slightly\_smiling\_face:

Last update: 2015-08-12 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/SingaporeMRSMatrixTestsuites/_edit)]{% endraw %}