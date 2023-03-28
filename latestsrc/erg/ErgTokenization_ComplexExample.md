{% raw %}# Motivation

Differences in tokenization at various levels of analysis often present
a technical (and sometimes conceptual) challenge, for example when
seeking to apply a sequence classification model (e.g. a PoS tagger,
supertagger, or uebertagger) prior to full parsing.

In the following, we distinguish three levels of processing (see the
[ErgTokenization](https://delph-in.github.io/docs/erg/ErgTokenization) page for further background): (a)
*initial* tokenization, i.e. the result of string-level pre-processing
(see the [ReppTop](https://delph-in.github.io/docs/garage/ReppTop) page for details on pre-processing rules
included with the ERG); (b) *internal* tokenization, the state of
affairs immediately prior to lexical lookup, i.e. upon completion of the
token mapping phase; and (c) *lexical* tokenization, by which we refer
to the result of lexical instantiation, i.e. the segmentation between
instantiated lexical entries.

Note that only level (a) has a 'flat' form, i.e. forms a single sequence
of tokens, whereas levels (b) and (c) will typically take the form of a
lattice, i.e. admitting token-level ambiguity. Compared to stage (a),
stage (b) can both split up initial tokens, as well as combine multiple
initial tokens into a single internal token. Coversely, moving from
stage (b) to stage (c), there is only further combination of multiple
internal tokens into a single lexical token, viz. by virtue of
instantiating a multi-word lexical entry.

This page is maintained by StephanOepen. Please be
conservative in making substantive revisions.

# Initial Tokenization

To get started, consider a (silly) example:

      'Sun-filled', well-kept Mountain View.

The ERG REPP rules (as of mid-2011) will tokenize according to PTB
conventions, splitting off and normalizing (most) punctuation marks, but
not breaking at dashes (or slashes). Thus, at level (a) there will be
eight tokens, which (in YY format, and assuming PoS tags from TnT; see
the [PetInput](https://delph-in.github.io/docs/garage/PetInput) page for details on the YY token format) might
be the following:

      (1, 0, 1, <0:1>, 1, "‘", 0, "null", "``" 1.0000)
      (2, 1, 2, <1:11>, 1, "Sun-filled", 0, "null", "JJ" 0.7540 "NNP" 0.2211)
      (3, 2, 3, <11:12>, 1, "’", 0, "null", "''" 0.7433 "POS" 0.2567)
      (4, 3, 4, <12:13>, 1, ",", 0, "null", "," 1.0000)
      (5, 4, 5, <14:23>, 1, "well-kept", 0, "null", "VBD" 0.4979 "JJ" 0.3014)
      (6, 5, 6, <24:32>, 1, "Mountain", 0, "null", "NNP" 1.0000)
      (7, 6, 7, <33:37>, 1, "View", 0, "null", "NNP" 0.9591 "NN" 0.0409)
      (8, 7, 8, <37:38>, 1, ".", 0, "null", "." 1.0000)

# Internal Tokenization

The parser-internal token mapping phase seeks to rewrite the intial
tokens into a form that meets the ERG-internal assumptions about
tokenization. Specifically, token mapping will re-attach (most)
punctuation marks, on the one hand, and introduce additional token
boundaries, for example breaking at intra-word dashes (and slashes). For
our running example, token mapping will take us back to what one would
have obtained by just breaking at whitespace and after dashes: with a
sequence of seven distinct token spans at its core (note that the chart
start and end vertices at this point do *not* correspond to the original
ones), viz.

      (112, 0, 1, <0:11>, 1, "‘Sun-", 0, "null", "NN" 1.0000)
      (114, 0, 1, <0:11>, 1, "‘sun-", 0, "null")
      (102, 1, 2, <1:13>, 1, "filled’,", 0, "null")
      (107, 1, 2, <1:13>, 1, "filled’,", 0, "null", "JJ" 0.7540)
      (109, 1, 2, <1:13>, 1, "filled’,", 0, "null", "NNP" 0.2211)
      (96, 2, 3, <14:23>, 1, "well-", 0, "null")
      (111, 2, 3, <14:23>, 1, "well-", 0, "null", "NN" 1.0000)
      (104, 3, 4, <14:23>, 1, "kept", 0, "null")
      (105, 3, 4, <14:23>, 1, "kept", 0, "null", "VBD" 0.4979)
      (108, 3, 4, <14:23>, 1, "kept", 0, "null", "JJ" 0.3014)
      (66, 4, 5, <24:32>, 1, "Mountain", 0, "null")
      (110, 4, 5, <24:32>, 1, "Mountain", 0, "null", "NNP" 1.0000)
      (113, 4, 5, <24:32>, 1, "mountain", 0, "null")
      (70, 5, 6, <33:38>, 1, "View.", 0, "null")
      (106, 5, 6, <33:38>, 1, "View.", 0, "null", "NNP" 0.9591)
      (115, 5, 6, <33:38>, 1, "view.", 0, "null")

Note that, at this point in the processing pipeline, each token has an
associated token feature structure (assuming a grammar that makes use of
the token mapping layer) too, which are not shown in the above. What may
seem like duplicates in the above (e.g. tokens \#70 and \#115, which
only differ in capitalization of the surface form) is typically further
differentiated in terms of the associated feature structures, for
example making a type distinction between 'native' vs. 'generic' tokens
(see the [PetInput](https://delph-in.github.io/docs/garage/PetInput) page for further discussion). Furthermore,
these token feature structures provide references to initial token
identifiers, i.e. make explicit the correspondence relations between the
two layers.

# Lexical Tokenization

Finally, at level (c), what we call lexical tokenization really is the
segmentation between successfully instantiated lexical items. In the
following, we show a subset of the lexical items in the parser chart
after the completion of lexical instantiation (i.e. lookup by the
surface strings associated to internal tokens, including instantiation
of multi-word lexical entries), lexical parsing (application of lexical
rules, until a fixpoint is reached), and lexical filtering (the process
of pruning duplicate or otherwise undesirable entries from the chart):

      (849 w_sqleft_plr 0 0 1
       (694 w_hyphen_plr 0 0 1
        (129 sun_n1 0 0 1
         ("‘sun-" 
          114 
          "[ +FROM \"0\" +TO \"11\" 
             +ID [ LIST [ FIRST \"1\" REST [ FIRST \"2\" REST #1 ] ]
                   LAST #1 ] ... ]"))))
      (1016 w_comma-nf_plr 0 1 2
       (845 w_sqright_plr 0 1 2
        (521 v_pas_odlr 0 1 2
         (173 fill_v1 0 1 2
          ("filled’," 
           102
           "[ +FROM \"1\" +TO \"13\" 
              +ID [ LIST [ FIRST \"2\" REST [ FIRST \"3\" REST [ FIRST \"4\" REST #1 ] ] ]
                    LAST #1 ] ... ]")))))
      (457 well_kept_a1 0 2 4
       ("well- kept"
        96
        "[ +FROM \"14\" +TO \"23\" 
           +ID [ LIST [ REST #1 FIRST \"5\" ] LAST #1 ] ... ]"
        104
        "[ +FROM \"14\" +TO \"23\"
           +ID [ LIST [ FIRST \"5\" REST #1 ] LAST #1 ] ... ]"))
      (699 w_period_plr 0 4 6
       (529 n_sg_ilr 0 4 6
        (458 mtn_view_n1 0 4 6
         ("mountain view." 
          113
          "[ +FROM \"24\" +TO \"32\" 
             +ID [ LIST [ REST #1 FIRST \"6\" ] LAST #1 ] ... ]"
          115
          "[ +FROM \"33\" +TO \"38\"
             +ID [ LIST [ FIRST \"7\" REST [ FIRST \"8\" REST #1 ] ]
                   LAST #1 ] ... ]"))))

Note that the above is comprised of a sequence of four lexical items,
each shown as an (abbreviated) [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) derivation (see the
[ItsdbDerivations](https://delph-in.github.io/docs/tools/ItsdbDerivations) page for background). The leaves of
each derivation are token feature structures and correspond to internal
tokens: the multi-word entry for *Mountain View*, for example, is
instantiated over tokens \#113 and \#115 (see above). Within each token
feature structure, there is (among other things) a list of identifiers
referring back to the initial tokens, i.e. for *Mountain View.*
(including the final period) these are tokens \#6, \#7, and \#8 from the
initial tokenization.

Last update: 2011-11-07 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ErgTokenization_ComplexExample/_edit)]{% endraw %}