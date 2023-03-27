# Terminology

ERG meaning representations are couched in Minimal Recursion Semantics
(MRS; Copestake et al., 2005), which is conceptualized as a
meta-language for the description of logical forms in a suitable object
language. Formally, the meaning representations are triples 〈*T*, *R*,
*C*〉, with *T* being the (global) *top handle*, *R* a set of
*elementary predications*, and *C* a set of *handle constraints*.

Each elementary predication (EP) is comprised of a *predicate symbol*
(henceforth simply *predicate*; an identifier of the relation) and a set
of *role*–*argument* pairs, where the roles draw from a small, fixed
inventory of role labels (ARG<sub>0</sub>, ..., ARG<sub>n</sub> for
‘regular’ arguments; RSTR and BODY on generalized quantifiers; and a few
others in more specialized constructions). Role values (i.e. arguments)
are variables. Predicates can be optionally parameterized by one or more
constant arguments.

Finally, *handle constraints* are an element of the MRS mechanics of
scope underspecification, expressing a binary relation between two
labels. The ERG limits itself to only one type of handle constraint,
called ‘qeq’ (or =q), representing label equality modulo quantifier
insertion.

# Variable Types

There are three types of variables in MRS, *event(ualitie)s* (of type
*e*), *instances* (of type *x*) and *labels* or *handles* (of type *h*).
Of these, the latter serve a formalism-internal role, i.e. assuming a
suitable variant of predicate logic as the object language, MRS labels
do not map onto logical variables. Eventualities and instances, on the
other hand, prototypically correspond to verbal and nominal expressions,
respectively. In addition to these most specific variable types, there
are underspecifications as follows: *i* (for *individual*) is a
generalization over eventualities and instances; *p* (the half-way mark
in the alphabet between *h* and *x*) is a generalization over labels and
instances; and *u* (for unspecific or maybe unbound) generalizes over
all of the above. Note that Copestake et al. (2001) use *individual* for
what is called *instance* here.

Non-label variables can be ‘refined’ with what is called *variable
properties*, e.g. TENSE or SF (sentence force) on eventualities, and
NUM(ber) or PERS(on) on instances. Variable properties range over a
fixed inventory of possible values, organized in a multiple-inheritance
hierarchy to allow underspecification.

# Intrinsic Arguments

In the ERG, all elementary predications have an ARG0 role, providing the
*intrinsic argument* of a relation, e.g. the instance variable
corresponding to a nominal expression, or the eventuality corresponding
to a verbal expression in a (Neo-)Davidsonian representation. This
intrinsic argument has also been referred to as the *distinguished
variable* (Oepen & Lønning, 2006) or *characteristic variable*
(Copestake 2009). We will at times say that a predication ‘introduces’
its intrinsic argument. Moreover, no variable will appear as the
intrinsic argument of more than one predication in the semantic
representation of an utterance.

