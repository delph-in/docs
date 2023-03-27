{% raw %}# Background

In July 2010, at the time of the annual DELPH-IN Summit (see the
[ParisTop](https://delph-in.github.io/docs/summits/ParisTop) page for background), a new tagged release of the
LOGON infrastructure (see the [LogonTop](https://delph-in.github.io/docs/tools/LogonTop) page for details) is
being made available. This page documents (some of) the updates and
extensions provided in this snapshot.

# Release Schedule

The proposed schedule is to freeze development on August 16, and
complete general availability by August 31. Module developers who want
to contribute updates of their components in the LOGON tree, please
contact Stephan Oepen. In the last two weeks of August, we will depend
on component developers to assist in testing various functionalities.

# Changes in this Release

Following is an incomplete list of revisions included in the *Paris*
snapshot of the LOGON tree:

- harmonization of LKB and \[incr tsdb()\] code with the DELPH-IN SVN
trunks;
- updates to REPP characterization, including critical bug fix for
Hag;
- bug fix in SPPP (interface to FreeLing) addressing multiple
punctuation marks (oe);
- increased granularity in \[incr tsdb()\] treebanking timestamps;
- ERG version 1004 (corresponding to initial [WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods)
release);
- up-to-date versions of SRG and FreeLing (montse, oe, lluis);
- migrate general [FreeLing](/FreeLing) files into upc/ sub-tree
(montse);
- audit and revise licenses (fcb & oe)
- add new Japanese transfer grammar ([JaJa](/JaJa)) (fcb)
- update GG, including new models (now as SVN external) (berthold &
peter)
- up-to-date version of HaG (berthold);
- minor updates to JACY (fcb)
- (temporary) new cheap binary ncheap with chart pruning;
- inclusion of external PCFG training scripts (bart);
- experimental support for forthcoming ERG version (1007)
- new Pango-enabled LUI by default (documentation needs updates)

Last update: 2010-07-08 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/LogonParis/_edit)]{% endraw %}