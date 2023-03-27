{% raw %}Berthold:

    hat          im     Labor er es blitzen   sehen
    have.3sg.RPS in.the lab   he it flash.INF see.INF
    
    He has seen lightning in the lab
     -- lightning in the lab
     -- seeing in the lab

In lab and flash aren't a constituent; there was no way of
underspecifying it. Idea instead (with ACONS) -- gather up targets and
then resolve attachment later. Current GG solution: Just an arbitary
attachment.

Ann: ACONS was a two-arg thing, with an index and then a list of
targets, with the semantics of this index is coindexed with exactly one
of that.

Dan: How do you take things off of that list? Because there are targets
that are excluded.

Berthold: It must have been a list of pairings...

Emily: \[Reviews big picture overview of [Hankø
notes](https://delph-in.github.io/docs/garage/WeSearch_UnderspecifedAttachment), ending with:\] came up with
examples where the structure puts in some constraints. Is that what you
meant Dan about taking things off the list?

Dan: Yes --- if the inner one attaches high, the next one can't attach
lower.

Guy: Is that true with these German examples?

Berthold:

    hat im     Labor [vom      Garten aus] er es blitzen sehen
    has in.the lab   [from.the garden out] he it flash   see
    'From the garden, he saw it flash in the lab'

Each modifier can still attach to either verb, high attachment of one
doesn't block low attachment of the other.

Guy: What about "erblicken" --- is that the same kind of verb? With
"sehen", we can't tell if it's an infinitive or a reduced participle
(without "ge-").

Berthold: No, it's a very restricted class. But it includes "hören" --
and it's "hören", not "hört". Called an "Ersatzinfinitiv" (replacement
infinitive).

    hat im     Labor er es klingen  hören
    has in.the lab   he it ring.INF hear.INF

Dan: *On Tuesday I thought John was going to win.* --- we currently need
two different slash paths, can't underspecify. Does the same ambiguity
happen in German with fronted PPs.

Berthold: Sure.

Dan: And that's still independent of verb clusters, mittelfeld, etc.

Berthold: The explanatory account has a trace down by the lower verb,
and you move things around in the mittelfeld. That's nasty because you
get two simultaneous movements. Can also get remnant movement: *Blitzen
sehen hat er es im Labor*

Guy: To follow up on Dan's example, if the base version

Dan: *When did you find out that Bill was going to the party?*

Guy: But looking for an example where it's in the mittelfeld...

Dan: I'm looking for a way to use the same underspecification in the
fronted case.

Guy: I wanted to see whether that was a different phenomenon from this
German.

Dan: Could find different solutions, but if we can do
underspecification, it would do both.

Ann: ACONS is indeed a list of pairs -- a list of (index, label) pairs.
Can't reconstruct why.

Berthold: If you add negation ... or even here. Seeing qeqs flashing.

Ann: What are the ACONS you'd have for the flashing example?

Berthold: sehen: \[e1, l1\]; blitzen \[e2, l2\]; im Labor \[e3, l3\]

Ann: Here's what you sent me as a spec

    isect-mod :=  avm &
        [mod-anc index-lbl-pair,
        target-ancs diff-list].
    
    index-lbl-pair := index-type & lbl-type.
    
    index-type := avm & [index individual].
    lbl-type := avm & [lbl handle].
    
    hook := index-type & [LTOP handle,
        XARG individual].
    
    relation := lbl-type &
        [WLINK list,
        PRED predsort ].

Berthold/Ann: What's on ACONS is a list of isect-mod objects.

Berthold: Grammar builds up the target-ancs lists, and then the
modifiers grab hold of them to add to ACONS.

Dan: So you're collecting up modifier targets before you know what the
modifier can modifier. If you find an adverb that can only modify the
verby things, but it gets the whole list.

Berthold: But you have types.

Guy: To ground this in data... what if it were an argument of the lower
verb instead of in Labor.

    hat  den        Kindern      er es helfen   sehen
    have the.PL.DAT child.PL.DAT he it help.INF see.INF
    `He saw it help the children.'

so there's a very strong constraint that it has to be associated with
the lower verb...

Emily: But we aren't talking about doing this for complements.

Ann: Where are you putting the constraints, it has to be in terms of
unification because that's all we've got. Are you putting it on the
event?

Emily: In the case of a complement, the constraint isn't on the event.
It's because the one verb is looking for a complement, and the NP itself
can't modify anything. I think what Ann was saying is that in your
adverb case, it can get that whole list of targets, and only the events
are possible resolutions.

Dan: But if you have idiosyncratic syntactic constraints or something
about configurations...

All: two-stage was actually about human disambiguation in treebanking,
and secondarily in trained models. (Not about how we're modeling
language...)

Dan: Brings up extraposed relative clause--*A man saw a woman yesterday
who I never met.* Allowing underspecification would help here.

Berthold: In German that's disambiguated by gender.

Dan/Ann: ... which is on the index, so we can have the info needed in
TARGET.

Ann: I think it's worth treating extraposed relative clauses
mechanically as anaphora, even if we don't think that's really what's
going on.

Dan: Or with a long-distance dependency, but that's really expensive.

Berthold: SOV German has much more relative clause extraposition.

Ann: Syntactically they're sitting somewhere, and potentially you have
some sort of accumulator constraints, and that can't be done in ICONS,
because it looks the same.

Dan: The worry is if one finds syntactically controlled island
constraints where certain indices become inaccessible. Then we'd need
some way of passing those cosntraints into the resolution engine.

Berthold: Like a right roof constraint.

Dan: Accumulate indices within a clause, but the constraint bearing
construction would discard info from below.

Ann: But we're already not doing a good job of accumulating constraints
on pronouns.

Berthold: ICONS wouldn't cut it because ICONS is only about pairs of
individuals...

Dan: I think ICONS could work for pronouns, like Principles A&B.

Ann: Not those, the ones with quantifiers.

Emily: Do those ones require syntactic info somehow, or is it all
visible in the structure of the MRS?

Ann: Potentially visible in the structure of the MRS. Might be some
cases where we're not retaining enough information. The data is totally
messy anyway. *I had 10 marbles and I could see 9 of them on the floor.
\#It was under the sofa.* You get to places where the constraints are
unboundedly difficult to work out. (Not a syntactic constraint in this
case.) If you construct a proper MRS model, you don't have a distinction
between the 9 mentioned and the one not.

Emily: But if you're looking at the MRS you do.

Ann: It also interacts with presuppositions and stuff like that.

Emily: This thing about index,label pairs is easier in DMRS, right?
Because then the modifiers could just say ARG1/EQ to that node.

Ann: In my email to Berthold, I was thinking of those things as full
hooks.

Ann: In DMRS you also have potentially easier access than you do if
you're just passing the HOOK around. If just passing the HOOK around you
don't have a way of going back up and seeing other stuff.

Emily: So how far back along the graph can you go?

Ann: Depends on the type of operation. If you're looking it as feature
structures you can't go back; if it's an operation on MRS structures qua
MRS structures, in e.g. a separate resolution stage which is what I
implemented for Berthold.

Emily: I wonder if that would give enough leeway for the examples where
the high attachment of one blocks low attachment of the other. But
probably not, because for that you'd need the order which is definitely
a syntactic fact.

Ann: If you do allow yourself access to the order, then there's a nice
solution in terms of no crossing dependencies.

Dan: And we do have the characterization.

Guy: What about an 'output' list for each attachment.

Ann: But the point is that there's an elegant solution in terms of
dependencies that can't be reproduced without the order.

Emily: And order of the modifiers.

Guy: *Put the marbles in the box on the table.*

Ann: So not the more twisty ones like *Put the apple in the fridge in
the box.* --- with the right intonation, works with there's a box in the
fridge and you have to put the apple in the box.

Guy: Can't both modify *put*?

Dan: No --- because it's not a modifier, it's a complement and there's
only one slot.

Ann: There's an argument going back to the 1980s that *in the fridge in
the box* is providing one argument with zero conjunction.

Dan: I do that in the ERG now. pp-mod rule where they attach together
and they're both waiting to serve some higher master. No conjunction
relation because EPs with the same scope are conjoined anyway.

Emily: Do you do that for *In Paris on Tuesday Kim and Sandy went for a
walk?*

Dan: Yes, there too. Used to have one modifying the other, but that's
not what that means. Zero coodination rule cleans it up.

Guy: 2018 version of the ERG?

Dan: Yes. Paul Haley finally cornered me with some examples.

Berthold: Fridge example reminds me of:

    Sollen wir in März  noch    einen Termin      machen?
    shall  we  in March another one   appointment make?

Dan: If we were going to adopt this underspecification, would we do it
across the board, including in *I reserved a room for Sandy*, where it's
easy to build two trees, but we don't know how to choose. Also, how to
force the grammar to only attach PPs at the highest point? Found it to
be hard.

Ann: Why not lowest point?

Dan: The lowest point strategy is sort of viable. But then the
accumulation looks a little different, because the set of targets isn't
available at the point of attachment.

Berthold: Then using CFROM/CTO to geometrically constrain the
attachments?

Dan: I was also exploring adding negative constraints in another place.

Emily: How can you do the blocking of low attachment of later modifiers
based on earlier ones as something you accumulate as you go up the tree?

Dan: The later attaching modifier can see the earlier attaching one
being there and add a note relative to it.

Ann: Then you need a Catalan series number of constraints.

Dan: Rarely looked at more than three...

Guy: Not enough to just say higher than that one?

Ann: If you just use CFROM/CTO can do it with the simple examples like
PP sequence and compound nouns. The cases where it goes wrong is with
the coordination possibility. The geometric structure thing although
pretty is not enough but it doesn't allow for all of the combinations
seen in the data. Not rich enough.

Guy: The question would be what's the scope of how much we want to
underspecify. The geometric one also wouldn't allow underspecification
of *put in the fridge in the box* (coordination case)---still have a
two-way ambiguity there. If we want to underspecify over that was well.

Dan: Also that's a complementation issue--HCR v. HMR. We're going to
keep that ambiguity anyway. The ambiguity we should be trying to reduce
or eliminate is different ways of doing the HMR structures.

Guy: Just leaving the modifiers underspecified?

Emily: If so, then does the geometric solution come back into play.

Ann: I remember there being a strong reason not to pursue it.

Dan: Me too, but don't remember what it was.

Ann: Something about the interaction with the syntax.

Emily: Anything that requires the order to be passed into the semantics
offends my sense of asthetics.

Dan: But in the case of noun noun compounds (without other stuff
interspersed anyway), the syntax adds nothing beyond the order.

Ann: We already pass information into the MRS on indices that isn't
purely semantic.

Emily: PNG?

Ann: You have to have plurality on indices, but it doesn't have a direct
correlate in the model. But you need it (and gender) for pronoun
resolution. You're attaching that information where you really don't
want to say it's semantic. (Though Dowty has a paper saying that German
grammatical gender is semantic. But I'd rather say it's not semantic,
it's in the MRS.)

Emily: Have we reached any conclusions?

Dan: Done a lot of reminding ourselves of previous conversations and
blockges. Don't have a strong sense of this being really
viable---probably memory of previous attempt. It was hard and the
efficiency cost was disastrous, because this kind of ambiguity packs
really well/quickly.

Ann: If you have DMRSs and you pack DMRSs, it's really potentially quite
elegant in terms of the way the structures collapse when you're doing
incremental resolution. The packed resolution in the compound case is
pretty straightforward. As you go along one of those bracketing and the
others collapse. Master's thesis a few years ago --- code is checked in
for DMRS packing. Not integrated with the grammar, taking DMRSs and
putting them together.

Ann: So just do what you're doing.

Dan: Except it doesn't solve Berthold's problem.

Ann: ACONS does though.

Guy: And this one doesn't have the geometric problem.

Dan: Maybe this is just overreaching to see how broadly we can expand
the ACONS solution ... but it's still potentially quite interesting for
the problem that gave rise to it (German configuration).

Berthold: Could extend it to the *put* examples, if put exposes its
complements as well in the TARGET list.

Emily: But put requires that complement position, can't just say ---
here's a thing something can attach to.

Guy: *Put it in the fridge in the box* has one reading that *Find it in
the fridge in the box* doesn't have, because of the zero coordination.

Emily: That's not allowed?

Dan: Right I don't allow the zero coordinated PPs to be modifiers.
Because that would mean just the same thing as each modifier attaching
independently.

Emily: But you do allow them to be extracted modifiers?

Dan: Yes. Engineering hack to allow them there while blocking them in
the other place.

Ann: Coming back to the packing situation, just because I don't know
whether there's some scope for talking about this in terms of the
interaction with the machinery, maybe long term. The version with the
DMRS is that you have a series of graph fragments and equality
constraints marked in terms of the parses that contain them. Each node
is represented only once, but associated with potentially hundreds of
parse numbers. Similarly with equality relationships between ARG links
and what they connect to. Big disjunction labeled in terms of the parses
in which its true. As you find that certain equalities are true/false
can collapse the search space as in treebanking. If I talk to Woodley
very nicely, and if we had grammars that were producing DMRSs directly,
could we set things so that the packed forest representation that he
produces could be converted to the packed DMRS representation? Would
potentially be an object of interest to system builders.

Dan: A smaller step: Could we import the DMRS forest pruning mechanism
into the unpacking routine? Could use it to thin the forest before doing
any parse ranking. First step would be to throw away everything that
doesn't satisfy the DMRS constraint.

Ann: I see this as an interface between what Woodley's got and what
you'd want to give to an outside system. Say you're talking about a
microworld, have a constraint where you'd want to avoid all analyses
that don't include that constraint.

Dan: Would be nice to do it as I unpack.

Ann: I was wondering whether you could take the packed feature
structures and run a DMRS conversion machinery over the packed object.

Dan: He does some miraculous things without unpacking.

Ann: Don't need to manipulate, presumably it's just a change of
formalism.

Emily/Dan: But the MRS isn't used in packing/is on the restrictor/would
block things from packing if included.

Dan/Ann: Empirical questions: (1) Let's keep DMRSs in our structures as
we pack them will pack less efficiently--how much so? Then when we start
unpacking if we have a DMRS constraint from the target domain. (2) Can
we translate from Woodley's packed representation directly into a packed
DMRS representation that is goig to be easier to work with.

Ann: It may already be that Woodley's packing would work as is over DMRS
feature structures.

Dan: Another path: Let's pack as we usually do and then find some
mapping from that packed forest into a packed DMRS representation. Would
be ideal if we could do it without full unpacking. Then we could
experiment on what we could do with a packed DMRS. And then we could
come back to the engineering staff and ask whether we can get DMRS
packing efficiently in one step.

Ann: What's wanted is a way to ask the downstream application for input
on key points to collapse the ambiguity space.

Dan: Might even improve speed not just accuracy of unpacking. That's a
big cost at least in ACE.

Ann: Email Woodley a toy grammar and constructed very ambiguous
sentences that the grammar can handle. What happens when we don't put
the semantics on the restrictor---what does the packed representation
look like.

Dan: One version of the experiment should be doable without any change
to ACE. If we just put the DMRS in as we pack we can see if it plays
well with packing.

Ann: Are there any tools for looking at the packed forest? FFTB?

Dan: He's computing the disciminants without unpacking...

Last update: 2018-06-27 by GuyEmerson [[edit](https://github.com/delph-in/docs/wiki/DiderotUnderspecifiedAttachment/_edit)]{% endraw %}