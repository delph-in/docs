{% raw %}Anaphors:

- ICONS constraints two referential entities (es or xs)
- ICONS = individual constraint
- HCONS = handle constraint

Previous tools for establishing identity between two entities:

- coindexation
- an extra EP

... can lead to scope problems.

Semanticists think that it's surprising that we have two variables in
*Kim shaved kimself*, but when you make that move it makes the
structures you give in composition much more natural.

A lot of how MRS works (not intended but) depends on the idea that
whenever you have a nominal guy you have an associated quantifier. We
are talking about linguistic entities when we produce compositional
semantics. ICONS says that the the two variables refer to the same
thing. Plus a value that says what type of constraint it says (maybe in
type name). &lt;- could be a significant engineering question, but
doesn't matter formally.

Use for intra- and inter-sentential anaphora? May need to be careful.

For inter-sentential anaphora there's a technical issue about the naming
of these things. The identifier for any entity might need to be a
combination of the variable plus a sentence identifier. Rather than
global variable names (e.g., in Wikipedia).

Same as coindexation v. coreference?

Pronouns for dogs are arbitrary, but can't switch from *he* to *it* in
the middle of the same sentence. *He thought it was hungry* can't mean
that the pet thought the pet was hungry.

Relative clauses and other constructions do use coindexing now in the
grammar.

- *The guy who bought a dog likes it.* =&gt; buy.ARG1 = like.ARG1
- Control
- Raising

But never get identification of ARG0 across two different rels (\_n\_rel
or otherwise)

ICONS would also be useful for capturing Principles A and B:

- *Kim bought him a book.* cannot mean Kim != him, but we're not
representing this.

Some ICONS from the grammar, some from an external reference resolution
component. Francis's example would be another case of a grammaticized
ICONS:

- *He fought his/\*her way out of the room.*

But for the generator to know not to generate \**her* it has to
interpret the ICONS as requiring shared variable properties, which we
don't want in all cases:

- *The couple is unhappy because they are always fighting.*

Is the ICONS eq (or =r) relation symmetric? transitive? Some types of
anaphora might have some tendencies about which comes first.

When would it matter if the relationship type is the value of a third
feature or the type of constraint? Maybe if you needed to underspecify
the type of constraint? (Should be possible either way.)

The extension of anaphora resolution to events --- hard to get
annotators to agree on things. Ex in chem texts where there's a definite
reference that cannot be assigned to any specific part of the text
sensibly ... a whole program work that is not explicit in the text
anywhere. The existence of anaphoric relationship is not a reason to say
that we've got have a linguistic entity.

- *The couple isn't happy because he never comes home from work on
time and she...*
- even more so with definite descriptions

Would we ever want ICONS with only one member linked to a variable in
the MRS? Hard to see when that would help. Would be nice to be able to
underspecify ICONS so that some set of entities are possible antecedents
for a pronoun, either because of uncertainty or because of arbitrary
decisions (e.g., cases with no truth conditional differences).

- *John assigned Bill to himself.* &lt;= ambiguous: himself = John or
himself = Bill.

... argument about binding theory and how syntactic it is.

Larger question is how much of this is grammaticized/part of the
grammar; where is the interface. Can we draw a distinction between the
Francis examples (x's way) and the distribution of reflexives, such that
one is part of the grammar and the other isn't?

Many of these will be symmetric relations among sets of things =&gt;
multiple equivalent ways of writing down those sets of equations.

- x1 = x2, x2 = x3
- x2 = x1, x1 = x3
- ...

Would need to look for a canonical form.

If they could be set valued, could we avoid some of these problems? Can
identify a canonical form (and would need to) for either representation.
Doesn't solve the problem of need for disjunctive constraints. It may be
that the form of underspecification to support is just disjunction, if
we can't name the set.

Third type: can be equal? Would require further assumption that if there
was a can-be-equal then it has to be one of them.

Not the same formal status as HCONS in the sense that HCONS matter in
the formal meta-language (tree structures that satisfy the HCONS
constraints), not proposing same for ICONS.

Handles and individuals are very different right now: handles disappear
when the MRS is fully resolved. Might end up more similar if we use them
as meta-variables for the *can and must leave* case.

To get the ICONS influencing generation need to define a notion of
"compatible" between two sets of ICONS constraints. Not problematic
(given a computable notion of compatible) to check at the end.

That's what we're doing for HCONS, and there's a reason that works even
though Ann doesn't really want it to.

EB sketched how UW folks are thinking about using ICONS (with different
constraint types) for modeling information structure. Committed to
distributing a set of desiderata for how ICONS will be handles by the
processing machinery along with examples (grammar + sentences) before
Sofia.

Last update: 2012-05-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/WeSearch_ICONS/_edit)]{% endraw %}