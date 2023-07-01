{% raw %}# Default Inheritance

SIG at [Stanford 2016 summit](https://delph-in.github.io/docs/summits/StanfordSchedule)

\[... everyone slowly comes to agreement on what kind of defaults are
being discussed ...\]

There are currently no run-time defaults, but the LKB supports defaults
at compile time.

===

Woodley Packard: All feature structures are o-list (all values are
optional, unless specified otherwise). When you hand that over to the
parser proper, features must be well-defined, and you need a whole type
hierarchy.

Dan Flickinger: But where does the problem come in with the o-lists?

Woodley: Let's say the noun "fact" takes an obligatory complement. My
verb says that its complement is of type synsem. The synsem in the tdl
had o-list for all its valence features. Can that unify with fact's
valence list?

Dan: That property of optional lists can be for lexical types, not for
synsem.

Woodley: So if you did put that constraint on synsem, you would have a
problem?

Alex Lascarides: The only danger I see is to have a compact description
of a grammar, which you expand before you parse. You essentially
introduce constraints within the type hierarchy in the wrong place...

a.FOO = /bar

b.FOO = /baz

c := a,b c.FOO = ?

(This is called a "Nixon diamond" - if Quakers are pacifists and
Republicans are not, is a Quaker Republican a pacifist?)

Picking the right description could be quite hard.

Ann Copestake: I use defaults in a very limited way in the example comp
grammars. It gives you additional expressivity. It's not particularly
worrying.

Dan: I'm optimistic in the same direction. Let me walk you through a few
examples. The ERG has some annoying features like
is-this-thing-in-a-conjunction-or-not, etc. (At the very top of
lexicaltypes.tdl). I would like to say that words have default features
for these, and override them as necessary. At the moment, I have to say
define a number of lexical types, and tell lexical entries to inherit
from one. Not transparent, not beautiful.

reg\_n\_proper\_lexent, norm\_n\_proper\_lexent - basic proper noun, oh
and by the way they have a default value. Only purpose is to allow most
proper nouns to have this default value, and let the few exceptions
inherit from the more general type.

Alex: Using defaults avoids exploding the number of types.

Emily Bender: Matrix inherited this naming scheme (basic, reg, norm) but
I can't claim we've applied it consistently.

Dan: basic\_unary\_phrase - there again, a complex set of constraints,
oh and norm\_unary\_phrase. Almost always true (punctuation and
inflection).

Ann: The other ones are completely straightforward, but this blocking is
tricky.

Dan: In one case, the re-entrancy is preserved, but in the other case
it's not.

Ann: You can squash a re-entrancy, but there's nothing to say that
something is \*not\* re-entrant, without giving incompatible values. If
you give something that's incompatible, the default re-entracy is
overriden, otherwise it stays.

Dan: In this particular case of prenominal modifiers, I'd have to
declare the value of punctuation I would expect.

Ann: If you want to override a re-entrancy, you have to give two
conflicting values.

Dan: In this case, I can. The only place this comes up is when there is
punctuation on the daughter that I don't want on the mother. I'll never
want to go the other way.

Alex: \[starts drawing on the board\]

a.F = a.G

b := a b.F.H = foo b.G.H = bar

b.F.W = b.G.W ?

Ann: There's a question of where a re-entrancy is overriden at the top
level... There was an idea that you could set up lexical rules where F
is coindexed with G, even if there is some overriding of that
coindexation (e.g. F.H \~ G.H, but keep F.W = G.W). But there are cases
where this can't work. When you start relying on that stuff, the YADU
algorithm goes into complete meltdown. So the danger of using defaults
in the grammar is that it can grind to a complete halt. One of those
cases is complicated re-entrancies.

Francis Bond: if we're only using defaults before compiling the grammar,
can we check if it's okay?

Ann: It won't melt-down at run-time. But YADU will just go away and not
come back. Can't give you a static checker. Just to quickly say what's
going on in YADU, in the case of a Nixon diamond, you generate the
possibilities - it's okay if there's 2, but not if there's thousands.
Mostly it's okay, but it can sometimes blow up.

Dan: If the feedback to the developer was relatively quick (even just a
blue screen of death), it could help increase the clarity of our
grammars, and that could be incremental. So fixing the easy things would
be a major boost. For the more complicated recursive parts, there's less
benefit.

Alex: When you have lots of things at the same level of the hierarchy,
that's when it's useful.

Ann: I wouldn't necessarily have predicted when it blows up.

Alex: Compile time could be speeded up.

Dan: Compile time is okay.

Ann: I don't think discovering this could be speeded up. Put something
in and check it, then go onto the next thing.

Dan: In the debugging process, if I find that two things really should
unify and I don't see it in the chart, I do step-wise interactive
unification. Does that become vexed if I use defaults? My next step is
to say, where did that value come from? I can climb back up through the
type hierarchy, but this could become a more entertaining game with
defaults...

Ann: I've never tried doing that. I'm pretty cautious about defaults, so
I wouldn't have thought it would be a problem.

Dan: Use for values that don't have much further structure.

Question for developers: How much time have you spent pining about the
lack of defaults, or have you already been using them?

Francis: I want defaults, exactly in the kind of case you've mentioned.
Especially if you later think you need to split a type, and then need to
split it all the way down.

Emily: We'd like to put in support in the Matrix so that all the
features get copied that students aren't thinking about.

Francis: I'd like support for asking, where in the tdl did this value
come from?

Dan: We'd like that anyway.

Francis: even more pressing.

Dan: Bumped into these issues in your comp grammar?

Ann: When I'm debugging grammars, they're small enough.

Dan: I'd like to try an experiment using the SWB textbook, where the
notation exactly matches. There, I've noticed cheerful use of defaults,
and had to expand the hierarchy. It would be instructive to see how much
I can claw back. Ivan was pushing a more expansive use of defaults.

Ann: In the first version of the book, there were places where it would
be impossible to have an implementation that would do what they wanted.

Emily: We tried to firm things up in the second version.

Dan: I have a set of grammars that more or less do what they were
supposed to. I could try and see if I can do the same thing on the same
test suites. I don't think that's an expensive enterprise.

Ann: Didn't we try this in the YGG (Young Gentlemen's Grammar)?

