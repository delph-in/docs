{% raw %}Some notes on how to make parsing with Pet more robust.

Contents

1. [Preprocessing](https://delph-in.github.io/docs/garage/PetRobustness#Preprocessing)
   1. [Token Mapping](https://delph-in.github.io/docs/garage/PetRobustness#Token_Mapping)
2. [Unknown words](https://delph-in.github.io/docs/garage/PetRobustness#Unknown_words)
   1. [Generics triggered from POS
mapping](https://delph-in.github.io/docs/garage/PetRobustness#Generics_triggered_from_POS_mapping)
   2. [Generics triggered from token
fs](https://delph-in.github.io/docs/garage/PetRobustness#Generics_triggered_from_token_fs)
   3. [Lexical type prediction](https://delph-in.github.io/docs/garage/PetRobustness#Lexical_type_prediction)
   4. [Supertagger](https://delph-in.github.io/docs/garage/PetRobustness#Supertagger)
3. [Grammar Internal Solutions](https://delph-in.github.io/docs/garage/PetRobustness#Grammar_Internal_Solutions)
4. [Pet settings](https://delph-in.github.io/docs/garage/PetRobustness#Pet_settings)
5. [Robuster Partial Parsing](https://delph-in.github.io/docs/garage/PetRobustness#Robuster_Partial_Parsing)

# Preprocessing

## Token Mapping

Different assumptions made by preprocessing tools and unhandled
characteristics of the text to be processed can influence parse success
or failure. In order to adapt the output of the preprocessing tools to
the assumptions made by the grammar, you can use
[Chart\_Mapping](https://delph-in.github.io/docs/garage/ChartMapping), a mechanism for the non-monotonic,
rule-based manipulation of chart items that are described by feature
structures. One of the applications of Chart Mapping is Token Mapping,
which gives users a means for manipulating tokens using the known formal
devices of the grammar like unification and coindexation.

# Unknown words

For both methods, it holds that it is unclear which REL it gets. Also,
is it a word or a lexeme? There is no possibility in general (if the
surface string is not stamped into CARG, as for proper names) to
generate back again from the MRS to the surface string, if unknown word
handling has been applied. Such information should be included in the
MRS somehow, and this can be achieved in the user-fns.lsp

As to PET, it will be possible to construct the PRED string of an
unknown word with chart mapping. However, since inflectional analysis
could return many possible stems for a given word and since there is no
way to pick the correct one reliably by only looking at this one form,
running inflectional analysis before lexical instantiation in order to
provide a stem in token mapping doesn't seem to be a strategy that is
general enough. The surface form would have to be used instead to build
the PRED value, leading to separate relations for each form of a lexeme.

Stephan points out that partial lexical gaps (is verb, but only encoded
as noun) is not captured by these mechanisms, but this will be solved
when the chart mapping is merged into main.

## Generics triggered from POS mapping

    cheap -default-les

Instantiates generic lexical entries for lexical gaps in the chart using
a mapping from pos tags to generic les that has to be specified in the
grammar. The pos tags have to be delivered by an external pos tagger and
can be passed to PET by most of the input formats. See
[PetInput](https://delph-in.github.io/docs/garage/PetInput) for more information.

## Generics triggered from token fs

    cheap  -default-les=all -cm

This is the new way of generic lexical instantiation that has been
introduced together with token feature structures and
Chart\_Mapping. In this new setup, the parser tries to
instantiate all generic lexical entries for each word. Upon lexical
instantiation, the token feature is unified into a designated path of
the lexical entry. Only if this unification succeeds, the lexical item
is instantiated. In order to control the instantiation of generic
lexical entries, the token feature structures are appropriatly
constrained in the generic lexical entry, for instance by requiring that
a generic verbal entry is only applicable for token feature structures
where the highest ranked part-of-speech tag is a verb. Please see the
page on Chart\_Mapping for more information.

## Lexical type prediction

By Yi.

    cheap  -predict-les

Maximum Entropy Model has to be created from a script that Yi, that
needs a treebanked profile as input. In e.g. pred-lex.tdl, it should be
listed which lexical types should be able to be predicted. At least 2000
sentences are needed.

## Supertagger

A supertagger, similar in nature to the CCG's, and based on CRF's, is
currently under construction.

# Grammar Internal Solutions

- Roots (in english.set)
  - choose the robust root for greater coverage (in english.set)
- Robustness rules/Mal rules

# Pet settings

The amount of items that are parsed of a corpus, depends heavily on the
high number of parameters passed onto the parser. Some of those settings
involves restricting the search space (like reducing the maximum number
of edges). The constraint that Dan uses now is the mem option in cheap
(although you should half it, for some strange reason!). This seems to
be the most reasonable setting.

See also [PetParameters](https://delph-in.github.io/docs/garage/PetParameters).

- always use packing
- recommend -memlimit (amount/2) rather than -limit (edges)
- -timeout=1 (second) can also be useful

# Robuster Partial Parsing

Yi created a two-phase parsing algorithm that, in case the deep grammar
does not succeed, a CFG backbone is used to still get a reasonable
parse. This still has to be integrated in the main branch.

Last update: 2022-11-01 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/PetRobustness/_edit)]{% endraw %}