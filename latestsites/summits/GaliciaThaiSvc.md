{% raw %}Notes from [Galicia Summit](https://delph-in.github.io/docs/summits/GaliciaSchedule) discussion of serial verb constructions in Thai.

* [Vipasha's slides](https://github.com/delph-in/docs/blob/main/summits/2023/ThaiSVC.pdf?raw=true)
* Scribe: Emily

Dan: VP VP vs. nested structure in the one with the kitchen. Another way you might look for evidence is to consider coordination, where there would be different predictions about what part of that sentence could be coordinated. Can you run to come buy a book and go eat a cookie? If you could, that would strongly favor the left tree.

Vipasha: Have to ask my consultants...

Dan: It's another familiar but not perfect test for structure. Coordination is messy, but a good heuristic.

Glenn: I'm sure you're familiar with Nuttanart Muansuwan's thesis. I think she said that the directional ones can get the most extension, up to 5.

Vipasha: Those are the ones that need a phrase structure rule. She argues that these have a VP over VP structure, and so need a phrase structure rule.

Glenn: I think I took a stab at it (in the grammar) but probably didn't get far enough. Can try to take a look. Always amazed that these sound natural to native speakers.

Vipasha: In English we'd do a long string of PPs.

Glenn: Doesn't get the same nuance.

Berthold: You're using syntactic features to control which verbs can appear as a satelite, but the feature names look semantic. Why not make those variable properties?

Vipasha: They are relevant in terms of which verbs combine, but the final semantics we want is directional, resultative, etc, not intention in the MRS.

Berthold: One thought was putting them as properties on the variable of the embedded verb. Another way would be to have an ontology of the relations. Mini type hierarchy  of the PRED values. _intention_rel as supertype of the intention verbs.

Emily: Variable properties don't seem like the right place -- where else do we use them to expose something inherent about the predicate? And building an ontology of predicates seems like too much work in this case.

[Scribe was busy arguing]

Emily: Where else in the grammars are we doing something like using features on variable to express lexical aspect?

Berthold: Maybe at some point in GG, but not consistently.

Emily: There may be a way to do this in an ontology of predicates, but that seems like too much work.

Guy: Aren't we already doing small hierarchies of predicates?

Emily: Only in closed classes.

Dan: It's Petter who is doing something broader with verb predicates.

Guy: Aren't the features inherently extending the hierarhcy?

Guy: Do these feature values always come from the lexical entry?

Vipasha: Yes -- they are a part of the verb.

Emily: But it's a hypothesis that that follows from lexical semantics. Seems like the more practical approach is to build it this way and then look, like Petter is doing, across the lexicon. Rather than start with strong claims about lexical semantics...

Berthold: New question: Why not do it all phrasally? Muansuwan's arguments about adverb placement.

Eric: Do these serials verbs always occur on the same label along with their rels?

Vipasha: I did it that way in my target MRSes. Do you think it's better not to?

Eric: I like it that way.

Dan: How does it interact with negation? One negation for all of them?

Vipasha: With posture verbs, you would negate the whole thing. Specifically with resultative, it works a little differently --- can only have one negation in the construction, but can be one or the other.

Emily/Dan: So for resultatives then it would have to be scopal between the result predication and the ARG2 of it.


Last update: 2023-06-27 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/GaliciaThaiSvc/_edit)]{% endraw %}