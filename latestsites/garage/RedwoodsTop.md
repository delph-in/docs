{% raw %}Contents

1. [Overview](https://delph-in.github.io/docs/garage/RedwoodsTop#Overview)
2. [Current Development Status](https://delph-in.github.io/docs/garage/RedwoodsTop#Current_Development_Status)
3. [Data Format](https://delph-in.github.io/docs/garage/RedwoodsTop#Data_Format)
4. [Expanding and Exporting](https://delph-in.github.io/docs/garage/RedwoodsTop#Expanding_and_Exporting)
5. [Standard Splits](https://delph-in.github.io/docs/garage/RedwoodsTop#Standard_Splits)
6. [History](https://delph-in.github.io/docs/garage/RedwoodsTop#History)
7. [Bibliography](https://delph-in.github.io/docs/garage/RedwoodsTop#Bibliography)
8. [Acknowledgements](https://delph-in.github.io/docs/garage/RedwoodsTop#Acknowledgements)

# Overview

The LinGO Redwoods Treebank is a collection of hand-annotated corpora
analysed with the [LinGO ERG](https://delph-in.github.io/docs/erg/ErgTop). For each
utterance from a corpus, the treebank records (in principle) all
analyses hypothesized by the grammar, together with an annotator
decision as to which reading is preferred in context.

The key innovative aspect of the Redwoods approach to treebanking is the
anchoring of all linguistic data captured in the treebank to the HPSG
framework and a generally-available broad-coverage grammar of English,
viz. the [LinGO English Resource Grammar](/delph-in/docs/wiki/ErgTop).
Unlike existing treebanks, there is no need to define a (new) form of
grammatical representation specific to the treebank (and, consequently,
less dissemination effort in establishing this representation). Instead,
the treebank records complete syntactico-semantic analyses as defined by
the LinGO ERG; tools are provided to extract many different types of
linguistic information at varying granularity.

Other relevant aspects of the Redwoods Treebank include the integration
of alternate, though dispreferred analyses for each utterance and the
dynamic nature of the annotations: as the underlying grammar evolves and
improves its analyses, there is a provision for a (nearly) fully
automated update of the treebank against a version of the original
corpus analysed with the revised grammar. As a methodological results,
part of the Redwoods data are now regularly maintained as part of the
grammar regression cycle with each new release of the ERG.

The below table lists all the datasets that were released with the ERG 2020, with some information related to them, such as the genre/citation.

| | | | | |
|---------|-------------------------|-------------------------|------------------------|-------------------------------------|
|csli | "CSLI testsuite" | Constructed examples |  | https://www.let.rug.nl/nerbonne/papers/Old-Scans/Toward-Eval-NLP-1987.pdf |
|ccs | "Collab Compuational Semantics" | Constructed examples | | http://moin.delph-in.net/wiki/WeSearch/Ccs|
|control | "Control examples from literature" | Constructed examples |   | |
|esd | "ERG Semantic Documentation Test Suite" | Constructed |  |https://github.com/delph-in/docs/wiki/ErgSemantics|
|fracas |  "FraCaS Semantics Test Suite" | textual inference problem set | Cooper et al. 1996 | https://gu-clasp.github.io/multifracas/D16.pdf |
|handp12 | The Cambridge grammar of the English language, Ch12 |  |   Huddleston and Pullum 2005 | |
|mrs | MRS test suite | Constructed examples| | https://github.com/delph-in/docs/wiki/MatrixMrsTestSuite|
|pest | | | | |
|sh-spec | Sherlock Holmes | late 19th century fiction | Conan Doyle, 1892 | https://www.gutenberg.org/files/1661/1661-h/1661-h.htm#chap08 |
|sh-spec-r | double of the above? | | |
|trec | "TREC QA Questions (Ninth conference" |  | |  |
|cb | The Cathedral and the Bazaar | technical essay |Raymond, 1999 | http://www.catb.org/~esr/writings/cathedral-bazaar/ |
|ec* | E-commerce email (YY) | email (customer service etc) | | |
| hike | LOGON | travel brochures | | |
| jh* | LOGON| travel brochures | | |
| tg* | LOGON| travel brochures | | |
|ps* | LOGON| travel brochures | | |
| rondane | LOGON| travel brochures | | |
| rtc* | | | | |
| bcs | "Brown Corpus Sampler (SDP 2015 Task)" |  | Oepen et al. 2015  | https://aclanthology.org/S15-2153.pdf |
| scm | "SemCor Melbourne Sampler (Disjoint from BCS)" | |  | |
|vm* | Verbmobil| scheduling dialogues| Is Wahlster 1993 the citation? |http://verbmobil.dfki.de/ww.html |
| ws* | Wikipedia| Encyclopaedic texts about computational linguistics | | |
| wlb03 |  | | |http://www.lrec-conf.org/proceedings/lrec2012/pdf/774_Paper.pdf|
| wnb03 | | | |http://www.lrec-conf.org/proceedings/lrec2012/pdf/774_Paper.pdf|
peted | "Evaluation By Textual Entailment (Development)" | |  | https://link.springer.com/article/10.1007/s10579-012-9200-5|
petet | "Evaluation By Textual Entailment (Test)" |  || https://link.springer.com/article/10.1007/s10579-012-9200-5 |
| ntucle | Corpus of learner English collected at NTU | | | |
| omw | Open Multilingual Wordnet | |  | http://compling.hss.ntu.edu.sg/omw/ |
| wsj* | Wall Street Journal| News articles | | https://catalog.ldc.upenn.edu/LDC93S6A |  

# Current Development Status

The latest public release of the Redwoods Treebank (and the associated
[WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods) Treecache, i.e. a very large collection of ERG
parses) is the [Ninth
Growth](http://svn.delph-in.net/erg/tags/1214/tsdb/gold/), including an
improved and moderately enlarged version of [DeepBank](https://delph-in.github.io/docs/garage/DeepBank). The
Ninth Growth used the 1214 version of the ERG. [Flickinger
(2011)](http://lists.delph-in.net/archives/developers/attachments/20180514/ffe9ae3d/attachment-0001.pdf)
gives brief descriptions of several of the larger components in the
appendix. Those components include: Verbmobil (vm\*), E-commerce (ec\*),
LOGON (jh\*, ps\*, tg\*, rondane, hike), [SemCor](https://delph-in.github.io/docs/garage/SemCor) (sc\*),
Wikipedia (ws01-13, ws214), and an Eric Raymond essay (cb). The main
addition to the Ninth Growth over previous versions is the
[DeepBank](https://delph-in.github.io/docs/garage/DeepBank) annotation of the Wall Street Journal, sections
00-21 (the same text annotated in the Penn Tree Bank), described in the
[proceedings of TLT 2011](http://tlt11.clul.ul.pt/ProceedingsTLT11.tgz).
There are also two profiles (rtc000, rtc001) from the Tanaka (Pacling
2001) corpus, two profiles of user-generated web content studied in the
[WeScience](https://delph-in.github.io/docs/garage/WeScience) project, and several profiles also from the Brown
[SemCor](https://delph-in.github.io/docs/garage/SemCor) that were treebanked for a [SemEval](/SemEval) shared
task after the ERG 1214 release was frozen (cf\*, cg\*, ck\*, cl\*,
cm\*, cn\*, cp\*, cr\*), described by [Oepen et al.
(2015)](http://www.aclweb.org/anthology/S15-2153). Finally, the Ninth
Growth includes several smaller linguist-constructed test suites (csli,
esd, fracas, mrs, and trec).

The [Eighth Growth](http://svn.delph-in.net/erg/tags/1212/tsdb/gold/)
was released in September 2013. It includes 85,000 sentences, consisting
of data sets from several distinct domains, including not only (a) the
Verbmobil and ecommerce corpora from earlier releases and (b) the data
from the LOGON Norwegian-English MT corpus, the [WeScience](https://delph-in.github.io/docs/garage/WeScience)
100-article portion of the English Wikipedia and a portion of the
semantically tagged subset of the Brown corpus (SemCor); but also (c) a
fresh re-annotation of large parts of the venerable WSJ text behind the
Penn Treebank. The version of the grammar used in parsing this data is
called ERG 1212. An
[inventory](http://svn.delph-in.net/erg/tags/1212/etc/redwoods.xls) of
the individual segments and sentence and token counts is available as
part of the ERG. For reasons of attribution, the WSJ-subset of the
Eighth Growth was first released as a separate package dubbed [DeepBank
1.0](http://moin.delph-in.net/DeepBank/OneZero).

The grammar and treebanks have been stable since August 2016, and the
semantic graphs from DeepBank 1.1 have been [released in a variety of
formats](http://sdp.delph-in.net). The corresponding 1214 release of the
[WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods) Treecache is expected by the summer of 2017.

Earlier relevant Redwoods revisions include the [Second
Growth](http://redwoods.stanford.edu/ftp/2nd/), [Third
Growth](http://redwoods.stanford.edu/ftp/3rd/), [Fifth
Growth](http://redwoods.stanford.edu/ftp/5th/), and [Seventh
Growth](http://svn.delph-in.net/erg/tags/1111/tsdb/gold//tsdb/gold/).

# Data Format

Like the previous Redwoods Fifth Growth revision, the Seventh Growth is
distributed in \[incr tsdb()\] profile form exclusively (see below for
instructions on how to expand the data into a textual export format),
but we have limited the number of dispreferred analyses per item to a
maximum of the 500 *best* analyses according to our MaxEnt model trained
on an interim version of this treebank. In principle, Redwoods users
could use the PET or ACE parsers to obtain the complete set of analyses
and then use the \[incr tsdb()\] update facility to automatically
produce a version of the treebank against the unrestricted profile.
However, we expect that the reduced distribution provides a sufficiently
large portion of the dispreferred analyses for high-quality stochastic
modelling and that the substantial reduction in overall size will
actually benefit experimentation.

# Expanding and Exporting

Assuming a functional installation of the LKB, ERG, and \[incr tsdb()\]
(see the [LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation) page, for details), the
process of exporting all or parts of the Redwoods Treebank into a
collection of plain text files can be fully automated by virtue of a
shell script. For (somewhat terse, sadly) instructions on exporting
various views on the Redwoods data, please see the Section *Exporting
Various Plain-Text Formats* on the [WeScience](https://delph-in.github.io/docs/garage/WeScience) page as well
as the [ErgProcessing](https://delph-in.github.io/docs/erg/ErgProcessing) page.

# Standard Splits

A suggestion for a training–development–test split can be found in the
detailed ‘[table of
contents](http://svn.delph-in.net/erg/tags/1214/etc/redwoods.xls)’
(redwoods.xls) distributed with each release of the grammar. In this
file, each test suite is color-coded to indicate the suggested split as
follows:

- |                 |
|-----------------|
| **test** (yellow)      |
| **also test** (green)  |
| **development** (orange)|
| **training** (white)   |
| **ignored** (red)    |

(Source:
<http://lists.delph-in.net/archives/developers/2017/002491.html>)

# History

<img src="http://www.delph-in.net/redwoods/ezra.jpg" title="http://www.delph-in.net/redwoods/ezra.jpg" class="external_image" alt="http://www.delph-in.net/redwoods/ezra.jpg" />


# Bibliography

Following is an incomplete selection of publications on the creation and
use of the Redwoods treebank.

- Oepen, Stephan, Kristina Toutanova, Stuart Shieber, Christopher
Manning, Dan Flickinger, and Thorsten Brants (2002). [The LinGO
Redwoods Treebank: Motivation and Preliminary
Applications](http://lingo.stanford.edu/pubs/oe/coling2002.ps). In
*Proceedings of the 19th International Conference on Computational
Linguistics (COLING 2002)*, Taipei, Taiwan (pages 1253-1257).
- Oepen, Stephan, Dan Flickinger, Kristina Toutanova, and
Christoper D. Manning (2002). [LinGO Redwoods. A Rich and Dynamic
Treebank for HPSG](http://lingo.stanford.edu/pubs/oe/tlt02.pdf). In
*Proceedings of The First Workshop on Treebanks and Linguistic
Theories (TLT 2002)*, Sozopol, Bulgaria.
- Toutanova, Kristina, Christoper D. Manning, and Stephan Oepen
(2002). [Parse Ranking for a Rich HPSG
Grammar](http://www.stanford.edu/~krist/papers/Sozopol-Toutanova-2002.pdf).
In *Proceedings of The First Workshop on Treebanks and Linguistic
Theories (TLT 2002)*, Sozopol, Bulgaria.
- Toutanova, Kristina and Christopher D. Manning (2002). [Feature
Selection for a Rich HPSG Grammar Using Decision
Trees](http://nlp.stanford.edu/~manning/papers/conll02-35.pdf). In
*Proceedings of the Sixth Conference on Natural Language Learning
(CoNLL 2002)*, Taipei, Taiwan.
- Velldal, Erik, Stephan Oepen, and Dan Flickinger (2004).
[Paraphrasing Treebanks for Stochastic Realization
Ranking](http://www.emmtee.net/bib/Vel:Oep:Fli:04.pdf). In
*Proceedings of The Third Workshop on Treebanks and Linguistic
Theories (TLT 2004)*, Tuebingen, Germany.
- Oepen, Stephan, Dan Flickinger, Kristina Toutanova, and
Christoper D. Manning (2004). [LinGO Redwoods: A Rich and Dynamic
Treebank for
HPSG](http://www.springerlink.com/content/t851781443373812/).
*Research on Language and Computation* 2(4):575-596.
- Flickinger, Dan (2011). [Accuracy vs. Robustness in Grammar
Engineering](http://lists.delph-in.net/archives/developers/attachments/20180514/ffe9ae3d/attachment-0001.pdf).
*Language from a cognitive perspective: Grammar, usage, and
processing*, pages 31-50.
- Dan Flickinger, Valia Kordoni and Yi Zhang (2012).
[DeepBank](https://delph-in.github.io/docs/garage/DeepBank): A Dynamically Annotated Treebank of the Wall
Street Journal. In [Proceedings of
TLT-11](http://tlt11.clul.ul.pt/ProceedingsTLT11.tgz), Lisbon,
Portugal.
- Stephan Oepen, Marco Kuhlmann, Yusuke Miyao, Daniel Zeman, Silvie
Cinková, Dan Flickinger, Jan Hajič, and Zdeňka Urešová (2015).
[SemEval 2015 Task 18: Broad-Coverage Semantic Dependency
Parsing](http://www.aclweb.org/anthology/S15-2153). In *Proceedings
of the 9th International Workshop on Semantic Evaluation
([SemEval](/SemEval) 2015)*, pages 915–92. [Task
Website](http://alt.qcri.org/semeval2015/task18/)

An overview presentation on many of the methodological aspects of the
Redwoods initiative is available from [an invited
presentation](http://www.delph-in.net/redwoods/vaxjo.pdf) at the 2003
Treebanks and Linguistic Theories workshop.

# Acknowledgements

The Redwoods treebank has been under active development at the CSLI
[LinGO Laboratory](http://lingo.stanford.edu/) since sometime early in
2001. The annotation environment was built from the combination of the
[LKB](http://www.delph-in.net/lkb) tree comparison window (originally
developed by Rob Malouf) and the [\[incr
tsdb()](http://www.delph-in.net/itsdb/)\] profiling tools; Stephan Oepen
did the bulk of the Redwoods software development. Dan Flickinger, as
the main developer of the [ERG](http://www.delph-in.net/erg), has been
an invaluable source of inspiration on the treebank design and has also
been the main treebanker since Redwoods Second Growth. Chris Manning and
Kristina Toutanova, and Stuart Shieber, as early adopters and
consultants on the overall design of the resource and representations,
have greatly influenced the evolution of the treebank and pioneered its
use for stochastic parse selection. Ezra Callahan was the first
annotator, constructing what has been released as the First Growth
during a ten-week summer internship (it appears Ezra then went on to
become employee \#6 at Facebook and retired at age 31). John Beavers did
the annotations of the new ecommerce sections (and later became a
professor of linguistics in Texas). Francis Bond and his colleagues at
the [NTT Research Laboratory](http://www.kecl.ntt.co.jp/icl/mtg/) have
been vigorous supporters, adapted the Redwoods approach for Japanese
(dubbing their treebank
[Hinoki](http://www.kecl.ntt.co.jp/icl/mtg/bib/exp-nlu.php)), and thus
helped a lot in scaling up the technology. Marty Mayberry, Jason
Baldridge, Alex Lascarides, and Miles Osborne, as active users of the
ERG and Redwoods data, have provided crucial feedback on the
representations and software and positively contributed to recent
developments. Tim Baldwin, Emily M. Bender, Kathryn Campbell-Kibler, Ann
Copestake, Andreas Eisele, Rob Malouf, Rebecca Neil, Ivan Sag, Erik
Velldal, and Tom Wasow have all helped through advice and productive
critique in various stages of the project.

The development of the Redwoods treebank was financed opportunistically
from numerous sources, including multiple donations to CSLI from YY
Technologies (Mountain View, CA), a CSLI Seeding Grant, the Stanford
[Symbolic Systems Program](http://symsys.stanford.edu/) (through
multiple sponsored summer internships), the Commission of the European
Community (through the
[Deep-Thought](http://www.project-deepthought.net/) project), Scottish
Enterprise (through the [ROSIE
project](http://www.edinburghstanfordlink.org/projects/intro.html)),
[Nippon Telegraph and Telephone Corporation
(NTT)](http://www.ntt.co.jp/) (through a sponsored research contract to
the LinGO Laboratory), and the [Norwegian LOGON
Initiative](http://www.emmtee.net/) (through financial support to Dan
Flickinger and Stephan Oepen).

Last update: 2022-11-02 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/RedwoodsTop/_edit)]{% endraw %}