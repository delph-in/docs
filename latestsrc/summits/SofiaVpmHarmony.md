{% raw %}Intro (Dan): Motivation grew out of two experiences, one ancient, one
more recent. In the LOGON project were working across frameworks and it
was essential to be clear with Helge Dyvik about what properties of MRSs
we wanted to try to enforce or sustain across these two grammars. Long,
somewhat tedious meetings looking at lots of tedious examples. Didn't
seem like the most efficient way to scale up to lots of language pairs.
More recently working with Martin Kay's student at Stanford working with
SRG and ERG for Martin's human-involved translation system. Were trying
to map between SRG and ERG MRSs. They're pretty close. But inevitably
places where the two languages headed us in different directions.

Issue of variable properties. In the ERG and at least a few other
grammars, there's a \[name\].vpm (aka *variable property mapping*) file
that makes explicit assumptions about paths to certain variables and map
to an external format without paths -- flat representation. But we
haven't come to agreement about what the names of those attributes and
values can be. Even if we agreed on the attribute names, the values will
be different across languages. My preference would be to sit down with
the existing grammar writers and maybe one or two semanticists. Then
build up a superset of possible values and agree on names for everything
--- document to point people two. E.g., for number, will find 1, 2, 3
and not 1st, 2nd, 3rd. Agree on a conventional set of names. Grammar
writers will then build a vpm file to sustain that mapping.

Went down that road somewhat for the ERG and Helge's grammar. Woodley
has recently pointed out inadequacies in the current ERG. Maybe have a
SIG on a methodology for arriving at that communication format. Is that
worth our time, hopeless, done already? Grammars seem to never agree on
this.

Oe: In part because the languages may differ, but also because grammars
haven't been synchronized.

Emily: Person, number maybe. Gender is hopeless (the right way of doing
this is coreference resolution, with gender filled in on the target
side). Tense maybe, aspect if you can do it would have a very big
superset. But Glenn is finding that a variable property is an awkward
way to do it in Thai, might want EPs instead. Also, some languages seem
to want additional variable properties, so the inventory of attributes
across languages isn't fixed either.

Dan: That bleak picture suggests that maybe we should have a mechanism
for bleaching MRSs for properties that might be annoying.

Ann: The gender property might be useful in some languages. So maybe not
all or nothing.

Emily: VPM allows for this bleaching, as well as putting in default
values on the way in.

Oe: Shows [RmrsVpm](https://delph-in.github.io/docs/tools/RmrsVpm) page. Even if we can't agree on the 'upper'
SEM-I (i.e. cross-linguistically valid statements about semantic
interfaces), should consider making use of this machinery to only expose
what we'd like to be visible in the external interface, and maybe also
simplifying names (and paths). Example of PNG.PN &lt;&gt; PERS NUM on
the page. pernum analysis makes sense English-internally, but it was
agreed at a Cambridge meeting some years back that pulling apart person
and number is preferable in the external MRS universe.

Ann: You want that hierarchy in the grammar because of the compositional
properties, but those compositional properties are irrelevant for the
exchange format.

Dan: Not just composition, but also morphological.

Ann: That's actually a case where it's possibly a mess for the exchange
properties. There are some cases for German where going to exchange
properties mean we can't underspecify anymore.

Dan: So it's a little bit lossy.

Emily: UW is starting on some sort of standardization with in the
Grammar Matrix customization system --- soon starter grammar will have
starter semi.vpm files, intended initially for monolingual use.

Dan: In some sense trying to harmonize this goes against our general
skepticism about an interlingua. Here we've been pretending that there's
potentially eventually a right answer about the variable properties.
Maybe that's not right. I also talked with Glenn about aspect in Thai.
Might be pushed back into using EPs in rels --- packing it into a
variable property English is an illusion cross-linguistically. The
underspecification of aspect gets trickier if rels. We had at one point
treated tense as two EPs for each tense: once between reference time and
event time and one between reference time and speech time (Reichenbach).
Switched to variable properties as a more compact way of representing
tense constraints, but not necessarily the right thing to do.

Ann: Has anybody ever written down what things like "past" mean in the
SEM-I? Maybe past is obvious, but... in terms of Reichbenbachian theory
or other theory or even just descriptively. Worried that it looks like
we're getting similarity across languages, but cross-linguistically
present, perfect etc. used differently even between English and German.

Oe: In LOGON we agreed that (most) variable properties merely expose
morphosyntactic information and not really semantics. Convenient that it
was in the variables (and thus more out of the way). Differences came up
even in Norwegian-English pair.

Ann: Need to document what they mean in a language. If you were going to
do it in some temporal logic would need to map to a different
representation anyway.

Lars: Use ERG as standard reference point/interlingua, document other
grammars by describing differences.

Dan: One place where that becomes awkward in Spanish-English pair.
Spanish distinguishes two kinds of past. Don't have a morphosyntactic
difference in English there at all. Need to build up a somewhat richer
library that we would expose e.g., in the matrix.

Lars: Didn't mean interlingua. Accumulate pairwise contrasts as a step
toward a more interesting thing.

Petya: Connection to yesterday's discussion of phenomena. The term
"aspect" in Bulgarian means something different from other languages.

Dan: I like the idea of a step-wise approach where grammar writers talk
pairwise and negotiate an agreement and write those down in the vpm or
somewhere as comments. Then someone might use that as the basis for
something to add to the Matrix.

Dan: Do we need to have a SIG sometime before Friday to push on this
idea further, or enough already?

Emily: Are there other things beyond VPM?

Dan: VPM is first, since everything else is theoretical until that's
solved. But there are others, e.g., underspecification of quantifier
rels (between indef and def in jpn&gt;eng translation). There may be
others, but not today's talk.

Ann: SIG about methodology, how to go forward.

Dan: What we could do in small groups or pairwise. I'll take silence as
consent and propose a SIG.

Francis: There's the low-hanging fruit of just spelling common names the
same way.

Last update: 2012-07-04 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/SofiaVpmHarmony/_edit)]{% endraw %}