{% raw %}# LinGO Grammar Matrix Customization System Documentation

# Introduction

This document presents background information on the [Grammar Matrix
Customization
System](http://matrix.ling.washington.edu/customize/matrix.cgi) (Bender
et al., 2002; Bender and Flickinger, 2005; Bender et al., 2010). As more
phenomena are added to the system, filling out the questionnaire becomes
a less and less trivial task. In addition, the system allows users to
create more complex grammars increasing the necessary effort to require
a good understanding of the grammar. This documentation is intended to
reduce these efforts and thereby facilitate the grammar engineering
start-up process. It is a first stab at providing feedback to users of
the customization system. Several researchers have contributed to the
development of the LinGO Grammar Matrix Customization System: *we* and
*us* in this document refers to the grammar matrix developers.

# Developers and contact

The matrix developers can be addressed by sending an e-mail to
<mailto:matrix-dev@uw.edu>. There is also a larger mailing list for both
matrix-developers and matrix users: <mailto:matrix@delph-in.net>. We recommend
you subscribe to the latter, so that you may follow and contribute to
discussions on grammar development with the grammar matrix.

Users should feel free to contact either list depending on their
preferences, but we recommend using the matrix-dev mailing list for bug
reports and questions or comments on the customization system. The
general matrix list is recommended for discussion on the Grammar Matrix
itself and questions or comments on implementations for specific
phenomena.

# How to Cite this Work

