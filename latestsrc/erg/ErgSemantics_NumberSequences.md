{% raw %}# ESD Test Suite Examples

    My number is six thirty eight.

# Linguistic Characterization

This phenomenon concerns sequences of numbers that are pronounced not as
one single (large) number, but as a string of smaller ones. This is
typical in the spoken rendering of digits used for telephone numbers,
postal codes, and other identifiers. For example, given the zip code
94305, most American English speakers would read that aloud as *nine
four three oh five* or *nine four three zero five*, and not *ninety-four
thousand three hundred and five*.

# Motivating Examples

The following are examples involving this phenomenon:

- *Nine six seven five four oh nine.*
- *The zip code is nine four three zero five.*

On the other hand, sequences of digits read as representing one number
are not examples of the number sequence phenomenon. Such examples are
discussed under the heading \`Compositional Number Names.'

- *The crate contained four thousand five hundred and seven rubber
duckies.*

# ERS Fingerprints

Analyses of strings involving this phenomenon are characterized by the
EP num\_seq.

      num_seq[L-INDEX x1, R-INDEX x2]

The variables x1 and x2 above are shared either with the ARG0 of card
predicates or the ARG0 of another num\_seq; like with coordination,
number sequences with three or more constituent numbers are treated via
successive binary combination.

# Interactions

The numbers in number sequences can themselves be compositional number
names, as in the testsuite example above or the following:

- *The treaty was signed in nineteen eight-nine.*

# Reflections

- The example of year names shows that the choice to read a sequence
of digits as one larger number or a sequence of smaller onces does
not correlate with whether the item identified by the sequence is
saliently part of a series numbered in order.

# Open Questions

- Change the testsuite example? *six thirty eight* is ambiguous
between a reading with one instance of num\_seq and one with two.
- Change the argument names in num\_seq, from L-INDEX and R-INDEX to
ARG1 and ARG2?
- I changed the name of the phenomenon from *Number Expression* to
*Number Sequences*, since the former seemed too general.

# Expert External Commentary

# Grammar Version

- 1212

# References

# More Information

- [ErgSemantics](https://delph-in.github.io/docs/erg/ErgSemantics) main page
- [Inventory](https://delph-in.github.io/docs/erg/ErgSemantics_Inventory) of semantic phenomena (to be)
documented
- [How to cite this work](https://delph-in.github.io/docs/erg/ErgSemantics_HowToCite)

Last update: 2015-06-04 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgSemantics_NumberSequences/_edit)]{% endraw %}