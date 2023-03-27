{% raw %}# Overview

The Jacy grammar is a broad-coverage linguistically precise grammar of
Japanese. It is based on the HPSG formalism with MRS semantics. LKB is
the primary grammar development environment, but the grammar processing
can be efficiently done with PET.

There is an **[Online
Demo](http://delph-in.github.io/delphin-viz/demo/)** (select "Jacy (UW)"
for the grammar; it assumes that the input is tokenized).

The first application of the Japanese HPSG was the Verbmobil system, a
spoken language machine translation project, where the Japanese HPSG was
used in deep processing of appointment scheduling and travel reservation
dialogues. The grammar was also used in an industrial application of
automatic email response. It was then used in the EU project
[DeepThought](/DeepThought), where the main focus is on building
applications for combined shallow and deep natural language processing.
This project is multilingually oriented, such that much effort is put on
multilingual approaches to grammatical phenomena and building a matrix
grammar that can be used as the basis for the development of further
grammars. After that, it has been used in research on parse ranking with
lexical semantics and [machine translation](https://delph-in.github.io/docs/garage/MtJaen).

Current development is mainly being done by FrancisBond
([NTU](http://www3.ntu.edu.sg/home/fcbond/)), with help from Takayuki
Kuribayashi.

[Melanie Siegel](http://www.melaniesiegel.de) (Hochschule Darmstadt) is
the original principal JACY developer. Major contributions came from
EmilyBender (University of Washington), especially
concerning the MRS construction and numeral expressions.
StephanOepen (Universitetet i Oslo & CSLI Stanford)
contributed support on the grammar development environment, Japanese
font encodings and inclusion of [ChaSen](http://chasen.naist.jp). Ulrich
Callmeier (acrolinx GmbH) contributed the requirements for letting the
grammar run on his fast and efficient PET system. Akira Ohtani,
ChikaraHashimoto, FrancisBond,
[SanaeFujita](/SanaeFujita), Shigeko Nariyama and Takaaki Tanaka
(NTT Communication Science Laboratories - Machine
Translation Research Group) contributed grammar extensions, especially
for verbal compounds and relative sentence constructions, and many
lexicon entries. UlrichSchaefer integrated
[ChaSen](http://chasen.naist.jp), Japanese Named Entity Recognition via
[SProUT](http://sprout.dfki.de) and
[PET](https://delph-in.github.io/docs/garage/PetTop) with the Jacy grammar into
the [Heart of Gold](http://heartofgold.dfki.de) middleware for robust
parsing of Japanese text, adding automatic translations of Chasen's
EUC-JP byte offsets to Unicode character counts. Woodley Packard has
helped with making things work with ACE. GlennSlayden
tested with AGREE. [Michael Goodman](http://www.goodmami.org/) helped
move to github and many enhancements.

- A presentation explaining grammar fundamentals can be downloaded
(<http://www.delph-in.net/jacy/jacy.pdf>).
- There is some on-line documentation available at [JacyDoc](https://delph-in.github.io/docs/grammars/JacyDoc)
(including the [linguistic type database
(LTDB)](http://compling.hss.ntu.edu.sg/ltdb/Jacy_1301/)).
- Instructions for installation are at
[JacyInstallation](https://delph-in.github.io/docs/grammars/JacyInstallation).
- There has been some work on Corpus Annotation with the
[Hinoki](https://delph-in.github.io/docs/grammars/JacyHinoki) treebank.
- Jacy is used in the highly experimental open source
[Japanese-to-English Machine Translation System: JaEn](https://delph-in.github.io/docs/garage/MtJaen)

# Download and Licensing

The grammar sources are available at <https://github.com/delph-in/jacy>.

Use

    git clone https://github.com/delph-in/jacy.git

This checks out the current stable version (trunk) to the local
directory jacy.

JACY is licensed under the [MIT
license](http://www.opensource.org/licenses/mit-license.php).

Copyright (c) 1997-2006 Melanie Siegel, Emily Bender, Stephan Oepen;
Copyright (c) 2007- Francis Bond, Chikara Hashimoto

Maintainer: Francis Bond &lt;<mailto:bond@ieee.org>&gt;

## The MIT License

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. &lt;hr&gt;

It would be nice if you'd give me a short feedback about the usage of
the grammar. I could also offer to write email, when there is a new
version available.

# References

Siegel, Melanie, Bender, Emily M. and Francis Bond (2016). [Jacy: An
Implemented Grammar of
Japanese](https://web.stanford.edu/group/cslipublications/cslipublications/site/9781684000180.shtml).
CLSI Studies in Computational Linguistics. CSLI Publications, Stanford
University. (**Canonical Citation**)

Siegel, Melanie (2006): [JACY - A Grammar for Annotating Syntax,
Semantics and Pragmatics of Written and Spoken Japanese for NLP
Application
Purposes](http://www.melaniesiegel.de/publications/jacy-documentation.pdf).
Habilitation thesis.

Siegel, Melanie and Emily M. Bender (2002): [Efficient Deep Processing
of
Japanese](http://acl.ldc.upenn.edu/coling2002/workshops/data/w02/w02-10.pdf).
In Proceedings of the 3rd Workshop on Asian Language Resources and
International Standardization. Coling 2002 Post-Conference Workshop.
Taipei, Taiwan.
([.bib](http://faculty.washington.edu/ebender/bibtex/SieBen02.bib.txt))

Oepen, Stephan, Emily M. Bender, Uli Callmeier, Dan Flickinger and
Melanie Siegel (2002): Parallel Distributed Grammar Engineering for
Practical Applications. In Proceedings of the Workshop on Grammar
Engineering and Evaluation. Coling 2002 Post-Conference Workshop.
Taipei, Taiwan.

Bender, Emily M. (2002): Number Names in Japanese: A Head-Medial
Construction in a Head-Final Language. Linguistic Society of America.

Kiefer, B., H.-U. Krieger and M. Siegel (2000): An HPSG-to-CFG
Approximation of Japanese. In Proceedings of Coling 2000, Saarbrücken.

Siegel, Melanie (2000): HPSG Analysis of Japanese. In:W.Wahlster(ed.):
Verbmobil: Foundations of Speech-to-Speech Translation., Springer
Verlag.

Siegel, Melanie (2000): Japanese Honorification in an HPSG Framework. In
Proceedings of the 14th Pacific Asia Conference on Language, Information
and Computation, ed. A. Ikeya and M. Kawamori, 289-300. Waseda
University International Conference Center, Tokyo. Logico-Linguistic
Society of Japan.

Siegel, Melanie (1999): The Syntactic Processing of Particles in
Japanese Spoken Language. In: Wang, Jhing-Fa and Wu, Chung-Hsien (eds.):
Proceedings of the 13th Pacific Asia Conference on Language, Information
and Computation, Taipei 1999.

Siegel, Melanie (1998): Japanese Particles in an HPSG Grammar.
Verbmobil-Report 220. Universität des Saarlandes.

Last update: 2021-06-03 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/JacyTop/_edit)]{% endraw %}