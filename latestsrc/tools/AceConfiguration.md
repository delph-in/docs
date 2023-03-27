{% raw %}# ACE configuration file

This page documents various options in ACE's grammar-specific
configuration file.

The ACE configuration file uses a TDL-like syntax; comments start with
semicolons, and each other line looks like:

**parameter := value.**

The format of the **value** field varies depending on the parameter.

Values that are filesystem paths are always in double quotes and are
relative to the configuration file's location.

Paths to other files:

|                           |                                                                                |
|---------------------------|--------------------------------------------------------------------------------|
| version                   | path to a text file containing the grammar version within double quotes        |
| grammar-top               | path to a TDL file that includes the rest of the grammar                       |
| preprocessor              | path to a .rpp file defining the REPP                                          |
| preprocessor-modules      | list of *unquoted* paths to REPP modules to enable                             |
| maxent-model              | path to a .mem file for ranking                                                |
| variable-property-mapping | path to the VPM definition for parsing/generating                              |
| input-vpm                 | path to the input VPM definition, when 'transfer' is set to 'enabled'          |
| output-vpm                | path to the output VPM definition, when 'transfer' is set to 'enabled'         |
| parse-node-labels         | path to a TDL file defining parse node labels (unused)                         |
| generation-ignore-signs   | path to a file listing rule and lexeme names to disable for generation         |
| generation-ignore-lexemes | path to a file listing more lexeme names to disable for generation             |
| generation-ignore-rules   | path to a file listing more rule names to disable for generation               |
| generation-trigger-rules  | path to an MTR file defining trigger rules for generation                      |
| generation-fixup-rules    | path to an MTR file defining transfer rules to massage MRSes before generation |
| cleanup-rules             | path to an MTR file defining transfer rules to massage MRSes read off of TFSes |
| idiom-rules               | path to an MTR file defining idiom-checking rules for parsing                  |
| quickcheck-code           | path to a text file defining the quickcheck skeleton                           |
| quickcheck-instance       | name of an instance containing a PET-style quickcheck skeleton (not a string)  |
| semantic-interface        | path to a .smi file defining the SEMI                                          |
| irregular-forms           | list of *unquoted* paths to irregular form tables                              |

Types

|                             |                                                                   |
|-----------------------------|-------------------------------------------------------------------|
| top-type                    | name of the type at the root of the type hierarchy                |
| semarg-type                 | grammar-internal supertype of MRS variables                       |
| handle-type                 | SEMI type for MRS handles and holes                               |
| skolem-feature              | feature name where skolem constants are put (defaults to INSTLOC) |
| list-type                   | type for lists                                                    |
| cons-type                   | type for non-empty lists                                          |
| null-type                   | type for empty lists                                              |
| diff-list-type              | type for diff-lists                                               |
| semantic-interface-top-type | the name of the type at the top of the SEMI type hierarchy        |

Paths within AVMs

|                    |                                                                                                                                                                                                                                                                              |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| orth-path          | path to orthography list within a sign                                                                                                                                                                                                                                       |
| lex-rels-path      | path to list of EPs supplied by a lexeme                                                                                                                                                                                                                                     |
| lex-carg-path      | path to CARG of a lexeme's key relation (old, unused)                                                                                                                                                                                                                        |
| lex-pred-path      | path to PRED of a lexeme's key relation (old, unused)                                                                                                                                                                                                                        |
| rule-rels-path     | path to list of EPs supplied by a rule                                                                                                                                                                                                                                       |
| semantics-path     | path to the MRS structure of a sign                                                                                                                                                                                                                                          |
| hook-path          | path to the structure containing LTOP and INDEX inside an MRS TFS                                                                                                                                                                                                            |
| label-path         | path to the label string on a parse-node instance; default is "LNAME"                                                                                                                                                                                                                            |
| mrs-rels-list      | path to the RELS list within an MRS structure; default is "RELS LIST"                                                                                                                                                                                                        |
| mrs-hcons-list     | path to the HCONS list within an MRS structure; default is "HCONS LIST"                                                                                                                                                                                                      |
| mrs-icons-list     | path to the ICONS list within an MRS structure (if enabled); default is "ICONS LIST"                                                                                                                                                                                         |
| icons-left         | feature for the left side of an ICONS element; default is "IC-LEFT"                                                                                                                                                                                                          |
| icons-right        | feature for the right side of an ICONS element; default is "IC-RIGHT"                                                                                                                                                                                                        |
| chart-dependencies | a (flat) list of pairs of quoted paths used for removing unwanted lexemes from the chart before parsing. a lexeme with a non-\*top\* value for the first path in a pair will only survive if there is another lexeme with a compatible value at the second path in the pair. |

