{% raw %}# Encoding LP constraints in a constraint-based framework without adding LP constraints to the formalism.

This sketch (initially written by AnnCopestake)
illustrates how an encoding of a bit-vector style implementation of
linear precedence could be done directly in a constraint-based
formalism. The approach is inspired by Daniels and Meurers. The point is
that the bit-vector approach could be directly implemented in the typed
feature structure logic and this is an attempt to work out what this
would entail. Unlike normal HPSG parsing, the conditions that apply to
phrasal spanning are fully encoded in the feature structure constraints
with no additional requirements.

(It is entirely possible that something similar has been done before -
it would be good if pointers to such work could be added to this page.)

The encoding here requires:

- a full append;
- one additional type of recursive constraint (here called afterme),
which is used as a linear precedence constraint although defined in
terms of the vectors;
- the ability to specify types on a per sentence basis (necessary
because the length of the vector has to be fixed);
- initial settings of the vector on lexical signs according to their
position in the input;
- the ability to define an indefinitely large set of constant types
(cf instloc values in generation).

The encoding would allow a quick-check style mechanism to be used to
enforce LP constraints. Constituents may be discontinuous.

The intuition behind the encoding is that all phrases contain a vector
(encoded as a list) which has the same length as the number of signs in
the initial input. For each phrase, the type of each element in the
vector indicates whether it corresponds to an initial element before or
after the phrase, or part of the phrase, or spanned by the phrase but
not a constituent part. By comparing vectors for different phrases, we
can enforce LP constraints.

## A. Types encoding the vector

The general condition on **phrase** is:

    [ phrase
      LP [ pos-constraint
           BEFORE [1]
           ME append ([2],span-list) unify append(span-list,[3])
           AFTER [4] ]
      DTR1.LP [ pos-constraint
                BEFORE [1] 
                ME [2] ]
      DTR2.LP [ pos-constraint
                ME [3]
                AFTER [4] ]  ]

where the general constraint on **pos-constraint** is:

    [ pos-constraint
      POSVEC append([1],[2],[3])
      BEFORE [1] before-list
      ME [2] span-list
      AFTER [3] after-list ]

where **before-list** is defined as a list of zero or more elements of
type **before**, **after-list** is a list of type **after** and
**span-list** of type **span**. **pos-constraint** is the appropriate
value of LP which is a feature found on all signs.

    pos := top.
    outside := pos.
    after := outside.
    before := outside.
    span := pos.
    me := span.
    meA := me.
    meB := me.

and so on.

If we are parsing a five word sentence, the type **posvec** which is the
appropriate value of POSVEC is set to the list
&lt;pos,pos,pos,pos,pos&gt;. Thus all signs have a 5-element **posvec**.
The idea that types can be varied according to the input sentence is
unfamiliar, but formally does not seem to be problematic, since we
define parsing of a sentence with respect to a type system.

POSVEC values for the input signs are set according to their positions
in the input (see below).

The root condition is that the POSVEC value is &lt;me,me,me,me,me&gt;
(i.e., that the phrase spans all the input).

It follows logically from the append condition above, that **before**
may not follow a **me** etc, but this would not follow in the feature
structure formalism without some additional constraint.

## B. An example of vectors in phrases

Assuming we are parsing the input A B C D E

initial POSVEC values are set as follows:

    A  <meA, after, after, after, after>
    B  <before, meB, after, after, after>
    C  <before, before, meC, after, after>
    D  <before, before, before, meD, after>
    E  <before, before, before, before, meE>

The setting of the POSVEC values should not cause any formal worries -
there has to be some notion of mapping between an input string (or list
of token-strings) and signs: this just complicated that notion a little.

Suppose we have a parse tree such that:

    S dominates X and Y
    X dominates A and C
    Y dominates B and Z
    Z dominates D and E

phrase X has POSVEC &lt; meA, span, meC, after, after&gt; (indicating
that it dominates A and C)

phrase Y has POSVEC &lt; before, meB, span, meD, meE &gt;

phrase Z has POSVEC &lt; before, before, before, meD, meE &gt;

S has &lt; meA, meB, meC, meD, meE &gt;

The phrasal POSVEC values arise from the initial values by virtue of the
constraint on type phrase. To see this in a relatively complex case,
consider the formation of S:

    [ phrase
      LP [ POSVEC append([1],[3],[2])
           BEFORE [1] <>
           ME [3] append ([4],span-list) unify append(span-list,[7]) 
            ;;   < meA, span, meC, span, span> unify  <span, meB, span, meD, meE > 
            ;;   < meA, meB, meC, meD, meE >
           AFTER [2] <> ]
      DTR1.LP [ POSVEC append([1],[4],[5]) ;;; X
                BEFORE [1] <>
                ME [4] < meA, span, meC>
                AFTER [5] < after, after> ]
      DTR2.LP [ POSVEC append([6],[7],[2]) ;;; Y
                BEFORE [6] < before >
                ME [7] < meB, span, meD, meE > 
                AFTER [2] <> ]  ]

