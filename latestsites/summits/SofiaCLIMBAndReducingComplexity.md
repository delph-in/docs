{% raw %}## Part 1: Reducing Feature Structure Complexity (Lars)

Whether to try to reduce the complexity of the feature structures that
the Matrix and other grammars use (after Pollard and Sag).

(This section began as personal notes kept by Ned, so are somewhat
biased towards where this area intersects with detecting linguistic
phenomena. Sorry!)

### Discussion

Emily: There is probably some scope for removing some features,
difficulty will be convincing all the grammar developers.

Work required to explore this overlaps with Ned's work...

Antske: Would be interesting comparing parts of the grammars that are
shared, ie re-entrancies.

Emily: the points of the grammars where it's interesting to compare them
is in the MRS.

Start by comparing feature geometries across grammars. Similarities in
the way grammars use structure sharing.

Start with Antske's spring cleaning code to explore grammars. Yi's
student also has some Java code for doing stuff with TDL, more for the
purposes of creating new representation that is more efficient.

Can also use Python code that the Matrix developers have for
manipulating TDL.

Yi is interested in looking for detecting redundant features. Also doing
things like looking for constraints that never lead to unification
failure.

## Next steps

First step: run tdl processing code through grammars and extract
re-entrancies and value changes. This should be easy to do. Next:
investigate which groupings are found, where feature-paths could be
shortened. Finally, we would like to find the link between constraints
used in the grammar and the linguistic ideas behind their location in
the feature structure. This would however require careful analysis of
the grammar.

## Part 2: A Discussion on CLIMB (Antske)

Introduction from Antske:

How can we organize it to make grammar engineers more comfortable using
it? Can we organize TDL in order to make it easier to read?

Have it so that you can define different parts of the types in different
locations, such that it's better organised by phenomena. But we want to
make it so that you can still just write TDL without worrying about
Python.

This sort of organisation would also allow for better comparison across
grammars. It would allow us to build a cross-linguistic library of
phenomena that would be a valuable resource.

## Discussion

Ned: There's the question of discoverability. How to make these
libraries queryable?

Emily: Good to emphasize this in the development of grammars in this
way. But we shouldn't aim for perfect discoverability because phenomena
will vary across grammars and languages; this just isn't possible.

Antske: When testing for where phenomena are implemented it is common to
parse a sentence and look at the types involved. It could be a good idea
to have a place to document these discoveries.

Ned: It would be good to have a tool which helped faciliate this process
of discovering the relevant types from grammar.

Emily: Doing a gDelta style clustering over types from attested examples
of phenomena could be done here.

Emily: We need resources for this. Eg: we can't come up with these
examples for Wambaya like we can all do for English when probing the
ERG.

Yi: Haven't switched to CLIMB approach becuase we have a short period of
time for a complete cycle in the development process (around 2 hours).

Having to switch between thinking about procedural code generation
approach, and then the declarative approach of TDL adds an overhead. It
would be nice for the whole thing to be done in the declarative level.

Emily: like the idea of having a declarative formalism which associates
particular tdl with a flag saying which analysis it belongs to.

Antske: We need to look at what are clear and consise ways to define
things like cross-classification etc.

Emily: There'll always be two levels (the metagrammar and the grammar)
but at least it would all be declarative.

Antske: Feedback from people starting to use these techniques would be
great. Need to work out which things work, and which things could be
done better.

Emily: making CLIMB declarative is a great idea.

Antske: Yes, and it's also relativity feasible.

Emily: collecting more phenomena resources eg MRS test suite from
[NorSource](/NorSource)

Emily: more discussion about this on Matrix list!

Ned: We need a centralised place on the wiki to start talking about
phenomena based grammar engineering and resources. Volunteered to create
a [PhenomenaTop](https://delph-in.github.io/docs/garage/PhenomenaTop).

## Next Steps

Antske will start to redefine CLIMB so that tdl can be used to write the
metagrammar. The metagrammar should only require regroupments of types
and constraints according to the phenomenon they implement or problem
they solve (something that should be done for reasons of documentation
anyway). Second, we need to start documenting phenomena at locations
where they can be found easily. As a first start, we will use the
delph-in wiki.

Last update: 2012-07-10 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SofiaCLIMBAndReducingComplexity/_edit)]{% endraw %}