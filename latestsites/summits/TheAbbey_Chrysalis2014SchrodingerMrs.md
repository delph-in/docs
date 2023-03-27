{% raw %}## Schrödinger's MRS

Francis: Looking for one packed representation of the Secretary of State
the compositional phrase and the entity.

oe: Not ambiguity, but vagueness?

Francis: Neither --- both at once. Quantum.

Woodley: Can't it just be both?

Francis: Knowing that they overlap could help with the generation task,
so we don't generate Secretary of State twice. Want to mark one as main
one as sub/one as opaque and one as transparent. Maybe CFROM/CTO will
tell us they overlap.

Woodley: Probably always want to get rid of the opaque one for
generating.

Francis: Do we want to mark things as transparent or as opaque, or just
the opaque.

Woodley: I think everything is presumed transparent unless marked
otherwise. Interesting question is how to relate the opaque ones to the
bits of the transparent ones…

\[ Topic picked up again later in the morning \]

Francis: Back to the modest proposals and overlapping representations
co-present in the semantics. Do we have a good way of distinguishing
them, or can we just wait for you to come up with one.

Ann: In what sense of distinguishing them?

Francis: Secretary of Defense: done compositionally, and the gazetteer
says there's an analysis of that as a single entity.

Ann: Yes, parallel parts of the semantic lattice or something. If you
think about this in general, you can always take all of the different
analyses that the different analyses from the forest, and pack them into
a single lattice.

Francis: In that case, my interpretation is not that two of them hold at
the same time, but that I just haven't made a decision as to which one
I'm selecting.

Ann: Yes. I'm suggesting giving up on single semantic output for single
syntactic analysis assumption. But how to distinguish between them? In
some cases, the syntax will distinguish between them.

Francis: Which them?

Dan: Those two candidate analysis.

Francis: I think we're arguing that they're both true simultaneously.

Ann: I agree that they're there simultaneously, and in many cases you
don't need to choose.

Francis: If I'm generating, I'd like to generate only a single S of S.

Ann: If we're getting these things in the case where they're producing
the same strings, can arbitrarily choose one or the other of the
subgraphs to generate from, and it won't make a difference. Could work
mechanically.

Dan: Do we get a differentiation if we look at the conjoined one: *The
Secretaries of State and War*. In that case I can't use a single entity,

Francis: … unless we do some extra processing.

Ann: Do we get the entities out of there?

Dan/Francis: We were hoping to do so, via some additional magic. Going
to need two secretaries.

Francis: If we're doing NEs through trigger rules, then we have
mechanisms for forking.

oe: By moving NER to the MRS level, we thought we'd have a better handle
on doing this kind of thing.

Ann: Will have to think about that example. Not sure I can see how the
parallel analysis idea will work in that case.

Dan: In practice, we'll need some as-yet specified additional machinery
in order to be able to hold that dual view. In the near term we'll have
to fall back to the decomposed representation for generation.

Ann: Might not get the most compact one.

Francis: It's not wrong to generate that.

Woodley: It's more helpful than the user asked for, getting to *The
Secretaries of State and Defense* if they gave you S. of State and S of
War.

Francis: I don't want to generate *The S. of State the S. of State
left.*

Woodley: You won't, it's ungrammatical.

oe: There's only one x.

Francis: And it's not a problem to have two EPs with the same char
variable?

oe: Currently it is. We're talking about a bright and rosy future.

Francis: Checking that the bright and rosy future is well-formed.

Dan/oe: What about *the S of State of State*.

Ann: Two parallel subgraphs/lattice-y thing. Pick one and generate.

Woodley: Not yet clear where the opaque version comes from in parsing.

Francis: My view is that the current idiom machinery could be adapted to
throw in a new predicate (rather than just raising a flag).

Woodley: In that world, the input could be either way, but by the time
it goes into the generator, you'd have to get rid of one.

Francis/Emily: Usually the opaque version, unless that's the only one.

Ann: Good to think of this in conceptual terms before worrying about
where the gazetteer comes in. You do have a lexical entry for S. of
State there, and you might want to avoid doing that in the ERG by
putting it in the gazetteer, but it's still a lexical entry in the
broader sense.

Francis: I think there's still a difference from what we're currently
doing in that we're saying not choosing between two, and keeping both.

Ann: Yes, that's new, and that's why we want to think about it in those
terms, before looking at how to implement.

## A Modest Proposal

By Ann (not an Elk). See also: [A modest Proposal for Proper
Nouns](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014ProperNouns)

I believe there are some cases in the list where underspecification is
not feasible. I can explain that in more detail if you like. The
alternative is to think of something where multiple analyses may be
packed into a single structure. Under some circumstances, both
interpretations may genuinely be available, in others, there will be a
potential for disambiguation.

I've been thinking about this for some time - the case I've thought
about most is semi-compositional MWEs. If we take an example like \`red
deer'

a\) an ideal lexicon should record it as a separate lexical item (cf
\`elk')

b\) when used of the particular species, it's still somewhat
compositional - it's a species of deer, and is reddish-brown.

c\) \`a red deer' could be used fully compositionally - e.g., to refer
to a scarlet toy

d\) \`a very red deer' could be said, but wouldn't be analysed in terms
of the MWE semantics (one would have to say \`a very red red deer')

e\) \`an albino red deer' can only involve the MWE - it isn't a
contradiction, but does wipe out any implication of redness

I don't see much wrong with having a dual structure - e.g., in DMRS
terms, a representation containing both:

red\_a\_rel --&gt; deer\_n\_rel

- ARG1/=

red\_deer\_n\_rel

One could perhaps mechanically achieve this in a grammar by having a
dual semantics in a single lexical entry for \`red deer'. Aurelie
mentions \`black key' on a piano as another case - they aren't
necessarily black, but someone who didn't know the MWE would nearly
always be able to treat this as compositional. However, it's an idiom of
encoding - they could be called sharps and flats.

Compositional but established compound nouns show a slightly different
issue. If you believe that garbage man' has a use in context man made
out of garbage' (analogous to \`snowman', as argued by someone - can't
remember who at the moment) then we need both the established MWE and
the fully compositional general compound\_rel reading. Here,
underspecifying doesn't make sense - the general compound\_rel use is
fully underspecified, but if we just use that, we have no way of
recording the established use. I guess this doesn't matter so much for
the current ERG, but it's a problem if you believe the system should be
capable of representing facts about linguistic conventionality.

Anyway, I don't see why one shouldn't extend this idea further and use
it e.g., in cases like \`baked a cake for Kim'. If you want to represent
the similarity with \`baked Kim a cake', then why not have both the ARG3
and the preposition there?

Having a distinction between:

\`gave Kim a cake'

and

\`gave a cake to Kim'

in that the latter has the preposition as well as the ARG3, might be
useful for the

\`gave Kim a headache'

\*\`gave a headache to Kim' puzzle than Georgia Green wrote about

Last update: 2014-02-18 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/TheAbbey_Chrysalis2014SchrodingerMrs/_edit)]{% endraw %}