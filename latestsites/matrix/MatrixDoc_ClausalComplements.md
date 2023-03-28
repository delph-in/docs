{% raw %}## Clausal Complements

In most languages, verbs like *think*, *believe*, "know" (and many
others, e.g. *fear*, *annoy*) can take predicates as arguments. For
example, in

*I know that Kim runs every day.*

*that Kim runs every day*

is the object argument of "know" and is a predicate (verby rather than
nouny) structure. Similarly, in

*That Kim runs every day annoys Sandy*

*that Kim runs every day*

is the subject argument of "annoy".

These arguments, both subjectival and objectival,

- are called **sentential,**

or clausal, complements of the verb.

(NOTE: there can be different views on what is the head of *that Kim
runs every day*, e.g. Pollard&Sag analyze the verb as a head while an
alternative analysis employed in the Grammar Matrix is that it is the
complementizer), but it can be called a predicate regardless).

The current version of the questionnaire only covers objectival clausal
complements. Objectival complement clauses may take the same object
position as noun complements (e.g. come before the verb in OV languages)
or, in many languages they are **extraposed** to the end of the sentence
and after the verb, even if the language is generally OV.

Each complementation strategy that you specify must correspond to a
clausal verb type that you can define in the Lexicon section.

There are several ways in which languages usually mark clausal
complements&lt;/b&gt;. Many languages employ more than one way.

**1. The complement clause is marked by a complementizer word, usually
at the edge of the clause.**

*I believe that Kim is sleeping*

In the above example, *that* is a **complementizer**.

If you would like some verbs to go only with one complementizer but not
the other, add a FORM feature to your complementizer (e.g. FORM that).

**2. The complement clause is marked by some special morphology on the
verb.**

The most common example of this is **nominalization**. The verb takes a
special affix and starts behaving like a noun to a degree. In
nominative-accusative languages, it is common that the nominalized
verb's subject then needs to take a non-nominative case, like genitive.

For example, in Modern Standard Turkish (MST), like in many Turkic
languages, the verb can be nominalized with a special affix, take some
person and number inflectional affixes (but not the TAM markers; and the
finite verb's inflectional paradigm and the nominalized verb's
inflectional paradigm are generally different in MST), then take noun
case markers after that. The verb's subject takes genitive case:

*Ali-nin gecen aksam nehr-in kenar-in-da kos-tug-un-u gor-dum*

- Ali-GEN past evening river-GEN shore-3.SG-LOC run-FN-3.SG-ACC
see-PAST.1.SG

I saw that Ali was running along the river the other evening (Kornfilt).

There are different kinds of nominalization. In particular, some
nominalized verbs can be modified by adverbs (like regular verbs):

*Kim instantly eating the pizza did not surprise anyone.*

while others can be modified by adjectives, like nouns:

*Kim's instant eating of the pizza did not surprise anyone.*

In some languages (e.g. Japanese), the nominalized verb that can be
modified by adverbs needs to keep the case frame of an indicative
clause, however, that is not the case in e.g. Turkic languages, where
the nominalized verbs with genitive subjects can be modified by adverbs
(Asarina and Hartman). In this questionnaire, you have an option to
implement "high" or "low" nominalization; that means the verb will be
nominalized "higher" or "lower" in the tree. In the case of "high"
nominalization, there will be a verby constituent which will then be
turned into something nouny; in contrast, with "low" nominalization, the
verb is turned into something nouny and then a nouny constituent is
formed with its arguments.

You will need to make a technical decision about how the semantics of
high nominalization will be represented in your grammar. You can choose
to either include a nominalization relation in the MRS representation of
the embedded constituent or assume that it is semantically empty. In the
former case, the complement-taking verb's ARG2 will be the ARG0 of the
nominalization relation. In the latter case, the ARG2 will instead point
directly at the embedded verb.

NOTE: A nominalized clause is a type of non-finite clauses which is used
very commonly in clausal complements in world languages; other
non-finite clauses include subjunctive mood and infinitive form. In
general, those also fall in the category where the verb has some special
morphology on it when it acts as part of a clausal complement. However,
the subjunctive tends to occur with causative constructions and object
raising, and the infinitive---in constructions where the subject is
shared by the matrix and the embedded clause. Neither subject nor object
raising is currently supported by the questionnaire, though you may use
the FORM feature to indicate that the embedded clause is some form and
then develop your grammar further by hand.

The below example may be an example of subjunctive complement clause
that is covered by the current version of the questionnaire, assuming
the complementizer+particle is analyzed simply as a single special
complementizer.

In Russian, the subjunctive inflection looks the same as the past tense.
Note that the example below is also is an example of a complement clause
having a complementizer which attaches before the embedded clause. In
Russian, a special particle "by" is needed in addition to the
complementizer to ensure the subjunctive reading.

Ja ne dumaju chto=by Boris eto sdela-l I NEG think COMP=SBJ Boris that
do.PRF-3SG.SBJ I don't think that Boris could do this. (Modified
slightly from Noonan by a native speaker, to make it more felicitous out
of context).

Specify nominalization strategies on the Nominalized Clauses subpage;
FORM on Other Features subpage; MOOD in Tense and Aspect.

Specify the morphological rules in the Morphology section.

**3. The complement clause's word order is different from the matrix
clause.** For example, in German, in which the word order is normally
V2, clausal complements exhibit OV order.

Es ist war dass er schalu ist It is true that he cunning is It is true
that he is cunning (Noonan).

### References

Kornfilt, Jaklin. "On the syntax and morphology of clausal complements
and adjuncts in the Turkic languages. Aspects of typology and
universals" 1 (2001): 63.

Asarina, Alya, and Jeremy Hartman. "Genitive subject licensing in Uyghur
subordinate clauses." WAFL VII (2011).

Noonan, Michael. "Complementation". Language typology and syntactic
description, vol. 2: Complex constructions, ed. by Timothy Shopen,
42-140. (1985).

Last update: 2018-01-18 by OlgaZamaraeva [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_ClausalComplements/_edit)]{% endraw %}