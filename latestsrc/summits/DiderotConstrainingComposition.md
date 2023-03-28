{% raw %}Ann's intro:

An attempt to put constraints on compositionally always expressed in
terms of DMRSs. 2001 MRS algebra and the later RMRS version doesn't
really correspond to what the grammar is doing. And messy, lots of
messing around with variables. Last few years working with DMRS, which
is variable free.

A couple of years ago, decided to try writing a grammar that directly
produces DMRSs (in a small grammar). Turned out to be easier than
expected. In some ways easier than producing MRSs.

Could do that and replicate MRS algebra, but decided to try and produce
a set of constraints on what composition means in terms of the
operations on the combinations of DMRS graphs.

Intuition: e.g. a long complicated sentence with a clause right down at
the bottom, can't attach something to that clause unless you've somehow
made it available. Notions of availability of the interior of the
semantic structure, can only get hold of things with explicit pointers.
Important not only for elegance but also because the generator depends
on it.

Looking for examples of tricky things that might test the limits of the
algebra.

Dan: *That ladder is too tall to climb* --- *tall*, by virtue of being
modified by *too*, it now takes a VP complement. Also *tall enough*, *as
tall*, and that VP complement is gappy and controlled by the subject of
the thing modified. Maybe one step removed from the *easy* adjectives.

Berthold: Is that like the quasi-modal infinitives, also in German and
French, where they show up in *tough* constructions (which aren't
long-distance).

Ann: Let's do the *too tall to climb* example first.

Dan: The adjective *tall* by itself doesn't have an ARG2/doesn't take
any complements. \**This building is tall to climb*. Any adjective
specified by intensifier *too* can take a gappy VP complement, where the
XARG (SUBJ or MOD) of the adjective is identified with the gap in the
VP. (Modifier use: *a building too tall to climb.*) More complicated
than *easy* adjectives, because the *too* isn't interested in that
argument. If it were a lexical rule from *tall* to *too tall* it
wouldn't be different from *easy*, but it has to be syntactic: *too tall
and heavy to carry*.

Guy: Does *too* need to have its own XARG, or can it identify the XARG
of it's SPEC with its own XARG?

Dan: I think that's how I do it.

Emily: And how does the COMPS thing end up on the mother?

Dan: specifier-head rule pulls the COMPS for the mother from the
SP-COMPS of the non-head daughter.

Ann: Does the semantics follow the syntax there?

Dan: I think it's unsurprising looking when I'm done.

Alexander: Once you're done with *too tall* it just looks like *easy*.

Emily: What is *climb* the argument of in the semantics?

Dan: The comparative relation, contributed by *too* --- the degree of
tallness is being compared with the VP.

Emily: So externally *too tall* looks like *easy*, but internally
there's more going on.

Dan: Slight additional wrinkle: Can also put in a *for* phrase -- *That
hamburger is too tall for Bernd to devour.* So *too* is actually putting
in both the *for* and VP\[to\] onto the COMPS list. (Or it's a
infinitival clause, underspecified between S and VP.)

