{% raw %}Emily: \[introduces terminology topic\]

Ann: Subgraphs are subgraphs.

Emily: But yes, verby and nouny ones

oe: For example, what does proposition refer to? (not v. question)

Ann: Especially now that messages are gone.

Ann: What about clauses with finite verbs as opposed non-finite ones?

Emily: Haven't really felt the need for that one yet, but maybe we'll
get there.

Ann: I think there's a notion of which parts of the subgraph correspond
to which distinguished variable. So predication with event-type ARG0 v.
predication with ref-ind-type ARG0, and a notion of things you can reach
from the ep where those things are the characteristic variables. That
whole group of things is 'eventuality' v. 'referential index'.

Emily: I don't want to use 'index' to refer to a subgraph, do I?

Ann: 'eventuality' v. 'entity'

Emily: Then how does 'eventuality' relate to 'proposition'?

oe: Maybe we could then reserve 'proposition' for 'eventualities'
corresponding to declarative clauses, keeping 'proposition' for contrast
to 'question'.

Ann: Actually difficult to talk about which part of the subgraph
corresponds to the proposition because the quantifiers aren't in.

oe: Because the quantifiers are still floating.

Ann: In some sense the Nbars are coherent units (at least if there
aren't PP or [RelCl](/RelCl) modifiers, because those introduce
quantifiers), and the backbone of the verb phrase is a coherent concept,
but by the time you come to, the quantifiers are connected up, but you
don't know where they go in the semantic structure. DMRS makes it
clearer that this is a mixture of syntax and semantics, because the
quantifiers aren't scoped by they are connected up.

Emily: So you see a clear difference between 'eventuality' and
'proposition' in that the former doesn't require quantifiers.

Ann: We have in the semantics a direct notion of ref-ind and event, so
we can have a derived notion of entity subgraph and eventuality
subgraph. But we don't have any grounding for the notion of proposition.
There is a notion but that only works when you've scoped everything. I
think you have to talk about various subgraphs in terms of saturation.

Emily: This brings me to the question of scopal arguments: Subgraphs
rooted in the EP from *believe*, but also in *bark* and including
*probably* in the *The dog probably barked.*

Ann: I think it would rely on making a distinction between the
characteristic variable associated with *probably* which I don't think
of as a real eventuality and that associated with *bark*, which is. The
char var for *probably* is this weird thing which we're labeling with
'e' because it's definitely not a referential index, but it's unclear
what that thing really refers to. Might say there's some class of real
eventualities, and the only one associated with *probably bark* is
*bark*, and so you're allowed to in the wrong direction.

Woodley: Why do you want to talk about that one?

Dan: Can coordinate them: *probably barked and certainly jumped*

Emily: The question is really would we ever want to talk about this from
the point of view of *bark* rather than from the point of view
*probably*.

oe: recap of scope of negation task and MRS crawler approach.

Emily: Don't necessarily need terms for all these things; MRS crawler
and ESD have different concerns. Happy with 'eventuality' v. 'entity',
but what about 'root'/'head'?

oe: 'root' is a perfectly good graph theoretical term?

Ann: DMRS LTOP uses the same rule as you do for any other scopal
situation to decide which is the thing that LTOP points to. Maybe use
LTOPs? That sort of coincidentally picks out the thing that this the
syntactic head, because that gives you something that's more like
standard dependency structure so it's easier for people to read. That
isn't guaranteed to always produce a unique root, but it does in a lot
of cases.

Emily: Would it confuse things for us to have a similar, but not
necessarily the same definition of root?

Ann: Wouldn't it be the same definition? The way you identify the
canonical node in the DMRS is to find the thing that doesn't have any eq
arcs pointing out of it.

Emily: *quickly bakes the cake*

Ann: bake -&gt; cake is ARG2/neq, not eq.

Dan: What about pronouns, if we don't have quantifiers for the pronouns?

Ann: Then it breaks.

Ann: I'm using graphs for DMRS, and I'm using roots that correspond to
this canonicalized LTOP notion. If you use 'root', it's got to be root
in some notion of subgraph or it doesn't make sense.

Woodley: *The dog whose tail wagged barked.* \_dog\_n\_rel and
\_wag\_v\_rel have the same label, but no argument links between them.

Ann: *barked* identified as the LTOP of the whole structure.

Woodley: But the entity subgraph for \_dog\_n\_rel, …

Ann: That's one of the cases were things go peculiar. That's right.

Emily: Previously unsolved problem?

Ann: I'm not sure if it's a problem or not; interesting consequence of
the properties of the MRS. But yes, that definition above for
identifying an ep doesn't work.

Emily: *The dog whose tail wagged*: I want the semantic reflection of
the relative clause to be part of that subgraph with dog as the root.
But if we can't operationalize that, that's a separate set of
considerations.

oe: But it would be nice if we could have an operationization that would
give us the right answer.

oe: In EDS I had to solve the same problem. Have a cascade of heuristics
that include the rule you gave Ann. Some also deal with ill-formed MRSs.
Can't check just now, but it would be nice to know which are in the
robustness cases, and which aren't. But: would be nice to write down the
operationalized heuristics that identify the root, and try to come to
agreement on that.

Woodley: quantifier-noun combinations violate the distinguished variable
property.

oe: Nowadays, it's only a problem with labels, and it's the same problem
Emily gave us to start with.

Woodley: It's a dual to the problem that Mike Goodman wants to solve:
start with a set of EPs (but not the distinguished variable) and want to
find which EP is most prominent. It's not clear that such a concept
should be well-defined, at least for arbitrary subgraphs.

oe:I think I've encountered the same problem in EDS-&gt;bilexical
conversion, because there we need to push everything down to invidivudal
words. Whenever there's construction semantics, we can lose it or look
for a way of pushing it down onto individual tokens. I think would be
more productive to do these in terms of actual examples…

Last update: 2014-02-17 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/TheAbbey_Chrysalis2014Terminology/_edit)]{% endraw %}