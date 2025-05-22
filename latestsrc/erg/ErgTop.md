{% raw %}# ERG User Documentation

The English Resource Grammar (ERG) is a
general-purpose computational grammar that, in combination with
specialized processing tools, can map running English text to highly
normalized logical-form representations of meaning.  A broad-coverage, linguistically precise [HPSG](https://en.wikipedia.org/wiki/Head-driven_phrase_structure_grammar)-based grammar of English, the ERG is semantically grounded in [Minimal Recursion Semantics](https://en.wikipedia.org/wiki/Minimal_recursion_semantics) (MRS), which is a form of flat semantic representation capable of supporting underspecification.  The ERG is developed as part of the international [Deep Linguistic Processing with HPSG Initiative](https://github.com/delph-in/docs/wiki) (DELPH-IN) and can be processed by a number of parsing and realization systems, including the [LKB](https://delph-in.github.io/docs/tools/LkbTop) grammar engineering environment, as well as the [ACE](http://sweaglesw.org/linguistics/ace/) run-time parser, for applications.

An on-line demo of the ERG is available:

- http://delph-in.github.io/delphin-viz/demo/

You can get started quickly with a local compiled copy of the ERG and the ACE parser via [these instructions](https://delph-in.github.io/docs/erg/QuickStart).  For more detailed investigation and experimentation with the grammar, you can obtain a local copy of the grammar source via Github.

- Get the most recent stable version of the ERG:
  
       $ wget https://github.com/delph-in/erg/releases/download/2025/erg-2025-x86-64-0.9.34.dat.bz2 | bunzip2
- Assuming you have a local installation of the ACE parser, call it with the ERG as follows, and type in a sentence to parse:
  
       $ ace -g erg-2025-x86-64-0.9.34.dat -1Tf
       $ Cats are not amused by children whose dogs bark.
- The most recent stable version of the ERG source files is here:
  
       $ wget https://github.com/delph-in/erg/archive/2025.tar.gz   (alternatively, .../archive/2025.zip)
- The latest version of the ERG source files can be downloaded here:
  
       $ git clone https://github.com/delph-in/erg.git

You can also obtain a more complete grammar and processing development environment to help with customization and application development using one or more parsers and generators, via the [ERG Processing](https://delph-in.github.io/docs/erg/ErgProcessing) page.

Following are pointers to existing documentation on how to use the ERG,
make sense of the syntactic and semantic analyses it provides, and
interface to it for parsing or generation:

- [The Semantics Produced by the ERG](https://delph-in.github.io/docs/erg/ErgSemantics)
- [Lexical Types](https://delph-in.github.io/docs/erg/ErgLeTypes)
- [Linguistic Type Database](https://delph-in.github.io/docs/garage/LkbLtdb) for ERG 2025, with example sentences in Redwoods Treebank
- [Syntactic and Lexical Rules](https://delph-in.github.io/docs/erg/ErgRules)
- [Lexical and Phrasal Distinctions](https://delph-in.github.io/docs/erg/ErgTreebankingRules)
- [Tokenization Assumptions](https://delph-in.github.io/docs/erg/ErgTokenization)
- [The Redwoods Treebank](https://delph-in.github.io/docs/garage/RedwoodsTop) Many sentences parsed with the
ERG.
- ERG is released under the [MIT
license](http://svn.delph-in.net/erg/trunk/LICENSE)

# Sample Applications

With high parsing accuracy with rich semantic representations, English
Resource Semantics is a valuable source of information for many
semantically-sensitive NLP tasks. ERS-based systems have achieved
state-of-the-art results in various tasks, including the identification
of speculative or negated event mentions in biomedical text
([MacKinlay](/MacKinlay) et al 2011), question generation (Yao et al
2012), detecting the scope of negation (Packard et al 2014), relating
natural language to robot control language (Packard 2014), and
recognizing textual entailment (PETE task; Lien & Kouylekov 2015). ERS
representations have also been beneficial in semantic transfer-based MT
(Oepen et al 2007, Bond et al 2011), ontology acquisition (Herbelot &
Copestake 2006), extraction of glossary sentences (Reiplinger et al
2012), sentiment analysis (Kramer & Gordon 2014), and the ACL Anthology
Searchbench (Schäfer et al 2011).

# History
The early development and first application of the ERG was in the [VerbMobil](http://verbmobil.dfki.de/) spoken language machine translation project. CSLI's [Linguistic Grammars Online](https://www-csli.stanford.edu/groups/lingo-project) Lab was responsible for building the English grammar for the deep-processing component of Verbmobil, which utilized a semantic transfer approach, requiring both parsing and generation of conversational English dialogues. Since then, the ERG has been used in a commercial application providing automatic response to customer email messages, in a second machine translation research project [LOGON](http://www.emmtee.net/) for Norwegian to English, and for the past decade in grammar correction, beginning in an online English Language Arts course offered to elementary school students as part of Stanford University's [Education Program for Gifted Youth](https://en.wikipedia.org/wiki/Education_Program_for_Gifted_Youth).  This course became part of the spin-off company Redbird's offerings, and most recently part of McGraw-Hill Education's product line as their [Language Arts and Writing](https://www.mheducation.com/prek-12/explore/redbird/language-arts-writing.html) course.  The ERG has also been used to detect and explain grammatical errors in student writing products for second-language learners of English offered by the Beijing-based company Up366. 

Dan Flickinger, formerly at CSLI, Stanford University, is the principal ERG developer. Other individuals who have made major contributions to the grammar are Emily Bender (University of Washington), Ann Copestake (University of Cambridge), Rob Malouf (San Diego State University) and Stephan Oepen (University of Oslo).  Several former graduate students (Brady Clark, Judith Tonhauser, Kathryn Campbell-Kibler, Martina Faller, Ash Asudeh, Susanne Riehemann) and visiting graduate students (Jesse Tseng, University of Edinburgh; Ken Bame, Ohio State University; Judith Eckle-Kohler, University of Stuttgart) also did detailed work, including building the lexicon, developing test suites, isolating phenomena found in corpora and developing analyses in the HPSG formalism.  Jeff Smith (Professor, San Jose State University) has also spent time at CSLI developing various aspects of the grammar.  In addition to this direct implementation work, weekly technical project meetings provided an important forum for critique of specific analyses, particularly from Stanford professors Ivan Sag and Tom Wasow.

# References

Bond, F., Oepen, S., Nichols, E., Flickinger, D., Velldal, E., & Haugereid, P. (2011). Deep open-source machine translation. Machine Translation, 25, 87-105. doi: 10.1007/s10590-011-9099-4

Copestake, A. and Flickinger, D. (2000). An open-source grammar development environment and broad-coverage English grammar using HPSG.  Proceedings of the Second Conference on Language Resources and Evaluation (LREC-2000), Athens.

Copestake, A., Flickinger, D., Pollard, C., & Sag, I. A. (2005). Minimal
Recursion Semantics. An introduction. Research on Language and
Computation, 3(4), 281-332.

Flickinger, D. (2000). [On building a more efficient grammar by
exploiting types.](http://lingo.stanford.edu/danf/flickinger2000.pdf)
Natural Language Engineering, 6 (1), 15-28.

Flickinger, D. (2011). Accuracy vs. robustness in grammar engineering.
In E. M. Bender & J. E. Arnold (Eds.), Language from a cognitive
perspective: Grammar, usage, and processing (pp. 31-50). Stanford: CSLI
Publications.

Flickinger, D., Bender, E. M., & Oepen, S. (2014). Towards an
encyclopedia of compositional semantics: Documenting the interface of
the english resource grammar. In N. Calzolari et al. (Eds.), Proceedings
of the ninth international conference on language resources and
evaluation (LREC'14) (pp. 875-881). Reykjavik, Iceland: European
Language Resources Association (ELRA).

Flickinger, D., Zhang, Y., & Kordoni, V. (2012). [DeepBank](https://delph-in.github.io/docs/garage/DeepBank). A
dynamically annotated treebank of the Wall Street Journal. In (p.
85-96). Lisbon, Portugal: Edições Colibri.

Herbelot, A., & Copestake, A. (2006). Acquiring Ontological
Relationships from Wikipedia Using RMRS. In Proceedings of the ISWC 2006
workshop on web content.

Kramer, J., & Gordon, C. (2014). Improvement of a naive bayes sentiment
classifier using mrs-based features. In Proceedings of the third joint
conference on lexical and computational semantics (\*SEM 2014) (pp.
22-29). Dublin, Ireland: Association for Computational Linguistics and
Dublin City University.

Lien, E., & Kouylekov, M. (2015). Semantic parsing for textual
entailment. In Proceedings of the 14th International Conference on
Parsing Technologies (p. 40-49). Bilbao, Spain.

MacKinlay, A., Martinez, D., & Baldwin, T. (2011). A parser-based
approach to detecting modification of biomedical events. In Proceedings
of the acm fifth international workshop on data and text mining in
biomedical informatics (pp. 51-58). New York, NY, USA: ACM.

Oepen, S., Flickinger, D., Toutanova, K., & Manning, C. D. (2004). LinGO
Redwoods. A rich and dynamic treebank for HPSG. Research on Language and
Computation, 2(4), 575-596.

Oepen, S., Velldal, E., Lnning, J. T., Meurer, P., Rosn, V., &
Flickinger, D. (2007). Towards hybrid quality-oriented machine
translation: On linguistics and probabilities in MT. In Proceedings of
11th conference on theoretical and methodological issues in machine
translation (p. 144-153). Skvde, Sweden.

Packard, W. (2014). UW-MRS: Leveraging a deep grammar for robotic
spatial commands. In Proceedings of the 8th international workshop on
semantic evaluation (semeval 2014) (pp. 812-816). Dublin, Ireland:
Association for Computational Linguistics and Dublin City University.

Packard, W., Bender, E. M., Read, J., Oepen, S., & Dridan, R. (2014).
Simple negation scope resolution through deep parsing: A semantic
solution to a semantic problem. In Proceedings of the 52nd annual
meeting of the association for computational linguistics (volume 1: Long
papers) (pp. 69-78). Baltimore, Maryland: Association for Computational
Linguistics.

Reiplinger, M., Schäfer, U., & Wolska, M. (2012). Extracting glossary
sentences from scholarly articles: A comparative evaluation of pattern
bootstrapping and deep analysis. In Proceedings of the ACL-2012 special
workshop on rediscovering 50 years of discoveries (pp. 55-65). Jeju
Island, Korea.

Schäfer, U., Kiefer, B., Spurk, C., Steffen, J., & Wang, R. (2011). The
ACL Anthology Searchbench. In Proceedings of the ACL-HLT 2011 system
demonstrations (pp. 7-13). Portland, Oregon: Association for
Computational Linguistics.

Yao, X., Bouma, G., & Zhang, Y. (2012). Semantics-based question
generation and implementation. Dialogue & Discourse, 3(2), 11-42.

Last update: 2025-05-22 by Dan Flickinger [[edit](https://github.com/delph-in/docs/wiki/ErgTop/_edit)]{% endraw %}