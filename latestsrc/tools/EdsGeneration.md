{% raw %}# Background

Elementary Dependency Structures (EDS; see the [EdsTop](https://delph-in.github.io/docs/tools/EdsTop) page for
general background) are designed as a *lossy* reduction of full MRSs,
leaving out most of the underspecified scope information that, arguably,
is among the more intricate parts of ERG semantics and that, arguably,
makes a comparatively smaller contribution to ‘core meaning’. Thus,
among the original EDS goals was simplification (removing MRS-specific
‘technicalities’), in order to relate to dependency-based approaches to
meaning representation and to enable practical downstream tasks.

To give a few examples, full ERG MRSs require that propositional
arguments are scopally sub-ordinated by a =q handle constraint;
quantifiers always bind their restrictor via =q, leave their body
unbound, and never share their label; intersective modifiers in
attributive use (‘the fierce dog’) share the label of their head, but in
predicative use (‘the dog is fierce’) must not do so. For an input
semantics to succeed in generation, the above wellformedness constraints
(and others) must be satisfied, and the ERG generator is not very robust
to ‘deviant’ input structures; underspecification of the label topology
is often not possible.

Generation from (formally less complex) EDS inputs, thus, would in all
likelihood lower the burden for creators of semantics for ERG
generation. For the above reasons, however, conversion from EDSs to full
MRSs will require insertion of some additional (scope-related)
information, beyond what is explicit in the EDS. It is an open question
whether and to what degree this information can be automatically added
to an input EDS or, in other words, how much of the scope
underspecification mechanisms of the ERG can be predicted from basic
predicate–argument dependencies and static information about the grammar
(which may in principle include lexical information about individual
predicates).

This page documents an ongoing experiment in this direction, aiming for
a tiny target audience of ERG insiders in its present form.

# General Approach

As of mid-November 2015, the LOGON infrastructure includes code to
mechanically rewrite an EDS into an incomplete ‘pseud’-MRS, with one EP
per node, logical variables introduced according to the ‘distinguished
variable’ notion of Oepen & Lønning (2006), and one role per dependency
edge. Assuming that the ERG SEM-I is available, format conversion can be
invoked as follows:

      MRS(23): (lkb::do-parse-tty "she didn't sing.")
      MRS(24): (setf eds (ed-convert-edge (first *parse-record*)))
      {e10:
       x5:pron<0:3>{x PERS 3, NUM sg, GEND f, PT std}[]
       _1:pronoun_q<0:3>[BV x5]
       e10:neg<4:10>{e SF prop, TENSE untensed, MOOD indicative, PROG -, PERF -}[ARG1 e3]
       e3:_sing_v_1<11:16>{e SF prop, TENSE past, MOOD indicative, PROG -, PERF -}[ARG1 x5]
      }
      MRS(25): (eds-to-mrs eds)
      h1:e6:{ h9:"_sing_v_1_rel"<11:16>(x2 e8) h7:neg_rel<4:10>(e8 e6) 
              h5:pronoun_q_rel<0:3>(x2) h3:pron_rel<0:3>(x2) }
        { h1 qeq h7 }

It has long been true that variable properties from distinguished
variables were attributed to corresponding EDS nodes, but the default
textual serialization used to now show these; observe how the new output
default in the LOGON code now is to show node properties, optionally
prefixed with type a designator, enclosed between curly braces inbetween
the node label, (optional) surface link, and the list of outgoing
dependency edges (to revert EDS textual serialization to the old
behavior, set \*eds-show-properties-p\* to nil).

In the MRS above, the argument of the negation is an eventuality, and
the quantifier lacks its restrictor (which would prevent successful
generation). To extend this structure into an ERG-compliant MRS (where
the argument of the negation is scopal, for example), there is an
emerging set of MRS rewrite rules, bundled as a stand-alone transfer
grammar with the forthcoming 1214 release candidate of the ERG (see the
sub-directory eds/ and, specifically, comments in the files
[mark.mtr](http://svn.delph-in.net/erg/tags/1214/eds/mark.mtr) and
[scope.mtr](http://svn.delph-in.net/erg/tags/1214/eds/scope.mtr) for the
general approach). At present,

# Interactive Experimentation

A convenient set-up for playful exploration of robust generation from
EDSs is to (a) prepare a profile where the recorded semantics is reduced
to EDS (rather than full MRS); (b) run one instance of the LOGON system
as an ERG generator server; and (c) use another instance to retrieve
EDSs via [\[incr tsdb()\]](http://www.delph-in.net/itsdb), apply the EDS
transfer rules from the multi-MRS browser, and send transfer results to
generation afterwards.

For step (a), the following command will generate a new profile mrs.d
from the treebanked version of the MRS test suite included with the ERG:

      $LOGONROOT/redwoods --erg --thin --semantics eds --target mrs.d mrs

In the result relation of the new profile, the semantics field should
now be populated with EDSs (note that the --semantics command line
option is a recent addition to the redwoods script).

Step (b) follows the ‘classic’ recipe:

      (lmt)
      (rsa :erg t)

Similary, to launch the interactive development environment (step (c)),
use the following:

      (lmt)
      (rsa :eds)

Once [\[incr tsdb()\]](http://www.delph-in.net/itsdb) has registered the
mrs.d profile, use *Browse \| Results* (in the second LOGON instance,
i.e. the one loaded with the EDS transfer grammar) to obtain a summary
of exemplars and associated syntactic and semantic analyses.
Double-clicking on the red numbers in the *MRS* column will retrieve the
recorded EDSs for that exemplar and invoke the multi-MRS browser on
them; when given an EDS input structure, the browser will (now)
automatically invoke the conversion to pseudo-MRS. Much like in
interactive development for MT (see Step (5) on the
[LogonInstallation](https://delph-in.github.io/docs/tools/LogonInstallation) page), the *Transfer* button will
invoke the EDS transfer grammar and display the result (*Debug \|
Indexed* will show a more readable view; *Debug \| Step* supports
step-wise inspection of intermediate transfer results). Finally, the
*Generate* button will transmit the transfer result to the generator
server, and with a bit of luck generation results will pop up (or
helpful debugging messages appear in the ‘console’ window of the LOGON
instance providing the generation server).

# Known Limitations

The code for serialization of EDSs including node properties, for
reading EDSs back in, for conversion from EDS to MRS, and for the new
type of flow control in the EDS transfer grammar was added to the
LOGON Tree in late November 2015 and will likely undergo further
refinement; at present, generation from EDSs requires that the LOGON
tree is run from source code.

To date, the EDS transfer grammar (probably) has only limited coverage
of coordinate structures; is known to drop CARG values in intersective
modifiers (e.g. cardinal adjectives); does not deal with sub-ordinated
relative clauses (‘the dog that i think is fierce barked.’), the
existential ‘be’ construction, and tag questions; and fails to resolve
predicate names that (arguably illegitimately) appear as both types and
strings in the ERG (e.g. \_now\_a\_1). With these limitations (and
doubtlessly others), nevertheless, generation is possible for a large
proportion of exemplars from the MRS test suite; more systematic (batch)
testing is pending.

Last update: 2015-11-25 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/EdsGeneration/_edit)]{% endraw %}