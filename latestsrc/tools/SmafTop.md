{% raw %}# Overview

SMAF is the proposed XML-input format for use with the DELPH-IN deep
processors. A SMAF document describes a segment (generally, a sentence)
of data packaged for input to a deep processor/parser such as the LKB or
PET. This XML-input format is an amalgamation of ideas taken from (and
intended to subsume) [MAF](http://atoll.inria.fr/perl/maf/mafhelp.html),
the Pet Input Chart used in the HoG system
([HeartofgoldTop](https://delph-in.github.io/docs/garage/HeartofgoldTop)), the SPPP ([LkbSppp](https://delph-in.github.io/docs/tools/LkbSppp)) mode
implemented in the LKB, and
[SAF](http://www.cl.cam.ac.uk/~bmw20/Papers/NLPXML06-SAF.pdf), and
incorporates RMRS XML.

SMAF follows the principles of standoff annotation. This means that:

- the standoff document exists separately to the *primary data*
document;
- standoff pointers (here these are character pointers) link
annotations in the standoff document to regions of the *primary
data*.

Each SMAF document describes a segment of the primary data for input to
a deep parser (such a segment typically corresponds to the notion of a
sentence). The following properties are global to each standoff
document:

- either **document** (URL link to primary data) or **text** (embedded
primary data, for convenience)... (or both, in which case document
takes precedence)
- an optional **addressing** scheme, defaulting to **char** (**char**
= Unicode character pointer; **xpoint** = xpoint-based consisting of
XPath-expression and character/node offset)
- OLAC-compatible metadata: document **identifier**, plus optional
**creator**, **created** \[timestamp\],...
- a global span (**cfrom**/**cto**)
- a single global **lattice**, consisting of
  
  - specified **init**(ial) and **final** nodes
  - a set of **edge**s, each describing an annotation over the
primary data

Properties of each **edge**:

- an **id**entifier
- a **type** (eg. **token**, **pos**, **namedEntity**,
**morpho**syntax, ...)
- a **source** and a **target** node in lattice
- \[optional\] a span (defined by standoff pointers **cfrom**/**cto**)
- \[optional\] **deps**, a set of edge ids corresponding to edges on
which the current edge has a dependency
- plus the actual content of the annotation, consisting of a
combination of the following elements:
  - simple **slot** elements: each consists of a **name** part (eg.
surface, weight, tagset, tag, ...) and a **value** string
  - complex features structure (**fs**) elements: these may be
typed, and the format is compatible with the TEI/ISO standard
(FSR)
  - complex **rmrs** elements: following the RmrsDtd.

# SMAF/LKB

See [SmafLkb](https://delph-in.github.io/docs/tools/SmafLkb).

# SMAF/PET

See [SmafPet](https://delph-in.github.io/docs/tools/SmafPet).

# SMAF configuration

On receiving a SMAF document as input, a deep parser will map the SMAF
object into internal data structures. The format has been designed so
that this mapping is reasonably straightforward for specific deep parser
implementation + grammar combinations (but also general enough to
abstract over the specifics of individual software components and
grammars). Although many SMAF properties map fairly directly into the
internal data structures of individual processors, a certain amount of
configuration is required to make this go smoothly.

The lattice structure of the edges (source, target) and inter-edge
dependencies (deps) can be mapped straightforwardly into internal data
structures of a chart parser. The cfrom/cto properties of edges may be
copied as is.

However, configuration is necessary to correctly map content (slots,
fs's, rmrs's) into internal data structures. The edge type may be used
to configure and constrain this mapping (eg. the content expected for a
token edge sill differ to that for a pos edge will differ to that for a
named-entity edge etc.).

Sample SMAF configuration settings:

    ;; PROCESSOR settings
    
    token.[] -> edgeType='tok' tokenStr=content
    wordForm.[] -> edgeType='morph' stem=content.stem partialTree=content.partial-tree
    pos.[] -> edgeType='morph'
    oscar.[] -> edgeType='tok+morph' tokenStr=content.surface
    
    ;; GRAMMAR settings
    
    ;; "slot" definitions
    
    define gMap.type ()
    
    ;; syn(sem) type
    
    oscar.[type='compound'] -> gMap.type='n_proper_nale'
    oscar.[type='substance'] -> gMap.type='n_proper_nale'
    oscar.[type='element'] -> gMap.type='n_proper_nale'
    oscar.[type='namender'] -> gMap.type='n_proper_nale'
    oscar.[type='adjective'] -> gMap.type='adj_intrans_nale'
    
    ;; semantics (REL + CARG)
    
    oscar.[] -> rmrs=rmrs

# SAMPLE SMAF XML

See also: [SmafSample](https://delph-in.github.io/docs/tools/SmafSample)

    <?xml version='1.0' encoding='UTF-8'?>
    <!DOCTYPE smaf SYSTEM 'smaf.dtd'>
    <smaf document='/some/path/x.txt'>
     <text>The dog barks.</text>
     <lattice init='v0' final='v3' cfrom='0' cto='14'>
      <edge type='token' id='t1' cfrom='0' cto='3' source='v0' target='v1'>The</edge>
      <edge type='token' id='t2' cfrom='4' cto='7' source='v1' target='v2'>dog</edge>
      <edge type='token' id='t3' cfrom='8' cto='14' source='v2' target='v3'>barks.</edge>
      <edge type='pos' id='p1' source='v0' target='v1' deps='t1'><slot name='tag'>DET</slot></edge>
      <edge type='pos' id='p2' source='v1' target='v2' deps='t2'><slot name='tag'>NN</slot></edge>
      <edge type='pos' id='p3' source='v2' target='v3' deps='t3'><slot name='tag'>VBZ</slot></edge>
     </lattice>
    </smaf>

# SMAF DTD

See [SmafDtd](https://delph-in.github.io/docs/tools/SmafDtd).

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/SmafTop/_edit)]{% endraw %}