# Background

This page serves as the ‘table of contents’ (and to-do list), i.e.
provides a collection of items that we believe should be described in
documenting the semantic analyses of the ERG (see
[ErgSemantics](ErgSemantics)). The initial list of candidate semantic
phenomena originates from a two-step process. First, grammar entities
(rules or lexical entries) were automatically inspected for indicators
of ‘interesting’ semantic properties (via the discovery procedure
described on the [ErgSemantics/Discovery](ErgSemantics_Discovery) page)
and grouped by their semantic synopses, i.e. the EP or set of EPs they
contribute. Second, this list was paired with examples from the Redwoods
Treebank instantiating the grammar entities in question.

# Basic Components of Semantic Analyses

Some fundamental aspects of the MRS approach to meaning representation
and its use in the ERG are independent of invididual semantic phenomena.
The [ErgSemantics/Basics](ErgSemantics_Basics) page aims to define
general terminology and introduce the relevant building blocks of ERG
semantics, i.e. our version of things one might find in any logical
representation language.

# Semantic Phenomena Derived from Constructions

Reasoning over the grouping of grammar entities and corresponding
linguistic examples, we distilled the following list of semantic
phenomena, of which many correspond to one ‘cluster’ of grammar entities
with identical (or very similar) synopses.

-   [Apposition](ErgSemantics_Apposition): ‘appos’,

-   [Compounding](ErgSemantics_Compounding): ‘compound’,
    ‘compound\_name’, including titles and N-ed (J-N\_CRD-T\_C cuts
    across compounding and coordination)

-   [Conditionals](ErgSemantics_Conditionals): ‘if\_x\_then’

-   [Coordination](ErgSemantics_Coordination): ‘conj’

-   [Foreign Expressions](ErgSemantics_ForeignExpressions): ‘fw\_seq’

-   [Fragments](ErgSemantics_Fragments): ‘unknown’

-   [Imperatives](ErgSemantics_Imperatives): ‘pron’ (plus SFORCE)

-   [Implicit Locatives](ErgSemantics_ImplicitLocatives): (‘today’,
    ‘every time he arrives’): ‘loc\_nonsp’

-   [Implicit Nominals](ErgSemantics_ImplicitNominals):
    ‘generic\_entity’

-   [Implicit Quantifiers](ErgSemantics_ImplicitQuantifiers):
    'udef\_q', ‘proper\_q’, ‘pronoun\_q', 'number\_q'

-   [Instrumental
    Relatives](ErgSemantics_InstrumentalRelatives): ‘with\_p\_rel’

-   [Measure Phrases](ErgSemantics_MeasurePhrases): ‘measure\_rel’

-   [Nominalization](ErgSemantics_Nominalization): ‘nominalization’,
    including verbal and nominal gerunds as well as some non-gerunds and
    WH nominalization (need to look at relation to free relatives)

-   [Non-Adverbial Clausal
    Modifiers](ErgSemantics_NonAdverbialClausalModifiers): ‘subord’
    (including depictives and absolutives)

-   [Number Sequences](ErgSemantics_NumberSequences): ‘num\_seq’ (for
    numeral juxtaposition)

-   [Parentheticals](ErgSemantics_Parentheticals): ‘parenthetical’

-   [Partitives](ErgSemantics_Partitives): ‘part\_of’

-   [Quasi-Modal Infinitivals](ErgSemantics_QuasiModalInfinitivals):
    ‘eventuality’

# Semantic Phenomena Derived from Lexical Rules

Some of the phenomena listed under ‘Semantic Phenomena Derived from
Constructions’ above are also instantiated, in some instances, by
lexical rules. This section list those phenomena that are instantiated
by lexical rules and not phrasal constructions (though possibly also by
lexical types).

-   [Ellipsis](ErgSemantics_Ellipsis): ‘ellipsis\_ref’ (‘Can I?’),
    ‘ellipsis\_expl’ (‘There's sun, isn't there?’)

-   Passive: ‘parg\_d’

