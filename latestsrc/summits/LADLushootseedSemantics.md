{% raw %}## All Transitives are Derived

Lushootseed is a Central Salishan language spoken in the Puget Sound
region of what is now Washington State, USA. One hypothesis about
Salishan languages is that all verb roots are intransitive
(Intransitivity Hypothesis; Davis and Matthewson, 2009), the corollary
is that all transitive verbs are derived. This phenomenon brings up
questions about how to perspicaciously model the semantic reflexion of
such transitivization processes: should we provide structures which
build up transitive predicates hand-in-hand with the morphological rules
which derive them from intransitive bases? Or should we "swap out" one
predicate for another in the application of transitivizing lexical
rules? RMRS (Copestake n.d.,Copestake 2009) may provide a way to model
the compositional structure of transitivizing lexical rules in a
typed-feature structure based grammar. The purpose of this session is to
present some data which motivate the use of RMRS and to discuss the
application of RMRS principles in this context.

Quoting Beck (2009, 1--2):

"""

- What are transitive verbs in most languages are derived from a large
set of monovalent patient-oriented (Hess 1995) radicals whose
syntactic subject expresses the semantic PATIENT or ENDPOINT of an
event rather than the AGENT. Consider (1):
  
        1. a. ʔuɬič̓ čəd.
              ʔu-ɬič̓ čəd
              PFV-be.cut 1SG.SUB
              `I got cut with a knife.'
           b. ʔuɬič̓id čəd tə sqʷiqʷali
              ʔu-ɬič̓i-t čəd tə sqʷiqʷali
              PFV-be.cut-ICS 1SG.SUB INDEF hay
              ‘I started to cut hay (with a blade)’
  
  (Bates, Hess & Hilbert 1994: 146)
- √ɬic̓ ‘be cut (with a knife)’—in spite of expressing an event high on
the scale of semantic transitivity (Hopper & Thompson 1980)—can take
only a single syntactic argument, a subject expressing the PATIENT
of the event
- to express an AGENT, it is necessary to apply a valency-increasing
suffix such as the internal causative -t

"""

So, the Lushootseed lexicon has many such pairs of alternants where an
underived verb has a single argument which seems to correspond most
closely with what Dowty called proto-patient, and a derived transitive
where both an argument in correspondence with proto-agent appears as
well as one corresponding to proto-patient. This leads to questions
about representations in MRS. One choice is to list the two verbs
separately in a lexicon which is based on stems after derviational
suffixes have applied:

    ɬič̓=: intransitive-lex-item &
      [ STEM < "ɬič̓">,
        SYNSEM.LKEYS.KEYREL.PRED "_ɬič̓_v_be.cut_rel" ].
    
    ɬič̓id =: transitive-lex-item & 
      [ STEM < "ɬič̓id">,
        SYNSEM.LKEYS.KEYREL.PRED "_ɬič̓id_v_be.cut_rel" ].

