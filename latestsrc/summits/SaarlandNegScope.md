{% raw %}## Notes from discussion of the \*SEM shared task on scope of negation.

Moderator: oe Present: oe, Emily, Bec, Guy, Woodley, Glenn, Rui, Joshua,
Sanghoun Scribe: Emily

* * *

oe: etc etc etc \[Oslo participated with a non-semantic system.\]

Woodley: Forsooth!

oe: Oslo discussion: seems like it would be helpful to have the semantic
analyses from the ERG, what would it take to do that?

oe: The annotation allows substrings and mwe cues, as well as
discontinuous, nested and overlapping scope.

Woodley: Isn't that a clue that the scope trees might not have been the
right way to go?

oe: Oslo discussion: came around to the idea of using the resolved
scopes (being surprised), and then worked on heuristics for choosing
among the resolved scopes.

Emily: Then Woodley tried working out the heuristics and came to the
conclusion (and convinced me) that the fully scoped versions are not
useful.

Woodley: The main thing you're doing by picking among the scoped
representations is picking which of the quantifiers are in v. out of
scope of the negators, not much else. The thing the annotators were
doing were basically taking all arguments and modifiers of the negated
events. That is a semantic thing but it doesn't play well with brining
quantifiers inside the scope of negation logically because of the
constraint that every variable has to be bound. VP coordination --- all
predicates involving some

    {Kim} arrived and <didn't> {sing}

… want *Kim* inside the scope of negation in order to get that, but that
brings *arrive* inside the scope of negation as well.

Emily: But if we don't bother with the fully scoped version and crawl
the MRS graph we can get something useful.

Woodley: Genau. Once we don't try to pretend that the ERG's notion of
scope and the annotator's are the same, then there are lots of
interesting things to do.

Only one fully scoped reading for *Kim arrived and didn't sing.*: and
**neg** is inside **proper\_q**.

Woodley \[channeling Dan\]: The annotators notion of scope was totally
rubbish and should be discarded. But in terms of the idea that we want
to move the quantifier scopes around to bring the NPs inside the logical
scope of negation even in the case of examples without coordination:
**The cloud is not fluffy**: not refuting the existence of a cloud. We
have both of those readings, but one is much more sensible.

Woodley: If I were talking to someone uncooperative (glance at Bec) and
refuting all along the notion of there being a chair and my interlocutor
said *The chair is fluffy*, I could say *NOT the chair is fluffy.*

oe: Two approaches to take: trying to win the competition retroactively
and trying to do a comparative analysis of notions of semantics.

Emily: One more: exploring whether a semantic dependencies based system
has complementary strengths to the existing syntax-based winning system,
through error analysis.

Woodley: In order to do that error analysis, you first have to try to
win retroactively.

oe: I actually hold this data set in high regard as a shared task data
set --- someone has tried to do something deep and done so carefully. As
have we, so the chances of complementarity are maybe high.

Emily: One thing we haven't talked about is the transfer rules idea to
bring in the harder cases including without and the morphological
negation.

oe: Two ways to go: talking about the crawling around the MRSs, and
talking about expected exceptions (transfer rules).

\[discussion of terms to use for connected bit of the MRS corresponding
to the scope unit.\]

oe: How do we walk/crawl the MRS to find the scope unit.

Woodley: Start with the neg rel, and walk down the argument links.

oe: Suggesting making minimal examples of the phenomena we will
encounter:

    {it} <didn't> {rain} ;; one argument to the neg rel, and that's all there is; a short crawl 
    {the fierce dog} <didn't> {arrive} ;; follow argument to the neg rel, then walk its arguments

so far walking the semantic dependencies and grab everything that is
reachable: reachable: ARGs and shared labels --- maybe inverse
arguments. (crawling arguments v. crawling functors)

*The probably blue dog didn't bark.*

… Dan is hanging the handles in a helpful way, so we still don't need
functor crawling.

Emily: So far it looks like argument crawling and label sharing is
enough …

Bec: … to find the \*EP\*s.

*Kim arrived and didn't sing.*

Emily/oe: How do we get the quantifiers? Need functor crawling?

Woodley: when we crawl ARG1-3, look for all things that take those
variables as ARG0 (in the case where they are variables). That gets the
noun-y rels and the quantifiers.

Emily/oe: Looks like coordination is not causing problems for the
crawling method.

Woodley: One we were getting wrong before, but maybe because of the
wrong parse was **It may be that you are not yourself luminous**

… surely enough there isn't the parse that we want.

Woodley: Another one: *You will observe that he could not have been on
the staff of the hospital.* PP attachment mistake?

Emily: with *of*?

oe: Investigating --- don't see one where *of* attaches high.

Woodley: Current implementation probably isn't following the shared
labels, and it should be.

oe: Next case:

    {Kim} promised Sandy {to} <not> {sing}

Emily: not -&gt; sing -&gt; Kim, but Kim's label isn't shared with
promise and Sandy isn't an argument of sing, so no problems. (But if we
drop pronoun\_q and have pron\_n share its label with the verb…)

Next case:

    <No> {chair arrived in Berlin}

oe: Now we functor crawl: look for all EPs that take the BV of the no\_q
as an argument.

Woodley: Situations where multiple EPs take the same x are coordination
and relative clauses.

Emily: And control.

oe: **13108** *at no great distance* --- only scopes over the NP inside
the PP, and nothing higher (not even the P). So here the functor
crawling strategy needs more refinement.

Guy: Proposes the strong hypothesis that there might be some formally
well-defined substructure of the MRS that corresponds to what the
annotators were doing.

Maybe problematic:

    {There were certainly} <no> {chairs}.

Functor crawl out of the quantifier, but don't functor crawl out of the
verb, and so we don't get to **certain\_a**.

oe: Maybe even a surprising alignment between our emerging approach and
what the annotators did.

Sanghoun: What about double negation?

oe/bec/rui: I think they'd do:

    {{i} can} <not> {do <no>{thing}}

oe: 13108 is the only example so far that's causing problems.

various: Maybe it's enough to say that we only functor crawl out to
certain types of EPs (e.g., with preds matching **\_v\_rel**).

Woodley: Generally seems to work pretty well --- can find further funny
cases by implementing these refinements.

bec: Did you do an ep-to-string thing?

Woodley: Yes … opens laptop

Last update: 2013-08-02 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SaarlandNegScope/_edit)]{% endraw %}