For a blend of linguistic and technical reasons, the ERG also introduces
intrinsic variables in the semantics of, among others, adjectives,
adverbs, and prepositions–eventualities in all three cases (for further
background, see the
[ErgSemantics/Design](ErgSemantics_Design#intrinsic-arguments-on-adjectives-and-adverbs) page).

# Surface vs. Abstract Predicates (and Naming Conventions)

ERS predications are comprised of a predicate and a set of labeled
arguments, e.g. something like

      h:_see_v_1[ARG0 e, ARG1 x1, ARG2 x2]

The predicate symbols can be divided into two classes: *surface*
predicates and *abstract* predicates (where related terminology, with
subtle variation in definitions used throughout the years, includes
*real* vs. *grammar* predicates, as well as *object-level* vs.
*meta-level* predicates, respectively).

Surface predicates follow a naming convention where the symbol is
composed of three components, called *lemma*, *pos*, and *sense*, and
the *pos* field (despite its morpho-syntactic name) serves to make
top-level semantic sense distinctions that mostly align with a coarse
inventory of word classes, e.g. ‘v’(erbal), ‘n’(ominal), or
‘q’(uantificational). Surface predicates, by convention, are marked by a
leading underscore (‘\_’; U+005F); as the finer-grained *sense* field is
optional, this means that surface predicates will contain between two
and three underscores, including the initial one. Surface predicates are
exclusively introduced by lexical entries, whose orthography is a
(possibly inflected) form of the lemma field in the predicate.
Conversely, the vast majority of lexical entries introduce surface
predicates.

Abstract predicates, on the other hand, constitute a smaller class. They
are used to represent the semantic contribution of grammatical
constructions or more specialized lexical entries (such as compounding
or the comparative use of *more*, respectively). By convention abstract
predicates must start with a character other than the underscore (but
may include any number of underscores).

Predicate symbols (surface or abstract) are *not* case-sensitive and by
convention are typically rendered in all lower-case letters.

# Parameterized Relations

To avoid proliferation of predicates, some relations are parameterized,
i.e. include a parameter (which technically is distinct from the
arguments of the predication and typically will correspond to a constant
in an object-language logic). Parameters are represented as
*case-sensitive* strings. In the ERG at least, no relation takes more
than one parameter.

For example, proper names are represented as follows in the ‘fingerprint
language’ (see the [ErgSemantics](ErgSemantics#semantic-fingerprints)
page for background):

      named(Abrams)[ARG0 x]

Conversely, in a popular serialization format for complete MRSs (the
so-called *simple* MRS serialization; see the [MrsRfc](MrsRfc) page),
parameters are interspersed with regular arguments, using the (strictly
speaking ERG-specific) pseudo-role label CARG:

      named[ARG0 x, CARG "Abrams"]

# Terminology of Convenience

In describing the analyses in ERS, it is often convenient to refer to
well-defined MRS fragments, i.e. interconnected groups of predications
that do not necessarily constitute the full ERS for an utterance. In
doing so, we differentiate between groups of predications ‘centered’ on
an EP with an intrinsic variable of type *e* vs. those centered on an EP
with an intrinsic variable of type *x*. As an informal terminology of
convenience, we employ the terms *situation* and *group* for these,
respectively.

Semi-formally, a situation on this view includes (a) the ‘main’
predication (prototypically contributed by a verb, but possibly by a
preposition, adjective, adverb, or other syntactic category); (b) the
full semantics of all of its arguments; and (c) the full semantics of
all of its non-scopal modifiers. For example, in the semantic
representation associated with *Kim believes that Sandy probably left
early.*, the situation centered on the *believe* EP includes the entire
ERS; the one centered on the EP corresponding to *probably* the semantic
contributions of *probably*, *left*, *early*, and *Sandy*; and that
centered on the *leave* EP only the semantic contributions of *left*,
*early*, and *Sandy*. Similarly, in the ERS for *He was a loving
husband.* we can identify a situation centered on the *love* EP which
includes the predications associated with *loving*, *husband*, and *a*.

Nearly analogously (and still quite informally), a *group* includes (a)
the ‘main’ predication, introducing an intrinsic instance variable (here
typically contributed by a noun); (b) the full semantics of any
(non-scopal) modifiers of the noun (including complex ones, like
relative clauses); (c) the quantifier predication which ‘binds’ the
intrinsic variable of the ‘main’ predication; (d) the full semantics of
any arguments of the ‘main’ predication, in the case of relational
nouns. For example, in *The dog that barked at that car slept.*, the
group centered on *dog* includes the full ERS with the exception of the
semantic contribution of *slept*; while the group centered on *car*
includes only the semantic contributions of *car* and *that*.

We will call an *operator* any predication that takes at least one
scopal (i.e. label-valued) argument, e.g. negation, and the relations
introduced by scopal adverbs like *probably*, modal operators like
*must*, and verbs like *doubt*. The scopal arguments of operators are
always situations (in the current ERG), and the operator together with
its argument(s) denotes a new (complex) situation.

# Non-Scopal Arguments

Beyond its intrinsic argument, a predication can take additional
arguments, for example to encode the two ‘participants’ in the two-place
*eat*(ing) relation corresponding to an utterance like *The girl ate an
apple.* Here, the two nominal arguments will each introduce a quantified
instance variable, call them x<sub>1</sub> and x<sub>2</sub>, which will
be bound to the ARG1 and ARG2 roles in the predication introduced by
*eat*. Non-label arguments (i.e. variables of types *x* or *e*, as well
as of their underspecified supertype *i*) are called *non-scopal*, i.e.
such variable bindings do not correspond to subordination (or a
dominance relation) in the scope tree for an utterance.

# Scopal Arguments

Arguments to predications that are of type *h* (i.e. a label) are called
scopal arguments. These appear across a range of predication types,
including quantifier predications which have scopal arguments for both
their restriction (RSTR) and body (BODY) positions, and predications for
verbs such as *believe* or *ask* which can embed situations, and other
one- or two-place scopal operators such as *not*, *probably*, *before*,
*because*, etc.

# Quantification

The ERG assumes that all instance variables (of type *x*) are bound by a
generalized quantifier, i.e. a predication whose ARG0 (or BV in some
derived MRS views) is the instance variable, and whose restriction
(RSTR) is the predication that has the variable as its intrinsic
argument. As Copestake et al (2005) argue, the syntax of English leaves
the body of quantifiers unconstrained and provides a partial constraint
on the restriction, while the semantic contribution of the nominal
constituent that a quantifier-predicate-introducing element attaches to
in the syntax is required to be within the restriction of the
quantifier. Thus in the ERG, the BODY of quantifier predications is left
unconstrained, while the RSTR is linked to the semantic contribution of
the nominal constituent, via a qeq constraint:

      h0:*[ARG0 x]
      [ARG0 x, RSTR h1]
      { h1 =q h0 }

# Non-Scopal Modification

Among non-scopal argument relations there is a distinguished class where
the argument-taking predication shares its label (i.e. its position in
the scope tree) with the predication that introduces the argument as its
intrinsic argument. For example, the ERS for *Every white cat is deaf*
includes the sub-structure

      h:_cat_n_1[ARG0 x]
      h:_white_a_1[ARG0 e, ARG1 x]

where x is the intrinsic argument of \_cat\_n\_1 and the ARG1 of
\_white\_a\_1, and both predications share one label (viz. h). This type
of configuration and its role in our analyses are described further on
the [ErgSemantics/Design](ErgSemantics_Design#non-scopal-modification)
page. When mapped to an object language, label sharing will typically
correspond to logical conjunction, e.g. for the above something akin to
*cat(x) ∧ white(e, x)*.

We note here that scopal operators, whether introduced as heads or
modifiers in the syntax, are indistinguishable in the semantics, and so
from a semantic representation point of view, there is no such thing as
a scopal modifier.

# More Information

-   [ErgSemantics](ErgSemantics) main page

-   [Inventory](ErgSemantics_Inventory) of semantic phenomena (to be)
    documented

-   [How to cite this work](ErgSemantics_HowToCite)

# References

Copestake, A., Flickinger, D., Pollard, C., & Sag, I. A. (2005).
*Minimal Recursion Semantics. An introduction*. Research on Language and
Computation, 3(2-3), pp. 281–332.

Copestake, A., Lascarides, A., & Flickinger, D. (2001). An algebra for
semantic construction in constraint-based grammars. In *Proceedings of
the 39th Annual Meeting of the Association for Computational
Linguistics* (pp. 140–147). Toulouse, France.
