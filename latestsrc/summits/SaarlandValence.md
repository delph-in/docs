{% raw %}## DELPH-IN meeting 2013: SIG on cross-linguistic Valence repositories

### Lars Hellan

Delph-In-grammars typically have ‘complete’ verb-valence repositories,
with a shared design, albeit not necessarily with the same type
inventories – of course reflecting linguistic differences, but also
differences in notational systems.

It will be an interesting linguistic resource if these repositories can
be aligned, and useful for many purposes.

A way of 'operationalizing' such an alignment may be the creation of a
multilingual valence database; the link below leads to a newly created
such (technically constructed by Tore Bruland and me, using
independently created resources), so far with three members, Norwegian,
Spanish and Ga:

<http://regdili.idi.ntnu.no:8080/multilanguage_valence_demo/multivalence>

The best strategy for creating an aligned repository is presumably
through the design of a ‘neutral’ notation, to which all the systems can
map in equal fashion, and which is more friendly to the ‘human eye’ than
many of the grammar internal codes; in particular it need not be
restricted to the tdl format. The demo tries to implement this idea. An
explanation of the demo, along with some of the material used in
creating it, is found at
<http://typecraft.org/tc2wiki/Multilingual_Verb_Valence_Lexicon>.

In principle only one file has to be created, namely a conversion from
the grammar's lexical type inventory to the labels corresponding to it
in the database and web demo. Together with the lexicon of the grammar,
this file is sufficient for populating the database.

For ‘new’ languages, some code extensions will be called for – for
instance, for Spanish, phenomena that immediately come up as distinct
from Norwegian are ‘pro-drop’, clitic doubling, and the use of ‘à’ as a
marker of objects.

To be done:

- In the Ga demo, each lexical item has an example, since this lexicon
file comes from a Toolbox

project. In the Norwegian demo, there only is a representative example
for the type in question; which is a bit bleak. I would be good if the
slot Examples can be either populated, or occupied by hyperlinks to
repositories with annotated examples (like [TypeCraft](/TypeCraft)), or
even to parsers.

- The format of the demo does of course not require that the lexical
types and resources come from

a grammar; it just is the enterprise considered presently. (Indeed, if
filled in via some other route, a grammar might be partially
constructible from the information there.) Among potentially interesting
alternative provenance routes is the database of the ‘Leipzig Valency
Classes project’ (acronym ‘ValPaL’), which will be accessible to free
download from coming October on; interoperability between the systems
has not been explored yet. Toolbox projects are another type of
‘sources’, also when not sifted via a grammar (as it is in the present
case – Bender et al 2012 describe another Toolbox-LKB conversion that
perhaps could be tried in the present setting of ‘being sifted through a
grammar’).

An additional thing that can be done, once valence codes of different
grammars are mapped onto a common code:

- Developing parallel testsuites, indexed according to the common
code.

Something that perhaps could be done:

- Using the valence-bank in MT, for instance via a strategy of first
identifying possible meaning

equivalents (via aligned [WordNet](/WordNet), for instance), then search
if any of them match in valence, and then – if so - do ‘isomorphic’
transfer as a first choice.

Well, these are possibilities, among many more …

Lars 270913

Last update: 2013-09-27 by LarsHellan [[edit](https://github.com/delph-in/docs/wiki/SaarlandValence/_edit)]{% endraw %}