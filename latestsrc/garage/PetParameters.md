{% raw %}# Overview

The Cheap Parameters are defined in grammar.set, written in pseudo TDL
syntax. It is normally placed in a directory pet/grammar.set in the same
directory as the grammar.grm file.

# flop Parameters

# cheap Parameters

orthographemics-maximum-chain-depth::

- Limit on the maximum depth for each chain of orthographemic rules.

orthographemics-minimum-stem-length::

- Minimum length for the hypothesized stem at the \`bottom' of the
chain, such that no chains will be hypothesized that assume stems
shorter than that threshold.

orthographemics-duplicate-filter::

- Boolean flag as to whether to allow multiple occurences of the same
rule within a chain.

orthographemics-cohesive-chains::

- Boolean flag as to whether to require the unfication rule filter to
license all feeding relations in a chain, i.e. assuming that there
will not be interspersed applications of non-orthographemic lexical
rules.

sm::

- Name of the file containing the scoring model used to rank the
results. The file should be put in the same directory as the
grammar.grm.

<!-- -->


    sm := "vm6p.mem".

Last update: 2005-04-01 by FrancisBond [[edit](https://github.com/delph-in/docs/wiki/PetParameters/_edit)]{% endraw %}