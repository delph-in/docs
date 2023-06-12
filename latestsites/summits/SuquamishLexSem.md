{% raw %}Lexical semantics discussion notes

Francis: Who sees the potential use for lex sem in a system?

Rebecca: For QA (fuzzy predicate matching) Yi: In Chinese grammars not
enough syntactic info for disambiguation Francis: Likewise in Japanese
-- currently have some controversial rules that the syntax can't
disambiguate Woodley: QA Glenn: thai-language.com MT Emily: Add to ANC
to increase appeal to broader IJCAI/AAAI community Francis: MASC is
being annotated by Princeton for [WordNet](/WordNet) Mike: Generation
and paraphrasing; Prescott would likely also be interested for
summarization. Justin: Have a strong feeling that lexical information
impacts syntax. Stephan: Back in the MT days it seemed like it would
have been useful to have predicates in a hierarchy, but that became less
urgent with work on learning transfer correspondences. But also
generally think we should know something in this space.

Francis: Shared synsets across languages -&gt; can train a
disambiguation model on Spanish tagged data and use it to do WSD on
Japanese. The fact that dogs bark is not necessarily just a fact about
English.

Stephan: Aware of some unhappiness with the definition of the task, if
conceived of as resolving to English WN senses. [OntoNotes](/OntoNotes)
comes with a small upper model.

Francis: Philosophy of [OntoNotes](/OntoNotes) was to generalize up the
hierarchy until they could get to 90% IAA. Generally, the level of
granularity in any lex resource is inconsistence and for WN has been
viewed as too fine-grained. Hierarchy allows for some generalization,
but also looking to something more coarse grained could be good. SUMO
(de facto IEEE standard, top parts of WN and some other things).

Francis: Would be good to have a flexible framework allowing us to use
multiple ontologies, but in the short term will I will be working with
WN. Level of granularity is an issue analogous to comparing deep v.
shallow parsing. We estimated we needed 2000 for verb disambiguation,
20-30,000 for noun disambiguation.

Glenn: Advantage of WN is active development work on it. But: complaint
has been too many overlapping senses at any given level; just going up
the hierarchy doesn't necessarily help.

Stephan: How much hierarchy is there in [FrameNet](/FrameNet)?

Francis: WN doesn't have everything, doesn't have selectional
restrictions on verbs. I think we'll want to learn that from a corpus
and then store it somewhere separately. Other things as well like
[VerbNet](/VerbNet). We'll often get a gain (for disambiguation and
generation) by knowing semantic class of arguments preferred by verbs.
Mappings between [FrameNet](/FrameNet), [VerbNet](/VerbNet),
[WordNet](/WordNet) can help.

Stephan/Yi: Sergio Roa has worked on mapping to ERG predicates, a couple
of years ago.

Glenn: What about Cyc?

Francis: Yes, Cyc is a contender. One level further on from lex
semantics, more like frames. Slightly bigger step, maybe not ready to
take it yet, but could be an interesting task. E.g.,: "Water will spill
if you turn a glass upside down." But also "A dog is an animal".
Experiments on predicting countability of English nouns did as well as
(slightly better than?) WN.

Glenn: License is Apache.

Francis: Also lot of work on bio-specific hierarchies.

Francis: Summary so far. We have a notion of why this could be useful.
For QA and paraphrasing ISA hierarchy is what you want. One reason WSD
has been found unsatisfying is tendency to look at only single word
entries, but 50% of the entries are MWEs, and that part has a lot of
discriminating power. Advantage for us because of our model of MWEs.

Stephan: That's an argument of operating at the level of MRSs, where we
have already reprsented the MWEs as single things.

Francis: Yes.

Rebecca: Not using MRS for parse selection at this point.

Emily: Feasible to project MRS info back onto trees?

Rebecca: Would prefer reranking which uses MRS information as first pass
approach.

Yi: Master's student compared to syntactic parse selection and didn't
see big gain from using MRS, except maybe some domain-portability
improvement. But that was without lex sem.

Stephan: Woodley recently tried some MRS derived features and found some
gains, but it's not been a silver bullet.

Francis: Baldridge et al also found some gain, but better to build
separate syn and sem models and combine them, rather than building on
model. We found some gains, but only if we were using the type
hierarchy. Only looked at Japanese for that one, where the grammar is
less syntactically constrained than the ERG. (Based on Oracle WSD
results.) Tim and Egirre have also found gains, using automatically
disambiguated senses.

Emily: Backing up to the controversy, just because we want to take
advantage of MWEs doesn't mean we have to work at the level of MRS. Can
ambiguate at the level of the MWE entries. (Except maybe true idioms,
but would speculate that those only have one idiomatic sense.)

Francis: Not ready to accept that speculation without checking.

Dan: PET doesn't yet handle the idiom machinery.

Stephan: Could see how many of the multiword WN entries could be
accommodated early on in the lexicon.

Dan: Ann's position on noun-noun compounds is that they are deceptive in
looking like a completely productive process in English when in fact
they are are not. There are lots of unattested noun-noun compounds that
are surprising. She assumes a long list of noun-noun subregularities ---
semiregular patterns constrained by semantic sorts etc. A good lexicon
would provide a characterization of those subregularities that are not
fully productive. ERG contains none of that insight allowing almost any
noun-noun combinations.

