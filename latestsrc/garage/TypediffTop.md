{% raw %}# Typediff

Typediff is a tool that enables rapid exploration of the types used in
the processing of input by DELPH-IN grammars. Its intended use case is
identifying types associated with the implementation of the analysis of
specific linguistic phenomena. Besides phenomena investigation, Typediff
could also be useful for grammar documentation, exploring unfamiliar
grammars, and comparing different versions of the same grammar. If you
find Typediff useful, feedback on your particular use case and how you
used Typediff would be very much appreciated.

A live installation of Typediff can be found
[here](http://hum.csse.unimelb.edu.au/typediff/), which currently
supports the following grammars:

- [ERG](http://www.delph-in.net/erg/)
- [Jacy](https://delph-in.github.io/docs/grammars/JacyTop)
- [GG](http://gg.opendfki.de) (although tokenisation is currently
broken with ACE)
- HaG
- [NorSource](https://delph-in.github.io/docs/grammars/NorsourceTop)
- [INDRA](https://delph-in.github.io/docs/grammars/IndraTop)
- The three [Zhong grammars](https://delph-in.github.io/docs/grammars/ZhongTop)

The source for Typediff is available on
[GitHub](http://github.com/ned2/typediff).

Typediff uses ACE for parsing, and should be compatible with any
DELPH-IN grammar that has been configured to work with ACE. Many thanks
to Woodley Packard for his assistance with using the ACE engine to
extract the data needed to power Typediff.

## How it Works

Users enter any number of input items into the A items set and the B
items set. Each input item is parsed (with ACE) and then for each
selected reading, every type that appears in the full AVM is extracted.
The difference of the sets A and B is then computed such that Typediff
will return all types used to process the A items that were not used by
the B items. For investigating phenomena, this diffing approach works
best when you can identify "minimal pairs" of sentences, as otherwise
unrelated types from the positive sentences will appear as noise in the
output. If the phenomenon you wish to investigate does not lend itself
to having such pairs, you can try adding additional sentences to the B
items to filter out noisy types from the A items. Some example input
that could be used to explore right-node-raising might be:

A: We relied on and hired consultants.\
B: We relied on consultants and we hired consultants.

## Example Diffs

Here are some example inputs attempting to pinpoint specific phenomena
within the ERG:

- [Right node
raising](http://hum.csse.unimelb.edu.au/typediff/#count=10&treebank=redwoods1214&labels=short&tagger=ace&mode=difference&supers=false&fragments=true&Agrammar=erg&A=We%20relied%20on%20and%20hired%20consultants.&Bgrammar=erg&B=We%20relied%20on%20consultants%20and%20we%20hired%20consultants.)
- [Passive](http://hum.csse.unimelb.edu.au/typediff/#count=10&treebank=redwoods1214&labels=short&tagger=ace&mode=difference&supers=false&fragments=true&Agrammar=erg&A=The%20dog%20was%20bitten%20by%20the%20catfish.&Bgrammar=erg&B=The%20catfish%20bit%20the%20dog.)
- [It-clefting](http://hum.csse.unimelb.edu.au/typediff/#count=10&treebank=redwoods1214&labels=short&tagger=ace&mode=difference&supers=false&fragments=false&Agrammar=erg&A=It%20was%20with%20considerable%20misgivings%20that%20they%20accepted%20the%20position.&Bgrammar=erg&B=They%20accepted%20the%20position%20with%20considerable%20misgivings.)

## Using Typediff

Typediff is a browser-based interface as well as having a command line
tool. The web interface has been tested on Chrome and Firefox and
definitely **won't** work on versions of Internet Explorer &lt; 9. There
is a [live
version](http://hum.csse.unimelb.edu.au/grammalytics/typediff/) of the
web interface (hosted at The University of Melbourne) or you can
[install it locally](http://github.com/ned2/grammalytics).See the
README.md file for installation instructions.

Last update: 2015-09-17 by NedLetcher [[edit](https://github.com/delph-in/docs/wiki/TypediffTop/_edit)]{% endraw %}