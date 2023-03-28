{% raw %}# ESD Test Suite Examples

    Abrams arrived Tuesday morning.
    Abrams arrived June 3rd.

# Linguistic Characterization

Time expressions in English exhibit a wide range of idiosyncracies, both
lexical and syntactic, but also conform to several sub-regularities
which the grammar captures and normalizes to a high degree. Time
expressions in the ERG encompass, among others, day and month names
(*Tuesday*, *June*), days of the month (*the third*), season and holiday
names (*Spring*, *Easter*), times of day (*morning*), and numbered hours
and minutes (*ten past four*, *four fifty*). From these building blocks,
complex time expressions can be derived in a number of ways, where the
grammar aims to assign parallel semantics to different syntactic
constructions where they are close parapraphses

Two of these lexical rules have semantic effects, illustrated in the
examples above. Both rules relate a lexical entry for a name of a month
or a day-of-week to a derived entry which supplies two quantifiers, to
bind the instance variables of the name's predicate and the neighboring
word's predicate, and also a two-place of\_p relation linking the
inherent arguments of these two predicates.

One lexical rule, used for e.g. *Tuesday* in *Tuesday morning*, relates
a lexical entry for the name of a day of the week to the derived entry
supplying quantifiers and the of\_p relation, so that when it combines
with the word for a part of a day, such as *morning* or *night*, a
well-formed semantics emerges which is very similar to the paraphrase in
*on the morning of Tuesday, the second*.

Similarly, a second lexical rule, for e.g. *June* in *June third*,
relates a lexical entry for the name of a month of the year to the
derived entry supplying the quantifiers and the of\_p relation, ready to
combine with the semantics of the word for a day of the month, to
produce a semantics which corresponds closely to the alternative
phrasing *the third of June*.

# Motivating Examples

The following are examples involving this phenomenon:

- *The morning of Tuesday, the third, was cloudy.*
- *The third of June was cloudy.*

# ERS Fingerprints

Analyses of these two types of time expressions are characterized by (1)
the EP of\_p, which is a relation between two individuals, one for a
named day or month, and the other for a day of the month or part of a
day; and (2) two quantifiers, a def\_implicit\_q for the named entity,
and a def\_explicit\_q for the day of month or part of a day.

      of_p[ARG1 x1, ARG2 x2]
      dofm_or_mofy[ARG0 x2]
      def_explicit_q[ARG0 x1]
      def_implicit_q[ARG0 x2]

Note that the of\_p also identifies its label with that of the relation
whose ARG0 is its ARG1, as with other intersective modifiers.

# Interactions

The primary motivation for this lexical rule analysis is to minimize the
differences between the semantics of these expressions and their
variants with an overt of-PP, as illustrated above.

# Reflections

It might be worthwhile to further minimize the differences between the
pairs of paraphrases, by replacing the def\_implicit\_q predicate with
proper\_q.

I believe we should greatly extend our test suite for this phenomenon;
time expressions are well worked out in the ERG, and there is a
non-trivial price we pay for (almost) always aiming to disambiguate
different usages of, for example, numbers. At the same time, normalizing
time expressions is important to many applications.

# Open Questions

# Expert External Commentary

# Grammar Version

- 1214

# References

Flickinger, Dan (1996). "English Time Expressions in an HPSG Grammar,"
in T. Gunji, ed., *Studies on the Universality of Constraint-based
Phrase Structure Grammars*, pp. 1--8. Ministry of Education, Science,
and Culture, Japan.

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-09-22 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_TimeExpressions/_edit)]{% endraw %}