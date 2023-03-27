{% raw %}# Discussion: MRS Post-Processing

# Moderator: Berthold Crysmann; Scribe: Stephan Oepen

# Objective

There is currently some de facto recognition of the need for further
harmonisation of MRS outputs beyond what is standardly delivered by
DELPH-IN grammars:

- The LOGON MT architecture caters for two accommodation phases: one
on the source language side (post-parsing), one on the target
language side (pre-generation). MRS accommodation includes full MRS
term rewriting in addition to variable property mapping.
- Plain output of current DELPH-IN grammars relies on MRS
post-processing in order to reach full linguistic adequacy: in the
ERG, treatment of idioms is deferred to a post-parsing MRS
sanitisation step. Other grammars (e.g. GG) maintain some
idiosyncrasies in their output, inter alia for reasons of efficiency
in generation (\_.\*\_x\_sel\_rel etc.). Languages with total
reduplication (e.g. Indonesian, Hausa etc.) may need to eliminate
the superfluous PRED of the reduplicant..

Consumers of MRS are not limited to MT transfer components. Still, such
consumers (e.g., multi-lingual IE applications) will certainly benefit
from more harmonic MRS output.

# Proposal

- MRS harmonisation should be a logical part of the grammar. In real
life, however, standardisation of output representation is only one
of several design criteria in grammar development. MRS Matrix++
compliance is probably best achieved with an MRS processing step.
- Integration of full MRS harmonisation with the grammar/parser
benefits other content-oriented multilingual applications, besides
MT
- Decoupling of MRS harmonisation from the parsing phase permits
grammars to be written more flexibly.
- Processing systems (LKB/PET) already provide (some of) the machinery
needed for post-parsing/ pre-generation accomodation. E.g., PET's
chart mapping fromalism is in part modelled after the MRS transfer
machinery. It may therefore be straightforward to reuse the code for
output manipulation.

# Notes

Last update: 2009-07-19 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/BarcelonaPostprocessing/_edit)]{% endraw %}