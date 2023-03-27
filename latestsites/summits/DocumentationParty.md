{% raw %}Morphological analyzer notes

Existing documentation:

- [LkbSppp](https://delph-in.github.io/docs/tools/LkbSppp)
- [FreeLing SPPP README](http://svn.emmtee.net/trunk/upf/srg/freeling/README)
- [CLARIN paper](http://portal.acm.org/citation.cfm?id=1564038)
- [ChartMapping](https://delph-in.github.io/docs/garage/ChartMapping)

What's SPPP? In the same space as chart mapping, may become redundant.
Predates chart mapping. Might also overlap with REPP, supported in LKB
and soon in PET.

> Send question to Rebecca: Will SPPP be part of extended support for PET?


\[oe, 15-jul-11\] SPPP is unrelated to chart mapping. It is rather yet
another way of feeding partially annotated token lattices into the
parser; by and large, SPPP is an XML rendering of the good old YY
format. SPPP currently is only supported in the LKB; currently there are
no plans for supporting it in PET. Rather, FSC should probably be
augmented (to support annotation of token edges with mandatory
applications of orhtographemic rules; see my email to 'developers' of
today) and also be implemented in the LKB (to replace SMAF; this should
not be too hard, but Ann or oe would seem the two most viable candidates
to actually do the implementation).

Current REPP processing does damage for English to the input text
because TNT requires punctuation stripped. That's lossy --- throwing
spaces around a hyphen etc. Doesn't arise in terms of generation.

ERG generation -- some lisp code at the end provides some patching up
like sentence-initial capitalization.

Ask Montse about generation and also the question on
[ChartMappingAppliedNotes](https://delph-in.github.io/docs/summits/ChartMappingAppliedNotes) from Paris meeting.

Montse's reply: SRG not currently used for generation but
[FreeLing](/FreeLing) **is** bidirectional. Regarding the question on
[ChartMappingAppliedNotes](https://delph-in.github.io/docs/summits/ChartMappingAppliedNotes):

"Actually I had several reasons:

- to follow the same approach as the other systems, I think I was the
only one using SPPP.
- to keep FL and SRG as two independent tools, though, we've already
managed to do that with SPPP.
- to integrate chunks into the SRG, that is, just as we translate PoS
chunks into Feature Structures, I want to translate (some) chunk
mark-ups into feature structures. Though this may be also done with
SPPP, not sure.

Yes, I still want to integrate chunks. As for the way to do it... I'd
rather follow the most efficient strategy, so I'd be happy to change the
strategy if it is worth."

What about Jacy? Chasen on the way out? BURGER very large fully
inflected form dictionary

Chart mapping is fully supported in PET and planned for the LKB. But
mostly for robustness over real phenomena real corpora. Other use is
passing along morphological ambiguity to the parser. Montse could want
this too in the LKB for Spanish. ([por tanto\] tiempo\] v. \[por \[tanto
tiempo](/por%20tanto%5D%20tiempo%5D%20v.%20%5Bpor%20%5Btanto%20tiempo))

Time involved in chart mapping is mostly in the rules to create more or
fewer tokens.

No chart mapping in the LKB yet, so that takes us back to SPPP as the
recommended connection in the parsing direction. Nothing in the
generation direction yet.

No one in DELPH-IN currently going through a morphological
analyzer/generator on the way out, but this is of interest to the Matrix
group so we can continue to claim that morphophonology does not have to
be handled within the Matrix-based grammar.

Posssible MA/MS project:

- Hook up existing reversible morphophonological analyzer to existing
grammar in the generation direction
- Do this in a way that it can be added to the customization system as
an option.

Montse/Luis [FreeLing](/FreeLing) might be good beta testers

OpenFST --- should be reversible SPRouT --- reversible?

Last update: 2021-06-02 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/DocumentationParty/_edit)]{% endraw %}