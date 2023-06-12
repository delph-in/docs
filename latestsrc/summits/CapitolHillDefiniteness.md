{% raw %}# Definiteness

## A Discussion at the Capitol Hill meeting, January 2017

[CapitolHillTop](https://delph-in.github.io/docs/summits/CapitolHillTop)

FZZ: *This one dog cried* (in Chinese) — doesn’t parse, because of
previous analysis of COG-ST.

SSH: Paper with Joanna on how to express definiteness in Chinese (incl
Cantonese & Mandarin). SSH added COG-ST info to her idea. This part
differs from the other constraints in Zhong. Other work focused on
robust parsing and strict generation. This part is much more inclined to
theoretical precision.

EMB: Theoretically oriented?

FCB: Makes claims that are perhaps too strong.

SSH: Definiteness largely dependent on on classifiers and
demonstratives. Dem-Cl-N definite, Nume-Cl-N indefinite (in both
Mandarin and Cantonese). Cl-N/bare N differ across varieties. Can always
be indefinite, but Cl-N can also be interpreted as definite in
Cantonese; bare N also as definite in Mandarin.

SSH: map Dem-Cl-N to uniq-or-more, Nume-Cl-N to type-id, Cl-N/N to
type-id if strictly indefinite or cog-st if ambiguous between indefinite
& definite.

DPF: *type-id* is type indefinite?

EMB: No, type identifiable. Speaker expects addressee to understand the
type of thing being described, but not to know anything about the
particular individual.

SSH: Two problems — added one extra subj-head-phrase in rules.tdl.
subj-head-nn for non-nominal subject, and subj-head-n for nominal
subjects.

FZZ: Extra constraint (requiring subjects to be indefinite) causing some
real sentences not to parse because we do find indefinite subjects. The
other problem is the hierarchy of the feature value (under *cog-st*).
Problem arises with dem+num+cl NP … one says *type-id* and one says
*uniq-or-more*.

FZZ: Ex: *this one CL dog cried*

EMB: What’s the COG-ST there?

FZZ: It’s definite. It’s as if the demonstrative is over-writing what
the numeral had to say.

SSH: Do you agree with Joanna’s analysis?

FZZ: Mostly — but Cl-N is very rare in Mandarin.

EMB: When the Num-Cl-N occurs all by itself it’s indefinite, and we
don’t want to lose that information.

DPF/GCS: Could introduce a joint subtype between demonstrative (not part
of COG-ST) and type-id.

EMB: Alternative: keep Num-Cl underspecified until it either combines
with the demonstrative or with nothing (pumping rule).

FZZ: Yes, that’s what I’m planning on.

GCS: Any other possibility?

FZZ: *My three books* indefinite.

DPF: Really? What about *my dog*?

FZZ: *My dog* (no numcl) is definite.

DPF: What’s your test for definiteness?

FZZ: If the listener can ask “which one?”.

LMC: Are you saying that there’s ambiguity between *my two dogs* *two of
my dogs* for these strings in Chinese?

FZZ: *Wo3 de liang2 zhi1 go3* — My two dogs / *Liang2 zhi1 wo3 de go3*
two of my dogs

DPF: If the possessive is the last thing to connect, it gets to say that
it’s definite.

LMC/FZZ: Not a very common thing to say in Chinese all in one NP. Both
of those sound quite artificial.

LMC: *My two dogs ran away*?

FZZ: *Wo3 na4 liang2 zhi1 go3* — insert a demonstrative

LMC: *I like your two dogs*? Are we seeing an interaction between
subject position and definiteness here?

FZZ: I would just say *I like your dogs.* If I really want the number
and possessive I’d put the demonstrative in too.

DPF: Okay, let’s not try to bend the grammar to do things it doesn’t
need to do. We got into this because we were imagining two cases for
num-cl w/ and w/o numeral classifiers. We were just trying to see if we
needed a third rule, and apparently we don’t, because it doesn’t occur.
We can pretend it does…

FZZ: Another thing to consider is whether relative clauses interact with
definiteness.

GCS: So both technical proposals work?

DPF: No, because the bypass proposal fails to make a commitment about
definiteness when there’s a demonstrative.

FZZ: Can I tap your linguistic knowledge in other languages?

EMB: Relative clauses are compatible with indefiniteness in English.

DAI: *I saw a movie which was very boring.*

SSH: Joanna focused on ordering constraints between elements (e.g.
possessive, number, demonstratives). Current version of the test suite
focuses on that. You probably need more test sentences.

FZZ: Current implementation is slightly different from what’s described
in the paper. Classifier expects numeral as specifier. Demonstrative can
take a complement which is a classifier. That takes care of the order.

EMB: So maybe you don’t need a pumping rule? The num-cl and the
demonstrative can say different things about their SPEC values … or not,
because they’re both going to be talking about the same index (the
noun’s). So back to the pumping rule.

DPF: Would be surprising if relative clauses constrained definiteness,
because we’re just treating them as interactive modifiers, just like
adjectives.

EMB: Another reason you wouldn’t expect them to be restricted to
definiteness at least is that the canonical use of indefiniteness is
introducing new discourse elements, which is exactly where you’d want
relative clauses.

GCS: So what about possessives?

DPF: What is it about possessives that makes them definite?

EMB: I think they’re logically independent properties, but surely linked
in English.

DPF/GCS: So why is it easier to start a discourse with a possessive NP
than a definite one?

EMB: With reference to [“Score keeping in a language
game”](http://link.springer.com/article/10.1007/BF00258436) — it’s not
that you already have the shared knowledge, but that you’re asking the
hearer to accommodate it, and that’s easier with possessives because
you’re provided more information.

DPF: *My dog and a large cat just walked into the room.* Can I say,
*Which one?*

All: Trying to test the definiteness of the conjoined entity, but it’s
hard to use *which one* that way?

EMB: In Chinese, what form does the *which one* question take?

FZZ: *na3 ge*, or *na3 NUM ge* == which NUM (CL).

DAI: I suspect that coordinate indices will always be definite.

EMB: English doesn’t give us many ways to test this.

DPF: *Two dogs and two cats walked into the room. They got into a
fight.*

DAI: Has to be all four.

EMB: But that doesn’t tell us anything about the definiteness.

DPF: We’re supposed to ask the *which one* question. *Two dogs and two
cats got into a fight. Which ones?* Can be about the sets of pairs. But
that should be impossible if it’s definite.

DAI: So underspecified?

DPF: That would be my guess, but that’s a bit worrisome: *My two dogs
and my two cats got into a fight. \#Which ones?* So it seems that the
coordinated index is definite if at least one conjunct is.

EMB: Really?

DPF: *My dog and two cats got into a fight. Which ones?*

EMB: That’s grammatical, no? Which cats?

DAI: But *Which ones* can’t refer to the group including the dog.

EMB: English isn’t going to have anything sensitive to this. But Farsi
for example uses accusative case only on definite direct objects.

DAI: And Inuktitut is split ergative on definiteness.

FZZ: Joanna has provided a test set. *I want to buy CL cat* should be
indefinite. It’s casual, but grammatical. This is an example of numeral
omission.

GCS: But then it has to be one.

FZZ: Right.

DPF: But we don’t hallucinate in our grammars.

DAI: But we do with pumping rules.

LMC: *I buy CL cat* is the informal way of saying *I buy one CL cat*

DPF/EMB: Pumping rule that introduces the semantics for *one*.

- \[ NB: In a later discussion, Luis came up with the interesting test
of asking *How many cats did you buy?* and it seems like this form
wasn't a suitable answer. So we came around to the idea that *I buy
CL cat* is not in fact a precise paraphrase of *I buy one CL cat*
and probably shouldn't have the same MRS. Might be more suitable to
use the feature specification \[ NUM sg \] for the effect of this
rule. \]

FZZ: Not used in subject position.

LMC: It’s indefinite! I think the definition of indefiniteness is fuzzy.

DPF: We have a precise test. Using it grimly because we don’t have
another one.

DAI: So how are you avoiding putting *Cl cat* in subject position?

FZZ: The grammar right now requires numerals with classifiers.

DAI/EMB: Introduce covert case as a time-honored kludge.

FZZ: How?

EMB: Give the grammar a nominative/accusative case system; where verbs
constrain subject to be \[ CASE nom \]. Most nouns don’t care, but the
pumping rule for classifiers without numbers say \[ CASE acc \].

GCS: I have an implementation of that pumping rule for Thai. Could be a
test bed.

FZZ: We used to say COG-ST distinguished that.

DPF: But you’ve shown that that’s wrong. We know that something is
special about subjects (cf XARG). To distinguish NPs that can show up in
that position or not, it’s fine to use the feature CASE. Could call it
GLOOP instead if you want to. Seems easier to remember what you want it
to be doing if you call it CASE.

FCB: Check interaction with ba3 construction, passives, and other things
that change subjects and see if these things show up there. E.g. *A boy
is bitten by the dog.*

FZZ/DAI: With a number, not the Cl+N version (in Mandarin; Cantonese
differ).

SSH: So far we’ve avoided using case because it’s been reported that
there is no case in Chinese languages.

DPF: A binary distinction in grammatical form between subjects and
non-subjects needs a name.

DAI: There are a lot of languages that have this distinction without
morphology.

EMB/DPF: If we can call the distinction case in English (when it only
appears in the pronouns), why not in Chinese?

MWG: Can you just say that the thing in subject position can’t have an
implicit numeral?

EMB: At the NP level, that’s not first-class information. Something in
the HEAD value is.

FCB: Need to be able to sell this to our local typologists.

DPF: So spell it ESAC.

GCS: There is a cline that includes subject down to more oblique
arguments, right? Is that orthogonal to the cline of definiteness?

EMB: They are analytically independent, but can be correlated. Not as a
hard constraint in English, and as we are learning not as a hard
constraint in Mandarin either.

GCS: So what’s the other name for it, if not obliqueness?

EMB: It’s CASE.

GCS: I still have some resistance to that.

EMB: Case means variation in the form of NPs that correlates with
grammatical function. Here, the variation isn’t morphology, but it’s
still variation in form. So it’s case. Anyone who uses that term
differently is just wrong.

Last update: 2017-01-06 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/CapitolHillDefiniteness/_edit)]{% endraw %}