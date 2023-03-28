{% raw %}TomarQuantumMRS

Francis: Welcome to the discussion of what has been called Schrödinger
MRS---renamed because we might want the cat to be both alive or dead all
the time. Background on what I'm trying to do (not necessarily the same
motivation as others) and Ann's even better motivation. Looking for
ideas on how else this could be useful and then how we should do it.

Francis: Basic problem for me comes from idioms: Checks knowledge of
example *to bite one's tongue* (I know Bec doesn't have it…) One of the
interesting cases where in *X bites X's tongue* the two X's have to
agree. I can't bite oe's tongue to get him to refrain from speaking, at
least not idiomatically. In the current semantic representation we do
not yet have a complete inventory, but we do have machinery based on
Susanne Riehemann's work and various other things (implementation is
100% Dan) where can have a MT rule that looks for a pattern in the MRS
and replaces with \_bite\_v\_i and \_tongue\_v\_i and enforces agreement
of the Xs --- and then adds an ident\_rel that takes X1 and X2 as
arguments.

Emily: And the ident\_rel is meant to be moved off to ICONS?

Dan: It's a proposed use of ICONS, not yet thought all the way through.

Francis: Sort of nasty because we're ambiguating---getting two readings
where before we only had one, but we believe we want that, because they
are distinct readings and syntactically distinguished to some extent
(only one reading for *I bite your tongue*). Current support: LKB, ACE,
not PET.

oe: Right, PET doesn't not invoke these.

Francis: PET will also give I idiomatically bite my non-idiomatic
tongue.

Ann: There's a very elaborated set of root conditions that check that
the pieces are all there are all not.

Emily: How does this relate to Riehemann's work --- roots? transfer
rules?

oe: In 2005 we replaced the original root-condition based machinery with
one based on the transfer machinery. Let's call it the idiom filter.
Whenever there's an idiom piece, we need to make sure that all of the
pieces for that idiom are there and relate to each in the right way.
There were some technical limitations in the original implementation
that led us to adopt the transfer-rule based approach.

Francis: This currently works quite well. There's one issue for
downstream people in that there's nothing in bite and tongue that
identifies the idiom. Have to pass it through the machinery again to
mark it or do something else. And the Xs aren't marked as idiomatic ---
or as something not a candidate for general coref resolution. Might be
helpful to do \_bite\_v\_i\_bite+ones+tongue,
\_tongue\_v\_i\_bite+ones+tongue, etc.

Glenn: Why don't you want to do coref resolution?

Francis: Because it's already done with ident\_rel. The number of actors
in bite one's tongue meaning refrain from speaking is one, not two.

oe: Plausible to me that there's one discourse referent.

Ann: *They all bit their tongues* is completely fine. I don't see any
reason to say anything other than bite and tongue are idiomatic.

Dan: Is it a different intuition than what you'd have about *he shaved
himself* where you think there should be only one individual in that
scene? In the MRS we introduce two different individuals and an
ident\_rel, but don't identify variables.

Francis: X shaves X's self: two things happening to X because X is
shaving and X is being shaved. Not sure that's the case in bite one's
tongue, but maybe that's not an important intuition to capture.

Francis: In non-idiomatic bite my tongue in sense linking, want to say
that bite is a physical action word, and tongue is a body part. In
idiomatic of bite ones tongue, how do we link it or its part? Whole
thing to keep quiet, part to keep or part to quiet? With the strong and
lovely if true claim that they can all be paraphrased that would help,
but looking with a student can't always find paraphrases that preserve
structure. List of 500 idioms and some are much harder to paraphrase. X
keeps quiet, X refrains from speaking might better, but we'd like to
keep paraphrases simple. This is where I came up with the quantum idea.
We want to have both readings: refraining from speaking and biting and
tongue to allow for modification: *X bite's X's garrulous tongue*. In a
large corpus, we find lots of modification.

Ann: If you have the keep quiet paraphrase, you can't give a semantics
for that.

