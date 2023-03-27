{% raw %}\[See [SingaporeSchedule](https://delph-in.github.io/docs/summits/SingaporeSchedule) for link to slides\]

Emily (questions from slides):

- Are these analyses in fact consistent with the algebra as developed
by Copestake et al 2001?
- If not, should we:
  - Elaborate the algebra to bring them into the fold? (How?)
  - Come up with new analyses?
- \[More generally: How could one go about testing a grammar for
algebra-compliance?\] -- bracketed for later discussion
  - Is static analysis?

Emily: Dan did you want to start with the do-be case, and tell me why
it's not a violation?

Dan: Maybe the less interesting of the three. And the second slide
reminded me that I do walk down a valence list the way you do for
Japanese and Wambaya. If we can agree on what to do there, do-be will
fall into line.

Dan: On the Japanese case. Is it legitimate to talk about the elements
on the valence list of a non-head daughter? That seems to open up a
Pandora's box that we would have a hard time constraining. A logical
next step: If there's a systematic collection of examples where one
needs to go to the COMPS list of something, we may want to enrich the
information available in the HOOK. In addition to keeping track of the
SUBJ property, which we put on the XARG, maybe we should also have an
IARG. It gets messier if there's an indefinite number of internal
arguments. Would be more challenging for
[HeGram/AraGram](/HeGram/AraGram) where there's a large number of these
argument positions. It looks like in these two examples, it's a
complement of something. One step down. So far we've maintained an
asymmetry between the external argument and everything else.

Francis: It's controversially argued that you can also get the second
complement (with variably accepted examples).

Dan: Sounds slippery.

Ann: "The algebra" is a whole question that's in the semantic community
about what the constraints are on composition. If we do need an
indefinitely large number of these things, then that's an interesting
question for formal semantics. It's the sort of thing where one would
need to do careful argumentation and research. Adding one thing to XARG,
but as soon as it's indefinite, then the idea of composition really
breaks, and the idea of compositionality, so that's important. It's not
"the algebra" as such---the algebra is just a way of codifying what
people have been assuming.

Emily: Wambaya needs two complement positions too, I think.

Dan: Are you sure that's the only analysis?

Emily: ...

Dan: The algebra serves to constrain the search space of analyses and a
challenge to come up with arguments carefully if you find you can't work
within it.

Emily: Could do it with shuffle operators.

Dan: Right: we can maintain compositionality in this way, but at the
cost of doing something fancier in the syntax.

Ann: Really in the syntax, or in the parser?

Dan: ... Implement shuffle operator ...

Ann: Don't need to implement the shuffle operator. There's constraints
on how we write the rules that come from the parser and could be
changed.

Emily: To summarize, I think we've come to the following answers to the
questions on the slides.

- No, not consistent.
- Elaborate algebra, if we have just one more.
- Otherwise, look for new analyses, but if we can't find them, bring
it to the attention of the semanticists.

Dan: Even just one more is slippery. As usual I have to agree with Ann
that if we can't do this consistent with the algebra, then it's a
problem for compositionality.

Emily/Francis: But are you saying that Jacy isn't compositional?

Dan/Ann: Not in an interesting way.

Emily: But how is interesting the same thing as compositional?

Ann: There's nothing that constraints the amount of information you can
carry up in the feature structure case. That's why there's been some
argument that compositionality if vacuous --- if there's no constraints
on what you can carry around. You have to have some constraints. The
algebra is one hypothesis about those constraints.

Dan: In Wambaya, you're not really doing that compositionally, since
you're picking up the adjective and keeping it around.

Emily: Local v. global compositionality (see Szabo). I see that I'm not
doing that locally... Well, but sometimes I don't ever find the noun,
and so the semantics you get for verb+adjective is "complete" in a
sense.

Emily/Woodley: Well yeah, that's still locally compositional.

Guy: If you say it's a function of the two parts, but don't constrain
what the function will be, then you haven't said anything interesting.
Ann was saying that by constraining the types of functions, you can make
predictions.

Ann: Just to throw something else into the mix, when you're
incrementally (L-to-R) processing a language like English and making
that compositional, it's like Wambaya. It may well be the case that the
algebra needs to expanded to accommodate this, e.g. with notion of
deferred application of a function.

#### Addendum from Tuesday

\[Not scribed real time\]

Francis: What is this shared notion of compositionality that people
except me see to have?

Dan/Emily: Not so shared --- bring together four formal semanticists and
you'll get four different definitions.

Guy: If the definition of the functions are unconstrained, then the
claim that language is compositional is not compositional.

Nurit: Raises example of phrasal verbs: If you know the meaning of
*look* and the meaning of *after*, you still don't know the meaning of
*look after*.

Guy: You could write a very specialized function that looks for exactly
those two and replaces them with *look\_v\_after*.

Emily: That raises a second constraint that the algebra codifies:
monotonicity. So even if we have to go down the slippery slope of
allowing more things in HOOK, we still have the constraint of
monotonicity.

Last update: 2016-01-22 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SingaporeHookOrthodoxy/_edit)]{% endraw %}