Emily: Other examples from the [Singapore
Summit](http://lingo.stanford.edu/delphin2015/MRS-algebra-discussion.pdf),
*do be* in English, plus some Japanese and some Wambaya.

Dan: \[Sketches *do be* construction.\] That's on the brink of the worst
case. The other one, from work with Francis and his students: *she
craned her neck*/*\*she craned his neck*. Want to rule the latter out as
ungrammatical---use XARG of the noun to do that and build an ICONS.

Ann: ICONS is separate...

Dan: Doesn't matter if it's ICONS or identity.

Ann: ICONS relationships in general might just do different things in
terms of the algebra. You're saying you still need to use the XARG.

Dan: I think so because I need to get number agreement. It's on the
border of something that maybe ought to be done with the idiom machinery
over in the semantics, but in our papers there are arguments for why we
want to do it in the syntax (in the composition).

Ann: We don't do binding, we don't do reflexives... if we did those
would be via ICONS. There's various reasons why I might think
coindexations are outside this...

Dan: If I just decided to store an ICONS there and hook it up somehow. I
still have to do the bookkeeping to find that subject.

Ann: If the only thing you can do with it is do an ICONS, I'm not sure
I'm worried.

Dan: This might be an interesting place in the DMRS universe that
becomes last vexing. If the three attributes in HOOK are my only
affordances for composition, then LTOP and INDEX don't work, XARG is the
only hope. If I have any other reason to want to use that XARG (like *do
be*)...

Dan/Ann: *\*All she has to do is crane his neck.* maybe not have enough
slots to keep track to rule that out.

Emily: Isn't the *do be* one weirder --- it's going after it's COMP's
MOD's XARG.

Dan: Sure, that's fine.

Guy: No deeper than *too* above.

Ann: Is there a limit on the depth of that path?

Dan: Typically phrases are COMPS/SPR saturated --- not walking down into
the daughters. Anything that the sign continues to carry up is still
fair game. Wouldn't expect to get to a modifier's complement's
complement.

Emily: I wonder if that makes Wambaya less weird. Digging to a similar
depth, but not directly filling a hole with it, so I guess it's weirder.

Ann: This analysis of Wambaya is elegant, but it seems to be only
necessitated by the constraints of our parsers. The formalism can allow
discontinuous constituents ... we just never developed a parser that
does. (Even though the generator can to a certain extent.)

Guy: As a concrete example of going beyond a CFG backbone, there's some
work on higher-dimensional trees. TAG & CCG class of languages can be
reformulated in terms of 3 dimensional trees.

Dan: But CCG doesn't have much of a theory of constituents.

Guy: The class of languages defined by CCG and TAG can be defined in
terms of 2nd order logic over trees.

Ann: And those classes of languages are more constrained that those
defined by HPSG.

Guy: CFG languages are 2nd order logic over trees. Mildly context
sensitive languages same thing over 3d trees. If we add unification...
can see things in terms of a more expressive backbone instead of a CFG
backbone.

Dan: I can see that, it surely changes the grammarian's task.

Guy: Just saying this is one way of achieving the goal.

Ann: The more general point I would like to make is that I'm not sure
that there's anything that would happen in terms of how discontinuous
constituents show up which would absolutely worry me in terms of
constraints on compositionality.

Emily: It worries me as a syntactician because if I allow discontinuous
constituents, I don't know what my constituents are anymore.

Ann: And many people want to get rid of constituents.

Dan/Emily: And they're not worried about grammaticality.

Alexander: Claims on the upper bound of variables being exposed---is
that still what you're talking about? Interacts with discontinuous
constituents. If requiring that compositional structure combines
constituents that are next to each other, that puts more constraints on
the memory/how much has to be carried up.

Dan: Set up the algebra based on English and then allow additional
storage if you get discontinuity.

Emily: The typologist in me is grumpy about starting with English for
that.

\[Discussion of floated quantifiers in Japanese\]

Conclusion: If the floated quantifiers are unconstrained as to which NPs
they can modify, then the argument could just be left underspecified to
be resolved via anaphora resolution. If there are syntactic constraints
to model, then it gets more interesting.

Dan: *She entered the room a pauper, and left a rich woman.* ... those
NPs are just underspecified as to what they are identified with.

Ann: Two types of problems---complex combinatorics (*easy*, *too*),
things in the "wrong" place.

Ann: Memory load is a left-to-right sentence comprehension notion. Not
sure whether that adds that much more, already need to do that for
things that are semantically straightforward because the relevant thing
doesn't come until the end (especially in German). When I talk to
non-linguist native speakers, they describe havig a notion of a
situation, where the verb just isn't known yet. I can get to 7 things
that would be separate bits of DMRS, but if you have a bland situation
they are attaching too, it's not so bad. So it's not so bad to assume
you have to hallucinate something, since in incremental, temporal order
processing you have to do that anyway.

Berthold: Hausa negation comes in two bits -- typical phrasal
affixation. If you have a sequence of VPs, you find one ba on the first
VP, all the others take the non-negative tone marker and then the final
ba. Negation scopes over all of them.

Dan: Doesn't seem scary in terms of bookkeeping of the elements.

Berthold: Yeah okay phrasal affixation analysis does it. So what's
scary?

Dan/Guy: When you have to keep track of more than three things in the
HOOK.

Berthold: How about partial VP fronting?

    Aufräumen hättest    du  die Küche   ja   auch schon   mal  können. 
    clean.up  would.have you the kitchen PART also already once can
    `You really could have cleaned up the kitchen by now'

\[deu,
[source](https://books.google.fr/books?id=3z29CwAAQBAJ&pg=PA326&lpg=PA326&dq=ein+M%C3%A4rchen+erz%C3%A4hlen+Stefan+M%C3%BCller&source=bl&ots=-VscdtNaF9&sig=KbB7Z3wkm5PBDhNTmDp2wb7EzkQ&hl=en&sa=X&ved=0ahUKEwjvy46o-eTbAhWMOBQKHWmeBRkQ6AEIYzAQ#v=onepage&q=ein%20M%C3%A4rchen%20erz%C3%A4hlen%20Stefan%20M%C3%BCller&f=false)\]

Guy: I don't think it's too problematic though, because the actual
contentful verb goes on the slash list and take over its arguments.

Emily: Examples where it's really a "partial VP" that's fronted?

Berthold: Nerbonne 1994 -- telling your kids a fairy tale.

Dan: I think even one object missing from the fronted VP makes it hard
for us. This is a potential candidate other class of examples --- though
there is the other debate about topological field-based analyses (more
like the shuffle operator).

Dan: Can we get it from embedded clauses? Tell a story I expected my
sister to think John should his children.

Antske: It works in Dutch.

Berthold: It works with coherently constructing predicates (those that
form verb clusters; not just modals but also many control verbs).

Guy: Quirky case? ("helfen"'s ARG2 is dative, not accusative -- dative
plural "-n" highlighted below).

    Helfen hättest    du  den        Kind-er-n       ja   auch schon   mal  können. 
    help   would.have you the.DAT.PL child-PL-DAT.PL PART also already once can
    `You really could have helped the children by now'

Berthold: Sure!

Guy: I take my comment back -- too much depends on the verb to build a
structure without it.

Ann: Back to *easy* adjectives --- do you think the current analysis is
algebra compliant?

Dan: Yes, I think so.

Ann: According to my notes, I had made the possible constraints on the
DMRS composition weaker than the MRS algebra.

Dan: In order to get these through?

Ann: No, just a consequence of how I set it up.

Last update: 2018-06-27 by GuyEmerson [[edit](https://github.com/delph-in/docs/wiki/DiderotConstrainingComposition/_edit)]{% endraw %}