{% raw %}# Background

For the first ten or so years of EDS support, there used to be only one
implementation of the conversion procedure, maintained by
StephanOepen as part of the Common Lisp MRS library
(which is typically loaded as part of the LKB, but is at times also
compiled stand-alone, for example to link with the PET parser). Starting
around 2014, RebeccaDridan has developed a C++
implementation of basic MRS manipulation, including conversion to EDS;
and in 2016 MichaelGoodman is adding EDS support to
the [pyDelphin](https://github.com/delph-in/pydelphin) libraries.
Although the basic conversion procedure (see below) is straightforward,
there are some ‘disambiguation heuristics’ involved that need to be
synchronized across EDS implementations. The purpose of this page is to
spell out in semi-formal terms all the relevant parameters and
heuristics that enable a deterministic result when converting a
(possibly mildly ill-formed) MRS to an EDS graph, no matter which
implementation of the conversion is used.

# Basic Procedure

# Predicate Modification

The [EdsTop](https://delph-in.github.io/docs/tools/EdsTop) page discusses the somewhat common instances of
‘fragmented’ EDS graphs owing to the incomplete ERG analysis of degree
specification on quantifiers, as for example *nearly every*. In no small
part to address these imperfections, conversion to EDS provides an
optional, semi-declarative mechanism akin to semantic *predicate
modification*, i.e. mapping the actual ERG analysis of the above to
something that one might interpret as nearly(every).

Predicate modification is triggered by certain classes of predicates who
‘lack’ an argument, i.e. conceptually the triggers are pairs of a
predicate pattern and an argument label, for example something like
〈/\_x\_deg$\|^\_quite\_x$ /, ARG1〉 for the ERG (in the Lisp
implementation the trigger patterns are configured as
\*eds-predicate-modifiers\*, while in mid-2016 the corresponding
argument labels are sadly hard-wired as ARG1). When there is an MRS
predication whose predicate matches one of the triggers, the conversion
procedure (a) checks that the corresponding argument (e.g. ARG1) is not
present or unbound (of type u), and that (b) there is at least one other
predication sharing the same label. Where this is the case, the argument
will be specified to become that label (in a sense creating what would
look like a self-referential structure if intepreted as an MRS), such
that the EDS node corresponding to the degree specifier (e.g. *nearly*)
will end up with an argument edge pointing to the node of the quantifier
(*all*, say).

# Disambiguation Heuristics

Up until the 1214 release of the ERG at least, there are some
predications that encode aspects of information structure rather than
core predicate–argument relations. These include the ‘discourse’
relations introduced by the grammatical constructions of passivization
and topicalization, as well as two-place relations that effectively
express an identity relation between two (distinct) instance variables.
The latter class includes the appos(ition) relation and the id(entity)
relation (used in tag questions and some coordinate structures); for
example in *Browne, the manager, arrived.*

      h:_arrive_v_1[ARG1 x0]
      named[ARG0 x0]
      _manager_n_of[ARG0 x1]
      h:appos[ARG1 x0, ARG2 x1]

These relations are generally dis-preferred (and are likely to be recast
in terms of ‘indvidual constraints’ in forthcoming versions of the MRS
framework), and there is a grammar-specific ‘black list’ of these
predicate names (called \*eds-non-representatives\* in the Lisp
implementation).

The most common cause of one-to-many correspondences between a variable
and a set of predications are labels shared with (non-scopal) modifiers,
e.g. in a structure like *she arrived very quickly*. Here, the degree
specifier is a non-scopal modifier on the adverb, which in turn is a
non-scopal modifier on the arriving event; thus, all three share one
label, and *arrive* is the ARG1 of *quickly*, which is the ARG1 of
*very*.

      h:_very_x_deg[ARG1 e0]
      h:_quick_a_1[ARG0 e0, ARG1 e1]
      h:_arrive_v_1[ARG0 e1]

To pick out *arrive* in this scenario, we dis-prefer candidates that
take any of the other candidates as their argument. This is a sound
topological heuristic, essentially operationalizing a notion of semantic
heads in groups of (logically) conjoined predications.

Far less frequent than the above are cases of two or more predications
sharing their label but lacking argument relations among them. In the
1214 release of the ERG, the ‘existential be’ constructions can give
rise to such configuration, e.g. in *there were cats in the garden*
(mrs/991). Here, the preposition shares its label with the
\_be\_v\_there, but its external argument (ARG1) is the *cat* instance
variable.

      _cat_n_1[ARG0 x]
      h:_be_v_there[ARG1 x]
      h:_in_p[ARG1 x]

Similar configurations can arise with ‘it clefts’, e.g. *it was Browne
whose manager interviewed Abrams* (csli/977). Here, the proposition
embedded by the \_be\_v\_itcleft relation shares its label with the
two-place poss(essor) relation holding between *Browne* and his
*manager*. To disambiguate cases like these, there is a dis-preference
for relations whose intrinsic variable is ‘untensed’ (where a
grammar-specific parameter—called \*eds-untensed\* in the Lisp
implementation—provides an appropriate test, as a pair of a variable
property and ‘untensed’ value).

Finally (for the time being), another systematic ambiguous class was
identified when comparing EDS conversion across different code bases,
viz. non-scopal modification of scopal predications, for example in
*Browne merely doesn't work.* (csli/795).

      h0:neg[ARG1 h1]
      h0:_mere_a_1[ARG1 e]
      h2:_work_v_1[ARG0 e]
      { h1 =q h2 }

For parallelism with, say, *Browne doesn't work* (and *Browne merely
works*), it is desirable to select neg in the above as the
representative node. To accomplish this, an extension (or maybe
generalization) of the initial ‘modifier’ heuristic (see above) is
applied, where for each of the candidates two sets of predications are
determined, viz. (a) the transitive set of *scopal* arguments and (b)
the immediate set of non-scopal arguments (in determining both sets, the
standard assumptions for conversion to EDS are applied, viz. selection
of one distinguished variable per predication and interpretation of =q
handle constraints as identity). For the example above, set (a) contains
the \_work\_v\_1 predication for neg and is empty for \_mere\_a\_1;
conversely, set (b) is empty for neg and contains the \_work\_v\_1
predication for \_mere\_a\_1. Given these argument relations, candidate
representatives are dis-preferred for which there is a non-empty
intersection of their set (b) with the set (a) for any of the other
candidates.

# Open Questions

Systematic comparison across three independent implementations of the
conversion procedure to EDS has uncovered a number of interesting
‘corner cases’. As can at times be the case, one might ask whether the
underlying ERG analyses are ‘well-formed’ (e.g. in the sense of meeting
the algebraic constraints assumed for MRS composition) or whether they
are linguistically fully adequate (in the sense of capturing strong
generalizations). However, the EDS philosophy tends to aim for
robustness to a broad range of MRSs, hence disambiguation heuristics
that lead to a deterministic result should be available for any such
cases, either way.

One complication is related to non-scopal modification of noun phrase
coordination Presumably for algebra-related reasons, the ERG does not
have access to the label of the group-forming conjunction relation
(which is embedded below a covert quantifier), and hence the modifier
ends up sharing its label with whatever predicate takes the group
instance variable as its argument. For example, for (a simplification of
csli/577) *A programmer and an engineer from Berlin were hired.*:

      h0:_and_c[ARG0 x]
      h1:_from_p[ARG1 x]
      h1:_hire_v_1[ARG2 x]

Obviously, the *hire* node should become the top of the corresponding
EDS graph, but it is not immediately obvious how to derive this result
in terms of observable MRS properties. The Common Lisp EDS conversion
has long used to resort to comparing ‘incoming’ and (transitive)
‘outgoing’ link counts to break ties between multiple candidate
representative nodes, like in the above. However, while higher degrees
of ‘connectivity’ with the graph at large may seem an intuitive notion,
links counts may of course still leave remaining ambiguity, and they may
also give unwanted results, for example if a non-scopal modifier in a
construction like the above had a rich internal structure.

Another unresolved corner case calls into question the general nature of
the above ‘untensed’ heuristic, as at least the existential *be*
construction can invoked in an untensed context, for example *There fail
to be bookcases in the office* (csli/217). Abstractly, this example
gives rise to a similar topology to the noun phrase coordination above:
a non-scopal modifier on an instance variable ends up sharing its label
not with predication introducing that variable (the cooordination
conjunction or the *bookcase* predication, respectively), but rather
with a predication that takes the instance as its (non-scopal) argument.

As a last disambiguation resort, EDS conversion might have to resort to
surface order, i.e. prefer representative nodes that linearly precede
their ‘competition’. Seeing as the relevant sets of modifiers in these
constructions (in English) tend to be post-head, such a simple heuristic
might actually come to the right result. However, it does not quite seem
linguistically very well founded ...

Last update: 2016-07-13 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/EdsConversion/_edit)]{% endraw %}