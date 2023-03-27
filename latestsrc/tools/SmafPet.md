{% raw %}## SMAF XML Interface to PET

The SMAF XML interface to PET is enabled via the -tok=smaf option to
PET.

SMAF XML can be sent directly to the PET input stream (unfortunately,
each complete input must correspond to a single line -- no newlines!).
Eg.

&lt;smaf&gt;&lt;lattice init='v0' final='v2'&gt;&lt;edge type='pos' id='p1' deps='t1'&gt;&lt;slot name="tag"&gt;NP1&lt;/slot&gt;&lt;/edge&gt;&lt;edge type='token' id='t2' cfrom='2' cto='4' source='v1' target='v2'&gt;won&lt;/edge&gt;&lt;edge type='token' id='t1' cfrom='0' cto='1' source='v0' target='v1'&gt;FooCorp&lt;/edge&gt;&lt;/lattice&gt;&lt;/smaf&gt;

Alternatively the SMAF XML may be provided as the contents of a file
(here the complete input may be spread of multiple lines). Syntax: '@' +
FILENAME. Eg.

    @/tmp/sample.smaf

# SMAF configuration file

You must provide a configuration file. This provides an interpretation
for the edge types used provided in the SMAF input.

Add the following to your PET config file:

    ;; SMAF conf
    smaf-conf := "saf.conf".

A sample SMAF config file is given below:

    define gMap.carg (synsem lkeys keyrel carg) STRING
    
    token.[] -> edgeType='tok' tokenStr=content
    wordForm.[] -> edgeType='morph' stem=content.stem partialTree=content.partial-tree
    ersatz.[] -> edgeType='tok+morph' stem=content.name tokenStr=content.name gMap.carg=content.surface inject='t' analyseMorph='t'
    pos.[] -> edgeType='morph' fallback='' pos=content.tag gMap.carg=deps.content

The sample SMAF given above makes use of the edge type token (where the
token string is "simple content", that is the text content of the XML
element) ; and of the edge type pos (linked to a token element via its
deps attribute, with part-of-speech tag stored in the slot named tag,
and with semantics obtained from the content of the associated token).

For interpretation of part-of-speech tags, see the PET config setting
posmapping (enabled via command line option -default-les).

Last update: 2008-06-05 by BenjaminWaldron [[edit](https://github.com/delph-in/docs/wiki/SmafPet/_edit)]{% endraw %}