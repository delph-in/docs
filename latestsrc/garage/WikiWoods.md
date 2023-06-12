{% raw %}# Background

WikiWoods is an ongoing initiative to provide rich syntacto-semantic
annotations for the full [English Wikipedia](http://en.wikipedia.org). A
high-level discussion of the WikiWoods motivation and general
methodology is provided by [Flickinger et al.
(2010)](http://www.delph-in.net/wikiwoods/lrec10.pdf). The corpus itself
and a preliminary set of parsing results (in [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) form only, for the time being)
are available for download (see below); please consult the related
[WeScience](https://delph-in.github.io/docs/garage/WeScience) page for (emerging) instructions on how to
utilize this data. The first public release is now available for
download from this site, in two different formats (see below).

# Corpus Organization

The WikiWoods Corpus is extracted from a [Wikipedia
snapshot](http://www.delph-in.net/wescience/enwiki-20080727-pages-articles.xml.bz2)
of July 2008 (the version originally used for the manually treebanked
[WeScience](https://delph-in.github.io/docs/garage/WeScience) sub-corpus). As of mid-2010, the corpus comprises
close to 1.3 million content articles, for a total of around 55 million
‘sentences’ (or other types of root-level utterances). The corpus is
available in two forms: (a) as a collection of [raw
articles](http://ltr.uio.no/wikiwoods/1004/raw.tar) (4.4 gigabytes
compressed), prior to preprocessing; (b) as a set of preprocessed and
sentence-segmented [text
files](http://ltr.uio.no/wikiwoods/1010/txt.tar), including normalized
wiki mark-up (2.2 gigabytes compressed); and (c) in a more recently and
more thoroughly preprocessed [plain-text
version](http://ltr.uio.no/wikiwoods/1212/gml.tar), using more
normalized [GML mark-up](https://delph-in.github.io/docs/tools/ErgGml).

Both sets of files are organized by segments, each comprised of 100
articles. Please see [Flickinger et al.
(2010)](http://www.delph-in.net/wikiwoods/lrec10.pdf) and [Solberg
(2012)](https://www.duo.uio.no/handle/10852/34914) for details.

# First Release (1004)

As of May 2010, parsing the WikiWoods corpus is complete, and [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) profiles are available for
[download](http://ltr.uio.no/wikiwoods/1004) (typically, one would
extract the HPSG derivation from the *result* relation, i.e. field \#11
of the underlying tsdb(1) data files). Each archive contains [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) data files for about 1300
WikiWoods segments, and the files are designed to ‘plug into’ the
directory structure of the so-called [LOGON](https://delph-in.github.io/docs/tools/LogonTop) distribution.

To simplify access to the derivation trees, and to readily make
available other views on the HPSG analyses—as described by [Flickinger
et al. (2010)](http://www.delph-in.net/wikiwoods/lrec10.pdf)—we also
provide a set of plain text files, exported from [\[incr
tsdb()\]](http://www.delph-in.net/itsdb). As of early June, export files
are available for [download](http://ltr.uio.no/wikiwoods/1004) as ten
archives, each containing compressed export files for about 1300
segments. Due to technical issues in a few corner cases, some 30
segments are currently still missing from these exports.

# Subsequent Versions

For each of the official ERG releases since April 2010, the full
WikiWoods Corpus was re-parsed, re-exported, and packaged in the same
set of formats as provided for the initial release. More in-depth
instructions on how to utilize this data are, sadly, still pending. The
[1111 release](http://ltr.uio.no/wikiwoods/1111) of WikiWoods has been
stable for a while. As of mid-2013, a [1212
release](http://ltr.uio.no/wikiwoods/1212) is available, moving to a
newer version of the underlying corpus and taking advantage of the
advances in content extraction from Wikipedia and markup processing
developed by [Solberg
(2012)](https://www.duo.uio.no/handle/10852/34914).

# License Information

The original Wikipedia content, i.e. the WikiWoods Corpus (as of 2008)
is licensed under the [GNU Free Documentation
License](https://www.gnu.org/licenses/old-licenses/fdl-1.2.html)
(Version 1.2). HPSG annotations of the raw text, i.e. the WikiWoods
Treecache, are made available under the terms of the [GNU Lesser General
Public License](https://www.gnu.org/licenses/lgpl.html) (Version 3).

# Acknowledgements

This work is in part funded by the University of Oslo, through its
research partnership with the Center for the Study of Language and
Information at Stanford University. Experimentation and engineering on
the scale of Wikipedia is made possible through access to the
[high-performance computing](http://www.uio.no/hpc) facilities at the
University of Oslo, and we are grateful to the [Scientific Computing
staff at UiO](http://www.usit.uio.no/suf/vd), as well as to the
[Norwegian Metacenter for Computational Science](http://www.notur.no).
Distribution of the WikiWoods data is supported by the national
[NorStore Storage Infrastructure](http://www.norstore.no) and the UiO
on-line [Language Technology Resources](http://ltr.uio.no) collection.

# Related Projects

Following is an attempt at listing related initiatives. In case you know
of additional pointers that should be included, please email
Stephan Oepen.

Last update: 2021-07-20 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/WikiWoods/_edit)]{% endraw %}