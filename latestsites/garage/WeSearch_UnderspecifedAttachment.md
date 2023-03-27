{% raw %}### Prologue

ICONS might be a useful tool towards the under-specification of modifier
attachment.

This argument position in this modifier can be x, y, or z but not w.

- using neq and meq (maybe equal)

Is this overloading? Not in the sense of what the ICONS formalism can
do. It's just about being able to say any two indices stand in a
relation to each other. If the representation can be done that way,
don't see a formal problem. But disjunction is not true
underspecification. Possibly need access to character positions to truly
underspecify.

Possible technical difficulty: modifiers need the label too. But can't
we get the label from the index, because it's the label of the EP that
has that index as the ARG0? This would require a special icons
constraint that applies to modifier attachment (and not to say anaphora
resolution). It also means that the ICONS have to be looked at (for
these constraints) in the process of computing fully scoped forms.

In terms of DMRS the necessary correlation between the label and the
coindexation works because there is just one link there, and it's
natural to underspecify those links. Have access to the topological
properties of the links (for avoiding crossing).

Other possible applications of ICONS: appositives, non-restrictive
relative clauses, parentheticals. Come back to those.

### The big question

Is modifier attachment underspecification the right thing to do?

Pros/Motivation \[summarized at end of the session\]:

- Compatible with the goal of saying as much as we can and no more
than we can.

Currently being forced to say more than the context tells us.
Conventional syntax does seem to want to say something about these
ambiguities. But we shouldn't mistake conventional syntax for deep
truth. Does the conventional representation of constituent structure for
PP attachment buy us anything in terms of well-formedness. (Distinct
from cases where the structure makes thing unambiguous, e.g., PP inside
a topicalized NP.)

- *airline reservation counter* &lt;- Just don't care what the
bracketing is.
- structure of proper names is another example of these

<!-- -->


- Create an interesting data set for studying attachment ambiguity.
- Would be beneficial for the approaches to machine learning using
(distributional) semantics.
- Possibly a better account of *In Paris on Tuesday Kim wants to read
a book.*

Cons/challenges \[summarized at end of session\]:

- Disambiguation could be more difficult as a two-stage process.
(Possibly artificially easy right now.)
- Can we do it compositionally?
  - How to force low attachment, solely within the grammar
- It's a fundamental change to the machinery. Many of us currently
inhabit a one-stage universe. All the engines would need to change.
- Second stage needs to be worked out. How does it work? Is it
reversible? Does it run on manual rules that grammarians write (for
particular languages) or universal principles?
- Are we undermining our mono-stratal roots?

### The more detailed discussion

With compound noun attachment, there are examples where arguably the
stress is different based on the bracketing. Possible example:
interaction of stress with focus projection. But we're hoping to do that
off the MRS only anyway.

- *Kim saw(e1) the astronomers(x1) on the hill(x2) with a scope(x3)*
  
  - on(e1\|x1, x2)
  - with(x2\|x1\|e1,x3)

High attachment of on to e1 makes inaccessible the low attachment of
second PP. =&gt; Attachment resolution will be like scope resolution:
will require that we create internally consistent representations.

Currently get 5 parses of that example. Proposal is to have just one
structure, with an underspecified or otherwise compact representation of
the 5 attachments. Do we need to encode the dependency between the two
in the result of parsing? What information does the modifier attachment
resolution procedure need in order to do that?

Non-projectivity: *in* can only attach to *astronomer* if *on* isn't
linked to *saw* --- otherwise it would cross the dependency.

True underspecification: special links that are equivalent to a
low-branching syntax. Give the minimal one only? Maximal one too? Space
of possible candidates is not enumerated anywhere during parsing.
Resolution procedure knows to treat them separately. Need to make rules
for how to project there, with the goal of doing this based only on
semantics (MRS w/ICONS) plus linear order in the surface tree.

We do get non-projectivity in some cases. How do such cases interact
with modifiers?

- *I met a guy yesterday from Paris.*
- *I saw a guy briefly yesterday from Paris.*

That's a crossing dependency --- unless we treat it as a co-reference
link rather than a syntactic link (which we want to do independent of
this underspecification).

Plug for multilingual investigation: look at German (non-projectivity)
and Japanese (head-final order).

