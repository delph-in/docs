{% raw %}# Arboreal MRS Discussion

SIG at [Stanford 2016 summit](https://delph-in.github.io/docs/summits/StanfordSchedule)

===

Mike Goodman: \[edited\] DMRS and EDS already simplify MRS graph
structure, but the result is still a multi-rooted DAG, which leads to
complexity in serialization and graph analysis. I propose using a more
tree-like structure, which makes interesting and "cohesive" graph
structures (a) more intuitive to human readers and (b) easier for
computers to notice. Furthermore, EDS and DMRS look very similar in this
notation, with the exception of POST labels. Inverted edges (evidenced
by "-of" suffix on edge labels) allow the non-primary roots become
descendants.

Guy Emerson: There are two things we could be talking about here: a
different notation for EDS/DMRS, or a rooted graph - different
theoretical status.

Stephan Oepen: At the outset, two (slightly different) types of
dependency graph: EDS, and DMRS. Main differences: POST overlays, and
some undirected edges (being addressed). And occasional creative
differences, like "nearly every". Issue is to convert these graphs to
singly-rooted DAGs, either based on what constitutes a non-scopal
modifier, and the other by walking the graph. Is there is a unique
solution for either method? It's possible that the order in which order
you reach nodes changes the output.

Guy: An undirected cycle?

Woodley Packard: "persuaded Kim to leave", several ways of serialising
it...

===

Various options discussed during SIG:

\(1\) persuade

- 2 Kim \[\] 3 leave
  - 1 \[\]

\(2\) persuade

- 2 Kim
  - 1-of leave \[\]
  
  3 \[\]

Same EDS/DMRS as (1), but different if considering 1-of as a directed
edge in the other direction

\(3\) persuade

- 3 leave
  - 1 Kim \[\]
  
  2 \[\]

Same EDS/DMRS as (1), and also the same when "-of" links are considered
flipped; different serialisation from (1)

\(4\) Kim \[\]

- 2-of persuade
  - 3 leave
    - 1 \[\]

When considering "-of" links as flipped, this graph is cyclic:
re-entrancy points to a dominating node

\(5\) leave \[1\]

- 1 Kim \[2\]

persuade

- 2 \[2\] 3 \[1\]

This is the same graph as (1), but as a serialisation, this is no longer
singly rooted.

===

Guy: When traversing the graph, we could choose to visit edges
depth-first in order (ARG1, ARG2, ARG3), to get (1); or we could flip as
few as possible, to get (1) or (3). Or we could minimise cycles in the
graph (not 4)

Stephan: Is there a canonical solution?

Mike: We could just pick a node and let things fall off it. If we want
to order nodes based on some function, that's something we could do, but
we could have a canonical default option.

Woodley: Asking for subgraphs to be the same in two different contexts
may be asking for more than you can have. For example, with
re-entrancies.

"Abrams persuaded Kim to leave"

"Kim left"

"Kim, who left, slept"

So do we care about making these look the same?

Mike: I can imagine I would like these to be the same, but it's nice to
know that they're different. I'd like to transform them to be the same
(could be useful for MT), but as default, they would be different.

- \[Note from Mike: this transcription is accurate, and my apparently
inconsistent stance induced some laughter, so let me rephrase:
Ideally, "Kim, who left, slept" and "Kim, who slept, left" would
have structurally different, but consistent, serializations (i.e.
even ignoring DMRS POST edge labels; where \_leave\_v\_1 is inverted
in the former, and \_sleep\_v\_1 is inverted in the latter).
However, for some applications (e.g. graph similarity metrics,
subgraph extraction for MT), it is useful to know the original
directions, too (e.g. to avoid model sparsity). In AMR the choice of
top node encodes something like focus, so the interpretation of
"(Kim :ARG1-of \_leave\_v\_1)" is something like "Kim, who left"
while (\_leave\_v\_1 :ARG1 Kim) is more like "Kim left". Also, the
direction of the edge may be more important in EDS than DMRS,
because DMRS can use the POST labels to encode the same information
(e.g. in "Kim, who left", the edge has a /EQ POST, where in "Kim
left" it doesn't).\]

Guy: This comes back to whether we are serialising EDS/DMRS graphs or
modifying them...

Woodley: but we have "leaves" in the serialisation. So why are we
serialising? Mike is doing it to compare tree fragments, so it does
matter what the serialisation is.

Stephan: We found directed cycles in AMR, if edges are flipped as
annotated - but if we normalise the graphs, then the cycles go away. (CL
forthcoming). So it comes back to whether this about notation, or about
different graphs.

Stephan: AMR people have a notion of "pulling up" a node, e.g. for
focus. We similarly have "top"

Woodley: serialisation singly-rooted or graph singly-rooted... see (5)

===

Mike: Another possible transformation is to change some nodes to arcs.

Guy: Like bilexical dependencies of Angelina et al. (DM)

Stephan: Yes, seems similar to what we did for (some) abstract
predicates there, e.g. compound relations. Also Stanford dependencies.
Won't be lossless if the preposition is modified or conjoined (nearly in
/ in or on)

Mike: still lossless if we don't convert those cases...

Guy: It's impossible whenever there are multiple outgoing edges

Mike: And only for binary relations

Alex Kuhnle: Including transitive verbs?

Stephan: They are formally equivalent, but the corner cases are much
more common. Prepositions are a small class.

Mike: Number example on the slide... nominalisations...

Stephan: We're now discussing graph transformations that make your job
easier, without losing important information

===

Mike: Can we unify our representations?

"nearly all" - EDS, add in ARG1; DMRS: MOD/EQ link

Stephan: I like that proposed revision in DMRS arrives at same topology
as ‘predicate modification’ treatment in EDS.

Mike: Any other distinctions? Both solved scopal arguments.

Stephan: Not a theoretical distinction, but EDS appears to have more
‘disambiguation’ heuristics for shared labels, and code may be more
robust, to deal with ill-formed MRSs.

===

Mike: Compare algorithms?

Stephan: use depth-first traversal with canonical order (no principled
assumptions about headedness)

===

Agreed we don't need a special name for a serialisation of MRS. Agreed
not to call it "AMR" or "AMRS", but we can acknowledge inspiration.

Penman?

Mike and Stephan will go think about it... and also discuss canonical
serialisation.

Last update: 2016-06-27 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/StanfordGraph/_edit)]{% endraw %}