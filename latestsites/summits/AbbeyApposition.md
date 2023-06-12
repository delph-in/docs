{% raw %}# Discussion of Apposition, Non-Restrictive Relatives, etc

Location: the Abbey in Bellingham, WA

Date: August 21, 2013

Present: Dan, Woodley, Emily

## Conclusions

### Appositives and non-restrictive relatives should both have clausal representations

Rather than treating NRRs as paraphrasable as appositives as in (1),
treat appositives as paraphrasable as NRRs, as in (2):

    (1) a. My cousin, who is a doctor, arrived.
        b. My cousin, an entity who is a doctor, arrived.
    
    (2) a. My cousin, the doctor, arrived.
        b. My cousin, who is a doctor, arrived.

### Appositives and NRRs are scope islands

The quantifiers inside of appositives and NRRs seem to be completely
free of scope interactions with those in the main clauses they are
embedded in.

Examples:

    Your dog chased some cat, which every child teased.
    Some dog chased some cat, which every child teased.
    My cat, the one every dog chased, climbed a tree.

Note, however, that there is some interaction between existentials in
appositives/NRRs and universal quantifiers outside. This seemed akin to
donkey anaphora, and we thought that maybe the coref link on ICONS could
help.

    Every dog chased some cat, a long tailed persian.
    Three dogs chased some cat, a long tailed persian.

### Proposal: conjunctive GTOPs (camper vans)

The tentative proposal was to have all NRRs and appositives share the
GTOP of the main sentence, such that there is one structure with as many
substructures as needed. This proposal is tentative not least because we
felt it would probably require modifications to scoping machinery and
the interpretation of MRS.

<img src="http://faculty.washington.edu/ebender/photos/camper.jpg" title="http://faculty.washington.edu/ebender/photos/camper.jpg" class="external_image" alt="http://faculty.washington.edu/ebender/photos/camper.jpg" />


## Notes

