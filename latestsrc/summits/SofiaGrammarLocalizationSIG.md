{% raw %}In attendance: Petya, Kiril, Antske, Rui, Ned, Iliana, Angelina (Who am
I missing?). Scribing: Ned

## Introduction from Petya

(Slides to come)

We would like test sets that we can compare the handling of phenomena
across grammars.

Question: should we start grammars at more of a surface level? Bulgarian
is richer in morpho-syntantic phenomena. This is quicker that focusing
on deeper semantic phenomena. Bulgarian is also a highly grammaticalised
language. So makes more sense to focus on morphosyntax.

Issue of assumptions that the Matrix has made; how close to stick to
these?

How much information should be encoded inside the grammar and how much
externally?

Matrix provides nice means to differentiate and connect morphosyntax and
deep semantic phenomena. Question: Whether to start from the beginning
with this deep divide, or start shallower with the morphosyntax, where
progress can be made more rapidly?

## Discussion

Kiril: When making decisions about choices in the Matrix, are there ways
to automate suggestions?

Antske: It would be great to offer more guidance as there are meany
features of the matrix that are hard to discover. We need better
documentation, including feedback and step-by-step examples on what you
can do.

Petya: Once you have a grammar, can you go back to the customisation
system?

Antske: Yes. Re-upload choices file, make your changes, generate new
grammar and then merge with the old one. So some work involved, but it
can be done.

Antske: It would be good to get more traffic on the Matrix mailing list.
It would also be good to have more resources such as treebanks. Or a
database of implemented analyses of phenomena across different
languages.

Antske: We want a place where we can document/store phenomena and their
relevant references in such a way that developers don't have to worry
about maintenance.

Kiril: The documentation is what is important.

Antske: And importantly it needs to be centralised. We need a document
that explains how to navigate the grammars by phenomena.

Rui: Can specific components of the grammar (eg tense and aspect) be
exported for to be used as reference?

Antske: Yes, using the customisation system means that it's easier to
extract certain specific components of the (resultant) grammars. This of
course is harder once the grammar has been extended, but still usually
possible. Depends on how the grammar has been developed.

Ned: Is it possible to examine the libraries directly for this sort of
thing.

Antske: It depends on the phenomenon. Not really for tense and aspect.

Rui: Phenomena ontology: at the moment not really feasible. Just a list
of phenomena the grammar writers know to be implemented and found in
theor gramamrs. (IE the phenomena catalogue, which we have begun)

Antske: The MRS test suite is a good place to start this sort of thing
too.

Krili: What happens when sometime has passed and analyses need
reclassifying, this sort of resource will be quite helpful.

Antske: In [ParGam](/ParGam), there is the project of taking a fable or
short story, with parallel translations then all grammars parse this and
the results documented and compared. We could do something like this.

There are different layers of contribution/sharing. Eg linguists with no
training in HPSG, HPSG grammar engineers and then also the maintainers
of the matrix.

Idea of using the grammar compression algorithm to try to pull out
components of existing grammars and use this to start organising them
according to phenomena.

Kiril: What about phenomena that are not implemented yet? Important to
at least bear these in mind.

Antske: We should start discussing these issues on the grammar matrix
mailing list, since it's not really getting much traffic these days
anyway.

Petya: Are there ways we can use the spring cleaning technique for
localisation?

Antske: On detecting linguistic function: To begin with we could do
things like checking for certain interesting features that flag certain
types of analysis/phenomena eg: CCONT. Or even just detecting patterns
in the way certain features tend to be used with certain types. Not so
much detecting phenomena, but at least correlations and patters, which
would be an interesting start.

Also interesting to explore combining spring cleaning, gDelta, and
customisation system together.

Petya: Asides from phenomena, is there anything else we could focus on
when constructing test suites?

Antske: \*Any\* kind of test data is useful really.

Petya: Possibly information stucture.

Antske: Emily would be good to ask about this, with her ODIN project.

Petya: What online grammar engineering courses are there?

Antske: Emily's course. Ling 567: Knowledge Engineering for NLP.

Petya: Will the CLIMB grammars be released any time soon?

Antske: The Germanic one needs some work, but will happen. The Slavic
one should be able to be released nowish, but could also do with some
cleaning up.

Rui: One thing to bear in mind with phenomena corpora is that it's hard
to get the coverage high. So it could be worth including natural text in
these test suites.

Ned: Would be good to have a Phenomena Catalogue page on the wiki to
start collecting different catalogues and encourage others to follow
suite.

Antske: It would be a good exercise for grammar engineering students to
start writing glosses for phenomena catalogues.

Ned: Would be good to consolodate all the different phenomena (or
similar) test suites and resource on the wiki, so we know what's out
there.

Last update: 2012-09-23 by AntskeFokkens [[edit](https://github.com/delph-in/docs/wiki/SofiaGrammarLocalizationSIG/_edit)]{% endraw %}