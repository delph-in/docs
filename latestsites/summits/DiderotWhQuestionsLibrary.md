{% raw %}[Slides](http://users.sussex.ac.uk/~johnca/summit-2018/constituent-wh.pdf)

Olga: \[Uses the word "gapping".\]

Dan: "gapping" refers to a funny construction -- "Kim gave Sandy a book
and Pat a record."

Emily: Confusion comes from use of GAP instead of SLASH for the name of
that feature in SWB 2003. Better to use "long distance dependencies".

Olga: Do you know of a language where a question "particle" doesn't
behave like a complementizer?

Guy: In Hokkien there's something that goes right next to the focus of
the (yes-no) question. Should probably be in your list as a separate
kind of thing.

Emily: Like Russian, right?

Guy: But this isn't about constituent questions.

Olga: That one is, though, right? *Is it a book that you read?* is a
question about one constituent.

Emily: But not in your sense of constituent question, since you can
still answer with *yes* or *no*.

Sanghoun: In my thesis, I provide basic structure for wh words for
information structure. It's a kind of focus. It's a kind of focus item
with contrastive meaning. (EMB: Not sure I've got this right.) I
provided two more potential problems in the wh word in terms of focus
structure. The first one is multiple wh-fronting. That is related to
Berthold's question yesterday from the last session (about multiple
gap). In Bulgarian, if there are multiple wh words, must all be fronted.
Also, in most languages, wh questions are ambiguous between information
questions and rhetorical questions (*Who knows?*).

Olga: Which parts of matrix.tdl would I need to modify to handle (7b).

Sanghoun: NON-LOCAL. The three things under NON-LOCAL are SLASH, QUE,
and REL. The data structure of NON-LOCAL, and QUE, and SLASH.

Berthold: In these examples (7) they are all complements, right?

Olga: The first one is the subject...

Berthold: For resumption in Hausa I needed multiple values in SLASH
because you can relativize out of relatives. One thing I bumped into was
I could get away with it, because I could have any number of
resumptives, but only one true gap. Problem you might be facing when you
add adjunct extraction: How do you limit the number of SLASH
dependencies? For resumptives, you can see, but for adjuncts it's
unlimited.

Berthold: Look to HaG for how I handle more than on element SLASH list
and it's Matrix-based.

Berthold: Are you still collecting typological data points? Coptic
Egyptian has an interesting version of in-situ wh: Same markers at the
higher point as in relative clauses, but indefinite pronoun in situ.
Higher marker marks the scope of the wh word.

    relativizer the crowd say that I who?
    `Who do the crowd say that I am?'
    
    rel who have mercy for pronoun
    `Who will have mercy on us?'

See HPSG 2014 paper by Chris and Berthold.

Sanghoun: Lexical ambiguity of wh word across languages: English
what/something but in Mandarin: shenme is used for both. Two strategies:
(1) two lexical entries (2) \[better\] just one lexical entry. I tried
to do (2) in Zhong, but found it almost impossible.

Olga: There are languages that just have one orthography for all of them
for all wh words (not just what or who). But still there is a limited
number. But in some languages you can generate more forms via productive
morphology (Dutch? German?) but even then still somewhat limited.

Berthold: where-on have you thought?

Guy: Only productive if you get a new preposition.

Berthold: German also has scope markers: Which kind of book has he
bought?

Emily: What's that got to do with scope?

Berthold: That's what it's called by garden-variety of German linguist.

Berthold: A thought about the iterability of wh adjuncts. In Russian,
isn't it restricted to k-words?

Olga: ... comes up with example where something else fronts.

Berthold: Oh, okay. Tough luck.

Olga: The thing with Russian is that the word order is so flexible, you
don't have to do this. Sanghoun said it's maybe obligatory in Bulgarian,
but in Russian, it's not obligatory.

Emily: It'll be a problem in Russian too (and not solved for free by
free word order) if the multiple wh fronting can apply across clauses.

Guy: Can you do that in Russian too with "who did you say what to whom?"

