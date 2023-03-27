{% raw %}Emily & Sanghoun's initial proposal:

In general, the idea is that for any given pair of indices, if there is
an ICONS element in the MRS associated with a realization that
realization is valid iff:

--- There is no ICONS element associated with the same pair of indices
in the input; or --- Any ICONS element associated with the same pair of
indices in the input is compatible in its type with the ICONS element in
the candidate realization.

(I'm not sure as I type this what to do about cases where there are
multiple ICONS elements for the same pair of indices.  As far as
information structure is concerned, we wouldn't expect to have more than
one.  Of course, if we're putting other stuff into ICONS, then there
might be ICONS constraints of different types. All of the above would
then be only applicable to subtypes of info-str.)

Refinement: all the variables in the ICONS should be variables
(?characteristic variables: Emily says no because of pro-drop, esp topic
drop in Chinese) somewhere else in the MRS? Is it ever desirable to say
"this element is a topic, but we don't know of which clause?"/"This
clause has a topic, but I don't know what it is"? Jacy has something
like this just now, just because in that particular construction can't
grab the relevant clause variable. Start with all variables are
somewhere else in the MRS, and then look into that further later.

Bracket the question of whether the \[e2 info-str x1\] even belongs in
the ICONS list from how to handle the ICONS list in generation. More
general is to allow for both possibilities, and not assume that one or
the other will be the final solution.

Absence of specification meaning something (lack of equation of
variables in MRS) vs. underspecification. These two things cannot be
equated in realization. Procedurality? Notion of default?

Do we need a notion of defaults in dealing with ICONS? Notion of
defaults: avoid generating topicalized sentences by taking
underspecified as e.g., non-topic. Could be done via input MRS fix-up
transfer grammar (provided support for ICONS).

Could similarly do default inequalities for the variable thing, but
wouldn't want to implement that. That's the way to get around the
wince/whinge-inducing "procedural" term.

EB's proposal regarding enhancement of current post-generation
compatibility test with notion of ICONS subsumption. Do this generate
and test as the first implementation.

FCB's request for variable-property sharing works differently. Where
does the translation between that special icons subtype and actual
variable property sharing happen in the generation pipeline?

Might be tempting to look at ICONS as parallel to HCONS, but currently
trying to do better than that. HCONS is part of the idiosyncrasy of our
notion of subsumption between MRSs. Cheap scope - equates qeqs to
produce a normal form ordering of the quantifiers all at the top,
equating skolem constants but not the variables. Current standard
post-generation test doesn't see HCONS. Might be dependent on only using
leqs. Third variant tests exact isomorphism including HCONS; less
efficient.

qeqs easier than leqs: every time there's a qeq it corresponds to a
scopal argument, makes the transitive closure trivial. In the course of
refining the grammar got rid of cases where we were doing different
things with the scopal arguments (e.g., equality). Assuming actual
identity works for a particular grammar, but not necessarily for
generator input (makes it harder to construct input to the generator).
German needs leqs, probably also Turkish...

Upshot: not many useful parallels between HCONS and ICONS

Do ICONS have logical status? Not for information structure (probably),
maybe for anaphora.

So coreference:

Two types (maybe): coreference with variable property sharing,
coreference without constraints on variable property sharing. There
might be more fine-grained things we want to do about how much variable
property matching is done.

Lars: Introducing semantic roles into the grammar =&gt; need to detach
number from coreference.

Do we ever get "coindexing" (variable property sharing) without
coreference:

*Elephants are mammals.*

Do want the number to match (some of the time), but don't want to say
they are coreferent.

*These five people are a team.*

-&gt; Suggests that this not a grammar property, but rather something
that we should expect in the input MRS.

But the input MRS is often underspecified for number in e.g., jpn &gt;
eng translation.

What about:

*She grew up a healthy child/\*healthy children.* (Plus also gender
agreement on *child* in Russian.) But don't want to make these
coreferent in a real-world sense? How would we test that empirically?
Since we're talking about different life stages, saying "same entity"
may or may not make sense.

What about negation?

*She didn't grow up a healthy child.* (Still need agreement in Russian)
*Elephants are not mammals.* (But too much mismatch in the identity
copula.)

Maybe this is grammar internal; doesn't necessarily need ICONS.

*There's two children and they grew up a happy pair.* *They went through
life a happy couple.*

-&gt; Number's not agreeing here.

What can be done about passive in English? There is no direct
relationship between passive and information structure.

*What was destroyed by the earthquake?* *Three buildings were destroyed
by the earthquake.*

