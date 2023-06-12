{% raw %}# Variable Property Mapping

In the MRSs derived by grammars like the ERG, a fair amount of
information is encoded as *variable* (or *index*) *properties*, i.e.
attributes and values associated to semantic variables. TENSE, MOOD, and
NUM(ber) are typical such properties, and often they facilitate an
encoding of information that remains relatively close to
morpho-syntactic, grammar-internal distinctions. For the external
interface to each grammar, it seems desirable to aim for a unified, yet
simple inventory of properties and values, shared across grammars (to
the extent of actually being relevant for a token language). At the same
time, a grammar may have internal constraints on the organization of
morpho-syntactic information, and often there may be distinctions made
in a grammar that need not be projected into the external, semantic
interface. The *Variable Property Mapping* facility is a bi-directional
tool that relates grammar-internal and -external encoding on the basis
of a declarative specification of the mapping relations.

# Variable Types

The types of variables themselves often require adjustment in creating
an MRS from a feature structure (AVM), or vice versa. In the ERG, for
example, the grammar-internal type names are *event* and *ref-ind*,
while the canonical MRS variable types are *e* and *x*. Traditionally,
such correspondences in the LKB were established by means of the
built-in function determine-variable-type(), which in turn builds on a
family of globals (named, not co-incidentally, similar to the
ERG-internal choices, e.g. \*event-type\* and \*ref-ind-type\* for the
above example). This original mapping of variable types in the LKB was
uni-directional, i.e. it is applied when constructing an MRS from a
feature structure, but not in the inverse direction (that means, in
principle, that information cast as variable types is not utilized in
generation until the very end, i.e. the post-generation semantic
compatibility check).

As of early 2009, variable type correspondences can be encoded as part
of the VPM too. The ERG, for example, now includes in its semi.vpm:

      event          <> e
      ref-ind        <> x
      individual     <> i
      handle         <> h
      non_event      <> p
      *              >> u
      semarg         << u

This section has to precede all variable property mappings (see below)
in the file. To make VPM-based variable type mapping replace
determine-variable-type(), it is necessary to further set a new MRS
global (typically in the file mrsglobals.lsp):

      (setf *variable-type-mapping* :semi)

With the variable type correspondences as part of the VPM, the grammar
no longer needs to provide MRS globals \*event-type\* et al. Note,
however, that (just like in the original LKB machinery) VPM-based
variable type mapping is at present only applied in forward direction
(see comments in vpm.lsp, generate.lsp, and transfer.lsp for the
remaining issues that require LKB backwards compatibility in this
respect).

# Properties: A Simple Example

Consider a grammar which records information about person and number in
a single sortal hierarchy, with values like 1sg, 2per, et al. The
grammar makes use of a feature PN as the home for the combined person
and number values, and for grammar-internal reasons, PN is embedded
below a feature PNG inside of the feature structures that correspond to
semantic variables in the MRS (keep in mind that MRSs are not feature
structures, yet for each grammar there is a known bijection between the
AVM and the MRS universes). Following is a mapping to convert the
grammar-internal, conflated encoding of person and number into an
external representation that is compatible with the MRS best practice in
LOGON and the RMRS DTD.

      PNG.PN : PERS NUM
        1sg  <> 1 sg
        1pl  <> 1 pl
        1per <> 1 !
        1per << 1 *
        2sg  <> 2 sg
        2pl  <> 2 pl
        2per <> 2 !
        2per << 2 *
        3sg  <> 3 sg
        3pl  <> 3 pl
        3per <> 3 !
        3per << 3 *
        *    >> ! !
        !    << * *

The above example defines a set of rules that map one (or more)
properties into one or more properties. When reading an MRS off the AVM
produced by the grammar, for each correspondence of (groups of)
properties, values are compared to sub-rules in order, until the first
match: at that point, output values are inserted into the result set of
properties. Processing of subsequent rules continues against the
original properties, so that there could be multiple matches: the PNG.PN
to PERS and NUM decomposition, thus, could also be done in two separate
rule sets. At the end of the day, however, only properties resulting
from successful matches will be included in the output MRS, i.e.
everything not explicitly carried over will be suppressed.

# The General Syntax

VPMs can be applied in two directions: *forward* application, mapping
from the left-hand side of rules into the right-hand side, and
*backward* application, producing the inverse mapping. While the
prototypical mapping rule is bi-directional, there may be special cases.
The VPM machinery provides the following operators:

- &lt;&gt; defines an equivalence mapping, i.e. operates in either
direction
  
  &gt;&gt; provides a forward-only mapping, i.e. in left to right
direction
  
  &lt;&lt; provides a backward-only mapping, i.e. in right to left
direction

By default, values are compared by subsumption (against the type
hierarchy of the grammar, for the time being). There are variants of the
mapping operators that use equality for testing instead. These are ==,
=&gt;, and &lt;=, respectively.

