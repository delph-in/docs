{% raw %}# Page Status

This page presents user-supplied information, hence may be inaccurate in
some details, or not necessarily reflect use patterns anticipated by the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) developers. This page
was initiated by FrancisBond; please feel free to make
additions or corrections as you see fit. However, before revising this
page, one should be reasonably confident of the information given being
correct.

# Overview

The [\[incr tsdb()\]](http://www.delph-in.net/itsdb) environment is a
tool for grammar and system profiling and treebanking. Some people find
its name hard to pronounce, especially novice users. It is meant to be
pronounced as though it were written *tee ess dee bee plus plus*.
Nicknaming the system is discouraged by the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) developers.

The DELPH-IN ‘developers’ [mailing
list](http://lists.delph-in.net/mailman/listinfo/developers) is a good
forum for [\[incr tsdb()\]](http://www.delph-in.net/itsdb)-related
discussion; additionally, there is a user-contributed [wish
list](https://delph-in.github.io/docs/tools/ItsdbWishlist).

The current best citation for this is:

Oepen Stephan, Flickinger Daniel (1998) Towards systematic grammar
profiling. Test suite technology ten years after. *Journal of Computer
Speech and Language* 12 (4) (Special Issue on Evaluation):411 – 436

There is a slightly out of date but still useful [User Manual
(pdf)](http://www.delph-in.net/itsdb/publications/manual.pdf). Useful
documentation for people looking to manipulate the 'raw' profiles (i.e.
tsdb(1) databases) without the GUI (but not using cut and grep) can be
found in the [TSNLP User Manual (Volume
2)](http://www.delph-in.net/tsnlp/ftp/manual/volume2.ps.gz). Some more
(user-supplied) information about TSDB is available at
[TsdbTop](https://delph-in.github.io/docs/tools/TsdbTop).

## Installation

The automated installation procedure explained on the
[LkbInstallation](https://delph-in.github.io/docs/tools/LkbInstallation) page includes [\[incr
tsdb()\]](http://www.delph-in.net/itsdb). To invoke [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) if you've installed the system
this way:

       M-x lkb RET
       M-x itsdb RET

\* [ItsdbProfileManipulation](https://delph-in.github.io/docs/tools/ItsdbProfileManipulation)

\* [ItsdbProfile](https://delph-in.github.io/docs/tools/ItsdbProfile) - brief introduction to the profiles

\* [ItsdbProfiling](https://delph-in.github.io/docs/tools/ItsdbProfiling)

- \- [ItsdbDistributedProcessing](https://delph-in.github.io/docs/tools/ItsdbDistributedProcessing)

\* [ItsdbTreebanking](https://delph-in.github.io/docs/tools/ItsdbTreebanking)

\* [Batch Processing](https://delph-in.github.io/docs/tools/ItsdbBatch)

\* [ItsdbCustomization](https://delph-in.github.io/docs/tools/ItsdbCustomization)

\* [ItsdbReference](https://delph-in.github.io/docs/tools/ItsdbReference)

\* [ItsdbTroubleshooting](https://delph-in.github.io/docs/tools/ItsdbTroubleshooting)

## Debugging Aids

### MRS Checking

If your profile has MRSs scored, you can check whether they scope or not
by setting the switch *Options \| Result Filter \| Mrs Scoping* and then
browsing the results: *Browse \| Results*. Helpful diagnostic messages
should be ouptut in the \*common-lisp\* buffer.

Note, if you have too many results stored, then this will be either very
slow, or crash. You should only really do it for profiles with 1 or 2
results per item.

## Misc

There is a macro for writing [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) in the wiki:
&lt;&lt;itsdb&gt;&gt;.

Last update: 2020-07-31 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ItsdbTop/_edit)]{% endraw %}