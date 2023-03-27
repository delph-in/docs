{% raw %}## Shared MRS Library and Tools

- The current DELPH-IN downstream processing hangs on the MRS
processing functionalities provided by LKB (written in CL)
- MRS extraction from TFS functionality in PET, no conversion to RMRS,
DMRS, etc.
- Some of the MRS processing procedures are intrinsically EXPENSIVE
- Adhoc conversions could cause problem in the long run
- Existing pieces of puzzle ...
- Packaging, integration, API ...

## Intro

Until 2-3 years ago, no alternatives to what is in Lisp to extract or
manipulate MRS. Extension to PET provides functionality to extract MRS
structures from TFS that result from parsing and export into XML format.
Supposed to be 100% compatible with output of LKB code (no complaints,
anyway). Some discussion on developers/mrs list as to whether to
minimize functionality on the PET side to avoid duplication, Ann wasn't
sure about long-term compatibility/maintainability (drift risk). But
more and more people are relying on the conversions. All DFKI projects
shitfed from RMRS to DMRS, but currently must rely on LKB/CL for that
conversion. Others at DFKI have tried to do the conversion by
themselves, but not in a way that was fully compatible. In the long run,
if we don't provide a satisfying alternative to CL/LKB code for
conversion, it will be less beneficial. Subsumption and equivalence
checking have been implemented, too, but not standardized/packaged to be
easily shared across sites.

- Come up with suggestions/ideas about whether we want an MRS library
outside the LKB universe.
- Who is contributing which bits?
- How do we test them?
- What kind of interface? How to invoke these functionalities?
Standard API?

## Who has worked on related code?

- Rebecca: elementary dependency conversion (used Yi's PET-MRS and
reads that, rather than slow export); dependency comparison (not MRS
comparison); code to extract discriminants from MRS (for auto
treebanking).
- Mike: in Egad needed to parse and then compare the simple MRS
structures from \[incr tsdb()\] profiles. Perl then python.
Isomorphism/equivalence checking. Stricter than what's allowed in
the LKB (no subsumptions allowed).
- Prescott: Exploratory code to hydrate the RMRS XML representation to
Java, and then underspecify and use patterns in that representation
to compare for the task of sentence compression/sentence fusion.
Using HoG to look at that representation of RMRS.
- (Richard had some too: But needed to be tuned for every language.)
- Woodley: Has constructed MRSs from TFSs, but not necessarily in ways
that is contributable. DBs of MRS, feature extraction from parse
ranking. Starting from feature structures (not string). Subset
implementation of transfer machinery/ability to read in trigger
rules.
- Andy (per Rebecca): Was using Ann's DMRSs exported somehow, or
sharing Rebecca's code (sometimes translated to python).
- Francis/Petter: Have messy/elegant scripts for generalizing MRSs to
build underspecified generation model. \[NUM sg\] -&gt; \[NUM
number\]. Scripts for comparing chunks of MRS for making transfer
rules. Scripts for building DBs of MRSs.

## General discussion

Stephan: MRS equivalence and MRS subsumption are not necessarily
uniquely and formally defined.

Yi: DFKI library that can be compiled with SBCL used in TAKE project.

Prescott: How is the DMRS output represented from that library?

Yi: I think as XML.

Francis: MRS-&gt;svg/html would be nice addition to the library.

Rebecca: Want list of what functions people are interested in, even the
current implements are messy.

Stephan: Previously the elders discouraged parallel implementations
manipulating MRSs. Reasons had to do with less certainty/stability in
the definition of the formalism (MRS as opposed to TFS), and in some
cases we know that the current version is imperfect in some ways. But no
one really has veto power on what others work on. It's really about
trade-offs: reusing code compared to the additional barrier to
entry/ability to attract multiple developers. As of 2011, there is an
emerging C++ collection of MRS-related functionality, would encourage
trying to pull that together into a reusable collection. As far as
making it a library: Some of the operations depend on a type hierarchy
(subsumption, transfer rules, MRS unification) --- should be the Sem-I's
type hierarchy, but approximating by using the grammar. Thus: should be
collected as an add-on to PET. Try to do what the Lisp code does and
match the API to the grammar-related functions. Sounds like Yi and
Rebecca would be willing to contribute. How can we organize that
process, to make sure that those who want contribute and have opinions
can do so.

Rebecca: Reason we haven't done it before is that we've been trying to
reverse engineer things that exist in Stephan and Ann's heads. Need the
two-way communication as a key part of the organization. I know that
there things in my code that is not right because of that.

Mike: Spoke with Ann at ACL and explained how it would be useful to have
a format specification for MRSs such that other implementations can be
assured that they are correct. She was receptive to the idea for MRS,
more hesitant for RMRS and DMRS. I got the impression that if I or
someone wrote up a specification and have her check it, she would do so.

Yi: Should be sure to support what uTool needs, too.

Prescott: Is DMRS a stable complete finished formalism?

Rebecca: Not convinced that that is the case.

Laurie: I don't know about the DMRS but brief discussion with Ann a few
months ago about whether it was possible to make changes to the MRS
structure given enough reason, and she said yes. So even basic MRS can
change.

Emily: But that shouldn't stop us from documenting how things are now.

... and we transitioned to the next discussion.

Last update: 2011-06-28 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/SuquamishDelphinLibMRS/_edit)]{% endraw %}