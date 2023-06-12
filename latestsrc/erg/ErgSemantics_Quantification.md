{% raw %}# Overview of Quantification

The ERG assumes that all instance variables (of type *x*) are bound by a
generalized quantifier, i.e. a predication whose ARG0 (or BV in some
derived MRS views) is the instance variable, and whose RSTR and BODY
arguments can be resolved in a fully-scoped MRS such that all instances
of that variable are included within them. The representations output by
the ERG are not fully scoped, but in fact underspecified, providing
partial constraints on scope only as motivated by the syntax of the
language. In particular, as Copestake et al (2005) argue, the syntax of
English leaves the body of quantifiers unconstrained and provides a
partial constraint on the restriction, where the semantic contribution
of the nominal constituent that a quantifier-predicate-introducing
element attaches to in the syntax is required to be within the
restriction of the quantifier. Thus in the ERG, the BODY of quantifier
predications is left unconstrained, while the RSTR is linked to the
semantic contribution of the nominal constituent, via a qeq constraint:

      h0:*[ARG0 x]
      [ARG0 x, RSTR h1]
      { h1 =q h0 }

# Predicate hierarchy

Quantifier predicates in the ERG are organized as a hierarchy rooted in
the type *abstract\_q*, with subtypes *universal\_q*, *existential\_q*,
and *thirdtype*. The universal quantifiers include the surface
predicates *\_all\_q, \_each\_q, \_every\_q*, and *\_each+and+every\_q*,
as well as the additionally constrained *\_both\_q* and *\_either\_q*.
The existential quantifiers include the surface predicates *\_a\_q* and
*\_some\_q*, as well as a variety of abstract and surface predicates
which currently encode in the predicates themselves some distinctions
which might be better expressed as properities of the bound variable,
including deixis (proximal and distal) and definiteness. Also included
as subtypes of *existential\_q* are distinct but possibly superfluous
abstract predicates that bind variables for proper names (*proper\_q*)
and pronouns (*pron\_q*). Quantifiers which are neither existential nor
universal include *\_most\_q, which\_q*, and *\_no\_q*, as well as a
special predicate *idiom\_q\_i* used in the ERG's treatment of idioms,
and a variety of other surface predicates introduced lexically. The full
hierarchy of quantifier predicates is shown here:

\[add graphic of quantifier hierarchy here\]

# Abstract quantifier predicates

The interpretations of the abstract quantifier predicates are grouped by
the three most general subtypes:

existential\_q

- def\_explicit\_q - Lexical entries of several types with decomposed
semantics introduce a definite quantifier predication: (1)
determiners with decomposed semantics, including possessive pronouns
such as *his*, the possessive clitic *s*, and names of months of the
year, treated in the ERG as determiners for e.g. *July 10*; (2) some
nominal adverbials such as *awhile* where the orthography still
reflects an overt determiner, as well as some adverbials such as
*earlier* that should be corrected to *def\_implicit\_q* since the
determiner is not overt.
- def\_implicit\_q - Several kinds of lexical entries with decomposed
semantics introduce a definite quantifier predication, though the
word is not itself a determiner. These include nominal adverbials
such as *here* and *now*, nominal possessives such as *hers* and
*mine*, and adjectives such as *next* and *last* which can also
satisfy the determiner requirement for temporal nouns, as in *next
week will be convenient*.
- free\_relative\_q and free\_relative\_ever\_q - Free relatives such
as *whoever* and *whenever* have a decomposed semantics in the ERG,
introducing an implicit quantifier binding the variable of the
relevant entity.
- number\_q
- pronoun\_q
- proper\_q
- some\_q
- udef\_q

universal\_q

- every\_q - This predicate subsumes the two surface predicates
*\_every\_q* and *\_each+and+every\_q*.

# Additional Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) Main Page
- [How to Cite this Work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2016-05-09 by DanFlickinger [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_Quantification/_edit)]{% endraw %}