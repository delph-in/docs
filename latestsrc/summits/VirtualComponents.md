{% raw %}Apart from the main usage of the grammars for parsing and generation, do
people use them for other things?

We have a list of [Applications](https://delph-in.github.io/docs/home/DelphinApplications), but I am thinking
more of use of components, like a library.

Some things we have done (or would like to do):

Internal:

- send a processor a derivation tree, get an MRS
- send a processor a derivation tree, get a labelled Tree

External:

- get the head (or set of heads) of a constituent
  - *A monostral generative grammar that can both parse and
generate*
  - *monostral generative grammar*, *generative grammar*, *grammar*
  - useful for knowledge extraction
- curated lists of words
  - all Japanese irregular verbs
  - control verbs
  - nouns that take *pair*
- lemmatized, pos tagged text (for another task)
  - with grammar specific POS mapped to something more general?
- MWE recognition
- scope of hedges/negation

Bec: “what IS grammar as components?”

Intro:

Mainly people with tasks outside of DELPH-IN and want to use the tool.
It would be good to have more interaction with the tools doing the
derivation task. To interact with the grammar at a smaller level
(without having to parse from scratch).

Francis: I believe this is possible with the LKB, now LKB has a server
and it is possible to set up things like this but not in ACE.

**How to take a phrase and find what the head is?**

Monostratal generative grammar or a generative grammar to get the exact
chunk you want. but that distinction is lost within the MRS. This was
possible in JACY but it is no longer active.

**Curated list of verbs**

This is hard to do without deep knowledge of the grammar. It is an area
where we have knowledge inside the grammar, but we’re not making it easy
to exploit that.

**Lemmatized POS tagging**

Lemmatization is excellent but the grammar specific POS is not
necessarily mapped to something else.

Alex: treebanking using fftb requires more knowledge of the grammar the
other discriminant based systems.

Francis: Unless you have a lot of knowledge of the grammar, it is
harder.

Luis: but you get to know more about the choices that are being made
because they are made during the discriminants. ERG is good for getting
the full proper treebank, instead of just getting the right semantics.

Bec: Ned ([Discovering syntactic phenomena with and within precision
grammar](https://minerva-access.unimelb.edu.au/bitstream/handle/11343/214022/thesis.pdf?sequence=1&isAllowed=y))
was doing this, if you search the linguistic phenomena, it will show all
control-verb constructions.
[Fangorn](https://www.aclweb.org/anthology/C12-3022.pdf) is good for
searching trees (a research that came out of Melbourne).

**Getting the leaves in the tags**

ACE has a ‘--rep’ (later realised that it was ‘--E’ instead) command
that does the tokenisation right. Under the export script there was
something like “lexical” where you didn’t do the parsing

Berthold: “is there a way to explode the types then? It’s clearly in the
feature structure but that’s not what we’re outputting” Bec: “we had the
lexical type and then the inflectional rules. It was the string of rules
up to the lexical type. There was this idea of being able to pull out
just that bit before you got to the rules”

Berthold: “if you want a lexical tag, you would set up a new labels
file?”

Francis (on the Uber tagging page): code for training things is in the
Delphin SVN. Leafextract.cpp?

Bec: extracted the MRS stuff. We had a 2012? Paper at iwpt Japan on
segmentation, tagging and tokenization that may have some of this. There
was a link on the paper. You definitely should be able to get
“input..tagger”. If I did it, Woodley would have picked it up and done
it again and should have that. The code to do this with an Uber tagger
exists within ACE and the difficulty is getting access to it.
PyDelphin is the way to do this.

**Parsing and generation and getting the lowest level processing**

Jan: In particular, lemmatization and multi-word expressions. Something
that gets me the lemmas, whether the word is in the ERG and if there is
a normalized form whether as a named-entity or …

Some of the multiword expressions are not constructed until the grammar
has gone further up. Many things are not really done through
deterministic mapping eg. reduplication in Indonesian and punctuation in
the ERG are done through chart mapping.

Bec: All these things (deterministic mapping and getting a normalized
form) should be available in the lexical level. It is worth raising with
Woodley. It really is print-out before you do unification. There are two
separate stages in parsing

Francis: I think if you do “-vvv” in ACE, you get this information.

Berthold: Ace and PET should have these two stages because they have
chart mapping. You could have lexical rules apply with phrases.

Bec: chart mapping is after the lexical rules and after filtering

Francis: if you don’t call the lexical, you don’t know the base form and
cannot do the filtering. Ace –rep just gets you the tokenized. Bec: and
then chart mapping comes after that.

Bec: you used to be able to call rep and a tagger together. But now you
cannot turn off the guesser

Francis: but you can hide the English POS tagger. Process chart
dependency before chart filtering is also possible. Run “-E” in the ACE
options page.

Luis: the pre-processor does not include chart mapping yet. With
Mandarin, we get exactly what we put in.

David: (On using INDRA and PyDElphin for pos tagging) Used universal POS
tags and did it through changing
[labels.tdl](https://github.com/davidmoeljadi/INDRA/blob/master/labels.tdl?raw=true).
For an ambiguous sentence, we could get more than one set of pos tags.
If INDRA cannot parse the sentence, we cannot get the pos tags at all.

Berthold: a trivial file that has a right bridging rule(?). That can
read everything.

Francis @Alex. Are there times when you only use the subparts?

Alex: to use part of it eg. find out what exactly is wrong (mutual
discretion). It’s not easy to understand what you can expect. For sure
you know if you’re processing domain-specific text, you have to extend
the grammar but it’s not easy to do that. Curious about why this is the
case. is it a bug because of the history of the grammar or a fact that
is like that because of how HPSG words? Idea: organising lexical texts
so it is easier to locate things.

Francis: I look up 2 or 3 words that I know are control verbs and then
look at the set that they take. Control verbs are verbs that take a
verb… but Dan may have different types of control verbs. Finding the
supertype of everything you consider a control verb is non-trivial,
especially if you don’t understand the grammar very well. I think that’s
an unsolvable problem, but can we try to do something where we have a
repository of snippets of what people have done. So that the next time
someone wants to do it, they can take reference (also if they want to
try it in another grammar, they can apply the same method).

Luis: PyDelphin can do that. You can ask for the parent or
children of any type. Main problem: there is a chronic lack of
documentation. Ned’s PhD work did a lot of this work by classifying a
lot of types of rule types etc. for better organisation. The naming
conventions are difficult. Putting in the work to try to understand it
is very difficult. For Zhong, I have reordered and renamed the types in
a way that makes sense for me. (eg. putting in on the transitive verbs
together). The documentation of the ERG makes it difficult for other
people to work on it.

Alex: I was trying to understand if that is a natural way that the
grammar is built.

Francis: it could be a bug. eg. *kono*, *sono*, vs *dono* because the
hierarchy was not built right when *dono* was added by another person at
the same time.

Alex: we have the same problem (with the universal dependencies
project). People have different names and different definitions for the
same construction. When we do it on data (like corpus) there is the
motivation to get a single documentation. Eg. recently we have
discussing nom identifiers and appositions. Looks like we have the same
confusion at the grammar level.

Francis: universal dependency tries to find labels that can be used
across languages, but we avoid that problem but sacrifice on not knowing
whether they mean the same thing or not.

Berthold: Might we want to look at what the Search Results
[ParGram](/ParGram) people have done. Their feature data is the output.
We look at what kind of features are allowed; we have all types floating
around. It could be useful to standardise (eg. LOC vs LOCAL, lots of
unnecessary stuff).

Luis: Short names can become indecipherable

Francis: it has been solved through the linguistic-type database

Luis: Delphin’s way of addressing the problem is something that people
just have to put in the time to learn how to use it. But the large
overhead of trying to understand what things mean is a handicap.

Berthold: the shortening to 4 letters was cos of the move from LKB to
the LUI type database

Francis: we’re all agreed that more documentation is better? How do we
encourage that?

Alex: even the lexical type database has space for improvement. Maybe
more links and improvements in the interface are helpful.

Francis: I think Chikara Hashimoto’s vision for the ltdb was more like a
wiki. But now the documentation is in the grammar itself. And most
grammarians like to control what goes in. But it would be good to get
more information in which helps when students ask questions. After the
2020 release, we would able to commit these things directly.

Luis: (On software authorship) Your comments would have to please the
person who is writing the grammar.

Alex: there is also an issue of how the work is done in the community in
general. Github is getting more and more open. People are following the
changes, things are more discoverable. Suggestion: eg. if there is a
rule that I do not understand, being able to point to the line in the
code and make a comment, would be much better.

The semantics of smaller chunks are perhaps less obvious or useful.
Could you think of something small where you want the semantics? Eg.
paraphrasing (done for noun-phrases) “machine translation” to
“translation by machine,… “ useful for bilingual language acquisition.

Bec: I guess the other one is looking up frames for these types of
argument structure.

Berthold: we have chart dependencies that can be used for particles eg.
“look up”. It is present in the German grammar.

Bec: I don’t think it was used specifically to grab the multi-words, but
more for efficiency

Berthold: it is a pair of features where one lexical item has to license
feature. You look whether one has the value that unifies with it… it’s
“chart-dependencies” in “general” PET-general.set and in ace/config.tdl.
That was one thing, why we needed the two-stage thing. If you have a
COMPKEY, you must have something that has “-min”. In the German grammar,
it is specially used for separable verbs. These particle verbs were
always costly. They come in two variants: uni-directional and the other
one where both depend on each other. Kaufman(?) wrote a java parser for
HPSG that is very powerful.

Luis: we were trying to replicate this in ZHONG

Francis: it is beautifully documented in ACE: chart-dependencies in
ace/config.tdl ”a (flat) list of pairs of quoted paths used for removing
unwanted lexemes from the chart before parsing. a lexeme with a
non-\*top\* value for the first path in a pair will only survive if
there is another lexeme with a compatible value at the second path in
the pair.” This is a mechanism that says: when you have put all your
lexical items in the chart, before parsing starts, look for the lex that
can be found in COMPKEY, eg. look has “up” in COMPKEY, the grammar looks
for “up” and if it is not there, the grammar takes “look up” out and
taking that possibility out at the start, reduces the ambiguity.

**Note:**

COMPKEY = complement key

OCOMPKEY = oblique complement key (used for the second complement if you
need two complements)

Luis: are these fully defined in the ERG? In some things, the values
were not defined by the supertype eg. some things had COMPKEYS but they
were not defined somewhere higher.

Berthold: it is a - - (or “minus minus”) feature, a hacking feature.
It’s probably in a reasonable place but these features are never a thing
of beauty. Francis: it is a hack for efficiency.

**Summary by Francis:**

We wanted to find out what people are doing,

- component stuff is done with ACE
- reminded about type diff
- gives us some of the machinery to look at the curated list of words
- robustness issues (raising an ugly head). We may need a shallow POS
tagger.
- ACE offers PCFG (Probabilistic Context-Free Grammar) option though
you may have to train a treebank (ask Woodley how big it has to
be?). it could give better parses than the ERG.
- ACE loaded on top of ERG gives you ERG treebanks alone

**Other useful links:**

- <http://svn.delph-in.net/ut/trunk/>
- Ontology on modelling HPSG:
<https://www.aclweb.org/anthology/P07-2043.pdf>.

Last update: 2020-07-14 by ChowSiewYeng [[edit](https://github.com/delph-in/docs/wiki/VirtualComponents/_edit)]{% endraw %}