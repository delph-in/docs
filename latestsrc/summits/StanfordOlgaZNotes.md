{% raw %}(notes are roughly done)

# Morphology and Big Parse Charts in LKB/ACE

Context: trying to induce the morphological component of a precision
grammar from IGT

Olga's output is choices files for Grammar Matrix Customization System.
Modifying/Improving MOM (David Wax's system).

Q/A ===

Joshua: Chintang causes this problem because it is high-quality data.

Woodley: Re whether DELPH-IN tools were designed to handle this problem.
Design hypothesis that doing morphological analysis should be
computationally simple wrt the Unification stuff that happens later. So
ACE tries to enumerate an entire list before trying to process it. I
haven't completely looked into this problem. If it's the case that many
of these edges could be discarded/wouldn't survive unification, this
algorithm could be improved to throw away many spurious edges.

Berthold: Clarification to Woodley, ... \[ scribe error \] ... there's
room to scale better. As we get into more morphologically complex
languages, this sort of problem is cropping up more and more. The charts
are fuller than they really should be.

Woodley: it would be good to collect these examples.

Oe: the charts might be fuller than you would like, but they actually
might be needed.

Dan: Re the Chintang grammar: how did we get to 54 pos classes from the
initial 13 or so

Emily: I took the 13 or so and allowed them to apply three times and got
to 54.

Woodley: 13\*3 = 54?!

Emily: not all of them are allowed to iterate, and not all things
treated as one position class in a prose grammar come out that way in an
implemented grammar

Woodley: is this due to an issue with how Grammar Matrix does morphology
or is this a formalism problem?

Emily: this is Grammar Matrix constraint

Woodley: does anyone else have morphology that cycles?

Francis: on purpose?

Dan: \[scribe error\]

Emily: there are two parts to this, one is from matrix morphology system
which may be wrong, the other is from the algorithms from MOM, where we
look at empirically observed combinations and posit reductions in that
space, but the space is large.

Woodley: tdl morphology is similar to FSA

Oe: a relatively naive implemntation

Guy: Could we extend the matrix morphology to allow this sort of thing?

Emily: Yes, it could be done in principle, but there's some checks for
cycles deep in the code.

Guy: Perhaps this is more common in derivational morphology...

Woodley: The code that automatically figures out position classes, does
it need to prevent cycles? Perhaps you can turn that off and allow a
smaller graph that does have cycles.

Olga: I could turn that off.

Olga: One thing I could try is to allow a large number of position
classes and then look for ways to reduce that space (by hand).

Woodley: Have you tried to turn things off and have the smaller graph
with cycles? You couldn't use GMCS to build a TDL grammar but ...

Olga: Not exactly.

Woodley: If you did that and your cyclic graph looked like what the
morhpologists describe, that would be a nice validation of your work.

Oe: Lunch time!

Last update: 2016-06-17 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/StanfordOlgaZNotes/_edit)]{% endraw %}