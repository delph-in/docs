{% raw %}# (Out-of-date) Grammar Summary for ERG from 2006

See <http://moin.delph-in.net/GrammarCatalogue> for current information.

|                             |                                          |
|:----------------------------|:-----------------------------------------|
| **Grammar**                 | **English Resource Grammar (ERG)**       |
| Language/Dialect            | English, Standard American               |
| Authors                     | Dan Flickinger, Rob Malouf, Emily Bender |
| Start date                  | 1994                                     |
| Person-years to date        | 17                                       |
| Source available (link)     | <http://www.delph-in.net/erg>            |
| Documentation: publications | <http://www.delph-in.net/erg>            |
| Documentation online (link) | No                                       |
| Online demo (link)          | <http://www.delph-in.net/erg>            |
| License                     | MIT                                      |
| Version                     | 24-May-06                                |

|                                  |       |
|----------------------------------|------:|
| Number of lexical leaf types     |   864 |
| Total number of lexical types    |  1822 |
| Number of lexical rules          |    26 |
| Number of syntactic rules        |   153 |
| Total number of types (no GLBs)  |  4303 |
| Lexical entries: Hand-built      | 24191 |
| Lexical entries: External source |     0 |
| Lines of TDL (excl lexicon)      | 28610 |
| Lines of comments                |  5757 |

|                            |                                                                                            |
|----------------------------|:-------------------------------------------------------------------------------------------|
| External morphology        | No                                                                                         |
| Preprocessor               | Yes: finite state in LKB                                                                   |
| Lexical database           | Yes                                                                                        |
| Unknown word mechanism     | Yes: TNT POS-based in PET                                                                  |
| Idioms                     | Yes                                                                                        |
|                            |                                                                                            |
| Test suites                | DELPHINROOT/lingo/lkb/src/tsdb/skeletons                                                   |
| \- name:domain (items)     | csli:phenom (1348) mrs:semantics (107)                                                     |
|                            | hike:tourism (330) rondane:tourism (1424)                                                  |
|                            | logon:tourism (9411) vm:meetings (12393)                                                   |
|                            | ec:ecommerce (5867) trec9:q-a (693)                                                        |
| Treebanks                  | <http://www.delph-in.net/redwoods> and                                                     |
|                            | DELPHINROOT/lingo/erg/gold/                                                                |
| Parse-ranking model        | Yes, from LOGON treebanks                                                                  |
| Generation (trigger rules) | Yes                                                                                        |
| Realization-ranking model  | Yes, from LOGON treebanks                                                                  |
| Paraphrasing rules         | Yes                                                                                        |
| SEM-I                      | Yes                                                                                        |
| Application(s)             | MT, email response                                                                         |
| Processing engines         | [LKB](https://delph-in.github.io/docs/tools/LkbTop), [PET](https://delph-in.github.io/docs/garage/PetTop), ACE, ([LILFES](http://www-tsujii.is.s.u-tokyo.ac.jp/lilfes)) |
| Operating systems          | Linux, Windows, MacOS                                                                      |
| Notes                      |                                                                                            |

# Calculate Numbers

- Lines of TDL (excl lexicon)

<!-- -->


      mkdir /tmp/counttdl
      cd <grammardir>
      cp *.tdl /tmp/counttdl
      cd /tmp/counttdl
      rm lexicon.tdl
      cat *.tdl > total
      wc -l total              

- Lines of comments

<!-- -->


      grep -e '^;' *.tdl | wc -l

- Number of lexical leaf types

<!-- -->


      cd /tmp/counttdl
      grep "_le :=" *.tdl | wc -l

- Total number of lexical types

<!-- -->


      cd /tmp/counttdl
      cat <lextypefiles> > ltypes
      grep ":=" ltypes | wc -l

- Lexical entries - Hand-built

<!-- -->


      cd <grammardir>
      grep ":=" <lexfiles> | wc -l

- Number of syntactic rules

<!-- -->


      cd <grammardir>
      grep ":=" <rules> | wc -l

- Total number of types (no GLBs)

<!-- -->


      cd /tmp/counttdl
      grep ":=" total | wc -l
      grep ":<" total | wc -l

Last update: 2014-11-21 by DanFlickinger [[edit](https://github.com/delph-in/docs/wiki/ErgSummary/_edit)]{% endraw %}