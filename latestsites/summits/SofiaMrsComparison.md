{% raw %}# MRS Comparison Discussion

This page captures some of the discussion on MRS comaprison at the
[Sofia Meeting](https://delph-in.github.io/docs/summits/SofiaTop). The discussion was led by
FrancisBond using slides by [MathieuMorey](/MathieuMorey)
and had many participants.

## MRS comparison using graph matching algorithms

([MathieuMorey](/MathieuMorey))

- Context and motivation:
  - work on the Tanaka Corpus
  - development of Jacy: crosslingual parse ranking
  - development of Jaen: acquisition of transfer rules
- Compare the MRSs produced by the ERG and Jacy+Jaen and
  - find the most similar ones: parse ranking
  - bridge the gap between similar MRSs,
    - i.e. find how transform one into the other:
    - acquisition of transfer rules.
- As MRSs are (directed acyclic) graphs, these problems can be seen as
  - **inexact graph matching problems**
- Differences between MRSs can be formulated in terms of graph edit
operations, with associated costs:
  - insertion/deletion of EPs,
  - insertion/deletion of ARG links,
  - substitution of a relation following the type hierarchy, ...
- Transfer rules then correspond to sequences of graph edit
operations.

### Pros and Cons of graph matching approach

- Pros:
  - graph matching is more robust and flexible than comparing
n-grams of Elementary Dependencies,
  - graph edit operations directly describe transfer rules,
  - MRSs have specific properties (DAGness, relatively small size,
finite number of possible labels) that (should) help to limit
the algorithmic complexity.
- Cons:
  - finding optimally interesting/useful edit costs is not trivial,
  - automatically partitioning the set of edit operations (between
two big MRSs) into linguistically meaningful transfer rules is
tricky (guide with patterns e.g. N+ADJ $\\rightarrow$ N+N)
  - a lot of options to explore

### Current State

- Implementation in python (still in preliminary stages):
  - graph matching,
  - graph visualisation (currently graphviz dot),
  - native graph persistency (currently neo4j)
- Wish and will do:
  - make it easy to play with edit costs and to add new graph
matching algorithms,
  - push the code to an online repository: python-delphin ?
  - integrate as much as possible with existing libraries: DELPH-IN,
nltk, ...
\\includegraphics\[width=\\textwidth\]{1090410-3-0\_0-0.png}
(Buggy but colorful)

Last update: 2012-07-12 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/SofiaMrsComparison/_edit)]{% endraw %}