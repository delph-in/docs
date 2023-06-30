{% raw %}Discussion on constraining LTOP on NPs in MRSs

Leader: Emily

Participants: Joshua, Stephan, Rebecca, Lars, Dan

Potential examples where we might want LTOP available after composing an
NP:

- English appositives, if we want the appos\_rel's LBL to be
identified with the head rel of the left NP.
- Turkish N-Det-Adj
- Yiddish Intens-Det-Adj-N
- Latin Adj-P-N (e.g. magna cum laude, imo a pectore, medias in res)

Obstacles to making the LTOP available: Semantic algebra prohibits
binding LTOP of a quantified NP, since the LTOP of an argument should
either be shared with that of the head, or be a scopal argument of the
head. This sem-alg constraint is useful if we dispense with quantifiers
for pronouns, since the pronoun's non-q relation's LTOP needs to be
identified with that of its functor. Similarly for our treatment of
apposition in the 1212 ERG.

Options:

- \(A\) Add a unary rule that empties the LTOP of a quantified NP
(which starts out with the LTOP bound to the head noun's LBL, to
sustain further intersective modification), and liberates it to be
an argument. Currently implemented in the ERG to enable e.g.
\|everybody in Paris who dances\|, which would be problematic since
\|everybody\|.
- \(B\) Give up the semantic algebra constraint (abandon strong
hypothesis), and allow LTOP of NP to be identified with the head
noun's LBL. Potentially problematic if we give up quantifiers for
pronouns, as has been contemplated for awhile for the ERG. We could
go further and make pronouns introduce no rels, and then coerce them
to add a nominal rel for \|you in the corner\|. But without a
quantifier, we would have the LBL of the preposition identified with
that of the head verb in \|you in the corner sing\|. Not appealing,
since it would be a first instance of an intersective modifier whose
ARG1's source relation does not share its label.
- \(C\) Add another attribute in HOOK for NPs to keep track of the
head noun's LBL. Weakest, and potentially problematic downstream.

* * *

Notes from the bonus scribe:

Dan: Two cases standing are Turkish and Yiddish (*zeyer*), maybe
introduce the quantifiers in non-branching NP rule even if we see
something that looks like a determiner. (cf. Emily's earlier points
about disassociating demonstratives from quantifiers in languages with
adjective-type demonstratives.)

Dan: LTOP of the argument is interesting in two cases:

Directional PP arguments Pronouns introducing just a pron\_rel

- -&gt; Need to obey the algebra so that the pron\_rel is bound to
something (namely the selecting head)

Not yet done in the ERG, but ready for it (probably)

Emily: Could take the further step of removing pron\_rel as well as
pronoun\_q\_rel.

Dan: Not necessarily opposed to that; would allow revising our view of
the algebra.

Dan: Previously appos\_rel was also a case where this was required to
make sure it gets bound to something. *Stripes the cat meowed*
appos\_rel was identified with the empty LTOP of the NP, but then the
algebra unifies that with the head's LTOP (per algebra), hooking it in.
That problem should go away as we move to ICONS, but still another place
where the semantic algebra constraint is doing some work.

oe: Not sure ICONS fully solves the appos problem (see interesting
unanswered questions about ICONS and truth conditions yesterday), so it
might be premature to move the appos problem off the table in this
context already. If we had the label of the other N' available, that
would also solve the appos problem.

oe: Another potentially heretic idea is to put the N-bar's LTOP
somewhere else in the HOOK.

Dan: Tried putting it in the XARG previously, given that NPs don't
really need an XARG usually … but that doesn't really turn out to be
true. There are much more legit uses of XARG in NPs, e.g., gerundives
**my singing of the song** --- keep the XARG from the verbal relation.

oe: Would have to introduce a new attribute (e.g., ITOP - internal top)
or deviate from the algebra.

Lars: Norwegian has examples like:

- the nice boy-the
- boy-the
- \*nice boy-the

… one of the determiner-looking things has to yield to the other when
both are present.

Lars/Dan: *everybody in Paris* is also a problem in the English the
grammar. Want this to mean every(x), person(h,x), in(h,e,x,y), Paris(y)

oe/Emily: So what do you do?

Dan: Have tried several things. At present special treatment of that
small class of lexical items as entities that select for semantic
modifiers as (optional) complements.

oe: Not currently: looks like the pumping rule

Dan: Right --- attach the quantifier low but keep the LTOP exposed in a
constituent that isn't ready to play in the syntax except for
participating in intersective modification. Non-branching rule removes
the LTOP (rather than introducing the quantifier).

Dan: The problem with the complement approach is that it doesn't scale
to multiple complements: *Everybody in Paris who bought a cat.*

Emily: Clever --- is this algebra-compliant? But first: how do you keep
it from playing in the broader syntax?

Dan: Probably by exploiting some version of the anti-synsem mechanism of
the SPR list.

oe: To paraphrase it has the distribution of the N'?

Dan: No -- can't conjoin with N's, can't appear in N' appositive
constructions. It's a quantified NP that can still undergo further
(intersective) modification.

oe: And unary rules are not subject to the algebra. What that unary rule
does in terms of the semantics … but the algebra doesn't say anything
about the semantics.

Emily/oe: Unary rules that are semantically empty --- so unary from the
point of view of the semantics as well.

oe: To judge this as algebra-compliant, need to say that the algebra has
nothing to say about a certain class of unary rules.

Dan: flies under the radar.

Emily: might work for Turkish. But predicting no non-intersective
modifiers of nouns?

