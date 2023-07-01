{% raw %}# Semantic Harmonization

In order to make processing using MRSs from different grammars more
compatible, we try to do stick to some naming conventions for
predicates. In addition we propose a set of shared universal super
types. These are used by all grammars in the LOGON machine translation
architecture and are kept in the file predicates.tdl.

## Predicate Names

These follow the [RMRS naming convention](https://delph-in.github.io/docs/tools/RmrsPos).

    _lemma_pos_sense_rel  (lexically introduced predicates)
    sense_rel            (abstract predicates introduced by constructions)

## Universal Supertypes

There are some predicate types used in the decomposition of common
words, that we propose could be shared among all DELPH-IN grammars.
Currently (2008-08-13) there is some variation among grammars:

|                     |                     |                     |                     |
|---------------------|---------------------|---------------------|---------------------|
| ERG                 | Example             | JACY                | SRG                 |
| manner\_rel         | *how*               | manner\_rel         | **manner\_n\_rel**  |
| named\_rel          | *Dan*               | named\_rel          | named\_rel          |
| person\_rel         | *who*, *someone*    | **person\_n\_rel**  | person\_rel         |
| place\_n\_rel       | *where*, *here*     | **place\_rel**      | place\_n\_rel       |
| reason\_rel         | *why*               | reason\_rel         | ???                 |
| thing\_rel          | *this*, *something* | thing\_rel          | thing\_rel          |
| time\_n\_rel        | *when*, *now*       |                     |                     |
| which\_q\_rel       | *what*, *when*, ... |                     |                     |
| nominalization\_rel |                     | nominalization\_rel | nominalization\_rel |

- DanFlickinger and FrancisBond will
prpose a set of univerals and
  
  - send to the matrix-list
- After consensus is reached, these will be included as part of the
matrix

# Syntactic Harmonization

There seems to be less to gain from trying to synchronize type-names
across grammars, although it is an interesting research question.

- Try to adopt Matrix types and names where possible
- Anything used in post-processing should be the same if possible
  - e.g., generic types

# Files and Directory Structure

- Writing scripts is made harder by small differences in naming.
  - Version.lsp (ERG, Jacy, SRG); Version.lisp (GG)
  - script, ascript, \_script, ...
- **Solution:** (any volunteers?)
  
  - Try and define a conventional directory structure for grammars
  - Exemplify in the matrix
  - Document in the wiki
  - Only support conventional directory structure in scripts

## Version.l(i)sp structure

Try to go for something like "Grammar Variant (date)", where date is
YYYY-MM-DD

- e.g. "ERG mal (2020-10-16)"

ERG will probably shorten to just YYYY for stable releases:

- e.g. "ERG mal (2020)"

Last update: 2020-06-23 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/HarmonyTop/_edit)]{% endraw %}