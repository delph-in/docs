{% raw %}# Overview

This page discusses the *Regular Expression Pre-Processor* (REPP), a
relatively simple finite-state device used to prepare textual input for
'deep' parsing (using DELPH-IN grammars). For a high-level discussion of
REPP and its application to English tokenization, please see [Dridan &
Oepen (2012)](http://aclweb.org/anthology/P/P12/P12-2074.pdf).
MichaelGoodman has taken an important role in
clarifying the REPP specification while working on his implementation in
the [pyDelphin](https://pypi.org/project/PyDelphin/) library.

This page was predominantly authored by StephanOepen,
who is the original REPP designer and current maintainer of the LKB
implementation of REPP. REPP support in PET was provided by
RebeccaDridan (with some help by Stephan), and Rebecca
continues to maintain the PET implementation of REPP (see the page
[ReppPet](https://delph-in.github.io/docs/garage/ReppPet) for preliminary documentation). Please do not make
substantial changes to this page unless you (a) are quite certain of the
technical correctness of your revisions and (b) believe strongly that
your changes are compatible with the general design and recommended use
patterns for the REPP machinery, and the intentions of this page.

# An Example

Following are a few sample REPP rules, taken from the [REPP
tokenizer](http://svn.delph-in.net/erg/tags/0902/tokenizer.rpp) of the
ERG (as of early 2009). Note that, for display purposes, we show space
characters in REPP rules as the '▁' symbol (a lower one eighth bar), and
tabulator characters as '→' (a rightwards arrow).

      ;;
      ;; preprocessor rules versioning; auto-maintained upon SVN check-in.
      ;; 
      @$Date: 2009-01-29 09:10:22 +0100 (tor, 29 jan 2009) $
    
      ;;
      ;; tokenization pattern: after normalization, the string will be broken up at
      ;; each occurrence of this pattern; the pattern match itself is deleted.
      ;;
      :[▁\t]+
    
      ;;
      ;; pad the full string with trailing and leading whitespace; makes matches for
      ;; word boundaries a little easier down the road; also, squash multiple spaces
      ;; and replace tabulators with a space.
      ;;
      !^(.+)$→      →       →       →       →       →       →       ▁\1▁
      !▁+→   →      →       →       →       →       →       →       ▁
      !\t→   →      →       →       →       →       →       →       ▁

The example makes use of three REPP *operators* (these are the at sign
'@', the colon ':', and the exclamation point '!', i.e. the character in
column zero of actual rules) and the convention used for comments (lines
starting with a semicolon ';' in column zero). Furthermore, empty lines
are ignored by the REPP reader. Besides these three operators (not
counting the comment marker), the following are valid REPP operators and
are discussed in more detail below: the hash mark '\#' (for group
formation), the left angle bracket '&lt;' (for file inclusion), and the
right angle bracket '&gt;' (for group calls).

# REPP Syntax

In the following, we will refer to a collection of pre-processing rules
as a REPP instance, or sometimes simply as a REPP. In the example above,
there are three rules, one for each line starting with the exclamation
point operator '!' in column zero. The colon operator ':' does not
specify a string re-writing rule, but rather the pattern used to break
up the string (after re-writing) into a sequence of tokens; there cannot
be multiple usages of ':' within one REPP module, and the active
tokenization pattern must be defined in the top-level module. Finally,
the at sign operator '@' records REPP meta-information, exclusively used
for versioning. Like ':', there can be at most one '@' declaration in
each module, but whether it is provided or not has no bearing on actual
processing.

REPP files use a simple, line-oriented format with relatively rigid
syntax. Non-empty lines must start with a valid REPP operator in column
zero. The operator is immediately followed by one or more operands, i.e.
the first operand starts from column 1. The exclamation point operator
'!' is the central element of string-level rewriting. Each '!' rule
provides two operands, a *search* pattern and a *replacement* pattern.
Both patterns are *regular expressions* (REs; see below for the exact RE
syntax used in REPP), and the '!' operator is the REPP equivalent of the
's' command in text processing tools like sed(1) and perl(1). The first
operand seeks to match a sub-string of input; when matching succeeds,
the corresponding sub-string is deleted from the input, and the
*replacement* operand of the rule is inserted in its place. In other
words, REPP '!' rules are string rewrite rules, and we can think of the
*search* operand as the left-hand (or input) side of each rule, and of
the *replacement* operand as the right-hand (or output) side. Operands
in REPP rules are separated by one or more tabulator characters, i.e.
the REPP reader applies the regular expression /\\t+/ (where,
conventionally, we use slashes to delimit regular expressions in running
text) to the string following the operator (everything starting from
column 1) to extract multiple operands. For the first '!' rule in our
example above, thus, the left-hand side RE is /^(.+)$/, and the
right-hand side /▁\\1▁/.

There is a strict sequential order to the application of REPP rules,
determined by the order of appearance in the REPP definition file.
Unless requested specifically (see below for iterative groups), the REPP
processor makes a single pass through the rule set, i.e. each rule is
invoked exactly once. However, the left-hand side of a rule can of
course match multiple times against the current input, and in such cases
*all* matches are substituted in a single rule application. There is
'feeding and bleeding' among the rules, in the sense that the output of
one rule is given as input to the next rule. Therefore, at each point in
time, there is only one *current* string as the target for rule
applications. The original input string is re-written in a piecemeal
fashion, and once REPP processing has completed (i.e. the last of the
substitution rules has been invoked), the final string is broken up into
tokens according to the pattern specified as the argument of the colon
operator ':'.

# File Inclusion and External Group Calls

There are two mechanisms that facilitate modularization of REPP rule
sets. The left angle bracket operator '&lt;' requests textual inclusion
of a file; for example:

      <muri.rpp

When reading the line above, the contents of the file muri.rpp will be
inserted into the current REPP (at the current position).

A more flexible means of modularization is provided by the right angle
bracket operator '&gt;', which we will refer to as an *external group
call*. The current ERG pre-processor, near its top, contains the
following lines:

      ;;
      ;; a set of `mark-up modules', often replacing mark-up character entitities
      ;; with actual UniCode characters (e.g. |&mdash;| or |---|), or just ditching
      ;; mark-up that has no bearing on parsing for now (e.g. most wiki mark-up).
      ;; these modules can be activated selectively by name in the REPP environment
      ;; or the top-level call into REPP.
      ;;
      >xml
      >latex
      >ascii
      >wiki

When reading a '&gt;' rule, it is expected that a separate REPP exists,
by the name given as the sole operand to the '&gt;' operator (see below
for the conventions used in assigning names to REPPs). While processing
a REPP *Q* that contains an external group call to REPP *R*, the REPP
processor will apply all rules from *R* at the point in sequential
processing where the '&gt;' call occurs in *Q*. To this effect, the left
and right angle bracket operators '&lt;' and '&gt;' have very similar
effects. However, the REPP processor provides a configuration mechanism
to selectively enable or disable external groups. Thus, with external
group calls, a single REPP definition can be used with multiple distinct
configurations, pipelining or leaving out a specific sub-set of external
group calls. In the ERG setup, for example, the external XML and wiki
groups might be combined, but it will hardly be desirable to activate
both the XML and LaTeX groups at the same time.

# Iterative, Internal Groups

Up to this point, all REPP processing was strictly sequential, and
typically no rule was invoked more than once (unless it was part of an
external group that is literally called multiple times). In some cases,
however, it can be necessary to iterate one or more rules, for example
when the rule is conditioned on a specific string-level property, and
the result of successfully applying the rule may give rise to additional
instances of that specific property. The ERG tokenizer (as of early
2009) includes an example of this requirement. In splitting off
punctuation marks (following the so-called PTB conventions, even though
this token-level separation is ultimately undesirable), it is important
to only split off punctuation marks that occur in the right or left
*periphery* of a token. Colons, for example, can occur as part of web
addresses, and clearly it is undesirable to break up a string like
'http://lingo.stanford.edu/' into two tokens (or even six, if slashes
were to be tokenized off too). Hence, the condition for splitting off
punctuation marks is adjacency to a token boundary, i.e. preceding or
following whitespace. However, quote marks and parenthesis (for example)
often lead to 'clusters' of punctuation marks, and for a string like
'(42%),' there are three trailing punctuation marks that should
ultimately become separate tokens each. Such examples require
*iterative* rule application(s), and REPP provides the facility of
*internal group calls* for this purpose. Consider the ERG example:

      #1
      !([^▁])([][(){}?!,;:@#$€¢£¥%&“”"‘’'])▁([^▁]|$)→       →       \1▁\2▁\3
      !([^▁])\.▁([])}”"’'▁]*)$→     →       →       →       →       \1▁.▁\2
      !(^|[^▁])▁([][(){}?!,;:@#$€¢£¥%&“”"‘’'])([^▁])→       →       \1▁\2▁\3
      #
      >1

This example introduces an additional operator: the hash mark '\#'. The
rules enclosed between the pairs of hash marks '\#1' ... '\#' define a
numbered *internal* group. Thus, the group-opening '\#' has to be
followed by a group identifier, which is required to take the form of an
integer. Hash marks not followed by an identifier present group-closing
operators, and they apply to the most recently opened group. Thus, it is
possible for internal groups to nest inside each other. The right angle
bracket operator '&gt;', when followed by a numeric group identifier,
corresponds to a group call, much like the invocation of external
groups. However, in processing internal groups, the call will be
*iterated* until processing reaches a fix-point, i.e. until none of the
rules in the group could be applied. In this way, the above example will
split off one punctuation mark at a time for each call to the numbered
group. Assuming our earlier '(42%),' example, the first time the group
is invoked, both its first and third rules will apply, corresponding to
suffix and prefix punctuation, respectively. Because at least one of the
rules in the group fired, the group will be called again. With the
trailing comma tokenized off now, the suffix punctuation rule will fire
another time, this time splitting off the closing parenthesis. Another
call to the same group will tokenize off the percent sign next, until a
final group call will no longer match successfully any of the rules. At
that point, processing of the internal group call is complete, and the
REPP machinery moves on to the next rule.

The identifier space for numbered internal groups is local to each REPP
module, i.e. in principle it is legitimate to have multiple internal
groups numbered, say, \#1, if spread out over multiple REPP files.
Accordingly, calls to numbered groups must be resolved within a local
module, but the group definition (processed at REPP compile-time) need
not precede the group call (which is invoked at run-time). Owing to
their non-sequential status, the tokenizer (:) and version (@) operators
cannot occur inside a numbered internal group. In principle, it is
possible to have an internal group nested inside another one (which
could be useful, for example, to allow calling into either the outer
group as a whole, or just its inner sub-group); the numbered identifier
space, however, is global for each REPP module.

# Sub-String Masking

Some characters typically induce token boundaries (e.g. dashes and
slashes, at least starting with the ERG 2020 version) but also occur
frequently in contexts that should not be segmented, for example email
and web addresses. In mid-2020, the REPP language was augmented with a
*masking* facility, using the additional operator character '=', e.g.

    ;;
    ;; email addresses, optionally wrapped in angle brackets (no dashes in TLD)
    ;;
    =<?[\p{L}\p{N}._-]+@[\p{L}\p{N}_-]+(?:\.[\p{L}\p{N}_-]+)*\.[\p{L}\p{N}]+>?

The above rule only has a left-hand side pattern and is intended to
recognize sub-strings that (with great certainty) represent email
addresses and, thus, should be exempted from subsequent input
normalization and tokenization. The sub-string range(s) matching by a
masking rule receive special treatment in subsequent processing: rewrite
rules (operator type '!') must be prevented from changing the masked
sub-string.

Masking rules follow the ordinary flow of control in REPP processing,
meaning they can occur at (an) arbitrary point(s) in the rewriting
sequence and will be invoked when processing has reached that point. It
can be convenient to 'package' sets of masking rules as named external
groups, in which case they need to be invoked (at the right point in
time) using the group call operator '&gt;'. In principle, masking can
apply to overlapping sub-strings, i.e. it is legitimate (if arguably
unnecessary) for a sub-string to be masked multiple times; in this case,
masked regions are *unioned*.

# REPP Regular Expression Flavor

The original LKB implementation of REPP (see below) is built using the
[Portable Perl-Compatible Regular
Expressions](http://weitz.de/cl-ppcre/) library for Common Lisp (PPCRE).
PPCRE supports most of the regex syntax of Perl 5.8 (as described in
man perlre), including extended features like non-greedy repetitions,
positive and negative look-ahead and look-behind assertions,
'standalone' sub-expressions, and conditional sub-patterns. Thus, the
language reference for REPP regular expressions is the Perl
documentation, in particular
[PERLRE](https://perldoc.perl.org/5.8.9/perlre.html),
[PERLRECHARCLASS](https://perldoc.perl.org/5.8.9/perlrecharclass.html),
[PERLREBACKSLASH](https://perldoc.perl.org/5.8.9/perlrebackslash.html),
and friends.

To accomodate various limitations in REPP implementations outside of
Perl, it is recommended to steer clear of the following (in principle
valid) language elements:

- unescaped square brackets in character classes, e.g. /\[\]\[\]/
(which can alternatively be written as \[\\\]\\\[\]), for
compatibility with the [Python
regex](https://pypi.org/project/regex/) module;
- named POSIX character classes like, say, /\[\[:alnum:\]\]/, which
are not available in the PPCRE library used for the LKB
implementation of REPP.

Regarding the latter, their interpretation can vary in unforseen ways
with locale settings and encodings; therefore, REPP embraces a
recommendation for standardizing toward Unicode properties instead (e.g.
/\[\\p{L}\\p{N}\]/ for letters and numbers, no matter the language or
script) from the [Perl
documentation](https://perldoc.perl.org/5.8.9/perlrecharclass.html#Locale%2c-Unicode-and-UTF-8):

- *For portability reasons, it may be better to not use \\w, \\d, \\s
or the POSIX character classes, and use the Unicode properties
instead.*

The native REPP implementation in PET (see below) builds on the [Boost
Regular Expression](http://www.boost.org/doc/libs/release/libs/regex/)
library, which in turn is (considered) highly Perl-compatible. The ACE
parser–generator uses the same regular expression library for its REPP
interpreter.

# REPP Support in the LKB and \[incr tsdb()\]

An implementation of the REPP machinery has been available as part of
the LKB as of early 2009; for using REPP, please make sure that your
build is dated at least February 1, 2009, or newer. An LKB grammar can
load any number of REPP instances by means of the read-repp() directive.
The January 2009 release of the ERG, for example, includes the following
in its script file:

      ;;;
      ;;; as of September 2008, REPP supports `ensembles' of rule sets, where select
      ;;; modules (XML or LaTeX markup normalization, for example) can be activated
      ;;; in the REPP environment or top-level repp() call.  by default, turn on the
      ;;; XML and ASCII modules.
      ;;;
      (read-repp (lkb-pathname (parent-directory) "xml.rpp"))
      (read-repp (lkb-pathname (parent-directory) "latex.rpp"))
      (read-repp (lkb-pathname (parent-directory) "ascii.rpp"))
      (read-repp (lkb-pathname (parent-directory) "wiki.rpp"))
      (read-repp (lkb-pathname (parent-directory) "erg.rpp"))
      (read-repp (lkb-pathname (parent-directory) "tokenizer.rpp"))
      (setf *repp-calls* '(:xml :ascii))
      (setf *repp-interactive* '(:tokenizer :xml :ascii :erg))
      (setf *repp-characterize-p* t)

Besides loading no less than six distinct REPP instances (of which most
are intended for use in external group calls), the parameter
\*repp-calls\* controls the default set of active external groups. By
default, each REPP is named after the basename of its file, i.e. the
first of the above corresonds to the XML mark-up module that we saw in
our earlier example already. If, for whatever reason, it were desirable
to give a different name to a REPP instance, it is possible to provide
an :id keyword argument in the read-repp() call.

The programmatic interface to REPP is through the repp() and
repp-for-pet() functions. These can be used in debugging REPP rules, or
in preparing input to another parser, specifically PET (see the
[PetInput](https://delph-in.github.io/docs/garage/PetInput) page for background). Both functions take optional
keyword arguments :repp and :calls, which determine the top-level
('master') REPP to be used, and set of active external groups,
respectively. The value of :calls defaults to the current value of
\*repp-calls\*, and the default master REPP (value of the :repp
parameter) is the *last* REPP instance that was loaded (hence, in the
ERG example above, it would be the REPP called *tokenizer*). Following
is an example of debugging the ERG tokenizer (the default REPP),
including its XML and wiki external groups:

      (repp 
       "Wikipedia [[wikimedia markup|mark-up]] is ''relatively'' straightforward."
       :repp :tokenizer :calls '(:xml :wiki) :verbose t :format :string)

The non-nil value to the (optional) :verbose argument will cause a trace
as follows:

      (42) [0:1] |Wikipedia|
      (43) [1:2] |mark-up|
      (44) [2:3] |is|
      (45) [3:4] |¦i|
      (46) [4:5] |relatively|
      (47) [5:6] |i¦|
      (48) [6:7] |straightforward|
      (49) [7:8] |.|

Furthermore, the :format argument selects one of several available
output formats, in the example above a plain string (where the final
sequence of tokens is concatenated, with whitespace inserted at token
boundaries):

      "Wikipedia mark-up is ¦i relatively i¦ straightforward ."

Other available output formats include :pet (the default, returning the
so-called YY format; see the [PetInput](https://delph-in.github.io/docs/garage/PetInput) page); :sppp (an
LKB-internal format, see the [LkbSppp](https://delph-in.github.io/docs/tools/LkbSppp) page); and :raw (a list
of token structures, providing all available information). The last of
these is the most generic output option; it could be used to wrap an XML
serialization around the REPP core (e.g. if one were to emulate the
(S)MAF output option of the older FSPP implementation; see below and the
[SmafTop](https://delph-in.github.io/docs/tools/SmafTop) page).

When using the LKB parser with a grammar that provides one or more REPP
instances, the parameter \*repp-interactive\* determines the specific
REPP configuration that is applied prior to parsing. In the ERG case,
the above example activates the top-level tokenizer and several of the
external groups, including a final 'patch-up' rule set, essentially a
stand-in for the token mapping facilities that mediate between the
tokenization assumptions made in pre-processing and those used
grammar-internally.

Finally, the function repp-for-pet() is a wrapper around repp(),
suitable as a :preprocessor hook in [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) cpu definitions. The LOGON tree
(see the [LogonTop](https://delph-in.github.io/docs/tools/LogonTop) page), for example, includes the following
two [cpu definitions](http://svn.emmtee.net/trunk/dot.tsdbrc) for the
ERG (reproduced here in a simplified form):

      (make-cpu 
       :spawn cheap
       :options (list "-t" "-tsdb" "-yy" "-packing"
                      "-cm" "-default-les=all"
                      (format nil "~a/lingo/terg/english.grm" root))
       :preprocessor '("lkb::repp-for-pet"
                       :repp :tokenizer :calls (:xml :ascii :latex))
       :reader "tsdb::yy-read-input"
       :class :terg :task '(:parse) ...)
      (make-cpu 
       :spawn cheap
       :options (list "-t" "-tsdb" "-yy" "-packing"
                      "-chart-mapping" "-default-les=all"
                      (format nil "~a/lingo/terg/english.grm" root))
       :preprocessor '("lkb::repp-for-pet"
                       :repp :tokenizer :calls (:xml :ascii :latex))
       :tagger (list
                :tnt
                (format
                 nil
                 "~a/bin/tnt -z100 ~a/coli/tnt/models/wsj -"
                 root root)
                :n 2)
       :reader "tsdb::yy-read-input"
       :class :terg+tnt :task '(:parse) ...)

In both definitions, the :preprocessor component includes a set of
keyword arguments to repp-for-pett(), analoguous to our discussion of
the basic repp() interface above. All [\[incr
tsdb()\]](http://www.delph-in.net/itsdb) pre-processor hooks take two
obligatory arguments, (a) the string to be processed, and (b) the
definition of a procedure (which can be an external process) for PoS
tagging. The latter can be optionally provided by the :tagger component
in cpu definitions, or can be (implicitly) specified as nil for no PoS
tagging. Thus, the internal pre-processing effects of the first cpu
definition can be simulated by a Lisp function call like the following:

      (repp-for-pet
       "Tokenization, a non-trivial exercise, foozed oe@yy.com." nil
       :repp :tokenizer :calls '(:xml :ascii :latex) :stream "sample.yy")

The additional :stream argument will re-direct the result of
pre-processing into a file (overwriting an existing file by that name,
if need be), in this case the file sample.yy. See [PetInput](https://delph-in.github.io/docs/garage/PetInput)
for further discussion on how REPP outputs can be processed
interactively in PET, for example for in-depth debugging.

# REPP in PET and Stand-Alone

A C++ implementation of REPP was developed by
RebeccaDridan, and this code forms the basis for REPP
support in the PET parser (see the [ReppPet](https://delph-in.github.io/docs/garage/ReppPet) page for details)
as well as for a stand-alone REPP utility. To obtain and build the
latter tool, please try the following:

      svn co http://svn.delph-in.net/repp/trunk repp
      cd repp
      autoreconf -i
      CXXFLAGS="-DU_USING_ICU_NAMESPACE=1" ./configure
      make

Note: if configure fails with
"configure: error: invalid value: boost\_major\_version=", try replacing
m4/boost.m4 with an updated version from
<https://github.com/tsuna/boost.m4>. If configure then fails with
messages like
"configure: error: cannot find the flags to link with Boost system",
then make sure you have all Boost libraries installed (e.g., on Ubuntu
install libboost-system-dev, etc.).

# History and Outlook

REPP has evolved from a similar but undocumented device that was
available in the LKB since around 2003: the *Finite-State Pre-Processor*
(FSPP). Since its inception, FSPP has been availabe in two versions.
FSPP 1.0 was originally designed and (partially) implemented (as part of
the LKB) by StephanOepen in early 2003, based on earlier
experience at the YY Corporation. In 2005, BenWaldron (who
was part of the YY team too) created a parallel FSPP implementation in
the LKB, which we will refer to as FSPP 2.0; this version added new
functionality (notably characterization and (S)MAF support; see the
[SafFspp](https://delph-in.github.io/docs/garage/SafFspp) page), albeit at the expense of backwards
compatibility with FSPP 1.0. Ben took over FSPP maintenance in 2006 and
enabled compiling FSPP into PET, adding (partial) (S)MAF support to PET
at the same time. However, due to a limitation in the Embedded Common
Lisp (ECL) system used in this integration, FSPP 2.0 support in PET
provides no support for international characters (aka UniCode), which
nowadays limits its utility (in PET) severely. Since sometime in 2007,
this line of development has been unsupported.

In a sense, REPP can be viewed as FSPP 3.0, but we prefer coining a new
name to emphasize the conceptual and technological revisions. REPP, in a
sense, re-energizes some aspects of the FSPP design (which were not
implemented at the time) and incorporates characterization from FSPP
2.0. At the same time, REPP drops some earlier FSPP facilities, making a
number of simplifying assumptions that reflect the intervening years of
experience with the integration of 'deep' and 'shallow' processing
approaches. Most importantly, REPP can be conceptualized as pure
string-level rewriting, in that its output is a flat sequence of tokens
(which could be concatenated into a whitespace-separated string format).
There is *no* provision for token-level ambiguity in the REPP design,
not because we doubt the utility of such ambiguity (on the contrary),
but because in late 2008 a new, and more adequate mechanism becomes
available (albeit initially only in the PET parser), the so-called
*chart mapping* approach of [Adolphs et al.
(2008)](http://www.lrec-conf.org/proceedings/lrec2008/summaries/349.html).

Even though the transition from FSPP to REPP will require a moderate
amount of adaptation to existing pre-processor rule sets, we encourage
everyone to make the transition sooner rather or later. Future
development is expected to focus on REPP, including a native
implementation (with UniCode support) in PET.
StephanOepen will be happy to hear from current FSPP
users, especially those making use of FSPP facilities that are not part
of the REPP design: token-level rules and tokenization ambiguity. In
principle, the combination of REPP and chart mapping should make it
possible to obtain similar (or better) behavior regarding token-level
processing, but at least in early 2009, chart mapping is only available
in PET. Hence, in some cases it may be necessary to jointly define
bridging solutions.

# Implementations

- As part of [[PyDelphinTop]] library. See
https://pydelphin.readthedocs.io/en/latest/api/delphin.repp.html
- By Woodley, link at <http://sweaglesw.org/linguistics/ace/> to REPP
version 0.2.2.
- As part of
[NLTK](https://www.nltk.org/api/nltk.tokenize.html#module-nltk.tokenize.repp)

Last update: 2022-08-09 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/ReppTop/_edit)]{% endraw %}