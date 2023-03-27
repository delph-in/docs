{% raw %}# Background

We are seeking to collect user-generated text to support the evaluation
of parser adaptation across domain/genre. We are interested in a variety
of registers: Open Access Research Literature, Wikipedia, Technology
Blogs, Product Reviews and User Forums. Secondly we collect text from
sources that discuess with the Linux operating system or natural
language processing. The choice of these domains is motivated by our
assumption that the users of the corpus will be more familiar with the
language used in connection with these topics.

# Collected Data

NLP blogs were obtained in mid-April from the following sites:

- <http://blog.cyberling.org>
- <http://gameswithwords.fieldofscience.com>
- <http://lingpipe-blog.com>
- <http://nlpers.blogspot.com>
- <http://thelousylinguist.blogspot.com>

Linux blogs were also downloaded in mid-April, from:

- <http://embraceubuntu.com>
- <http://www.linuxscrew.com>
- <http://www.markshuttleworth.com>
- <http://www.ubuntugeek.com>
- <http://ubuntu.philipcasey.com>
- <http://www.ubuntu-unleashed.com>

Linux forums were extracted from the Unix & Linux subset of the April
2011 [Stack Exchange Creative Commons
Dump](http://blog.stackoverflow.com/category/cc-wiki-dump/). In this set
a text corresponds to a post (be it a question or an answer). If
necessary threads can be reconstructed by using the primary/new id xref
file.

Linux reviews are from <http://www.softpedia.com/reviews/linux/>. They
possible require some manual cleaning - each review typically ends with
a sentence like 'Check out these screenshots'

The Linux wiki set was created following the method used for
[WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods).

All data and scripts are in
/ltg/jread/workspace/wesearch/data-collection. The content has been
extracted by finding the most specific element that contains all the
relevant text (for example, blog posts typically contain some element
with an attribute indicating that is the content element). All mark-up
related to rendering has been retained for now. Sentences were obtained
from [tokenizer](http://www.cis.uni-muenchen.de/~wastl/misc/) (as used
in creating [WikiWoods](https://delph-in.github.io/docs/garage/WikiWoods)).

|                |                                            |               |                 |                |
|----------------|--------------------------------------------|---------------|-----------------|----------------|
| **Section**    | **Source**                                 | **Documents** | **Total Items** | **Avg. Items** |
| NLP, blog      | <http://blog.cyberling.org>                | 51            | 659             | 12.9           |
|                | <http://gameswithwords.fieldofscience.com> | 457           | 11,014          | 24.1           |
|                | <http://lingpipe-blog.com>                 | 343           | 12,693          | 37.0           |
|                | <http://nlpers.blogspot.com>               | 249           | 7,612           | 30.6           |
|                | <http://thelousylinguist.blogspot.com>     | 536           | 7,748           | 14.5           |
| Linux, blog    | <http://embraceubuntu.com>                 | 220           | 2,957           | 13.4           |
|                | <http://www.linuxscrew.com>                | 312           | 4,049           | 13.0           |
|                | <http://www.markshuttleworth.com>          | 159           | 4,503           | 28.3           |
|                | <http://www.ubuntugeek.com>                | 1,631         | 42,770          | 26.2           |
|                | <http://ubuntu.philipcasey.com>            | 105           | 1,577           | 15.0           |
|                | <http://www.ubuntu-unleashed.com>          | 278           | 6,362           | 22.9           |
| Linux, forums  | stack exchange                             | 9,945         | 54249           | 5.5            |
| Linux, reviews | softpedia                                  | 249           | 13,430          | 53.9           |

# Initial Parsing Results

|               |       |          |        |           |      |         |       |
|---------------|-------|----------|--------|-----------|------|---------|-------|
| Section       | Items | Coverage | Length | Ambiguity | Time | Tokens  | Types |
| NLP, wiki     | 11558 | 86.4%    | 18.0   | 10859     | 8.2  | 238059  | 19396 |
| NLP, blog     | 46106 | 81.9%    | 15.5   | 8158      | 6.1  | 838592  | 41771 |
| Linux, wiki   | 40738 | 85.0%    | 18.5   | 12407     | 9.6  | 843082  | 45783 |
| Linux, blog   | 92280 | 83.7%    | 11.1   | 5151      | 3.9  | 1000683 | 48511 |
| Linux, review | 14761 | 84.6%    | 18.1   | 10610     | 7.5  | 304672  | 13158 |
| Linux, forum  | 85743 | 74.8%    | 11.0   | 4885      | 3.1  | 1115412 | 56673 |

Corpus statistics for each section. *Coverage* shows what precentage of
items received an analysis (using the unadapted parser 'out of the
box'), and *ambiguity* and *time* give an indication of average parsing
complexity (for the 'vanilla' parser configuration). *Tokens* shows the
token count of each section and *types* is the number of unique,
non-punctuation tokens seen per section.

# Data Preparation

- Given an HTML document, extract elements specified by a set of
XPaths.
- Sentence segment using tokenizer adapted to handle HTML tags---P,
LI, PRE, DIV force line breaks.
- Simplify by:
  - removing automatically generated text
  - removing superfluous whitespace
  - removing comments
  - removing some attributes (e.g. HREF)
  - ersatzing CODE and IMG
- Filter CODE and IMG if they occur in isolation. Filter OL, UL,
TABLE.
- Create line-oriented [itsdb](/itsdb) import files with only one
source and up to 1,000 items. Do not split documents across
profiles.

## Identifier Format

Initial WDC identifiers take the form of:

- DGSPPPPPIIII

where:

- D : 'domain' (1=linux, 2=nlp)
- G : 'genre' (1=academic, 2=blogs, 3=forum, 4=reviews, 5=wiki)
- S : source (unique to domain and genre):
  - 121=embraceubuntu.com
  - 122=ubuntu.philipcasey.com
  - 123=www.linuxscrew.com
  - 124=www.markshuttleworth.com
  - 125=www.ubuntugeek.com
  - 126=www.ubuntu-unleashed.com
  - 221=blog.cyberling.org
  - 222=gameswithwords.fieldofscience.com
  - 223=lingpipe-blog.com
  - 224=nlpers.blogspot.com
  - 225=thelousylinguist.blogspot.com
- P : post (unique to domain, genre and source)
- I : item, (unique to domain, genre, source and post)

## Output

- Profile import files as lists of IDs and items.
- Pointer file for each profile, with lines corresponding to items,
with item start index in source document, and lists of pairs (start,
length) indicating deletions.
- Cross-reference file with document ids CSDDDDDD and source URL.

# Parsing Results on clean data

*(wiki results just copied from above)*

|               |       |          |        |      |        |
|---------------|-------|----------|--------|------|--------|
| Section       | Items | Coverage | Length | Time | Tokens |
| NLP, wiki     | 11558 | 86.4%    | 18.0   | 8.2  | 238059 |
| NLP, blog     | 38498 | 80.8%    | 17.6   | 8.3  | 676080 |
| Linux, wiki   | 40738 | 85.0%    | 18.5   | 9.6  | 843082 |
| Linux, blog   | 64520 | 82.3%    | 13.2   | 5.7  | 854157 |
| Linux, review | 13430 | 80.4%    | 19.8   | 9.2  | 266063 |
| Linux, forum  | 54249 | 82.0%    | 14.8   | 5.6  | 802736 |

And again on clean blog data:

|             |       |          |                 |      |        |
|-------------|-------|----------|-----------------|------|--------|
| Section     | Items | Coverage | Length (parsed) | Time | Tokens |
| NLP, blog   | 39726 | 82.9%    | 17.2 (14.8)     | 7.0  | 681896 |
| Linux, blog | 62216 | 82.2%    | 13.0 (11.1)     | 4.6  | 808600 |

## Observed Tags

|            |           |                                                                        |
|------------|-----------|------------------------------------------------------------------------|
| Tag        | Frequency | Definition                                                             |
| p          | 51214     | paragraph                                                              |
| br         | 39709     | single line break                                                      |
| div        | 17426     | section in a document                                                  |
| li         | 17267     | list item                                                              |
| strong     | 8103      | strong text                                                            |
| img        | 7329      | image                                                                  |
| blockquote | 3474      | long quotation                                                         |
| h1         | 3265      | Header 1                                                               |
| code       | 2821      | computer code text                                                     |
| td         | 2623      | cell in a table                                                        |
| em         | 1320      | emphasized text                                                        |
| h4         | 1313      | Header 4                                                               |
| var        | 1166      | variable part of a text                                                |
| h3         | 1051      | Header 3                                                               |
| h2         | 988       | Header 2                                                               |
| small      | 976       | small text                                                             |
| tr         | 945       | row in a table                                                         |
| param      | 211       | parameter for an object                                                |
| ol         | 204       | ordered list                                                           |
| font       | 184       | font, color and size for text (deprecated)                             |
| table      | 183       | table                                                                  |
| input      | 157       | input control                                                          |
| th         | 146       | header cell in a table                                                 |
| tt         | 115       | teletype text                                                          |
| kbd        | 80        | keyboard text                                                          |
| sup        | 76        | superscripted text                                                     |
| s          | 71        | strikethrough text (deprecated)                                        |
| tbody      | 68        | groups the body content in a table                                     |
| sub        | 53        | subscripted text                                                       |
| col        | 44        | attribute values for one or more columns in a table                    |
| label      | 38        | label for an input element                                             |
| dt         | 12        | term in a definition list                                              |
| dd         | 10        | description of a term in a definition list                             |
| acronym    | 6         | acronym                                                                |
| dl         | 6         | definition list                                                        |
| abbr       | 4         | abbreviation                                                           |
| noscript   | 4         | an alternate content for users that do not support client-side scripts |
| h5         | 2         | Header 5                                                               |

# Other Potential Sources

## Open Access Research Literature

- The [ACL Anthology Reference
Corpus](http://acl-arc.comp.nus.edu.sg/), a snapshot of the ACL
Anthology content up to February 2007. 10,921 articles in PDF, and
text dumps from [pdfbox](http://pdfbox.apache.org/). The data is
available in \~jread/data/acl-arc.
- The [Proceedings of Advances in Neural Information Processing
Systems](http://books.nips.cc/), 24 volumes of PDFs
- The [PubMed](http://www.ncbi.nlm.nih.gov/pubmed) database, indexing
approximately 3,000,000 free full text English biomedical articles
(and 4,000 Norwegian free full text articles).

## Wikis

- The [WeScience](https://delph-in.github.io/docs/garage/WeScience) corpus composed of Wikipedia articles in
the domain of Natural Language Processing.
- [ThinkWiki](http://www.thinkwiki.org/wiki/ThinkWiki), a collection
of reference materials and HOWTOs for Think Pad users, with a
particular focus on linux. All information found on this wiki is
published under the GNU Free Documentation License.
- [The One Laptop Per Child
Wiki](http://wiki.laptop.org/go/The_OLPC_Wiki) describes work and
ideas related to the One Laptop Per Child project. The content is
available under Creative Commons Attribution 3.0.
- [Dr
Wiki](http://askdrwiki.com/mediawiki/index.php?title=Physician_Medical_Wiki)
is a nonprofit educational web site made by physicians for
physicians, medical students, and healthcare providers. Content is
available under Creative Commons Attribution-Non Commercial-Share
Alike 3.0 Unported.

## Product Reviews

- [Polarity
2.0](http://www.cs.cornell.edu/people/pabo/movie-review-data/), a
collection of 2,000 movie reviews originally posted on Usenet.
Reviews are classified according to sentiment, and tokenised by
sentence. Capitalisation information has been removed. About
1,400,000 tokens in 64,000 sentences.
- Bing Lui's [Amazon Product Review
Data](http://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html)
contains about 5.8 million customer product reviews from Amazon,
(about 980 million words). Licensing information is not mentioned,
but Amazon's website says *<span class="small">"Amazon grants you a
limited license to access and make personal use of this site and not
to download (other than page caching) or modify it, or any portion
of it, except with express written consent of Amazon. This license
does not include any resale or commercial use of this site or its
contents; any collection and use of any product listings,
descriptions, or prices; any derivative use of this site or its
contents; any downloading or copying of account information for the
benefit of another merchant; or any use of data mining, robots, or
similar data gathering and extraction tools. This site or any
portion of this site may not be reproduced, duplicated, copied,
sold, resold, visited, or otherwise exploited for any commercial
purpose without express written consent of Amazon."</span>*. The
data is available in \~jread/data/lui
- The [Multi-Domain Sentiment
Dataset](http://www.cs.jhu.edu/~mdredze/datasets/sentiment/) also
contains Amazon product reviews in several domains. The processed
reviews are distributed as feature vectors. The unprocessed data is
available in \~jread/data/mdsd.
- [Epinions](http://www.epinions.com/) collects consumer reviews in
the domains of: cars, books, movies, music, computers, electronics,
gifts, home/garden, kids/family, office supply, sports and travel.
Their usage policy states that <span class="small">*"Using any
automated means to access the site or collect any information from
the site"*</span> is inappropriate, but perhaps it's worth sending
an email, as [Paolo
Massa](http://www.trustlet.org/wiki/Extended_Epinions_dataset)
obtained a dump directly from Epinions (but unfortunately did not
retain the textual data).
- <http://www.category5.tv/product_reviews/> (creative commons).
- <http://www.geek.com/> *<span class="small">"© 2010 Geeknet, Inc.
"</span>*... but copyright details make no mention of
redistribution.
- <http://www.reviewlinux.com/>. Creative Commons licensed reviews of
linux distributions.
- <http://news.softpedia.com/cat/Reviews/Linux-software/>
'enthusiast'-generated content. Need to request copyright exemption.

## Blogs

- The [Spinn3r Blog Dataset](http://www.icwsm.org/data/) contains 44
million blog posts, with metadata including original site and topic
tags. The [usage
agreement](http://icwsm.org/2009/data/icwsm-spinn3r.pdf) prohibits
redistribution of the content. A sample is available at
\~jread/data/sp inn3r-sample.xml.
- Glasgow distributes the
[Blogs06](http://ir.dcs.gla.ac.uk/test_collections/) collection of
3.2 million blog articles. Costs £400 and subject to a user
agreement prohibiting redistribution.
- The [Blog Authorship
Corpus](http://u.cs.biu.ac.il/~koppel/BlogCorpus.htm), 140 million
words in posts collected from blogger.com. Annotated with blogger
gender and age. No license information provided. Available at
\~jread/data/koppel.
- [SlashDot](http://slashdot.org/) *<span class="small">"All
trademarks and copyrights on this page are owned by their respective
owners. Comments are owned by the Poster. The Rest © 1997-2010
Geeknet, Inc."</span>*... but copyright details make no mention of
redistribution.
- Linux: <http://embraceubuntu.com/> <http://linuxhelp.blogspot.com/>
<http://planet.ubuntu.com/> <http://www.ubuntuhq.com/>
<http://polishlinux.org/> <http://linuxhelp.blogspot.com/>
<http://www.ubuntu-unleashed.com/> <http://www.linuxscrew.com/>
<http://www.fsckin.com/> <http://www.ubuntugeek.com/>
<http://bashcurescancer.com/> <http://tweako.com/section/Linux>
<http://www.markshuttleworth.com/> <http://ubuntu.philipcasey.com/>
- NLP/IR: <http://nlpers.blogspot.com/> <http://lingpipe-blog.com/>
<http://apperceptual.wordpress.com/>
<http://arnoldit.com/wordpress/> <http://blog.codalism.com/>
<http://researchonsearch.blogspot.com/>
<http://anand.typepad.com/datawocky/> <http://battellemedia.com/>
<http://www.searchenginecaffe.com/>
- ML: <http://anyall.org/blog/> <http://blog.smola.org/>
<http://datamining.typepad.com> <http://www.dataists.com/>
<http://mark.reid.name/iem/> <http://mlstat.wordpress.com/>
<http://hunch.net/> <http://www.machinedlearnings.com/>
<http://thenoisychannel.com/>

## Mailing Lists

- DELPH-IN
- MOSES
- The [Usenet
Corpus](http://www.psych.ualberta.ca/~westburylab/downloads/usenetcorpus.download.html),
consisting of 28 million documents (each between 500 and 500,000
words in length, from around 48,000 different newsgroups. Licensed
under a Creative Commons Attribution-Noncommercial-Share Alike 2.5
Canada License.

## User Forums

- The [Stack Overflow Data
Dump](http://blog.stackoverflow.com/category/cc-wiki-dump/) is from
a question/answer website with content relating to cooking, game
development, gaming, mathematics, photography, server faults, stack
apps, programming, system administration, ubuntu, web applications
and web administration. Shared under Creative Commons Attribution
Share Alike 2.5 Generic.
- [LinuxQuestions](http://www.linuxquestions.org), no license
declaration.
- [UbuntuForums](http://www.ubuntuforums.org), license owned by
Canonical, but no restrictions specified.
- [Nabble](http://www.nabble.com/) is a free forum hosting service
with no license declaration. Many different topics and several
languages.

# Related Work

- Baldwin, T., Martinez, D., Penman, R. B., Kim, S. N., Lui, M.,
Wang, L. and [MacKinlay](/MacKinlay), A. (2010) [Intelligent Linux
Information Access by Data Mining: the ILIAD
Project](http://www.aclweb.org/anthology/W/W10/W10-0508.pdf).
Proceedings of the NAACL HLT 2010 Workshop on Computational
Linguistics in a World of Social Media.
- Nichols, E., Murakami, K., Inui, K., and Matsumoto, Y. (2009)
[Constructing a Scientific Blog Corpus for Information Credibility
Analysis](http://cl.naist.jp/~eric-n/papers/bscorpus-pacling2009-paper.pdf).
Proceedings of PACLING 2009.
- Weimer, M., Gurevych, I and Mühlhäuser, M. (2007). [Automatically
Assessing the Post Quality in Online Discussions on
Software](http://www.aclweb.org/anthology-new/P/P07/P07-2032.pdf).
Proceedings of the ACL 2007 Demo and Poster Sessions.

# Next Steps

- count numbers of sources and documents (within each source)
- two-level stratification: across sources, then across documents
- 2,000 items per collection as held-out data for future generations
- 2,000 items per collection as test data, to be treebanked

Last update: 2012-03-05 by RebeccaDridan [[edit](https://github.com/delph-in/docs/wiki/WeSearch_DataCollection/_edit)]{% endraw %}