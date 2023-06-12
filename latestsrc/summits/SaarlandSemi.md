{% raw %}Rough transcript from DELPH-IN 2013 Summit discussion about
[RmrsSemi](https://delph-in.github.io/docs/tools/RmrsSemi). If your comments are not accurately represented,
please make the necessary changes.

Emily: UW crowd has been curious about SEMI -- what it's for, where it's
been deployed, where it can go. educate us?

Dan: my recollection of origin of SEM-I: narrowly motivated driver for
getting SEM-I in place involving LOGON: transfer writers faced grammars
on each side that were shifting as predicates changed on each side,
rules had to be adjusted no public interface declaring a schema to hold
on to or publicize changes mechanism to export the predicates defined by
the grammar (lexical preds and grammar preds)

have maintained the automated portion at least, and looked at possible
extensions:

- \- modal "can" == "be able to"

but main intent was to provide a specification so other components can
have confidence in introducing a predicate name and argument structure
(hoping the grammar can generate from it)

Emily: can / be able to -- grammar work or semi work?

Dan: that abstraction wasn't present in the grammar before (although
must / have to was) sem-i is intended as a contract to be sustained, or
at least publicly acknowledge changes

Emily: human readable or machine readable? what software?

oe: LKB can load sem-i's and validate parts of an mrs against them, flag
incompatibilities e.g. an output mrs that makes use of predicates not
known to the generation component surely won't generate; detect that
early.

Emily: so use it in transfer grammar development? oe: yes

Francis: predicates.tdl and predicates-erg.tdl in transfer grammars

various: those are only semi-automatically built

Berthold: any number of semi's, what's a useful scenario for having
multiple semi's loaded? oe: check quality of inputs before doing semi
glenn: agree does that. refuse to allow any predicate not listed in semi
to go through VPM. oe: semi is a concept still in the making. going back
to history question…

Ann: saw need for this for anything using MRS, not just transfer. was
integrated with lexdb interface at one point notion that predicates
could be constructed on basis of what's in lexdb (pred, arguments, types
of arguments). didn't realize that predicates.tdl would be manually
edited… haven't looked at for years

oe: genealogy going back to semdb in verbmobil writing down
independently of processors, the interface specification of the grammar
grammar may have internal syntactic reasons to make some predicate
distinctions (ann interrupts: you mean, need to select particular types
of predicates to get syntax to work, even though they don't reflect a
semantic generalization. but not trying to reflect syntax in the
predicates.) oe continues: small inventory of mrs variable types,
generalizations. grammar may internally have more complex hierarchy of
these for its own purposes, but don't want to expose those to the user.
semi should list inventory of predicate symbols, plus their arity and
argument typing also variable properties also what hierarchical
relations hold between all these things (e.g. x := i, e := i) ERG
conflates person and number into a single sortal hierarchy, but for
external interface, more conventional to present separate person and
number properties. VPM.

Emily: what automatic software exists for this? Dan: the automatic
portion is automatically created with each release

Emily: should other grammars do that too? Dan: it's a work in progress…
Francis: the wiki says how to do it oe: there's a tech report… from deep
thought

Prescott: everything in an mrs should be in the semi? Dan: the semi can
be underspecified… but yes.

Woodley: conceptually similar to a DTD for the ERG's MRSes others: DTDs
don't have hierarchies in them oe: wordnet linking should be keyed off
the semi

Woodley: what is semi actually used for, or should be used for? Ann:
pre-generation check in lkb Glenn: pre-mrs-extraction check in agree
Woodley: should it be used elsewhere? mrs comparison? oe: isn't there
another session for that?

does the semi explain why adjectives have ARG0 event?

oe: no, but it tells you that it does.

Emily: mike goodman thinks he can use the semi in converting between mrs
formalisms -- in dmrs, unexpressed arg positions are dropped, want to
map back into something where the args are expressed, use semi to know
what args and types to introduce

Ann: yes, dmrs paper says you should do that in fact. but for generation
you don't need to bother.

Emily: so is the VPM part of the semi?

oe: no

Woodley + oe: the VPM says how you get to the semi, but the actual
description of the semi is in erg.smi and core.smi

Last update: 2013-07-29 by WoodleyPackard [[edit](https://github.com/delph-in/docs/wiki/SaarlandSemi/_edit)]{% endraw %}