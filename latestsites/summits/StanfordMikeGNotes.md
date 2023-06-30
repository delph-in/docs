{% raw %}Very rough notes (scribe's apologies).

MT, transfer — big topics, not addressed to a big extent in this talk.

Big goals: use SMT instead of n-grams.

Rule-based transfer is powerful but not so scalable to many language
pairs.

Method: parse bitext corpora to get bisem corpora.

MRS paths: formalism for MRS subgraphs, easy hashing, but reentrance’s
are gone, so lossy "Headed\* walk": EQ links in DMRS and quantifier
links —&gt; singly rooted DAG

\*head — need to clarify the term, it is not very well-defined.

simple transfer model: count subgraphs, identify more frequent ones

decoder: translated one sentence from the training data, also was very
slow, so had to do optimization

after transferring MRSs, they need to be augmented.

Since last year, simplified [MrsPaths](/MrsPaths) to singly rooted DAGs.
Can deterministically relable node-identifiers.

the [MrsPath](/MrsPath) representation is similar to ?? (AMR?)

Regaining the reentrant structure is an advantage

representing semantics in a way that people have seen before is
important for making the tool visible/popular

Arboreal MRS can be serialized

inversion of the modifier-quantifier edges

compare ERG and JACY over 2000 sentences

all parsed graphs were connected graphs (ERG)

JACY, there are subgraphs that are lost in sem-headed

Findings:

trying to map semantic subgraphs across lang.

some increased distances are introduced in the semantic constructions

Francis: it is the wrong path is part of the reason the distance is so
long

graph simplification: if you have a sentence like “I think what he said
is true in a sense” the headedness property means you can take the
branches of the tree, each branch a cohesive unit…

that helps in tracking subgraphs that are meaningful

quantifiers that are predictable we can do away with and reintroduce
them later, and find useful mappings easier

other kinds of simplificarions : if ARG1 shares … with ARG2,

lossy transformations are not always bad

Jap. topic marker, points to the thing that is the topic and if you
remove it you don’t change too much

you can still get the relationships between the predicates

on extracting subgraphs, there is a cost function associated with
breaking the reentrancy, two choices, remove or resolve (to the thing
that it points to). Need to see how that changes the performance of the
model.

Started implementing the MT pipeline, was too ambitious for one PhD
project. I would like to work more on getting alignment on the
subgraphs. in literature, few people assume structure on both sides,
usually a tree to string or something like that, not tree to tree. A NTU
work: a node has multiple entry-exit points, hyper graph, “language
evolution”, the vector is a sentence, and a semantic representation of
that. Then look which structure matches it better (?). That’s one other
method I could try to improve the alignment.

Decoding: matching predicates themselves. Did not try to align the
internal locations, the arguments of these things.

Finishing: need to make the output MRS generable.

\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*
Q/A:

Guy: converting to rooting days; things like compound-rel (?), when both
thins are neq(?) the thing that looks more like the modifier. difference
between eng and jap; cases wen you don’t get a single-footed graph?

Mike: I did not see something that stood out as such. Compound-Rels
would be descendants.

SO: In ERG I would expect compound-rels to be non-scopal

Dan: compound-rel should look like a corresponding prepositional phrase

Guy: “black and white” (?) when you have an eq between an and dog.. then
you need a direction (?)

Mike: that would be… now that I am aligning reentrancies that is not a
problem. “ Kim arrived at 3:20” —

Dan: there was less than optimal analysis of time expressions. In the
latest version this example should be (?)

Mike: if you can get a full-spanning graph, it is an indicator of a
good(?) mrs

Berthold: the main motivation is that hand-crafted approach won’t scale
up. Have you experimented with other language pairs? What would it take?

Mike: the assumption is that we have competent grammars

Berthold: we have more than 2!

Mike: I don’t know what to expect but I would like to try. There are
differences bewteen ERG and JACY that I noticed.

Francis: comment: in Jap-Eng thing, current impl. learns things like dog
toes to blah and so forth, hope is adding a new lang pair, there is a
small hand-built comp and a large learned component, which is template
based. Possible spin off: Mike can learn pairs which we haven’t seen
before. Flexible alignment allows to learn new rules, which can then
constrain the space for decoding.

Last update: 2016-06-17 by OlgaZamaraeva [[edit](https://github.com/delph-in/docs/wiki/StanfordMikeGNotes/_edit)]{% endraw %}