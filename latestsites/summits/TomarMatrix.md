{% raw %}SIG discussion at [Tomar, 2014](https://delph-in.github.io/docs/summits/TomarTop) on the [Grammar
Matrix](https://delph-in.github.io/docs/matrix/MatrixDocTop) in individual grammars (what is used, what has
been changed), led by Antske.

* * *

Emily: In terms of collecting information, there's two pieces to
consider:

1. A backwards-looking wish. When people have created open-source
grammars, we can look at what they've changed, and what analytical
choices they've made.
2. A forwards-looking request (asking people to give feedback). When
something isn't doing what you want it to do, there is a mailing
list to let us know.

Antske: For the Spanish grammar, it was difficult to see what was from
the Matrix Grammar and what wasn't. The Portuguese grammar is very
different. You want to be able to restrict in which order adjectives
combine with a noun, when they occur before and after the noun. Rules
inherited from the ERG are always right-branching, to avoid spurious
ambiguity. We found cases in Turkish when it does matter, so we had to
flip the order of branching. Korean too. There are languages which have
similar problems for determiners. Maybe we need something more general
than the Grammar Matrix.

Emily: I want to decompose these cases. We should give further
instructions.

Antske: Petya, did you cover wh-phrases and relatives?

Petya: Yes.

Antske: It's not in Emily's lab - it's too complicated for that.
[ManGo](/ManGo) doesn't do relative clauses.

Emily: Mandarin doesn't use wh-words in relative clauses.

Antske: We could also look at Dutch, German...

Emily: It doesn't come in the class, so haven't worried about it.

Liling: What does it inherit from?

&lt;clarification of what a wh-word is...&gt;

Antske: For relative clauses, I introduced a bunch of phrases. We had
this marker 'comp-phrase', taking the verb as the head of the relative
clause.

Emily: In the paper, we should focus on what's ignored in the Matrix.
I'd love someone to do a library on relative clauses some day.

Petya: I focused on types first, and then the lexicon. I had to change
interrogative words - I like to do them as determiners, plus some other
relation. The other thing is the head types - when you have some
selectional properties, and you write your specifications, you have to
write what they select for, and I had some cases I couldn't combine what
was in the matrix. For example, a type which combines verb, adjective,
adverb, and adposition.

Emily: These types \*are\* defined.

Antske: I also found types that people introduced which were already in
the Matrix. Not for head types, but I noticed the same issue for
something else. Maybe we need beetter documentation?

Emily: If you added further head types, you might not have the type that
you want. The lisp code that generates that file is included, so you
could run that.

Antske: Distinguished functional heads (important for Chinese?) If you
can make a nice small hierarchy that captures everything you need, it's
more helpful than having a huge one. You cannot tell from
spring-cleaning which ones are meaningful. It's hard to tell which ones
should be static or dynamic.

Emily: That file is a place-holder solution. It generates many more
types than what you need.

Antske: The Chinese grammar and Korean grammar made changes to the head
types. The Portuguese grammar made changes to almost everything. For
German, we assume semantic agreement. If you have something without an
index, it doesn't have agreement.

Emily: Clauses are 3rd person singular.

Petya: Treat it as nominalisation?

Emily: But we don't want it in the semantics.

Antske: In Dan's framework, there are a lot of features, where he's not
sure if they're linguistically motivated, but they're needed
grammar-internally. As soon as you start to cover more complicated
phenomena, you need other stuff.

Emily: No nominalisation in "That Kim laughed surprised Sandy", but
already distinguished syntactic and semantic gender. When we talk about
what people change, we could try looking at the choices file, generating
a new grammar, and comparing.

Petya: More changes to the sign, for inflection.

Emily: Tanya did the same thing for Russian. Now get sub-types. Feature
"inflection", which takes a feature structure as a value. All the flags
must be satisfied. In my class, students careful about morphology
produce messy structures with lots of flags.

Antske: And the flags often have very long names.

Emily: Provides infrastructure when starting, but might get in the way
later. About customisation, not Matrix Core... Is the frame thing you
have in mind, a set of implemented and tested cross-linguistic
hypotheses? Statements that are useful, and not necessarily true. Tested
in a bottom-up fashion. Pretty-much any of these grammars could be built
differently. We can't make strong claims, but can see how they've held
up.

