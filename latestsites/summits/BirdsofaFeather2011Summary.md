{% raw %}This page contains a summary of the discussion of the [Birds of a
Feather meeting](https://delph-in.github.io/docs/summits/BirdsofaFeather2011) held at the 2011 ACL on June 19,
2011. We are grateful to the participants for their valuable input.

## Main points

- **Make something that will be useful independent from HPSG.**
- **Plan for uses we have no inkling of now.**
- **Provide as much information as possible ...**
- **... while making it easy to get at only the part of it someone
cares about.**

## Possible uses

- Training data for existing tools, including statistical parsers
(constituent structure or dependency), pos taggers, and anything
else expecting PTB-style inputs.
- Training data for *generation* systems, including filters on MT
output to improve fluency.
- Entity resolution (very important in industry currently)
- Cross-framework evaluations
- Linguistic exploration/Treebank search (Godhke and Bird 2010)
- Ontology extraction

Community uptake will be motivated by the sheer size of the dataset, but
will depend on its accessibility. Provide scripts to create views on the
data that make it as familiar as possible, so as to provide a bridge to
using the more complete information. User to keep in mind: Graduate
student exploring possible resources to use in a new project.

## Corpus fundamentals

- Preserve all available meta-data about documents
- Annotations ground out in character off-sets (?? byte off-sets),
even if we also provide one or more tokenizations as first-class
objects.
- Consider including the English side of parallel texts within the
corpora to annotate.
- Consider including WSJ 1987 for direct comparability
- Unique item IDs across the whole corpus

## Output formats

If we don't create the mapping for our representations to the current
de-facto standards, then others will, redundantly and most likely less
accurately, as they would lack complete understanding of the inputs.

Create a library of scripts to map to at least:

- PTB (look at [OntoNotes](/OntoNotes) improvements, but also current
standard)
- CoNLL dependencies
- [PropBank](/PropBank)

in at least two ways each:

1. Superficial form
   - dependencies: format of triples, labels of dependency types
   - phrase structure: tokenization, label set
2. Closest possible match
   - dependencies: put back semantically empty words, match direction
of dependency, break up MWE rels (\_get\_along -&gt; get along)
   - phrase structure: put in traces, move punctuation attachment
3. "core dependencies": no semantically empty words, but in a format
that can be used for evaluation of something trained on closest
possible match view.

*Do this first,* possibly on WikiWoods/WSJ data, to learn what
information might be needed from human annotators before we being the
hand-annotation process.

If we provide multiple trees for some or all sentences, consider forest
representation. Unpacking tools can be expensive to write, so if this is
too difficult, likely won't get up-take.

## Resource documentation

The interpretation of the annotations (especially in our "native" output
formats) needs to be accessible without digesting the entire ERG.

- Dependency labels (consider renaming to avoid confusion with
[PropBank](/PropBank))
- Tokenization
- Nature of MRS (is it semantics?); make clear that e.g., tense
information is morphological tense information.
- The information we do have about lexical semantics and semantic
roles (e.g., encoding of causative/inchoative alternation)
- Which views include which information (e.g., if scope of negation
can only reliably be read off of MRS/dependencies, not phrase
structure trees)

Include information on mapping from one level of representation to the
other (cf. Hindi/Urdu treebank project).

## Annotation quality assurance

Quality of annotation depends on the usability of the tool, and the
extent to which it makes it easy for annotators to maintain consistency.
In addition, the project will need to set up on-going QA procedures to
make sure annotators don't drift away from guidelines.

Consistency of both annotator decisions and grammar writer decisions are
important. (Cf. examples of *group of noun* v. *name of noun* and
*today* vs. *day after tomorrow*.)

### Specific general suggestions:

- Don't have annotators apply heuristics to handle unresolveable
ambiguity. Have them only narrow the parse forest as far as they
can, then apply heuristics progammatically. If there is remaining
ambiguity, return to annotators and/or refine script. Provide the
data in both fully disambiguated and original formats, and preserve
metadata about which decisions were the result of heuristics.
(Additional benefit: Can change our minds about the heuristics and
rerun.)
- Where the guidelines explain particular choices, give tests for each
option (no default case, or it will be applied indiscriminately).
- Do some inter-annotator agreement experiments, but don't do
everything as dual annotation. (At least dual annotation for
standard test section though.)
- Have senior annotators check every nth sentence for on-going QA.
- Follow a construction-focused annotation strategy, allowing
annotators to concentrate on particular issues rather than having to
hold the entire system in memory for each sentence. (Risk: Failing
to handle all constructions. This risk is mitigated by general
Redwoods strategy, in that we can tell when we're done
disambiguating.)
- Have annotators focus on semantics and make sure it's correct, as
it's more important than the syntax.
- Identify problematic constructions (from existing knowledge, studies
of IAA, etc) such as NPIs and verify annotations on examples
including these
- Work to counter grammar bias, especially in terms of items that have
spanning parses, but no correct spanning parse.
- Provide a mechanism for the user community to submit corrections to
the annotations, which are then bundled into named update releases.

### Specific tool suggestions:

- Detect inconsistencies automatically and flag for annotator review.
- Support construction-focused annotation strategy:
  - Ability to find relevant examples to work on
  - Display of related examples for each decision
- Allow annotators to make comments on particular decisions, for
review.
- Make preceding and following context obvious (un-ignorable) to
annotators, even if we didn't parse preceding or following sentence.
- **Don't** have the parse selection model used to find the 500
candidates be trained on anything with heuristics applied.
- Ability to go selectively into the parse forest
- Show positive discriminants that the parse selection model chose for
annotator verification

## Things to consider adding to annotation

- Flags for grammaticality and style (e.g., okay only as twitter)
- Coref chains
- Named entity tags, especially structured ones: &lt;org&gt;University
of &lt;loc&gt;Syndey&lt;/loc&gt;&lt;/org&gt;
- Information structure
- Quantifier scope resolution (where it matters, and where it can be
determined in context)
- Whatever is needed to make scripts producing different views work.
- Further specification, despite grammar's theoretical stance on
underspecification, when we can have a human do it.
- Semantic role labels, including more information about adjuncts
(parse their data and try to find a mapping?)
- Lexical semantics (e.g., [WordNet](/WordNet) synset) (do we get this
through MASC, for at least some?)
- Nothing: quantity is more important than detail (but cf. Francis's
objection)
  - Consider which additional details are done most efficiently in
initial annotation pass, versus which can be done later as
annotation overlays.

## Things already there in the annotation that will be a win

- Scope of scopal modifiers (including negation)
- Information that is present in the MRS but not morphologically
marked in English (e.g., number on ARG1 of adjectives) could be
useful for MT.
- Consistent PoS tags
- MRS, more abstract than syntax, better for applications like QA
- Heads always clearly marked
- All proper nouns marked as such (make sure this is in all views, not
just MRS-derived ones)
- Information about temporals

## How to handle inputs without (correct) spanning parses

- Include metadata indicating that the parse was robust (and any
available information about the actual grammaticality): important
for generation uses.
- Have annotators disambiguate full structure of internal pieces
(e.g., NPs).
- Cover missing sentences by putting in bland rules, cataloging what's
missing in the process.

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/BirdsofaFeather2011Summary/_edit)]{% endraw %}