-   Intersective-Modifier Prefixes: ‘\_co-\_a\_with’,
    ‘\_counter-\_a\_anti’, ‘\_mis-\_a\_error’, ‘\_pre-\_a\_ante’,
    ‘\_re-\_a\_again’, ‘\_un-\_a\_rvrs’

-   Scopal-Modifier Prefixes:

-   Tag Questions: ‘id’, ‘ne\_x’

-   [Time Expressions](ErgSemantics_TimeExpressions): ‘of\_p’
    ‘def\_explicit\_q’ ‘def\_implicit\_q’ (‘June third’, ‘Tuesday
    afternoon’)

# Approximation of Phenomenon Inventory from Lexical Types

-   Cardinal Adjectives and Number Names:

-   Color Adjectives and Names:

-   [Comparatives](ErgSemantics_Comparatives)

-   Compositional Number Names:

-   [Control Relations](ErgSemantics_ControlRelations)

-   Degree Specification (of Quantifiers, e.g. ‘nearly all’, ‘almost but
    not quite every’): \[moved from high level concepts, because it
    seems more like a linguistic analysis\]

-   Existentials: ‘\_be\_v\_there’

-   Free Relatives: ‘free\_relative\_q’, ‘free\_relative\_ever\_q’

-   Generalized Quantifiers:

-   [Identity Copulae](ErgSemantics_IdentityCopulae)

-   Modal Operators: ‘neg’, ‘\_can\_v\_modal’, ‘\_probable\_a\_1’, etc.

-   MWE Quantifiers: *any more* et al

-   Possessives:

-   Pre-verbal Modifiers: \[those that are syntactically analyzed as
    attaching to the subject; what happens to them semantically?\]

-   [Propositional Arguments](ErgSemantics_PropositionalArguments)

-   Pro-verbs (do so):

-   Proper Names:

-   Scopal Adverbs: certain uses of *also*, i.a.

-   Verb particle constructions:

-   WH Words:

# Other Semantic Phenomena

Besides phenomena that can be identified by looking for ‘interesting’
constructions or lexical rules, the following is an emerging list of
additional high-level semantic phenomena. \[NB: Pages in this section
are highly incomplete and may at this point contain only notes.\]

-   Resultatives (‘put the book in the box’, ‘make Abrams happy’, ‘have
    the report on my desk’)

-   Semantically Vacuous Lexemes (i.e. In-Semantics)

-   [Relational nouns](ErgSemantics_RelationalNouns)

-   Idioms

# Quasi-Semantic Phenomena

These are phenomena which are (currently) reflected in the MRS, but
which either aren't directly about truth conditions or represent a way
to create connected MRSs in the absence of syntactic analyses which
would lead to the expected representations.

-   Idiomatic Determinerless PPs: ‘idiom\_q\_i’

-   It-Clefts: ‘\_be\_v\_itcleft’

-   Focus Movement: ‘focus\_d’

-   Passivization: ‘p\_arg\_d’

-   Relative Clause Extraposition: ‘relative\_mod’ (arguably should be
    fully parallel to non-extraposed relative clauses)

-   Tag Questions: ‘ne\_x’ ‘id’

-   [Vocatives](ErgSemantics_Vocatives): ‘addressee’

# Semantically Vacuous Lexical Items

Another class of design decisions required in constructing a set of
compositional semantic representations is the determination of which
lexical items are to be treated as semantically vacuous (in the sense
not contributing any elementary predications; they may yet contribute
variable properties and/or serve to pass information between items in
the process of composition). This section will document the semantically
vacuous lexical items in the ERG. Examples include:

-   Predicative copulae

-   Relative pronouns

-   Complementizers

-   Dependent elements (*both ... and*, particles in verb-particle
    constructions)

-   Fillers (*um*, *uh*, *like*)

# Sources of inspiration

-   [ErgSemantics_Raw_Materials](ErgSemantics_Raw_Materials) links to discussions and questions answered that could be used to further populate these pages.

# More Information

-   [ErgSemantics](ErgSemantics) Main Page

-   [How to Cite this Work](ErgSemantics_HowToCite)
