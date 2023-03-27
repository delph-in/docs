{% raw %}Cheetah is a grammar for German, meant to be used with either the LKB or
PET. It is comprised of a hand-written core grammar and a lexicon
derived from the [Tiger
treebank](http://www.ims.uni-stuttgart.de/projekte/TIGER/), and a 25k
sentence [\[incr tsdb()\]](http://www.delph-in.net/itsdb) treebank,
converted from the same Tiger treebank.

### The core grammar

The core grammar is heavily inspired by the following papers:

- Hinrichs, E. and Nakazawa, T. 1994. Linearizing AUXs in German
verbal complexes. In: German in Head-Driven Phrase Structure
Grammar.
- Müller, S. 2002. Complex predicates: Verbal complexes, resultative
constructions, and particle verbs in German.
- Crysmann, B. 2003. On the efficient implementation of German verb
placement in HPSG. In Proceedings of RANLP 2003, pages 112–116.
- Crysmann, B. 2005. Relative Clause Extraposition in German: An
Efficient and Portable Implementation. Research on Language &
Computation, 3(1):61–82.

Currently, the following phenomena are supported:

- Mittelfeld scrambling, verbal clusters
- Extraposition of complements, adjuncts, relative phrases and
comparatives
- Certain forms of ellipsis
- Passives

The core grammar contains a core lexicon, roughly containing all words
from closed word classes. It contains 550 lemmas.

More information on the internals of the core grammar can be obtained if
you contact me directly. Some documentation can also be found in my PhD
thesis (in preparation).

### Deep lexical acquisition

To obtain coverage, a deep lexical acquisition step has been carried out
on sentence 1-45000 of the Tiger treebank, mapping lemmas to detailed
lexical types. For verbs, around 200 distinct types are found for verbs.
Some rough stats on this step are:

|                    |            |                     |                        |
|--------------------|------------|---------------------|------------------------|
| **Part-of-speech** | **Lemmas** | **Lexical entries** | **Inflection triples** |
| Verbs              | 4543       | 9235                | 18745                  |
| Nouns              | 33835      | 34821               | 51303                  |
| Names              | 12445      | 12783               | na                     |
| Adjectives         | 7318       | 8018                | 50480                  |
| Adverbs            | 2654       | 4577                | na                     |

### The Savannah treebank

The grammar does not output proper MRSs (although it uses the same
format), but Tiger-like dependencies. By re-parsing the raw text from
the Tiger treebank, and annotating the best reading, an [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) treebank has been created. Of
the first 45k sentences in Tiger, 25k receive a dependency f-score
higher than 0.9.

Due to licensing issues, you can obtain the Savannah treebank only if
you or your institute has a license for the original Tiger treebank.
However, getting it is trivial for non-commercial use (just click the OK
button): [License
agreement](http://www.ims.uni-stuttgart.de/projekte/TIGER/TIGERCorpus/license/htmllicense.shtml).

### Results

Coverage of unseen Tiger text is about 60%, of which around 35% is exact
match (top-500) or 17% (top-1).

### Technical details

A typical run of the grammar would look as follows:

cat input.yy \| cheap -cm -yy -default-les=traditional -mrs=simple -packing=15 -nsolutions=1 -sm=sav-45k.mem -cp=300 german.grm 

The YY file will restrict with respect to the part of speech indicated
in the YY file, which is mandatory. Refer to types\_lexical.tdl to see
which parts of speech ought to be used. An example of an input YY file
is:

    (0, 0, 1, <0:3>, 1, "nach", 0, "null", "ADP" 1.0) (1, 1, 2, <5:20>, 1, "meinungsumfragen", 0, "null", "NN" 1.0) (2, 2, 3, <22:26>, 1, "liegt", 0, "null", "VFIN" 1.0) (3, 3, 4, <28:30>, 1, "der", 0, "null", "DET" 1.0) (4, 4, 5, <32:41>, 1, "parteilose", 0, "null", "ADJ" 1.0) (5, 5, 6, <43:54>, 1, "self-mademan", 0, "null", "NE" 1.0) (6, 6, 7, <56:58>, 1, "gut", 0, "null", "ADV" 1.0) (7, 7, 8, <60:61>, 1, "im", 0, "null", "ADP" 1.0) (8, 8, 9, <63:68>, 1, "rennen", 0, "null", "NN" 1.0) (9, 9, 10, <70:71>, 1, "um", 0, "null", "ADP" 1.0) (10, 10, 11, <73:75>, 1, "den", 0, "null", "DET" 1.0) (11, 11, 12, <77:86>, 1, "chefsessel", 0, "null", "NN" 1.0) (12, 12, 13, <88:89>, 1, "im", 0, "null", "ADP" 1.0) (13, 13, 14, <91:96>, 1, "weißen", 0, "null", "NE" 1.0) (14, 14, 15, <98:101>, 1, "haus", 0, "null", "NE" 1.0) (15, 15, 16, <103:105>, 1, "mit", 0, "null", "ADP" 1.0) (16, 16, 17, <107:109>, 1, "dem", 0, "null", "DET" 1.0) (17, 17, 18, <111:121>, 1, "amtierenden", 0, "null", "ADJ" 1.0) (18, 18, 19, <123:133>, 1, "präsidenten", 0, "null", "NN" 1.0) (19, 19, 20, <135:140>, 1, "george", 0, "null", "NE" 1.0) (20, 20, 21, <142:145>, 1, "bush", 0, "null", "NE" 1.0) (21, 21, 22, <147:149>, 1, "und", 0, "null", "KON" 1.0) (22, 22, 23, <151:153>, 1, "dem", 0, "null", "DET" 1.0) (23, 23, 24, <155:164>, 1, "demokraten", 0, "null", "NN" 1.0) (24, 24, 25, <166:169>, 1, "bill", 0, "null", "NE" 1.0) (25, 25, 26, <171:177>, 1, "clinton", 0, "null", "NE" 1.0)

### Other remarks

- There is the possibility to generate in principle, but this
functionality has never been tested on a large scale.

### Publications

- Bart Cramer and Yi Zhang. 2009. Constructon of a German HPSG grammar
from a detailed treebank. In: Proceedings of the ACL 2009 Grammar
Engineering across Frameworks workshop, pages 37-45, Singapore,
Singapore.
- Bart Cramer and Yi Zhang. 2010. Constraining robust constructions
for broad-coverage parsing with precision grammars. In: Proceedings
of COLING-2010.

<!-- -->


    @inproceedings{CramerZhang09,
      title={{Construction of a German HPSG grammar from a detailed treebank}},
      author={Cramer, B. and Zhang, Y.},
      booktitle={Proceedings of the GEAF workshop ACL-IJCNLP 2009},
      year={2009},
      pages={37--45}
    }
    
    @inproceedings{CramerZhang10,
      title={{Constraining robust constructions for broad-coverage parsing with precision grammars}},
      author={Cramer, B. and Zhang, Y.},
      booktitle={Proceedings of COLING 2010},
      year={2010},
      pages={{To appear}}
    }

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/CheetahTop/_edit)]{% endraw %}