Papers reporting on grammars based on the Grammar Matrix customization
system should cite [Bender et al
2002](http://faculty.washington.edu/ebender/papers/gee03.pdf)
([.bib](http://faculty.washington.edu/ebender/bibtex/BenFliOep02.bib.txt))
and [Bender et al
2010](http://www.springerlink.com/content/767771152h331808/)
([.bib](http://faculty.washington.edu/ebender/bibtex/BenDreFokPouSal10.bib.txt)).
Papers concerning particular analyses provided by the customization
system should cite the publications associated with the relevant
libraries; links to these can be found on the appropriate MatrixDoc
pages. Only if the relevant information cannot be found in any of those
publications, but only in a MatrixDoc page, should the MatrixDoc page be
cited. We are adding .bib files for each page to indicate what the
citations should look like. Finally, if there is reason to cite the
MatrixDoc pages as a whole, then the following citation should be used,
including an access date:
[.bib](http://faculty.washington.edu/ebender/bibtex/MatrixDoc.bib.txt)

# Libraries

- [General Information](https://delph-in.github.io/docs/matrix/MatrixDoc_GeneralInfo)
- [Word Order](https://delph-in.github.io/docs/matrix/MatrixDoc_WordOrder)
- [Number](https://delph-in.github.io/docs/matrix/MatrixDoc_Number)
- [Person](https://delph-in.github.io/docs/matrix/MatrixDoc_Person)
- [Gender](https://delph-in.github.io/docs/matrix/MatrixDoc_Gender)
- [Case](https://delph-in.github.io/docs/matrix/MatrixDoc_Case)
- [Adnominal Possession](https://delph-in.github.io/docs/matrix/MatrixDoc_AdnominalPossession)
- [Direct Inverse](https://delph-in.github.io/docs/matrix/MatrixDoc_DirectInverse)
- [Tense Aspect and Mood](https://delph-in.github.io/docs/matrix/MatrixDoc_TenseAspectMood)
- [Evidentials](https://delph-in.github.io/docs/matrix/MatrixDoc_Evidentials)
- [Other Features](https://delph-in.github.io/docs/matrix/MatrixDoc_OtherFeatures)
- [Sentential Negation](https://delph-in.github.io/docs/matrix/MatrixDoc_SententialNegation)
- [Coordination](https://delph-in.github.io/docs/matrix/MatrixDoc_Coordination)
- [Matrix Yes/No Questions](https://delph-in.github.io/docs/matrix/MatrixDoc_YesNoQ)
- [Constituent (wh-) Questions](https://delph-in.github.io/docs/matrix/MatrixDoc_WhQuestions)
- [Information Structure](https://delph-in.github.io/docs/matrix/MatrixDoc_InformationStructure)
- [Argument Optionality](https://delph-in.github.io/docs/matrix/MatrixDoc_ArgumentOptionality)
- [Clausal Modifiers](https://delph-in.github.io/docs/matrix/MatrixDoc_ClausalModifiers)
- [Clausal Complements](https://delph-in.github.io/docs/matrix/MatrixDoc_ClausalComplements)
- [Lexicon](https://delph-in.github.io/docs/matrix/MatrixDoc_Lexicon)
- [Morphology](https://delph-in.github.io/docs/matrix/MatrixDoc_Morphology)
- [Import Toolbox Lexicon](https://delph-in.github.io/docs/matrix/MatrixDoc_ImportToolboxLexicon)
- [Test Sentences](https://delph-in.github.io/docs/matrix/MatrixDoc_TestSentences)
- [Test By Generation Options](https://delph-in.github.io/docs/matrix/MatrixDoc_TestByGeneration)

# How to use this information

This documentation contains both general information and library
specific information on the questionnaire and implementations. When you
are aiming at making full use of the questionnaire, it may save time to
read relevant documentation on how to use it. The LinGO Grammar
Customization System is a constant work in progress, and feedback from
users plays an important role in improving the system. Criticism, ideas,
request and questions are therefore very welcome. Information on
implementation is mostly relevant for users new to grammar engineering
with LKB, though more advanced readers may also get a better indication
as to what to expect. Documentation on specific analyses attempts to
describe what the idea behind an analysis is, how it is implemented with
short references of what the exact implementation looks like. The main
idea behind this set-up is to facilitate the understanding of the
grammar for users who have no or little experience in implementing
grammars using LKB. It is assumed, however, that users are familiar with
HPSG, and comfortable with formal analyses.

The descriptions of options and analysis are divided in subsections that
refer to specific phenomena. Implementations that are shared among
several questionnaire options are repeated in individual sections, so
that you only need to read the sections that are relevant for your
grammar. Finally documentation may address upcoming work. This is mainly
of interest to people who are missing options in the current version of
the questionnaire, but it may also be worthwhile to read out of general
curiousity about the ongoing work.

Feedback and tips on future plans are very welcome!

# General instructions on how to use the questionnaire

We attempt to formulate questions in such a way that they are
understandable for people with a background in linguistics, but it is
not a trivial task to provide brief and clear questions. Moreover,
consequences of combining seemingly independent properties are not
always apparent on the surface. Finally, it may not be clear for a user
which options should be selected in case the exact behavior of the
language is not provided. This section provides some general remarks on
how to use the questionnaire.

## Working with the questionnaire

### How to get started

One way to get a sense of the range of possibilities afforded by the
questionnaire is to click on the sample choices files at the bottom of
the main page. This will load the choices file into the questionnaire
(so save a local copy of your choices file first, if you've started one)
and should give a sense of how different analyses play out.

### Customization work flow

The process of filling out the questionnaire is similar to the process
of grammar engineering in general. Just as for grammar engineering, **it
is essential to create, load and test the grammar at regular intervals
during the process**. A vital part of the testing process, even at the
customization stage is the development of **test data containing both
grammatical and ungrammatical examples** which should be maintained and
updated throughout the process.

When taking full advantage of the implementations provided by the
customization system, the starting grammar will have a reasonable size
and several interacting phenomena. Finding and correcting errors through
the customization system can therefore become a complex and cumbersome
task. Regularly testing whether the current choices can create a grammar
that loads, and whether this grammar reveals the expected behavior may
prevent such scenarios. You can download a file called *choices* that
contains the definitions you provided through the web-interface. **It is
recommended to download and save the latest version of your choice file
regularly**, so that you have a recent working version at hand when
something goes wrong later in the process. It may sometimes be easiest
to directly edit the choices file, rather than going through the
customization web-interface. This should be done with care, however,
because there is an additional risk of inserting typos.

Downloading and testing the grammar is also the best way to find out how
alternative options provided by the questionnaire behave. If the
behavior of the grammar is unexpected or if you suspect the created
grammar is due to a bug in the system, **please contact the matrix
developers by sending an e-mail to <mailto:matrix-dev@uw.edu> with your
choices-file attached**. Choices files containing errors or incompatible
properties should be captured by the customization system’s validation
component (providing red asterisks), so any set of choices provided
through the web-interface that fails to create a grammar, or any grammar
that cannot load in the LKB (Copestake, 2002) points to a bug in the
customization system.

### If the "Customize Grammar" button is greyed-out

Not all combinations of choices in the questionnaire lead to coherent
grammars. The customization system attempts to address this through a
process called "validation". If you have not answered required questions
or have given answers that are incompatible from the point of view of
the system, the "customize grammar" and "test by generation" options
will be disabled until the issue is resolved. The questionnaire provides
feedback about what needs to be changed through error and warning
messages. These are indicated by red asterisks (\*) and question marks
(?). The content of the message is available as hover-text on these
items. Red asterisk on the main page will indicate which subpages have
such messages.

### When the exact behavior of your language is missing

If the exact behavior found in your language is not provided by the
system, it is generally worth-while to check whether there are options
that cover a part of the data or slightly overgenerates. Making minor
changes to an existing implementation is generally faster than
implementing the entire phenomenon from scratch. If, for instance, the
language in question has determiners that can appear on either side of
the noun, this can be implemented by choosing “before” as word order.
This allows you to add determiners and the customization system will
provide a head-final specifier-head-rule. The only additions needed are
a copy of the existing specifier-head-rule called “head-specifier-rule”
that is head-initial instead of head-final in the language’s types file,
and a rule inheriting from this additional type in rules.tdl.

It may be the case that the customization system provides the necessary
options for a particular phenomenon, but made assumptions or
generalizations that do not correspond to the exact behavior of the
language. In most cases, such short-comings are due to lack of data when
the phenomenon was added to the customization system. **It is extremely
helpful to report such cases to <mailto:matrix-dev@uw.edu>**, so that we can
correct or extend the libraries in question.

## Working with matrix.tdl

Even though changes and extensions will be made almost exclusively to
the language specific files, it is important to have a good
understanding of the structure of matrix.tdl for two reasons. First,
most language specific types inherit from one or more types defined in
matrix.tdl, and it may be necessary to examine their definitions when
making changes to language specific subtypes. Second, a significant
number of types in matrix.tdl represent phenomena that are currently not
covered by the customization system. Examining matrix.tdl for relevant
types is therefore a useful first step when implementing new phenomena.

Examining matrix.tdl may lead to important observations on the Grammar
Matrix. It may turn out that a given type in matrix.tdl is too
restricted for your language. The development towards an ultimate
multi-lingual resource is a constant work in progress, and observations
based on individual languages are exactly the right source to find
places where the multi-lingual resource should be improved. If you find
the need to make changes to matrix.tdl, **please send an e-mail to the
matrix-mailing (<mailto:matrix@delph-in.net>)** list explaining the motivation
and the proposed changes. **Such information is essential for us, so we
may improve the Grammar Matrix for future users.** Observations about
cross-linguistically valid types that are not present in the Grammar
Matrix are also **good discussion topics for the matrix mailing list**.

# References

Note that a complete list of publications from the Grammar Matrix
project, along with links to bibtex files, is available on the [project
home page](http://www.delph-in.net/matrix).

- Emily M. Bender and Dan Flickinger. 2005. [Rapid prototyping of
scalable grammars: Towards modularity in extensions to a
language-independent
core](http://faculty.washington.edu/ebender/papers/modules05.pdf).
In Proceedings of the 2nd International Joint Conference on Natural
Language Processing IJCNLP-05 (Posters/Demos), Jeju Island, Korea.
- Emily M. Bender, Dan Flickinger, and Stephan Oepen. 2002. [The
grammar matrix: An open-source starter-kit for the rapid development
of cross-linguistically consistent broad-coverage precision
grammars](http://faculty.washington.edu/ebender/papers/gee03.pdf).
In John Carroll, Nelleke Oostdijk, and Richard Sutcliffe, editors,
Proceedings of the Workshop on Grammar Engineering and Evaluation at
the 19th International Conference on Computational Linguistics,
pages 8–14, Taipei, Taiwan.
- Emily M. Bender, Scott Drellishak, Antske Fokkens, Michael Wayne
Goodman, Daniel P. Mills, Laurie Poulson, and Safiyyah Saleem. 2010.
[Grammar Prototyping and Testing with the LinGO Grammar Matrix
Customization
System](http://www.springerlink.com/content/767771152h331808/). In
Proceedings of ACL 2010 Software Demonstrations.
- Emily M. Bender. 2010. [Reweaving a grammar for Wambaya: A case
study in grammar engineering for linguistic hypothesis
testing](http://elanguage.net/journals/index.php/lilt/article/view/662/523).
Linguistic Issues in Language Technology, 3(3):1–34.
- Ann Copestake. 2002. Implementing Typed Feature Structure Grammars.
CSLI Publications, Stanford, CA.

# Acknowledgments

This material is based upon work supported by the National Science
Foundation under Grant No. 0644097. Any opinions, findings, and
conclusions or recommendations expressed in this material are those of
the author(s) and do not necessarily reflect the views of the National
Science Foundation.

Last update: 2022-02-04 by emilymbender [[edit](https://github.com/delph-in/docs/wiki/MatrixDocTop/_edit)]{% endraw %}