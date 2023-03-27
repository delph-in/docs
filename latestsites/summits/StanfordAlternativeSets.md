{% raw %}Alternative Sets / Focus Sensitive Operators Discussion at [Stanford
Summit](https://delph-in.github.io/docs/summits/StanfordSchedule)

Scribe: Emily

Martin: I think I can say *Kim ONLY runs in the park* meaning "only Kim
runs in the park"

Kristen: Kim only as ellipsis for Kim and only Kim?

Alex: I'm pretty sure I could construct a context in which the prosodic
emphasis would be on Kim and it would mean only Kim runs int he park. If
you've been contrasting the habits of two different people and you've
claimed of both of them that they only run int he park. Then *KIM only
runs in park…*

Emily: But that isn't the reading we're looking for -- yes Kim is
focused there, but the associate for only is still something inside
*runs in the park*.

Alex: I don't think identifying the alternative sets is a matter of
grammar at all. But there is a relative alternative set which only can
bind.

Emily: Are you saying the alternative set is not

Alex: The content over which only scopes guides you towards relevant v.
irrelevant alternative sets.

Emily: But do we have what we need in MRS? *The kids only ate the cake.*

Alex: That's easy just ARG1.

Kristen: *The cake was only eaten by the kids.*

Emily: Doesn't mean the kids ate nothing but cake.

Alex: Oh.

Antske: [ParGram](/ParGram) derive semantics from f-structure but go
back to c-structure for scope. May be worthwhile to ask them.

Berthold: How far down can you go? Is it just c-command, or is there
some bound?

Guy: Kim only said that she runs in the PARK.

Woodley: With intonation you can get down as far as you want into a sub
clause.

Alex: Intonation is an aspect of form not modeled in vanilla DELPH-IN
grammars & very important here. We had to do it as well for gesture, but
without any semantics assigned to the intonation. It's well known that
these things interact. Right now you're not modeling intonation in the
syntax and therefore don't model its semantic effects---including on the
alternative sets.

Glenn: Information structural effects, right?

Alex: It does change information structure.

Glenn: The question here would be whether the effects can be said to be
limited to info str.

Dan: It seems to me that there's a paucity of data. from what we've seen
so far. If in 1000 sentences it's always the syntactic subject's index
which is excluded from the scope of the focus element only, then we
already have something very near to what we want in the semantic
representation -- XARG. We don't in our standard MRS export out of the
feature structures preserve that piece of information, but that's a
design decision. Maybe this is evidence that information we know we need
in the composition stage needs to be maintained statically. It isn't
that we need to go hunting around in the syntax, if we already have it
as XARG.

Alex: What would happen with that structure if the verb was *promise* --
*Kim promised John only to go to the store.*

Woodley: If the only is inside an embedded clause, it blocks the subject
of that embedded clause. *Kim thought that John only went to the store.*
John is not visible as the XARG in the eventual MRS.

Guy: What about ICONS?

Emily: That's the path we were going down.

Guy: *In the park, Kim only runs.* Doesn't mean the running is only in
the park. If we have some sort of information-structural mark on what's
been fronted.

Woodley: What is the information structure associated with embedded
subjects?

Dan: Sanghoun connects something to them, too.

Alex: I can't help feeling you'd end up doing huge damage to the grammar
-- heading the way CCG goes when Mark Steedman worries about theme and
theme. It looks nothing like the grammar they've used for WSJ text. His
Language paper has the whole thing in bits with a million lamba
abstracts. This is L+H\* means I say you've made this common ground,
etc. The lexical placement of where the focal elements are .. the whole
semantics is really very sensitive to that.

Dan: Following on Sanghoun's dissertation, there's a place now to record
those constraints on pairs of individuals. If we do that, is that a rich
enough repository to put those in?

Alex: I think even Guy's ex can be dealt with that way. Then doing
topicalization like that will have semantic effects. You need that for
Greek.

Emily: What worries me is that that means we need different kinds of
focus.

Alex: That's what Vallduví would say.

Berthold: SUBJ and SLASH exempt … Is it open valency or pseudo-valency?

Dan: I don't think it's SLASH. I don't treat scopal modifiers as
extracted, but they'll show the same behavior as initial.

Berthold: So it's something you can't locally detect at the attachment
site.

Emily: Not trying to do it in the grammar, as Alex says, that's
hopeless. Just hoping that the MRS (incl ICONS) will be enough info for
that process.

David: So we're saying things that are topicalized (left) plus subject
(left) aren't accessible, plus some phonology that's someone else's job.
I think we just want to say the subject is ruled out --- it gets some
type that is incompatible with what *only* is doing.

Glenn: \[Lists kinds of focus\]

David: Rabbit hole! Sanghoun only distinguishes topic/focus(and
contrast) but we probably need more.

Woodley: I think we need to be careful of reaching the nearest hammer.

Guy: I thought we were just trying to figure out what to rule out.

David: Subject, topic, higher clauses.

Woodley: *John probably only slept.* But you already capture this with
the way the scope works in the grammar. (cf. *John only probably
slept.*)

David: Can you give an example of something to the right that it can't
scope over?

Emily: *The kids who only ate cake played frisbee.* … but that's not the
same clause.

David: It sounds like you want some hierarchy of types of focus, and to
figure out how to encode those (and only those) in the ICONS.

Last update: 2016-06-17 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/StanfordAlternativeSets/_edit)]{% endraw %}