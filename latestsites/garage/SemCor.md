{% raw %}**SC corpus sense annotation alignment**

SC corpus has now been automatically aligned to the SemCor sense
annotations. The alignment process found realpred or gpred matches for
96.3% of SemCor word forms. The remaining word forms were either mapping
to elements treated by the ERG as semantically empty (e.g., copulas), or
treated as MWE by the ERG but not by [WordNet](/WordNet) (‘such+as’,
‘right+then’, ‘not+even’)

- (part of the work on [Lexical Semantics](https://delph-in.github.io/docs/garage/LexsemTop)).

However, only 36.3% of the ERG predicates emerged as sense-tagged: 55.6%
of realpreds and 11.3% of gpreds.

The alignment program generated modified DMRS files, with an optional
&lt;sense&gt; element:

    <node nodeid='10002' cfrom='0' cto='6'>
       <realpred lemma='first' pos='a' sense='1'/>
       <sortinfo cvarsort='e' sf='prop' tense='untensed' mood='indicative' prog='minus' perf='minus'/>
       <sense wn='2' lexsn='5:00:00:ordinal:00' wn_lemma='first'/>
    </node>

The sense-annotated DMRS output is available
[here](https://sites.google.com/site/zpozen/clms-thesis)

There is also an updated dmrs.dtd and
[SemCoreMapping](/SemCoreMapping).csv: a mapping from each SC corpus
item to the annotated SemCor 3.0 concordance, context, and sentence
number.

[Semcor
data](http://lit.csci.unt.edu/~rada/downloads/semcor/semcor3.0.tar.gz)
from [Rada Mihalcea](http://www.cse.unt.edu/~rada/downloads.html)

:warning:

Last update: 2013-10-25 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/SemCor/_edit)]{% endraw %}