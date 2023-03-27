{% raw %}# Transfer in ACE

The [ACE](https://delph-in.github.io/docs/tools/AceTop) system provides some support for the
[LogonTransfer](https://delph-in.github.io/docs/tools/LogonTransfer) machine translation informalism. As of
version 0.9.11, it is possible to use ACE to translate some simple
sentences about dogs and cats from Japanese to English, using the JAEN
transfer grammar together with [JaCY](https://delph-in.github.io/docs/grammars/JacyTop) and the [ERG](https://delph-in.github.io/docs/erg/ErgTop).

# Technical Details

Transfer rules operate on MRSes. While some documentation of the process
exists in a technical note linked from [LogonTransfer](https://delph-in.github.io/docs/tools/LogonTransfer),
the documentation is unfortunately incomplete and insufficient to
uniquely determine the intended semantics of the .mtr rule description
files found in LOGON-style transfer grammars. This page discusses a few
of the fine points that I ran into while implementing transfer in ACE
(but cannot be considered a complete or even authoritative reference).

# Relationship between TDL and MTR formats

The .mtr file format is very closely related to the .tdl format. A
starting point is to think of .mtr files as analogous to the lexicon
files in a syntactic grammar (although the lexicon files are true TDL).

In the lexicon, each lexeme has a name, a type defined in other TDL
files providing the bulk of the constraints, and some additional local
constraints.

In a transfer rule set, each rule has a name, a type defined in other
TDL files providing the bulk of the constraints, and some additional
local constraints. The rule types for transfer are defined entirely in
TDL files, and those TDL files are interpreted entirely within the realm
of typed feature structures. However, the local constraints for transfer
rules are not interpreted in nearly as straightforward a way as they are
for a syntactic lexicon.

# Interpretation of Constraints in the OUTPUT Section

It is legal to write constraints on the OUTPUT section of a rule which
are not unifiable with parts of the rest of the rule with which they are
reentrant, e.g.:

    my_rule1 := some_type & [
    INPUT.RELS < [ PRED "dog_rel", ARG0 #x & x & [ NUM pl ] ] >,
    OUTPUT.RELS < [ PRED "chien_rel", ARG0 #x & x & [ NUM sg ] ] > ].

(Note that specifications like these that are ununifiable in the TFS
sense are disallowed in rule types (TDL files) -- they must be written
in the local constraints section of the MTR files.)

Here, the constraints in the INPUT section are used to determine where
the rule will apply, and the constraints on the OUTPUT section determine
the properties of the newly created or edited pieces of MRS.
Unfortunately, it is impossible to built a well-formed typed feature
structure (TFS) representing the entire rule, since the node tagged as
\#x is simultaneously \[ NUM pl \] and \[ NUM sg \]. To accommodate
situations like these, processors (both LKB and ACE) separate the
authored constraints into those that relate to the input and those that
relate to the output, and form two separate TFSes.

In ACE, for the version of the rule TFS used for rule matching, the type
information authored under the OUTPUT section of the rule is washed out
to \*top\* (but reentrancies with the rest of the rule remain). This
allows a self-consistant TFS representation of the rule to be used in
matching. All of the type information from the OUTPUT section of the
rule is copied out into a separate TFS, which has no reentrancies to the
rest of the rule. This is called the "output override" TFS, and the type
constraints contained in it are forcibly applied to the OUTPUT section
of a rule once it has been unified with a particular matching input MRS.
ACE is therefore (in theory) capable of handling reentrancies between
any parts of the TFS rule description (including variable properties, or
the REST of a list, for instance).

In LKB, rule matching is not performed by TFS unification. Instead, a
custom MRS unifier handles rule matching. Unifiability between different
MRS elements (predicate name, variable type, variable properties, HCONS,
whatever) are each implemented separately. This potentially gives more
control, although I'm not sure the LKB uses it. It also results in a
more finicky experience for the user, e.g. reentrancies on variable
properties don't happen to have been coded, and reentrancies on full EPs
is implemented with a special keyword +copy+ instead of with the
expected TFS-like syntax.

# The +copy+ Keyword

In MTR files, it is common to find rules that look like this:

    my_rule2 := some_type & [
    INPUT.RELS < [ PRED "dog_rel", ARG0.NUM pl ] >,
    OUTPUT.RELS < +copy+ & [ PRED "chien_rel", ARG0.NUM sg ] > ].

This has basically the same semantics as my\_rule1 above, with the
exception that any additional roles are treated as reentrant as well. In
ACE, the +copy+ keyword is treated as a syntactic variation, so the
above is identical to the following (which I believe the LKB would not
process):

    my_rule3 := some_type & [
    INPUT.RELS < #p1 & [ PRED "dog_rel", ARG0.NUM pl ] >,
    OUTPUT.RELS < #p1 & [ PRED "chien_rel", ARG0.NUM sg ] > ].

# Disclaimer

The above examples are not meant to represent any real phenomenon in
English-French translation.

Last update: 2013-02-06 by WoodleyPackard [[edit](https://github.com/delph-in/docs/wiki/AceTransfer/_edit)]{% endraw %}