\[Not a transcript, more or less chronological. Mostly examples.
Judgments don't reflect consensus.\]

**Q: Scope of quantifiers in second NP in appositives --- do they get
the full freedom usually attributed to quantifiers?**

    Most cats, many of them with no tails, have good balance.
    Most cats have good balance, many of them with no tails.

=&gt; Not appositive

    My brother, no rocket scientist, could still figure it out.
    *My brother could still figure it out, no rocket scientist.
    
    No rocket scientist, my brother (*,) could still figure it out.

=&gt; In that order, not apposition

    ??My students, most CLMSers, take 566.
    Most CLMSers, my students, take 566.
    
    Most CLMSers, my best students, do well on the exam.

=&gt; apposition.

    *My best students, most CLMSers, do well on the exam.
    My best students, most of them CLMSers, do well on the exam.

=&gt; Second ex not apposition.

**Hypothesis: interesting quantifiers don't appear in appositive NPs.**

    My friends across the street, some weird Republicans, still voted for Clinton.
    
    Every dog chased some cat.
    Every dog chased some cat, a long-tailed tabby.

Does tabby go with cat everywhere?

What goes in the BODY of the quantifier of 'a'?

**Proposal: BODY of quantifier from head NP is identified with the LBL
of the quantifier in the modifier NP.**

=&gt; Might also make these work for DMRS and EDS, without further work.
\[NB: This was rejected below.\]

Should we worry about putting the head NP outside the modifier one? Try
to construct examples with universal & existential to see if we can find
cases to worry about, and more or less fail.

    Every dog, a long tailed labrador, chased some cat.
    Every dog in this room, a long tailed labrador, chased some cat.
    Every book on the shelf, a novel by Elmor Leonard, was fascinating.
    Every single dog in this room, a labrador that was carefully trained by its master and manicured within an inch of its life, cheerfully cased cats around the table.
    Almost every dog in the room, a labrador, chased some cat.
    Three dogs, a labrador, arrived.
    Each dog in the room, a labrador, barked.
    Each professor, a renowned scholar in his or her field, took a turn at the podium.
    Every single professor, a renowned scholar in his or her field, took a turn at the podium.
    ?Every professor, renowned scholars in their field, took a turn at the podium.
    ?Each professor, renowned scholars in their field, took a turn at the podium.
    A renowned scholar in his or her field, every single professor(*,) took a turn at the podium.
    The distinguished scholars in the room, every professor(*,) took a turn at the podium.
    ?The distinguished scholars in the room, every professor who had had tenure for more than 15 years AND was still regularly attending the tea breaks, took a turn at the podium.
    ?The distinguished scholars in the room, each professor who had had tenure for more than 15 years AND was still regularly attending the tea breaks, took a turn at the podium.

What's the difference between an appositive and a parenthetical? Not
that clear. Something in intonation, probably.

=&gt; Cheap scope solution seems like it might be a good first pass, and
worry about the relative order of the two quantified expressions if and
when more convincing data comes up.

If we go with the same analysis of non-restrictive relatives, what
happens there?

    Every dog chased some cat, which every child teased.
    Your dog chased some cat, which every child teased.

=&gt; Can have more than one cat? If not, then what's keeping that
quantifier low? The main clause says there's only one cat, so how do we
keep the universal quantifier from scoping higher and giving?

    Your dog chased some cat which every child teased.

=&gt; one dog, possibly many cats.

    Some dog chased some cat which every child teased.

=&gt; potentially multiple dogs and cats

    Some dog chased some cat, which every child teased.
    Some dog chased some cat, which every child teased.

=&gt; The non-restrictive relative doesn't seem to be enough to generate
multiple dogs & cats.

Should be paraphrases:

    Some dog chased some cat, which every child teased.
    Some dog chased some cat, a cat which every child teased.
    
    \exist(d) : \exist(f) : \every(k) chase(d,f) tease(k,f)
    \exist(f) : \every(k) : \every(d) chased(d,f) tease(k,f)

- =&gt; Lots of dogs, one for each kid. Not a reading of this
sentence.

… which every kid teased. Only candidate body values are labels from
within the non-restrictive relative.

    Some cat which every dog chased climbed a tree.

=&gt; Restrictive relative clause case: Could have one cat, or many.

Strawman? Two separate coordinated clauses, with equated GTOPs:

    (\exist(f) … \exist(d)) and (\every(k) …)
    
    My cat, the one every dog chased, climbed a tree.
    My cat, which every dog chased, climbed a tree.
    My cat, an entity which every dog chased, climbed a tree.

=&gt; Fairly clear intuition that there's only one cat involved.

=&gt; Need to say something further or other than just the LBL of the
quantifier of the second NP is the BODY of the first one. Maybe better
not to make a single scope tree. Maybe better to have two separate
pieces of semantics that don't interact. Convenient that no variables
inside the modifier NP or non-restrictive relative.

Aside:

Non-restrictive relatives seem to be used to introduce new information
(not in the common ground), where the "the one which" apposition
construction doesn't because of the. So:

    My cat, a poor unfortunate creature which was chased by a raccoon yesterday, needed attention.

So that paraphrase isn't perfect. Maybe: "an entity which" instead of
"the one which".

    I believe that your brother, a doctor in Paris, is crazy.

=&gt; "your brother is a doctor in Paris" is in the common ground.

    I believe that your pet, a unicorn that lives in the meadow next door, is invisible.

=&gt; has the speaker asserted the existence of a unicorn? If so,
another even gooder argument for GTOP.

Then the problem is that there's a NP fragment. Stand-along NP fragments
get hallucinated unkonwn\_rel, to let the fragments scope. What's the
relevant thing for appositives? exists?

Paraphrase the other direction:

    My brother, a doctor, sleeps.
    My brother, who is a doctor, sleeps.

=&gt; Semantics of both appositives and non-restrictive relatives is
clausal, so can do the GTOP thing.

Still need the ICONS constraint? Yes because be\_v\_id is only inside
the appositive (linking the hallucinated who to the appositive NP).
ICONS link serves to give the link between the two clauses.

Can't use conj\_rel instead of GTOP-ing because won't know what the
other conjunct is and also that wouldn't trap the quantifiers.

Problem: need to then tree GTOP as both a hole and something conjoined
with something. Might require changes to scope machinery? Or MRS
processing machinery might need to be told what to do with an ICONS
coref link. Know that there's a quantifier for which this coref guy is
the ARG0 and then do something about that quantifier. LTOP of the
embedded clause still has to link to the GTOP. Add another HCONS
constraint? Need more than that to actually trap the quantifiers. Ask
Ann …

    Every dog chased some cat, a long tailed persian.

=&gt; Interaction. As many persians as there are cats. Maybe not one we
need to capture with quantifier scope. coref helps? Is this like donkey
anaphora?

    Every dog chased some cat, the long tailed persian.

=&gt; Pinned it down to just one cat, back through the coref link.

<img src="http://faculty.washington.edu/ebender/photos/everydog.jpg" title="http://faculty.washington.edu/ebender/photos/everydog.jpg" class="external_image" alt="http://faculty.washington.edu/ebender/photos/everydog.jpg" />


Later, at the Woods Cafe:

    My brother, no great seaman, went out on the sailboat anyway.
    My brother, who is no great seaman, went out on the sailboat anyway.

=&gt; Intuition that appositives with *no* are really negated
predictaives fits in with NRR paraphrase idea

**Proposal: Parentheticals also do the GTOP thing.**

Last update: 2013-08-23 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/AbbeyApposition/_edit)]{% endraw %}