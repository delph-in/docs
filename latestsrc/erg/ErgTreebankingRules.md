{% raw %}# Lexical distinctions

- See documentation at [ErgTop](https://delph-in.github.io/docs/erg/ErgTop)

# Rule distinctions

## Brief notes on some phrasal rules

### hd-cmp\_u\_c

- The vanilla head-complement rule.

### sp-hd\_n\_c

- The grammar has two instances of the specifier-head schema: this one
is for phrases where the specifier is the semantic head, as for
determiner+noun

### sp-hd\_hc\_c

- This is the other one, for phrases where the syntactic head is also
the semantic head, as for example with degree specifiers as in "The
very old chair"

### sb-hd\_mc\_c

- This rule combines a main-clause verb phrase with its subject,
usually an NP.

### sb-hd\_nmc\_c

- This rule builds a subject-head construction where the clause is
embedded within a larger phrase (including a matrix filler-head
construction).

### hd-aj\_int-unsl\_c

- The ordinary instance of the head-modifier rule schema, for
(post-head) intersective modifiers which do not contain a gap.

### aj-hd\_scp-pr\_c

- This is an instance of the modifier-head construction, where the
modifier is scopal (not intersective), and where the punctuation
marks (typically commas) have to match on the two daughters (that's
what the \_pr suffix indicates).

### aj-hdn\_norm\_c

- This is another instance of the modifier-head construction, but
where the head is restricted to a noun.

### n\_mnp\_c

- This is for measure-NPs consisting only of a noun, as in "That
meeting was hours longer than I had expected"

### vp\_np-ger\_c

- This is for verbal gerund NPs without a specifier, as in "Hiring
Abrams was easy"

### hd\_xcmp\_c

- Rule for extracting a complement (on our lexicalist approach, moving
the complement from COMPS to SLASH, hence starting the unbounded
dependency path upward)

### hd\_xaj-int-vp\_c

- Rule for building a verb phrase with an adjunct gap

### flr-hd\_rel-fin\_c

- Rule for the filler-head kind of relative clause, as in "The
consultant who Browne hired"

### flr-hd\_nwh\_c

- Rule for relative clauses without an overt relative pronoun, as in
"The consultant Browne hired"

### hd-cl\_fr-rel\_c

- Rule for free relative phrases, typically as in "Browne left
whenever Abrams arrived"

### hd\_imp\_c

- This rule is for imperative clauses

### mrk-nh\_evnt\_c

- This rule combines a conjunction like "and" with a non-nominal
phrase to build the right half of a coordinate structure - the "and
danced" part of "sang and danced"

### mrk-nh\_n\_c

- This rule builds the right half of an n-bar coordinate structure.

### mrk-nh\_nom\_c

- And this one is for the right half of an NP coordination.

### n-n\_crd-t\_c

- For conjoining n-bars (distinct from the rule for conjoining NPs)

### cl-cl\_crd-m\_c

- This rule conjoins two sentences in what will be at least a
three-conjunct sentence coordination, as in "Kim arrived, \[we left,
and Browne stayed\]."

### hd\_optcmp\_c

- This rule discharges an element of the COMPS list which is marked as
optional, for heads which are non-nominal.

### hdn\_optcmp\_c

- And this one does the same for optional complements of nouns.

### hdn-aj\_rc-pr\_c

- This rule combines a noun with a relative clause, where the
delimiting commas match up.

### hdn-aj\_redrel-pr\_c

- And this one combines a noun with a reduced relative phrase, as in
"the dog angry at the cat"

### np\_adv\_c

- Rule that makes certain NPs into modifier phrases, as in "We visited
Rome \[the year after you did\]"

### vp\_rc-redrel\_c

- This rule builds a reduced relative clause phrase (that is, one
which can modify a noun) from an ordinary predicative verb phrase.

### vp\_sbrd-prd-prp\_c

- This rule converts an ordinary present-participial verb phrase into
a depictive modifier phrase, as in "Kim arrived, \[singing
loudly\]."

### num\_prt-nc\_c

- This builds another kind of partitive NP (one lacking a nominal
head), here from an integer, and with no PP complement, as in
"\[Six\] were returned"

### pp-aj\_frg\_c

- Rule for building a sentence fragment consisting of a scopal PP
followed by some other modifier phrase.

## Brief notes on some lexical rules

### det\_prt-of-agr\_dlr

- This makes certain determiners into NPs with no nominal head, and
with an of-marked PP complement, where the number on the NP in the
PP complement matches the number of the the full partitive NP, as in
"\[most of the books\] arrived"

### v\_aux-ell-ref\_dlr

- This rule turns an auxiliary verb into an elliptical VP phrase (one
just consisting of the auxiliary verb), and where its subject is a
referential NP, as in "Kim hasn't arrived, but Browne \[has\]."

### v\_aux-advadd\_dlr

- This rule adds an adverb to the front of the COMPS list of an
adverb, mostly to implement Jongbok's approach to aux negation as in
"Kim is not the winner."

### n\_ms-cnt\_ilr

- Another inflectional rule which doesn't change spelling, and which
makes an unflected noun stem into a word which is underspecified for
mass or count (a word like "paper")

Last update: 2013-09-17 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/ErgTreebankingRules/_edit)]{% endraw %}