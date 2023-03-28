{% raw %}# Chart Mapping Applied

## Prosodic structures and temporal constraints

Katya: would like to integrate gesture and prosodic information in HPSG
(put prosodic objects/Ewan Klein's metrical trees in XML via PET input
chart into PET)

Designated Terminal Elements (DTE)

Example "He mixes mud" \[with gesture\]

Update: there is now a stylesheet that converts Anvil XML to PET's FSC
format, speech tokens with associated gestures are identified by means
of timestamp overlap and enriched with gesture information (part of
Heart of Gold's XSLT stylesheet collection:
[anvil\_gesture2fsc.xsl](http://heartofgold.opendfki.de/browser/trunk/xsl/fsc/anvil_gesture2fsc.xsl))

## Reducing parser search space

Brackets mapping

Johan Benum Evensberget (Oslo) has started experiments in Saarbrücken
with robustness rules that include bracket information

- brackets should be implemented as tokens, not features
- Dan wants to look at Johans approach and help with smooth ERG
integration (naming conventions etc.)
- Uli tests with ACLA corpus

Ann: look at Jurafsky ACL 2010: [Profiting from Mark-Up: Hyper-Text
Annotations for Guided
Parsing](http://stanford.edu/~jurafsky/markup.pdf)

## Integration of external resources

Morphology:

- Montse wants to move from SPPP to FSC (motivation: also integrate
chunker information)
- Peter, Stephan: should be possible with the current system, once LKB
provides support for FSC.

Goal: get rid of legacy input modes (PIC, SMAF), see
[PetRoadMap](https://delph-in.github.io/docs/garage/PetRoadMap)

Ann wants to look into SMAF code and give an estimation on the amount of
effort to migrate to FSC

Last update: 2011-10-09 by anonymous [[edit](https://github.com/delph-in/docs/wiki/ChartMappingAppliedNotes/_edit)]{% endraw %}