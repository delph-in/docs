{% raw %}Notes from subgroup discussion on Implementing Information Structure in
large DELPH-IN grammars.

Introduction by Emily: Topic and Focus are used differently by different
authors. They are subcategorized differently by same. English is
slightly impoverished in morphosyntactic marking of information
structure (cleft constructions; prosodic marking).

Sanghoun: IS in machine translation. Ways forward for IS in DELPH-IN
grammars?

Emily's tenative proposal: Adding IS to MRS via variable properties,
rather than a "discourse structure", as originally envisioned by
Ann/Dan.

Dan: But Variable properties may not be sufficient. Passivization focus
may require nesting that variable properties mightn't be rich enough
for. Hence EPs seem indicated.

Emily: but IS may be multiply contributed. i.e. Japanese IS contributed
from multiple linguistic sources.

Dan: There is within any clause, a semantic head, and this head seems to
be the place discourse info wants to be anchored. d\_rels as a
placeholder for now (preferentially underspecified) for IS until a
treatment is rolled into the statistical model. ERG currently notes
cleft and EFM.

Emily: would it be better for English to instead note just a syntactic
binding of subject with topic, rather than inadvertently imply anything
about IS. Hence 'parg' might better mean "promoted argument" than
"passivized..." ... And also, demoted arguments might be marked as such.
\[Here, QED was declared, regarding interpretation of parg\]

Dan redux: Looking at IS for monoclausal might have missed the need for
nested rels.

"It was the \[mouse\]F that tried to be chased by the cat"

it's useful to catalog cases of multiclausal participation of the same
index.

beware the slippery slope of messages.

Dan: one problem with cleft and EFM is that there's no way to
underspecify them.

Dan: early MRS harkening: give every EP a unique name, which allows
other entities to be marked with respect to same. analagous to HCONS
would be ICONS.. individual constraints.

Ann: "Anchor" in RMRS exists and might be used for this. Characteristic
variable assumption bug in the matrix should be fixed. Currently anchor
effects QEQ constraints with HCONS. This mechanism should not be
confused with the EP mechanism. How you treat the \*absence\* of this
would have to be worked out.

Emily: maybe something similar to the clever trick wrt ... could work.
\[EB notes later: Not sure what this was.\]

Dan: look for an richer implementation base to experiment with. ICONS
could be this.

Emily: Until ICONS is ready, monoclausal work can continue with this
future solution in mind.

Ann: generation might be handled (although not efficient) if the check
(an MRS comparison) is done at the end of generation.

## Some further notes

Emily's notes on the conclusions of this discussion:

Need to represent IS as relations between individuals and events, but
that doesn't require eps --- can use ICONS (new, forthcoming in fact) as
binary relations between individual variables and anchors (belonging to
eps in the RELS list).

Desire to combine constraints from different sources can be accommodated
by checking afterwards that constraints on same (individual, anchor)
pair are consistent ... this involves a portion of the type hierarchy
being exposed through the SEM-I.

ICONS solution helps with underspecifying input, so we can get actives
from passives and vice versa when we want.

Could conceivably add unmarked(ind,anchor) to input MRSs which would not
be matched in generation but would need to be compatible with MRS output
(i.e., block focus(ind,anchor)).

I spent some time trying to avoid biclausal problem by suggesting that
relative clauses involve binding link between variables rather than
shared variables, but Dan reminded me that that leads to the same
slippery slope that led us to ditch the message relations.

Key examples:

- It's the cat that tried to be chased by the dog.
- It's the cat that chased the mouse that it's the dog that chased ...
\[not quite like that.\]
- \[Some example with two clefts, one inside a rel cl??\]

Last update: 2010-07-22 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ParisInformationStructure/_edit)]{% endraw %}