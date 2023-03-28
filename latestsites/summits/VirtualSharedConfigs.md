{% raw %}# Shared Config SIG

7/14/2020

Host: Mike

Scribe: Glenn

Also present: Stephan, John, Woodley

MIKE: latest need came up with Francis' ltdb LTDB wants a config file
for building the database Configs - ace, pet, lkb, agree "not-quite TDL"
format proposal -- make it a little more compatible with TDL

GLENN: agree reads either pet or lkb format, (ignoring LISP in the
latter)

WOODLEY: disinclined to abandon existing format for backwards
compatibility unrealistic to share config amongst \*all\* processors
even the list of TDL files is not the same

MIKE: backwards-compat makes sense; first line could indicate
capabilities or version \#.\#\#

JOHN: example: English POS tagger is redundant for LKB relevance to
per-processor would need to either be ignored or flagged

GLENN: namespaces?

OE: tried to mimic namespaces concept in PET config

1. list of TDL files
2. parameterizing the processor

(lists parameter pseudo namespaces) \#1 may also differ from engine to
engine ERG has a handful of different overlapping configurations notion
of "conditional" configuration language aka C-preproc post-Oslo mandate
to formulate a proposal, did not occur

WOODLEY: any evidence for that?

OE: yes, on my laptop. Perhaps in favor of such a Universal Config
Mechanism Migrate gradually towards such UCM

WOODLEY: during transition, platform-specific version should point to
unified core, or the other direction.

MIKE: Proposal using existing TDL-ish...

- :begin-config-lkb
- ... :end-config-lkb

OE: Those blocks should be a case of the more general purpose
conditional mechanism. (to woodley: yes, more like "\#ifdef LKB ...
\#endif")

GLENN: AND/OR in the preprocessor is useful

OE: can we just use the C-preproc itself?

JOHN: having to do that on Windows wouldn't fill me with joy

GLENN: C\# does not have "\#undef". It makes implementation surprisingly
simpler.

MIKE: why again do we need this (disjunction/conjunction)

JOHN: current ERG example

WOODLEY: It's a concept that we want.

ALL: yes, agreed.

MIKE: LKB has embedded lisp code in the config file

WOODLEY: That rope for self-hanging gets used.

JOHN: But oh so handy.

WOODLEY/JOHN: Flexibility is good and should be encouraged, but only for
when necessary.

OE: But arbitrary macros are a bridge too far for the unified proposal

WOODLEY: That way lies madness.

JOHN: LKB will continue to use embedded LISP

OE/ALL: UCL common core will have no procedural facility

MIKE: Krieger/Schaefer TDL has syntax that could be adopted

WOODLEY: some config options may be interpreted differently per
processor i.e. quick-check, packing restrictor this is not necessarily a
problem but may confound expectations

JOHN: An instance of that regarding packing. PET has a bit vector that
controls packing options. Command line versus confg param setting

OE: That one can be set in either/both places. Setting bit flags is not
UI scalable, these should probably be broken out

JOHN: distinction: specifying the grammar vs. how the grammar is going
to be processed

WOODLEY: packing restrictor is an example of a config param everyone is
going to have This one doesn't affect correctness

JOHN: spanning-rules affect correctness.

ALL: this was originally intended as a performance feature

GLENN: ERG uses strongly

MIKE: \#if ACE\_VER\_123 && MY\_VAR1 ... \#endif

WOODLEY: We don't want that kind of clutter

OE: DELPHIN\_UCL\_DEFAULTS=....

MIKE: Don't necessarily need command line to specify different configs?

WOODLEY: Maybe Francis does...

GLENN: can get rid of user selecting the config via naming top-level
config file, multiple config files, with the generalized \#ifdef
mechanism

JOHN: Or do that inside-out...

WOODLEY: That's how Berthold does the GIG config currently

MIKE: Is everyone/anyone willing to do this work?

JOHN: I don't mind.

SOMEONE: Does PET need to continue to be supported?

WOODLEY: OE counts as a PET user.

JOHN: Dan used it two years ago.

GLENN: Again from C\#, \#ifdef variables can only be boolean ("defined"
or "not-defined"), i.e. there's no \#if MYVAR==3 or \#define MYVAR 999
(and still no \#undef...) Seems like we're converging on something like
this.

WOODLEY: what about not.

GLENN: It's bang ( ! ) and permitted

ALL: What parameters go into the common core?

OE: As such are agreed upon, there should be accompanying documentation
for each Common-core interest group (suppport group?). Perhaps create a
Microsoft-Github site for maintaining this documentation.

JOHN: Can we not use the Wiki for this? Github seems a bit heavyweight.

ALL: Wiki.

Discussion of file name extension. TDL? UCS? UC?

OE: Interpretation of file contents should not generally depend on file
extension. Seems fragile.

Discussion of ::begin-config ... ::end-config

OE: Now thinking all sublanguages could allow parameterization via
unified config. Conditionals within the sublanguages (including TDL?)?

Glenn: For that matter, can REPP language be rolled into this proposal?

OE/WOODLEY: Maybe (a lot) later

Discussion of 'conditionals everywhere'

JOHN: \#ifdefs should only be allowed at the top level?

OE: Feels like a complication

ALL: With 'conditionals everywhere' are we encroaching on CLIMB?

CONSENSUS: reluctance

Last update: 2020-07-14 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/VirtualSharedConfigs/_edit)]{% endraw %}