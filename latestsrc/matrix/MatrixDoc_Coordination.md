{% raw %}# Documentation for the Grammar Matrix Customization Coordination Library

# Introduction

While the coordination library is optional (you can create a grammar
without using it), if your language has AND-style coordination of any
constituent type it is a good idea to have it in the grammar from the
beginning. Coordination interacts with many different phenomena, and so
building your analyses of the various phenomena with coordination in the
mix from the start is a good idea.

Generally, the Grammar Matrix Coordination customization page is divided
into two pieces. The coordination library enables users to add
coordination strategies to their grammars ("Add a Coordination
Strategy"). Additionally, users may describe how agreement features
(like person, number, and gender) work in coordinated phrases in the
language they are describing.

Descriptive grammars frequently describe coordination strategies, and
somewhat less frequently describe how agreement features work within
those coordination strategies. It may make sense to add a coordination
strategy without also describing how agreement works in that language's
coordinated phrases.

# Coordination Strategy Options

- \[ This documentation is under construction. When it is more
complete, this section should describe the effects of the various
options provided in this library in terms of the behavior of the
grammar. It is also a good place for tips on how to get the most
from the library. \]

# Coordination Strategy Analyses

- \[ This documentation is under construction. When it is more
complete, this section should describe the analyses that are
implemented as part of this library and/or point to publications
where those analyses are described. \]

The coordination library allows the user to specify different
coorindation strategies for different types of coordinands (e.g., NP and
S). This results in specialized grammar rules for each type of
coordinand. This may seem surprising in light of the very general
coordination schemas sometimes encountered in the HPSG literatures, but
in fact it is well-supported from both typological and theoretical
angles. From a typological point of view, many languages use different
coordination strategies for the coordination of different constituent
types. From a theoretical point of view, the work that the coordination
rule needs to do, both syntactically and semantically, differs according
to the type of constituent being coordinated.

The coordination library does not presently constrain the value of any
HEAD or INDEX features on the mother. Such constraints can be added to
the starter grammar by hand. Note that in some cases, you'll need to
create further subtypes of each rule type (e.g., to handle the
resolution of such features as PERSON and NUMBER in NP coordination,
based on the value of these features on the coordinands).

The analyses implemented in this library are partially described in
[Drellishak and Bender
2005](http://cslipublications.stanford.edu/HPSG/6/drellishak-bender.pdf).

# Agreement Features in Coordinated Phrases

The following sections describe the additions to the Matrix that account
for how agreement features work in coordinated phrases.

# Agreement Pattern Options

Generally, the agreement features of a coordinated phrase are decided
one of two ways: **feature resolution** or **distinguished conjunct**
(which includes closest conjunct and first/last conjunct). The term
"agreement pattern" is used throughout these [MatrixDoc](/MatrixDoc)
pages, as well as on the Coordination page, as an overarching term for
the feature resolution and distinguished conjunct patterns defined on
the page.

## Feature Resolution

In feature resolution, the grammar follows fairly predictable logic
and/or sets of rules (e.g. "whenever a noun phrase includes a masculine
conjunct, the gender of the entire phrase will be masculine", "all
coordinated phrases are plural", "any noun phrase including a 1st person
element is also 1st person") to derive the entire coordinated phrase's
agreement feature value.

If a language uses any sort of hierarchy in a coordinated phrase, this
section is where to define that hierarchy. In addition, you can define
other patterns that depend on sets of rules: requiring conjuncts to have
the same feature values for particular features, or defining "default"
values for mismatched values of conjunct.

## Distinguished Conjunct

In distinguished conjunct patterns, a single conjunct in a predictable
position (first, last, or closest to the verb) decides the features used
by a word agreeing with the coordinated phrase. No matter how long or
what other elements the phrase contains, the agreement features are
always decided by the first conjunct, last conjunct, or the closest
conjunct to the verb.

# Agreement Pattern Analyses

This section describes the various options and typical paths for
defining how agreement features work in coordinated phrases.

Once you have defined at least one agreement pattern, you may associate
it with any coordination strategy. In fact, you must link it with a
coordination strategy for it to work.

## Feature Resolution

The feature resolution section allows you to add full feature
resolution-style rule sets to a coordination strategy.

Optionally, you may define a name for each feature resolution pattern.
The "name" is a label you write yourself (e.g. "case\_only", "full",
"resolution", "experimental") that will make the pattern easy to find
when attaching it to a coordination strategy.

### Adding a Feature Resolution Rule Set

In feature resolution, some or all coordinated phrases use sets of rules
to decide the agreement value of the coordinated phrase as a whole. You
can add a feature resolution pattern, which will allow you to define
these sets of rules.

Feature resolution rules can be complex. Defining feature resolution
rules for person values, for example, can easily result in a dozen
rules. Unfortunately, you must list these out yourself, making sure not
to duplicate or leave out any combinations.

Some things to remember:

- The "Any" value can be used to underspecify a feature value. This
allows any feature value to fill that slot.
- The "direction" of the rules does matter. For example, if you define
a rule that a value "f" Child 1 and "any" Child 2 result in an "f"
Parent, the Matrix will not create a rule for you with an "any"
Child 1, "f" Child 2, and "f" Parent.
- Avoid accidentally duplicating rules using "any". For example, a
feature resolution rule set containing two rules: "f" & "any" = "f"
and "any" & "f" = "f" will effectively duplicate the "f" & "f" = "f"
rule. As a result, example sentences with two feminine conjuncts
would have two parses.

#### First example: all coordinated phrases are plural

Suppose, in your language, all coordinated noun phrases are plural.

Define a feature resolution pattern. Then, add a feature. Select
"number" from the feature list. Select "any" for both children, and "pl"
for the parent. Now, all coordinated phrases that use this feature
resolution pattern will be plural.

"any" & "any" = "pl"

#### Second example: two grammatical genders

In some languages, there are two grammatical genders, e.g. "m" and "f",
and any coordinated phrase including one value will always be that
value. You can define this pattern using three rules:

"any" & "f" = "f"

"f" & "m" = "f"

"m" & "m" = "m"

This covers all the possible combinations of the two values, without
duplicating or skipping any.

#### Third example: Person

Values for the person feature can require many rules.

If you want any phrase that includes a 1st person conjunct to resolve to
1st person, you could follow the general pattern for defining a
grammatical gender hierarchy:

"any" & "1st" = "1st"

"1st" & "2nd" = "1st"

"1st" & "3rd" = "1st"

For subsequent person values, if the language used 1st, 2nd, and 3rd
person, with no inclusive or exclusive values, you could continue like
this:

"2nd" & "3rd" = "2nd"

"3rd" & "2nd" = "2nd"

"3rd" & "3rd" = "3rd"

### Special Feature Resolution Values

#### "The same": Identify two or more values

"The same" is used to identify two or more values.

For example, if your language has three genders, "m" , "n" , and "f",
and a coordinated phrase with conjuncts of the same gender always has
that gender value, you could use this option. By choosing "the same" for
Child 1, "the same" for Child 2, and "the same" for Parent, these values
will be identified.

#### "Any": An underspecified value

Selecting a value of "any" will leave the feature value for that child
underspecified.

For example, to write a feature resolution rule that any coordinated
phrase including a 1st person conjunct is 1st person, you could choose
"1st" for Child 1, "any" for Child 2, and "1st" for Parent.

Note that in this case, you would also want to fill in the remaining two
feature resolution rules, covering all possible combinations of person
that include 1st person: "2nd" & "1st" = "1st"; "3rd" & "1st" = "1st".

#### "Any non-matching value in that list"

Some languages have feature resolution patterns that define a "default"
value for non-matching conjuncts.

For example, if a language has 5 noun classes, and any combination of
two different noun classes resulted in a value of noun class 3, you
would use this option.

In this case, define a list of feature values under Child 1. The Child 1
list allows you to select multiple options, so select all possible
feature values (e.g. noun classes 1, 2, 3, 4, and 5). Then, select "Any
non-matching value in that list" for Child 2. Define the "default" value
by selecting a feature value under Parent (e.g. noun class 3).

## Feature Resolution Tips

Some descriptive grammars do not include very much information about how
agreement features work in coordinated phrases. Even without detailed
information about agreement patterns in a language, it can be useful to
add some constraints to coordinated phrases to cut down on
overgeneration and spurious ambiguity in the final grammar.

Out of the box, coordination strategies are underspecified for HEAD and
INDEX features. If you do not plan to add additional information about
agreement patterns, the Feature Resolution section is a place where you
can add some constraints on coordinated phrases.

For example, even if you aren't specifically modeling how case works in
coordinated phrases in the language we're modeling, it's possible to
identify case values to reduce spurious ambiguity in sentences with
coordinated phrases. (See the section on the "the same" value for
information on how to identify feature values.)

This will force both coordinands to have the same case value, and the
top-level node of the coordinated phrase will also have the matching
case value.

## Distinguished Conjunct

Compared to a feature resolution pattern, distinguished conjunct
patterns are relatively simple to define.

Click the "Add a distinguished conjunct pattern" button, then select one
of the radio button options: "First," "Last," or "Closest Conjunct."

Optionally, you may define a name for the pattern. This is simply a
label that will make the pattern easy to find when attaching it to a
coordination strategy.

## Attaching an Agreement Pattern to a Coordination Strategy

As mentioned above, an agreement pattern must be "attached" to a
coordination strategy. Coordination strategies are underspecified for
agreement features by default. A coordination strategy with an
associated agreement pattern will, when customized, allow only the
feature combinations described in the agreement pattern.

Note that it is possible to attach multiple agreement patterns to a
coordination strategy.

### Typical Path

Typically, "All arguments" is the correct option for attaching an
agreement pattern to a coordination strategy.

For example, if the language you're modeling uses feature resolution for
all of its coordinated phrases, you would first define a feature
resolution pattern. After defining as many coordination strategies as
you would like, you would attach the feature resolution pattern to all
coordination strategies, marking "all arguments" on each.

### "All Arguments" vs. "Subject/Object Only"

Even when modeling languages whose verbs only agree with the subject,
you should specify "all arguments" when attaching an agreement pattern
to a coordination strategy, because feature resolution will typically be
used for all coordinated phrases, whether they occur in the subject or
object.

The "subject only" and "object only" options support languages that
allow particular agreement patterns in the subject or object position
only, and exclude it in the others.

For example, if a language allowed feature resolution for coordinated
phrases in any argument, but additionally allowed closest conjunct for
subjects, you could attach a feature resolution pattern for "all
arguments" and the closest conjunct pattern for "subject only."

Similarly, some languages use e.g. feature resolution in subject
position, but closest conjunct in object position. In this case, you
would attach a feature resolution pattern for "subject only" and a
closest conjunct pattern for "object only."

# Upcoming Work

- \[ This documentation is under construction. When it is more
complete, this section should describe any modifications to or
enhancements of this library that are either in progress or planned.
\]

# References

Greville G Corbett. 2006. Agreement. Cambridge University Press,
Cambridge, UK.

Drellishak, Scott and Emily M. Bender. 2005. [A Coordination Module for
a Crosslinguistic Grammar
Resource](http://cslipublications.stanford.edu/HPSG/6/drellishak-bender.pdf).
Stephan Müller, ed. Proceedings of the 12th International Conference on
Head-Driven Phrase Structure Grammar. Stanford: CSLI.

Last update: 2018-08-22 by LaurieDermer [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_Coordination/_edit)]{% endraw %}