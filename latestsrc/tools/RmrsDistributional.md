{% raw %}# Applications

Discussion from Cambridge meeting (23/5/2008 -- thanks Ann!).

Interaction between domain knowledge (NE) and syntax/semantics:

- not adequate to pre-NER a string and pass on the output to ERG, etc,
due to punctuation, pluralisation, etc.
- logical metonymy: "a pyridine" = a member of the class of compounds
which contain a pyridine ring; "the pyridine" = the pyridine ring in
a particular compound
- discussion of kind vs. substance readings of chemical compounds --
necessary for downstream processing?
- "three beers" being default portion vs. "three rices" being default
kind the sort of thing we want to underspecify rather than represent
as distinct readings (c.f. compound nouns)
- RMRS: to index or not to index? Within Sciborg, indexing only
chemicals under the assumption that every query will contain a
compound (constrain search space to only those documents containing
that compound, then play around with the full documents). Similarly
for GENIA (index only terms, events)

Distributional similarity and grammar engineering:

- "distributional similarity" = corpus co-occurrence-based vector
similarity
- use in interpreting compound nouns (e.g. interpret "cat food" via
similarity with "dog meal", etc), verb clustering (learning Levin
clusters), etc
- distributional similarity and relation extraction: relation
extraction based on training data and pattern "learning" for
particular relations, whereas distributional similarity simply
compares context vectors and churns out a similarity prediction
- interface between distributional similarity and grammar engineering:
  - QA in context of pattern matching
    - similarity over words or predicates?
    - what about WSD? sentence similarity (union of semantics of
words in sentence) can help to disambiguate
  - applications in sentence-level disambiguation of, e.g., "some
paper from 1946" (count) vs. "some paper from Kinkos" (mass),
where the grammar doesn't tell you anything
  - distributional similarity as way of getting around sense
enumeration (via fuzzy clustering)
- compound nouns specifically: applications?
  - MT into Romance languages (also Japanese, Norwegian)
    - need to commit to particular representation for given
language pair? Possibly not but don't really know.
    - any systematic study of NN translation divergences in
different languages?
  - QA: currently potentially doing worse than BOW approach because
of insisting on particular syntax
- interpretation of 3-ary and larger NNs? (semi-)solved task, and
parse selection models don't have access to the corpus counts that
unsupervised bracketing methods do
- importance of context in interpreting NNs? important, but in limited
cases; possibility of distributional similarity helping out (e.g.
"helicopter radio" in sense of "radio-controlled")
- cute example of domain example with (out of domain) counterintuitive
bracketing: "identical retention time and mass spectrum" -&gt;
"(identical ((retention time) and (mass spectrum)))"
- interfacing standalone bracketing, e.g., with parse selection?
chicken and egg problem in terms of identifying where to plug in the
standalone
- "can we stop now?" (Alex)

Last update: 2008-05-24 by TimBaldwin [[edit](https://github.com/delph-in/docs/wiki/RmrsDistributional/_edit)]{% endraw %}