{% raw %}\[Transcriber: I apologize for just getting a rather 'partial' picture
of what every one said in this session. This is a paraphrased gist of
the original conversation based on my understanding. Please feel free to
modify if you find anything different from what you actually meant. \]

FCB: Recap that in Eng, relative clauses and sentences like "What is
that you ate for breakfast?" require non-local feature 'SLASH' for the
movement of the argument. We read related papers but are still not
really clear about it. The lexical item would say my SLASH is the
concactenation of SLASH value of my arguments, then rules copy the SLASH
values up. Non-local features have SLASH, QUE, and REL. In Chinese, we
also want to pass up the non-local QUE value.

EMB: QUE is for question words in English.

DPF: The question significance comes from punctuation and intonation,
not from words themselves.

EMB: In Chinese the question word information is needed so MA can be
disallowed with that.

DPF: For "a picture of whom", the wh-marker is pumped up the levels.
Wh-marker can come from either head or specifier.

EMB: REL is used for signalling relative pronouns, but Chinese is not
using that. In English we treat QUE as non-local because it can come
from other places than head, to carry up different aspects of the same
phenomena. Like "The guy whose (brother's) book I read ..."

FZZ: In Chinese, it would be "the guy, I read his (brother's) book ..."

GCS: This topicalization is also used in Thai. Is the name of feature
tied too closely to the phenomenon?

DPF: No. QUE should be used when you have non-local question in your
language.

FCB: Not all languages need three non-local features. Now we
particularly want to ask two questions.

1.Why is the amalgamation of information done by lexical items.

2\. In Chinese, we found that more than one slashed values need to be
kept. This leads to two sub questions: 2.1 How to count 'one or more'
for SLASH list.

DPF: It's already hard to get 0-1-list to work, not wanting to try
others.

FCB: Can we ask for append, or length of list, instead of struggling
with diff-list.

DPF: You can, but we need to make sure ACE, PET, and the rest of the
toools all can do the same, but the developers for these tools are very
busy people. And, are you ready to accept the price of efficiency, like
a fator of three?

GCS: It's going to require a lot of theoretical consideration.

DPF: We are not using unification engine, it's procedural. Append has
been requested since 1994. Diff-list is hard to teach and hard to
maintain.

EMB: We want to check the length of the list.

GCS: It would be worthwhile to have a deep investigation of the
machinery required to achieve that.

(FZZ described the attempt to create 1-plus-list and the different
results encountered when the order of the two diff-lists are switched.
She called that puzzling. )

DPF: It's not puzzling. It's a fact with diff-list. It is probably
necessary to make a change to the machinery, to extend LIST to have
APPEND, so diff-list can be dismissed. But this is possibly less
efficient.

GCS: It's going to change the way we think about our formalism.

DPF: It's doable, but with unknown cost, and probably a non-trivial
change (to the existing grammars). Or we have a way to count how many
elements are on the list.

EMB: It's easy with list using first and rest, but not with diff-list.
It's a shared problem, so if one engine can solve it first...

GCS: It's a theoretical problem, not implementational.

EMB: Laurie's coordination work also requires that, for languages with a
need to differentiate NUMBER between duo and plural (more than 2). As a
summary: there is no easy solution, just engineering solution.

GCS: There's an integer tdl feature which could be extended.

FZZ: Question 2.2 is can we redefine SLASH to allow more than one
slashed values?

DPF: Yes, you can.

FCB: Another question, why do the rules extracting comp and subj have
different ways of setting the SLASH value?

DPF: The way used in the extracted-comp rule is the correct way. In
defining an empty dlist, using 0-dlist is not enough, you must say its
LIST is &lt;&gt;.

As a summary, we should change extracted-subj in matrix.tdl, and use ERG
to test whether it affects other things. The symmetry should be resolved
to the complement one, but assigned in the fashion of subj, so it can
allow more than one item in SLASH (redefine it to be diff-list).

FCB: now the question of why using lexical almalgation.

DPF: Verbs are observed with gap, but adjectives usually are not, except
"easy"-like ones. E.g. "The teacher is easy to please." Adjs like "easy"
can have a gap. So lexical entry can control that. Otherwise you'll need
two head-comp rules, one for non-gap, one for gap.

EMB: Stop-gap is described in textbook, but not used in implementation.

DPF: It's not implementable.

EMB: Can we simplify Matrix to two versions: 1. slash list is one, using
lexical almalgation, and 2. slash list larger than one, using phrasal
almalgation. Currently it is filling the one and only gap
crosslingually.

DPF: There's not enough intuition to have a conclusion.

FCB: We had trouble finding all the places in the grammar rules to close
off non-local values.

DPF: We could ask developers to add a well-formedness test.

EMB: Do you want the same type of checking on RELS, which is also a
diff-list.

DPF: That can be done in configuration by grammar engineers, to say
which ones need to be checked.

...

Last update: 2017-01-10 by ZhenzhenFan [[edit](https://github.com/delph-in/docs/wiki/CapitolHillDependencies/_edit)]{% endraw %}