(Non-)projectivity arises in DMRS because of the algebra. Semantic head
supplies the slot, filled with the hook of the non-head. When you have
external arguments or take the slots from the non-head daughter further
up that leads to non-projectivity. Dick Hudson paper on no-tangling
constraint on his dependency structures: all of his examples are cases
where we pass up an external argument. Simple ex (not from Hudson): *Kim
believes Sandy must sleep.* Want *sleep* taking *Sandy* and *believe*
taking *sleep*.

Are there configurations cross-linguistically where there would be
non-projectivity on modifier predicate-argument links? More specifically
could be that the resolved links can't cross another intersective
modifier. Some links may be crossable.

Scopal modifiers?

- *John will stay if Sandy leaves.* There is ambiguity, but it's less
problematic in English.

In German, there is more ambiguity with scopal modfiers, e.g., \[ scopal
adverb V scopal adverb \]. Intersective and scopal modifiers scramble
freely.

EB proposes that if we are going to do this only for intersective
modifiers and not scopal ones, need a principled reason for that. In
DMRS the scopal ones are also just links, so could possibly also be
underspecified. (Could that be mocked up in the ICONS account?)

Dan is optimistic that the attach low analysis can be built in the
grammar (without help from the parsing engine).

The current ERG has relative clause extraposition, but not yet extended
to PP extraposition because the frequency of the construction does not
merit the cost.

- *I met a guy briefly yesterday from Paris*

Could be that there is a certain kinds of cases where non-projectivity
is allowed in the linking of modifiers. Can we identify these on the
basis of MRS + surface order alone?

Alternatively, if that isn't feasible, could say that there are two
kinds of modifier attachment syntactically in English: the ordinary one
that we are now underspecifying, and extraposition. This would lead to
some residual ambiguity in some (many?) cases. (And then these end up as
another case of close paraphrases that don't quite have parallel MRSs.)

- *On Tuesday I thought Kim would go to Paris.*

Dan hopes to not use extraction and rather attach as low as possible,
which is actually high : S attachment. (Alternative: extract only low.)
Can we give a single attachment point to the highest verb and figure out
that there would be other candidates down inside the clause:

- *On Tuesday the manager thinks Kim had an appointment.*

Only the verbs: Ross 1968 CPNC. So the rightward-down search has to know
that it's looking for verbs only (*manager* and *appointment* are not
possible attachment sites.)

\[Cross-linguistic considerations: is CPNC a universal? What about cases
where we get the stacked PPs to the left without extraction? How
language specific are the constraints on resolution?\]

To keep the resolution procedure from being language-specific, use
different types of links to trigger different types of interpretation
procedures. Then the grammars for different languages can specify
different kinds of links.

- *fluffy towel rack*
- *the IBM quarterly shareholder report*

