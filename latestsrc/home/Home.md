{% raw %}# DELPH-IN Overview

The DELPH-IN Consortium is a collaboration among computational linguists
from research sites world-wide working on ‘deep’ linguistic processing
of human language. The goal is the combination of linguistic and
statistical processing methods for getting at the meaning of texts and
utterances. The partners have adopted Head-Driven Phrase Structure
Grammar (HPSG) and Minimal Recursion Semantics (MRS), two advanced
models of formal linguistic analysis. They have also committed
themselves to a shared format for grammatical representation and to a
rigid scheme of evaluation, as well as to the general use of open-source
licensing and transparency.

DELPH-IN is a long-standing collaboration over many years involving
researchers from the following institutions, among others:

- [Bulgarian Academy of Science](http://www.bas.bg/) (Bulgaria),
[Linguistic Modeling Department](http://lml.bas.bg/)
- [University of Cambridge](http://www.cam.ac.uk/) (UK), [Department
of Computer Science and Technology](http://www.cst.cam.ac.uk/)
- [Getulio Vargas Foundation](https://portal.fgv.br) (Brazil), [Applied
Mathematics Department](https://emap.fgv.br)
- [IBM Research](https://www.research.ibm.com/) (Brazil), [Brazil
Research Lab](https://www.ibm.com/blogs/research/category/ibmres-bra/)
- [Kyung Hee University](http://www.kyunghee.ac.kr/) (Korea),
[School of English](http://khenglish.khu.ac.kr/)
- [Norwegian University of Science and
Technology](http://www.ntnu.no/) (Norway), [Department of Language
and Communication Studies](http://mime.hf.ntnu.no/hf/isk/)
- [Palacký University Olomouc](https://www.upol.cz/en/) (Czechia),
[Department of Asian Studies](https://kas.upol.cz/en/)
- [CNRS](http://www.cnrs.fr/) & [Université Paris
Diderot](http://www.univ-paris-diderot.fr/) (France), [Laboratoire
de Linguistique Formelle (UMR 7110)](http://www.llf.cnrs.fr/)
- [University of Oslo](http://www.uio.no/) (Norway), [Language
Technology
Group](http://www.mn.uio.no/ifi/english/research/groups/ltg/)
- [University of Sussex](http://www.sussex.ac.uk/) (UK), [AI
Research Group](https://www.sussex.ac.uk/research/centres/ai-research-group/)
- [University of Washington](http://www.washington.edu/) (US),
[Computational Linguistics Laboratory](http://www.washington.edu/)
- [Vrije Universiteit Amsterdam](https://vu.nl/en/) (Netherlands), [Computational Linguistics & Text Mining Lab](http://www.cltl.nl/)
- [Western Norway University of Applied Sciences](https://www.hvl.no/en) (Norway), [Department of Language, Literature, Mathematics and Interpreting](https://www.hvl.no/en/about/management/faculty-of-education-arts-and-sports/department-of-language-literature-mathematics-and-interpreting/)

### Former members

- [DFKI Saarbrücken GmbH](http://www.dfki.de/) (Germany), [Language
Technology Lab](http://www.dfki.de/lt/) (co-founder)
- [Melbourne University](http://www.unimelb.edu.au/) (Australia),
[Language Technology Group](http://www.cs.mu.oz.au/research/lt/)
- [Nanyang Technological University](http://www.ntu.edu.sg/)
(Singapore), [Division of Linguistics and Multilingual
Studies](http://www.ntu.edu.sg/HSS/Linguistics/)
- [National Institute of Information and Communications Technology](https://www.nict.go.jp/en/) (NICT: Japan)
- [NTT Communication Science
Laboratories](http://www.kecl.ntt.co.jp/) (Japan),
[Interaction Research Group](http://www.kecl.ntt.co.jp/icl/icl/interaction_research.html)
- [Saarland University](http://www.uni-saarland.de/) (Germany),
[Department for Computational
Linguistics](http://www.coli.uni-sb.de/)
- [Stanford University](http://www.stanford.edu/) (US), [LinGO
Laboratory at CSLI](http://lingo.stanford.edu/) (co-founder)
- [Universtitat de Barcelona](http://www.ub.edu/) (Spain), [Grup de
Recerca Interuniversitari en Aplicacions Lingüístiques
(GRIAL)](http://grial.uab.es/)
- [University of Lisbon](http://www.ul.pt/) (Portugal), [Natural
Language and Speech Group](http://nlx.di.fc.ul.pt/)
- [Universtitat Pompeu Fabra](http://www.upf.edu/) (Spain), [Institut
Universitari de Lingüística Aplicada
(IULA)](http://www.iula.upf.edu/)
- [University of Tokyo](https://www.u-tokyo.ac.jp/en/) (Japan)

The DELPH-IN collaboration is open to additional partners and individuals
who share our goals and are interested in contributing to the common task.

## Components and Resources

### Tools and Architectures

- [DelphinWelcome](https://delph-in.github.io/docs/home/DelphinWelcome)
- [LKB](https://delph-in.github.io/docs/tools/LkbTop): Lexical Knowledge Builder --- Grammar Engineering
Environment
- [\[incr tsdb()](https://delph-in.github.io/docs/tools/ItsdbTop)\]: Competence and Performance Profiler
- [ACE](https://delph-in.github.io/docs/tools/AceTop): Answer Constraint Engine, parsing and generation
with DELPH-IN grammars
- [PyDelphin](https://delph-in.github.io/docs/tools/PyDelphinTop): Python library for working with
DELPH-IN representations
- [LOGON](https://delph-in.github.io/docs/tools/LogonTop): Information about the LOGON machine translation
infrastructure.
- [Pet](https://delph-in.github.io/docs/garage/PetTop): Platform for Experimentation with efficient HPSG
processing Techniques
- [Other tools](https://delph-in.github.io/docs/tools/ToolsTop): Supporting software, addons, peripheral
contributions

### Grammars, Frameworks and Treebanks

- [English Resource Grammar](https://delph-in.github.io/docs/erg/ErgTop): DELPH-IN's most comprehensive
grammar.
  - [Tutorial](https://delph-in.github.io/docs/howto/ErsTutorial) on using the ERG, presented at NAACL
2016
  - [Documentation](https://delph-in.github.io/docs/erg/ErgSemantics) of the ERG's semantic
representations
- [Catalogue of Grammars](https://delph-in.github.io/docs/grammars/GrammarCatalogue), including
broad-coverage grammars for German, Japanese, Norwegian, and
Spanish, along with significant grammars for several other
languages.
- [Matrix](https://delph-in.github.io/docs/matrix/MatrixTop): Starter-Kit for rapid prototyping of
LKB-compatible precision grammars
- [CLIMB](https://delph-in.github.io/docs/garage/ClimbTop): Tools to support grammar development of
LKB-compatible precision grammars
- [Redwoods](https://delph-in.github.io/docs/garage/RedwoodsTop): HPSG Treebank Comprised of Analyses
from the ERG
- [MRS](https://delph-in.github.io/docs/tools/RmrsTop): Minimal Recursion Semantics --- Theory and
Implementation (including extensions and variants such Robust MRS
(RMS), Elementary Dependency Structures (EDS) and Dependency MRS
(DMRS))
  - [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics): Emerging documentation of MRS
as used in the ERG
  - [RmrsDiscussions](https://delph-in.github.io/docs/tools/RmrsDiscussions): Links to discussions
related to MRS at various DELPH-IN events
- Shared Corpora, [Treebanks](https://delph-in.github.io/docs/tools/TreebankingTop)
  - [MRS Test Suite](https://delph-in.github.io/docs/grammars/MatrixMrsTestSuite): Core Test Suite (\~100
sentences)
  - [Cathedral and the Bazaar](https://delph-in.github.io/docs/grammars/MatrixMrsCatb): Parallel Corpus
based on an Open Source Essay (\~800 sentences)
- [Grammar discussions](https://delph-in.github.io/docs/garage/GrammarDiscussionsTop): Discussions for
grammar developers (analyses, terminology, harmonization, …)
- [DELPH-IN RFCs](https://delph-in.github.io/docs/tools/DelphinRFCs) (Requests For Comments; formal
specifications)

### Applications

- [DELPH-IN Applications](https://delph-in.github.io/docs/home/DelphinApplications)

## About this Site

This is the on-line wiki forum for DELPH-IN software and resources. It
serves to enable both developers and users to incrementally create
further documentation and up-to-date information on aspects of
installation or usage of DELPH-IN technology. Mostly to enforce some
discipline among ourselves, these pages require that users are
registered to the wiki server in order to obtain write access. Please
create a WikiName for yourself, which may require obtaining
a ‘textcha’ to protect against wiki spam; once registered at the wiki,
to request write access please contact info *at* delph-in.net. The
developers do hope that active DELPH-IN users will contribute to these
pages over time.

## Archives

Some information from the earlier years of DELPH-IN collaborations is
preserved on the following pages, for historical interest:

- Earlier DELPH-IN news items
- [Links to earlier DELPH-IN-related projects](https://delph-in.github.io/docs/home/OldProjects)
- [Earlier overviews of the DELPH-IN consortium](https://delph-in.github.io/docs/garage/OldOverviews)

## Further Information

There is a collection of [DELPH-IN mailing
lists](http://lists.delph-in.net/) to which users can subscribe on-line
and browse archives of previous postings through the [DELPH-IN mailing
list](http://lists.delph-in.net/) manager. If you click on a list, there
is a link to the archive near the top of the page.

There is also an active [stack-exchange style
forum](http://discourse.delph-in.net), using the Discourse platform.

DELPH-IN is organized by a [standing commitee](https://delph-in.github.io/docs/summits/StandingCommitteeGroup/), but it is pretty informal.

Last update: 2024-08-28 by Francis Bond [[edit](https://github.com/delph-in/docs/wiki/Home/_edit)]{% endraw %}