Petya: What's your opinion about a smaller case, say Slavic or Chinese,
combining related languages?

Emily: That would be interesting. With CLIMB, not by itself.

Antske: There's interesting information coming back to the Matrix from
this. For any language, there's the question of comparing it to
others... Something that gets removed is a lot of relations. Grammar
engineers have a model for that in mind, usually a hierarchy. Don't
always have the lexical types. Tense hierarchies.

Petya: Bulgarian grammar would share a lot with Spanish (but no clitics
in Bulgarian).

Antske: Talking to Stephan Müller, everything that can be shared between
languages forms a subcore. Montserrat had a useful file... things like
case values, not universal. When looking at Tanya's hierarchy for Slavic
languages, not everything's needed for Bulgarian. There's also
language-specific stuff, e.g. Polish and Russian genitive of negation.
There's a very complicated but valuable question of how best to share
these.

Emily: New supertypes?

Petya: We just inherited.

Emily: For the Matrix, I initially stripped out lexical types, then
thought through logical possibilities of lexical types.

Petya: There's a problem with predicative adjectives. In Bulgarian, we
don't make this distinction. Could use the supertype.

Emily: TJ's fixed the problem now.

Petya: What about punctuation?

Emily: We don't do anything with it.

Petya: Should it be incorporated?

Emily: Was there anything you had to change?

Petya: Redefinition of word, following the Portuguese grammar.

Emily: We had a type addendum notion, and it's logically the same thing.

Antske: Filler-gap? JACY is the only one to use long-distance
dependencies.

Emily: Anything else, Petya?

Petya: Not indexing adjectives with modifiers.

Emily: That's the thing that was broken. Some oversimplified view about
head-modifiers.

- Anstke, do you have information about when each grammar adopted the
Matrix?

Antske: Most don't have that documentation in the grammar. Has been
helpful to ask the developers themselves.

Petya: The Portuguese grammar is well-documented.

Antske: Some things are impossible to include. Fundamental things -
Petter did things with valence and arguments. In GG, there's only one
list - in German, raising is so important, and there's flexible word
order, and this is more efficient - can't just make a few changes on the
top.

Emily: To ask for feedback, we should make sure there's a longer section
in the documentation about making changes to the Grammar Matrix.

Antske: For Portuguese, it was not just tuning this or that, but
completely new ideas.

Petya: They build the grammar from the start, and took a different view.

Emily: We should say that analytical style is also involved, even if not
forced by language differences.

Petya: When working with treebanks, I sometimes make different decisions
from what is already there. It depends what you want to do with the
model.

Emily: Is there anything that was hard to put up with? Anything that
chafed?

Petya: It was more painful on the determiner stuff. The mechanism is
okay, but my idea was that determiners are more or less adjectives in
Bulgarian. Had to convince myself of this without being a GB-linguist.
What is a related language? We have some similar features with English.
Happy with the model.

Emily: At the end of my course, I always asked: what was easy or
difficult? In the last few years, I also have an audio recording of the
discussion.

Antske: We can look at what's in CoLLage. I don't know why someone
decides to make a different hierarchy of head types - but for smaller
changes, it's easier to see why.

Emily: For the CoLLage grammars, we also have write-ups.

Antske: For German, a lot of things were related to filler-gap being
used for everything. Doing this for V2 word order means extracting
expletives, which is impossible.

Emily: The ERG has a subtype for expletives.

Antske: A subtype for expletives that doesn't have contentful semantics.
The grammar wanted a semantically contentful filler.

Emily: Overgenerates?

Antske: Yes. Norwegian has subject drop in yes/no questions. Cannot drop
the subject before you have the complement, and cannot have the
complement before you have the subject. If you have some combination of
properties, some assumption you made doesn't hold.

Emily: We should find all changes, classify them as best we can, and
illustrate each class. The most interesting thing would be linguistic
phenomena that contradict the Matrix.

In terms of reaching out to other people, we probably want to go on the
developers list.

Antske: Matrix mailing list is not active, so developers list might be
better.

Emily: It might make sense to contact both - some grammarians are not on
the developers list since not in Delphin.

