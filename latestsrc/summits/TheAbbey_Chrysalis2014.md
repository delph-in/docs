{% raw %}# Abbey MRS Meeting at the Chrysalis in 2014

This page is here to keep track of topics discussed at the small group
mid-year meeting hosted by [TheAbbey](https://delph-in.github.io/docs/summits/TheAbbey) and held at [The
Chrysalis](http://www.thechrysalisinn.com) in February of 2014.

### Schedule

Though we need not stick to any particular schedule, tentatively we have
9 sessions (in PST):

|          |               |                                     |
|----------|---------------|-------------------------------------|
| **Day**  | **Time**      | **Notes**                           |
| Saturday | 10:00 - 11:00 | Morning session                     |
|          | 11:00 - 12:15 | Early lunch                         |
|          | 12:15 - 14:45 | (Possibly) intercontinental session |
|          | 14:45 - 15:30 | Coffee break / walk                 |
|          | 15:30 - 17:30 | Afternoon session                   |
| Sunday   | 9:00 - 11:00  | Morning session                     |
|          | 11:00 - 12:15 | Early lunch                         |
|          | 12:15 - 14:45 | (Possibly) intercontinental session |
|          | 14:45 - 15:30 | Coffee break / walk                 |
|          | 15:30 - 17:30 | Afternoon session                   |
| Monday   | 9:00 - 11:00  | Morning session                     |
|          | 11:00 - 12:15 | Early lunch                         |
|          | 12:15 - 14:45 | (Possibly) intercontinental session |
|          | 14:45 - 15:30 | Coffee break / walk                 |
|          | 15:30 - 17:30 | Afternoon session                   |

### Agenda

Our initial agenda is to investigate the following question in as much
detail as time and interest dictates.

**How can MRS (and its implementation in the ERG, for concreteness)
represent some of the following types of distinctions in an
underspecificied manner, where disambiguation is frequently partially
but not fully not constrained by syntax?**

- Complement vs. adjunct PPs:
  - a PP that appears in complement position can usually also be an
adjunct. *I threw the chocolates on the table.*
- maybe: PP attachment more generally:
  - syntax puts incomplete constraints on where a PP can attach
- proper name vs. definite noun:
  - is "Wall Street" a single proper noun, a compound proper noun, a
compound simple noun, something else? does the MRS need to say
which?
- roles played by constituents in gapping constructions:
  - "John gave me a red present and Mary a yellow one." Is Mary a
giver or a recipient?
- binding theory:
  - syntax can put constraints on anaphora, but doesn't always
- Francis says: Another phenomena that may be of interest is topics in
Japanese, where we may know (or think we know) it is an argument of
a verb, but not be sure which argument.

A longstanding general design principle for MRS has been:

**The MRS should express all the distinctions that are grammaticalized
(i.e. implied by the syntax), but no more.**

This is the grounds, for instance, for not including a fine grained word
sense inventory in the PRED values. Cases where the syntax partially but
not fully constrains some aspect of the meaning that seems atomic from
the perspective of current MRS design (such as the above list) make it
challenging to apply that principle consistently, however. Two possible
explanations are (a) the principle is not clear enough about cases like
this, or (b) the current shape of the MRS in these situations is
incompatible with following the principle.

We need not discuss every item on that list, and other topics are
welcome.

## Notes

### Day 1: Foundational

- [PP attachment
underspecification](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014PpAttachment)
- [Arity underspecification](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014Arity)
- [What's the Point?](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014WhatsThePoint)
- [Proper Nouns](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014ProperNouns)

### Day 2: Conceptual

- [More on proper nouns, especially in generator
inputs](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014ProperNounsGeneration)
- [Dual representation MRS](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014SchrodingerMrs)
- [Seeking terminology for
subgraphs](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014Terminology)
- [Open-ended sets of scopal
predicates](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014OpenEndedPredicates)
- [Binding theory (ew)](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014BindingTheory)
- [Possessive idioms and coreference resolution (rough
notes)](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014PossessiveIdioms)

### Day 3: Phenomenal

- [Nominalization I: Variable argument type
verbs](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014Nominalization)
- [Nominalization II: Deverbal
nouns](https://delph-in.github.io/docs/summits/TheAbbey_Chrysalis2014DeverbalNouns)

Last update: 2014-02-20 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/TheAbbey_Chrysalis2014/_edit)]{% endraw %}