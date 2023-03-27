{% raw %}# Notes from discussion on Corpus Look Up and LTDB integration

Discussion at [Tomar](https://delph-in.github.io/docs/summits/TomarTop) on how we can further extend the
[Lexical Type database](https://delph-in.github.io/docs/garage/LkbLtdb) with other resources for looking up
results (led by Francis and scribed by Bec).

**FCB:** LTDB intro pseudo xml in grammar to document, with examples
from treebanks

**from Montse:** why only lextype?

**FCB:** no reason, coming what else to do? link to RDF store, or
fangorn, or? local is good for robustness, but not as flexible

add type hierarchy to RDF to be queried? can query poss\_rel or
potential for ex

respond to queries on list like all japanese irregular verbs, raise
delphin profile

look for double prefix (un - re- x)

what is best example? shortest? by corpus?

is a common query page/service useful? what else do people want?

**bec:** type lookup already possible, by url

**oe:** fcb ambitious, rdf capable of representing semi, could be
predicate hierarchy too, coming RSN, can sort of in fingerprint language

**wp:** wild star surface string doesn't quite get it

**oe:** clickable fingerprint in ESD, integrate with LTDB, need an
agreement RDF store will be up/stable/maintained, fangorn too? need to
consider inside/outside view

**eb:** integrate treebanks into descriptive grammar, want the inside
view

**tim:** fangorn is inactively developed

**eb:** mix and matching syntax and semantics in query

**tim:** example sentences - protypical for dictionary is different from
prototypical to grammar, perhaps needs more research

**fcb:** i agree

**fcb:** also link to lex semantics (WN) or senses

**eb:** how to set up ltdb for a grammar?

**fcb:** easy, mostly documented, i can help. will do it for mandarin
soon. possibly add type to matrix types. who uses LTDB?

tim, francis, dan, bec, woodley, oe

**wp:** the full forest treebank links to LTDB

**tim:** typediff-&gt;fangorn also links to LTDB and something else

**oe:** query re hpsg test suite, csli test suite. sent link
(erg.delph-in.net) to items in treebank. pieces of \[incr() tsdb\]
available from web demo

**fcb:** could link LTDB to same place, rather than static

**oe:** got web traffic

**fcb:** sg government blocks something necessary to get there

**fcb:** encourage grammarians to set it up

**dan:** ran script on new version erg - works fine?

Last update: 2014-07-17 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/TomarCorpusLookup/_edit)]{% endraw %}