{% raw %}## Difference lists, Emerson lists and multiple wh-extraction

Present: Olga Zamaraeva (OZ), Woodley Packard (WP), Dan Flickinger (DF),
Guy Emerson (GE), Berthold Crysmann (BC), John Carroll (JC), David Inman
(DI), Emily Bender (EB)

Scribe: Emily Bender

OZ: For Slavic languages want to be able to do multiple extraction.

GE: What’s the order without wh words?

OZ: The neutral word order is SVO, here SVadjunct. You were there then.

WP: At least in English where is somewhere between complement and
adjunct. Can you do when and how, both unambiguously adjuncts?

OZ: How and when did you do it? Judgments are the same: with over
coordinator, it’s fine, but without it’s iffy.

DF: Okay, but the ones with the overt coordinators aren’t relevant for
this discussion, because they’re single extraction, right?

OZ: Right. Just trying to get a sense of what we might need to handle.

DF: Need multiple extraction in English too: “That’s a problem that I
don’t know how to solve.” Solve is missing both manner adverbial (how)
and its complement (problem). Top of the LDDs is different, not two wh
words in a row, but still need a SLASH list with two things on it.

BC: Be careful taking the presence of a coordinator at face value: “What
and to whom has Bill written?” Also in Russian: “Always and to all this
professor would like to help.” External relation of the coordinated
elements is different, so maybe not ordinary coordination.

OZ: Yesterday, Sanghoun said he would like to analyze these cases as
some kind of fake coordination, but I didn’t get a detailed sense.

DI: Pseudo-coordination is the term, not sure if it applies here.
Canonical examples: “go and see if”, not really go and then see. Other
examples?

EB: try and

GE: come and

DI: Clearest example is “try and” where the other verb is obviously
subordinate to try, but there’s an and. Main point: coordination is
funny sometimes, seeing an ‘and’ doesn’t make it necessarily real
coordination.

BC/OZ: Can put in ands in each of the spots in (2).

BC: “Where who and when gave?”

OZ: Also okay, in fact the best.

BC: So that’s a “coordination” of adjunct, argument, adjunct, so clearly
not really coordination.

EB: And Adam P isn’t here so we can keep assuming a clear
argument/adjunct distinction.

BC: Adam should be here, he would type raise everything to argument, and
then even (3b) is a big problem.

OZ: Displays basic-filler-phrase…. what is the problem? Here the SLASH
is constrained to be of length one. What’s the technical problem that I
will have with this data?

WP: Is it the case that the ERG doesn’t do multiple slashes just to keep
the chart from exploding?

BC: Cannot limit the length easily with diff-lists, though with 0-1 it
works.

WP: Can’t stop at 2?

GE: You could, but Dan once said it’s hard to justify max 3 or something
like that.

DI: But we know that one isn’t a enough…

DF: We typically try to choose our problems when building an engineering
platform, and making the counterfactual assumption that SLASH lists are
max one.

EB: How did that help?

DF: Readily understandable to constrain diff-list of max one.

EB: And why do you need a known max length?

WP: Recursive adjunct extraction.

EB: We can block that another way though.

WP: How?

EB: typed list, can ensure exactly one adjunct extraction

DF: Let’s say I never want to extract both arguments of give, I don’t
want the edge in the chart that pretends that I can.

BC: Hausa resumption can easily have several long distance dependencies,
but only one can be a gap, so I could keep with the one adjunct
constraint. That is implemented in the Hausa Matrix-based grammar, so
that’s a good place to look. GF paper in 2015. Uses lists to restrict
gap-type SLASH elements to one.

EB: Will be interesting to look at b/c the version of these constraints
from the ERG in 2001 impressionistically uses these 0-1-dlist to keep
things together in various ways that I don’t understand. And when I try
to loosen them, things get to underconstrained. This is why I thought
Emerson lists might help.

DF: In those days, I felt like I was keeping a monster under control,
with tweaks like one order of the append arguments working when the
other didn’t. The base from which the Matrix was launched wasn’t such
solid engineering in this respect. Share the intuition that the Emerson
lists might help.

DF: If I take off the global 0-1-dlist constraint, how could I say at
most complement of give can be extracted, if I wanted to?

EB: Because of lexical threading, couldn’t you say that the SLASH of
give itself is 0-1-dlist?

WP: But doesn’t that block adjunct extraction?

EB: No because adjuncts aren’t subject to lexical threading.

WP/GE: But yes, because the 1-dlist case can’t be integrated into a long
diff-list above.

EB: So this sounds like the point where the Emerson lists might help.

GE: Biking in, I thought there wouldn’t be anything you \*couldn't\* do
with diff-lists that you \*can\* do with append-lists, but it seems like
this is one.

DF: Also need to be able to ask: “are you empty?”. 0-1-dlist typing
helps with requiring subtype 0-dlist. So even if we go for a bigger max
length, still need types, but a bigger subhierarchy.

DI: With Emerson lists, could check for empty, right?

GE: Yes. And can still append afterwards unlike with diff-lists, once
asserted to be empty, always empty.

BC: Also lose constraints like olist on a list. So you’re free to impose
those constraints anew, right?

GE: The list and the container are both new, but the elements are
unified with the lower ones.

EB: To summarize: the big win with the Emerson lists here is that at any
point you can look at the length, know what it is, and still do further
append with them up the tree.

DF: Can I still check for e.g. olist?

GE: Could make yet another subtype cons-of-alists-that-are-olists…

EB: If you’re just checking for a property on a list, then you can just
use the type on the checking and don’t have to keep transmitting that
property up.

DF: Right—if the things like olist are only used for checking for
something and not for publishing properties, then it’s easy. Otherwise,
I need to make new varieties of Emerson lists, and I think I see how to
play that game.

WP: How much info gets carried up?

GE: It will all be inside the APPEND feature, quite deep at the top of
the tree. Eventually get down to the ones defined directly in the
grammar…

WP: So would be tempting to add these to “deleted daughters” in
processing, but what happens with implicit computation, e.g. with
lexical threading, where the value of SLASH on a head depends on its
arguments, several levels up in the tree. Would trimming that stuff off
lose information?

GE: If you were trying append underspecified lists that would happen…

EB: That’s exactly what lexical threading does.

DF: The mother’s SLASH is always only the head’s, but that’s built up
from the arguments.

GE: I can see how that might be a problem then.

DF: So we might not be able to prune it.

WP: If you were going to use it for RELS then that could get
inefficient….

EB: But with RELS we’re already ignoring RELS, so we don’t have to
ignore APPEND in general to not get the RELS appends.

DF: It would be luxurious if the only problem was an efficiency one.

GE: Might need to add mutual subtypes for olist (and other parameterized
lists) and the append types so that they unify, in case you are checking
for olist and then trying to append that. (Otherwise will get
unification failure.)

All: Admire example from Guy’s modified 567-English grammar with all
diff-lists replaced with Emerson lists. Reentrancy numbers get high!

EB: Is this where we were going to talk about syntactic sugar?

GE: Aside: You have to choose one or the other — diff-list appends or my
appends; can’t mix.

GE: If this is used widely, then special syntax would be nice.

EB: Could we also do sugary display in LUI?

WP: Would you like something like FEAT &lt; value, value, value &gt; =
\[nn\] (+) \[mm\]?

EB: That would be nice :slightly\_smiling\_face:

Last update: 2020-01-09 by GuyEmerson [[edit](https://github.com/delph-in/docs/wiki/CambridgeExtractionAppend/_edit)]{% endraw %}