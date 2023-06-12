{% raw %}# Propbank/Treebank extraction

The **lkb2standard** tool extracts the constituency representation of
the parse tree.

## Getting and running the tool

You may download the tool
[here](http://nlx-server.di.fc.ul.pt/~jsilva/lkb2standard_release.tar.gz).

The following libraries are required:

common\
Helper functions for handling the tsdb exported files. This is included
in the download.

tregex\
For searching/manipulating trees. You may find it
[here](http://nlp.stanford.edu/software/tregex.shtml).

jargs\
Command line handling. You may find it
[here](http://jargs.sourceforge.net).

To run the tool, use the following command line:

    java \
     -cp /path/to/src:/path/to/libraries/* \
     pt.ul.fc.di.nlx.lkb2standard.Simplifier \
     -c <CONFIGFILE> -v <VERSION>

Output to stdout, unless the OUTPUT field in the configuration file is
defined.

## Additional comments

The tool needs to find a variety of data. The relevant paths are defined
in the configuration file. These paths are closely tied to the way our
repository is organized, but they can be redefined/overridden in the
configuration file. The VERSION number (provided through the command
line above) is used when piecing together the path in order to select
specific versions of the dataset.

The most important fields in the configuration file are:

ADJUDICATION\
The directory that contain the test suite subdirectories which, in turn,
store the .gz files (one per sentence) with the exported data.

CINTIL\
In the repository there is a directory that contains a subdirectory for
each test suite. Each of these subdirectories contains, among many other
files, the items.txt file, which stores an annotated version of all the
sentences in that test suite.

LEXICON\
The file containing the lexicon of the grammar (.tdl format).

The **SSTREEB** and **SUITEGZ** fields are Java regular expressions that
can be used to run the tool over just those test suites and .gz files
matching the given pattern.

* * *

When processing a .gz file from a subdirectory in **ADJUDICATION**, the
tool must find the corresponding subdirectory in **CINTIL**. The mapping
of subdirectory names is done in the Java code (file Traverser.java,
method sstreebDir2cintilDir). This code consists of a set of string
replacement rules that does something like transforming
"SSTreeB-bCINT-123-V03-EXPORT" into "cintil/subCintil/cintilSS-123-V03".
At a given point, these rules should be given in the configuration file,
but currently it requires changing the source code.

The tool looks for an items.txt file in **CINTIL**. This file is not
produced by the grammar (it's specific to our group). The file contains
a set of @-separated fields, with one sentence per line (similar to the
item file). A single line sample is shown below:

    3@CorpusSSNumTB@newspaper@none@1@S@Burnet graduou-se em medicina na Universidade de Melbourne em 1924.@1@22@Burnet/PNM[B-PER] graduou/GRADUAR/V#ppi-3s[O] -se/CL#gn3[O] em/PREP[O] medicina/MEDICINA/CN#fs[O] em_/PREP[O] a/DA#fs[O] Universidade/PNM[B-ORG] de/PREP[I-ORG] Melbourne/PNM[I-ORG] .*//PNT[O]@NLX@2011-07-23

The first field is the sentence identifier, which is the same number
that gives the name to the .gz file exported by tsdb. Most of the other
fields are ignored by the tool, except for the 7th and the 10th. These
are the sentence in plain format and the annotated sentence (in a format
used in our group).

## Further additional comments

Though I'd love it if this tool was found to be immediately useful to
everyone, I'm aware that, as development progressed and the tool became
more complex, it also became more dependent on specific details of our
grammar (e.g. particular derivation rules and category names). I think
that this is inevitable, but perhaps the tool can still be of use for
those wanting to tackle a similar task.

More specifically, things may go wrong when applying directly these
tools to data from other grammars given this tool has some hard-coded
references to:

- In exported files: names of grammar rules and tags of the tag set
specific of our grammar
- In the lexicon: specific lexical type of our grammar
- In annotated sentences: reference to specific Portuguese lexical
items and specificities of our grammar input internal format

## Extra further additional comments

If you need to reference this work, please use the following citation:

- Branco, António, Francisco Costa, João Silva, Sara Silveira, Sérgio
Castro, Mariana Avelãs, Clara Pinto and João Graça, 2010,
[Developing a Deep Linguistic Databank Supporting a Collection of
Treebanks: the CINTIL
DeepGramBank](http://www.di.fc.ul.pt/~ahb/Brancoetal2010.pdf), In
Proceedings of LREC 2010 - The 7th International Conference on
Language Resources and Evaluation. La Valleta, Malta, May
19-21, 2010.

To check the design options of such constituency view, you may find
useful the following handbook:

- Branco, António, Sérgio Castro, João Silva and Francisco Costa,
2011, [CINTIL TreeBank Handbook: Design options for the
representation of syntactic
constituency](http://hdl.handle.net/10455/6746). Department of
Informatics, University of Lisbon, Technical Reports series, nb.
di-fcul-tp-11-02.

To see examples of constituency representation extracted with this tool
and how a treebank extracted with its help looks like, you may want to
check the online search service over our CINTIL-Treebank, which is found
[here](http://lxcenter.di.fc.ul.pt/services/en/LXServicesSearcher.html).

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/VistaExtractionTop/_edit)]{% endraw %}