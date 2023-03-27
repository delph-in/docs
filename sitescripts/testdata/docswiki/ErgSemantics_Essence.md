# ERS: High-Level Characterization

In a nutshell, English Resource Semantics (ERS; see
[ErgSemantics](ErgSemantics)) captures *sentence meaning* in an abstract
representation that is compatible with logic-based approaches to natural
language semantics. Here, we interpret ‘sentence meaning’ (in contrast
to what is at times called ‘speaker’ or ‘occasion meaning’) as the
contribution to semantic interpretation that is wholly determined by the
linguistic signal and its grammatical structure. (On ‘speaker’ vs.
‘sentence’ meaning, see Quine 1960 and Grice 1968; for a discussion of
these ideas and how they relate to the ERG, see Bender et al 2015.)

ERS is finely calibrated as an easy-to-use interface representation for
parsing and generation, because it abstracts from semantically
irrelevant surface variation, is rich and detailed, yet avoids semantic
distinctions that are not constrained by the grammar of English. For a
semi-formal summary of the ERS meaning representation language, please
see [ErgSemantics Basics](ErgSemantics_Basics).

In the following sections, we walk through several core aspects (or
‘layers’) of ERS meaning representation, provide motivating examples and
pointers to related sections of the ERG Semantic Documentation, and also
seek to reflect on which ERS layers are more fully developed and which
remain to be elaborated.

# Semantic Predicate–Argument Structure

At the heart of ERS meaning representation is predicate–argument
structure, <span class="comment" style="display:none">We should add a
citation for the notion of PAS. What's the canonical cite?</span> which
is often characterized as a record of *who did what to whom.* ERS
predicate–argument structures go well beyond common target
representations in semantic role labeling (SRL), in that ERS accounts
for the contributions of *all* content words as well as those of
syntactic *constructions* as for example
[compounding](ErgSemantics_Compounding) or
[conditionals](ErgSemantics_Conditionals).

Predicate–argument structure is expressed in a collection of *n*-ary
predications (or relations) linked together by (typed) variables. Thus,
argument sharing across predicates will be captured through variable
equality, as for example in [non-scopal
modification](ErgSemantics_Design#non-scopal-modification), [control
constructions](ErgSemantics_ControlRelations), [coordinate
structures](ErgSemantics_Coordination), as illustrated in Example (1),
as well as others (like relative clauses and certain types of
comparatives):

      (1) The cheerful children wanted to sing and dance.

<img src="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-cheerful-children-wanted-to-sing-and-dance.png" title="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-cheerful-children-wanted-to-sing-and-dance.png" class="external_image" alt="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-cheerful-children-wanted-to-sing-and-dance.png" />

In this example, the instance variable *x<sub>6</sub>* (highlighted in
red) is the first argument of both the (semantics of the) attribute
adjective *cheerful*, the subject control predicate *try*, and both
predications corresponding to the coordinated verb phrase.

There are many syntactically distinct ways of expressing the same
underlying predicate–argument structure, as exemplified in Examples
(2a)–(2h) below. So-called diathesis alternations like the dative shift
(2b), passivization ((2c) and (2d)), or focus movement ((2e) and (2f))
can lead to stark differences in syntactic structure but have no
observable effect on predicate–argument structure (and would be expected
to exhibit identical truth conditions). Such surface variation is
abstracted away at the level of ERS meaning representations, i.e.
Examples (2a) through (2h) are all analyzed as semantically equivalent
close paraphrases and thus all associated with the predicate–argument
structure shown below. This abstraction is one of the properties of ERS
that makes it well-suited as the interface representation to parsing and
generation, in that downstream processing is expected to be independent
of (language-specific) syntax.

      (2a) Kim gave Sandy the book.
      (2b) Kim gave the book to Sandy.
      (2c) Sandy was given the book by Kim.
      (2d) The book was given to Sandy by Kim.
      (2e) The book, Kim gave Sandy.
      (2f) Sandy, Kim gave the book to.
      (2g) The book, Sandy was given by Kim.
      (2h) To Sandy, the book was given by Kim.
      ...

