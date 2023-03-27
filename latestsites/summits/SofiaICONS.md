{% raw %}Discussion on ICONS:

Dan: MRS with ICONS in it looks like what we wanted when removing
messages in LOGON and wanted to record topic and focus. After the
elimination of messages (which were kinda convenient for this purpose),
these ended up in the ERG using EPs in RELS (focus\_d\_rel and
parg\_d\_rel). Had been thinking they should be in CONTEXT somehow. But
seems nice that they should be part of ICONS information, i.e., part of
MRS. Generation? Are you heading in the direction of a specification
that could be handed off to implementors of generator code (Ann,
Woodley, Glenn).

Ann: They did send a grammar with some specs.

Oe: Does seem like a good approach to what we used to do with message.
Why is there always an ICONS for each element? That seems verbose. Do we
need to put those null statements in? The ICONS that are just
info-struct? Relatedly, in the dependency graphs, there are some that
are not binary relations. What's the clause and target -- a cycle?

Sanghoun: Yes, a cycle.

Ann: Event is the focus of an event?

Emily: We're using the ARG0 of the verb to stand in for the clause.
Regarding the bland "clutter" ones (info-str) -- they're there because
of the way we're currently doing the composition.

Dan: But that seems like a work in progress, and not a gold standard
target representation.

Ann: Delete them at some point?

Dan: Presumably the other way to do it involves having something add the
ICONS constraint constructionally. Passive LR and topicalization
filler-head rule put in the constraints. Other languages maybe have a
more pervasive marking such that you're stuck doing it in the lexicon,
but I wouldn't want to start with that.

Oe: You're bound to run into the same boundary/borderline cases that
precipitated the demise of the message rels.

Ann: It was more serious with it being in the RELS list.

Oe: If we're talking about generation and inputs to the generator, then
we need to be precise about what we mean by compatibility between
candidate generation outputs and inputs.

Ann: True, but it seems that we have a difference in kind between what's
here and what's on the relations. Move to \_d\_rel allows us to ignore
them and that's sort of a halfway house. Crucially we're not going to
allow ourselves an inventory of an indefinitely large number of
relations here, just a limited number cross-linguistically.

Emily: Yes.

Ann: While in the grammar you keep on adding types, if this becomes a
relation in ICONS as part of the specification of MRS, this has to be
sort of fixed (like qeqs, leqs) because they behave differently in terms
of the code.

Oe: Does it also make sense to fix the names of the features, e.g. LEFT
and RIGHT (since they are just binary relations).

Dan: CLAUSE/TARGET is a throw-back to BARKER etc. Suggest ARG1/ARG2, and
that the features should be the same across different ICONS types
(anaphora, etc.).

Lars: Gert Webelhuth looked into this at some point. Cross-clausal
referential dependencies are different from intra-clausal kind
(anaphora). Constraints about topicality come out in discourse, where
you have at least two clauses. Maybe it is wise to study constructed
actual discourse. How much do you need before something is infelicitous?

Emily: We are trying to model the discourse constraints on a particular
sentence based on its form, but we haven't said anything about how to
compute infelicity in context based on this information.

Dan: That suggests that the sentence-sentence linkages might require a
richer inventory of constraints, if we're going to do that all in ICONS.

Ann: You would expect that info-str constraints would also inform
cross-sentential anaphora links. Also: the anaphora resolution is
related to figuring out whether a sequence is infelicitous --- are we
talking about the same dog in both sentences?

Last update: 2012-07-03 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/SofiaICONS/_edit)]{% endraw %}