Token Mapping

|                               |                                                                   |
|-------------------------------|-------------------------------------------------------------------|
| token-mapping                 | enabled (normal) or disabled (legacy; not well supported)         |
| token-type                    | type of a token feature structure                                 |
| lexicon-tokens-path           | path to the list of tokens that license a lexeme                  |
| lexicon-tokens-last-path      | path to the LAST pointer for the diff-list-like token list        |
| token-form-path               | path within a token to the surface form string                    |
| token-from-path               | path within a token to the CFROM (character start position) field |
| token-to-path                 | path within a token to the CTO (character end position) field     |
| token-id-path                 | path within a token to the ID                                     |
| token-postags-path            | path within a token to the POS tag list                           |
| token-posprobs-path           | path within a token to the POS tag probability list               |
| lattice-mapping-input-path    | path within a lattice mapping rule to the input list              |
| lattice-mapping-output-path   | path within a lattice mapping rule to the output list             |
| lattice-mapping-context-path  | path within a lattice mapping rule to the context list            |
| lattice-mapping-position-path | path within a lattice mapping rule to the positional constraints  |

Miscellaneous Switches

|                                                   |                                                                                                                                                                                                                              |
|---------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| index-accessibility-filtering                     | enabled or disabled. this significantly reduces generation time, but if important references to MRS variables are on the packing restrictor then it can cause generation to fail.                                            |
| generalize-edge-top-types                         | enabled or disabled. sets the top-level type of all passive edges to *sign*, which results in significantly increased packing with some grammars. may or may not be a net win, considering additional failures in unpacking. |
| english-pos-tagger                                | enabled or disbled. runs the input through a built-in trigram HMM tagger (but you need to supply the training data) and records the results in the token structures.                                                         |
| simplify-lexicon                                  | enabled or disabled. ERG-specific; attempts to represent the lexicon more compactly.                                                                                                                                         |
| extra-erg-dag-stash                               | enabled or disabled. ERG-specific; keeps extra copies of some common GLB types DAGs on hand.                                                                                                                                 |
| process-chart-dependencies-before-lexical-parsing | enabled or disabled. when enabled, chart reduction happens before lexical parsing (default is after lexical parsing).                                                                                                        |
| enable-icons                                      | enabled or disabled. Controls support for ICONS in MRSes.                                                                                                                                                                    |

General Configuration

|                                |                                                                                                                                                                                              |
|--------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| transfer                       | enabled or disabled. defaults to disabled. when enabled, ACE processes transfer grammars instead of syntactic grammars. adjustment of several MRS configuration parameters may be necessary. |
| spanning-only-rules            | list of rules to only allow in the spanning chart cell                                                                                                                                       |
| fragment-only-rules            | list of rules to only allow when fragment parsing is enabled                                                                                                                                 |
| hyper-active-rules             | list of rules for which hyperactive parsing should be used                                                                                                                                   |
| deleted-daughters              | list of features to delete on new passive edges                                                                                                                                              |
| parsing-packing-restrictor     | list of features to suppress until unpacking while parsing                                                                                                                                   |
| generation-packing-restrictor  | list of features to suppress until unpacking while generating                                                                                                                                |
| mrs-deleted-roles              | list of features on internal MRS variable AVMs that should not be exported when presenting final MRSes (superceded by VPM?)                                                                  |
| parsing-roots                  | list of root instances enabled for parsing                                                                                                                                                   |
| generation-roots               | list of root instances enabled for generation                                                                                                                                                |
| non-idiom-root                 | the name of an instance to check against all parsing results to see whether further idiom processing is required                                                                             |
| generic-les-for-semantic-index | list of the names of the generic lexemes that can be used to provide an unknown relation in generation                                                                                       |
| ortho-max-rules                | maximum length of a chain of orthographemic rules to allow in parsing                                                                                                                        |
| ortho-warn-on-max-rules        | whether to print a warning when the limit of orthographemic rules is reached                                                                                                                 |
| freezer-megabytes              | defaults to 256; make it bigger if you get a warning about it.                                                                                                                               |
| irregular-form-rule-suffix     | a string to append to the rule names found in irregular form tables.                                                                                                                         |
| invent-ltop                    | enabled or disabled. if disabled, the MRS LTOP will be extracted from the grammar. otherwise, it will be invented as a new hole connected to the grammar-provided LTOP by a QEQ.             |

Last update: 2023-01-11 by Francis Bond [[edit](https://github.com/delph-in/docs/wiki/AceConfiguration/_edit)]{% endraw %}