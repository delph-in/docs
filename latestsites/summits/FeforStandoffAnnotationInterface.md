{% raw %}# Time

1200 to ??? Weds 14th.

# Topics

Interface between standoff XML interface (SMAF) and the deep parser
(deep grammar running on LKB/PET).

Sketch:

\* Discuss the standard for the process (x) below:

PREPROCESSING --.--&gt; SMAF XML <span class="strike">x</span>&gt; deep
parser

\* Current SMAF looks something like (see also
[SmafExample](/SmafExample)):

{{{&lt;?xml version='1.0' encoding='UTF-8'?&gt;

- &lt;!DOCTYPE smaf SYSTEM 'smaf.dtd'&gt; &lt;smaf
addressing='char'&gt;
  
  - &lt;olac:olac
xmlns:olac='<http://www.language-archives.org/OLAC/1.0/>'
xmlns='<http://purl.org/dc/elements/1.1/>'
xmlns:xsi='<http://www.w3.org/2001/XMLSchema-instance>'
xsi:schemaLocation='<http://www.language-archives.org/OLAC/1.0/>
<http://www.language-archives.org/OLAC/1.0/olac.xsd'%3E>
    
    - &lt;dc:identifier&gt;s1&lt;/dc:identifier&gt;
&lt;creator&gt;sciborg 1.00&lt;/creator&gt;
&lt;created&gt;16:18:08 6/07/2006 (UTC)&lt;/created&gt;
    
    &lt;/olac:olac&gt; &lt;fsm init='v0' final='v3'&gt;
    
    - &lt;edge type='token' id='t1' from='0' to='3' value='some'
source='v0' target='v1'/&gt; &lt;edge type='oscar' id='o4'
from='4' to='13' source='v1' target='v2'&gt;
      
      - &lt;fs&gt;
        
        - &lt;f name='type'&gt;compound&lt;/f&gt; &lt;f
name='surface'&gt;[A1S2D34F5](/A1S2D34F5)&lt;/f&gt;
        
        &lt;/fs&gt;
      
      &lt;/edge&gt; &lt;edge type='token' id='t3' from='14'
to='19' value='melts' source='v2' target='v3'/&gt;
    
    &lt;/fsm&gt;
  
  &lt;/smaf&gt;}}}

\* SMAF edges may take a variety of types: Eg.

- token
- morph
- named-entity
- pos
- oscar

\* SMAF edges possess a number of properties: id, standoff from/to,
lattice source/target + a content blob

\* A content blob consists of

- either TEXT
- or one or more of the following:
  - RMRS
  - slots
  - (typed feature structure)

\* \[[SciBorg](/SciBorg)\] We have been playing with the use of a config
file to define the mapping (x). This looks something like:

    ;;;; PROCESSOR settings (LKB) (share with PET?)
    
    ;; "instantiate chart" with edges of following form:
    ;; token edges (edgeType='tok'), possess: a string (tokenStr)
    ;; non-token edges (edgeType='morph'), may possess: stem + partialTree
    ;; non-token edges which also give rise to token edge in chart (edgeType='tok+morph'):
    ;;    union of 'tok' and 'morph' above
    
    token.[] -> edgeType='tok' tokenStr=content
    morph.[] -> edgeType='morph' stem=content.stem partialTree=content.partial-tree
    pos.[] -> edgeType='morph'
    oscar.[] -> edgeType='tok+morph' tokenStr=content.surface
    
    ;;;; GRAMMAR specific settings (ERG)
    
    ;; map SMAF type into type in grammar's type hierarchy
    ;; map SMAF RMRS content into lexical entry
    
    ;; "slot" definitions
    
    define gMap.type ()
    define gMap.pred (synsem lkeys keyrel pred)
    define gMap.carg (synsem lkeys keyrel carg) STRING
    define gMap.rel (synsem lkeys keyrel)
    
    ;; syn(sem) type
    
    oscar.[type='compound'] -> gMap.type='n_proper_nale'
    oscar.[type='substance'] -> gMap.type='n_proper_nale'
    oscar.[type='element'] -> gMap.type='n_proper_nale'
    oscar.[type='namender'] -> gMap.type='n_proper_nale'
    oscar.[type='adjective'] -> gMap.type='adj_intrans_nale'
    
    ;; semantics 
    
    ;; either pure native RMRS
    
    oscar.[] -> gRmrs=content.rmrs
    
    ;; or slots (REL + CARG)
    
    oscar.[type='compound'] -> gMap.pred='chem_compound_rel'
    oscar.[type='substance'] -> gMap.pred='chem_substance_rel'
    oscar.[type='element'] -> gMap.pred='chem_element_rel'
    oscar.[type='namender'] -> gMap.pred='named_rel'
    
    oscar.[type='compound'] -> gMap.carg=content.surface
    oscar.[type='substance'] -> gMap.carg=content.surface
    oscar.[type='element'] -> gMap.carg=content.surface
    oscar.[type='namender'] ->  gMap.carg=content.surface
    
    ;; or feature structures as in MAF??? no

\* Collect and examine some examples...

Last update: 2006-06-14 by BenjaminWaldron [[edit](https://github.com/delph-in/docs/wiki/FeforStandoffAnnotationInterface/_edit)]{% endraw %}