{% raw %}## SIG transcript: Web/Metagrammar, 19 June 2016 (Day 4)

[DELPH-IN 2016](https://delph-in.github.io/docs/summits/StanfordSchedule)

Requestor: LuisMorgadoCosta

Scribe: GlennSlayden

**Luis**: We'll try to be brief. The idea that we are trying to
implement in Singapore is a grammar that will need some kind of
procedure to turn on/off parts of the grammar for an education grammar,
a Chinese grammar in particular, and it's being developed by a few
different people spread out everywhere which makes it particularly hard,
and the questions I wanted to discuss are related to the persons who
have made available web services and staging areas for developing
grammars online, and building grammars in CLIMB, and Glenn has presented
something similar, if you have something you want to present,
particularly TJ, who might have previously mentioned something in
connection with this. So I would be looking for how can people
collaborate with multiple people contributing to the grammar, but my
dream would be for it to be a web service.

**Antske**: What do you want from a web service, what is the value of
that?

**Stephan**: Walking in here I had the expectation that there might be 3
dimensions:

1. Metagrammar; how to break up the totality of grammar into statements
2. In-browser tools
3. Grammar development methodolgy, CLIMB vs. classic/traditional.

**Antske**: CLIMB is a methodology; the customization system is a
specific way of doing CLIMB.

**Luis**: We don't have a programmatic back-end to the development of
our metagrammar. We are using folders within folders. It's easy to say
that its not probably the best sustainable methodology. Stephan is right
to say that these 3 points exists, but if they have come together in the
mind of anyone then maybe more than one could be solved.

**Stephan**: Maybe metagrammar is not the best description of the first;
it has to do with breaking down the table into atoms.

**Antske**: Metagrammar definition: there are different ways to do it.

**Chris**: There is a continuum of meta-ness.

1. Turning TDL code off and on.
2. Turning analyses (customization system) off and on.
3. How do these things interrelate

**Stephan**: atomic constraints versus notion of grouping them.
Constraint modules.

**TJ**: "Choices file" is a metagrammar in the second sense?

**All**: Absolutely

**Chris**: *[The Art of the Metaobject
Protocol](https://en.wikipedia.org/wiki/The_Art_of_the_Metaobject_Protocol)*.
How the object system in Common Lisp is implemented. What is meant by
"make me a new class". It's all about working at a higher level of
abstraction.

**JimW** Historically, though, note that there's only been one actual
implementation of that: the Common Lisp object system.

**Luis**: If you continue these three layers of problems that Stephan
outlined. Ability to turn on/off lexical entries. 2nd point would allow
multiple people to contribute to the same grammar. Even working on the
same phenomenon. 3rd level of meta-ness: how to do all of this under a
browser-based umbrella

**Antske**: This is what I was wondering about: regardless of underlying
metagrammar system, you want to offer someone the ability to choose
grammar activation features --as opposed to-- the ability to have
full-blown interactive grammar development in the browser.

**Glenn**: Isn't the latter too far off to discuss?

**TJ**: I've implemented a LUI which, instead of using YZ web,
bidirectional, so maybe not.

**Glenn**: I was suggesting that we should elaborate the metagrammar
backends before worrying about whatever front-ends might take advantage
of same.

**Antske**: Well you do need to have the full picture in mind the whole
way. But I do agree with Glenn to some extent.

**Luis**: CLIMB can give some of this backend, but has a learning curve.
So I'm not sure I can convince my bosses about that, unless there's some
minimal web functionality that could be more compelling.

**Antske**: Well, yes, but I still don't see the in-browser connection.

**Luis**: Well, I'm saying browser because think of it as just an
editor.

**Glenn**: A somewhat awkward one.

**Luis**: Bear with me, it helps bypass the learning curve. And the
point is it's harmonizing across all machines, Linux and Windoze alike.

**Glenn**: A lowest common denominator.

**Luis**: Yeah, who wants to learn Emacs etc.?, What if I just want to
see the lexicon only, and they don't even need to know anything about
ubuntu or unix or whathaveyou.

**Stephan**: I share your sentiment about browser as GUI; it has many
attractions. As much as possible we should focus on systems where
services are architected independent of the GUI.

**Antske**: yes, the atomic stuff, the metagrammar itself, the support
system, and even wizard-style meta-meta-grammar guidance. And on top of
that there's the GUI.

**JimW** Doesn't the matrix intersect with all these somewhere.

**Antske**: The matrix is designed to produce a baby grammar.

**Luis**: I have multiple ways of producing adjectives...

**Chris**: (Difference between matrix and customization system.)

**Luis**: It's short in many ways because it doesn't allow you to spin
off what's produced. I'm trying to vary it a little bit to affect/effect
my grammar. Sometimes you use one versus the other.

**Antske**: The matrix is a demonstration of coverage points 2 and 3.

**Stephan**: it lacks point \#1, the atomicity

**Chris**: I feel like its current form is an example of an output of a
metagrammar. As Emily said previously, "I welcome more than one
customization system"

**Stephan**: Glenn's proposal on the first day reminded me of a Sophia
proposal of using type addendum.

**Antske**: But at a certain point you want to look at it all together.
Glenn's proposal and declarative CLIMB do it in a way that's way better
than that Sofia addendum proposal, which was wildly unpopular at the
time.

**Chris**: Original visual-age ENVY was from Smalltalk, was based on
method-level version control. As you are working on a constraint, you
can work on that in an independent fashion, but it's stored in the back
end such that it can...

**Luis**: Yes, it's basically a database.

**Antske**: What's hard is actually finding the analyses, and
subsetting/extracting/partitioning them.

**Stephan**: Let's proceed assuming the database, with arbitrarily
cross-cutting groupings, activated by i.e. bit-vector, similar to what
Glenn proposed.

**Glenn**: And then you can discuss what's associated with each/any such
grouping. To start, commenting and/or version history, per partition

**Luis**: Well could those version control logs be in [GitHub](/GitHub)

**Glenn**: Maybe not, they are tied to more specific computer science
techniques that mightn't scale to that

**Antske**: It's clear that there are things that are needed that might
...

**Stephan**: It should be possible to fully-automatically import the 20
year version history of JACY into the metadata partitions, to satisfy
this. The tabular method should end up being more powerful than all
this. I don't think we're arguing here. We'll only be increasing
flexibility over what we have now.

**Chris**: I think it's important to keep version history orthogonal
from activation state.

**Glenn**: My proposal addressed that.

**Antske**: A reviewer didn't see the difference between my work on
CLIMB and simple version control and I had to clarify this.

**Stephan**: I don't feel I understand \#3 very well

**Chris**: I believe it has to with systemetizing and abstracting CLIMB
mechanisms at a very high level. Hmm.. Being able to add these
customizations or meta-analyses in a way that is more in the linguistic
domain that the "dropping in a large set of python code" approach.

**Antske**: Yes it's on my list of "things I wish I had had more time
for on my thesis." You have constraints that contributed to multiple
analyses. So a key priority is to turn anayses off. Then, you can catch
things with good regression tests. You need an organized way of working.
There is of course also the way Wintner did it for the type hierachy
with merging, but when they hired Petra to write a grammar with this
system, it proved to be way too complex. We need to hew to the more
practical.

**Glenn**: Which is why my proposal, in the final analysis, boils down
to engineering.

**Antske**: No, your proposal is academically legitimate because it
informs linguistic development.

**Chris**: I think there's a middle ground there. (Example of contrasing
Haskell with Javascript) Both of those have weaknesses/flaws, and merit
too.

**Antske**: Agree

**Glenn**: I want to reinforce how my system puts great responsibility
on the grammarian, with great power comes great responsibility, in this
case to design and plan how you will use the metagrammar capabilities.
They are a blank slate. And this last part is is really what Stephan's
item \#3 amounts to, no?

**Antske**: Yes, absolutely.

**Luis**: For example, I can try to be principled in this way, things
that carry X label can be combined with groups in some way, for
particular phenomena.

**Glenn**: I talked about it the other day, operationally conjoint vs.
disjoint analyses

**Luis**: Yes exactly, at a minimum.

**Antske**: Toy variations, these can be very helpful for regression and
development. For example CASE marking, I just gave fixed suffixes in a
toy analysis. Customization CLIMB has full code-generation from the
original customization system, so any possible choice becomes a toy
variation. You wanna know if something still works....

**Luis**: Ok, but what \*notion\* of grouping do you have in CLIMB.

**Antske**: Customization-CLIMB just has a large piece of code which
includes interaction definitions, it's specifically definied which types
and constraints go with which phenomena. That is extrmely flexible. You
can just add the kind of things you are interested in. This is a bit
more complicated and I believe Glenn is not going in this direction.

**Glenn**: Correct.

**Chris**: I feel like speaking of "meta-grammar protocol" is not far
off. These two analyses interact in X way. This is an abstraction over
the metadata. Yes, I realize that this is a new proposal beyond Glenn's
but maybe not Antske's.

**Glenn**: Each metadata axis has a name, which helps you identify it's
use, but I don't go beyond this in supporting formal analysis of that
sort. It's up to the grammarian to define useful structure.

**Chris**: Pushing back on metagrammar, I think it requires more
richness than just on/off partitions.

**Antske**: In the simplest form, you have your analysis and you
surround it with "\#ifdefs" to identify thge various analyses. There's
multiple ways to do it. CLIMB means metgrammar (analyses plus grammar
generation) plus code. Then there's CLIMB customization, the most
systematic and powerful way thus implemented, you can group analyses
very simply: i.e. I you have choice x, you get all this code. This is
very generic. With procedural CLIMB, you can extend this model and get
hundreds of options.

**Luis**: The wizard aspect is no rocket science. And did I mention, I
really want my browser front end. I can't be forcing people to write
Python, if procedural CLIMB requires that.

**Chris**: Well I'm talking about having access to "what is this TDL
talking about", withough millions of *if-then*, *if-then*, *if-then*.

**Antske**: well there are two versions that don't require any Python
code. These only use the on-off switches. With declarative CLIMB, people
can really just write TDL. It also gives you abbreviated paths, if you
want that. Glenn has indicated that that is not a part of his system.
And finally, "Short CLIMB" just pulls things out of the existing grammar
and lets you define deltas over it based on choices, via type extraction
":-"

**Glenn**: Should that operator be added to the processors?

**Antske**: Nah, I don't think so. (Chorus agrees.) But meanwhile, the
short-CLIMB is the best documented and works well for scenarios where
you want to flip back and forth between analyses. "Short CLIMB" is a
great way to start isolating out the analyses from a monolithic grammar,
for targetting any metagrammar system.

**Luis**: Well we're almost out of time, so I do want to leave time to
hear about TJ's system.

**TJ**: It's a LUI based system that facilitates grammar development.

**Luis**: Is there an editor for TDL?...

**TJ**: Yeah, I don't know if there's value in editing TDL graphically
at this point.

**Luis**: Yes, I see that with \#2 and \#3, we don't need so much GUI
editing.

**Ned**: Live TDL editing, there's definitely been requests for that,
getting rapid turnaround when you've made changes to the grammar

**Luis**: I think I've lost needs I came here to solve; I can let her
continue to write TDL she knows, even though the GUI has benefits for
other reasons, but I won't need it for my immediate project maybe. I
still think that requiring newcomers to work on Linux and terminals and
such is a bridge too far.

**Antske**: Well what else is certainly doable, is opportunistic
techniques for helping identify invalid types during pseudo-live
editing.

**Stephan**: There may be existing code to use for in-browser editing of
TDL, etc.

**Luis**: CodeMirror for example. We could write a TDL syntax checker
for it.

**JimW**: LightTable is a fast-response IDE in the browser.

**Chris**: That one is somewhat moribund.

**Luis**: Yes, we might be able to manage the TDL editing in distributed
folders via existing 3rd party tools.

**Stephan**: OverLeaf, there's one called Ace, used by Github and
Wikipedia.

**JimW** You can also integrate your backend into GoogleDocs?

**Stephan**: Doesn't sound attractive.

**TJ**: Woodley, in ace, can a compiled grammar be mutated on the fly?

**Woodley**: no.

**Glenn**: This gets into the pie-in-the-sky of "live editing". But note
that you can give the illusion of the full thing. If you can re-load a
grammar from scratch (TDL) within less than \~1.5 seconds its
indistinguishable from, and surely just as good as, the bona-fide
incremental mutation of a loaded grammar, which is much harder.

\[post-SIG note\] **Glenn**: Expanding on this last point, they are not
entirely indistinguishable insofar as the latter necessarily exposes the
side-effect of identifying the precise extent of each incremental
change, which is useful for the purposes of fine-grained version control
and efficient "undo/redo" operations.

Last update: 2016-06-21 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/StanfordMetagrammar/_edit)]{% endraw %}