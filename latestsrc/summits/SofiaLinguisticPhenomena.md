{% raw %}See also the [slides](http://www.delph-in.net/2012/phenomena.pdf) for
the discussion which summarise the
[discussion](https://delph-in.github.io/docs/summits/SuquamishGrammarIndexing) on this topic from the previous
summit.

## Discussion

Emily: Progress on the Wambaya grammar phenomena: [A list of nearly 100
phenomena](https://delph-in.github.io/docs/summits/WambayaPhenomenaCatalogue) with IGT for nearly a third of
them. Can people have a look to see what they think about level of
granularity? Also, synergy between semantic catalogue of MRS endeavour.

Mike: Surprise at criticism of "scattering". Not so much scattering but
consolidating constraints of a phenomenon. Isn't this a good thing?

Bec: Isn't there a maintenance problem of separating out constraints?

Anstke: Using customisation means you can have both. If people don't
want to write python to do generation, they can simply write tdl in
phenomena related files. Code from the customisation system can merge
types and create standard structures of the grammar. People can go on
doing their grammar engineering as before (but only works well for new
grammars).

Emily: How to document what additions to the grammar's are actually
doing?

Francis: For lots of the constraints added to grammars they are over
disparate parts of grammar and often to do with reducing ambiguity
rather than specifically implementing specific phenomena.

Emily: Once we've said something about the positive constraints, could
ask which constraints have we not accounted for? What would people do
with a list of phenomena indexed for relevant parts of the grammar?

Liling: Generate new grammars.

Anstke: Create libraries of implementations of phenomena.

Bec: Use it as a halfway point to documenting the grammar. Answering the
question, what are bits of the grammar doing there? For a given type,
what is it doing, can we throw it away?

oe: Issue of terminology. "Grammar fragments/components" distinct from
"analysis". Also "library" or "module". Are we aiming for a one-to-one
mapping with grammar parts?

Antske: No. But a mapping.

Emily: When working on Wambaya, noticed that granularity came up as an
issue.

Anstke: Problem with the definition of 'phenomenon'. We could just use
the examples of phenomena from the catalogue. Also have the problem of
sub-phenomena; how to organise them?

Emily: Every added constraint has a purpose.

oe: But there is also the interaction between phenomena.

Emily: Jacy and Wambaya are well documented for reason of addition.

oe: There is existing work on modularising of grammars, eg Sabine
Lehmann and Karel Oliva in the late 1990s; also in TAG and HPSG. Could
be worth collating and assessing this.

Anstke: These do organise by phenomana, but not to the same extent as
the metagrammar approach. On the topic of several analyses touching the
same types: In the German Grammar, when different analyses require the
same constraint, all are explicitly stored (redundantly) for
documentation purposes.

Ann: What about recording on the wiki natural language descriptions from
grammar engineers of how phenomena are implemented?

Emily: There is a bit of this from the grammar engineering course. But
only for relatively simple phenomena.

Woodley: What about using prose from version control logs?

Bec: Reliability of this depends on the grammar.

Yi: Students keeping a log of this sort of thing. Students get to choose
between grammar writing and documentation.

Anstke: Documentation (esp of someone else's large grammar) is hard.

Francis: Documentation not as fun as writing and could result in
burn-out.

Dan: Do people know the ratio of lines of TDL encoding positive
constraints vs negative constraints? In the ERG, most are excluding
analyses. Are the negative ones interesting with respect to phenomena?

Bec + Anstke: Yes, we want to record this information too.

Dan: But how do we know which phenomena they belong to?

Emily: Get the grammars to do this for us. Parse to/generate from
successive MRSs, interatively relaxing constraints and seeing what
breaks.

Ann: The combinatorics of this are problematic. Need to do it in the
right order.

Anstke: When do we need to know the negative constraints? In the case of
intersection between phenomena maybe we don't need to assign a phenomena
to a constraint, just indicate where else it is relevant.

Francis: Lex DB uses positive and negative examples.

Dan: How do we know which lex type to put these into?

Francis: You have to choose.

Francis: Chikara was working on a wiki of phenomena linking to grammar
parts. The problem was getting linguistis to use it, and grammar
engineers to maintain it.

Emily: There is some of this within ERG documentation.

Dan: But not systematic.

Ann: We don't know which ungrammatical string to use to locate relevant
negative constraints.

Dan + Woodley: When relaxing constraints, removing only one might not
have any effects.

Emily: The point is to use this approach to find interesting
ungrammatical examples.

Dan: We might not find unexpected strings.

Ann: Could extract some at least from grammar documentation.

Francis: If we want to understand

Dan: When working with larger grammars, there's a class of changes which
are to do with eliminating unused edges in the parse chart. How are
these changes to be documented?

Emily: Relaxing constraints approach could be used to look at effect on
edges.

Francis: Does that tell us anything useful?

Antske: Knowing negative constraints are useful for future
implementations.

Dan: What about removing an obvious (in hindsight) mistake? How to
document this?

oe: Another dimension of documentation is changes made for different
types of optimisation.

Anstke: Can these be separated out from changes implementing phenomena?

Dan: Hard to tell if a change is just a hack to make things work, or
represents an interesting fact about human language processing.

Bec: But at least a note could be made for further investigation later.

Dan: Already leaves this kind of breadcrumb trail, but not enough for
discoverability.

Emily: This isn't a reason not to start, eg with the relaxing
constraints approach.

Dan: Strongly think that this is an order of magnitude off being
feasible.

Emily: In general, the fact that it's hard to define phenomena etc also
shouldn't keep us from pragmatically starting to do something.

Last update: 2012-07-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SofiaLinguisticPhenomena/_edit)]{% endraw %}