Francis: garrulous is lost in the keep quiet side, but it's still on the
other.

Ann: If you think the real semantics is keep quiet, wouldn't it be weird
that you can say bite one's garrulous tongue?

Francis: I've come to the conclusion that we need two different ways to
representing at the same time?

Ann: Can you go with a slightly less transparent example? (There's at
least one other in this small family: *hold one's tongue*, *shut one's
mouth*, verging onto non-idioms…)

Francis: *eat one's hat* currently paraphrased as *X is sure that
something will not happen or is false* … not a very good paraphrase.

Woodley: *put one's foot in one's mouth*

Francis: *feel one's oats* does everyone have that?

Many: no…

Francis: to feel energetic.

oe: *wait one's turn*, *wrack one's brains* … what are we trying to do
here?

Francis: Find a slightly less transparent example. Possible for *bite
one's tongue* that *tongue* means speaking and *bite* means refrain.

David I: If you go with inebriation, there's tons of non-transparent
idioms. *grab the dragon's tail*

Joshua: What's the problem with *kick the bucket*?

Francis: It really resists being modified internally. But let's put it
on the table. What do people think is the right representation in MRS
for *X kicks the bucket*?

Bec/oe: How about *put it on the table*?

Joshua: Do you want decomposable or not?

Francis: Not decomposable, but still modifiable.

David M: Why shouldn't all of these things be translated into their real
situations. Non-decomposability: isn't that just convention in this
point in time?

Francis: I don't know how to describe a complete situation, but I know
how to describe…

Ann: That's the Steve ??Pollen approach to idioms: parse them as though
they were ordinary sentences and then have something at the end that we
would implement as a transfer rule component. That doesn't work very
well for idioms that have elements that only belong to that idiom: *keep
tabs on* is an example. Or words that look like ordinary words like
*face* in *lose face* --- where *face* is behaving as a mass turn, which
makes sense if you look at its denotation there. That's why you have to
have a special idiomatic *face*. There's a set of arguments against the
just-do-it-at-the-end transfer approach. Would have to look them up to
get them all. We have to say: Our approach to idioms is our approach to
idioms now, not trying to revisit in this discussion just now. Unless
you wanted to Francis?

Francis: The motivation for me is trying to get structural and lexical
semantics together. This tells me it's an idiom, but doesn't help in
linking to other things, to generalize up the hierarchy of meaning, and
to know that there's not actual tongue involved. But the \_i\_ helps
with that.

Guy: How about *take the biscuit/cake*?

Francis: *spin one's wheels*

Emily: *spin one's wheels* is still pretty transparent. Like *takes the
biscuit/cake* better.

Francis: Paraphrase so we're all on the same page?

Emily: *That's fantastic*, almost always sarcastic.

Dan/Woodley: Not sarcastic for us.

Dan: Maybe we need to find a different one we can agree on.

Francis: *tighten your belt*

Woodley: It sounded to me like the idiom we just had took the cake.

Guy: *take the biscuit* is there's a bad situation and something makes
it worse.

Glenn: At the mini-symposium in the MRS space, you seemed open to the
idea of doing idioms in the MRS space Dan, but that seems inconsistent
with what Ann's saying?

Ann: We are doing it in the MRS space, just some of it involves the
final check.

Francis: At least some of it done in the syntax---like ident\_rel coming
in with idiomatic verb.

Dan: Idioms also sometimes have idiosyncratic syntactic properties too,
so of course we have to do this partially in the syntax. cf. Ann's
example of mass-noun face. Likewise in *bite one's tongue* that *bite*
has to be a different *bite*. Contrast isn't to syntax but to post-hoc
filter.

Glenn: If we have the grinder, you could still parse *lose face* without
mass noun.

Emily: But how would you force the idiomatic reading in that case?

Glenn/Dan: Could check for the reflex of the grinder in the MRS to
notice it.

Ann: You would have to set it up so that somehow lose checked for that
mass use of face. Not so straightforward.

