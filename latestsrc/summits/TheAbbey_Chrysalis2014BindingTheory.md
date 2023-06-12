{% raw %}Emily: Might be able to suspend my allergy…

Dan: Do we want to use the same representation for coreference chains as
we do for Binding Theory?

Emily: No, binding theory is potential constraints on coreference
chains, not actual coreference statements.

Dan: What about "he craned his neck"? That's surely the language telling
you those have to be coreferent.

oe: Do we really want pron\_rel there?

Emily: Maybe like reflexives in French/Spanish type languages where it's
marked morphologically (se-) as opposed to a true independent word.
(soi-même is really the emphatic use, not the true reflexive).

oe: Scandinavian language also have inherently reflexive verbs.

Emily: But I think that the sag selv forms are also reflexives that
might need a pron\_rel, though they are subject to different binding
constraints than English -self forms.

Francis: I'll be marking the reflexive pronouns in reflexive idioms so
you don't have to worry about them in coreference resolution.

oe: He shaved himself --- we currently say there's an x and a y. He bit
his tongue, x, y, z possessor of tongue. Binding theory or account of
possessive idioms might tell us that x and y are constrained to corefer,
or another way of looking at that is that there should be no y.

Emily: For English, I'd want to keep separate pron\_rel for the \*self
forms, but would be happy to see no extra pron\_rel in "he bit his
tongue". Does that give us MRSs of problematic shapes?

oe: Don't think so

Dan: Currently not creating any potential danger for quantifiers into
places where they can't bind their variables --- cf odd cases where the
tool doesn't cope right.

Emily: How wild and woolly do they get?

oe: pron(x), bit(x,y) poss(x,y), tongue(y), udef\_q(x), udef\_q(y)

Francis: *They look as though butter wouldn't melt in their mouth.*

Woodley: And can you shave your poor self?

Emily: relevance?

Woodley: Looking for an example where there's something we wouldn't want
to lose in the restriction of the quantifier.

oe: Not sure that long example will be problematic, but can see why you
might worry about it.

oe: Don't think we'll actually lose those pron\_rels, but can remind
ourselves of why they are there.

Woodley: Can you ever get anything interesting on the restriction of the
quantifier for the possessive:

You, in the front, close your books. \*Your in the front books. Shoot
yourself in the front in the foot.

Dan: What about *own*: *He craned his own neck*

Francis: Some of those idioms allow it.

Dan/Woodley: Depending on your theory of *own*, it could be a marker of
reflexive, or a modifier. If it's just a morphosyntactic variant,
doesn't have to make it to the MRS.

Francis: *Mind your own business*, *Paddle your own canoe*, *Be your own
man*, *give someone a taste of their own medicine.*

Dan: So *own* isn't productive in the right way for worrying about that
restrictor.

Dan: The only thing I can think of that might be worrisome about
crossing that embedded clause is if that *as though* can be in a scopal
modifier phrase. *smiled as though butter couldn't melt in his mouth*
(but that's not the idiom). Quantifier would be forced to scope outside
in order to bind both xs and that would possibly over constrain the
possible quantifier scope.

Woodley: But do we care about quantifiers for pronouns?

Dan/Emily: Lower one isn't a pronoun (*tongue*, *neck*) etc in the
semantics on this proposal, and the other one didn't have to be: *the
children all craned their necks*.

Emily: I don't understand why a clausal complement verb is different
from a scopal modifier.

Dan: Because the limited tests I'm using are neg and every scope
ambiguities.

Francis: *Not every child looked as though butter wouldn't melt in his
mouth.*

Emily: Still don't understand.

Dan: Because if the overt quantifier is in the subject of the upstairs
verb, no matter what happens with the rest of the clause, it can scope
over the other arguments (scopal or otherwise) of that verb.

Dan: *Even though every child chased no dog, butter looked like it
wouldn't melt in its mouth.* Negation is only part of the one clause,
not both.

\[ Bracketing this for now. \]

Last update: 2014-02-17 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/TheAbbey_Chrysalis2014BindingTheory/_edit)]{% endraw %}