<img src="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/kim-gave-sandy-the-book.png" title="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/kim-gave-sandy-the-book.png" class="external_image" alt="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/kim-gave-sandy-the-book.png" />

Similar normalization effects are obtained for other constructions, for
example in (3) and (4) below. Lexical knowledge in the ERG enables the
distinction between so-called referential vs. expletive usages of some
pronouns, of which only the former will correspond to semantic
arguments. While *technique* in (3a) is the syntactic subject of the
predicative copula, the paraphrase invoking so-called (expletive) *it*
extraposition in (3b) demonstrates that *technique* is not a semantic
argument of *impossible*: Intuitively, there is no lack of possibility
attributed to the *technique* instance. Instead, there is a
long-distance dependency with the unexpressed syntactic complement of
*apply* in (3a), which is made explicit by variable *x<sub>6</sub>* in
the ERS (in red).

      (3a) This technique is impossible to apply.
      (3b) It is impossible to apply this technique.

<img src="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/this-technique-is-impossible-to-apply.png" title="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/this-technique-is-impossible-to-apply.png" class="external_image" alt="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/this-technique-is-impossible-to-apply.png" />

Another frequent variation in syntactic structure that is normalized at
the level of ERS pertains to what at times are called restrictive
modifiers, which can take the form of pre- or post-nominal attributive
adjectives or relative clauses (i.e. non-local dependencies), for
example:

      (4a) The barking dog scared me.
      (4b) The dog that was barking scared me.
      (4c) The dog barking (behind the fence) scared me.
      (4d) The dog I think Kim told to bark scared me.

<img src="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-barking-dog-scared-me.png" title="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-barking-dog-scared-me.png" class="external_image" alt="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-barking-dog-scared-me.png" />

<img src="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-dog-i-think-kim-told-to-bark-scared-me.png" title="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-dog-i-think-kim-told-to-bark-scared-me.png" class="external_image" alt="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-dog-i-think-kim-told-to-bark-scared-me.png" />

In the ERS analyses for (4a) through (4d), there will always be an
instance of the \_bark\_v\_1 relation (albeit with different tense
properties on its eventuality variable), where the *dog* instance
(*x<sub>6</sub>*) serves as its first argument.

Two variants of the examples in (3a,b) are given in (5), but neither is
assigned the same semantics as for the examples in (3).

      (5a) To apply this technique is impossible.
      (5b) Applying this technique is impossible.

Instead, for each of (5a,b) the grammar introduces a nominalization EP
which takes the semantics of the subject VP as its argument. For (5b)
this is perhaps less surprising, since the grammar uniformly adds such
an EP for all deverbal gerunds, and this distinct treatment of (5b) is
consistent with the lack of full parallelism with (3b), as shown by the
ungrammaticality of (6): adjectives such as *impossible* with an
expletive subject take an infinitival VP complement, but not an -ing VP.
Thus (5b) is treated as more closed related to *Application of this
technique is impossible.*

      (6) *It is impossible applying this technique.

With distinct semantics for (3b) and (5b), a choice must be made for
(5a), either to give it a semantics similar or identical to (3b), or
rather to (5b). At present, the ERG opts for the latter, but the highly
regular availability of both variants (3b) and (5a) for adjectives like
*impossible* (e.g. *difficult, fun, convenient, surprising, disastrous*)
suggests that the decision to add a nominalization EP for the semantics
of (5a) may need revisiting.

# Quantification and Scope

