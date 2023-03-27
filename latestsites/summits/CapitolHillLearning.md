{% raw %}A discussion of using delph-in tools for langauge learning, plus a brief
intro to the new work Sanghoun is doing.

Discussion at the [2017 Grammar Engineering Meeting](https://delph-in.github.io/docs/summits/CapitolHillTop) led
by SanghounSong, scribed by FrancisBond.

3 topics (SSH)

- using the ERG to help people
- mal-rules
- how to learn mal-rules from leaner's corpora
  - from parallel text, from corpora
- how to group by learner type
  - model for different learner types (e.g. Korean Native vs Chinese
Native learning English)
  - do we have enough data?

LMC: there is a nice learner corpus, [Lang-8 Learner
Corpora](http://cl.naist.jp/nldata/lang-8/), (many pairs of L1 and L2)
crawled from the lang8 website

SSH has 320,000 sentences written by Korean Uni Students

- focusing on verbs
- some metadata per student (grade, age, gender, experience)

Sanghoun has parsed them all with the ERG and has a nice tool showing
the results. ERG 1214; &lt;80%

All sentences are then annotated, correcting if necessary, adding
information if necessary. People can add comments and add some set
annotation (irrelevant, ...). There are some issues with the low English
level of the annotators.

They are trying to document the learner language as though it were a new
language.

WDP: similar to trying to learn the long tail of wierd sentences.

LMC: if all you are doing is trying to identify that there is an error,
then it may be easier. Hard to learn rules if you need to reconstruct
the MRS.

FCB: can we say this is typically learner vs this is good prose? By e.g.
comparing n-grams?

WDP+MWG: could lead to changing meaning if you compare too much.

SSH: coverage is higher than expected, because sentences are short
vocabulary size is small, ... In the errors, typos are common.

It would be good to try to find typos and parse them: unknown word
handling is still a problem -- it guessed noun to often (WDP: and many
typos create good words, especially for short (2 character) words).

LMC: We are trying to identify errors, without necessarily correcting
them for our tool.

SSH: can I use the educ/ subdirectory in the ERG.

DPF: you should!

There was some discussion of vocabulary restriction --- in general Dan
and SH allow people to type, so need an open vocabulary and some unknown
word handling.

SSH: is Zhong useful for this? (parsing learners' text) ZZ+FCB: yes

SSH: I would like to do this for Korean.

LMC: can we learn in the Miyao style (from a corpus)

FCB: Not really, there is a lot of work in annotating the corpus and
writing the conversion rules.

WDP: ace can now run a pcfg for ungrammatical sentences (c-saw) which
can be a bit slower but is very robust

ALL: show us how to use it and train our own models, please.

???: when you ran the robust parser, what constraints were broken? learn
from there! You need the unification failure results

FCB: I think Sanghoun should first run the mal-rule enhanced grammar and
see if we need to learn many more rules before trying to learn rules
automatically.

DPF:

- use educ /e-duck/ first. Try the trunk version
- try using c-saw
  - --- needs some documentation and a model (WDP)

SSH: can we used type-diff

ALL: it is a bit difficult if one does not parse, but we could try to
compare results from csaw with typediff

    http://sweaglesw.org/linguistics/csaw/
    http://www.delph-in.net/2016/packard.pdf
    
    PCFGs for ERG-1214:
    
    http://sweaglesw.org/linguistics/csaw/download/
    
    command-line option
    --pcfg=something.pcfg 

See [AceCsaw](https://delph-in.github.io/docs/tools/AceCsaw) for more information.

Last update: 2017-08-11 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/CapitolHillLearning/_edit)]{% endraw %}