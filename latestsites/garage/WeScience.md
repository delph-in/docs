{% raw %}# Background

The WeScience initiative is an on-going effort to provide resources that
enable eScience research and development in our own field, i.e.
Computational Linguistics (or Natural Language Processing). Some of the
motivating ideas and goals are sketched by [Ytrestøl, Flickinger, &
Oepen (2009)](http://www.delph-in.net/wescience/tlt09.pdf). WeScience
aims to (help) improve the accessibility of scholarly literature and
digital libraries, with a special emphasis on community or open access
resources. Current development is focused on semantic parsing of
encyclopedic articles (from the on-line community resource
[Wikipedia](http://en.wikipedia.org)), with the long-term goal of
relating natural language semantics and taxonomic knowledge, for example
in relation extraction or ontology learning applications. As a
complementary element, we plan to include a selection of scientific
articles (from the [ACL Anthology](http://aclweb.org/anthology-new/),
for example), with candidate applications ranging over, among others,
function and attitude analysis for citations, attribution tracking,
indexing by complex content properties (for example specific sub-fields,
hypotheses, methods used), association to encyclopedia entries (or
ontology nodes), or so-called 'semantic search'.

WeScience, in its early stages of 2008, 2009, and 2010, was a
semi-formal collaboration between the [University of
Oslo](http://www.mn.uio.no/ifi/english/research/groups/ltg/), the
[Center for the Study of Language and
Information](http://lingo.stanford.edu/), the [German Research Center
for AI](http://www.dfki.de/lt), and [Saarland
University](http://www.coli.uni-saarland.de), with partial funding from
the University of Oslo, the [Norwegian Open Research
Archives](http://www.ub.uit.no/wiki/openaccess/index.php/NORA), and the
[Norwegian Metacenter for Computational Science](http://www.notur.no).
Since 2011, WeScience is partially supported by the [WeSearch](https://delph-in.github.io/docs/garage/WeSearch)
project.

# Current State of Development

WeScience comprises two components, the *WeScience Corpus* (discussed in
more detail by [Ytrestøl, et al.
(2009)](http://www.delph-in.net/wescience/tlt09.pdf)) and the *WeScience
Treebank*. The corpus comprises a selection of
[Wikipedia](http://en.wikipedia.org) articles in the domain of Natural
Language Processing, pre-processed to strip irrelevant markup and
segmented into sentence-like units. WeScience defines a simple,
line-oriented textual exchange format for the corpus, aiming to strike a
good balance between computer and human readability (there are formal
considerations too that make the use of XML infeasible). Each
sentence-like unit has a unique 8-digit identifier, with the first four
digits referencing the underlying article. The corpus is broken into 16
sections, each of a maximum of 1000 segments, where no article is split
across sections. Sections 14 through 16 are reserved for evaluation
purposes.

The corpus is extracted from a [Wikipedia
snapshot](http://www.delph-in.net/wescience/enwiki-20080727-pages-articles.xml.bz2)
of July 2008, and more details of the corpus construction (selection,
pre-processing, organization, et al.) are available as a [technical
report](http://www.delph-in.net/wescience/Ytrestol:09.pdf) (Ytrestøl,
2009).

Development of the WeScience Treebank builds on the LinGO [English
Resource Grammar](http://www.delph-in.net/erg) (ERG) and
[Redwoods](http://www.delph-in.net/redwoods) discriminant-based
treebanking approach. Starting with its [April
2010](http://svn.delph-in.net/erg/tags/1010) version, releases of the
ERG include the majority of the WeScience Corpus in treebanked form (see
below).

# Obtaining the Corpus and Treebank

As of early 2009, the WeScience Corpus has been released in three
versions. Revisions 0.1 and 0.2 were purely internal releases and are
now superseded by the present release, revision 0.3. This is publicly
and freely available in a variety of formats. The recommend method of
obtaining the WeScience Corpus is by virtue of the SubVersion (SVN)
revision management system. A command like:

      svn co http://svn.emmtee.net/trunk/uio/wescience wescience

will retrieve the latest development version (i.e. revision 0.3, as of
early 2009) and create a new subdirectory wescience/. This directory
will contain both the raw, un-processed
[Wikipedia](http://en.wikipedia.org) articles (in the raw/
sub-directory) and the actual WeScience Corpus, in the format described
above (in the txt/ sub-directory). For those without a functional SVN
client (M$ Windoze users, maybe), this data is also available as a
compressed Un\*x tar(1)
[archive](http://www.delph-in.net/wescience/corpus.0.3.tgz).

Regarding availability of the first release of the WeScience Treebank,
please watch this space (or the [DELPH-IN](http://www.delph-in.net)
[mailing lists](http://lists.delph-in.net)). At present, treebanks for
the first thirteen WeScience sections are provided in [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) format as part of the ERG
release.

# Exporting Various Plain-Text Formats

To experiment with these treebanks, however, for the time being, large
parts of the DELPH-IN toolchain are required. We recommend working with
the *trunk* (aka head revision) of the integrated [LOGON
distribution](https://delph-in.github.io/docs/tools/LogonTop). For a quick-start guide to installing this
software, please see the [ErgProcessing](https://delph-in.github.io/docs/erg/ErgProcessing) page
(specifically the *Output Formats* section; however, we strongly advise
perusing the full LOGON documentation, linked from the
[LogonTop](https://delph-in.github.io/docs/tools/LogonTop) page, for more technical background).

Assuming a functional, up-to-date LOGON installation, one can export the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) treebanks into various
textual formats, for example using a command like the following:

      cd $LOGONROOT
      ./redwoods --binary --erg --target /tmp/wescience \
        --export derivation,tree,mrs,eds ws01

If there were broad interest, we may also provide a textual export
version of WeScience for direct download in the future (as is available
for the [WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods) Treecache, where running the export step
requires non-trivial computational resources).

# Further Notes for DELPH-IN Users

The WeScience Corpus is available as so-called [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) skeletons too, i.e. the result
of importing the text files (the pre-processed ones, obviously) into the
[\[incr tsdb()\]](http://www.delph-in.net/itsdb) database. These
skeletons have been part of the [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) distribution through the LOGON
tree (see the [LogonTop](https://delph-in.github.io/docs/tools/LogonTop) page) since late 2008. The WeScience
skeletons are called ws01 through ws16, and these same names are used in
organizing the WeScience Treebank.

# Outlook: Next Steps

# Acknowledgements

Last update: 2012-08-05 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/WeScience/_edit)]{% endraw %}