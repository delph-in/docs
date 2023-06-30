{% raw %}Intro (Mike) - more details on slides; spotty notes here:

Developer-minded specifications - there's already a nice document on the
theory. Point is aid to implementation, not discussing theory.

Lots of applications work with MRS. Would be nice to have an external
specification rather than source code for those who are implementing
something new and want to make sure that it's correct.

Mike started [MrsRfc](https://delph-in.github.io/docs/tools/MrsRFC) page after the last summit; thanks Rebecca
and Stephan for doing most of the work.

Request for comments =&gt; please edit the wiki page if you see errors.

Conceptual parts of an MRS, and then proposed serialization formats.

Discussion

Ann: I want to make a historical point that for DeepThought we made the
decision that the xml format would be the standard specification. So
there is a specification of what an MRS, RMRS, DMRS is in formal xml. In
some sense that's what I'm working from. Dunno about the rest of you.

Mike: Displays DTD lingo/lkb/src/mrs/mrs.dtd. Should we base the others
off of this?

Ann: If people agree.

Bec: One thing that came up is differences in when case is relevant for
capitalization and when it isn't. CARG is case sensitive. RFC page has
that info, but that's the only place that it is listed. Woodley pointed
out that the RFC doesn't give rigorous specification about where
whitespace is allowed. Important for implementation, particularly
important when using symbols/strings to mean the same thing. Is white
space significant here, is it allowed here, does it delimit fields? What
I've got up there ([MrsRfc](https://delph-in.github.io/docs/tools/MrsRFC)) was reversed engineered, with some
feedback from Woodley and oe. Case sensitivity and space sensitivity,
while not very important bits of MRS, are necessary for the comparison
of MRS.

Ann: White space is never going to be significant apart form inside
something delimited by quotes, if we're going by the xml specification.

Bec: How you know when there's a span on the pred name. Can you get a
space in there?

Ann: That's nothing to do with me; that's an addition. That's not part
of the predicate name in the xml.

oe: I'll take ownership of that. As was suggested yesterday, I may have
memory issues. We have at times said there are two exchange formats that
we care about for MRSs: XML (aka MRX) and simple MRS. LOGON and \[incr
tsdb()\] are big on the simple MRS format, because it balances human
readability, computer parsability, and size. I'm more prepared to put
effort there. Ann is more prepared to put effort into the XML format, I
believe. So all is good.

Ann: I don't have any problems supporting the simple format, understand
why it's there. It works in the LKB. From my perspective, questions
about whitespace is a secondary discussion, since the XML says these
things are different fields, not part of the predicate name. What's
going on here is a way of packing something which is really a separate
field into a single token from the perspective of the syntax.

Bec: Case?

Ann: XML strings are case sensitive.

Bec: What are predicate names? XML strings or not?

Ann: I'd be prepared to decide that were going to say that those things
aren't case sensitive. I think CDATA is officially case sensitivity.
There's a whole load of things there that are CDATA, and some of those
are things we don't want to be case sensitive.

Oe: We should maybe separate the abstract syntax and the serialization.
XML is closer to the abstract syntax (as a serialization format). It's
also about 10x bigger when writing it out; that's my main reservation.
(And less human-readable.) Simple MRS format has an attractive balance
of parsability and readability. Have to resign ourselves to overlaying
any concrete syntax with conventions of interpretation. Not sure there's
a way of saying these strings are not case sensitive in XML?

Ann: No, that's true. CDATA is for when you don't want to enumerate all
those possible values. Do separate gpred and real pred.

Bec: Is that another one we need to agree on?

Oe: In the simple MRS the preds are not decomposed as they are in the
XML, there are conventions: predicates starting with an initial
underscore are 'real' predicates, where there are strict rules for the
use of additional underscores; other predicates (first character is not
an underscore) are free-format 'grammar' predicates. The conventions are
probably written down in various places in the wiki, need to gather
together.

Woodley: What about single quote preds? Exist in at least recent copies
of matrix.tdl.

Oe: Strings in MRSs can be not quoted or double quoted. Not sure we ever
had single open quote in simple MRS.

Dan: Example?

Woodley: 'null\_coord\_rel

Oe: That's a question about TDL strictly speaking. Should be the same as
double quotes.

Ann: Tried to get rid of the single quote syntax because it was
confusing (suggesting different name spaces where there aren't any). Was
there in TDL from PAGE as a way of avoiding too much typing. Single
quote stuff is up-cased, double quotes preserve case. Got rid of it in
the ERG.

Oe: Recommend to all TDL authors, avoid single quote string
representation.

Dan: Why not make it part of the software. Put a warning message when
you see it. So we don't have to put a sticky note on our screens.

Mike: RELS is supposed to be a bag, but some representations are
treating them as lists. Can we enforce that when things are bags we
treat them as such?

Ann: Treat as a list when you can put a canonical order on them.
Comparison relations requires a canonical order, puts them in a list.

Mike: If load MRSs from two different applications into comparison
algorithm would be treated equivalently?

Ann: Whatever canonical ordering is chosen should be irrelevant. So if
it turns out that things coming in from different sources behave
differently, that's a bug.

Mike: If it's more efficient to treat them as a list, if you have some
reproducible way to order them, then that's fine. Don't want to read
things in and treat as a list as it is in the text, that's bad.

Ann: Reason for treating them as lists is for human readability.
Preserve the original order for presentation, but not semantically
relevant.

Mike: Same for HCONS lists and everything else.

Ann: A more interesting question is the variable naming, which should
also be irrelevant, and can be a bit of a pain.

Mike: Is that the case in the LKB?

Ann: Um, probably.

Mike: I just look at them as a graph and don't check variable names.

Oe: Current MRS compatibility testing that the generator uses doesn't
read anything into the order the bag or the names of the variables.

Yi: Same with C++ MRS library.

Ann: Always should have been the case that variable names are irrelevant
for comparison. One or two cases where new variables are created that
shouldn't come up, e.g., add 1000 --- could mess up that code by
choosing perverse variable names but I hope people won't.

Oe: ICONS. How close are we to being able to declare the abstract
syntax?

Bec: Like HCONS.

Ann: I see we have HIGH and LOW, but that's nothing to do with what's in
the grammar. But you need a mapping from what you have in the grammar to
that. They're always binary. We need a notion of distinguishing the two
variables, don't care what attribute name we use. Need an enumeration of
the possible relations; equivalent of hreln.

Dan: And that will slowly grow.

Ann/Dan: But we're okay so long as there is a specific list at any point
in time.

Bec: So far the two end points are always variables?

Dan: Events of referential indices, not handles.

Oe: The DTD is currently not making that distinction.

Ann: That's something we might want to update. E.g., in HCONS only
handles. My code has hard-wired constraints about that stuff. Would be
nice to tighten the specification about that. It seems that the
info-structure things will always be between two non-handle variables,
at least one of which is an event. And it's possible that for anaphora
resolution there may never be events involved, but not sure yet. It's a
question of what you do with cases between sentences that you might want
to try and resolve to an event.

Dan: Ex: We crashed our car Monday, it was the first disaster of a long,
ugly week.

Woodley: Just individuals?

Bec: What about underspecified modifier attachment?

Dan: Yes, also just individuals.

Ann: Something that needs to be added to the spec is the
underspecification relation between these.

Woodley: Why separate HCONS and ICONS?

Ann: Backwards compatibility, and different statuses in the theory.
HCONS are constraints on the possible logical forms. ICONS I really want
to talk about as additions to the logical form. I would tend to want to
the LF with some extra equalities to represent the ICONS.

Oe: If we're going to update and make type distinctions on variables
more explicit, there's the difficult case of *p* type variables ---
underspecification between *h* and *i* (non-event). That could pose
challenges.

Ann: What did we agree at Hankø?

Oe: Can be part of the description of an MRS but not an MRS.

Ann: Do we end up with *p*s in the output? What we're talking about here
is the output format --- output of conversion format from what the
grammar thinks of as an MRS, and what the MRS is. Do we see *p* there?

Bec: We do see *u*, could it be *p*?

Oe: Possible that an infinitival phrase has its ARG1 as *p*?

Dan: Maybe. We see a lot of these *p*s in the SEM-I, where we only say
what we know.

Bec: So if it's unrealized?

Dan: If it's unrealized, it's not a handle, can't have unfilled holes.
In the non-act of not filling it, you've resolved it to *x*. Not sure it
makes sense to have *p* in the interchange format.

Francis: What about cases where we're checking for subsumption. Would we
have a non-fully specified MRS? E.g., as the output of a transfer rule?

Ann: yes.

Oe: Formally, in an MRS a handle and a non-handle can never be in the
same position.

Last update: 2022-09-14 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/SofiaMrsRfc/_edit)]{% endraw %}