ERS makes explicit which parts of the linguistic signal express
quantification and provides partially-specified information about the
scope of quantifiers (and other ‘operator-like’ predications; see
[below](#senses)). The representation is
*underspecified* in the sense that we give just one ERS for the
following type of examples, even though there are two readings,
depending on the relative scope of the quantifiers:

      (1) All dogs chased a cat.

      (a) ∀x dog(x): ∃y cat(y): chase(x,y)
      (b) ∃y cat(y): ∀x dog(x): chase(x,y)

Nonetheless our representations do give partial information about scope,
in keeping with the facts of English. Of particular interest here is the
allocation of predications into the *restriction* and *body* of
quantifiers, which is critical to the correct modeling of their
interpretation. For example, the two sentences in (2) differ precisely
in this allocation. The quantifier expressed by *all*, when viewed as a
generalized quantifier, expresses a subset relation: For sentences with
*all* to be true, the set described by its restriction must be a subset
of the set described by its body.

      (2a) All funny jokes are short.
      (2b) All short jokes are funny.

This difference is captured in the ERS by constraining the restriction
(second argument) of each quantifier predication, as can be seen in our
representations for these two examples, where handle equality
corresponds to logical conjunction of predications. The handles and
associated handle constraints shown in red (*h<sub>6</sub>* and
*h<sub>8</sub>*) in these ERSs relate the restriction argument of *all*
to the appropriate elementary predications.

<img src="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/all-funny-jokes-are-short.png" title="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/all-funny-jokes-are-short.png" class="external_image" alt="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/all-funny-jokes-are-short.png" />
<img src="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/all-short-jokes-are-funny.png" title="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/all-short-jokes-are-funny.png" class="external_image" alt="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/all-short-jokes-are-funny.png" />

In fact, the handle topology is the only difference between these two
ERSs: They are identical in predicate–argument structure but differ in
scopal properties. In the semantics of (2a), *funny* and *joke* are
conjoined in the restrictor of the quantifier (shown as *h<sub>8</sub>*
in red), while *short* is the top-level predication, as indicated by =q
equality between its handle *h<sub>2</sub>* and the top handle
*h<sub>1</sub>* (in blue). Conversely, the scopal constraints on *funny*
and *short* are reversed in the semantics for (2a).

One well-formedness constraint in ERS is that every instance variable
(i.e. every variable of type *x*; see
[ErgSemantics/Basics](ErgSemantics_Basics)) must be bound by a
quantifier. Accordingly, ERSs provide quantifiers somewhat ‘generously’,
one corresponding to each nominal expression in the surface signal, as
well as additional quantifiers in case the semantic contribution of a
construction introduces further *x*-type variables (such as
[Coordination](ErgSemantics_Coordination),
[Nominalization](ErgSemantics_Nominalization), or
[Partitives](ErgSemantics_Partitives)). Where there is an overt
determiner (*all*, *none*, *the*, *a*, *this*, etc.) the quantifier will
reflect the semantic contribution of that determiner. Where there is
not, the quantifier will be one of a collection of abstract predicates,
most frequently udef\_q (an underspecified quantifier). See the page on
[Implicit Quantifiers](ErgSemantics_ImplicitQuantifiers) for further
details.

Current NLP tasks rarely exercise the kind of inference enabled by the
proper treatment of quantifiers, but as NLP as a field approaches more
involved and sensitive question answering and other dialogue related
tasks, we expect this aspect of meaning representation to gain
importance (see also Steedman, 2012). For applications where some or all
of the quantifiers provided by the ERS are not necessary, they can be
easily identified and handled according to the needs of the application.
A full inventory of the quantifier predicates provided by the grammar
can be found in the [SEM-I](ErgSemantics_Interface) (semantic
interface). Note that certain elements sometimes treated as quantifiers
in the literature (notably *many* and the semantic contribution of
number names) are treated akin to the predicates introduced by
attributive adjectives in the ERG.

<span class="comment" style="display:none">Note: Link to number names
page when it is available.</span>

# Negation, Modality, Operators

The second primary way in which English syntax places constraints on
scope involves what we call scopal operators (see
[ErgSemantics Basics](ErgSemantics_Basics#Convenience)). Here, we
illustrate this with *say*, *probably*, and *not*, all analyzed in ERS
as predications that take scopal (i.e. handle-valued) arguments. Their
scope relative to each other (and to the main predication with which
they co-occur) is fixed by their position in the syntax, and this is
recorded in the ERS via the =q handle constraints highlighted in the
figure below. These constraints say that \_probable\_a\_1 will be within
the scope of \_say\_v\_to (with perhaps a quantifier taking scope in
between), and likewise for neg and \_probable\_a\_1, and \_rain\_v\_1
and neg, respectively.

      (1) The meteorologist says it probably won't rain.

<img src="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-metereologist-said-it-probably-wont-rain.png" title="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-metereologist-said-it-probably-wont-rain.png" class="external_image" alt="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-metereologist-said-it-probably-wont-rain.png" />

By using =q constraints rather than direct handle equality, we leave
open the possibility of quantifiers coming in between scopal operators
and the elements they out-scope because of examples such as:

      (2) Every child didn't feed the doves in the park.
      (3) Cindy didn't light every candle last night.
      (4) That team will probably win every medal.

<span class="small">\[Examples (2) and (3) are due to Lee
(2009).\]</span>

<a name="ArgumentIdentification"/>

# Predicates and Argument Identification

ERS does not make explicit lexical semantics beyond what correlates with
grammaticized contrasts, e.g. predicate distinctions that co-vary with
clear differences in argument frames and types. For example, in the ERS
for *The bank with the shortest atm lines is near the river bank*, both
instances of *bank* will be represented by \_bank\_n\_of. On the other
hand, the examples in (1) show how the distinction between the
verb–particle construction, which allows greater flexibility in
placement of the *up* particle, and the ‘standard’ use of *up* as a
directional preposition lead to different ERS representations. This
contrast is reflected in different choices for the verbal predicate:
two-place \_look\_v\_up, meaning ‘locate’ for (1a) and (1b), vs. ‘plain’
one-place \_look\_v\_1 combined with a two-place directional *up*
predication:

      (1a) Kim looked up the answer.
      (1b) Kim looked the answer up.
      (1c) Kim looked up the chimney.

<img src="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/kim-looked-up-the-answer.png" title="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/kim-looked-up-the-answer.png" class="external_image" alt="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/kim-looked-up-the-answer.png" />

<img src="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/kim-looked-up-the-chimney.png" title="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/kim-looked-up-the-chimney.png" class="external_image" alt="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/kim-looked-up-the-chimney.png" />

Similarly, the so-called causative–inchoative alternation gives rise to
systematic predicate distinctions, corresponding to different usages of,
for example, *accumulate*, *age*, *break*, *burn*, and roughly 400 other
verbs in the ERG lexicon:

      (2a) Kim broke the window.
      (2b) The window broke.

ERS provides unique argument *identification* but not thematic
interpretation; for each distinct predicate (or set of predicates from
related lexical classes), there is a uniform assignment of semantic
roles on the basis of positional argument identification. For example,
the ERG provides a systematic predicate alternation between two-place
\_break\_v\_cause vs. one-place \_break\_v\_1. Because the bland
semantic roles labels (ARG1, etc) are intended to have predicate
specific interpretations, this allows us to differentiate the ARG1 of
\_break\_v\_cause (roughly, ‘agent’) from ARG1 of \_break\_v\_1
(roughly, ‘theme’).

<img src="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/kim-broke-the-window.png" title="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/kim-broke-the-window.png" class="external_image" alt="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/kim-broke-the-window.png" />
<img src="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-window-broke.png" title="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-window-broke.png" class="external_image" alt="http://svn.delph-in.net/erg/tags/1214/www/esd/essence/the-window-broke.png" />

# Further ERS Contents

<span class="comment" style="display:none">This section should provide
quick pointers to what the ERS has to say about these aspects of
meaning, but in less detail, since perhaps here we aren't gloating with
pride.</span>

*Tense and aspect*: ERS includes information about the semantic
correlates of morpho-syntactic markings of tense and aspect, recording
these contributions as properties on eventualities, with the TENSE
attribute on an *e* variable taking as its value one of the types *past,
present, future,* or *untensed*. The aspectual properties are similarly
recorded as plus-or-minus (*boolean*) values of the features PERF (for
*perfect*) and PROG (for *progressive*). Thus the ERS for *Kim has been
sleeping* will include the following predication, where the intrinsic
variable (ARG0) for the present perfect progressive of *sleep* has the
expected values for the three tense/aspect attributes:

      h:_sleep_v_1[ARG0 e(TENSE pres, PERF +, PROG +), ARG1 x1]

We have in the past experimented in the ERG with a less superficial
representation of tense and aspect, implementing an adaptation of
Reichenbach's (1947) account using binary ordered relations among an
*event* time, a *reference* time, and a *speech* time (cf. [this
Encyclopedia of Philosophy
article)](https://plato.stanford.edu/entries/tense-aspect), but the
current ERG confines itself to a relatively direct projection of the
morpho-syntactic distinctions English employs for tense and aspect.

*Plurality, generics, partitives*: The semantic singular/plural number
distinction is recorded on instance (*x*) variables with the feature NUM
taking as its value either *sg* (singular) or *pl* (plural). Instance
variables also record two other semantic properties: the feature PERS
takes values *1,2,3* for first-person (speaker) *I/we*, second-person
(hearer) *you*, and third-person otherwise, respectively; and IND
distinguishes individuated entities introduced by count nouns such as
*cat* or *cats* from non-individuated referents for mass nouns such as
*rice*. So the ERS for *Flowers arrived* will include the following
predication with the expected values for the three attributes on the
intrinsic variable for the plural of *flower*:

      h:_flower_n_1[ARG0 x(NUM pl, PERS 3, IND +)]

Partitives, as in the nominal phrases *half of the cookies* or *the
oldest of the children,* are explicitly represented in ERS, using the
two-place predication *part\_of*. For example, the ERS for *the oldest
of the children are asked to help the younger ones* includes the
following predications, where the intrinsic variable for *part\_of*
refers to the subset of children who are the oldest ones, and the ARG1
variable is for the set of all contextually relevant children:

      h1:part_of[ARG0 x, ARG1 y]
      h2:_old_a_1[ARG0 e, ARG1 x]
      h3:_child_n_1[ARG0 y]

Generics are not currently given any distinctive semantics in ERS, so
the predication for *lion* is the same for *the lion has been in Africa
for millions of years* as for *the lion is behind that tree*.

*Names*: ERS normally provides a decomposed semantics for names,
typically with one predication for each token, plus one or more
compounding relations that link up the intrinsic variables of each of
these predications, two at a time. Each of the *named* predications
contains both an ARG0 variable and a CARG (*constant-argument*)
attribute whose value is the surface form for the corresponding token.
In addition, each of these named instances is bound by a distinct
quantifier (*proper\_q*). For example, the ERS for *Mary Ellen Smith*
will include the following predications:

      h1:named[ARG0 x, CARG "Mary"]
      h2:named[ARG0 y, CARG "Ellen"]
      h3:named[ARG0 z, CARG "Smith"]
      h4:compound[ARG0 e1, ARG1 y, ARG2 x]
      h5:compound[ARG0 e2, ARG1 z, ARG2 y]

Named entities, of course, come in a wide variety of forms, and some of
these differences are reflected in the corresponding ERSs, so *the
University of Oslo* may introduce an *\_of\_p* predication, while
*President Smith* may introduce a *\_president\_n\_of* predication
rather than a second *named* one. We view a comprehensive and consistent
treatment of named entities to be an open and challenging research
topic, meriting a detailed discussion outside the scope of this
overview.

*Information structure*: ERS includes some representation of information
structure, making use of a small inventory of binary relations on
individuals to record the semantic correlates of lexically and
syntactically expressed constraints on topic and focus. In particular,
ERS uses two kinds of ICONS relations, one called *topic* and one called
*focus*, following the work of Song (2014), where each relation takes as
one argument the relevant eventuality and the other the instance which
is marked as either topic or focus. For example, the ERS for *Kim was
admired by Smith* will contain the following predications and a set with
a single ICONS to indicate that the passive construction in English
makes the passivized nominal the topic of that clause:

    h1:_admire_v_1[ARG0 e, ARG1 x, ARG2 y]
    h2:named[ARG0 y, CARG "Kim"]
    {e topic y} 

Similarly, the ERS for the sentence *those bananas, we thought you
liked* will contain an ICONS of the form *e focus y* where *y* is the
intrinsic variable for *bananas* and *e* is the one for *liked*, to
indicate that the so-called *topicalization* construction in English
makes the fronted element the focus of the relevant clause. Another
phenomenon affecting information structure is the *it-cleft*
construction, as in *it was you that we talked to* where the instance
for *you* is the topic of the clause. These ICONS elements do not change
the truth conditions of an utterance, but make available in the ERS some
of the relevant contrasts, which can be useful, among others, in
controlling the form of sentences generated from an ERS.

# Future Work

-   Event types/Aktionsart

-   Presupposition

-   Discourse status

-   Scope islands

-   Restrictive v. non-restrictive modification (rarely grammatically
    constrained, but constrained in some cases)

-   Politeness <span class="comment" style="display:none">\[Probably not
    worth saying much about, since English doesn't really grammaticize
    this --EMB\]</span>

# Extra-Grammatical Aspects of Meaning

There are many additional layers of meaning representation that are of
interest to NLP, but which fall outside the scope of grammar-based
processing, because they are not grammatically constrained. Here we
outline some of these and describe how ERS can serve as a useful
interface for systems or projects annotating (manually or automatically)
these additional layers. For more discussion, see Bender, et al., 2015.

<a name="senses"/>

## Below the Level of Composition

On the one hand, there are layers of meaning representation that the
grammar does not constrain because they concern only atoms within the
composition. Two prominent examples are fine-grained word sense
distinctions and named entity types. Regarding the former, ERS only
marks those sense distinctions that are morphosyntactically marked (as
described [above](#ArgumentIdentification)). Since
further sense distinctions could never be disambiguated based on
grammatical structure alone, ERS instead provides predicate symbols
intended to be underspecified representations of a range of more
specific word senses. Word sense annotation or disambiguation efforts
should find the ERS a useful starting point (as opposed to surface
strings), however, both because of the coarse-grained sense distinctions
that are provided and because of the normalization across different
inflected forms of the same lemma.

For example, the ERS represents both *drew* and *drawing* in (1) with
the predicate \_draw\_v\_1. Clearly, for hand annotation, an interface
relating ERS elementary predications to surface strings would be
required, but this is facilitated by the existence of the
‘characterization’ (character offsets) information associated to each
predicate symbol. For automatic word sense disambiguation, the explicit
identification of arguments (the horse is the ARG2 of \_draw\_v\_1
meaning ‘make a picture’ and ARG1 of \_draw\_v\_1 meaning ‘pull’) is
more helpful than flat word strings.

      (1) They drew a horse drawing a wagon.

<img src="http://faculty.washington.edu/ebender/draw-draw.png" title="http://faculty.washington.edu/ebender/draw-draw.png" class="external_image" alt="http://faculty.washington.edu/ebender/draw-draw.png" />

## Never Grammatically Disambiguated

-   Distributive v. collective readings of coordination
-   Event quantification

## Further Semantic Computation Required

-   Quantifier scope resolution
-   Coreference resolution
-   Focus of negation and other focus-sensitive operators

## Discourse Processing

-   Presupposition projection
-   Coherence relations/rhetorical structure
-   Discourse moves/adjacency pairs

# References

Bender, Emily M., Dan Flickinger, Stephan Oepen, Woodley Packard, and
Ann A. Copestake. 2015. Layers of Interpretation: On Grammar and
Compositionality. In *IWCS,* pp. 239-249.

Grice, H. P. 1968. Utterer’s meaning, sentence-meaning, and
word-meaning. Foundations of Language 4(3), 225 – 242.

Lee, Sunyoung. 2009. *Interpreting scope ambiguity in first and second
language processing: Universal quantifiers and negation.* University of
Hawaii at Manoa.

Quine, W. V. O. 1960. *Word and Object*. Cambridge, MA, USA: MIT Press.

Reichenbach, H. 1947. Elements of Symbolic Logic, New York: Dover
Publications, Inc.

Song, Sanghoun. 2014. A Grammar Library for Information Structure. Ph.D.
thesis, University of Washington.

Steedman, Mark. 2012. *Taking scope: The natural semantics of
quantifiers.* MIT Press.
