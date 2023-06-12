{% raw %}Rough notes from discussion on 30-04-2012

- *Kim tried and failed to leave*
- *Kim can and in fact must solve this problem*

To create a logical form that is a tree you have to copy the argument.
Proposal: keep the structure as the one that is already generated (with
two holes pointing to the same label), and then interpret with a second
order variable.

We're higher-order anyway, so there shouldn't be a problem with the
meta-variable technique

A related problem when the argument is non-scopal, given the algebra's
requirement that such verbs identify their label with that of their
complements:

- *Kim hired and fired every consultant.*

hire and fire both identify their labels with the label of the argument.

\[\[\[\*If\* we are ditching the quantifiers on pronouns.

But maybe we don't want to do that: "You on the left of the room
..."\]\]\]

-&gt; Doesn't matter about pronouns or not. If the verbs share COMPS
values in coordination, then they'll try to identify their labels with
the same label, even if it's not the label of anything else (because the
LTOP of the NP is underspecified).

Why does the algebra say that? What are the non-pronoun cases?

*Kim slipped into the room.* \_slip\_v\_2 (arrive sneakily)

- -&gt; PP complement

.... but in fact the problem isn't ordinary head-nexus rules, but
because Kim hired and fired every consultant is treated as RNR. Subjects
aren't problematic because the label of the subject is identified with
the label of the coord\_rel.

The issue has to do with extraction in the RNR analysis.

Taking as an example (assuming that *down the hill* is the complement of
*slid and stumbled*):

*Kim slid or stumbled down the hill*

At the point of extraction of *down the hill* there is no conj rel for
the label of *down the hill* to be identified with.

Proposed target representation: label of *down the hill* is equated with
the label of the conj rel anyway.

Why link it to anything? If it's not linked to anything, to many
possible scopes, including possibly some where it's in the restriction
of some quantifier. (Basically anywhere where the variables are inside
the scope of their associated quantifiers.) Some spurious some
incorrect.

So why not have the RNR-attaching rule do the identification? -&gt;
would require two such rules, one for clausal/scopal complements, one
for label sharing ones.

Or a "GRAB-ME" feature, which the constituents use to expose LTOP or
INDEX depending on their type (nominal or clausal or PP). Would also
help with subject: currently two subj rules, one for NP and one for
clausal subjects.

The LF also requires that the type of the arguments be fixed for a given
predicate symbol, like the arity. (But again, that's an LF-level
constraint and not an LF-description level constraint.) There are lots
of verbs that do this ... diathesis? NP -&gt; CP rule? (as a type of
metonymy)

Interim summary

- *Kim can and must leave* =&gt; MRSs as descriptions/meta-variable
  
  - *Kim hired and fired every consultant*
    
    - *Kim slid or stumbled down the hall* =&gt; different RNR
rules
      
      - Unlinked labels -&gt; too many scopes
      - "GRAB ME" probably still not a good solution (or not??)
      - target representation: h1:down, h1: conj, that is the
complement's label should be shared with the
conjunctions and not the conjuncts themselves; conjuncts
shouldn't share labels with each other

*Down the stairs we think Kim fell.* (assuming this is grammatical for
the sake of the example)

In solving this problem, need to delay identifying the labels until we
know coordination has/hasn't happened (in case of extraction). (Don't do
it lexically or on the complement extraction rules, but on RNR or
head-filler. In head-filler case in particular, need to find a way to
pass up the label of the verb along with the slash value.)

Further examples to worry about:

- *Every consultant, Kim hired and fired.* =&gt; coordination rule
switches out the label being carried along.
- *The consultant Kim hired and fired was unhappy.*

In fact: the place to bifurcate is probably the coordination rule,
treating the ATB case separately from the other cases.

Side note from over waffles:

Context: in searching for the PP complement examples, we talked briefly
about *put*-type verbs, but these are treated as taking the PP argument
as a scopal argument so were not directly relevant to that point of the
discussion. (Though *The book was placed or hidden on the shelf* would
have the same problem as *Kim can and must leave.*)

Why treat put as a resultative? It's definitely three place so there are
only two choices for what the value of ARG3 is: e from the locative or h
from the locative. In other resultatives, there is evidence that it has
to be h, because scopal operators can intervene:

- *Kim made the room not warm.*

*not* doesn't work for *put*, but that's arguably because *not* doesn't
attach easily to PPs (but cf: *not in a million years*, *not on my
watch*, *not in my house* ...).

Last update: 2012-06-13 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/WeSearch_ScopalArgCoord/_edit)]{% endraw %}