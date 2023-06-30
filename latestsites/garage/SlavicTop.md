{% raw %}Information and discussion about the "slavic.tdl" project.

# PaGES: parallel grammar engineering for Slavic languages in DELPH-IN

Our long-term goal is to build grammatical resources for Slavic
languages and to make them freely available for the purposes of
research, teaching and natural language applications. A major objective
in this direction is to develop and implement a core Slavic grammar
whose components can be commonly shared among the members of the Slavic
language family and thus facilitate the creation of new linguistically
motivated computational grammars. Our grammar engineering activities
contribute to the on-going international collaborative effort in deep
linguistic processing with Head-driven Phrase Structure Grammar
(DELPH-IN, <http://www.delph-in.net>), and thus have strong affinity to
the Grammar Matrix project initiated by the Linguistic Grammars Online
(LinGO) Lab at Stanford University and continued by the Computational
Linguistics Group at University of Washington. Yet, our approach is
innovative in that we focus on a \*closed set\* of related but extremely
diverse languages about which Corbett (1998) has legitimately observed:
"Slavic languages are sufficiently similar and sufficiently different to
provide an attractive research laboratory."

A decision on the proper set-up along with a commitment to a reliable
infrastructure right from the beginning are essential for such an
endeavor because the implementation of linguistically precise grammars
for natural languages draws on a combination of engineering skills,
sound grammatical theory, and software development tools. From grammar
engineering viewpoint, all Slavic grammatical resources we develop are
based on a starter-kit for rapid prototyping of precision grammars and
extensively utilize the DELPH-IN software, in particular, the Linguistic
Knowledge Builder (LKB) with the evaluation and benchmarking tools
\[incr tsdb()\] as a grammar development platform.

## Technical Matters

We based our Slavic grammar development on the recent LOGON release, as
most of the Cyrillic supports are already there. We use UTF-8 as
encoding for the Russian Grammar. The visualization tools occasionally
have problems on some installations but can usually be fixed rather
quickly. In principle, we would recommend to use the LOGON environment
for the Bulgarian grammar too, and in particular the setup at coli
(Computational Linguistics Department, Saarland University). Also, the
coli system can be used as shared repository for all grammars
(including, at the initial sage of the project, both the Russian and the
Bulgarian resources) so that we can follow each other's progress easily.
Local accounts have to be set up for external partners to use the
centralized installations at coli. These accounts will be included in
the special user group working with DELPH-IN tools at Saarland
University.

## RRG Background

The Russian Resource Grammar (RRG) is being developed under the
following major design features: (i) precision: it delivers accurate,
linguistically grounded information on natural language sentences; (ii)
deep processing: besides information on the major syntactic dimensions
of grammatical constituency and dependency, the grammar delivers (and
generates from) fully-fledged logical representation of the meaning of
natural language sentences; (iii) large-scale: it is planned not to
leave out any sort of regular grammatical construction or phenomena;
(iv) multipurpose: it is intended to make available as much linguistic
information as can be made explicit by automatic means, given the
current state of the art in language technology, with the goal of
offering itself to support the largest possible range of language
technology applications. The grammar can be obtained from
<http://www.coli.uni-saarland.de/~tania/rrg/>.

Last update: 2012-11-16 by TaniaAvgustinova [[edit](https://github.com/delph-in/docs/wiki/SlavicTop/_edit)]{% endraw %}