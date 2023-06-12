{% raw %}Discussion moderated by SanghounSong, scribed by
MichaelGoodman

Apologies for the many ..., where the scribe's fingers were slower than
the speakers' lips.

Sanghoun: ICONS processed by ACE, other processors (LKB, PET, AGREE)

Sanghoun: ICONS can be used for anaphora resolution,

- also reflexives, apposition, non-restrictive relative clauses, etc.
(planned)

Glenn: We need to know what you need for ICONS, otherwise it seems
straightforward as a bag

Woodley: Similar to HCONS

Emily: ICONS are present in TDL, with trigger rules, etc. using them

Ann: Is there any description of ICONS?

Woodley: somewhere

Emily: For a start I can distribute my documentation, which helped
Woodley

Glenn: Are there test parameters?

Emily: We can link them from the Wiki page

Glenn: So there's 5 trivial grammars for testing?

Emily: yes

Stephan: It's a good example of the process for revising formalisms, in
this case MRS. It's very much a collaborative process; Ann and Dan and
others seem excited about ICONS, and Sanghoun formalized it to some
degree, Woodley implemented it, etc.. I don't see anything wrong with
this process.

Ann: It's easier to add code when you know how it is supposed to behave.
I'm glad someone else has done the experimentation.

Stephan: Now we need volunteers to test them.

Woodley: We think we know the right thing to do for generation with
ICONS

Glenn: This is like the issue discussed the other day; MRS as a logic
used within our group

Ann: Well no, ICONS is not something that is interpretable in the MRS
logic, so I would expect no effects at all in things like Utool, and if
you're converting to a first-order representation, etc., then the ICONS
will just be lost

Emily: Right, this is a separate layer..

Glenn: So this is neither a description nor formal logic...

Ann: I think you can use the term Meaning Representation, now we just
need an S

others: System, Simple, Stuff

Ann: If the ICONS constraints about anaphora, etc. then you can't create
an MRS that will scope in the desired way, so you can think of it as
going toward discourse representation. Somewhere there is a proposed DTD
of MRS including ICONS (Ed: perhaps [SofiaMrsRfc](https://delph-in.github.io/docs/summits/SofiaMrsRfc) ?), but
the differences are things like the identification of structure, or
sentence structures... Once you're thinking about anaphora across
sentences you need a way to identify those sentences..

Woodley:...

Dan: Appostion...

Ann: Well there is now some problem with the appos\_rel, ... you can't
equate those things and get a scope out...

Dan: Can I get a hypernormally connected graph from Utool?

Stephan: Bec, do you remember the rule?

Glenn: he's suggesting we make this more accessible to lay people

Dan: Perhaps we should take this offline

Ann: I don't remember the issue with appos..

Stephan: If UW is pushing ICONS in wider use in DELPH-IN, it may lead to
other analyses of info struct, so a formal proposal is needed. I asked
Emily in the Spring, do ICONS affect truth conditions, do they affect
scope... personally I would like to see more of the proposed
formalization and implementation documented on a wiki page.

Woodley: For info struct, they don't affect truth conditions, maybe
scope

Stephan: Once you have a wiki page, I'll follow up with my questions

David: It would be interesting to know the types of individuals that can
be related... i.e. what's the set of indivs that can be related with an
MRS versus those with ICONS

Ann: The issue is with entities that can be events or instances ('i';
"individual").. The relationships we're talking about are those that
don't arise naturally from what we call semantics... they have something
to do with linguistic structure, but they're not in what we
traditionally call compositional semantics. We need a way to process
them, dealing with various labels they can take, etc.. as a convenience
rather than a formal interpretation

* * *

As requested, here is a start of a wiki page on [IconsSpecs](https://delph-in.github.io/docs/tools/IconsSpecs)
--Emily

Last update: 2013-08-01 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SaarlandIcons/_edit)]{% endraw %}