where

    intransitive-lex-item := basic-one-arg-no-hcons & basic-icons-lex-item &
      [ ARG-ST < [ LOCAL.CONT.HOOK [ INDEX ref-ind & #ind,
                                     ICONS-KEY.IARG1 #clause ] ] >,
        SYNSEM [ LKEYS.KEYREL.ARG1 #ind,
        LOCAL.CONT.HOOK.CLAUSE-KEY #clause ] ].
    
    transitive-lex-item := basic-two-arg-no-hcons & basic-icons-lex-item &
       [ ARG-ST < [ LOCAL.CONT.HOOK [ INDEX ref-ind & #ind1,
                                      ICONS-KEY.IARG1 #clause ] ],
                  [ LOCAL.CONT.HOOK [ INDEX ref-ind & #ind2,
                                      ICONS-KEY.IARG1 #clause ] ] >,
         SYNSEM [ LKEYS.KEYREL [ ARG1 #ind1,
                                 ARG2 #ind2 ],
                  LOCAL.CONT.HOOK.CLAUSE-KEY #clause ] ].

But this misses the generalization that the event-type denoted by
\_ɬič̓\_v\_be.cut\_rel and \_ɬič̓id\_v\_be.cut\_rel are linguistically the
same, we have two predicate strings which refer to the same event type
but with different argument structures, ie, we've packed a syntactic
dependency into a semantic predicate name.

Another option would be to treat the transitivizer in a way similar to
the ERG's treatment of periphrastic causatives. In this scenario, the
transitivizing lex rules add a \_cause\_x\_rel. Traditionally, this
\_cause\_x\_rel has its own characteristic variable, and then takes two
further args, one corresponding to the CAUSER (perhaps something like a
proto-agent), the other will be the characteristic (event) variable of
the root. Under this sort of analysis, a verb like ɬič̓id would have
semantics:

RELS:

- \[ \_ɬič̓\_v\_be.cut\_rel,
  - ARG0 e0 ARG1 x0 \],
  
  \[ \_cause\_x\_rel,
  - ARG0 e1 ARG1 e0 ARG2 x1 \]

We want this to mean something like x1 cut x0 with a knife.

One thing that stands out to me about this analysis is the "extra" e
variable on the cause rel. That is, I don't yet see the motivation for
this. I think one of the characteristics of the AGENT prototype is
acting as a causer of an event. For example, the English verb "fell"
means to cut down, but someone might argue that this is a morphological
causative variant of "fall". The ERG demo gives \_fell\_v\_rel(e,x0,x1)
for fell in "Sandy felled the tree". If we are happy to analyze English
transitives as denoting a single event, I'm not convinced that the
presence of a derivational affix in Lushootseed is motivation enough to
warrant a proliferation of event variables in the Lushootseed grammar.

A third idea for representing these structures comes from using
Parsons-style decomposition of the arity such that:

1. RELS which introduce event variables are always monadic, they
predicate a string-label for the event and nothing more
2. RELS for AGENT,PATIENT,GOAL,etc are bivalent, their signatures being
something like this: REL-NAME(e,x).

Under this sort of system, (1a) looks like this:

- \[ \_ɬič̓\_v\_rel,
  - ARG0 e0 \],
  
  \[ \_patient\_rel,
  - ARG0 e0, ARG1 x0 \[ PNG 1sg \] \]

And (1b) looks almost exactly the same, but with the x0 being 3sg (some
hay), and with one further REL added:

- \[ \_agent\_rel
  - ARG0 e0, ARG1 x1 \[ PNG 1sg \] \]

In fact, our DELPH-IN formalism already has a precedent for treating
argument relations as predicates a la Parsons, this is called
R(obust)MRS. In RMRS, thematic role names aren't used such as
\_agent\_rel, but instead the predicate names which are used are the
familiar ARGN types, a la Dowty's ordered-argument/proto-role (Dowty
1989, 1990). Here I hasten to comment that in interpreting these ordered
argument relations, the lexical class of the verb has to be taken into
account, Lushootseed also has unergative monovalent roots (Hess'
agent-oriented radicals) in addition to the unaccusative ones like ɬič̓.
There are few more examples down below. EDIT: the more I think about
this, the less sure I am of the previous comment---perhaps independent
of verb class, ARG1,2,3 should be proto-agent, proto-patient,
proto-goal/location, etc. In this case, there will be verb which can
only select for an ARG2, for example.

## RMRS

Copestake motivates RMRS (Copestake n.d., 2009) as an MRS variant which
is amenable to encoding the output of shallow processing (such as POS
tagging) in a notion which is compatible with information from a deep
grammar. The idea is that if you can write default rules which map POS
tags onto semantic types, but one of the principle things you're missing
in that scenario is the arity of the predicate for a given item.
Parsons-style reification of argument relations as predicate names
allows bare predicate names to be monads, predicated of an event
variable and nothing more. RMRS then allows for syntactic dependencies
to further predicate syntactic argument relations on that event, just in
case you have a tool for finding them. Essentially, RMRS allows for
underspecification of predicate-arity in this way. Although the
motivation is different here, for Lushootseed, an underspecification of
predicate arity allows that intransitive roots can their derived
transitive variants share a predicate type.

Beyond the decomposition of predicate arity, yet connected to it, one
thing which is different between the "standard" MRS and RMRS is that
labels are required to be unique for each relation. Instead of using
labels for conjunction at a particular node of the scope tree, RMRS adds
explicit conjunction constraints to the representation. Each label,
then, is used as the first argument to the ARGN\_REL predicates. Keeping
with the idea that argNs are to be interpreted with respect to verb
class (so arg1 on unaccusatives refers to a proto-patient) and
continuing the example above using ɬič̓id, it seems like we'd have
something like the following for "ɬič̓id čəd tə sqʷiqʷali" (I cut the hay
(with a knife).)

    a0:_ɬič̓_v_rel(e1)
    a2:_arg1_rel(a0, x3 [PNG 3sg])
    a4:_arg2_rel(a0, x5 [PNG 1sg])

One question which pops out to me here, is why should I use the label
a0, as the thing passed into the first argument of the ARGN rels rather
than the actual event variable 'e1' in the example directly above? It
would seem that using the e variable would allow us to bring back in the
explicit coordination using labels, as it's the fact that each label has
to stand in for its predicate's argument as a reference point which
forces the requirement that labels be unique.

## Previous Work

Beyond the descriptions of the RASP system in the Copestake papers and
references therein, I would like to know if there are typed-feature
structure grammars which have implemented RMRS. I've heard talk of an
ERG branch which was using RMRS. Is this just an apocryphal tale? Are
there versions of the LKB or PET which know what to do with in-g
constraints when calculating the scope-machinery? For me, seeing some of
this stuff in use would be very interesting and useful.

## Summary of Questions for this Session

### Practical

1. What collection of previous DELPH-IN work should I download and look
at for previous RMRS work?
2. What DELPH-IN tools are compatible with RMRS format?
   1. What subfeatures of particular DELPH-IN tools do or don't work
when using RMRS in Typed Feature Structures
3. Depending on the answers to the above, how do we actually write down
RMRS in TFS using TDL?
4. Is there any motivation to construct an MRS representation which
doesn't enforce label uniqueness (perhaps by passing around eNs
rather than labels as predicate arguments)?

### Theoretical

1. What's the \*semantic\* difference between an "e" and an "x"? Is a
tacit assumption about the relationship of morphosyntax to semantics
taken when saying that words of a given morphosyntactic class
introduce xs vs introducing es.
2. Given different classes of intransitive roots (unergatives whose
single arg is something like a proto-agent, and unacccusatives whose
single arg is something like proto-patient) does ARGN always map to
the same proto-role type or is interpretation verb-stem dependent?
If the former, ARGN seems like a shorthand for the
proto-role-labels, if the latter ARGN starts to seem like a stand-in
for the grammatical relation of SUBJ vs OBJ (or COMPS.FIRST).
3. ..

## Further morphosyntax of Lushootseed transitives

In addition to the "patient-oriented" roots discussed above, Lushootseed
has agent-oriented roots. These can be used a base for deriving
transitives with applicative morphology. Transitives derived from either
type of root can only take a single full NP argument (termed the "direct
argument" in Salishan studies), Lushootseed is notable for completely
disallowing two direct NP arguments even for transitives. Thus:

- one argument or the other of a transitive is either null marked or
marked via morphology (object-marking suffixes) or marked via a
subject-clitic (the čəd seen in the examples above is such a clitic)

Some further facts of the system are that

- third person singular is null in the subject-clitic series and in
the object-marking suffix series.
- if there is a full NP argument, and there is no object marking, the
NP argument is interpreted as the more PATIENT-like of two args
- if there is a full NP argument, and there is object marking, the NP
argument is interpreted as the more AGENT-like of the two args
- passivization reverses the interpretation

Thus there are no sentences such as (two full NPs, even in a transitive
verb):

\*ʔuʔux̌ʷ-c ti č̓ač̓as tsi č̓ač̓as (intended: the boy went after the girl)

But there are (subject marked with clitic):

ʔuʔux̌ʷ-c čəxʷ ti č̓ač̓as I went after the girl

And (object marked with morphology):

ʔuʔux̌ʷ-c-bš ti č̓ač̓as The girl went after me

Here are some further examples from Hess which show something of how
causatives and applicatives are built from a couple of underlying root
classes.

From Hess (1973, 89--90)

    ʔuʔux̌ʷ ti č̓ač̓as
    The boy went
    
    ʔugʷədil ti č̓ač̓as
    The boy sat.
    
    --
    
    ʔuǰiq̓ ti č̓ač̓as
    The boy drowned.
    
    ʔubəč ti č̓ač̓as
    The boy fell.
    
    ʔuč̓axʷ ti č̓ač̓as
    The boy got hit (by a branch while going through thick brush).
    
    --
    ʔuʔux̌ʷ-c
    He went after someone.
    
    ʔugʷədil-s
    He sat next to someone
    --
    
    ʔuǰiq̓i-t
    He immersed something.
    
    ʔubəča-t
    He set something down
    
    --
    
    ʔuč̓axʷa-t ti č̓ač̓as
    He clubbed the boy.
    
    ʔuʔux̌ʷ-c ti č̓ač̓as
    He went after the boy.
    
    ʔuʔux̌ʷ-c-bš
    The boy went after me.

A further note is that there are quite a few more types of causatives
and applicatives which aren't discussed here. The language has a robust
system in its lexicon for building out types of transitives in what
seems to be an obviously grammaticised way. The fact that this system
stands out so readily when looking at Lushootseed verb structure is one
of the principle motivations for finding a semantic representation which
can capture the combinatorics exhibited here.

## References

- Bates, Dawn and Hess, Thom and Hilbert, Vi (1994). Lushootseed
Dictionary
- Beck, David. (2009). [A taxonomy and typology of Lushootseed
valency-increasing
suffixes](http://www.ualberta.ca/~dbeck/valency.pdf). International
Journal of American Linguistics 75, 533–569.
- Beck, David. (2000). [Semantic agents, syntactic subjects, and
discourse topics: How to locate Lushootseed sentences in space and
time](http://www.ualberta.ca/~dbeck/LSubjects.pdf). Studies in
Language 24:2, 277–317.
- Beck, David. (1996). [Transitivity and causation in Lushootseed
morphology](http://www.ualberta.ca/~dbeck/CAUS.pdf). Canadian
Journal of Linguistics 41, 109–140.
- Copestake, Ann (n.d.) Draft on
website:(\[<http://www.cl.cam.ac.uk/~aac10/papers/rmrsdraft.pdf>\],
accessed 19 Oct 2015.
- Copestake, Ann (2009). Invited Talk: [Slacker Semantics: Why
Superficiality, Dependency and Avoidance of Commitment can be the
Right Way to Go](http://www.aclweb.org/anthology/E09-1001). In:
Proceedings of the 12th Conference of the European Chapter of the
ACL (EACL 2009), pages 1-9. Athens, Greece.
- Davidson, Donald. (1967). "The Logical Form of Action Sentences". In
Nicholas Rescher (ed.), *The Logic of Decision and Action*.
University of Pittsburgh Press, pp. 81--95.
- Davis, Henry and Matthewson, Lisa. (2009). TITLE OF ARTICLE HERE.
'Language and Linguistics Compass' REST OF CITATION HERE
- Dowty, David (1989). "On the Semantic Content of the Notion of
'Thematic Role'" In Gennaro Chierchia, Barbara H. Partee, and
Raymond Tuner (eds.), *Properties, Types and Meaning, II*. pp
69--129
- Dowty, David (1990). 1990. ["Thematic Proto-Roles and Argument
Selection"](http://www.ling.ohio-state.edu//~dowty/trld-pdf/).
Language. Vol. 67, No. 3, pp. 547--619
- Hess, Thom (1973) "Agent in a Coast Salish Language". IJAL. Volume
39, No. 2.
- Hess, Thom. (1993) "A schema for the presentation of Lushootseed
verb stems". 'American Indian Linguistics and Ethnography in Honor
of Laurence C. Thompson', University of Montana Occasional Papers on
Linguistics no. 10, ed. by Anthony Mattina, and Timothy Montler,
113–27. Missoula, MT: University of Montana.
- Parsons, Parsons, Terrence (1995). [Thematic Relations and
Arguments](http://www.jstor.org/stable/4178917?seq=1#page_scan_tab_contents).
Linguistic Inquiry. Vol. 26, No. 4 (Autumn, 1995), pp. 635-662

# Notes from VLAD

Joshua: How do I know how many separate *e*s to posit?

Glenn: What is the rule of thumb in HPSG for when you want more than one
event in a verb complex?

Joshua: Everything should have its own ARG0 --- just for preserving
translatability into RMRS?

Joshua: What does it mean for translation if one verb is a single event,
and one, with causative is two event structures? One linguistic test
would be if you can find cases where aspect attaches to only one?

Francis: Causative/inchoative --- wanted to do it analytically, but Dan
talked me out of it because it's not always productive. So current
solution is **\_open\_v\_1\_rel** and **\_open\_v\_cause\_rel** to be
able to identify. Is that the case in Lushootseed? Do you ever get
underived transitives?

Joshua: Maybe just one or two in the whole lexicon. What we do have is
transitive verbs where the morphology is still visible, but the bare
root itself is unattested. Maybe evidence of fossilization. Very few
where we can say it doesn't look like anything transitivizing has ever
happened there.

Francis/Joshua: Roots are more lexemes than lexical items.

\[Awkward pause while we switched over to Skype because it turns out
that Google Hangouts only supports up to 10 participants and we actually
had closer to 15.\]

Dan: You raised about 17 very good questions, and we probably don't have
time to work through all of them to any real satisfaction. Will try to
jump to the ones that seem most central. The labels on arg1 type baby
predications are not handles. Just a bookkeeping attribute saying that
these pieces fit together to make a normal MRS predication. Don't engage
in scope relations, etc. You are right to be wary of adding extra events
--- our neo-Davidsonian universe already gives us lots. The anchors in
RMRS are neither handles nor events. Just a bookkeeping technique to
allow us to navigate back and forth.

Joshua: So to clarify: We use handles (the h sense of labels) as a way
to build a scope tree -- finding which nodes are conjoined. Why is it
different to pass around an anchor than to pass around an e?

Dan: You might think that the e would be a sufficient way of connecting
things up. That may be true as we've moved from RMRS (14, 12 years ago)
to DMRS, we have come to find it important to ensure uniqueness of
ARG0s. That didn't used to be true. ARG0s used to be more promiscuous,
and some EPs didn't have any (e.g. degree specifiers). It may be now
that if we make the additional assumption (not built into MRS itself) of
ARG0 uniqueness that there's enough info to use the event to tie RMRS
units together.

Joshua: So use the *e*s….

Dan: Be careful because the ARG0 isn't always an *e*. *x* for noun
predications, degree specifiers use the underspecified type between *x*
and *e*.

Joshua: Let's say I define a causative predicate with its own unique
ARG0 (probably an *e*), and then it has another argument which is the
causer and a third argument which is a caused situation. There's some
trivial mapping between that representation and one in which the cause
relation doesn't have its own *e*.

Dan: Agree that there is a close connection between the two choices, but
they do have consequences.

Emily: We have examples in Japanese, from Manning, Sag and Iida 1998
where adverbial modifiers can be interpreted as either modifying the
cause relation or the embedded predicate. (And the Japanese causative is
arguably morphological, not periphrastic, though in Jacy we treat it as
a type of auxiliary.)

    紀子  が  勝  に  学校  で  走ら せ た
    Noriko  ga  Masaru  ni  gakkou  de  hashira-se-ta 
    Noriko  NOM  Masaru  DAT  school LOC   run-CAUS-PST
    ``Masaru made Noriko run at school.'' 

Dan: If you have two separate events, then you expect modifiers to be
able to modify either of the events (ambiguity). If that's the case,
then you can't just have a single event.

Joshua: In a world where you were allowed to share ARG0, you're making
an hypothesis about items which share ARG0, that there's no linguistic
process that needs to individuate these things.

Dan: I think share ARG0 is different---a third possibility. (1)
Parsons-style with shared anchors, but not a separate event; (2) Two
predications, **\_x\_v\_1** and **\_x\_v\_cause**; (3) …

Joshua: Parsons treats causatives separately e.g. fell the tree, where
he does include the cause predicate, which is different from native
transitive.

Dan: Right. The Parsons representation doesn't preclude the decision to
do further decomposition. The most interesting part is the ability to
dissociate the assertion of a role in a predication from talking about
the predication as a full entity.

Emily: Did you ever build RMRS in the ERG? Or did I make that up?

Dan: You didn't completely make it up.I tried a little experiment way
back when, intrigued by the idea of doing RMRS natively and then
computing the MRS from that. Temptations in terms of cleaning up the
redundancy in the lexicon and cleaning up causative. I think Ann has an
RMRS baby grammar, maybe with the LKB. I think she went a little further
down that road during the [DeepThought](/DeepThought) project.

Glenn: Why would that facilitate what you described?

Dan: The convenience is that I can create under specifications between
ARG1 and ARG2, the syntax might help me differentiate later. For MRS I
don't have a way to underspecify between which of two features something
is linked to.

Joshua: Another question regarding Dowty's ordered argument theory of
roles v. Parsons's notion which uses labels. If I am going to go this
route of decomposition of predicates of arg1, etc. Is there a constant
interpretation for ARG1 or does that depend on the lexical class?

Dan: Our long-standing view of MRS or RMRS is that the notion of ARG1,
ARG2 is not very informative. It's always the pair of the predicate plus
the argument number that tells you some. ARG1, ARG2 mean something
different with **\_resemble\_v\_1** than with **\_chase\_v\_1**. There's
nothing inherently agent-like or patient-like about ARG1 or ARG2. Have
to do a little computation to figure out the proto-agent/proto-patient
classification because you have to know something about what kind of
predicate you're talking about. Even in the Parsons-style there's
nothing meaningful about ARG1. There's just too much variation in the
world.

Joshua: Does that give me a very strange notion of the idea of
predicate---because they're not constant in the model.

Emily: I think that ARG1 isn't a predicate the same way that chase is,
in RMRS. The RMRS is an exploded view of the MRS, that is perhaps more
convenient for composition (esp underspecification).

Joshua: So two kinds of predicates?

Dan: I think we need to refine our terminology. A predicate is a
predicate symbol, plus its ARGs. That's not true of these building
blocks. Likewise, just **\_chase\_v\_rel**(*e*) isn't something to
interpret until it has its ARGs, too. We need to be careful about what
we're mapping to full entities in our models --- it's the EPs with their
arguments, perhaps with some underspecified.

Joshua: Just yesterday the term 'elementary predication' started to mean
more to me. Is there such thing as 'complex predication'? Should I think
anything more into that name?

Dan: I think we were conscious that the word 'predication' is a
generic/widely used, where people might talk about the predication
*chased the cat* applied to *the dog* in *the dog chased the cat*, but
we want to talk about the smaller pieces inside there. There are
settings in which it's useful to talk about *chase the cat* as a
predication on something else, so we added 'elementary predication' to
talk about the smallest atomic units that are semantically coherent.

Emily: Interesting that you put it that way --- keep waiting for Joshua
to ask what is special about that level, as opposed to the subatomic
pieces we see in RMRS?

Dan: Ann might have more to say, but, I'm assuming that there's
inference and things I can do on the EP level that don't make
sense/would be category errors if tried on things like
**ARG1**(*a,e,x*). I would expect these to be sharply differentiated.
Maybe Ann has some tests that we can apply to differentiate.

Woodley: The ERG at least doesn't make any attempt to have those be
meaningful, and you say that you do that because you think it can't be
done consistently, but the folks in Haifa are trying to find something
consistent there.

Dan: I would expect it to be the dominant world view that God decreed
she would give us 15 or 26 thematic roles that are useful. I have
watched enough people trying to do that crash against the cliffs of
despair (in the AI world in the 1980s) as they try to scale that. But
that's a matter of religion---I'm denying the existence of a thing,
can't prove that. Haifa is trying an experiment to make that scale over
a broad-coverage grammar…

Woodley: Joshua is in a position where he has some morphology that tells
him something at least syntactically uniform about those types of
arguments. Right?

Joshua: Right --- and the morphology is more differentiated than what
we've talked about so far.

Dan: Yes, that looks very cool. A very different way of trying to
differentiate than looking at Levin verb-class style alternations. Might
lead to a way to classify sets of ARGns. 4-way distinction? 20-way
distinction?

Joshua: Just because you might have an out-of-control causer v. a
completely in control causer, are those really different semantic roles?
Maybe we're mapping not into specific roles, but into something like
proto-roles. A cluster of properties gives a proto-causer.

Emily: Could have the morphology also put in a modifier EP
(**\_voluntary\_a\_rel** etc).

Joshua: Or a feature on the event? What's the difference?

Dan: Feature predicts reentrancy.

Joshua: Like agreement?

Dan: Yes. More a heuristic than a true principle. We often have the
choice between types and features. Features are compact and you have the
feature composition principles…

Emily: Another difference is that once we put a feature into the
semantics, we're stuck with it, but what goes in as an EP or similar can
then have yet another EP "wrapped around it" that coerces something. See
Francisco Costa's work on aspect.

Francis: Now that Dan's gone I can say it. I also have a hankering for
semantic roles, I must admit. It would be nice to be able to access the
difference/relation between **\_break\_v\_1** and **\_break\_v\_cause**
more directly in the grammar. I think it ties in with nominalizations.
The breaking event also has similar things. Having also worked in a
group where we did this back in the day in Japan. There are many very
difficult edge cases, but there are also lots of easy cases, and it's
very useful. We still don't have the balance right and it would be nice
to find a workable subset.

David I: You're not okay of saying this in front of Dan, but you are
okay of saying it front of Emily.

Francis: Emily has been less vocal in her opposition…

Emily: Maybe at the Summits, but not at UW. Definitely skeptical of a
small set of consistently defined semantic roles.

Francis: Just because you're skeptical of a small set of roles doesn't
mean you're skeptical of the same roles being shared between verbs and
nominalizations?

Emily: Show me the data. What are the cases where we really need access
to this in the grammar?

Joshua: This language does a lot with nominalization, that's for sure.
What's the difference between *e* and *x*? (In terms of the model.)

Francis: *x*s have to be quantified.

Joshua: Emily and I were talking the other day about quantification over
events.

Woodley: *e*s are also variables, and assumed to be existentially
quantified.

Joshua: Variable means something that can stand in for different things
in the model?

Woodley: Yes.

Joshua: So something like *raccoon* introduces an *x*, but *be a
raccoon* introduces an *e*? What's the dividing line, aside from
morphology?

Mike G: Francis was saying that one's an individual an one's an event .
More clearly: referential index v. eventuality. Ref inds need to be
quantified. Also different in variable properties (PNG v TAM).

Joshua: That's exactly what Emily said when I asked her… I guess I would
say is that just a reflection of the morpho-syntax then? It's true in
Lushootseed that I can aspect on verbs, not on nouns, and possession on
nouns but not on verbs. I've got that in the syntax, but what does it
correspond to in the model?

Mike G: Not an answer to that, but something that might help: In the
ERG, colors are ambiguous between *e* and *x* --- *the color blue* v.
*the sky is blue*. I don't know why Dan doesn't do it for
nominalizations of verbs, but there's an instance of something where a
single predicate can take either an x or an e.

Woodley: You keep asking about what is the difference in the model. THe
idea of a model that defines how we think about MRSs is a nice one but
not a true one. No one has a model-theoretic interpretation of MRSs
beyond a toy one. And MRS is not an interlingua. THere is no reason to
assume that the model for ERG RMSs should be the same as the one for
Lushootseed MRSs.

Joshua: I think it makes sense that the model has to be different. I'm
trying to figure out even what kinds of things go in these models. The
English and Lushootseed models have to be different in the collection of
individual and eventualities … but shouldn't the be the same kind of
things.

Emily: I'm surprised at the notion of language-specific models. Isn't
the model a model of (speaker's conceptualizations of) the world? I
could see the interpretation functions being language-specific… Also, I
think formal semanticists think of their work as something that applies
across languages.

Woodley: Might be ivory-tower syndrome. Do semanticists look at
different languages?

\[EMB later --- yes, many do.\]

Joshua: Collection of predicates & individuals different, but I'd like
to think the kind of model holds the same types of entities as the one I
could build for Lushootseed.

Emily: I think it's wrong to talk about models including predicates.

Mike G: I wish Josh Cason was here… We have reality and then there's a
model. I don't think the model is the real world itself. If you think
about categorical theory (or something). You have things made up of
metal and rubber that I call cars that might include what others call
trucks. There's some set of things in my mind that fill this set. And I
might have a predicate that links to this set, although it could also
link to other kinds of set. Different layers of abstraction…

Joshua: I like the idea that the model is full of individuals, or that
there's some way to divide the world into items and that the predicates
pick out sets of individuals. Is that the right way to think about the
model?

Emily: Like Woodley says, I think don't think it makes sense to talk
about 'the model' as one known thing. Cd. Ann's talk at IWCS
(unfortunately not recorded) where she talks about a subset of MRS
(ERS?) that maps onto model-theoretically interpretable predicate logic.
Outside of that, we work by analogy. Are there other sources of evidence
we can use to choose between e.g. ARG0 *e* or ARG0 *x* for a particular
predicate?

Woodley (in text chat): For the record: I believe models do include
predicates (aka relations)

David I (in text chat): Yes, I have an a priori understanding of a
predicate as a relation, too.

Francis: I teach this in Intro Semantics. Model includes sets, which
might accidentally be the same, \[scribe fell behind\], denotation
function, … from that point of view, the predicates are part of the
model. But then this is the simplest possible model, and it's known not
to describe things very well. No idea of time, properties… Even if we
had a model it wouldn't tell us everything.

Woodley: Taking the case of *I'm hungry* and *I have hunger*. Clearly
expressed differently in different languages. If they get mapped to the
same thing in the model, then you're taking the position that you have a
semantic interlingua, which you can for a toy example.

Francis: If at the end of the day, all you have is individual and sets
of individuals, then you'd expect *have hunger* and *be hungry* to map
to the same set of individuals?

Joshua: In a simple model, might we have predicates that don't map to
anything?

Francis: If that predicate is not in the denotation assignment function,
then it's not part of the model. Turns out that to define singing as the
set of things that sings not possible for anything beyond a very small
world.

Joshua: Thanks -- it was helpful to have that starting point POV.

Francis: Not sure if that's the same kind of model Ann talks about
(disclaimer).

Woodley: Translate that to scenario where *being a raccoon* naturally
described as an event in one language and another language where it's
more natural to talk about *raccoon* as a set of individuals. Not clear
that you'll find the same model that you can map into from both sides
(compared to *have hunger* v. *be hungry* where you're tucking the index
from *hunger* in the former under the rug).

Francis: Isn't the normal interpretation of being a raccoon being the
set of raccoons?

Joshua: In English, the *be* makes that intuitive, but plenty of
languages don't have copulas. In Lushootseed sentences not described in
terms of verbs, but in terms of main predicates. Nominal predicates are
intransitive, verbal predicates can derive transitives, but both
predicates. So maybe it's the determiner that picks out xs v. sets?

Emily: Time to wrap up...

# Notes post VLAD (asynchronous)

Last update: 2015-10-22 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/LADLushootseedSemantics/_edit)]{% endraw %}