Antske: I'll try to write an email soon. We should start with the small
grammars from the course, then move onto the larger ones.

Emily: I could make myself do one or two every week until it's done.

Antske: We could also contact Stephan Müller.

Emily: We could compare both cores, to see what's the same and what's
different. With a focus on what's the same, either because they must be
true, or because they embody strong hypotheses. Where they're different,
either because of local decisions or because of formalism differences.

Antske: Their methodology is bottom-up, very strongly - first develop
grammars then compare. We (Emily) built generic types from general
linguistic knowledge and a few well-developed grammars.

Emily: I should ask everyone here: as a potential reader, what are you
interested in seeing?

Liling: What is the implication for a new grammar engineer? What kinds
of errors should I not make? e.g. applying to Sinitic Grammar

Emily: For example, we can explain types that were hard to find.

Antske: We will have a section on similar extensions. Also customisation
system. People want to see examples.

Emily: Defining linguistic phenomena is one of those impossbilities.
Extensional provisional definition. Spanish phenomena catalogue. Get
engineers to list 100 phenomena that their grammar handles. Did this
(ish) for Wambaya. Started from notes, categorised them, put in example
sentences. Named phenomena either with category names, or sometimes just
Wambaya words. Finally, put in IGTs. The baseline is a list of
phenomena, then put in strings, then put in IGTs. Could be prompted to
do this again. Could try to compare across them. Would need to find an
interesting granularity for phenomena. e.g. which grammars have done
relative clauses? you could even e.g. with a treebank, and IGTs, plug
them in and see what rules are involved.

Antske: Useful for analysis of other German grammars. Looked at
semantics.

Emily: Documenting gives no immediate payback for the grammarian,
however.

Liling: It could be easier to ask questions.

David: But you always find things no one has thought of.

Liling: You could then ask if there are language-specific constructions.
If you put it there and give an example, other people might think of
analogies.

Antske: How do we get people to do this as they are developing a
grammar? There's a gratifying feeling being able to parse correctly.
People could write on the wiki to say, my grammar now covers... Asking
people to do this retrospectively is too much.

Petya: What about the Matrix Test Suite?

Emily: But that's semantic, not syntactic.

Petya: It was a good starting point for me.

Emily: It's a good starting point, but more semantic. For Wambaya, I
listed valence types as separate phenomena. (With some phenomena, I have
a note saying it was broken.)

Antske: We could start doing this for the small grammars, and make a
list for those.

Emily: We could do this by going through the write-up materials. There's
also a larger check-list from the class materials. "Was this not
applicable or not working?"

David: What about noun incorporation? Grammars have to do it from
scratch.

Emily: That would be a Masters-thesis sized library. There's a
standardised shape to these studies now (e.g. TJ). If it's something
you're interested in...

David: Possibly... But it was a huge part of our language and there
wasn't time in the class, there were no libraries.

Emily: Own priorities: adverbs, which are common in naturally occurring
dialogue. Noun incorporation isn't going to kill us. Call that a complex
verbal root and leave that alone for a while. Unlike, e.g. "yes" at the
beginning of a sentence.

Liling: What if there's a course? At the Saarland, we didn't do toy
grammars, we were building an English grammar. Everyone building it
together. People will have conflicts...

Emily: Collectively building?

Liling: Yes.

Antske: Maybe for the customisation system, you would have that problem
less. There you could agree, but generally I don't think it's possible
to build a grammar with ten people.

Emily: You could take one large existing grammar, and add ten phenomena,
to add around the edges.

David: Better yet, take an underdocumented grammar!

Liling: We don't know whether the course will continue in the Saarland.

Emily: Whether or not you're starting from scratch, test suites are
critical. If everyone's phenomena are in the test suite, I can make sure
I don't damage anyone else's work. I previously collaborated with a time
difference, and we would always sync and check.

Antske: The only other story I know of collaborative grammar
engineering, they never worked at the same time. Writing in parallel
makes it a pain to integrate. You should either sit together, or do
things one after the other.

Last update: 2015-08-20 by EmilyBender [[edit](https://github.com/delph-in/docs/wiki/TomarMatrix/_edit)]{% endraw %}