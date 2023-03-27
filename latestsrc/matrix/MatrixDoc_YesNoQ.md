{% raw %}# Documentation for the Grammar Matrix Customization Yes/No Questions Library

# Introduction

This document explains how to fill out the [Matrix Yes/No
Questions](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=matrix-yes-no)
page of the Grammar Matrix Customization questionnaire and presents
background information on the Matrix Yes/No Questions library of the
Grammar Matrix Customization System (Bender et al., 2002; Bender and
Flickinger, 2005; Bender et al., 2010). General instructions on using
the questionnaire can be found
[here](/MatrixDocTop#General_instructions_on_how_to_use_the_questionnaire).

# Citing the Matrix Yes/No Questions Library

The standard reference for the Matrix Yes/No Questions Library and its
implementations is [Bender & Flickinger,
2005](http://faculty.washington.edu/ebender/papers/modules05.pdf). The
full reference and .bib entry can be found
[here](https://github.com/delph-in/docs/wiki/MatrixDoc_YesNoQ#references).

# Options

The [Matrix Yes/No
Questions](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=matrix-yes-no)
page allows you to specify strategy/strategies that your language uses
to form matrix (i.e. not embedded) yes-no questions. You can either
choose from three pre-defined options below or skip this section
entirely, in which case your grammar will not include a question-forming
strategy.

Grammar Matrix customization system offers three options for strategies
employed to form matrix yes/no questions, described in more detail
below. You can select any number of these options.

**Intonation**

Forming matrix yes/no questions strategy using intonation is not a
separate option because intonation is not typically represented in the
orthography (and we do not having a library for punctuation yet). So
intonation questions are “modeled” in the sense that in fact anything
not marked specifically as a question is \[ SF prop-or-ques \], i.e.
underspecified.

**A separate question particle**

First strategy employed by languages to form matrix yes/no questions
described on the [Matrix Yes/No
Questions](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=matrix-yes-no)
page is the use of a separate question particle. Question particles can
occupy different positions in the sentence. Grammar Matrix currently
offers two pre-defined options for question particle position in the
sentence:

- sentence initial  
- sentence final  

If a question particle in your language occupies a position other than
sentence initial or sentence final, you can still choose one of the
pre-defined options above and later manually modify your\_language.tdl
file.

If you indicate that your language uses a separate question particle to
form questions, you will also need to add the spelling of the question
particle as requested on the [Matrix Yes/No
Questions](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=matrix-yes-no)
page.

An example of a language that uses a question particle to form matrix
yes/no questions is Russian. Russian question particle *li* (sometimes
also referred to as "clitic") is placed after the first phonological
word in the matrix yes/no questions (King 1995), so it usually occupies
second or third position in the sentence. Since the Grammar Matrix
customization system does not currently cover question particles that
are neither sentence initial, nor sentence final, the best solution for
a question formation strategy for a language like Russian is to choose
one of the options above (sentence initial or sentence final). Below is
a snippet of code from choices file related to question formation in a
language like Russian, with the sentence final position option chosen
for the question particle, as reflected in the third line:
**q-part-order=after**):

    section=matrix-yes-no
    q-part=on
    q-part-order=after
    q-part-orth=li
    q-inv-verb=main

As noted above, choosing sentence final position for the question
particle will require a later modification of your\_language.tdl file to
reflect the actual position of this particle in the sentence.  

**Verbal inflection**

Verbal inflection is another strategy used by languages to form matrix
yes/no questions. Please note that if you select the verbal inflection
option, your starter grammar will include a feature \[QUESTION\], which
will appear when you fill out the **Verb Types** section later on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page. For each verb that you define on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page you will be able to define the feature QUESTION and its value as
"plus", as well as indicate that it is specified on the verb.  

**Subject-verb inversion**

Some languages use subject-verb inversion to form matrix yes/no
questions. If your language employs the subject-verb inversion strategy,
please select which verbs (main, auxiliary, or all verbs) are inverted
from options provided below:

- main verbs only  
- auxiliaries only  
- any verb  

The choices you make on the [Matrix Yes/No
Questions](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=matrix-yes-no)
customization page will also affect the lexical types
(your\_language\_name.tdl file) and possibly inflectional rules
(irules.tdl file).

As mentioned in the questionnaire, if your language uses verbal
inflection for yes/no matrix question forming and you choose a
corresponding option on the [Matrix Yes/No
Questions](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=matrix-yes-no)
page, your grammar will include feature \[QUESTION\] with possibly a
value \[PLUS\] to be used in defining morphemes on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page. If/when you define a morpheme with value \[QUESTION plus\], this
will create lexical rules adding question semantics to your grammar.

For more information on analyses and implementations of the matrix
yes/no question forming strategies described above please refer to
[Analyses](/MatrixDoc/YesNoQ#Analyses) section below.

# Analyses

The grammar Matrix customization system provides support for questions
formed by intonation, which implies associating the same string with
either proposition or question semantics (specified as \[prop-or-ques\]
in your grammar).

If your language uses inversion of the subject and the main verb for
yes/no question forming, this strategy is implemented through a lexical
rule that (1). relocates the subject (SUBJ) to the first position in the
COMPS list, and (2). assigns a positive value to inverted feature INV on
verbs.

If your language uses inversion of the subject and the auxiliary verb
for yes/no question forming, this strategy is implemented through
constraining the basic inversion lexical rule (for inversion of the
subject and the main verb, as described above) to apply only to
auxiliary verbs.

If you have selected any of the yes/no question marking strategies
above, your grammar will assign \[ques\] value to SF in semantic INDEX
for questions because of this constraint in matrix.tdl:

    interrogative-clause := basic-non-rel-clause & 
      [ SYNSEM.LOCAL.CONT.HOOK.INDEX.SF ques ].

Please refer to [Bender and Flickinger
2005](http://faculty.washington.edu/ebender/papers/modules05.pdf) for
additional information on the matrix yes/no questions and other
libraries in Grammar Matrix Customization system.

# Upcoming Work

This library is one of the original ones from [Bender and Flickinger
2005](http://faculty.washington.edu/ebender/papers/modules05.pdf) and
has yet to be reworked and put on a firm typological foundation. While
there is no current plans to do so, this would make a good MA/MS-sized
thesis topic.

One of the possible improvements to **Matrix Yes/No Questions** library
by Grammar Matrix customization system would be added support for
declarative/interrogative punctuation contrasts.

# References

King, T. H. (1995). Configuring Topic and Focus in Russian.
Dissertation.

- bibtex:
  
  @phdthesis{King:1995,\
author = {T. H. King},\
year = {1995},\
title = {Configuring Topic and Focus in Russian}\
}

Bender, E., & Flickinger, D. 2005. [Rapid prototyping of scalable
grammars: Towards modularity in extensions to a language-independent
core](http://faculty.washington.edu/ebender/papers/modules05.pdf). In
Proceedings of the 2nd International Joint Conference on Natural
Language Processing IJCNLP-05 (Posters/Demos), Jeju Island, Korea.

- bibtex:
  
  @article{Bender & Flickinger:05,\
author = {Bender, E., & Flickinger, D.},\
year = {2005},\
title = {Rapid prototyping of scalable grammars: Towards modularity
in extensions to a language-independent core},\
conference = {In Proceedings of the 2nd International Joint
Conference on Natural Language Processing IJCNLP-05
(Posters/Demos)},\
location = {Jeju Island, Korea}\
}

Last update: 2021-11-16 by Olga Zamaraeva [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_YesNoQ/_edit)]{% endraw %}