{% raw %}Present: Emily, Dan, Guy, Chris, Sanghoun, David, Zhenzhen

Emily: Algebra-compliance automatically checkable? Ann says maybe yes,
oe says no because of type inference. When does type inference come into
compositionality? Not necessarily known, but we know it happens in the
grammars. So we'd like to check.

Dan: Example in semantics is the underspecified variable types which are
forced down from i to e or x (or from p to h or x).

\[Terminology aside: i called 'entity' in Cambridge, 'individual' in
current ESD pages. x called 'individual' in Cambridge, and 'instances'
in ESD pages. Need to reach consensus at some point. Need mid-year Name
Colloquium to figure out what we call the six basic thingies.\]

Dan: Algebra is about where you go grab something, not what you grab.
More compelling case would be introducing a new predication by virtue of
type unification that creates a new argument position...

Emily: Let's create an example of something we could find via static
analysis of tdl, and then think about whether we could get there via
type inference.

Dan: You gave us some examples yesterday---places where you meddle with
the valence element's valence element's HOOK rather than just the
valence element's HOOK or SLASH's HOOK.

Emily: So maybe the problem is three things that end up unified because
of two separate reentrancies plus unification?

Dan/Guy: We in fact rely on that.

Dan: Maybe chasing the reentrancies statically isn't trivial?

Emily: So what about how we build up the HOOK/pass up that info?

Guy: A reentrancy with no value too?

Emily: What are the legitimate paths into the HOOK?

Dan: Start with the lexical entries...

David: HOOK.LTOP = second complement's HOOK.LTOP?

Guy: Make a random new head feature and make it reentrant with LTOP, and
then make various other things reentrant with that.

Dan: A semantically contentless preposition makes its LTOP and INDEX the
same as its complement.

Emily: Put a new feature in HEAD called DELINQUENT, and identify it with
HOOK.INDEX. Then whatever we do with HEAD.DELINQUENT (which will be
passed around the tree as a HEAD feature) --- can an algebra checker
find if we've done something bad?

Dan: Ah, makes sense.

Emily: Too strict to say that that reentrancies involving HOOK should
only go to HOOK or RELS elsewhere?

Dan: Not enough, maybe. Also need constraints about the other end of
that link. Non-HOOK features can't point certain things.

David: It occurs to me that you might want to expose parts of what's
down inside INDEX.

Emily: Reentrancies between AGR and INDEX.PNG break my rule above and
need to be allowed.

Emily: What about the case that we talk about the larger structures
(synsems) etc?

Dan: head-adj, head-subj, head-spr rules currently divided into two
rules doing slightly different things (scopal, non-scopal). head-comp
not yet split: current pretend that I'll do all that in the lexical
head. Could maybe do it more cleanly by splitting head-comp rule, to get
rid of two separate entries for verbs like *know*.

Emily: Assume a well-behaved lexical entry identifying SUBJ's HOOK.INDEX
with its own ARG1. Then what could a delinquent rule do to put something
illegal into that INDEX value that's hard to see.

David/Dan: HEAD.DELINQUENT = HOOK.

Guy: Still detectable via static analysis, based on bad reentrancies
into HOOK.

Emily/David: So how do we distinguish between AGR pointing into HOOK and
HEAD.DELINQUENT.

Guy: So maybe it's okay because PNG is a substructure under a HOOK
attribute.

Emily: Could be used to specify from u, i, p to x.

Dan/Guy: Doesn't matter---that's not about composition.

Emily: So what about monotonicity? Not allowed to drop or overwrite info
already on RELS or HOOK. Can we further specialize?

Dan: No -- there's not PRED value in HOOK.

Emily: But don't you expose PRED somewhere?

Dan: Yes via minors values (pseudo-semantic syntactic head values):
*John fell in the hole.* --- either fell while in the hole or fell into
the hole. Ambiguity between verb of motion taking an obligatory PP
complement (*John slipped into the room.*) and a reading where directed
motion verb doesn't have an obligatory PP argument. The verb then
specializes the P's predicate to the state v. directional rel.

Emily: Is that legitimate?

Dan: Don't know.

David: What if we put the PRED value into LTOP, INDEX, XARG?

Dan: That would be a way of overtly declaring our behavior, enumerating
the pieces we have to carry around.

