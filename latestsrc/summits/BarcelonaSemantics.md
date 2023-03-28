{% raw %}# Discussion: MRS Design

# Moderator: Laurie Poulson; Scribe: Antske Fokkens

# Objective

- What is the purpose of T&A in the MRS?
  
  - Define the temporal interpretation of the sentence.
  - Provide input to an external processor. -- Which processors?
  - Provide only that information needed to constrain
ungrammaticality.
- What should be in the MRS marking T&A?
  
  - Category labels, e.g., past, perfective, accomplishment
  - Semantic features, e.g., E, R, S; completive, bounded; durative,
telic
  - A combination of the two.
- Should T&A features be semantic or syntactic or both?
  
  - Does it depend on the language? on the construction?
  - What are the issues?
- What determines whether a verb gets it's own predicate? What are the
tests?
  - Scope, e.g., of negation?
  - Additional semantic content, e.g., wanted to eat, finished
eating
  - Is some interpretation of multiple events required?

# Notes

\* MRS design, focus on tense/aspect

Laurie: we started from a point to construct grammars that are
linguistically grounded. Lead to the first purpose question. For
instance, the issue of using a predicate or a feature, how to decide?

Berthold: discussion topic coming after: internal or external MRS? In
other words: shall we drop efficiency issues in favor of perfect
representation?

Stephan: Answer to what are internal and external MRSs: 2 layers of
representing semantics: feature structure and the real MRS, which used
to be not a one to one corresponding, but now leading to process of
extracting the actual MRS. There are grammar internal distinctions, not
relevant for the outside, but for several reasons part of the semantics.

Dan: example: it is useful to know whether something is coordinated or
not, this is not present in syntax in theory. This is registered in the
semantics (grammar internal in distinction), but is not part of 'to show
analysis'.

Berthold: interested in thinking about that, because of difference
between Hausa and German: aspect oriented versus tense oriented. When
doing mapping underspecifications need to be correct.

Laurie: it is hard to find an abstract representation that any language
would use: harmonizing will fail, specially with many languages at play.
In the end, one will need to use transfer rules.

Multiple Predicates?

Dan: Serial-verbs: we should ask Lars and Dorothee.

Berthold: multiple event approach: events are sometimes on items which
are not always events (e.g. adjectives)

Laurie: how to do things like serial constructions in MRS: you can not
change values in MRS, you can only specify them. There may be cases you
may want an event with an associated event, to prevent underspecifying
and having many defaults.

B: technically, for generation equivalence: it is easier to have
optionals as variants than as predicates. Information structure
features, it would be easier to underspecify using features than with
relations.

L: phenomena of interest: Russian secondary imperfective: prefective
verbs can take an imperfective marker (repeated perfective event), seems
like an additional predicate to me.

D: pseudo-criteria: the underspecification criterion is not simple. Now
it is easy to get more specific values when generating, but it does not
add new things, internal technical motivations are used for making that
choice.

B: there are cases where one would like to treat differently marked
items systematically as being identical.

D: at the cost of some additional ambiguity, we can retain monotonic
semantic composition. it is possible to have both an additional
predicate and a no additional predicate interpretation, coming from
different sources, which in certain cases will be disambiguated.

L: the concern is more about the form of the MRS (talk about later)
Strong belief each language comes in its own way.

L: is there a notion of what we are modeling exactly? How to use
features to consistently reflect the same thing (even within a grammar),
how to deal with sometimes marking morphology and sometimes marking
temporal interpretation

B: We shouldn't beat ourselves up to matching morphology and temporal
marking: some tense markings just happen to be a combination of certain
forms (this is morphology)

L: the question is what are people expecting from TAM-markings, what
information is useful?

D: it is all useful, maybe vital. But inference should be done
elsewhere, not in the MRS as unification. I'd be happier with a separate
component: take what our grammar gives us, and do these inferences from
there. I want to preserve everything that was there on the surface, that
is potentially relevant to the interpretation. This is my view today.
... There might be reasonable reasons to add inference, but we don't
know that yet.

Last update: 2009-07-27 by AntskeFokkens [[edit](https://github.com/delph-in/docs/wiki/BarcelonaSemantics/_edit)]{% endraw %}