Stephan: We don't currently have the machinery (additional technical
devices) which would support this.

Stephan: Not only NN, also A-N combinations (strong tea, strong drink,
tall building, tall person, high building, \*high person \[different
sense\]).

Dan: Collocation constraints are very clear to speakers, but not clear
how we would or should encode them.

Francis: Science would advance if looked at how many of the noun
compounds can be handled with simple constraints.

Dan: Example of constrained NN compounds: "doctor's office", "dentist's
chair". The generalization seems to be that if the left member of the
compound (human?) than you can do it. Also: \*doctor office \*men room.

Emily: Other classes of NN compounds don't have a morphological mark,
but do have characteristic semantic relationship between the parts.

Francis: Another example is in matching numeral classifiers to nouns.
But need synecdote: "three person-CL of Microsoft" DFKI が三人来ました。

Francis: Was completely convinced that we can't do it as restrictions on
sorts. Something like "machine translation" where there is a single node
for that in WN would like to be able to map to that as a node. "Gaurd
dog" is a "dog", "dog" is a "dog". Putting in things like compounds
doesn't necessarily pack as easily.

Emily: "machine translation" as a single node shouldn't block the
compositional reading (with a different sense of translation ---
translating the machines). So maybe that one we'd need to ambiguate from
the beginning.

Stephan: What is the external distributional difference?

Dan: "machine translation of books" but not "machine translation of that
ENIAC"

Francis: If we accept paraphrase as a test, "translation by machine" and
"translation of machines".

Stephan/Emily: That's not a syntactic test.

Francis: Still useful as a test to determine what should be in the
semantics.

Stephan: Back to question of whether to ambiguate early. It's entrenched
in our technology not to use the semantic features while constructing
the forest. Further postpone construction of the actual MRS until we're
done unpacking, because final feature structure is needed for that. So
there should be strong arguments for taking the ambiguate early
position.

Francis: If we don't need it along the way, then doing it at the end
makes more sense.

Emily: One place it could be used along the way is in chart pruning/best
first parsing.

Francis: And incremental parsers might also want it.

Emily: \[Disclaimer: Not necessarily an advocate for this position.\]
Another possible objection is the linguistic notion that the lexicon
should be a single holistic thing. Two separate lists of lexical entries
would need to maintain their alignment with each other. Also, some
things would be in one but not the other (e.g., "machine translation").

Stephan: Proposal is that the lexicon distinguishes between syntactic
and semantic information. Same as the one that parsing with ambiguity
packing makes. Would be possible at least that some entries have an
empty syntactic part (e.g., "machine translation" the collocation).
Parallel to derivational morphology.

Francis: Would like to believe that the bulk of the mapping can be done
largely automatically. Some might need to be done by hand, e.g., because
the internal structure of MWEs is not represented in
[WordNet](/WordNet). Will require some effort to build, but then will be
stored, and updated (somehow) as one or both changes.

Emily: Some things in one but not the other begins to sound like
motivation for two separate lists anyway.

Francis/Stephan: Link is from dog lexical entry to one node in WN, could
be stored in lex entry if we wanted.

Woodley/Francis: But actually the word node in WN will collapse
distinctions that the ERG makes and can't say that ERG \_dog\_n\_rel has
all of those meanings linked to the dog word node. Even in the noun
space, we might have subcat information that will partition the WN sense
space, and it is an interesting research question whether we can get at
that from the semantic hierarchy (e.g., relational nouns do one thing).

Francis: This is one of the reasons we didn't do this 10 years ago ---
not just an engineering problem.

Laurie: But these issues may be informed by the practicality of trying
to make this generalizeable and not chained to [WordNet](/WordNet).

Woodley: I agree. It's going to be a complicated mapping, and
[WordNet](/WordNet) might not stay so attractive.

Francis: OTOH, can't really do the experimentation without a mapping.
[WordNet](/WordNet) appears like it will at least be maintained in five
years' time. There will be a cost for adding any new lex resource, the
more generic the mapping, the less we can make that cost, but...

Dan: Doesn't have to be a change in the original grammar source file.
Could well have core.smi and core.wn.semi, where core.smi is as
currently, core.wn.smi is a mapping from ERG to WN, could have separate
mappings for other resources like core.cyc.smi... Those should be
partially automatically constructed to the extent possible, while also
allowing for hand-work.

Woodley/Dan: May turn into a more general MRS to MRS mapping task
(transfer rules) that takes advantage of context.

Emily: Still need lexical resource of some sort (even if only a set of
transfer rules) and there could be multiple versions of these for
different external lex semantic resources.

Stephan: Compatible with the view that the grammar provides all the
information that is constrained by the syntax.

Dan: predicates in the ERG are publicly defined hooks that can be used
to go get more information out of lex sem resources.

Francis: I have a feeling of a general shared consensus that we look for
the post-semi mapping to WN using the transfer machinery or some other
new machinery. Possibly there will be some fix up on both sides as I
start working on this mapping.

Last update: 2011-06-29 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SuquamishLexSem/_edit)]{% endraw %}