Stephan Oepen: An implementation of Sag and Wasow by Chris
Callison-Burch and Scott Guffey ...

Dan: The ‘kiddies' grammar’. Upgraded to the young gentlemen's grammar.
That survives somewhere? I'll look for them.

Ann: Not sure but I think so

Stephan: Yes: ‘src/data/textbook/’ in the main LKB repository.

Ann: also exporting the version without defaults to another system. Not
sure if that still works.

Dan: Played with Yi Zhang about four years ago for PET. IT worked out of
the box. The file was large, but it compiled okay. Not tried with ACE,
and not checked more recently.

Ann: Just output TDL.

Woodley: Once you've fleshed out the defaults, is the type hierarchy
well-formed?

Ann: Yes, but I can't remember how we did it exactly. It must have been
well-formed.

Woodley: wrong interpretation of defaults on the board?

Dan: Or using in different places? If we say that the word type says I'm
default inflected +, but then...

Ann: At the top, it doesn't say anything. It gets pushed down... but I
can't remember exactly. I remember we thought about this.

Stephan: We have a non-trivial object to study. YGG is there and
contains defaults. Didn't say it loads.

Dan: That's a place to start. IF it loads and runs, it would be quick to
compare. I wouldn't have to do any new implementation.

Ann: If you want a basic grammar with defaults, the comp grammars are
there, too.

Stephan: Talk to Chris C-B?

===

Dan: Monse and Berthold?

Berthold Crysmann: I'm impatient to have something else. I'd like to
have something else... Koenig and Jurafsky (1995) - partition types into
dimensions, and derive types by picking one option for each dimension.
You can pre-link two dimensions.

Dan: Already there?

Emily: But it's dynamic.

Ann: Shuly Wintner's machinery?

Dan: That would be another discussion group.

Montserrat Marimon: I would have to think about it.

===

Dan: Overseeing new grammars. Have they wimpered or are they
brainwashed?

Francis: They perhaps don't know about defaults. But I'm informed by
issues in the Chinese and Indonesian grammars, and can see benefits of
defaults.

Francis: Ann, can you guess how long it would take to implement YADU in
ACE?

Ann: For Woodley, a day?

Dan: So not an enormous task?

Ann: It's a fairly small file.

Dan: Does it intrude into the rest of the code?

Ann: Woodley's looked at the LKB code in the past, and seen places where
it intrudes a little bit.

Woodley: Everything carries around a defeasible and indefeasible version

Ann: There is this cost, but they all become single structures at
run-time. The algorithm is well-documented.

Woodley: The indefeasible portions unify as usual, and knock out the
bits of the defeasible portions as necessary?

Ann: Yes. Can't remember exactly how it works, but the basic algorithm
is pretty simple. Involves making lots of options.

Dan: The extra hop could start to be annoying, if we need both the LKB
and ACE. But the grammar developer is not the same as the person running
over large corpora.

Ann: Start with the LKB.

Woodley: See if you really can't do without it.

===

Dan: Other suggestions/advice/worries? Things to look at?

Woodley: Ann, portion that fleshes out bits that have defaults -
described in YADU?

Ann: I think so.

Emily: Speaking of papers, when reading Sag Waso and Bender, students
ask how you know when to use defaults or just have subtypes. What are
the kinds of phenomena that lead you to choose either option?

Dan: It would be easier for a baby grammar: refine the method, try it on
a larger grammar.

Emily: If you would like someone to collaborate and write it up?

Dan: Aren't you busy?

Emily: I think I'll have some down time.

Dan: Ann, any remaining words of wisdom? Cautions? Warnings?

Ann: Not really. It can have unexpected results, so try on simple
examples first.

Last update: 2016-07-15 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/StanfordDefaults/_edit)]{% endraw %}