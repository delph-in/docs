{% raw %}# Experimental Features in ACE

This page describes some features that have been added to [ACE](https://delph-in.github.io/docs/tools/AceTop)
over the course of minor revisions that are not well-tested enough to be
considered robust, but may be of interest to some users.

- [Ubertagging](https://delph-in.github.io/docs/garage/UtTop) -- as of 0.9.21, ACE can perform ubertagging to
prune unlikely lexemes / tokenizations. Adding the following block
to ace/config.tdl for (e.g. May 13th 2015 preview of) ERG 1214
enables usage of the --ubertagging=0.001 commandline option:

<!-- -->


    ;; übertagging settings
    übertag-emission-path := "../ut/nanc_wsj_redwoods_noaffix.ex.gz".
    übertag-transition-path := "../ut/nanc_wsj_redwoods_noaffix.tx.gz".
    übertag-generic-map-path := "../ut/generics.cfg".

Note that the PET implementation of UT has a lot more bells and whistles
than the ACE implementation, at least for now (various tag types,
whitelists...).

- The [LogonTransfer](https://delph-in.github.io/docs/tools/LogonTransfer) system -- as of version 0.9.11,
ACE has relatively complete support for this (see
[AceTransfer](https://delph-in.github.io/docs/tools/AceTransfer) for implementation details). To translate
from Japanese to English, for example:

<!-- -->


    $ ace -G jacy.dat -g logon/dfki/jacy/ace/config.tdl
    [various output...]
    $ ace -G erg.dat -g erg-1214/ace/config.tdl
    [various output...]
    $ ace -G jaen.dat -g logon/uio/tm/jaen/ace/config.tdl
    [various output...]
    $ echo "犬 が 猫 を 食べる" | ace -g jacy.dat -1Tf 2>/dev/null | ace -g jaen.dat 2>/dev/null | ace -g erg.dat -e1 2>/dev/null
    The dog eats the cat.
    $

Note that [JaCY](https://delph-in.github.io/docs/grammars/JacyTop) does not work properly out-of-the-box with
ACE; you will need an SVN update at least as recent as late January 2013
of JaCY, and you will additionally need need to comment out the line
including "lex/generics.tdl" in the file japanese.tdl. Also, to compile
the [ERG](https://delph-in.github.io/docs/erg/ErgTop) from a working directory other than the ACE directory
(as shown above), you will need ace-0.9.13, and unknown word handling
will not work.

- Detailed time profiling. When run with the -i option, ACE produces a
report of how much time was spent in various system components. For
parsing, chart mapping, and transfer, the amount of time spent in
each rule is included. Most of the other measurements are somewhat
coarser, such as "semantic lookup" and "idiom checking".
- Pre-generation transfer phase: input MRSes can undergo a set of
transfer rules in a .mtr file defined by the
'generation-fixup-rules' configuration setting. This is fairly
robust.
- Post-unpacking transfer phase: output MRSes can undergo a set of
transfer rules in a .mtr file defined by the 'cleanup-rules'
configuration setting.
- Post-generation token mapping phase: output surface strings can
undergo a set of token mapping rules, defined by TDL status
"post-generation-mapping-rule". This can be used, for example, to
conjoin tokens like the possessive 's in English and to adjust
uppercase/lowercase.
- Token mapping flow control: token mapping rules can have a +JUMP
property that enables nonlinear processing through a set of rules
(e.g. skipping a section if a condition is met, or looping).
- ICONS -- "individual constraints": this is an additional top-level
property on MRS structures, analogous to the existing HCONS list.
ACE is agnostic as to the types of the constraints, but structurally
they look like &lt; x17 some-constraint x4 &gt;. Possible uses
include recording information structure and binding constraints that
the syntax makes available but MRS did not previously provide a
convenient place to store. You will need to configure
enable-icons := yes. in all relevant grammars (i.e. source and
target language, and transfer grammar in an MT setup). In
generation, ICONS adds an additional layer to the semantic
compatibility test: every ICONS in the input MRS must be realized by
the output, possibly with a more specific type. Extra ICONS elements
on the generator output do not cause the test to fail.

## Disclaimer

There may not be enough information on this page to successfully try out
some of these features. Contact [WoodleyPackard](/WoodleyPackard) if you
want to deploy something and need help.

Last update: 2015-08-25 by DanFlickinger [[edit](https://github.com/delph-in/docs/wiki/AceExperimental/_edit)]{% endraw %}