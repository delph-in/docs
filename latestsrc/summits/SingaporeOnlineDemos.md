{% raw %}## Demophin demo

Mike doing a demo of demophin.py

- Instructions on how to install.
- Discussion on assumptions regarding setup.
  - Eg ace version must match that the grammar was compiled with.
  - Improvements to demophin.py (and other tools that use ACE) is
passing on this kind of error message to the user for
robustness.

## Discussion

Woodley: how does one go about dropping drms drawing into another app
such as the FFTB?

Mike: Very possible, just need to call the right python function on the
server to generate a json object which there is javascript code to
parse/render.

Woodley: What is the formal status of converting to DMRS from a partial
MRS? Mike: It should work, or if not, can get it to work in short order.

Woodley: do we foresee this eventually replacing the existing web demos?

Mike: Possibly? That was not the idea, however open to this -- but
obviously many features need to be added. Would need assistance.

Mike: TJ Trimble is also working on a fully featured browser-based IDE
using LUI.

Guy: There is the problem of having all these different modules being
implemented multiple times in different codebases.

Mike: Demophin has a separation of server from visualisation. Need to
keep the visualisers separate from the server functionality.

Ned: Some people have been asking about the (semi) interactive trees
from Typediff. These are generated using JSON produced by C code that
calls ACE libraries to generate a both short and long labelled trees
along with character spans of nodes. Would be nice on explicitly
supporting this.

Woodley: What exactly is the concern with the current setup?

Ned: That by hooking into ACE libraries, later changes by Woodley might
break this setup.

Woodley: Making new programs that link to ACE libraries is a common
pattern that I make use of. Happy to declare the functionality of
reading in a derivation tree and reconstructing the graph stable and
unlikely to change.

Perhaps we should look at creating a repository for modules providing
different kinds of visualisations of DELPH-IN data structures. These
could be composed of server side generation (producing JSON or other
exchange format) and client side (Javascript) rendering pairs.

Petter: What about if I want ACE to generate the full AVM?

Woodley: You can kind of get that using the lui interface (it's a bit of
a hack) however this is the trimmed AVM without all the daughters. Some
extra work will be required in order to get the full AVM (and also make
it more accessible). Will work on this (??).

Woodley: Additionally, the --report-labels flag could be useful to
people. Currently --report-labels only provides the short labels (and
not the longer labels/token mapping information etc derivation), however
no one seems to be depending on this so perhaps this could be changed to

Dan: popular request is parsing/representing longer chunks of text with
possibly multiple sentences. How should these be represented? A sequence
of top-ranked parse trees? Perhaps looking at linking discourse entities
(a la discourse representation structure)? It would be nice to paint a
bigger picture.

Woodley: DELPH-IN doesn't have much to say about larger discourse
structures.

Dan: Yes but if we had some kind of representation with missing
information/linkages, this could help motivate working towards these
sorts of problems, and also entice people working more with discourse
related frameworks into our ecosystem.

(Discussion of future features for demophin, missed this.)

Dan: From the perspective of making our infrastructure more appealing,
it would be nice to produce a consistent front door to the various
windows of different kind of analyses.

Dan: We have various people working on interfaces/visualisations at the
moment, using modern technologies, perhaps they could join forces in
some way?

Mike: I would be happy to moderate/curate this collaboration if other
people are willing to submit features.

Ned: should this be located within the demophin repository?

Mike: It would be nice to keep the visualisers separate from the server.
Also people outside of DELPH-IN might like to use the DMRS visualisation
so keeping it separate would be advantageous.

Tuan Anh: There is also the DMRS viewer that Francis and I made.

Dan: is this simply a different skin on the kind of thing that demophin
is doing?

Mike: looks a bit different. Also using a different javascript graphics
library.

Dan: How long is it going to take to enact these plans?

Ned: Do we want this to be geared more towards a unified demo or also
multiple server/viewer pairs which can be dropped into other apps.

??: Both... but don't worry too much about locking in a standard. If
there are modules that people find useful then hopefully they will use
them.

Woodley: We shouldn't expect there to be only eg one tree viewer.
Multiple solutions should be encouraged in this package.

Also, the JSON (or whatever exchange format) shouldn't be standardised
across different visualisers. The server side code and client side pairs
should just target each other.

Mike: Suggest creating a new package in the DELPH-IN group for the
various visualisers.

Woodley??: Would also be nice to have latex generators for various data
structures.

Chris: I can put my hand up for being responsible for latex generation
--- need this for my own research (and have funding).

Last update: 2015-08-06 by NedLetcher [[edit](https://github.com/delph-in/docs/wiki/SingaporeOnlineDemos/_edit)]{% endraw %}