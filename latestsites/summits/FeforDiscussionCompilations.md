{% raw %}This page is just a place to keep the notes we took in creating the
discussion topics for the Fefor meeting.

# Discussion Topics

A compilation of the topics proposed by participants. Overlapping topics
have been merged. Some of the topics looked more requests for talks by
others, and have been categorized as such. This classification gives an
initial proposal about which session to put each discussion into. No
attempt has been made to align this with
[FeforProcessors](https://delph-in.github.io/docs/summits/FeforProcessors) yet. \[ see AAC notes \]

## For Plenum

- /MRSs in translation and the prospects for MRS-based interlinguas vs
MRS-based transfer (Lars Ahrenberg; volunteer) \[ AAC - better in
[FeforRmrs](https://delph-in.github.io/docs/summits/FeforRmrs)? \]
- interfaces to ontologies (Anette Frank) \[ AAC -
[FeforRmrs](https://delph-in.github.io/docs/summits/FeforRmrs) \]
- finer-grained lexical semantics (Anette Frank) \[ AAC -
[FeforRmrs](https://delph-in.github.io/docs/summits/FeforRmrs) \]
- /Whether to propose an ACL SIG on deep linguistic processing (Emily
Bender)
- FSPP (simple preprocessor) module, usage in specific grammars;
preprocessors; preprocessor implementation and integration (Ben
Waldron; Francis Bond; Ulrich Schaefer) \[ AAC -
[FeforProcessors](https://delph-in.github.io/docs/summits/FeforProcessors) \]
- large lexica and LexDB (Ben Waldron; Francis Bond) \[ AAC -
[FeforProcessors](https://delph-in.github.io/docs/summits/FeforProcessors) \]
- /Lexical acquisition, esp. for immature grammars (Emily Bender)
- automated testing (Francis Bond; Ulrich Schaefer) \[ AAC - initial
session in [FeforProcessors](https://delph-in.github.io/docs/summits/FeforProcessors) \]
- grammar interfaces: clear interface for robustness-related grammar
elements (paths/types/pos-tags/expected tokenization/punctuation
etc.) e.g. specified in the inline documentation in such a way that
it could be processed/extracted automatically from grammar sources
(Ulrich Schaefer) \[ AAC - initial session in
[FeforProcessors](https://delph-in.github.io/docs/summits/FeforProcessors) \]
- /how strong is the desire for discontinuous parsing as an option? an
implementation could actually be straightforward, but what is needed
in terms of the formalism and processing efficiency? (Stephan Oepen)
- /how do grammarians and developers feel about a limited library of
relational constraints? would we know how to provide, say, basic
list and maybe set functionality? (Stephan Oepen) \[lists yay sets
ick --EB\]
- we should review the [ToDo](/ToDo) list(s) from previous meetings
and make sure we maintain a shared inventory of known issues and
candidate extensions (Stephan Oepen) \[ AAC - see
[OpenissuesTop](https://delph-in.github.io/docs/summits/OpenissuesTop) proposal \]

## Candidates for discussion topics in Grammarians session

### (R)MRS details

\[ AAC - see [FeforRmrs](https://delph-in.github.io/docs/summits/FeforRmrs) \]

- MRS design issues
  - Pondering the constraint that all noun-relations must have an
associated quantifier, in light of languages that don't ever (or
hardly ever) express quantifiers overtly within NPs (Emily
Bender)
  - Inserting pronoun-rels v. leaving unbound indices in pro-drop
(Emily Bender)
  - encoding of information structure and general discourse-level
bits of information; context modeling in (R)MRS: anaphora, ...;
reprsentations of discourse status that improve on current
def\_q\_rel mess (Stephan Oepen; Anette Frank; Emily Bender)
- MRS well-formedness conditions (Ben Waldron)
- messages: what are they good for? (Francis Bond)
- the status of the HOOK.INDEX in MRS/RMRS (Francis Bond)

### Other

- Best practices for documenting grammars (Emily Bender)
- questions/requests that have emerged out of Sara's work on the BiTSE
grammar, and may be linked to priorities in the development of the
Matrix, such as empty elements, trigger rules for empty elements,
and support for lexemes with more than one semantic relation (Lars
Ahrenberg)
- Evaluation: for instance, in Lisbon one proposal in relation to
semantics was to have a test suite of sentences created, which would
then be translated into all the languages currently in use in
DELPH-IN, in order to be able to have a better overview of the
semantic representations and see whether these could be further used
in parallel in applications; design, availability and uses for
cross-linguistic evaluation resources, particularly semantics-based
resources (Valia Kordoni; Laurie Poulson) \[ AAC - MRS test suite in
[FeforRmrs](https://delph-in.github.io/docs/summits/FeforRmrs) \]

## Candidates for discussion topics in Processors session

see [FeforProcessors](https://delph-in.github.io/docs/summits/FeforProcessors)

- LKB/PET compatibility issues (Ben Waldron)
- Shared configuration between LKB/PET: reducing and documenting the
globals (Francis Bond)
- standoff annotation interface standard (Ben Waldron)
- coordination/discussion on SMAF (Ulrich Schaefer)
- PET API: proposal and discussion (Ulrich Schaefer)
- for the german grammar, chart dependencies are used heavily but the
current LKB and PET behavior differs. maybe we should try to
identify an appropriate generalization and implement it (Stephan
Oepen) Please see discussion on developers list - AAC.
- with the german grammar, ambiguity packing is far less effective
than for the ERG (or JaCY, for all i know); berthold would like to
see a richer restrictor mechanism. related to this, in generation he
cannot combine packing and index filtering correctly, because some
PVP fronting cases (seemingly) obscure indices too early (Stephan
Oepen)
- both berthold and dan have been interested in modifier attachment
underspecification for a while; i expect a good solution may need
support in the processors and new types of MRS post-processing; can
we set things up for generation from underspecified inputs? (Stephan
Oepen) \[ AAC - [FeforRmrs](https://delph-in.github.io/docs/summits/FeforRmrs) \]

## Correspond to Talks

- snapshot of where the different grammars are at, in terms of lexical
items, lexical types, etc., but also development of treebank data,
generation, production of MRSs, compatibility with the Matrix, etc
(Tim Baldwin)
- multilingual grammar engineering issues (Ben Waldron) \[? Not sure
what this means --EB\]
- Matrix plans (when will there be a new release? what will it
contain?) (Francis Bond; Valia Kordoni)
- how morphology is handled in the different languages; morphology
module; Morphology: recent developments in LKB; treatment of
morphology in the other grammars, especially the "newer" ones (Tim
Baldwin; Ben Waldron; Valia Kordoni)

# Would welcome tutorial on:

\[ see [FeforProcessors](https://delph-in.github.io/docs/summits/FeforProcessors) - AAC \]

- Heart of Gold (Tim Baldwin, Lars Ahrenberg, Francis Bond, Stephan
Oepen)
- Lexical Database (Tim Baldwin, Lars Ahrenberg)
- \[incr tsdb()\] (Lars Ahrenberg)
- PET (Lars Ahrenberg)
- DELPH-IN web demo (Francis Bond, Emily Bender)
- SEM-I (Emily Bender)

# Willing to provide tutorial on:

\[ see [FeforProcessors](https://delph-in.github.io/docs/summits/FeforProcessors) - AAC \]

- how to define SDL cascades in HoG or general HoG intro or
'installation party' (Ulrich Schaefer)

Last update: 2006-06-01 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/FeforDiscussionCompilations/_edit)]{% endraw %}