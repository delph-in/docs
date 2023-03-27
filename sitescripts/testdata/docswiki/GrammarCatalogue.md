Add metadata about your grammars here. See
[below](/GrammarCatalogue#GeneratingMetadata) for instructions on
generating metadata.

|                                                                          |                                                        |                                              |
|--------------------------------------------------------------------------|--------------------------------------------------------|----------------------------------------------|
| Name                                                                     | Language                                               | Maintainer                                   |
| *Resource Grammars*                                                      |                                                        |                                              |
| [English Resource Grammar (ERG)](#ERG)                  | English                                                | [DanFlickinger](DanFlickinger)               |
| [Jacy Japanese Grammar (Jacy)](#Jacy)                   | Japanese                                               | [FrancisBond](FrancisBond)                   |
| [GG](#GG)                                               | German                                                 |                                              |
| [SRG](#SRG)                                             | Spanish                                                | [MontserratMarimon](/MontserratMarimon)      |
| [LXGram](#LXGram)                                       | Portuguese                                             | [AntonioBranco](AntonioBranco)               |
| [KRG](#KRG)                                             | Korean                                                 | [JongBokKim](JongBokKim)                     |
| MGRG                                                                     | Modern Greek                                           | [ValiaKordoni](ValiaKordoni)                 |
| [NorSource](NorsourceTop)                                                | Norwegian                                              | [LarsHellan](/LarsHellan)                    |
| [G-CLIMB German](#GMG)                                  | German                                                 | [AntskeFokkens](AntskeFokkens)               |
| *Treebank-trained grammars*                                              |                                                        |                                              |
| [Cheetah](#Cheetah)                                     | German                                                 | [BartCramer](BartCramer)                     |
| *Medium-sized linguistic grammars*                                       |                                                        |                                              |
| La Grenouille                                                            | French                                                 | [JesseTseng](JesseTseng)                     |
| [MCG](#MCG)                                             | Mandarin Chinese                                       | [YiZhang](YiZhang)                           |
| [BURGER](#BURGER)                                       | Bulgarian                                              | [PetyaOsenova](PetyaOsenova)                 |
| [wmb (wmb)](#wmb)                                       | Wambaya                                                | Emily M. Bender                              |
| HaG                                                                      | Hausa                                                  | [BertholdCrysmann](BertholdCrysmann)         |
| [RRG](#RRG)                                             | Russian                                                | [TaniaAvgustinova](TaniaAvgustinova)         |
| [G-CLIMB Dutch](#DMG)                                   | Dutch                                                  | [AntskeFokkens](AntskeFokkens)               |
| [ManGO](#MGO)                                           | Mandarin Chinese                                       | [JustinChunleiYang](JustinChunleiYang)       |
| [HeGram](#HeGram)                                       | Hebrew                                                 | [LivnatHerzigSheinfux](LivnatHerzigSheinfux) |
| [Indonesian Resource Grammar (INDRA)](#INDRA)           | Indonesian                                             | [DavidMoeljadi](DavidMoeljadi)               |
| [Zhong \[∣\]](#Zhong)                                   | Chinese: Simplified Mandarin                           | [ZhenzhenFan](/ZhenzhenFan)                  |
| *Experimental grammars*                                                  |                                                        |                                              |
|                                                                          | Turkish                                                | [AntskeFokkens](AntskeFokkens)               |
|                                                                          | Georgian                                               | [IrinaBorisova](/IrinaBorisova)              |
|                                                                          | [Thai](http://www.thai-language.com/testsuite-results) | [GlennSlayden](GlennSlayden)                 |
| [Vietnamese Resource Grammar Obviously (VIRGO)](#VIRGO) | Vietnamese                                             | [TuanAnhLe](TuanAnhLe)                       |
| [RQG](#RQG)                                             | Russian                                                | [OlgaZamaraeva](OlgaZamaraeva)               |

<a name="ERG"/>

## English Resource Grammar (ERG)

*Published 2014-11-21*

|                             |                                                                                                                   |
|-----------------------------|-------------------------------------------------------------------------------------------------------------------|
| maintainer                  | [DanFlickinger](DanFlickinger)                                                                                    |
| contributors                | [DanFlickinger](DanFlickinger); [RobMalouf](/RobMalouf); [EmilyBender](EmilyBender); [StephanOepen](StephanOepen) |
| contact                     | <erg@delph-in.net>                                                                                                |
| website                     | <http://www.delph-in.net/erg>                                                                                     |
| demo                        | <http://erg.delph-in.net/>                                                                                        |
| documentation               | <https://github.com/delph-in/docs/wiki/ErgTop>                                                                            |
| issue tracker               |                                                                                                                   |
| version control             | svn co <http://svn.delph-in.net/erg/trunk>                                                                        |
| latest revision             | 20743                                                                                                             |
| latest release              | 1214                                                                                                              |
| canonical citation          | Flickinger 2000 (\[<http://lingo.stanford.edu/danf/ergbib.txt> .bib\])                                            |
| license                     | \[<http://svn.delph-in.net/erg/trunk/LICENSE> MIT\]                                                               |
| grammar type                | \[Resource grammar\]                                                                                              |
| required external resources | TnT POS tagger (for unknown word handling)                                                                        |
| associated resources        | parse ranking model; realization ranking model; unknown word handling; Redwoods treebank                          |
| lexical items               | 38294                                                                                                             |
| lexical rules               | 81                                                                                                                |
| grammar rules               | 212                                                                                                               |
| features                    | 215                                                                                                               |
| types (with glb)            | 9086                                                                                                              |

<a name="Jacy"/>

## Jacy Japanese Grammar (Jacy)

*Published 2017-06-08*

|                             |                                                                                                                                                                                                 |
|-----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| maintainer                  | [FrancisBond](FrancisBond)                                                                                                                                                                      |
| contributors                | [MelanieSiegel](/MelanieSiegel); [EmilyBender](EmilyBender); [ChikaraHashimoto](ChikaraHashimoto); [StephanOepen](StephanOepen); [SanghounSong](SanghounSong); [MichaelGoodman](MichaelGoodman) |
| contact                     | <bond@ieee.org>                                                                                                                                                                                 |
| website                     | <https://github.com/delph-in/docs/wiki/JacyTop>                                                                                                                                                         |
| demo                        | <http://delph-in.github.io/delphin-viz/demo/>                                                                                                                                                   |
| documentation               | <https://github.com/delph-in/docs/wiki/JacyDoc>                                                                                                                                                         |
| issue tracker               | <https://github.com/delph-in/jacy/issues>                                                                                                                                                       |
| version control             | git clone <https://github.com/delph-in/jacy.git>                                                                                                                                                |
| latest revision             |                                                                                                                                                                                                 |
| latest release              | See <https://github.com/delph-in/jacy/releases>                                                                                                                                                 |
| canonical citation          | Siegel, Bender, and Bond 2016 ([.bib](https://github.com/delph-in/jacy/blob/master/citation.bib)) ([.pdf](http://www.aclweb.org/anthology/W/W02/W02-1210.pdf))                                  |
| license                     | MIT                                                                                                                                                                                             |
| grammar type                | [Resource grammar](/GrammarCatalogue#GrammarTypes)                                                                                                                                              |
| required external resources | [ChaSen](/ChaSen) or [MeCab](https://github.com/taku910/mecab/) morphological analyzer                                                                                                          |
| associated resources        | parse ranking model; unknown word handling; Hinoki treebank                                                                                                                                     |
| lexical items               | 56,912                                                                                                                                                                                          |
| lexical rules               | 69                                                                                                                                                                                              |
| grammar rules               | 51                                                                                                                                                                                              |
| features                    | 189                                                                                                                                                                                             |
| types (with glb)            | 2,569                                                                                                                                                                                           |

<a name="LXGram"/>

## LXGram

|                             |                                                                                                                                                                                                                                                                                                                                                                                                           |
|-----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| maintainer                  | [AntonioBranco](AntonioBranco)                                                                                                                                                                                                                                                                                                                                                                            |
| contributors                | [AntonioBranco](AntonioBranco), [FranciscoCosta](FranciscoCosta), [JoãoSilva](/Jo%C3%A3oSilva), [SérgioCastro](/S%C3%A9rgioCastro)                                                                                                                                                                                                                                                                        |
| latest release              | 29 July 2008                                                                                                                                                                                                                                                                                                                                                                                              |
| website                     | <http://lxcenter.di.fc.ul.pt/tools/en/LXGramEN.html>                                                                                                                                                                                                                                                                                                                                                      |
| vcs                         |                                                                                                                                                                                                                                                                                                                                                                                                           |
| demo                        |                                                                                                                                                                                                                                                                                                                                                                                                           |
| documentation               | <http://lxcenter.di.fc.ul.pt/tools/en/conteudo/LXGramA41ImplementationReport.pdf>                                                                                                                                                                                                                                                                                                                         |
| canonical citation          | Branco, António and Francisco Costa, 2010, "A Deep Linguistic Processing Grammar for Portuguese", Lecture Notes in Artificial Intelligence, 6001, pp.86-89, Berlin: Springer.                                                                                                                                                                                                                             |
| canonical citation .bib     | @inproceedings{[BrancoCosta2010](/BrancoCosta2010), author = {Branco, António and Costa, Francisco}, title = {A Deep Linguistic Processing Grammar for {P}ortuguese}, year = {2010}, booktitle = {Computational Processing of the Portuguese Language}, publisher = {Springer}, series = {Lecture Notes in Artificial Intelligence}, volume = {LNAI6001}, pages = {86$\\,$--$\\,$89}, address = {Berlin}} |
| copy of canonical reference | <http://lxcenter.di.fc.ul.pt/tools/en/conteudo/BrancoCosta2010-LXGram.pdf>                                                                                                                                                                                                                                                                                                                                |
| license                     | ELDA                                                                                                                                                                                                                                                                                                                                                                                                      |
| grammar type                | resource grammar                                                                                                                                                                                                                                                                                                                                                                                          |
| required external resources | LX-Tokenizer, LX-Suite, LX-Lemmatizer, LX-Inflector, LX-NER                                                                                                                                                                                                                                                                                                                                               |
| associated resources        | parse ranking model, CINTIL [DeepGramBank](/DeepGramBank), CINTIL [TreeBank](/TreeBank), CINTIL [DependencyBank](/DependencyBank), CINTIL [PropBank](/PropBank), CINTIL [LogicalFormBank](/LogicalFormBank)                                                                                                                                                                                               |

<a name="GG"/>

## GG

|                              |                                                                 |
|------------------------------|-----------------------------------------------------------------|
| maintainer                   | [BertholdCrysmann](BertholdCrysmann)                            |
| contributors                 | (If other than only current maintainer)                         |
| latest release               |                                                                 |
| website                      | <http://gg.opendfki.de/>                                        |
| vcs                          |                                                                 |
| demo                         |                                                                 |
| documentation                |                                                                 |
| canonical citation           |                                                                 |
| license                      | LGPLLS (Lesser General Public License For Linguistic Resources) |
| grammar type                 | Resource grammar                                                |
| required external components | None                                                            |
| associated resources         | (if applicable)                                                 |
| lexical items                | 64,047                                                          |
| lexical rules                | 453                                                             |
| grammar rules                | 158                                                             |
| features                     | 320                                                             |
| types (with glb)             | 9,722                                                           |

<a name="KRG"/>

## KRG

|                    |                                                                                                                                                               |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| maintainer         | [JongBokKim](JongBokKim)                                                                                                                                      |
| contributors       | [JongBokKim](JongBokKim), [JaehyungYang](/JaehyungYang), [FrancisBond](FrancisBond), [SanghounSong](SanghounSong)                                             |
| latest release     | 3 July 2010                                                                                                                                                   |
| website            | <http://krg.khu.ac.kr>                                                                                                                                        |
| vcs                | svn co <http://svn.delph-in.net/krg/trunk>                                                                                                                    |
| demo               | <http://krg.khu.ac.kr:8106/logon>                                                                                                                             |
| documentation      | <http://krg.khu.ac.kr>                                                                                                                                        |
| canonical citation | [Kim and Yang 2003](http://web.khu.ac.kr/~jongbok/research/final-papers/paclic17.pdf), [Song et al. 2010](http://www.aclweb.org/anthology/W/W10/W10-3219.pdf) |
| license            | MIT                                                                                                                                                           |
| grammar type       | resource grammar                                                                                                                                              |
| lexical items      | 39,942                                                                                                                                                        |
| lexical rules      | 289                                                                                                                                                           |
| grammar rules      | 63                                                                                                                                                            |
| features           | 150                                                                                                                                                           |
| types (with glb)   | 2,343                                                                                                                                                         |

<a name="Cheetah"/>

## Cheetah

|                              |                                                                         |
|------------------------------|-------------------------------------------------------------------------|
| maintainer                   | [BartCramer](BartCramer)                                                |
| contributors                 | [YiZhang](YiZhang)                                                      |
| latest release               | (v0.39) In the Paris release of LOGON                                   |
| website                      | [CheetahTop](CheetahTop)                                                |
| vcs                          | svn co <http://svn.emmtee.net/trunk/coli/cheetah>                       |
| demo                         | \-                                                                      |
| documentation                | [CheetahTop](CheetahTop)                                                |
| canonical citation           | Cramer & Zhang, 2009 (GEAF)                                             |
| license                      | MIT license                                                             |
| grammar type                 | Treebank-derived grammar                                                |
| required external components | For grammar improvement: Tiger treebank.                                |
| associated resources         | The Savannah treebank (25k sentences); PCFG model; Disambiguation model |

<a name="SRG"/>

## Spanish Resource Grammar

|                              |                                                                                                              |
|------------------------------|--------------------------------------------------------------------------------------------------------------|
| maintainer                   | [MontserratMarimon](/MontserratMarimon)                                                                      |
| contributors                 | [NúriaBel](/N%C3%BAriaBel)                                                                                   |
| latest release               |                                                                                                              |
| website                      | <https://github.com/delph-in/docs/wiki/SrgTop>                                                                                |
| vcs                          | svn co <http://svn.emmtee.net/trunk/upf/srg>                                                                 |
| demo                         | <http://srg.delph-in.net>                                                                                    |
| documentation                |                                                                                                              |
| canonical citation           | Marimon, 2010 "The Spanish Resource Grammar", In European Language Resources Association, ISBN 2-9517408-4-0 |
| license                      | LGPL-LR                                                                                                      |
| grammar type                 | resource grammar                                                                                             |
| required external components | [FreeLing](https://nlp.lsi.upc.edu/freeling/index.php/node/30)                                                                                        |
| associated resources         | parse ranking model, Tibidabo treebank                                                                       |
| lexical items                | 54,503                                                                                                       |
| lexical rules                | 497                                                                                                          |
| grammar rules                | 224                                                                                                          |
| features                     | 141                                                                                                          |
| types (with glb)             | 6,076                                                                                                        |

<a name="RRG"/>

## Russian Resource Grammar

|                              |                                               |
|------------------------------|-----------------------------------------------|
| maintainer                   | [TaniaAvgustinova](TaniaAvgustinova)          |
| contributors                 | [YiZhang](YiZhang)                            |
| latest release               | 20110615                                      |
| website                      | <http://www.coli.uni-saarland.de/~tania/rrg/> |
| vcs                          |                                               |
| demo                         |                                               |
| documentation                | [SlavicTop](SlavicTop)                        |
| canonical citation           | Avgustinova & Zhang, 2009                     |
| license                      | LGPL-LR                                       |
| grammar type                 | medium-sized linguistic grammar               |
| required external components | MYSTEM                                        |
| associated resources         | [SynTagRus](/SynTagRus)                       |

<a name="RQG"/>

## Russian Questions Grammar

|                              |                                                          |
|------------------------------|----------------------------------------------------------|
| maintainer                   | Olga Zamaraeva                                           |
| contributors                 |                                                          |
| latest release               | 20200601                                                 |
| website                      | <https://olzama.github.io/rqg.zip/>        |
| vcs                          |                                                          |
| demo                         |                                                          |
| documentation                | [RussianQuestionsGrammarTop](RussianQuestionsGrammarTop) |
| canonical citation           | Zamaraeva 2021                                       |
| license                      | LGPL-LR                                                  |
| grammar type                 | Matrix-based experimental linguistic grammar             |
| required external components |                                                          |
| associated resources         |                                                          |
| lexical items                | 60                                                       |
| lexical rules                | 66                                                       |
| grammar rules                | 39                                                       |
| features                     | 162                                                      |
| types (with glb)             | 1732                                                     |

<a name="MGO"/>

## Mandarin Grammar Online

|                    |                                                                                                                                                                  |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| maintainer         | [JustinChunleiYang](JustinChunleiYang)                                                                                                                           |
| contributors       | [NatHillard](/NatHillard), [DanFlickinger](DanFlickinger), [JustinChunleiYang](JustinChunleiYang)                                                                |
| latest release     | July 2011                                                                                                                                                        |
| website            | <https://github.com/delph-in/docs/wiki/MandarinGrammarOnline>                                                                                                            |
| vcs                | svn co svn://lemur.ling.washington.edu/shared/mandarin                                                                                                           |
| demo               | none yet                                                                                                                                                         |
| documentation      | none yet                                                                                                                                                         |
| canonical citation | Yang, Chunlei & Dan Flickinger. 2014. ManGO: grammar engineering for deep linguistic processing. New Technology of Library and Information Service 30 (3):57-64. |
| canonical citation |                                                                                                                                                                  |
| license            | [MIT](http://svn.delph-in.net/erg/trunk/LICENSE)                                                                                                                 |
| grammar type       | medium-sized linguistic grammar                                                                                                                                  |

<a name="BURGER"/>

## BURGER

|                              |                                                                                                                                                                                                                                                     |
|------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| maintainer                   | [PetyaOsenova](PetyaOsenova)                                                                                                                                                                                                                        |
| contributors                 | [DanFlickinger](DanFlickinger), [KirilSimov](/KirilSimov)                                                                                                                                                                                           |
| latest release               | July 2010                                                                                                                                                                                                                                           |
| website                      | <http://www.bultreebank.org/BURGER/index.html>                                                                                                                                                                                                      |
| vcs                          | svn co <http://svn.delph-in.net/burger/trunk> burger                                                                                                                                                                                                |
| demo                         |                                                                                                                                                                                                                                                     |
| documentation                | <http://www.bultreebank.org/BURGER/BURGER3.pdf>                                                                                                                                                                                                     |
| canonical citation           | Petya Osenova 2011. Localizing a Core HPSG-based Grammar for Bulgarian. In: Hanna Hedeland, Thomas Schmidt, Kai Worner (eds.) Multilingual Resources and Multilingual Applications, Proceedings of GSCL 2011, ISSN 0176-599X, Hamburg, pp. 175-180. |
| license                      |                                                                                                                                                                                                                                                     |
| grammar type                 | medium-sized grammar                                                                                                                                                                                                                                |
| required external components |                                                                                                                                                                                                                                                     |
| associated resources         |                                                                                                                                                                                                                                                     |

<a name="wmb"/>

## wmb (wmb)

*Published 2011-07-18*

|                             |                                                                                                                                       |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| maintainer                  | Emily M. Bender                                                                                                                       |
| contributors                |                                                                                                                                       |
| contact                     | ebender -at- uw -dot- edu                                                                                                             |
| website                     | <https://github.com/delph-in/docs/wiki/WambayaTop>                                                                                            |
| demo                        |                                                                                                                                       |
| documentation               |                                                                                                                                       |
| issue tracker               |                                                                                                                                       |
| version control             | svn://lemur.ling.washington.edu/instructors/ebender/wambaya                                                                           |
| latest revision             | 18936                                                                                                                                 |
| latest release              | 2011-07-18                                                                                                                            |
| canonical citation          | Bender 2008 ([.bib](http://aclweb.org/anthology-new/P/P08/P08-1111.bib)) ([.pdf](http://aclweb.org/anthology-new/P/P08/P08-1111.pdf)) |
| license                     | MIT                                                                                                                                   |
| grammar type                | [Medium-sized lingiustic grammar](/GrammarCatalogue#GrammarTypes)                                                                     |
| required external resources |                                                                                                                                       |
| associated resources        |                                                                                                                                       |
| lexical items               | 1528                                                                                                                                  |
| lexical rules               | 161                                                                                                                                   |
| grammar rules               | 87                                                                                                                                    |
| features                    | 150                                                                                                                                   |
| types (with glb)            | 3430                                                                                                                                  |

<a name="MCG"/>

## MCG

|                              |                                                  |
|------------------------------|--------------------------------------------------|
| maintainer                   | [YiZhang](YiZhang)                               |
| contributors                 | [RuiWang](/RuiWang), [YuChen](/YuChen)           |
| latest release               | 20110616                                         |
| website                      | <http://mcg.opendfki.de/>                        |
| vcs                          | svn co <https://mcg.opendfki.de/repos/trunk> mcg |
| demo                         | (not yet)                                        |
| documentation                | (not yet)                                        |
| canonical citation           | (to appear)                                      |
| license                      | LGPL-LR                                          |
| grammar type                 | medium-sized linguistic grammar                  |
| required external components | none                                             |
| associated resources         | none                                             |

<a name="Zhong"/>

## Zhong \[∣\]

|                    |                                                                                                                                                                                                                                                                   |
|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| maintainer         | [ZhenzhenFan](/ZhenzhenFan)                                                                                                                                                                                                                                       |
| contributors       | [SanghounSong](SanghounSong), [FrancisBond](FrancisBond), [JustinChunleiYang](JustinChunleiYang)                                                                                                                                                                  |
| latest release     | 2019                                                                                                                                                                                                                                                              |
| website            | <https://github.com/delph-in/docs/wiki/ZhongTop>                                                                                                                                                                                                                          |
| vcs                | git clone <https://github.com/delph-in/zhong.git>                                                                                                                                                                                                                 |
| demo               | <http://delph-in.github.io/delphin-viz/demo/>                                                                                                                                                                                                                     |
| documentation      | none yet                                                                                                                                                                                                                                                          |
| canonical citation | Fan, Zhenzhen, Sanghoun Song, and Francis Bond. [An HPSG-based Shared-Grammar for the Chinese Languages: Zhong \[∣\]](http://www.aclweb.org/anthology/W15-3303), Grammar Engineering Across Frameworks 2015 (in conjunction with ACL 2015). Beijing, China. 2015. |
| license            |                                                                                                                                                                                                                                                                   |
| grammar type       | medium-sized linguistic grammar                                                                                                                                                                                                                                   |

<a name="GMG"/>

## GMG

|                              |                                                                                                    |
|------------------------------|----------------------------------------------------------------------------------------------------|
| maintainer                   | [AntskeFokkens](AntskeFokkens)                                                                     |
| contributors                 |                                                                                                    |
| latest release               | 20110616                                                                                           |
| website                      | [Metagrammar Homepage](http://www.coli.uni-saarland.de/~afokkens/page.php?id=germanic_metagrammar) |
| vcs                          | (not yet)                                                                                          |
| demo                         | (not yet)                                                                                          |
| documentation                |                                                                                                    |
| canonical citation           | Fokkens (2011) [bib](http://www.coli.uni-saarland.de/~afokkens/bibentries/fokkens-11.bib)          |
| license                      |                                                                                                    |
| grammar type                 | medium-sized linguistic grammar                                                                    |
| required external components | morphology (standard not decided)                                                                  |
| associated resources         | [DMG](/GrammarCatalogue#DMG)                                                                       |

<a name="DMG"/>

## DMG

|                              |                                                                                                    |
|------------------------------|----------------------------------------------------------------------------------------------------|
| maintainer                   | [AntskeFokkens](AntskeFokkens)                                                                     |
| contributors                 |                                                                                                    |
| latest release               | 20110616                                                                                           |
| website                      | [Metagrammar Homepage](http://www.coli.uni-saarland.de/~afokkens/page.php?id=germanic_metagrammar) |
| vcs                          | (not yet)                                                                                          |
| demo                         | (not yet)                                                                                          |
| documentation                |                                                                                                    |
| canonical citation           | Fokkens (2011) [bib](http://www.coli.uni-saarland.de/~afokkens/bibentries/fokkens-11.bib)          |
| license                      |                                                                                                    |
| grammar type                 | medium-sized linguistic grammar                                                                    |
| required external components | morphology                                                                                         |
| associated resources         | [GMG](/GrammarCatalogue#GMG)                                                                       |

<a name="HeGram"/>

## HeGram

|                              |                                                                                                                                                                                   |
|------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| maintainer                   | [LivnatHerzigSheinfux](LivnatHerzigSheinfux)                                                                                                                                      |
| contributors                 | [LivnatHerzigSheinfux](LivnatHerzigSheinfux), [TaliAradGreshler](TaliAradGreshler), [PetterHaugereid](PetterHaugereid), [NuritMelnik](NuritMelnik), [ShulyWintner](/ShulyWintner) |
| July 2013                    |                                                                                                                                                                                   |
| website                      | [HeGram](HeGram) (Delph-In) and [HeGram](http://cl.haifa.ac.il/projects/HeGram/index.shtml) (Haifa)                                                                               |
| vcs                          |                                                                                                                                                                                   |
| demo                         |                                                                                                                                                                                   |
| documentation                |                                                                                                                                                                                   |
| canonical citation           |                                                                                                                                                                                   |
| license                      | MIT                                                                                                                                                                               |
| grammar type                 | Medium-sized linguistic grammar                                                                                                                                                   |
| required external components |                                                                                                                                                                                   |
| associated resources         | the MILA morphological processor of Hebrew                                                                                                                                        |

<a name="INDRA"/>

## Indonesian Resource Grammar (INDRA)

*Published 2015-07-06*

|                             |                                                                                                                                                                                                  |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| maintainer                  | [DavidMoeljadi](DavidMoeljadi)                                                                                                                                                                   |
| contributors                | [DavidMoeljadi](DavidMoeljadi); [FrancisBond](FrancisBond); [SanghounSong](SanghounSong); [DanFlickinger](DanFlickinger); [MichaelGoodman](MichaelGoodman); [LuisMorgadoCosta](LuisMorgadoCosta) |
| contact                     | <davidmoeljadi@gmail.com>                                                                                                                                                                        |
| website                     | <http://moin.delph-in.net/IndraTop>                                                                                                                                                              |
| demo                        | <http://chimpanzee.ling.washington.edu/demophin/indra/>                                                                                                                                          |
| documentation               | <http://moin.delph-in.net/IndraTop>                                                                                                                                                              |
| issue tracker               | <https://github.com/davidmoeljadi/INDRA>                                                                                                                                                         |
| version control             | <https://github.com/davidmoeljadi/INDRA>                                                                                                                                                         |
| latest release              | 2018-01-23                                                                                                                                                                                       |
| canonical citation          | [Moeljadi, Bond, and Song 2015](http://aclweb.org/anthology/W/W15/W15-3302.pdf)                                                                                                                  |
| license                     | MIT                                                                                                                                                                                              |
| grammar type                | [Medium-sized linguistic grammar](/GrammarCatalogue#GrammarTypes)                                                                                                                                |
| required external resources | [Indonesian POS Tagger](http://bahasa.cs.ui.ac.id/postag/tagger) (for unknown word handling)                                                                                                     |
| associated resources        | bridging rules, transfer grammars for machine translation, unknown word handling with YY-mode                                                                                                    |
| lexical items               | 16751                                                                                                                                                                                            |
| lexical rules               | 19                                                                                                                                                                                               |
| grammar rules               | 44                                                                                                                                                                                               |
| features                    | 164                                                                                                                                                                                              |
| types (with glb)            | 2066                                                                                                                                                                                             |

<a name="VIRGO"/>

## Vietnamese Resource Grammar (Obviously) (VIRGO)

*Published 2015-08-04*

|                             |                                                        |
|-----------------------------|--------------------------------------------------------|
| maintainer                  | Le Tuan Anh                                            |
| contributors                |                                                        |
| contact                     | <tuananh.ke@gmail.com>                                 |
| website                     | <https://github.com/letuananh/virgo>                   |
| demo                        | <http://compling.hss.ntu.edu.sg/demophin/virgo/>       |
| documentation               | <https://github.com/letuananh/virgo>                   |
| issue tracker               | <https://github.com/letuananh/virgo/issues>            |
| version control             | <https://github.com/letuananh/virgo>                   |
| latest revision             |                                                        |
| latest release              | 2014-05-11                                             |
| canonical citation          |                                                        |
| license                     | MIT License                                            |
| grammar type                | [Experimental grammar](/GrammarCatalogue#GrammarTypes) |
| required external resources |                                                        |
| associated resources        |                                                        |
| lexical items               | 67                                                     |
| lexical rules               | 0                                                      |
| grammar rules               | 12                                                     |
| features                    | 128                                                    |
| types (with glb)            | 1437                                                   |

## Grammar Metadata Template

|                              |                                            |
|------------------------------|--------------------------------------------|
| maintainer                   |                                            |
| contributors                 | (If other than only current maintainer)    |
| latest release               |                                            |
| website                      |                                            |
| vcs                          |                                            |
| demo                         |                                            |
| documentation                |                                            |
| canonical citation           |                                            |
| license                      |                                            |
| grammar type                 | (should match subheading in grammar table) |
| required external components | (if applicable)                            |
| associated resources         | (if applicable)                            |

### Grammar type definitions:

-   Resource grammar: Broad coverage, used in one or more applications
-   Treebank trained grammar: Cheetah-style grammar built out of
    combination of hand-crafted rules and treebank-derived grammatical
    and statistical information
-   Medium-sized linguistic grammar: Grammar with a growing number of
    analyses, not yet (big enough to be) used in applications.
-   Experimental grammar: Small grammar fragment used for
    developing/testing one or a small set of linguistic analyses

# Generating Metadata

We have a script for automatically generating grammar metadata (even
formatted as [MoinMoin](MoinMoin) or LaTeX tables). First, check out the
script:

    git clone https://github.com/delph-in/grammar-catalogue.git

Run the script with -h to get a usage menu:

    $ ./create-catalogue-entry.sh -h
    Usage:
      create-catalogue-entry.sh [OPTIONS] [PATH]
    Options:
      -h|--help  : display this help message
      -d|--debug : print debug messages
      -q|--quiet : suppress warning messages
      -l|--latex : format output for LaTeX
      -w|--www   : format output as HTML
    Arguments:
      PATH: (optional) create catalogue entry for grammar at PATH
            or the current directory if unspecified

As explained in the usage, you can either run the script from your
grammar's directory, or give the grammar's directory as an argument.
Some information will be pulled automatically from the grammar, but most
should be stored in a file called METADATA. There is an template in the
grammar-catalogue/ directory that you may use, or you can adapt ones
created for other grammars (such as the ERG or Jacy). Once you have the
METADATA file created, try running create-catalogue-entry.sh:

    $ ./create-catalogue-entry.sh ../logon/dfki/jacy/
    NOTE: Now attempting to extract data for the catalogue entry.
          This could take several minutes, so please be patient.
    || [#Jacy Jacy Japanese Grammar (Jacy)] || Japanese || FrancisBond ||

    == Jacy Japanese Grammar (Jacy) ==
    [[Anchor(Jacy)]]
    ''Published 2014-02-14''
    || maintainer                  || FrancisBond ||
    || contributors                || MelanieSiegel; EmilyBender; ChikaraHashimoto; StephanOepen ||
    || contact                     ||
     ||
    || website                     ||
     ||
    || demo                        ||
     ||
    || documentation               ||
     ||
    || issue tracker               ||
     ||
    || version control             || svn co
     jacy ||
    || latest revision             || 556 ||
    || latest release              || 2013-01-01 ||
    || canonical citation          || Siegel and Bender 2002 ([
     .bib]) ([
     .pdf]) ||
    || license                     || MIT ||
    || grammar type                || [#GrammarTypes Resource grammar] ||
    || required external resources || ChaSen morphological analyzer ||
    || associated resources        || parse ranking model; unknown word handling; Hinoki treebank ||
    || lexical items               || 56914 ||
    || lexical rules               || 69 ||
    || grammar rules               || 51 ||
    || features                    || 187 ||
    || types (with glb)            || 2563 ||

The first line is the link to put at the top of this wiki page, and the
rest is to be copied below. The links and anchors will be configured for
you (just check that the anchor name isn't already used).

## Troubleshooting

If you see

     ls: cannot access /usr/bin/tempfile: No such file or directory

Then change this line in create-catalogue-entry.sh:

     grammar_metrics=$(tempfile -d ./)

to this:

     grammar_metrics=$(mktemp -p ./)