NNNN compounds: build one unique syntactic structure. Relatively simple
case. What about adjectives inside of NN compounds: attaches to its
nearest host (noun to its right: I'm this kind of modifier, here's what
you do to interpret me: *fluffy towel rack* has one syntactic structure
but two interpretations, one of which is too 1970s to contemplate. *the
IBM quarterly shareholder report*: Two different kinds of links: one for
noun compound structures which impose one kind of resolution behavior
and one for adjectives that something different.

Syntax tree gives (when we're done with parsing what we have is): an
attachment site, the link type, and constraints on the type of the ARG1
of the modifier.

Do we need to think of any islands, things that block rightmost
modifiers from going up further? One example might be subordinate
clauses. Candidate generalization: no intersective modifiers of a clause
after clausal modifiers of that clause.

- *I'll buy a book if Sandy stays in Paris.*
- *\*I'll buy a book as long as Kim did yesterday tomorrow.*

How do we do annotation of this (to the extent possible)?

Related: How we represent the structure? Could enumerate, but that would
be impractical. One options is some sort of disjunctive forms for
attachment of each modifier, with constraints (dependencies between
choices for) on the combination of modifiers. XLE has one solution to
this: context representation for disjunctions: representing disjunction
as conjunctive form of implications. Another solution is "named
disjunction" or "distributed disjunction". "contexted disjunctions"
(Maxwell and Kaplan 199X).

- on(e1\|x1, x2) if P1==True: e1, else x1
- in(x2,x1,e1\|x3) if P1==True block x1 as a possible attachment.

Minimal set of extra predicates to model the satisfiability of the
entire semantics. XLE offers a packed representation within the FSs. If
you pick one disjunct, the corresponding impossible choices (disjuncts)
disappear. Like discriminant-based treebanking? Not exactly: folks in
Bergen looked at this functionality in the XLE and decided to use
discriminant-based approach instead.

If we characterize modifier attachment as semantic rather than syntactic
ambiguity, and if we want annotators to disambiguate (or partially do
this), then treebanking would be a two-stage process: choose the tree
first then do the semantic resolution (maybe interleaved, if we get
clever).

Not saying (like we did with scope): We moved this out of the syntax, so
it's not our problem.

Scope resolution by hand is impractical, partially because so many of
the scopes are equivalent. Koller/Thater work on collapsing those might
pull out enough that the problem becomes, if not tractable, at least
possible to look at. Treebanking scheme where annotators are presented
with scopes created through heuristics and asked right or wrong? (Would
have to have Aurelie's work on underspecified quantifiers fed in first,
because the presence of an ambiguity depends on the interpretation of
the unspec\_q\_rel.)

In what application contexts do we want to resolve the modifier
attachment? In MT in some cases, maybe don't need to. In relation
extraction or QA, could possibly absorb some vagueness, but don't want
complete underspecification. So automatic resolution would be a
practical necessity: motivation for treebanking. Automated
disambiguation would also be two-stage (or joint modeling over different
structures).

Doing things in terms of MRS and [WordNet](/WordNet) features are
different kinds of semantic features. Many have found that neither has
been very successful in helping with parse selection. Just MRS structure
only slightly worse than syntax only.

Woodley did an error analysis of parse selection last year. Coordinate
structures and PP attachment were high on the list. Copestake et al at
JHU workshop got a significant difference on coordinate structures for
CCG parser using distributional features.

Proper evaluation of this would require a treebank without artificial
heuristics like "when in doubt attach low". That might bias things
towards syntactic features. Feature choice (in ML systems) is a matter
of recreating the heuristics, rather than the linguistic knowledge, in
the annotations.

In the current discriminant-based set up, finding a non-singleton subset
of trees is not a well-defined, so Redwoods project reverted to full
disambiguation (even where heuristics are required). Can't carve the
space of trees into arbitrary subsets and not the subsets we wanted.
Might be possible to get to the subsets we're interested in in the
proposed 2nd stage.

Would be an interesting dataset for studying modifier attachment (incl.
NNNN compound structure; not coordination though --- that wouldn't fall
under this analysis). Replacing Ratnaparki dataset (from PTB,
constrained task) and one other small hand-crafted set.

Should make this move only with careful consideration: moving something
out of the syntax into the semantics:

Possible evidence that PP attachment is (at least partially) a syntactic
ambiguity:

MSc student (at UiO) working on measuring affinity of predicates for
each other over the Google 1T corpus. "V pron P" would favor high
attachment. (Extension of B&K work on PTB Sec 23 parsing to
ERG/Redwoods.) This is giving strong improvement in exact-match
accuracy. The features are defined in terms of head words, which define
to more than unary constructions in the grammar, and it helps to label
the features with the construction names from the grammar. Many of these
are modifier attachment decisions. The proposed move would replace \~2
doz syntactic head-modifier constructions with one structure (ARG1) in
the semantics. Not broken down by type of constructions (in the
analysis) --- need to know how much of the help is actually in other
structures rather than head-modifier (coordination, etc). Also: once
again the heuristics that were applied to get one tree (somewhat
artificially) might be partially behind this result as well.

=&gt; deciding whether modifier attachment is fundamentally syntactic
should include looking at both competence and performance (e.g., parse
selection)

We're talking about "procedures", but need to maintain reversibility.

We keep talking in terms of trees and such; need to translate into
semantic notions. The set of constraints that syntax currently encodes
for us, we need to transfer to the semantic level so that we can obey
them in the semantic resolution. Or maybe find constraints in the
semantics that will do the work for us.

The syntax is there because people have semantic intuitions about these
attachments, and used syntax to express them. No evidence yet that
there's anything in the syntax that actually depends on this.

Could alternatively say there's a set of semantic constraints on the
resolution that are only partially guided by the syntax, and can be
worked with independent of the syntax except where the syntax directly
guides the semantics.

To disambiguate, what properties do we want to be accessible? Do we want
to do the levels separately or jointly (using some projection set up
where there are links between syntax and semantics that the analysis
selection engine can take advantage of).

If we allow ourselves the two stage process, we allow ourselves the
choice of putting things or there. Currently we have:

- tree structure
- quantifier scope
- things we can underspecify already (lexical ambiguity)

Various ad hoc attempts to disambiguate (as separate stages):

- lexical ambiguity
- unspec\_rel quantifiers
- anaphora resolution

This move is introducing a new type of ambiguity from the above. We're
already multi-stage, but this is a new stage.

Another place where we could hope for another division of labor:
apposition and coordination:

- *My brother, Bill, and Sandy* : always two possible analyses (two
people or three), and it's a real-world decision, not one that is
really based on linguistic context.

Would be nice to build one single structure that is underspecified
between apposition and coordination. But those are two different things,
so an entertaining puzzle.

If some relative clauses are anaphoric in nature, not attaching them the
same way. Extraposed ones are attached differently.

- *A guy walked in who I never met.*

Relative clause whose modifier argument is not bound to anything. RASP
attaches in fewer and uses a separate anaphora resolution algorithm to
handle it.

More general point: There are other places where you can get readings
that are both pragmatically plausible as compared to the vast majority
of ambiguities where the non-selected parses a human would never want
(and human processors might not come up with). Treebankers have
different kinds of decisions to make: some cases are clearly just silly
trees, in others, the meaning of the sentence has to be taken into
consideration.

Point here is that it's another place where people are coerced into
making decisions they are not informed to make. It would be nice to be
able to underspecify the forest in this case here.

- compounds: falls under intersective modification
- coordination v. apposition
- ... others?

Church & ? paper noting that this is a catalan series had an
underspecification account.

Non-projectivity isn't always the same between syntactic and semantic
dependencies because of semantically empty things.

Proposal to reconsider not completely disambiguating profiles in
treebanking.

- Rediscover what caused backing up last time
- Thinking about how it relates to parse selection technology (and
evaluation)
- Work through a corpus and identify phenomena that lead to partial
disambiguation being desirable
  - Consider which of these are amenable to underspecification at
the next stage.
- Measure inter-annotator agreement on when to stop

Skepticism about inter-annotator agreement on when to stop. Replace
heuristics for what to do when you don't know with heuristics for where
to stop. Worry that differences in world knowledge might lead to
(additional) variability in annotation. The to one tree version is
possibly artificially simple in this way.

Try a small scale experiment, trying to measure IAA on this additional
choice point.

Yi's experience with WSJ texts: some residual ambiguity left in early
stages. Compound nouns, quotatives (before Dan had them worked out
well), ...

In the experiment allow knocking out individual trees as a last resort
to see whether the cases that caused the turn around before are coming
up. Sounds like the current tool might allow us to carry out the
experiment without further software development. =&gt; Paper (e.g., LAW)
on whether the stopping can be done consistently across annotators.

PPs modifying PPs, because of

- *In Paris on Tuesday Kim and Sandy went for a walk.* (=&gt; would be
able to get rid of this in the account sketched above or if the 2nd
PP attaching low to the first being interpretable as attaching
'higher' to the verb.)
- maybe other path examples? *Slid down the hill near the cave.* *Slid
down the path into the water.* Want these to be syntactic
complement, but there can be only one such complement. *Slip through
the crack into the room.*

But it also happens with resultative PP complements (which aren't just
modifiers in the semantics):

- *Put the apple in the fridge in the box.*
- *Put Kim in the basement in the box.*

Could search in the current Treebanks --- in Fangorn to answer this
question. Homework: Try it!

Update 13-jun:

Fangorn URL (possibly temporary): <http://hum.csse.unimelb.edu.au:9090>

Sample searches:

- //HD-AJ\_INT-UNSL\_C/HD-CMP\_U\_C\[/P\_NP\_I-REG\_LE AND
==&gt;HD-CMP\_U\_C\]
- //HD-AJ\_INT-UNSL\_C/HD-CMP\_U\_C\[/P\_NP\_I-TMP\_LE AND
==&gt;HD-CMP\_U\_C\]
- //HD-AJ\_INT-UNSL\_C/HD-CMP\_U\_C\[/P\_NP\_I\_LE AND
==&gt;HD-CMP\_U\_C\]

(As far as I know, there isn't yet a wild card that would let us search
over P\_NP\_I\*, nor a version of the LOGON data loaded that has
abbreviations for node labels, though that should be possible in
principle.)

Last update: 2018-06-19 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/WeSearch_UnderspecifedAttachment/_edit)]{% endraw %}