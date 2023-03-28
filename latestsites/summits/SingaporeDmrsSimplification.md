{% raw %}Ann: \[Goes through slides\] None of this is saying that the DMRSs
coming out of the grammar are in any sense wrong, just sometimes
inconvenient. So it's entirely about handling things algorithmically.

Ann: The problem with what we're doing at the moment is that it's
ad-hoc; makes it hard to replicate the research; potentially making and
repeating mistakes; changes to the ERG require changes to the
simplification code. Would be nice to (a) collaborate and (b) have a
standardized simplified form, which might also help with usability
outside DELPH-IN.

Dan: Question about the inference example. You noted that in the
Verbmobil days we did that conversion of clock times, but we were also
doing a more aggressive conversion into calendar dates (because the
domain was on arranging meetings). That can get relatively nasty,
because it requires maintaining info about discourse state.

Ann: Two stages. The first stage was some code that I wrote that
converted our MRSs into a standard form that might have had info
missing. Second stage was the discourse guys filling in their bit. If
you do this, you do want a representation that allows info to be filled
in, but there's still a notion of a standard MRS.

Francis: Two use cases: [JaEn](/JaEn) MT---we turned on the code that
adds numbers up because the number names have slightly different
internal structure. We did something different with dates, becaues we
had to keep track of when articles were published to get Monday &lt;&gt;
Aug 3rd because the two texts were different about that. I agree that
having a uniform internal thing to pass off to central processor is a
good idea.

Ann: Anyone got others? I know Stephan does some of that kind of thing.

Mike: With the numbers: "Two or three hundred and fifty" is ambiguous.
Which would you want to get?

Ann: I thought Mike's example involved vagueness?

Francis: Technically ambiguous. The grammar gives us that, but we might
not be able to handle all of that in a conversion because there's lots
of things that can go into it.

Ann: That's a slight side-track. The point is that those examples are
very rare in the types of texts that most of us are dealing with (e.g.
Wikipedia). Even if we didn't handle those small percentage of those
cases, it would still be worth specifying.

Dan: Cecil Smith --- is there some utility in coming up with a way of
dealing with Western names in Wikipedia etc? (But note that names from
different cultures can be very different.) Some standard record
structure.

Ann: In terms of simplified DMRS, would recommend something close to the
original string.

Dan: Do you have a suggestion for "John and Mary Smith" and then?

Ann: Rare.

Dan: Sadly not, in the WSJ at least.

Ann: I agree that in general we do have to deal with coordinate names,
and properly, but in many cases the correct beautiful complex structure
is not needed.

Francis: I'd like to see for "Felix and Tom Cecil Smith" a simplified
DMRS that looks like "Felix Cecil Smith" and "Tom Cecil Smith".

Dan: Are you asking/suggesting that other people around this table have
already been doing some of these kinds of normalizations/conversions in
doing other tasks?

Ann: Yeah.

Dan: Show of hands ...

\[Francis, Woodley, Guy, half of Mike\]

Ann: Is there anyone using DMRS/MRS output and not doing that
simplification?

Dan: Yes, but in these very artificial worlds (education domain,
predicate logic). Those don't count as counterexamples.

Emily: Sentiment analysis paper last year (Kramer & Gordon) didn't.
Sar-graph stuff wouldn't.

Woodley: Robot control language, scope of analysis---didn't need it.

Prescott: Would it be fair to look at near-tree output as input for
training other parser infrastructures that leverage trees?

Emily: That's what most people do in the [SemEval](/SemEval) task. What
did you guys do with that?

Dan: Not sure...

Emily: Reduction to bilexical dependencies would mean dropping all
non-lexical predicates which would wash out lots of this.

Ann: Yes a radical kind of normalization, many times treat all numbers
as the same, etc.

Dan: The mysterious Paul Haley has been doing normalizing of number and
measure expressions in his chemistry (?) data.

Ann: We've done a lot of this in the past as well.

Dan: In Cyborg.

Ann: ... in a rather ad-hoc way. For particular applications, is there a
sensible end representation? There isn't a standardized representation
of measure expressions (as of a few years ago).

Emily: I like the idea of using this to make our technology more easily
used by others. But if it's part of a black box, would need to be
tunable, between "aggressive normalization" v. "preserve contrasts"
(e.g. coordinated names).

Ann: Yes, the idea would be something with parameters.

Francis: Or give people two layers---original and simplified.

