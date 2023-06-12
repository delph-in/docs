{% raw %}RSA is a framework for doing pragmatic reasoning using Bayesian
inference, starting from truth conditional semantics.

[article](https://www.sciencedirect.com/science/article/pii/S136466131630122X)

Toy examples, with very restricted possible things to say. Interested to
see if DELPH-IN tools could help with scale-up, because we can produce
truth-conditional semantics at scale.

Combinatoric explosion: Pragmatic listener needs to consider all
possible meanings of all possible utterances in the circumstance for all
possible threshold values. Also used in disambiguiting scope ambiguities
(also in toy example with two interpretations of one utterance; not
cases where there's 1000 interpretations of 1000 utterances ...
1000^1000).

Guy's work rsa-latent (github) bypasses that issue by leaving the
threshold variable as latent for everyone --- the literal listener and
speaker too, so they don't have a shared common ground hidden from the
pragmatic listener.

Emily: Is there not room for shared common ground between the pragmatic
speaker & listener?

Guy: They need to have the variable there in order to do inference over
it.

Jan: Why isn't the pragmatic listener conditioning on things other than
the utterance?

Guy: They have priors as well. \[Look at Fig 5 in the RSA paper with
height & threshold prior & posterior.\]

Emily: I have a hard time with null being 'true'.

Guy: It's there because there's only fixed things you can say and if
they're all false, you need saying nothing so you don't divide by zero.
That gives you an action that is 'true'.

Emily: Still weird. If you don't say anything you haven't said anything,
you haven't said anything false, but that doesn't mean 'it's true'.

Guy: !true = false.

Emily: Is there any reason to restrict the number of things to say aside
from keeping it tractable?

Guy: No.

Emily: But is this something that can scale?

Guy: The math can scale to an unbounded range of utterances, it just
gets computationally tractable.

Jan: Speakers don't choose from infinitely many referring expressions.

Antske: Right -- common ground helps with that pruning.

Guy: They do talk about listeners inferring both meaning & what the
speaker is talking about. "$1000" could be either the actual price or a
way of expressing how the speaker feels about it. Impressive how much
they can cram into that small toy model, actually. There's definitely
scope to scale this up with the ERG.

Guy: Even in the small model, they sometimes get unintuitive things. The
null utterance is sometimes used for really weird things they wouldn't
have expected. Kind of an artifact of how they use it.

Emily: So what kind of world model would the ERG be paired with? Maybe
Alex's shape world stuff?

Guy: Referring expression for objects in the picture, or multiple
pictures to distinguish. Maybe easiest: One picture with many shapes,
identify one of the shapes.

Emily: And then choosing among pictures as a next step.

Guy: Both would be more interesting than this --- number of possible
utterances is unbounded or with a very high bound. But most utterances
available would be irrelevant for most situations.

Emily: And going even more open domain, what about RTE?

Antske: I was interested in this from the other direction, because we're
doing to cross-lingual event coreference. Looking at corpus of mostly
(alas) violent events --- looking at different articles about the
events, and seeing huge variation how it's described and even what is
directly described. Reports never directly say how many people are
wounded, but rather how many end up in hospital / get treatment.

Guy: You'd need quite a detailed world model (only go to hospital if
injured, sick or visiting someone who is, need to assume here the people
weren't visiting).

Antske: Different project built an inference model for financial news,
e.g. if you're fired you were working there before. Working on this for
Dutch, in context of project for Dutch for [FrameNet](/FrameNet) looking
at specific domain & situations, but a lot of variations of those.
Requires shared knowledge, common ground, pragmatics.

Guy: So scaling up not just the language but also the world model.

\[...\]

Guy: The way they assume the common ground between the literal speaker &
literal listener the literal speaker is only optimal once it's chosen.
But if you push it up and say they don't assume the common ground, then
it can be actually optimal.

Emily: Is there scope somewhere for degree specifiers. Examples like
"not very tall". Anything in Alex's world?

Guy: I don't think he's put it in but his system is modular &
extensible. Above/below ... far above/far below.

Antske: Researcher at Berkeley using NN to learn meaning of prepositions
-- 2003, 2004.

Emily: Is there presumably a dataset?

Antske: I'll have to look a little bit... (Found it: Terry Regier
(1996). The human semantic potential: Spatial language and constrained
connectionism. Cambridge, MA: MIT Press. and other work by [Terry
Regier](http://lclab.berkeley.edu/publications.php).

Guy: If you could find it, that would get interesting.

Jan: Would it be possible to expand the list of possible utterances from
a predefined fixed set so the model reasons over more complex sets,
without having precise training data available?

Guy: The framework doesn't require training, given prior and set of
states. The part that might require training is learning to do the
search efficiently, trying to make sure the system doesn't keep
producing new possible utterances without limit.

Emily: Use a NN to generate a few things to say, but not all of
them---basically try to reason over a sample of the things that one
could say rather than all of them?

Guy: Alex's system generates a world and then samples over things to
say. That's the step that could be learnt. Given the world, how do we
generate candidate utterances?

Jan: You can learn a good distribution over candidate utterances that
doesn't include the reasoning step. Things people are likely to say in a
given context, and then you do a reasoning step.

Emily: I wonder if we should go one step back and give the speaker
communicative goals?

Guy: This model requires that.

Emily: If I've got it right, the model requires that the listener
assumes that the speaker has goals. But in terms of generating our data.

Jan: So a multi-step dialogue.

Guy: Could be one step, like the speaker has to describe the image to
the listener who could pick it or draw it.

Emily: Reminds me of the map task corpus, the frog story and somethig
from ?SCiL where they had two artificial (NN) things communicating so
that they could study what the system learned. (Citation for that last
one:
<https://aclanthology.coli.uni-saarland.de/papers/P17-1022/p17-1022>)

Angie: Reminds me of a game where one player has a VR set and can see
part of the puzzles and the other ses the answers but not the puzzles,
and they have to work together to solve. Game is "Keep talking and no
one explodes."

Guy: Also more work by Jacob Andreas:

- <https://aclanthology.coli.uni-saarland.de/papers/N18-1177/n18-1177>
- <https://aclanthology.coli.uni-saarland.de/papers/D16-1125/d16-1125>

... we can differentiate from that by using the ERG because it has truth
conditional semantics, which is needed to scale this up.

Emily: Are you imagining using the full DMRS or just snippets?

Guy: Depends on the task. With "Al is tall", there's only one referent.
With the shape world there are multiple referents. In Alex's work he's
looked at quantifiers.

Emily: Woodley also has a demo that has quantifiers and shapes.

Guy: Similar in that in both need to go from \*MRS to a more
conventional logical form that you can directly evaluate. In Alex's
work, each lexical entry has both DMRS and the domain specific
representation, including a way to model vague predicates like "to the
left of" -- definitely true in some region definitely false in another,
and unknown in the rest. Main motivation is to create a dataset rather
than a semantic model. He goes for the clearly "to the left of".

Emily: Maybe it would be interesting to put some of the silly ones in in
the pragmatic inference case.

Guy: Would need to model the left-of or above as gradient judgments.
Taking shapeworld adding a small amount of noise to it... speaker &
listener both observe the world with some noise. Generate the exact
world, add some noise to it, and the present slightly different ones to
speaker & listener.

\[Talking about language games without shared goals.\]

Emily: That puts me in mind of the Settler's corpus.

Guy: I expect that data to be quite messy, about halfway to the
realworld data Anstke works on.

Jan: I'm also interested in a situation where we're generating e.g.
restaurant descriptions from structured data ... "This is a high-class
French restaurant"

Guy: So you want to communicate that by implicature.

Jan: I want the listener to interpret it the same way they would if they
were looking at the structured data.

Emily: But with inference on the part of the listener?

Emily: In a different angle, are there applications here for coreference
resolution?

Guy: The coreference would be latent variables. The pragmatic listener
is doing inference both over the world state and that coreference. "This
expression must refer to that object, because if they wanted to refer to
something else they would have said something different."

Emily: Are there any pronouns in the shapeworld data set?

Guy: I don't think it's there at the moment.

Emily: You'd need long complex descriptions...

Last update: 2018-06-22 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/DiderotRationalSpeechActs/_edit)]{% endraw %}