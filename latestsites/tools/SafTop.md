{% raw %}# Overview

SAF follows the principles of standoff annotation. This means that:

- the SAF standoff document exists separately to the *primary data*
document;
- standoff pointers link annotations in the standoff document to
regions of the *primary data*.

Properties of each **annot**:

- an **id**entifier
- a **type** (eg. **token**, **pos**, **namedEntity**,
**morpho**syntax, ...)
- a **source** and a **target** node in lattice
- \[optional\] a span (defined by standoff pointers **from**/**to**)
- \[optional\] **deps**, a set of edge ids corresponding to edges on
which the current edge has a dependency
- plus the actual content of the annotation, consisting of a
combination of the following elements:
  - a simple **value** attribute
  - simple **slot** elements: each consists of a **name** part (eg.
surface, weight, tagset, tag, ...) and a **value** string
  - complex features structure (**fs**) elements: these may be
typed, and the format is compatible with the TEI/ISO standard
(FSR)
  - complex **rmrs** elements: following the [RmrsDtd](https://github.com/delph-in/docs/tree/main/schemas)

# SAMPLE token EDGE

       <annot type='token' id='t1' from='0' to='6' source='v0' target='v1'>
        <slot name='surface'>Andrew</slot>
       </annot>

# SAMPLE pos EDGE

       <annot type='pos' id='p1' deps='t1' source='v0' target='v1'>
         <slot name='weight'>0.5</slot>
         <slot name='tagset'>CLAWS</slot>
         <slot name='tag'>NNP</slot>
       </annot>

# SAMPLE named entity EDGE

       <annot type='namedEntity' id='n1' from='10' to='20' source='v0' target='v1'>
        <slot name='weight'>0.567</slot>
        <slot name='surface'>1987 to 1997</slot>
        <fs type='timespan'>
           <f name='from'>
              <fs type='point'>
                <f name='year'>
                  <fs type='1987'/>
                </f>
              </fs>
           </f>
           <f name='to'>
              <fs type='point'>
                <f name='year'>
                  <fs type='1997'/>
                </f>
              </fs>
           </f>
         </fs>
       </annot>

# SAMPLE external morphosyntax EDGE

       <annot type='morph' deps='t1' source='v0' target='v1'>
        <slot name='weight'>0.5</slot>
        <slot name='tagset'>morph</slot>
        <slot name='reduced'>SMILE</slot>
       </annot>

# SAF DTD

See [SafDtd](https://delph-in.github.io/docs/tools/SafDtd).

# Sample SAF Document

See [SafSample](/SafSample).

Last update: 2021-09-02 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/SafTop/_edit)]{% endraw %}