Olga: I think so...

David: In Indonesian you use the relativizer:

    who rel did waht
    `who did what?'

And passivization is obligatory if the complement is being questioned:
what did you eat?' -&gt; what is that was eaten by you'

Berthold: On the scope thing: similar to Coptic. The was-split in
German:

    I wonder what he for book has.
    `I wonder what kind of book he has.'
    
    What threatens he for a book to buy.
    `What kind of book is he threatening to buy?' 

Emily: This links to a problem we have in MRS. When we got rid of the
messages, we lost the ability to link wh parameters to a particular SF
ques element.

Guy: We discussed this at the last Summit. (See
[OsloQuestionRepresentation](https://delph-in.github.io/docs/summits/OsloQuestionRepresentation))

Olga: Back to slides... In Finnish, there's an interrogative word that's
used in polar questions, but not in constituent questions. But I think
that's fine.

Emily: But you'll have to rule it out.

Luis: Relatedly in Mandarin, if you have the question particle ma, then
the ambiguous words like shenme (something/what) to get non-wh reading.
(There's actually a cline of acceptability with these, depending on the
question/indefinite word.)

Olga: And inflection... that should be easy as these things usually are
in the Matrix.

Emily: Inflection is easy. The trickier part will be correlating the
presence of the marker with the wh words.

Berthold: Hausa: Everything that has to do with focus fronting, in the
clause at the top of the dependency, you get an alternation in the TAM
marker (auxiliary).

Emily: That's interesting from a library point of view, because you
don't want to make it too specific to wh questions. The right answer is
probably in the interaction with Sanghoun's library.

Olga: \[Slide on interrogative verbs\] What should I be worried about
here? Semantics, MRS, ...?

Guy: Is this like an auxiliary verb, or is there a version like this for
every verb in the language? Some particularly common verbs only? Just
this one?

Olga: My understanding is that in most languages that have this, it's
just "do what", some also have "say what" and "go where". There is a big
article by Hagege. And he insists that it's not an auxiliary that
attaches to just any verb.

Emily: I'd be interested to know what kind of syntax changes there are,
and also how it relates to the question of scope. What happens with
"What did you say your son is doing right now?"

Weiwei: Is this a light verb?

Olga: Aren't light verbs things that attach to other verbs?

Emily: Or other predicates and make them verby...

Berthold: Like noun incorporation.

Olga: So this doesn't look like a light verb.

Kristen: Can these verbs also combine with the regular question
strategy, like "Who does what?"

Emily: In terms of the MRS design, it would be nice to know if this is
paraphrase of the ordinary question strategy + do.

Kristen: Or if ordinary question strategy + do is disallowed, that'll be
something to model.

Dan: On the face of it, this seems like pied-piping of verbs like the
(stilted) example: *That's the book reading which will be difficult.*

Guy: Is this fronted, or is this just the ordinary word order?

Olga: I don't remember, but I'm pretty sure that they do get fronted in
general.

Olga: They absolutely can inflect for things like person and number.
This ex doesn't show it, but the point is that they behave like a verb
in many respects.

Guy: Building on Dan's comment, then the question is whether you can
also front normal (non-questioned) verbs and whether this fronting is
obligatory.

Olga: ERS slide: note that what gets mapped to 'which thing'

Dan: The ambition there is to avoid having all the different wh
quantifiers ... all decomposed into which\_q + thing, manner, time,
place, person. There was a theory that that would simplify mapping a
logical form, but it's a finite list, so it's not like it gains an
enormous amount.

Berthold: So the difference between *what thing* and *what* will just be
the leading underscore for thing\_n and \_thing\_n.

Dan: Similarly for *who* and *which person*.

David: In Indonesian, we also have plural wh words if you expect the
answer to be plural.

Olga: I think in general these inflect.

Emily: For case, or other things?

Olga: I think you can do number as well.

Sanghoun: Gender?

Olga: Which thing did you see, which person did you see? ... agrees with
the noun in gender.

Olga: I'll be collecting examples ... if you think of something later,
feel free to email me.

Kristen: I wonder if there's anything do consider in terms being able to
repurpose the wh words as relativizers later.

Dan: They're not exactly the same.

Emily: Plus they don't mean the same thing.

Berthold: There's also the wh/indefinite ambiguity.

Sanghoun: Are you only interested in wh questions in direct speech. What
about "I'm wondering what Kim saw..."

Olga: I'm definitely interested wh complements, seeing as I just
finished a library for complement clauses.

John: What about stress, like *You bought WHAT?*

Olga: We don't really do prosody in the Matrix do we?

Emily: When we do information structure in 567, we tend to fake up
prosody with a -FP fake affix to mark. But John's example brings up the
interesting point that there is in situ wh in English (I think G&S come
up with three uses of these, not just echo). Need to decide how much of
that is in scope.

Olga: What would you be surprised not to see in this library?

Dan: Differences between matrix and embedded questions, like whether for
embedded only in English?

Emily: There's the question of to what extent the fine-grained details
(cf. Sag on all the specifics of matrix/non-matrix subject/non-subject
in English) can be supported at the cross-linguistic level.

Guy: What about questioning adjectives: how long, how big

Dan: Interacts with the decomposed semantics... to which degree on the
dimension of...

Dan: Also possessive wh. How much decomposition do you want to do when
these single words can pack a lot of info. whose = which x, person(x),
poss(x,y)? Worth doing? Does it help with normalization across
languages?

Emily: What do you do in the ERG?

Dan: I unpack. Not sure if it's the right thing.

Luis: Francis thinks it is. In [WordNet](/WordNet) we try to give a
representation that does the unpacking like the ERG.

Guy: I've always been happy with this. Is there something wrong with it?

Dan: Part of the problem is that we don't have "which's" --- *the book
whose cover* doesn't entail person, but the wh question of it entails
person.

John: *whose chairperson*

Dan: Or at least animacy.

Emily: It seems to me that that makes the unpacking a feature (you can
model this) not a bug.

Dan: It does mean I need two *how*s, one for *how tall* and one for *how
did you do that*?

Olga: If it's closed class, does it really matter? How many *be*s do you
have?

Emily: A whole hive...

Guy: Another class of questions is where you give two different options.
Ex: *Did you read the book or the magazine* with a special word for or
(hai2shi4).

Olga: Is this a constituent question?

Guy: I could imagine a language where there's an extra element marking
the whole clause, or making the NP...

Olga: The literature as I've read it says no.

Guy: You can't answer a disjunctive with a yes or no, you have to answer
with one of disjuncts

Emily: What's the special word in Mandarin?

Guy: hai2shi4

Emily: Do you need the ma with that?

Guy: no.

Weiwei: \[Confirms.\]

\[Glenn (not present at discussion): Same special-word disjunctive
question also exists in Thai, “reuu.” The construction has interesting
negation effects.\]

Emily: So the hai2shi4 carries the question force.

Weiwei: Reminded of research on L1 acquisition of logical connectives.

Emily: I think these are interesting, and you're right Guy that they
can't be answered with 'yes' or 'no', so by that test they should be in,
but I think they can still be safely out. It's useful to map the terrain
just outside the scope of the library too.

Angie: Make sure the interrogatives library plays nicely with the
possessive library.

Guy: To make the scope of this clear -- "constituent question" sounds
like a question that is a constituent or something like a cleft where
the form of the question that cares about a constituent (but the reply
is just yes/no; *Was it the book that you saw*).

Dan: Doesn't that exclude *how* and *why*, where the answer is a whole
clause?

Guy: But at least you can't reply with just a *yes* or *no*.

Emily: What does the typological literature call this?

Olga: Constituent questions, or information questions.

Last update: 2018-06-19 by GlennSlayden [[edit](https://github.com/delph-in/docs/wiki/DiderotWhQuestionsLibrary/_edit)]{% endraw %}