The trick here is the specification of ME on the phrase. This says that
it is the unification of the filled-in values of the MEs of the
daughters. The assumption is that DTR1 has a leftmost element which
precedes the leftmost element of DTR2. In all cases, the length of ME of
the phrase will be known, since the POSVEC is constrained to be the
length of the sentence and the lengths of the BEFORE and AFTER lists are
known (the BEFORE list coming from the BEFORE of DTR1 and the AFTER list
from the AFTER of DTR2). Thus, although the append constraints on ME
specify that the filler is a **span-list** of indefinite length
(possibly zero) the length will actually be known when the rule is
applied (assuming we're operating bottom-up). In this case, DTR1 and
DTR2 overlap, but the rule also allows for them to be contiguous
(corresponds to the situation where ME of the phrase is the append of
the ME of the DTRs) or to have some stuff in between (corresponds to an
append of the ME of DTR1, some spanning elements, and the ME of DTR2).
The use of the different me subtypes (**meA** etc) allows for failure of
unification in cases where we attempt to combine two phrases which each
contain the same constituent. Thus this formalisation encodes the
no-overlap constraint reqired in parsing.

## C. LP constraints

To allow lexical signs to specify that they select for signs that
preceed/follow them, we use the type **afterme** (other types could be
defined for before / immediately before / immediately after but these
won't be considered here).

For instance:

    LP.POSVEC [1]
    SUBJ.LP.POSVEC [2]
    COMPS <LP.POSVEC [3], LP.POSVEC [4]>
    LP.CONSTRAINTS < afterme([1],[3]),afterme([1],[4]),
                     afterme([3],[4]),afterme([2],[1])>

corresponds to the order: subj &lt; sign &lt; comp1 &lt; comp2

To implement this, **afterme** is defined in terms of **posvec**s, so
that any **span** values in the first **posvec** in an **afterme** are
matched by **before** values in the second **posvec**. This can be done
with a recursive type definition.

    [ afterme
      PV1 posvec
      PV2 posvec ]

has two subtypes

    [ afterme-elist
      PV1 elist
      PV2 elist ]
    
    [ afterme-ne
      PV1 [ FIRST pos
            REST [1]]
      PV2 [ FIRST pos
            REST [2] ]
      JUNK [ afterme
             PV1 [1]
             PV2 [2]]]

where afterme-ne has two subtypes

    [ afterme-me
      PV1.FIRST span
      PV2.FIRST before ]

and

    [ afterme-other
      PV1.FIRST outside ]

Thus, if there is an **afterme** constraint between two **posvec**s,
then any **span** values in the PV1 **posvec** have to be matched by
**before** values in the PV2 **posvec**. This corresponds to the
situation where the PV1 phrase has to be before the PV2 phrase in the
input.

e.g.

    PV1 < meA, span, meC, after, after > 
    PV2 < before, before, before, meD, after > 

satisfies **afterme**

    PV1 < meA, span, meC, after, after > 
    PV2 < before, meB, span, meD, after > 

fails **afterme**.

Consider the A B C D E example as before, and assume that C somehow
selects for Y and that we know afterme(C,Y)

X is

       [ LP [ POSVEC append([1],[4],[5]) 
               BEFORE [1] <>
               ME [4] < meA, span, meC>
               AFTER [5] < after, after>
               CONSTRAINTS afterme(< before, before, meC, after, after >, [8]) ]
         SELECTED.LP.POSVEC [8]] 

Y has

       [ LP [ POSVEC append([6],[7],[2]) 
                BEFORE [6] < before >
                ME [7] < meB, span, meD, meE > 
                AFTER [2] <> ]  ]

so instantiating SELECTED with Y will give

    afterme(< before, before, meC, after, after >, < before, meB, span, meD, meE >)

and this will fail.

The general requirement to implement this is that the constraints can be
specified between two signs whose POSVECs can be accessed. This works in
cases where the signs are selected for (including cases where the two
signs in an **afterme** relationship are specified by a third sign, as
in the two COMP example above), but does not allow for global
constraints of the type considered by Reape, although it's possible that
these could be encoded somehow as constraints on phrases.

## D. Implementation prospects

At one level, this is a theoretical exercise, since it requires
recursive constraints. However, both the use of append and afterme could
be implemented as special cases in a bottom-up parser. By keeping the
vectors in the feature structure rather than having a separate LP layer,
we might obtain the following advantages:

1. formally, this seems straightforward and relatively clean
2. existing techniques for efficient parsing can be reused.
Specifically, the POSVEC constraints can be checked by the a variant
of the quick-check mechanism and the rule filter might also operate
reasonably directly. The parser itself is a simplification of
existing algorithms. Basically, to implement this within the current
LKB one would have to make use of a hacky way of setting the POSVECs
instead of the append and also directly set the vectors for the
**afterme** types (cf setting the ORTH value in morphology via
evaluate-unifications).
3. there is no need to expand the TDL formalism to include a new
notation for LP constraints and there is some scope for
experimentation by the grammar writer with different approaches to
constraints, since they are part of the FS (provided the afterme
hack is implemented sufficiently generically).
4. constraint effects propagate directly. Consider this example again:

<!-- -->


    LP.POSVEC [1]
    SUBJ.LP.POSVEC [2]
    COMPS <LP.POSVEC [3], LP.POSVEC [4]>
    LP.CONSTRAINTS < afterme([1],[3]),afterme([1],[4]),
                     afterme([3],[4]),afterme([2],[1])>

and assume that \[1\] is &lt; before, me, after, after, after&gt; then
\[3\] is &lt; before, before, pos, pos, pos &gt;, \[4\] is &lt; before,
before, pos, pos, pos &gt;, \[2\] is &lt; me, after, after, after, after
&gt;. If we find \[4\] is &lt; before, before, before, me, me &gt;, then
we get \[3\] is &lt; before, before, me, after, after &gt;

Bad things:

1. POSVECs in feature structures could be confusing. This is a very
low-level sort of thing to have in a grammar.
2. The approach may not be expressive enough.

Last update: 2006-12-16 by AnnCopestake [[edit](https://github.com/delph-in/docs/wiki/LkbLpconstraints/_edit)]{% endraw %}