David: Are there cases of things besides prepositions?

Dan: Yes all over the place. Once I have that truck in my yard, I drive
it everywhere. Make pretty heavy use of the MIN value for det-n
interactions.

Emily: Further specializations?

Dan: Yes, both for failures of unification and specializations.

Guy: Always local?

Dan: Yes, guaranteed.

David: From the perspective of the algebra does it matter that it's
local?

Dan/Guy: Not sure whether it matters.

Guy: If it's local, okay.

Emily: Syntactic and semantic locality not the same.

    ''John fell in the hole.''
    
    (NP John (VP (V fell) (PP (P in) (NP the hole))))
    
    fell_v + [in_p, the_q, hole_n] => fell_v, in_p_dur, the_q, hole_n

Dan/Guy: Okay because in is the semantic functor here. Would be weird to
specialize hole\_n.

David: Can you explain why it would be bad for it to specialize hole\_n?

Guy: Not really mentioned in the algebra that we have predicates in a
hierarchy. But my sense of what the algebra is trying to do is that in
is exposed here to the outside to be exposed to other things, but the
hole\_n is not.

David: Trying to think of an idiom where the meaning does change...

Emily: Let's set idioms aside.

Dan: We could try to add feature requests to what we think the algebra
should be doing, but we have enough on our plate to see if we can make
even this much of the algebra testable. Summary so far: things to worry
about how we enrich information through AGR and MIN, MIN for certain
classes of predicates (closed class). Are there other issues more at the
core of what the semantic algebra of what the semantic algebra has
attempted to it.

Guy: Specializing the PRED value seems not different from specializing
the PNG features.

Emily: Monotonicity more generally?

Dan: Just check that RELS and HCONS are always the append of daughters'
(plus C-CONT's). Seems easy to check this as a positive constraints
statically.

Emily: What other things that we could do wrong with RELS and HCONS?
Mother's CONT = daughter's CONT gives cycle problem...

Emily: So the hard part is checking whether rules/entries are only
digging around where they're allowed.

Guy: We can define sufficient conditions for algebra compliance, but not
necessary ones.

Dan: The approach above to RELS and HCONS and monotonicity is a clear
example of that.

Emily: Even having check to certifying certain types would be useful.

Guy/Dan: Juvenile delinquent in solitary confinement: broken lexical
entry that doesn't follow any of the rules but also can't unify with
anything. Grammar containing that would be problematic on static check,
but it wouldn't actually be a problem.

Emily: So Ann has some code---have you used it, what does it do?

Dan: It reports types where in the static analysis where it looks like
there is a violation of the algebra.

Emily: So not useful enough to use frequently?

Dan: Doesn't hurt enough if grammar is non-compliant. The downstream
uses don't force the issue.

Emily: You've said that scientifically it's useful to see what's
non-compliant because it prompts better analyses, but day to day not
that motivating.

Dan: Would be useful to identify benefits to the grammarian of being
algebra compliant. Wasted structures, extra edges in the chart, etc.

Emily: For early grammar development, identifying rules with
underspecified CONT.RELS on the mother would be helpful. Hard to chase
down in debugging.

Dan: Might well be another thing to add to gTest (from Mike).

Emily: Would want it to say "Are you at least as compliant as you were
last time."

Chris: From the junior grumpy grammarian perspective, there is value in
having the w-all option: Yes I know there are some things I might be
doing wrong, but show me all the warnings.

Guy: To summarize, what are we checking?

- RELS, HCONS, ICONS diff-list append of daughters' + C-CONT's: in
phrase structure and lexical rules
- Allowable reentrancies with HOOKs of dependents
  - Constructions what they can say about HOOK of mother,
C-CONT.HOOK, daughter's HOOKs
  - Lexical entries: valence features, SLASH, MOD (features have to
be declared)
- In lexical entries, no external link to own HOOK or top-level HOOK
features from outside of CONT. (Link to substructures like PNG
okay.)

Future questions to consider: Not relevant to current algebra, question
of what's okay in terms of linking to PRED (e.g. MIN). Think further
also about links to properties of the INDEX.

Last update: 2015-08-06 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SingaporeSemanticAlgebraCompliance/_edit)]{% endraw %}