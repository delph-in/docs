{% raw %}## Notes on representations of PNG in (R)MRS

### Considering transfer, monolingual, and transfer-level underspecification

This topic arose because of an issue at the intersection of transfer
(harmonizing (R)MRSs across languages) and within-language efficiency.
In many languages, the agreement facts motivate underspecification
(e.g., the type "non third-singular" for English subject-verb
agreement), but the exact shape of that underspecification varies from
language to language. If two languages don't have the same set of
underspecified types in their hierarchies, transfer becomes painful. On
the other hand, if two languages do have the same potential for
underspecification, it would be nice to preserve that rather than
redundantly spell out all of the possibilities in the target language.

The proposal we arrived at was to come up with a grammar-external
representation for transfer (not necessarily really a type hierarchy)
that includes nodes for all of the possible underspecifications (a power
set) of person and number combinations. Individual grammars will provide
a mapping from their own types into this external representation. The
generator should (? already does?) allow for specialization of feature
values in order to generate from an underspecified input.

The external resource would only include person and number, because
these draw on a relatively small vocabularly in the world's languages
(3, maybe 4 persons, up to about 5 number distinctions) and because this
information should be preserved in transfer.

This contrasts with gender which generally shouldn't be preserved in
transfer. Certainly not for NPs (i.e., grammatical gender), and in the
case of pronouns, the right thing is probably to do reference resolution
first and then choose the properties of the target language pronoun on
the basis of the properties of the referent/antecedent.

However, the solution proposed here should allow gender to be included
in the types used for underspecification within languages (e.g., German
*sie* which is 3sg feminine or 3pl) --- the mapping out could 'lose' the
gender information. Doing this would require including gender in the
MRS, which is perhaps controversial.

The alternative proposal for gender is to include it not as a feature
but by subtyping pronoun relations (such that gender in effect only
appears in the MRS in pronouns). Thus English would have \_he\_n\_rel,
\_she\_n\_rel, \_it\_n\_rel, \_they\_n\_rel (briefly worry about
redundant specification of number contrast in feature and type). This
information is of value for reference resolution, which operates on
(R)MRSs. Using subtyping instead of a feature is meant to suggest that
this information is a constraint on the resolution of the pronoun: not a
property of the referent but a property of how it's being referred to.

It's clear that gender must be represented as a feature **somewhere**
because many languages show agreement in gender (or more generally, noun
class). On the other hand, this could be done with a syntactic AGR
feature. Representing (semantic) gender via rel subtyping does put some
constraints on analyses of pronoun incorporation in certain cases.
Consider the French example:

{{{Je l'ai cuite I 3sg-have cook-perf-fem 'I cooked it (fem sg)'}}}

In this case (assuming we're introducing pronoun relations for
pronominal affixes like so-called clitics in French) the pronoun
relation will be introduced by the prefix on the finite verb. However,
before a vowel, the contrast between *le* and *la* neutralizes. The past
participle shows feminine agreement. This can be handled by introducing
a local ambiguity at *l'ai*, where there are in fact two constituents,
one introducing \_le\_n\_rel and one introducing \_la\_n\_rel. They are
also distinguished in their value for the GENDER feature, and *cuite*
constrains the GENDER value of its argument to be feminine. This seems
somewhat redundant. (See also
[FeforDroppedArguments](https://delph-in.github.io/docs/summits/FeforDroppedArguments).)

Last update: 2006-06-21 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/FeforPng/_edit)]{% endraw %}