Dan: More subtle than that: Predicting no non-intersective modifiers
that need to be picked up in these cases. So not a very strong
prediction.

Emily: I think English is maybe more cooperative in this case than
something like Turkish might be. But currently no non-intersective
modifiers in ERG?

Dan: No --- still waiting for compelling evidence. Just the
intensionality doesn't seem enough.

Emily: What about *likely*, *probable* etc as in *the most likely winner
of every medal was disqualified*?

Dan: Jan Tøre and others have pointed out that there is more than two
classes of what happens with adjectives. Not just scopal + intersective.
… probably better to think in terms of languages that make the problem
clearer

\[ Emily gone \]

Hypothetical option B making the LTOP on NPs the N-bar's LTOP. What
challenges does that lead to?

oe: Does that force Dan into two HCRs, but it doesn't:

Dan: Split both HSR and HMR for scopal and non-scopal dependents.
Haven't done that for HCR, that's done in the lexical types instead.

oe: Biggest challenge would be having to declare oneself openly in
opposition to the algebra.

Dan: Not so troubled by that, but troubled by the tempting strategy of
throwing away the quantifier of pronouns. That requires the algebra.

Emily: Unless you also toss the pron\_rel.

oe: That would be problematic for the variable-free views on the
semantics (EDS or DMRS), no EP introducing it as its inherent variable.

Dan: Also problematic for sentences like *You in the corner should buy a
book*: label of **in**?

Emily: Wambaya: Bender 2008 concludes that Wambaya facts are compatible
with DTFS but not the algebra. Do have modifiers of otherwise
unexpressed argument positions … but not sure what I'm doing with the
label of those quantifiers. (Maybe introducing quantifiers in the
grammar currently to tuck the modifiers under, but no pron\_rels --- so
the opposite solution.)

oe: To further illuminate the LTOP on NP problem, need a definitive
conclusion on the pronoun space.

Lars: Why remove the pronoun\_q\_rel?

Dan: Can't find a semanticist who wants it, except possibly Alex.

oe: Remember in Cambridge II being convinced that it was on its way out.
But after Hankø thinking it was sticking around. What are the arguments
in either direction?

Dan: For getting rid of it: Occam's Razor only.

Lars: Why posit in the first place?

Dan: Because we went with the rule that all nominal indices need to be
quantified. But then semanticists said that's weird, because pronouns
aren't like regular noun phrases that need to be quantified.

oe: Effectively introducing unquantified referential indices.

Dan: Unquantified indices of some kind.

Lars: What about proper names?

Dan: Semanticists are less unified on this one, because they clearly
have both uses. Pollard says that a proper name like Kim is a constant,
but can be coerced into common noun uses. We've even talk about clever
strategies for lexical entries for proper names underspecified and then
have the syntax decide.

oe: Do we need a new type of instance variable?

Dan: Not for the external MRS, but maybe internally in the TFSs.

oe: Some of the scope rules are built on the assumption that all ref
indices need to be quantified. They'd need to be something like
unquantified constant indices...

Lars: … clitic doubling …

oe: admits that maybe the variable-free semantics isn't to be treated as
hard constraint on design of semantic representations.

Dan (summarizing):

- Option A: unary rule that allows the LTOP to be available for
further modification, but protects the algebra by liberating the
LTOP and syntactically moves from modifier target to argument-able.
- Option B: give up the strong hypothesis on the semantic algebra,
allow that LTOP to be the N-bar's label all the time. Just make sure
not to grab it by accident. --&gt; problems with anticipated move to
dropping the quantifiers for pronouns.
- Option C: adding another attribute in the HOOK (ITOP) … NTOP (noun's
top handle) not really a TOP anything.

Dan: Don't care what the name is because I don't think we want to go
that way. HOOK attributes have an engineering cost.

Emily: And a theoretical cost.

Dan: It doesn't help anything to say that we want to do two things at
one time: want to have it visible (for modifiers) and not visible (for
embedding functors). There would be some utility in thinking harder
about this distinction rather than just throwing a feature at it.

Emily: Keeping the discipline of HOOK makes us think harder about these
questions. In your grammar you've created a description of these cases
via the rule and we could then do some bottom-up exploration of where
the issues come up.

Dan: Yes, there are other cases: *you who eat fish* can still build
while there's a quantifier for pronouns, with the same unary rule.

Emily: Does the pumping rule apply to all NPs or just these ones?

Dan: Just the funny ones.

Emily: Two objections Dan's (linguistic, about *you in the corner*),
oe's (formal, variable-free rules).

- you in the corner
- \*they in the corner
- \*he in the corner
- those in the corner
- we in this room like fish

\[oe: okay in Norwegian even with third person pronouns\] \[Afterwards
we noted that *them in the corners* sounds better than *they in the
corner*.\]

Emily: So are we dropping pronoun\_q\_rel on demonstrative pronouns?

Dan: Currently demonstrative\_q\_rel, but you've said that's not right.

- *you should stop laughing*
- *you in the corner should stop laughing*

**pron\_rel**, **in\_rel**

Emily: okay with *you* sharing label of *should*?

Dan: yes

Emily: in the second case too?

Dan: that follows

Emily: and *in* sharing its label with *should*?

Dan: not so much

Emily: I think the problem is the same regardless of whether we have
**pron\_rel** (as soon as we get rid of **pronoun\_q\_rel**)

- *you in the corner sing in a large hall*

Last update: 2013-08-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SaarlandLtopDiscussion/_edit)]{% endraw %}