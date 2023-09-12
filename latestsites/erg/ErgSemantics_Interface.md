{% raw %}# Background

The *Semantic Interface* (SEM-I) is a specification of the ‘vocabulary’
and associated wellformedness constraints used in ERG meaning
representations. In particular, the SEM-I inventories (a) the hierarchy
of *variable types*; (b) the range of *variable properties*, associated
value constraints, and appropriateness relative to variable types; and
(c) the hierarchy of *semantic predicates*, each paired with its
synopsis (‘argument frame’).

The notion of the SEM-I in the ERG continues a tradition of explicit
interface specification (that can be interpreted independent of the core
of the grammar) dating back to at least the
[Verbmobil](http://verbmobil.dfki.de/) project (in the closing decade of
the past century). In DELPH-IN, this concept was further developed in
the [DeepThought](http://www.dfki.de/deepthought) and
[LOGON](http://www.emmtee.net) projects, among others, and some
foundational reflections have been published by [Flickinger et al.
(2005)](http://www.mt-archive.info/MTS-2005-Flickinger.pdf). At about
the same time, StephanOepen developed the software
support (as part of the LKB environment) to largely automatically
extract the semantic interface specification from the grammar sources.
For the past ten or so years, each ERG release has provided an
up-to-date SEM-I, but some sections were missing or incomplete until the
ERG 1214 release (in mid-2016).

# A High-Level Tour

As of the 1214 release, the ERG SEM-I is comprised of four files, viz.
[erg.smi](https://github.com/delph-in/erg/blob/main/etc/erg.smi?raw=true), providing
(a) and (b) from the above list, plus a few manually curated parts of
(c);
[hierarchy.smi](https://github.com/delph-in/erg/blob/main/etc/hierarchy.smi?raw=true),
setting up a partial (multi-rooted), multiple-inheritance *hierarchy* of
semantic predicates;
[abstract.smi](https://github.com/delph-in/erg/blob/main/etc/abstract.smi?raw=true),
listing the inventory of *abstract* predicates; and
[surface.smi](https://github.com/delph-in/erg/blob/main/etc/surface.smi?raw=true),
spelling out the (much larger) inventory of *surface* predicates. For
the distinction between abstract vs. surface predicates, please see the
[ErgSemantics/Basics](https://delph-in.github.io/docs/erg/ErgSemantics_Basics) page.

Syntactically, the SEM-I implements a relatively lightweight syntax that
aims to balance readability for both humans and machines.

    variables:
    
      u.
      i < u.
      e < i : PERF bool, PROG bool, MOOD bool, TENSE tense, SF sf.
    
    properties:
    
      tense.
      tensed < tense.
      past < tensed.
      pres < tensed.
      fut < tensed.
      untensed < tense.
    
    predicates:
    
      abstract_q : ARG0 x, BODY h, RSTR h.
      existential_q < abstract_q.
      universal_q < abstract_q.

# Reflections on SEM-I Construction

When creating the files hierarchy.smi, abstract.smi, and surface.smi
automatically from the grammar-internal type hierarchy, a set of
heuristics is applied to decide which predicates to expose in the
external interface. In the 1214 release, the set of abstract SEM-I
predicates comprises some 120 entries, whereas there are some 500
abstract, non-glb types in the grammar-internal predicate hierarchy. In
other words, the SEM-I is masking a large number of distinctions that
the ERG makes internally (often for reasons of controlling syntactic
combination and composition).

In a nutshell, there are three main reasons for including predicates in
the SEM-I, viz. (a) observing a predicate in the semantics associated
with a grammar entity (lexical items and rules); (b) specializing a
predicate from (a) in the grammar-internal hierarchy; and (c) manual
stipulation in either the top-level SEM-I file (erg.smi) or a small set
of manual patches (maintained in 1214 as patches.lisp in the same
directory). Quantitatively, the vast majority of predicates are
associated with grammar entities, and of these, in turn, the by far
largest part are surface predicates. Inclusion of type (b) predicates is
motivated by the grammar at times specializing predicate (sub-)senses
during parsing (i.e. in a process one might call co-composition); for
example, verbs of motion can take an optional complement which has to be
interpreted as a directional, e.g. *She jumped in the lake in Berlin.*

Note that (in the 1214 release of the ERG) we take advantage of the
conceptual separation of the SEM-I predicate hierarchy vs. the
grammar-internal type hierarchy, to not only (a) hide many of the
grammar-internal predicate distinctions; but also to (b) introduce
additional abstractions not present in the grammar; and to (c) add some
parent–child links between predicates that are ‘missing’ in the grammar.
An example of (b) is the sub-division of quantifiers into broad classes
of existentials vs. universals (see above) and the (playful) addition of
a predicate abstraction (called nn) over different ways of realizing an
underspecified relation between two nominals, e.g. (generated from the
sample input in
[nn.mrs](https://github.com/delph-in/erg/blob/main/mrs/nn.mrs?raw=true)):

      A jungle lion arrived.
      A jungle's lion arrived.
      A lion of a jungle arrived.

An example of (c) above, finally, is making the temporal senses of
prepositions like *at*, *in*, and *on* specializations of the ‘general’
predicates associated with these prepositions, e.g.

      _in_p_temp < temp_loc_sp & _in_p.

Such additional parent links arguably violate an assumption made
grammar-internally, viz. that the ‘general’ predicates for prepositions
like \_on\_p exclude the temporal usage, i.e. correspond to
spatio-locative (e.g. stative or directional) usages only. However, an
empty sub-sense field in predicates (as is the case in plain \_on\_p)
conventionally interpreted much like a wildcard (i.e. sub-sense
underspecification), and hence it seems likely that providers of
generator inputs might expect a predicate like \_on\_p to enable
realization of a temporal relation, as for example in *on Monday*.
Without modification of the grammar-internal hierarchy, this expectation
can be satisfied by including the additional parent link in the SEM-I
predicate hierarchy.

# ‘Upward’ Extensions of the Predicate Hierarchy

# Software Support in DELPH-IN Processors

In June 2016, ACE provides full support for MRS comparison and
manipulation in terms of the SEM-I hierarchies; this ‘modern’ mode is
enabled by configuring a 2016-style SEM-I, e.g. (in the 1214 release of
the ERG):

      semantic-interface-2016    := "../etc/erg.smi".

At the same time, the LKB has migrated predicate processing (e.g. in MRS
comparison, transfer, and indexing grammar entities by semantic
contributions) to optionally be based on the SEM-I, whereas comparison
of variable types and properties in pure SEM-I terms has yet to be
implemented. This (semi-)‘modern’ mode in the LKB is closely tied to the
recent rationalization of predicate serialization (see the Spring 2016
discussions on the ‘developers’ mailing list) and is thus activated as
follows (e.g. in lkb/mrsglobals.lsp in the ERG):

      (setf *normalize-predicates-p* t)

# References

Last update: 2023-09-12 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_Interface/_edit)]{% endraw %}