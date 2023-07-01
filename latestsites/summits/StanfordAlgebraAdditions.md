{% raw %}# Revising the algebra

Here are some additional comments which may be useful for the algebra
discussion:

## Clarifications from presentation

### Ambiguity of term \`INDEX', \`LTOP' etc

In DMRS, the index is a node in the DMRS graph, rather than a distinct
instance variable. Since null semantics items have no nodes, they cannot
have an index in that sense. However, the feature structure including
the DMRS can have a feature INDEX, which could, for instance, link to a
complement's index. What the DMRS treatment precludes, which is possible
in MRS, is that the index is used as a sort of storage facility for
properties such as tense, which can be accessed even if there are no
syntactic arguments. This has consequences (predictions?) for the
association of semantic properties with things like existential \`it' -
while it isn't completely ruled out, it would require an additional
structure to be added.

## Existing algebra is broken with intrinsic variable grammars

The algebra as originally defined says that the semantic head provides
the slot and the hook (the index and ltop plus xarg or whatever). This
worked for adjective-noun combination when we didn't use event variables
on adjectives, because the hooks were equated. Once one does this with
event variables on adjectives, the slot is on the adjective but the
INDEX of the adjective-noun combination has to come from the noun, so we
don't have a notion of semantic headedness any more. With scopal
modification (adverbs like \`probably'), the index comes from the
modified verb and the ltop comes from the adverb, hence the hook isn't
transmitted as a whole.

This could perhaps be fixed but points to a deeper issue: when we
originally developed the algebra, we (at least me, and I think Alex)
were influenced by previous approaches to want a notion of functor and
argument, with the functor (aka semantic head) providing the slot and
the hook. This is not tenable without some operation that does something
drastic to the functor. Arguably this is analogous to some of the
type-raising operations in conventional approaches. e.g., in lambda
calculus, one can make an NP into a functor. But we always thought of
this as a problem with those approaches, so this doesn't seem like a
good path to go down.

Another issue is that the connection to the syntax is looser than I
would like. The syntax and semantics cannot be completely isomorphic
(again, this is a divergence from categorial grammars of various types)
but we really would like the relationship to be regular with limited
exceptions.

## Modest proposal

### Basics

1. We think of the algebra in terms of graphs (DAGs), since this is
anyway what we're dealing with natively, and since it allows us to
see the relationship of DMRS and other forms of MRS more clearly.
Formalising in terms of graphs is possible but not done here,
because it doesn't seem to me to improve clarity.
2. The TFS graphs have the following type of structure (abstractly):
   - \[ SYN \[ SYNROLE1 \[1\]
     - SYNROLE2 \[2\] \]
     
     <!-- -->

     
     - SEM &lt; \[ PRED
       
       - SEMROLE1 \[1\]
         
         SEMROLE \[2\] \] &gt; \]
   
   where \[1\], \[2\] indicates reentrancy. In what follows, however,
for the purposes of the algebra, I'm going to try writing the
semantic graphs with additional syntactic annotations rather than
keeping the graphs distinct. I expect this to go wrong, but it gives
us the idea that syntax and semantics usually go together and we
have to do something to disconnect them. (The hope is that what we
do is less violent/unconstrained than with alternative approaches. )
3. As in the presentation, I will treat construction semantics as
though it were lexical in what follows.
4. In terms of the semantics, we have the following components, much as
in the original algebra:
   1. INDEX b. LTOP c. XARG d. EPs and closed links between them e.
open links (= slots)
   
   The most basic principle is that nothing can happen to things in
category d. other than via the other categories. This is guaranteed
in the TFS implementation by never having paths into lists and by
not proliferating features beyond LTOP, INDEX, XARG. BUT we may have
to modify this (possibly depending on what we assume about the
syntax-semantics interface).
5. Hook is retained in the dmrscomp grammar but has limited utility,
since INDEX and LTOP no longer always go together. This would also
apply to a revised algebra using MRS. In the dmrscomp grammar, open
links always select for LTOP or INDEX, rather than accessing HOOK as
a whole.
6. All composition is treated as binary. This potentially allows some
wiggle room in the syntax-semantics interface in grammars where
there are n-ary rules with n &gt; 2. Specifically X -&gt; X1 X2 X3
could be treated as X' -&gt; X1 X2, X -&gt; X' X3 or as X' -&gt; X2
X3, X -&gt; X1 X' This is as in the old algebra. Whether we want to
take this to the point where we (for algebra purposes) analyse
examples like make him angry' as make (him angry)' despite the ERG
binary branching, I am not sure.
7. INDEX always comes from the syntactic head (see comments at top of
page about ambiguity in terminology in DMRS). LTOP normally comes
from the syntactic head, but comes from the modifier in scopal
modifier examples (\`probably sleeps') in the dmrscomp grammar and I
expect there are other cases where this will be necessary.
8. Syntax chooses the constituents, says which one is the syntactic
head and chooses an open arc. The arc is typed for LTOP or INDEX,
hence can choose its target.

### Examples

for clarity, XARG omitted except when it's needed. Similarly /= and /neq

This is all DMRS-like, but the abstract MRS TFS graph can be obtained by
adding nodes. There may be things we could do with that that we can't do
with the DMRS-like representation, but (I think) not vice versa.

I hope the intuition is clear, but the notation needs some thought.

#### I like bagels

like &lt;-ARG1.SUBJ- like -ARG2.COMP1-&gt;

both arguments select for INDEX. In DMRS, both links are /neq. In MRS,
the NP LTOP is unconnected.

#### Bagels are liked by me

like + passive &lt;-ARG1.COMP1- like -ARG2.SUBJ-&gt;

in terms of the old algebra (Copestake 2007 paper) the slots are
transformed by the passive operation. In this notation, the syntactic
labels on the open arcs are changed.

#### Bagels, I like

like + topicalization &lt;-ARG1.COMP1- like -ARG2.SLASH-&gt;

Again, the syntactic labels on the open arcs are changed.

#### Kim tried to go

go -ARG1.SUBJ.XARG -&gt;

\[1\]&lt;-ARG1.SUBJ.XARG- try -ARG2.COMP1/h-&gt; &lt;target&gt;
-XARG-&gt;\[1\]

#### Kim seemed to go (raising)

go -ARG1.SUBJ.XARG -&gt;

\[1\] &lt;-SUBJ- seem -ARG1.COMP1/h-&gt; &lt;target&gt; -SUBJ-&gt;\[1\]

When a node with a syntax only specification comes out of a target, the
idea is that it may unify with an open link on the target. When it comes
out of the main EP, a syntax only specification implies there is no
semantic argument.

#### Kim made him angry

If we take the option of reconfiguring the syntax (see above), there is
nothing unusual here. him angry' has the same semantics as he is angry'
and \`make' takes it as a scopal argument. If we don't do that, we may
need to constrain this sort of pattern somehow.

&lt;-ARG1.SUBJ- make -ARG2.COMP2-&gt; &lt;target&gt; -XARG-&gt; \[1\]

- -COMP1-&gt; \[1\]

#### easy editor to try to impress

rather a guess here, since I haven't looked at its actual analysis in
the ERG in any detail

to try to impress

\[ 1 \] &lt;-ARG1- try -ARG2/H-&gt; impress -ARG1-&gt;\[1\]

- -ARG2-&gt; &lt;target1&gt;

easy editor (INDEX is editor)

easy -MOD/=-&gt; editor

- -ARG1/H-&gt; &lt;target2&gt; -SLASH-&gt;\[2\]
  
  -ARG2-&gt;\[2\]

This illustrates two things. Firstly, this is an example where we need
to retain \`open' links in an English DMRS - we'd already decided to do
this for ICONS purposes but here we need it in the same way as some of
the other grammars. Secondly, we have two open links being
simultaneously instantiated. This wasn't allowed for in the original
algebra. Assuming we want to allow this, we need to work out how to
constrain it.

## Notes

\[Scribe: EmilyBender\]

Ann: The notion of the feature called INDEX is distinct from what that
feature is pointing to. A DMRS has an index which is a node --- that's
different from having a feature that points to that node. Semantically
null things can have the feature INDEX, but they don't have any nodes
--- that feature can't point to anything inside that.

Emily: What about dropped arguments?

Ann: We now believe we should add them to the DMRS in some sense. That's
different. Expletive 'it' doesn't have semantic properties does it? The
agreement things on the existing it aren't really semantic because
there's nothing for it to be semantic about. Sort of a minor point;
interesting difference between DMRS and MRS structures. Dropped
arguments we can come back to. Ex. *we drank* implying *we drank
something* --- I think I want those things to hang around for anaphora
resolution. Also it seems necessary for the *easy*-adjective cases. It
comes up in some other language… Japanese, right?

Mike: Dropped arguments shared between two different verbs.

Emily: Dropped arguments with agreement information.

Ann: Right---want those to stick around. Dropped arguments are semantics
w/o syntax; expletive *it* exactly the other way around.

Mike: Recalling talk about a trigger rule to add them in in conversion.

Ann: I'm interested in a grammar generating DMRSs right at the start;
for that we'd need those cases for Japanese, and for the *easy*
adjectives. In terms of conversion from MRS to DMRS, we thought we'd
have two versions. One with the dropped arguments and one without,
because some applications don't care.

Guy: In cases when a verb has lots of different case frames, what do we
consider the dropped arguments. Everything that you could have? *know
that* v. *know a thing*.

Ann: I think that's taking us onto something that's off track for today.
I tend want a frame for *know* that is know some proposition. The fact
that that can turn up as a sentence-y type thing or as an NP is …

Guy: *know a person* ?

Ann: Different sense. *know a fact* v. *know that someone won the race*
-- would try and make those the same sense.

Emily: That's a tangent --- we now that there's dropped arguments. It's
a linguistic question, for our purposes today enough to know that
they're needed somewhere.

Ann: Existing algebra is broken with intrinsic variable grammars ---
realized it's a deeper problem than I originally thought. Notion of HOOK
as INDEX + LTOP + XARG. In the algebra, there's always a slot that takes
the hook as an argument --- equate values in slot with values in hook.
Having the slot taken as property of semantic head, and the semantic
head contributes the ltop & index to the result. This is broken now
because e.g. adj+noun combination. Index has to come from the noun
because the ARG0 is its own eventuality.

Emily: And its INDEX points to its own ARG0, which is needed.

Ann: Yes --- point of having the ARG0 in the first place is the point,
for adjective modification. Else why would you want intrinsic variables.
I think there's a better analysis of adjective modification…

Emily: I'm curious what that better analysis is.

Ann: Predicate modifiers: very(blue)

Emily: What about tense in predicative adjectives? Need INDEX = ARG0
then?

Ann: Even there, tense should really be something like past(blue).

Guy: What about *interestingly blue* -- interesting(blue)?

Ann: Not sure. But I think we've gotten too a point far down the
slippery slope, with es all over the place. Would be nice to back up a
bit. Our representation should allow someone to generate either the
intrinsic variable semantics, or the more traditional form, or something
in between. Not convinced that we need this semantics with all these
eventualities in it. Not saying it's wrong, just that it's very unusual
and we haven't fully justified it. What we originally thought about MRS
was that it was a way of specifying different forms of semantics. Could
do that if we allow ourselves the predicate modification.

Ann: Existing algebra is broken because we no longer have the notion of
semantic head. We've got something like headedness, but one is where the
index is come from and the other is which thing is supplying the
argument, and they don't agree in the case of *probably*. *Kim probably
slept* the index really has to be the event of *sleep* and the ltop has
to be from *probably*.

Emily: What's the info that shows that the index has to come from
*sleep*. Worry about this often with negation.

Ann: *He did not sleep* --- tense coming from auxiliary needs to get to
slept. Also *Probably slept deeply*, if you decide that *deeply*
attaches low, not an issue.

Emily: *Kim did not sleep* not convincing because *did* is picking up
two complements.

Ann: *Kim has probably slept.*

Ann: Point is that the hook is not being passed along as whole; the ltop
comes from *probably*, but the index doesn't. Notion of semantic head
has been split. That's quite deep because we trying to think of this as
functor-argument combination. If we do it this way, then that's not so
clearly tenable. There isn't a really clean notion of semantic head
anymore. The fact that the intrinsic argument property is there in the
grammar breaks that fairly nice idea of a semantic head in the algebra,
but it was always a bit squirrley anyway to say that *probably* is the
semantic head but shares its index with the event of sleeping. Seems
pretty basic to say that the index is associated with the syntactic
head. So I'm not so sure I'm sad about that going.

Ann: Another thing was when I tried to work out the connection with the
syntax rules, when worked out, was sort of loose. Not terribly well
constrained. Some nice things about the way it worked. I managed to get
the same approach to the algebra working with a non-lexical grammar like
RASP, but it still seems looser than one would like. An idea from
Categorial Grammar that syntax and semantics have to be isomorphic ---
leads to all kinds of contortions to make it work and doesn't scale. Ex:
the post-processing that Johann Bos does to get to semantics from the
Clark & Curran grammar breaks what we would consider compositionality.

Emily: Wasn't Johann one of the ones in Berlin saying compositionality
was overrated?

Ann: \[Argument from learnability\] He must believe in compositionality
at some level.

Emily: I remember him articulating a position that the only thing that
counts as compositional is strict functor-argument application.

Ann: We want syntax/semantics isomorphic in some sense, while allowing
for exceptions where we have to. Want something fairly strong --- not
because it will always work, but because the cases where it doesn't work
are interesting.

Ann: The fact that that is broken lead me to think of this in terms of
graphs, rather than functor/argument. That means don't need to worry
about MRS v. DMRS. Once you convert MRS grammar to DMRS grammar, doesn't
look that different. Structurally fairly similar. Worth going through
this to see if we can come up with something that even if not
technically an algebra, gives us some constraints. And I know Emily at
least wants something implementable.

Emily: Yes, I'd be interested in trying to port this into the Matrix
core…

Ann: Not clear yet if it can be implemented (cleanly), but that would be
interesting. Let's see if the thing works on paper first.

Ann: When we have TFS graphs, we have a separate piece for the syntax &
for the semantics, and then we have a linking theory. From the POV of
the algebra, will just be writing semantic graphs with syntactic
annotations. Looks (D)MRS like + syntactic names to the links. This will
probably go wrong, but seems like a reasonable start. \[continues
reading assumptions from notes\]

Ann: Most basic assumption is that only access EPs through LTOP, INDEX,
XARG.

Emily: Does that include derivational morphology?

Ann: No, and I'm ignoring derivational morphology for now. I think of it
as something that you can think of as either a way of capturing a
partial constraint or as something that's fully productive. If it's a
partial constraint, it can be erratic. Just the connection between the
words and the semantics can be somewhat erratic (semantically empty
words, cx semantics).

Emily: But completely productive derivational morphology should be as
well behaved as the syntax.

Guy: If we use my system from HPSG last year, it's just the same as the
syntax…

Ann: In dmrscomp grammar, kept HOOK, mostly for symmetry with mrscomp
grammar, not accessed as a whole.

Ann: The previous algebra always treated composition as binary, because
always talking about functor-argument. Ternary rule in the syntax
binarizable two different ways in the semantics, might be useful. But
not sure I want to keep binary-only.

Ann: INDEX always comes from the syntactic head, LTOP normally does
(couple of cases where it doesn't in the DMRS grammar). NPs have the
same thing as before in not having LTOP linked to their components. When
you're trying to formalize what's going on in composition, the syntax
chooses which arguments to combine, chooses the syntactic head, and
chooses an open arc. Then the rest follows from what's set up in the
semantics + constraints on the semantics.

Ann: Going through the examples on the page. The links have syntactic
info embedding to abstract away from particular grammar. Not going to
talk about LTOP except where it becomes relevant.

Emily: How do we know which of INDEX and LTOP is pointed at by
ARG1.SUBJ? That's the type of the arc somehow?

Ann: It works out in the grammar that every time you have an arc like
that, you know whether it's an INDEX or an LTOP. /eq and /neq always go
for an instance variable, whereas /h and /heq always go for the LTOP.
The /eq is always relating an LTOP. If you have a link which is /eq it
has to be primarily going for the INDEX. The LTOP equation happens
alongside. If you go through what's happening in DMRS if the target is
an NP, it's always /neq going for the INDEX. If the thing is a scopal
link (qeq -type, /h) then it's always going for the LTOP. The other
cases are always /eq, which in some sense is going for both INDEX and
LTOP, but the INDEX is primary.

Emily: Because the INDEX is what will be the argument, the LTOP there is
just for identifying labels.

Ann: Yes, and you also get the case I was showing the other day that
shows that you need them both.

Guy: Coordination?

Ann: Having both L-INDEX and L-HANDLE is wrong.

Emily: Yes.

Guy: Ignoring that case, for regular adj+noun, we need both INDEX and
LTOP?

Ann: INDEX and LTOP will be the same thing in DMRS in ordinary MRS
they're going to be different types of things, but in some sense the
adjective is always going for the index.

Guy: What about *Kim probably didn't leave.*?

Emily: Only needs the LTOP.

Guy: Can you get non-scopal modifier outside scopal one.

Emily: Maybe we're predicting that that doesn't happen?

Ann: Seems not to come up

Mike: *Kim quickly didn't leave.*

Emily: *Kim emphatically did not leave.*

Ann: I think that's metalinguistic.

Mike: On L-INDEX/L-HANDLE: *Kim probably slept and certainly ate.*

Emily: Don't need both. Verby coordination points to handles, nouny to
indices. (LTOP of nouns always left unlinked.)

Ann: Yes, it's a holdover from when Dan wanted one form of coordination
for both, and then kept linking the indices for verby coordination
because the could.

Guy: So /h LTOP, /eq and /neq INDEX?

Emily: And /eq also LTOP, because in non-D MRS, need to do label
identification.

Guy: So do we really need separate nodes? What's the situation where
they are two different nodes and you don't know what might combine next?

Ann: The weird case with the relative clause… maybe? I don't know, but
I'm not prepared that you can never get non-scopal outside of scopal, so
it might be that. We could look at that and see whether they are such
cases.

Guy: So that's an open question then.

Ann: I think you probably need both. And I'm trying to keep in MRS-land
as well as DMRS-land.

Ann: Back to examples --- can think of passive as swapping arguments
around (it's more complicated, but still). Syntactic labels on the open
arcs being changed in order to allow for a different syntactic operation
like the normal way of talking about it in HPSG (for passive,
topicalization).

Ann: More interesting examples *Kim tried to go*.

Emily: SUBJ.XARG is surprising to me.

Ann: It's not a path, it's two different labels for the same arc (not a
path).

Emily: "&lt;target&gt;"?

Ann: Just a representation for a node.

Guy: Is XARG a node?

Ann: It's always a node that is from an open arc. In some sense it's
more relevant to think of it as a label on an arc, than as a node.

Emily: Do we need a constraint that says that XARG always points to
something else in the lexical entry, or else nothing external needs to
grab it? (A grammar that doesn't obey this constraint would give broken
MRSes…)

Ann: When you start in a lexical item, the XARG is always another label
for an existing arc, but in the graph language, you sometimes label arcs
with only XARG, but only when they're pointing to some other structure
(not within the lexical item).

Guy: So the XARG is always a property of the node being combined with.
Can't have more than one arc labeled XARG.

Ann: I'm assuming the feature structure convention where there's only
one thing per label, but you're right that I'm only sort of half
following that here.

Guy: There's two XARGs here, but there's only one coming out from any
particular node.

Emily: Raising example. Do you want to do raising in terms of SUBJ of
the complement not in terms of XARG?

Ann: In terms of the grammar at the moment, it shares the entire
subject. Could be in terms of XARG or in terms of SUBJ. There's a reason
syntactically to do it as SUBJ.

Emily: We do that in SWB, but I think it's wrong. We say that the whole
synsem is the smallest thing that gets both the index and the syntactic
info we need -- but that doesn't mean you need to grab the whole thing.
The empirical issues have to do with expletive selection (moot in the
ERG, because Dan uses the types under *expo-index*) and quirky case in
Icelandic. But even those don't require grabbing the whole synsem. We
can say that both raising and control predicates grab the XARG and that
raising predicates additionally (in some languages) reference some
syntactic feature(s).

Ann: Okay, good. XARG there is better.

Ann: *Kim made him angry*. If it's binary, no semantic link between make
and him. Make has two complements, but the first one it doesn't link to
semantically at all. *him* is the COMP1, not semantic link there.

Emily: What do you mean by reconfiguring the syntax?

Ann: In some sense ternary, but in the ERG, we treat everything as
binary, and so naturally combine *make* with *him*, then that with
*angry*. If we pretended that *him angry* was the constituent in the
syntax, could combine those directly and *make* could take that as a
scopal argument. Not saying we actually do that, that's one way of
seeing what's going on in this example, which would mean that we don't
need to … the point is that there's a certain amount of arbitrariness in
the binary branching in the ERG. If you're going to insist on the thing
being binary branching, but I actually make it go the other way.

Emily: Is it problematic in this version of the algebra, because that
first combination has too many open pieces?

Ann: My feeling as of an hour ago is that I'd rather treat this as
ternary and not say that things have to be binary. But it's simpler to
treat things as binary, though, in terms of writing constraints.

Guy: One of the open arcs is pointing to what the target's XARG points
to.

Ann: But COMP1 isn't really an open arc in terms of the semantics,
because it doesn't have a semantic label.

Guy: I was asking a different question --- I still feel uncomfortable
with XARG in these graphs. There's a single XARG node from an open arc.
Because then we don't ever have to refer to links inside the target
graph. There's an INDEX, LTOP, XARG and those are things that we can
point to.

Emily: Yes, exactly, that's why XARG was in the HOOK.

Guy: Can we instead say that we pick up the target of the only open arc
of the target?

Guy: When we do COMP2, we take the target graph and we associate the
target graph's LTOP with make's ARG2 and the target graphs XARG with
make's COMP1.

Ann: The target graphs XARG is the end of an open link.

Emily: If we're doing it binary, what does the first step look like?

Ann: The way the ERG does it? It doesn't work. Well, yes it works, but
you have to postulate a hypothetical node as I was starting to talk
about in the L-to-R example a couple of days ago. You have to invent a
placeholder and then it can work.

Guy: Why doesn't it work?

Emily: The pattern is the lexical entry for *make* --- when we pick up
*him*, it's only COMP1.

Guy: So can't it be COMP1?

Emily/Ann: That's only syntactic, not semantic.

Ann: It's a disconnected graph in the semantics, and that's something I
was trying to avoid.

Joshua: But the other binarization works fine.

Emily: But it's terrible in the syntax.

Ann: I wouldn't try to do it in the syntax.

Guy: What's wrong with having a disconnected graph?

Ann: Disconnected graphs are what you try to avoid like the plague.

Guy: But it won't be disconnected in the end.

Ann: I think you want to try and avoid that. If you allow that, then you
can basically squirrel away all sorts of stuff. Not very constrained
once you allow that.

Guy: Still constraining how you can combine the graphs.

Ann: Only to the extent that lexical entries are constrained, which is
not very. Not the definitive answer, just pointing out something I'm
uncomfortable.

Guy: Why are disconnected graphs an issue? This structure is not
complete.

Ann: I'm trying to make the pieces all connected graphs, but it seems
like a nice thing to try to achieve.

Emily: And if we can't keep to that, it would be nice to find a suitably
backed-off constraint, instead of anything goes.

Ann: Alternative is placeholder node that we haven't seen yet. The
reason the example is in here, is because I've been worrying about.

Ann: The next one is these *easy* things.

Emily: Piece of cake!

Ann: Those are just horrible. Wouldn't have worked in the original
algebra (and I've looked at *make* as well). *An easy editor to try to
impress.* Filling slots in both directions, clearly not algebra
compliant. Need to keeps open links in the sense that they're never
bound.

Emily: How so? ARG1 of *try*/*impress*.

Ann: yes.

Emily: Why *try to impress* and not just *impress*?

Ann: Rules out some cheating ways of doing this.

Emily: So the problem here is the mutual selection which isn't just
functor/argument. And we'd like to do this but can't in the old algebra?

Ann: We may like to, but how do we constrain it?

Emily: Implementation status? Something I can use to port to matrix.tdl?

Ann: dmrscomp grammar doesn't have any obvious ways of constraining what
you're doing, just an attempt to get out the same sort of structures.
Wanted to see if you really didn't need as separate INDEX node.

Guy: Is the XARG the subject of the target?

Emily: Oh right -- you want the SLASH of the target, not the XARG. We
got rid of SUBJ before, but still have SLASH.

Ann: Trying to go from a semantic target to a piece of syntax for that
target. Wanted to just do syntax at the top level, and not go in any
further, just XARG.

Emily: To show this problem, and not the mutual selection thing, with
*This is an easy editor to try to impress.* Don't we also see this
problem with other LDDs?

Ann: I don't think so.

Emily: *Bagels we think Kim likes.*

Ann: *we think Kim likes* still has a SLASH.

Emily: So does *to try to impress*. How is it different?

Ann: It's because of *easy*.

Emily: So it's the fact that it's lexically mediated, and not a
construction doing it?

Ann: Will attempt to make that a bit clearer.

Guy: Syntax picks out the SLASH and the semantics can just do its thing.

Ann: I wasn't really thinking SLASH --- more worried about about the
mutual selection.

Guy: *Bagels we think Kim likes* has no mutual selection. Don't have to
worry about the SLASH because the syntax is doing it. But *easy* we have
something more complicated…

Ann: The mutual selection would be a problem for me, even if there
wasn't a SLASH involved.

Last update: 2016-06-21 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/StanfordAlgebraAdditions/_edit)]{% endraw %}