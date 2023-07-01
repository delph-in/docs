{% raw %}
<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->

**Table of Contents**

- [Sets of interests or constituencies that have a stake in the design of (R)MRS representations:](https://delph-in.github.io/docs/tools/RmrsDesign#sets-of-interests-or-constituencies-that-have-a-stake-in-the-design-of-rmrs-representations)
- [Agenda items](https://delph-in.github.io/docs/tools/RmrsDesign#agenda-items)
- [Demise of pronoun\_q\_rel](https://delph-in.github.io/docs/tools/RmrsDesign#demise-of-pronoun_q_rel)
- [Optionality of pronoun\_n\_rel](https://delph-in.github.io/docs/tools/RmrsDesign#optionality-of-pronoun_n_rel)
- [PRED with internal structure](https://delph-in.github.io/docs/tools/RmrsDesign#pred-with-internal-structure)
- [Non-restrictive relative clauses](https://delph-in.github.io/docs/tools/RmrsDesign#non-restrictive-relative-clauses)
- [Predicate Hierarchies](https://delph-in.github.io/docs/tools/RmrsDesign#predicate-hierarchies)
- [EPs v. properties](https://delph-in.github.io/docs/tools/RmrsDesign#eps-v-properties)

<!-- markdown-toc end -->


### Sets of interests or constituencies that have a stake in the design of (R)MRS representations:

- parsing/underspecification
- generation
- integration with shallow systems
- shallow inference/IE
- inference
- syntax, composition
- multilingual harmonization
- transfer
- anaphora

### Agenda items

- cross-linguistic similarity
- paraphrase
- robustness, underspecifiability
  - predicate names
- stability, documentation (core phenomena)
- abstract predicates
- decomposition
- near-equivalences
- clean IE
- sense mapping
- \`real' documentation
- naming conventions for unknown word predicates
  - proper names

### Demise of pronoun\_q\_rel

When we remove pronoun\_q\_rel, we run into the problem that the tree
gets smaller, and the labels of the pronoun relation have to get
identified with something. This was troubling for quite a while until we
convinced ourselves that modified pronouns are always pseudopartitives.

Pronouns don't ever get quantifiers, and share their labels with the
verbal projection they combine with ("You who brought laptops probably
have the right idea." "You with laptops must leave now."). Modified
pronouns ("You who brought laptops") involve a pseudopartitive
construction which introduces both a new variable and a quantifier for
that variable.

Proper names can go without quantifiers, but might get them when they
are overt ("Every Kim I've met"). "John in Paris" doesn't need a
quantifier.

### Optionality of pronoun\_n\_rel

In languages with pro-drop (of various kinds), dropped arguments often
fill the role of unstressed pronouns in a language like English (used
for reference to discourse entities currently in focus). But dropped
arguments can also have other uses (e.g., like indefinite null
instantiation in English). The question is what would break if we didn't
put in any ep for these dropped arguments.

Raises questions about the notion of characteristic variables/eps: Every
ep has an ARG0 and every non-u index is the ARG0 of exactly one ep (with
special exceptions). The rmrs matching code uses this notion, and drops
those variables that can't be grounded in an ep for which they are the
characteristic variable. The notion of characteristic variable is also
relevant to dependency extraction code (used e.g., in producing n-gram
models against which to rank transfer outputs) and potentially to
filtering lexical edges based on information from other lexical edges in
the gender.

In terms of the model theory, both sleep(e,u) and sleep(e,x) are fine,
but the lack of any characteristic ep affects the complexity of tasks
such as deciding the mutual satisfiability of two rmrs.

### PRED with internal structure

It may be useful to make explicit the internal structure of (open-class)
PRED values, which by common consent are currently strings which have
the following structure: "\_LEMMA\_POS\_SENSE"

We explored a proposal to change PRED so its value is no longer a string
for open-class lexical entries, but a type with the following structure:

- \[ LEMMA string, POS type, SENSE type \]

There are several possible benefits of this increased transparency:

- More direct comparison of MRS and RMRS structures
- Enabling of lexical redundancy rules like causative-inchoative in
English, where each of the entries has a single EP, and where the
PRED value in one entry is systematically related to that of the
other entry. For example, with "open", the ERG has two entries, the
intransitive verb with "\_open\_v\_1", and the transitive verb wtih
"\_open\_v\_caus". On this proposal, the redundancy rule would
replace just the SENSE value '1' with 'caus'. (Note that the LKB
does not yet have TDL notation defined to support a definition of a
lexentry1 as lexentry2+lexrule3, but this is not expected to be
hard. Note also that such a redundancy rule is a descriptive device,
not a unary rule to be applied in parsing or generation, since it
does not preserve monotonicity of the MRS. (But it was suggested
that this monotonicity could be preserved if the entry for 'open'
were underspecified for SENSE, with two rules, one for inchoative
and one for causative.))
- Improving treatment of subregularities for verb-particles, such as
with semi-productive "up" as in "wake up". Here it is good to have
SENSE as a type, since we could arrange its value here to be
something like the following, in order to capture the
causative-inchoative alternation for "wake up". up caus
  - \\ /
  
  up-caus

### Non-restrictive relative clauses

The following MRS is proposed for non-restrictive relatives, making them
analogous to appositions. For this example:

Dogs, which bark, sleep.

the target MRS will be roughly as follows, introducing a distinguished
quantifier (ignoring HCONS here):

l1:dog\_n(x1)

l2:udef\_q(x1,h1,h2)

l1:appos(x1,x2)

l3:nonrestr\_q(x2,h3,h4)

l4:generic\_nom(x2)

l4:bark\_v(e1,x2)

l5:sleep\_v(e2,x1)

### Predicate Hierarchies

It would be interesting to add external hierarchies (for descriptions or
denotations) to the current predicates. However, this is a non-trivial
extension to the current software.

These hierarchies would have to be made available to MRS manipulation
routines such as MRS comparison and generation.

Currently at last two kinds of groupings have been proposed:

\(a\) subsumption relations

- (a-1) subsumption relations with fixed arity (can be used to
underspecify generation)

\(b\) lemma-pos-sense underspecification

Such hierarchies could be description level (bottoming out in MRSs) or
denotation level (bearing a relationship to ontological truth within
some domain). They would also be application/domain/MT-pair dependent,
which particular applications calling the appropriate hierarchies at
appropriate points.

FCB volunteers to cheerfully test this in MT.

### EPs v. properties

How do we decide for any piece of information we would like to encode in
the MRS whether it should be a variable property or an EP? Some
guidelines:

1. If it is constrained by multiple things in the syntax, it is more
convenient for it to be a feature. It may be possible to specialize
PRED values from multiple sources, but that might also violate
compositionality.
2. If it takes more than one argument, it should be an EP.
3. Quantifiers have to be EPs, even though compositionally they only
take one argument (never directly associating their BODY element
with anything), because it's not enough to know which variable they
are associated with: In "All brown dogs bark", there are 'x's
appearing in brown, dog, and bark, and we need to know which belong
in the definition of which of the sets that the quantifier is
comparing (RSTR/BODY).
4. Being scope-taking, however, is not enough to require something to
be an EP: Tense can bear scope, but knowing which event the tense is
associated with is enough to know what its scope possibilities are,
so tense can be a variable property.

Last update: 2021-07-01 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/RmrsDesign/_edit)]{% endraw %}