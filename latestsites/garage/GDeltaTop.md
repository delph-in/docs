{% raw %}# gDelta

**gDelta** is a tool that aims to provide more immediate feedback on the
impact of changes made to DELPH-IN grammars by comparing parser output
from two different states of a grammar. It can be thought of as
functioning similar to a diff tool, allowing the comparison of two
different versions of the same grammar, but rather than comparing the
source code it compares parser output from both versions run over the
same test suites.

**gDelta** makes use of an attribute weighting algorithm for
highlighting grammar components (currently rule names and lexical types)
whose distribution in the parser output have been strongly impacted by
modifications to the grammar, as well as a technique for performing
clustering over profile items intended to locate related groups of
change. These two techniques are used to build an HTML interface which
can be viewed offline.

By providing a high-level picture of the impact that modifications to
the grammar has had, the hope is that grammar engineers can use
**gDelta** to more readily check if anything unexpected has happened as
well as confirm that desired changes have taken effect, earlier rather
than later in the grammar development cycle, before.

Other applications of **gDelta** that have been suggested but as of yet
unexplored:

- Tracking uncaught regressions by comparing successive versions of
grammars.
- Exploration of linguistic phenomena via investigating the impact of
systematically switching off types
- Grammar documentation

**gDelta** was created by NedLetcher,
TimBaldwin and RebeccaDridan.

The git repository for gDelta can be obtained
[here](https://github.com/ned2/gdelta).

## How to get it

Visit the **gDelta** is freely available under the
[MIT](http://mit-license.org/) License. You can get the latest version
thusly:

**gDelta** is intended to work for all DELPH-IN grammars. If your
grammar is not working or you are having any difficulties running
**gDelta**, contact NedLetcher.

## Installing gDelta

See the README.txt file for installation notes.

## Sample Output

Using **gDelta** to compare the gold profiles from the 1010 and the 1111
releases:

- [WeScience](http://nedned.net/gdelta_out/erg_1010-1111_ws_summary.html)
- [VerbMobil](http://nedned.net/gdelta_out/erg_1010-1111_vm_summary.html)

Using gDelta to investigate attempted changes to the ERG that resulted
in breakages (using [WeScience](https://delph-in.github.io/docs/garage/WeScience) profiles):

- [Breakage 1](http://nedned.net/gdelta_out/erg_b-b1_ws_summary.html)
- [Breakage 2](http://nedned.net/gdelta_out/erg_b-b2_ws_summary.html)
- [Breakage 3](http://nedned.net/gdelta_out/erg_b-b3_ws_summary.html)

Using gDelta to investigate the impact of changes made to Jacy from its
development history (using profiles from the Tanaka corpus):

- [Revisions
420-421](http://nedned.net/gdelta_out/jacy_420-421_tc_summary.html)
- [Revisions
433-434](http://nedned.net/gdelta_out/jacy_433-434_tc_summary.html)
- [Revisions
446-447](http://nedned.net/gdelta_out/jacy_446-447_tc_summary.html)

Last update: 2016-02-04 by NedLetcher [[edit](https://github.com/delph-in/docs/wiki/GDeltaTop/_edit)]{% endraw %}