*Who was this book written by?* *This book was written by Kim.*

EB is interested to know of the examples where the need is felt to
control active v. passive.

Maybe we could have another ICONS type that talks about promotion of
demotion of arguments. (Which potentially interact with information
structure.)

    Summary of TODOs so far: 
    -- MRS object augmented with representation of ICONS (Ann)
    -- View these (Ann, oe)
    -- Serialize (xml, simple output and input)  [output in PET later after we've finished experimentation in LKB]
    -- Post-generation comparison (Ann adding function on top of existing code, oe will improve later)
    -- Add subsumption hierarchy to the SEM-I (Sanghoun); but Ann might hack^H^H work around this for now and let someone else fix later.

What about non-restrictive relatives or appositives?

Rather than appos\_rel (which is problematic because its handle doesn't
have a place to live in the scope tree), use ICONS:

*My brother, the doctor, sings.*

Where does *the doctor* go in the scope tree, if appos\_rel isn't
connecting them? *doctor* is down inside the restriction of *the*, *the*
being a quantifier can attach high in the tree and pulls *doctor* along
with it.

*My brother who sings dances.*

Non-restrictive reading should have same or similar to semantics;
restrictive reading has it inside restrictor of *my*, non-restrictive
doesn't.

Building the compositional semantics where we always do, but rather than
having the apposition rule add new EPs, add an ICONS showing coreference
or equality. Is that the same name as the one we use for anaphora? Name
it appos only if it's different semantically from what's going on. But
what are the examples that we could check against?

Note that predicative noun phrases are a hard, unsolved problem. (Ann
observes that this is a case where composition and formal semantics
point to different answers.... maybe ICONS could have some part in the
solution.)

How should the generator use this information in the ICONS? If the
grammar is suitably updated, should see apposition iff the input MRS has
the ICONS. Oe points out significant potential cost in efficiency of
generation, since currently the appos rule is only triggered when
appos\_rel is in the input semantics because of C-CONT.

Ann: put this under the heading of stage 2. Engineers (Woodley) think
there may be an efficient way to do this.

Dan fantasizes about the padded cell where grammar engineers don't have
to worry about efficiency. oe briefly fantasizes about moving all
variable equality into ICONS. Ann tops that by suggesting she'd like to
move semantic composition out of the feature structures.

Objections:

*Kim tried to sing.* --- there's no room for slipperiness in the
identity between the trier and the singer?

Sounds cluttered. What's the advantage?

Might eliminate the formal idiosyncrasy we currently have with the
treatment of variables.

Could apposition be done like coordination --- creating a new index?
-&gt; More quantifiers in the semantics, since we need one more for that
index.

For the number agreement tendency cases when the input doesn't have the
number but we can't make a hard constraint, could we find a way to
define features for the realization ranking machinery that can capture
this information. (Also possibly related to notion of probabilistic
connection between passive and information structure.)

Do ICONS affect truth conditions?

- Partee examples showing that information structure does sometimes
interact with truth conditions.
- Other examples showing interaction with prosody and truth
conditions.

If ICONS doesn't make it onto a scope-resolved LF, how can we model its
impact on truth conditions?

What's the difference between ICONS and RELS (and HCONS), so we can tell
when to use which tool?

- ICONS are always binary relations between two individuals.
- ICONS don't have/don't merit a position in the scope tree --- in
fact mess things up when you try to put them into the scope tree.

Can we sharpen up the second of those? Can't be fit in naturally? Don't
have a reason to be there? What about the n-n-compound (two-place
unspec\_rel). n-n-compound only sometimes has to do with identity.

oe: In what way are unspec\_rel required to be in the scope tree? Ann:
Easier to see in the preposition case, but also true in the compound
case

*Most white cats are deaf.* *Most deaf cats are white.*

Need to know where *white* goes wrt to restriction to get the right
truth conditions.

*Most cats from Africa are in Bulgaria.*

... resolution: it's not that we don't need to pin it down in
composition by attaching handle somewhere but that we don't want them in
the tree in the end, either because doing so would break the tree for
other things, or because we don't have a natural position in the tree
and have to pick arbitrarily.

*My brother who sings dances.* (non-restrictive interpretation)

If we're going to use ICONS to set up the relationship between the
relative clause and the head noun (like appositives). Where does the
relative clause attach in the scope tree if we do that? Dan hopes:
there's enough quantifiers to make that work. Might need a
non-restrictive *who* to introduce a new quantifier. Ann will look into
this and report back.

Last update: 2012-07-05 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/SofiaIconsImplementation/_edit)]{% endraw %}