Ann: So if you could do it in a way that would allow people to pull in
bits of the more elaborate layer; would require maintaining character
position.

Woodley: Sounds like quantum MRS idea from a few ideas. Would seem
pretty harmless to throw in an extra relation.

Francis: With the same ARG0.

Mike: On the idea of sharing tools: The work that I've done with MRS
paths (taking DMRS and arranging it into a tree, top-down, bottom-up, or
headed). I'm curious what you did with tree conversion.

Guy: Perhaps we can talk about it later. Maybe make it a SIG?

Mike: The kind of simplification I'm doing isn't taking a constellation
of preds and arguments to an atomic unit (though I'd like to, in MT
work). I'm taking a subgraph and building a model with those, but it
gets sparse, so I'm doing simplifications like removing variable
properties. Have ways to get different levels of representation for the
same subgraphs. I'm curious about your tree-based stuff.

Guy: Looking at your earlier slide on conversions, we had similar steps,
but there were corner cases where you still don't get things like a tree
(aside from t he undirected cycle cases; never get a directed cycle).
Coordinating modifiers where you can't just reverse the ARG-EQ link
because the coordination link introduces a new entity. There are other
corner cases too and we didn't resolve all of them. Are other people
interested in this? Would you find it useful to have a DMRS
representation with a single root?

Mike: SIG...

Dan: Is it the case that there are other people interested in so-called
semantic parsing or the reinvention of simple inference. Are there
people coming up with black-box normalizations or semi-standards we
could appeal to? Nivre & Manning and others on universal dependencies,
e.g. That's mostly at the bilexical level, but maybe they're also
looking at some of these other elements. Have you come across things we
can use to reduce our work load in coming up with a target
representation.

Ann: Universal dependencies isn't that relevant, though if someone did
DMRS &gt; UD others would be interested. There are things like TimeML
which are worth knowing about (Pustejovsky et al; times and dates, 10
years of work). Could provide an interface to that. There's lots of
marked up data we could use. I guess there are probably other things for
other types of info analogous to that.

Dan: What about the messy space of named entities, making use of
gazetteers, or other ways of normalizing names of cities to e.g. city +
state + country, filling in missing pieces if they're clear enough. It
just seems like temporal standards is one thing, but geo-spatial is
perhaps another one.

Ann: There's been lots of TimeML shared tasks, but haven't seen any for
geospatial.

Dan: Maybe in map tasks, but otherwise can't think of any. Would make
searching for things easier if you didn't have to remember which country
a city is in.

Emily: But it sounds like you're talking about the second step.

Dan: But we can know that "Frisco" is a horrible name for "San
Francisco". Isn't that our side of the fence?

Emily: No, I think our side is to take the complex structure for "San
Francisco" and make it just one predicate with the full string.

Ann: The point isn't about getting to particular inference, but
identifying some targets when they exist and otherwise standardizing our
own methods and tools. e.g. Francis's comments about multiple layers
linked together.

Francis: Ties into things we think about with ISF. Is "unclasped" one
predicate or two, and how can we be consistent across the full range? We
have a few places with similar issues where we'd like not full
disambiguation of everything, but predictable output at the same level
(inching/bounding towards it).

Dan: Reminds me of the example of multiple noun compounds, where the
grammar can never decide. Should we try to flatten or otherwise
normalize noun compounds, even though sometimes there is one correct
example? "Airline reservation counter reservation desk"

Ann: Yes. We have a proposal for a DMRS structure which underspecifies
all of that, could be produced from a lattice (rather than directly in
the grammar). There's good ways of doing that disambiguation now (with
90% accuracy).

Dan: What about *bankrupt airline reservation counter* --- where does
the adjective attach? Is that just a corner case we don't care about?

Ann: Would have to look at examples and see. I think there's an
underspecified structure there.

Francis: As Ann said in one of the slides, simplification can be lossy.

Dan: But then the layered representation can help us not fret too much
about that.

Ann: Another way of thinking about it that relates to what Woodley's
been doing with the robot stuff: just walk over the DMRS and takes out
the parts that you want. Maybe think about that separately from the
layered idea, since you don't want to have to support all possible uses
in one layered representation.

Chris: Tag the simplified structure with what you've done: This time has
been canonicalized; this name has been compounded.

Dan: Record the provenance of the predications.

Last update: 2015-08-03 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SingaporeDmrsSimplification/_edit)]{% endraw %}