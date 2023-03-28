{% raw %}## Discussion II: Strategies for documentation of grammars and tools

FrancisBond presented a brief introduction and introduced
some recent work at Kyoto Unviersity with Jacy [DELPH-IN Documentation:
Grammars and
Treebanks](http://www.kecl.ntt.co.jp/icl/mtg/members/bond/pubs/2005-delphin-documentation.pdf).

### Introduction

- It is hard to keep track of grammars and tools that are being
developed by DELPH-IN members all over the world.
- So we are using the DELPH-IN wikis and mailing-lists, but these are
still incomplete.
- We need documentation in order to make the resources widely useful.

### Work with JACY (Kyoto Uni, NTT, DFKI)

- Semi-Automatic Lexical Type Documentation for the Japanese grammar,
JACY
  - In NTT's HINOKI treebanking project, treebankers are not grammar
developers nor linguists. They need a comprehensive and detailed
documentation, especially for lexical types, to annotate
corpora.
- Requirements:
  - Semi-automatic documentation
  - Flexible browsing
  - Visible to members all over the world
- Key ideas:
  - Store various information as relational databases
  - Browse it through the web: [Jacy Lexical
Types](http://pc1.ku-ntt-unet.ocn.ne.jp/tomcat/lextypeDB/) (be
our guest)

### Discussion

#### How to document

- Description on a high level of the linguistic analysis is often
scattered in different papers. It is useful to collect electronic
versions of as many papers as possible and link them from the
grammar page.
- Granularity of documentation and modes of documentation depends on
users, purposes, or what you want to do with it.
- Modes of documentation
  - documentation for "internal" people, technical, in the grammar
files, viewable from outside.
  - detailed documentation about phenomena, book or papers.
  - very external documentation about installation etc, online
- The grammar could be annotated with examples, typically for the
rules and lexical types.
- Documentation process should be automated as much as one can, as the
NTT system does.
- Grammar writers should set up multi-language test suites on certain
phenomena and differences in the grammars; something like the MRS
testsuite for all grammars.
- Top-level documentation has to be done not only for grammars but
also for systems.
- The model in which one system is maintained by only one developer is
frightening. We need documentation to change this situation.
- The Spanish grammar started with documenting each line of
implementation, different phenomena with examples, types. So, it is
documented by writing the grammar. This is a good way to document
things.
- As we are now expanding the wiki, we need to decide on a licence for
it fast. FrancisBond, egged on by
AnnCopestake, suggested the [Creative Commons Deed
(Attribution 2.5)](http://creativecommons.org/licenses/by/2.5/).
This would allow people to use the wikied documentation in other
works as long as it is attributed.

#### How to motivate people to document

- Some things that have been done for one purpose will be used for
another purpose. So, the documentation will have to be adapted by
people to their needs.
- Researchers need things that can be inserted into one's CV, and LSA
counts electronic documentations as publications, and so does W3C.
This can motivate people to write documents.
  - Jeff Good pointed out that the LSA supports the consideration of
electronic databases and digital resources as publications for
consideration in tenure and promotion
<http://lsadc.org/mar05bulletin/meeting.html>. To make grammars
count as such, we may have to develop some kind of peer review,
similar to the processes defined by the [Open Language Archives
Community](http://www.language-archives.org/). [This
presentation](http://language-archives.org/events/olac05/olac-lsa05-johnson.pdf),
from an LSA tutorial on archiving in 2005 discusses how
archiving can be understood as publication.
- A further reason for documentation is to keep track of your own
information: putting documenation on-line also makes it easy for the
authors to access.
- A particular place it would be nice to have more documentation is in
keeping track of Matrix adaptations, to support the Matrix
development.

#### Future Work

- Set up a standard for peer reviewd documentation
- Make DELPH-IN documenation available to the wider community
- Compare the grammars (how do we want to compare?)

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/LisbonDocumentationDiscussion/_edit)]{% endraw %}