Furthermore, there are a few special operators for matching and
outputting of values. In a nutshell, \* will match any (existing) value
in the input or insert whatever was matched into the output; conversely,
! will not insert the corresponding property into the output, e.g. the
sub-rule from our example above

      1per <> 1 !

will have the effect of only inserting \[PERS 1\] into the output, while
the NUM property will be omitted. When applied in backward direction, !
can be used to match *absence* of the corresponding property, but this
usage is really only useful in conjunction with additional properties:
without conditioning on another property, a rule matching on the absense
of a value would insert the output property on variables of all types. A
potentially more useful matching operator that facilitates the insertion
of default values conditions a rule on the type of the embedding
variable. The ERG, for example, includes the following mapping of TENSE
values:

      E.TENSE : TENSE
        past       <> past
        present    <> pres
        future     <> fut
        real_tense <> tensed
        untensed   <> untensed
        *          >> untensed
        untensed   << *
        untensed   << [e]

Here the effect of the last two sub-rules, which are limited to the
backward direction, is to (a) convert all values not matched by earlier
rules into untensed and (b) insert untensed on all variables of type *e*
that have no TENSE property already. In other words, the \[e\] match
operator subsumes the use of ! but additionally conditions on a specific
variable type, so as to avoid inserting TENSE values into referential
indices, say.

# Activating the VPM Machinery in the LKB and PET

A grammar can include any number of VPMs; the function mt:read-vpm() can
be used in the LKB \`script' file to load a VPM and associate an
identifier to it, e.g.

      (mt:read-vpm (lkb-pathname (parent-directory) "semi.vpm") :semi)

The distinguished identifier :semi will activate its VPM for the
read-out of MRSs from parsing results (where the VPM is applied in
forward direction) and, conversely, for the reverse mapping of MRSs
given as input to the generator. Additional VPMs can be put to use in
transfer, as an input or output filter for example.

In PET, there is provisional support for loading the SEM-I VPM, i.e. the
VPM that applies to the extraction of MRSs from feature structures
obtained from parsing results; add a statement like the following to
your settings file:

      vpm := "semi".

To provide multi-VPM support in PET, this interface will likely change
in the future.

# Internals: VPMs, Transfer Rules, and Generation

The duality of grammar-internal and external (aka SEM-I) naming
conventions creates a number of challenges for processing that,
conceptually, operates on MRSs but at the same time needs to make use of
the type hierarchy, e.g. to test for compatibility or subsumption (aka
underspecification) relations of MRS predicates, variable types, and
variable properties. The ultimate solution will require that the SEM-I
provies complete information about MRS-level relations that the grammar
wants to make available in its interface (in principle, the SEM-I could
also provide additional layers of hierarchical relations, i.e. ones that
hold at the MRS level but are not part of the grammar-internal
hierarchy). The SEM-I could then be imported into its own hierarchy,
possible in a private namespace per grammar, such that multiple
MRS-level hierarchies can be loaded in parallel, e.g. corresponding to
source and target language in transfer.

But this vision is not yet implemented in the LKB MRS core and transfer
machinery, and hence the current technology (as of early 2009) takes
some 'short-cuts' in the creation and application of transfer rules, as
well as in MRS-related parts of the generator. In debugging, it may be
necessary to understand in detail the duality of MRS naming conventions,
and the following paragraph provides a brief summary of the current
state of play.

For transfer rules (and thus trigger rules in generation), we require
the internal hierarchy of property values. Therefore, the :semi VPM is
not applied during the creation of transfer rules, *except* for its
variable type correspondences (see above), if any. Unlike variable
properties, the application of transfer rules to an MRS assumes
canonical (external) variable types, e.g. *h*, *e*, *x*, et al. This is
primarily a matter of convenience: grammars tend to have large sets of
intermediate variable types, and in testing an input MRS which only
provides information in the much simpler, external hierarchy, the extra
grammar-internal type distinctions would at best be a nuisance.
Accordingly, grammars need to provide, as part of their type hierarchy,
the canonical MRS variable types too, i.e.

      u := *top*.
      i := u.
      p := u.
      h := p.
      e := i.
      x := i & p.

The situation is parallel for generation. To instantiate and Skolemize
lexical entries, the input MRS is mapped through the VPM in reverse
direction, *except* for variable types. In the current setup (and the
LKB generator ever since its inception), variable types are not
considered during lexical instantiation. Thus, in principle, semantic
distinctions cast in the input semantics by virtue of variable types are
not considered by the generator until very late in the process, viz. the
post-generation semantic compatibility test. For all we know, however,
existing grammars hardly, if at all, make use of variable types in this
manner; for example, a grammar would have to provide distinct lexical
entries, both with the same predicate but incompatible variable types on
their ARG0, say.

# Cross References

There is a discussion of how to delete and attribute for only some
predicates at [NoJa](https://delph-in.github.io/docs/tools/NoJa).

# ToDo

Last update: 2009-01-23 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/LogonVpm/_edit)]{% endraw %}