Dan/Ann: Depends on whether there's a semantic effect of grinding.

oe: Let's leave aside the question of how to put idioms together and go
to the question of quantum MRSs. Tuesday I was left with the impression
that we are indeed failing to record something substantial. The idiom
lexicon is checked by the root condition, but don't record that, which I
take to be at the core of your point here. We don't tell you that these
pieces of the MRS actually are something we have recognized as an
instance of this idiomatic expression.

Francis: It's one of the important pieces.

oe: On Tuesday I felt that yeah possibly it's something we're doing
formally and not recording, and should. The original proposal was to
somehow put into the MRS a dual, parallel, semantic analysis;
description in terms of pieces of meaning. Dual so that when there are
modifiers or interactions with other pieces (*keep closer tabs*) we have
enough structure to record that on the one hand as we are doing already,
but also another path with the idiomatic meaning. Thought that seemed
odd, but like Emily's suggestion of coordination paraphrase: *kick the
bucket and died*.

\[Emily, as a sleepy elf, doesn't remember suggesting that…\]

Ann: I thought we knew that was the issue and want to go back to the
question of modification. If they were really strongly equivalent and we
could keep it all the way through. Having internal modification that you
can't do on one side is problematic.

Ann/oe: Let's get back to working through that idea with some specific
examples.

Francis: Let's go with *take the cake* and some of us will be sarcastic
and some will be both, and can we assume for the sake of discussion that
*X takes the DELPH-IN cake* is an acceptable thing to say?

\[agreement\]

Francis: My proposal:

    X->fantastic_a_take+the+cake-> …
    X->take->-the->cake<-DELPH-IN

Emily: How would a down-stream processor take and combine the
information about the modification and the idiom?

Francis: Currently, I expect to lose some of this information. How can I
translate *take the cake* in some language that doesn't have a way of
saying that with modification.

Guy: The MRS predicate symbols aren't interpreted. If we're trying to
say something about lexical semantics, I don't see that adding another
relation is the way to do it.

Francis: I'm working in the extended MRS world where I'm ambiguating
these predicates.

Bec: In the MRS or as a separate annotation? Seems like it should be a
separate annotation that is linked to the same variables. Not in the
MRS.

Guy: Link this thing to fantastic in [WordNet](/WordNet)

Francis: We can do that, but I feel like we have the same incoherence.
Then cake isn't linked to anything?

Bec: Is there more than one take\_v\_i if take participates in different
idioms.

Francis: I believe there should be.

Bec: That could get expensive.

Ann: It needs to be an idiomatic take, but doesn't have to be different
from other idiomatic takes.

Francis: Looking for examples where are different meanings for same word
in different idioms.

Woodley: *bite one's tongue* and *bite the dust*

Francis: Those should be different bites.

Emily: In the linking to [WordNet](/WordNet), or in the ERG?

Francis: In the ERG.

Dan: But you have tongue and dust and so you can use that for linking.

Francis: But bite in *bite one's tongue* needs to introduce ident\_rel.

Dan: Right.

Guy: outside of idioms, do you have cases where you want to mark two
items to one WN synset, or is it always one to one?

Woodley: hot dog.

Francis: yes and no.

Ann: Same question, and I'm still not sure why the idiom case is a
special case as opposed to MWEs that need to be mapped to a single WN
sunset.

Francis: Because the incoherence problem doesn't disappear. If I'm
mapping this to fantastic… maybe it doesn't have to be done in the MRS.
I'm not hung up on exactly where it happens. … and you can take the
DELPH-IN cake, we're going to end up with two things that need to be
there.

Ann: I'm saying you linking the idiomatic take the cake in MRS to a WN
synset that means fantastic (however you do that; I don't care). What do
you not get by doing that that the quantum proposal gives you?

Francis: For some of these idioms I want to link them to more than one
thing that are in a relation. If it's just linking to a single thing
that's fine, but if linking *lose your temper* as *get angry*, need not
just the get the angry but the relation between them.

Ann: If WN has a MWE that isn't analyzed, then that's because WN is
insufficient in its expressivity, and one answer would be to parse the
bits of WN so you can link to them.

Emily: Going back to oe's phrasing of the problem but not taking the
quantum solution. Why not use the sense field to tag the predicate
symbols with which idiom was recognized. (Using transfer results to
rewrite predicate symbols, say.) You still have the separate pieces for
when you want them, modification still attaches the same way, but you
also have a record of the fact that the idiom was recognized.

oe: Would almost need to have identifiers in case you had two kick the
buckets in the same sentence?

Woodley: Why? We don't if we have three dogs in the same sentence…

Francis: I agree that WN doesn't have everything, and I'm also enriching
going the other way and enriching WN. Stepping aside from the important
but temporarily uninteresting question of who should do which work, I
still think that doesn't have the representation we want.

Emily: For what application?

Francis: For representing what people mean.

Emily: I think we will be more successful if we have some applications
in mind.

Ann: My goal is also to do lexical semantics, but for me the lexical
semantics of an idiom isn't that different from anything else. There's a
cline from idioms to perfectly transparent phrases, but on a
distributional approach you can say that take the cake has a
distribution, it's just a very narrow distribution and I can say
something about it just like I can about the distribution of take in
other contexts. I don't want to say that linking to WN isn't valuable,
but I don't want to say it's our (only) approach to lexical semantics.
Idiomatic take does have a meaning, otherwise we wouldn't be able to
decompose it.

Francis: To go back to the motivation of why and how, looking at it
through the lens of MT (also relevant for QA and a broad variety of
things), paraphrasing the fact that take the cake means something
similar to fantastic (maybe linking take to fantastic is all we really
need?) … maybe I'll come back next year with a much broader range of
well worked out examples and find that this doesn't do everything we
want it to do. But I'm not quite sure … that's why we're discussing it.

Francis: Moving back to *kick the bucket* --- even there we want all
three in the MRS? Some of the things we've talked about about idioms in
general, include we don't want *bucket* to be available for coreference.
*That took the cake and it was delicious* --- non-idiomatic only.

Woodley: Can't say *[ParGram](/ParGram) kicked the bucket and DELPH-IN
will kick it soon, too.*

Emily: Star

\[oe goes to get his medication\]

Emily: Isn't \_bucket\_n\_i enough to block it from being an antecedent
if you want?

oe: Then you're making a strong predication about all idiomatic Ns.

Emily: Okay, then list them, and use the sense field proposal:
\_bucket\_n\_kick+the+bucket isn't available.

Ann: For the record, I'm not sure that our representation is right for
kick the bucket, but don't really care.

Francis: Me too, for that one.

Dan: Goes back to your observation about there being a cline. If we're
going to keep the parts separate for some and not others, then I have to
decide where to make that binary split somewhere in the cline. Don't
have the tests that would make that decision. If we do it always
uniformly then nobody's ever surprised. Turns out to be a contingent
fact about the world that kick the bucket never sees any internal
modification.

Ann: And I managed to convince myself I could internally modify kick the
bucket anyway --- e.g. kick the cancer bucket meaning died of cancer.
Not sure what I think about it at the moment. Kick the bucket is the
standard example of a non-decomposable idiom that looks like it might be
decomposable.

Dan: More support for the cline.

oe: Sounds to me like the 2014 conclusion that we don't want to task the
grammarian with making that decision.

Ann: Same as 2002 conclusion.

Francis: Two speed bumps before we reach that conclusion. Do we consider
it worth marking kick the bucket as idiomatic? In X bite's X's tongue,
agreement required for idiomatic reading. But no such thing for kick the
bucket --- so do we want to list it in the lexicon?

Dan: What we don't list in the lexicon is whether that guy can be used
for coref later.

Francis: Or modification?

Dan: Actually, I might even do that, because nouns are already marked
for whether they can be modified, so we can list that. So it's not your
problem.

Francis: It's possible that we don't yet have every idiom in English in
the ERG. So we could look at adding some more (student helpers).

Emily: So what Francis is asking is whether these idioms that are not
decomposable and not syntactically interesting in any way are worth
putting any effort into listing.

Guy: Attested example of: *dog kicked the canine bucket*

\[General discussion of attested examples of idioms.\]

Woodley: Looks like it's possible to *kick a habit and the bucket.*

Francis: Sometimes people invoke the position that's a play on words.

Woodley: I respect that point of view.

Francis: Another use of quantum MRS is the names: Secretary of State.
Someone who has the role of secretary wrt to the State Dept and also
just refers to one individual. *The Secretaries of State and War*.
*University of Washington* is just one thing. Can have *Universities of
Washington and Oregon.*

Ann: Another set of examples: red deer, brown bear, polar bear, carrot
cake. Idiom of encoding that you say polar bear and not white bear to
talk about the species of animal (in English).

Woodley: Would you say *hot dog* is one of those?

Ann: No, *hot dog* is not a *dog*. A *polar bear* is a bear that lives
in a polar region. It's perfectly compositional in some sense. Same for
red(x) and deer(x) if you accept that that red isn't scarlet but like
the red in red hair. And yet, it's clear that those things are single
species and conventionalized. You can't just make up that phrase on the
fly.

Emily: What does the quantum MRS do for you there?

Ann: Gives you the ability to say both that there's a single thing (e.g.
\_polar\_bear(x)) and it's polar(x) and bear(x). The argument for doing
that is that we capture something that's conventional about the
language. Not saying that you need to do that in the ERG. If you say
*that's a very brown bear*, then modifying brown does take out the
species type reading.

Francis: Because very can't modify a N.

Ann: Don't care how we rule it out, just that is ruled out.

Emily: Representing conventionalization of idioms of encoding is useful,
but why do we want to do that in the MRS?

Ann: Don't want the grammar do to it, because there is no syntactic
difference. Can pack the two readings into a single packed MRS.

Emily: Are quantum MRS and packed MRS the same thing?

Ann: No: packed MRS is when there's actually ambiguity.

Emily: So do you want quantum MRS or packed MRS for brown bear?

Ann: \[Stating a hypothesis for now as if I believe it:\] quantum MRS
because it's not an ambiguity.

David M: If there were two equivalent meaning the mind, could you not
devise sentences where the first half has two meanings and one just one,
and then see if it's surprising or infelicitous?

Emily: Like *the sheep in the pen was/were sleeping*

Ann: I think there's cases where it does collapse to one or the other,
but it doesn't have to. Looking at a brown bear thinking it's a brown \_
bear and it's a brown bear both true of the world and how I think of the
rule.

Glenn: Can collapse it by saying *brown brown bear*.

David I: In sense field idea, what do you do with brown and black bears?

Emily: That's a good question.

Glenn: I like the quantum MRS as Ann was describing it. Can also ask of
the quantum MRS.

David I: *black and brown bears* v. *red and white houses*.

Francis: Korean president lives in the blue house, so can say *Blue and
White House*.

Emily: What I got from Glenn's point is that it's similarly a problem
for the quantum MRS idea.

Francis: Would have to have multiple doppleganger predicates triggered
by bear in the quantum MRS.

Francis: Thank you all for the illuminating discussion. It took the cake
(in the Dan polarity). Would like to discuss those interested more
further..

### During the coffee break

Mike: what if you have "a brown black bear". With only the semantics,
where you have brown(x) ^ black(x) ^ bear(x), how do you know if you
have a "brown (black bear)" and not a "black (brown bear)"? The
semantics do not give you the relative order of the modifiers unless you
look at CFROM:CTO, which is unsatisfying.

Dan/Francis: That's true if they're both adjectival modifiers, but it
could be discernible if "black bear" is a noun-noun compound.

Last update: 2014-07-17 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/TomarQuantumMRS/_edit)]{% endraw %}