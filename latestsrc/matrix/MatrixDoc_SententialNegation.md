{% raw %}# Documentation for the Grammar Matrix Customization Sentential Negation Library

# Introduction

This document explains how to fill out the [Sentential
Negation](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=sentential-negation)
page of the Grammar Matrix Customization questionnaire and presents
background information on the sentential negation library of the Grammar
Matrix Customization System (Bender et al., 2002; Bender and Flickinger,
2005; Bender et al., 2010). General instructions on using the
questionnaire can be found
[here](/MatrixDocTop#General_instructions_on_how_to_use_the_questionnaire).

# Citing the Sentential Negation Library

The standard reference for the Sentential Negation Library and its
implementations is Crowgey 2012. The full reference and .bib entry can
be found [here](/MatrixDoc/SententialNegation#References).

# Options

The [Sentential
Negation](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=sentential-negation)
page allows you to specify a range of values for the negation strategies
that your language employs by choosing from pre-defined options provided
to you on the page. Please note that the work on the [Sentential
Negation](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=sentential-negation)
page in Matrix Customization questionnaire is still in progress. For
example, some menu options under bipartite negation are only present as
previews of future implementations and as of now provide no
functionality. For more information about bipartite and other negation
strategies under development please refer to the [Upcoming
Work](/MatrixDoc/SententialNegation#Upcoming_Work) section.

Please note that this part of the questionnaire is for describing
**sentential negation**, and not **constituent negation**. Examples of
these two different types of negation, referring to which part of the
sentence is being negated, i.e. the entire sentence in **sentential
negation** or only a constituent in **constituent negation** are
below:  

- Sentential negation: *John did not read the book*.  
- Constituent negation: *John asked Mary not to enter the house*.  

The [Sentential
Negation](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=sentential-negation)
page in Matrix Customization questionnaire is divided into three
sections, allowing you to specify the **number of morphemes** required
for sentential negation in your language in the first section, describe
the negation morphemes in more detail, and model **asymmetric negation**
if applicable to your language. Please note that the section describing
negation morphemes in detail is defined by the negation strategy you
selected in the first section and appears only after you made that
selection.

**Number of morphemes**

The coverage of sentential negation in Grammar Matrix is based on the
assumption that the sentential negation usually requires presence of
overt negation morphemes. The pre-defined options describing the number
of overt morphemes required for sentential negation that Grammar Matrix
customization system provides to you are:  

- zero
- simple
- bipartite
- tripartite
- more?!  

These five negation strategies are described in more detail below:

**Negation without an overt marker** ("zero" negation)  

- If you are modeling a language that does not use an overt marker for
negation, e.g. Dravidian language Historical Kannada, which marks
sentential negation by absence of a tense marker (otherwise present
in the affirmative constructions), please select the first option
"**zero**".

**Simple negation**  

- If you are modeling a language that uses a single overt marker for
negation, please select the second option "**simple**." If you
select this option, you will be provided with the menu allowing you
to describe this negation morpheme in more detail. You will be
presented with four options indicating the grammatical means through
which it can be expressed:  
  
  - Inflection  
  - Negative auxiliary verb  
  - Independent adverb  
  - Selected adverb  
  
  The pre-defined options above allow to model the single negation
marker in your language through **inflection** of the verb
(auxiliary, main, or finite verb), a separate **negative auxiliary
verb**, or an **adverb** (independent adverb or selected adverb). An
**independent adverb** is an adverb that modifies a V, a VP, or S.
If you choose this option, you can also select the part of the
sentence, to which the adverb attaches, as well as on which side of
this word/phrase it attaches. A **selected adverb** is an adverb
that is a complement selected by a verb (auxiliary, main, or finite
verb).

**Bipartite negation**  

- If you are modeling a language that uses two overt markers for
negation, please select the second option "**bipartite**." As
mentioned earlier, the bipartite negation option is still being
actively developed, so it is possible that you will encounter some
difficulties in this section. If you select **bipartite** negation,
you will be provided with several options on how to model sentential
negation using two overt markers in your language, particularly the
morphosyntax of these morphemes and their interactions. NEG1 is for
the morpheme that is the main contributor of negation semantics to
the sentence, while the NEG2 is for the second morpheme that works
as a resumptive or specifying marker. Next, you can specify for each
of these morphemes, NEG1 and NEG2, whether they are bound, or they
are free and are the syntactic head, or they are free and are the
syntactic complement, or, finally, they are free and are the
syntactic modifier. Depending on the selections you make in this
section, different options will appear and you will be instructed
how to proceed in each case.

**Tripartite negation**  

- If you are modeling a language that uses three overt markers for
negation, please select the third option "**tripartite**." An
example of such language is a Lewo language of Vanuatu. This section
is also under construction. For more information please refer to the
[Upcoming Work](/MatrixDoc/SententialNegation#Upcoming_Work)
section.

**Negation with more than 3 overt markers**  

- Finally, if you encounter a language that uses more than three overt
markers for negation, please let us know by e-mailing to matrix-dev
mailing list (**matrix-dev** -at- uw.edu). Grammar Matrix
Customization system currently does not provide coverage for the
languages that use three overt negation markers, but we would be
interested to know if such languages exist.

**Asymmetric Negation**

If there are certain conditions under which negation is
allowed/disallowed in your language, you can model it in the
**Asymmetric Negation** section on the [Sentential
Negation](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=sentential-negation)
questionnaire page. You will need to click on the arrow in the option
provided to you by Matrix Customization system questionnaire:

- ► asymmetric\_negation\_options  

There are two ways that you can model asymmetric negation in your
language:

- 1). Enable a \[NEGATED luk\] feature on syntactic HEAD. You will
need to specify its value as \[NEGATED +\] on the verbs that allow
negation and \[NEGATED -\] on the verbs or constructions that
disallow negation. This option is provided to you on the bottom of
the **Asymmetric Negation** section on the [Sentential
Negation](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=sentential-negation)
questionnaire page:  
  
  - Enable a HEAD feature (\[NEGATED luk\]) which is appropriate for
heads of type verb.  
  
  2). You can also model negation through agreement. For more
information and examples on modeling asymmetric negation through
agreement, please click on asymetric\_negation\_help arrow provided
to you on the [Sentential
Negation](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=sentential-negation)
page of the Grammar Matrix Customization questionnaire:  
  
  - ► asymmetric\_negation\_help  

After you select a negation strategy as applicable to your language on
the [Sentential
Negation](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=sentential-negation)
page, you will be able to specify values for negation (plus or minus)
and what part of speech it is specified on in the verb types and
auxiliary verb types on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page and in the lexical rule types on
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
page. Please refer to the
[Analyses](/MatrixDoc/SententialNegation#Analyses) section below for
more information about choices you make on the [Sentential
Negation](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=sentential-negation)
page and how they affect the semantics of lexical items.

# Motivation

Sentential negation is a complicated phenomenon in terms of the variety
of negation strategies employed by world languages. The number of
negation markers, their positions within the sentence, their
morphosyntactic roles vary tremendously from language to language. The
Negation library of the Grammar Matrix Customization system was
developed and continues to be extended to provide a broader coverage of
negation across various languages.

# Analyses

To cover various negation strategies employed by languages, eight
lexical rules were implemented in Grammar Matrix: **basic-infl-neg**,
**val-and-cont-change-infl-neg-rule**, **form-change-neg-rule**,
**comps-change-neg-rule**, **neg-sat-trigger-rule**,
**val-change-neg-rule-1**, **val-change-neg-lex-rule-2**,
**val-change-neg-sat-trigger-rule**. Additionally, two auxiliaries for
constructions **head-comp-neg** and **head-mod-neg** were added to the
auxiliaries already existing in Grammar Matrix, as well as several free
lexical items to implement complements and modifiers. You can find a
detailed description of each rule and lexical items created to support
negation in Grammar Matrix in the section 5.2.1 in Crowgey 2012.

The negation strategies you choose on the [Sentential
Negation](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=sentential-negation)
page are stored in the choices file. Below is a snippet of code related
to Negation from choices file for a language that uses one overt
morpheme for negation, which is expressed through inflection and with a
HEAD feature \[NEGATED luk\] enabled in the Asymmetric Negation section:

    section=sentential-negation
    neg-exp=1
    neg-head-feature=on
    infl-neg=on
    adv-neg=on
    neg-mod=vp
    neg-order=before
    neg-adv-orth=adverb_modifier

When you define negation values on the [Sentential
Negation](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=sentential-negation)
customization page, your starter grammar unlocks the features \[negation
plus\] and \[negation minus\] available for your use on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
and on the
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
pages.

Feature \[negation plus\] allows you to add negative semantics to the
lexical rule types as applicable to your language. Feature \[negation
minus\] allows you to specify lexical items that are incompatible with
negation, i.e. disallow negation. For example, if you choose a 'simple',
'negation by inflection' strategy on the [Sentential
Negation](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=sentential-negation)
page, specifying \[negation plus\] on bound inflection on the
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
page adds negative semantics to that lexical rule type.

Please refer to Chapter 4 in Crowgey 2012 for more information on
Analyses.

# Upcoming Work

Although the Sentential Negation library already covers various negation
strategies, it could be extended further in order to provide a more
throughout coverage of negation across languages.

For example, in addition to the extension of the bipartite negation
coverage that is still under development, providing support for
languages that use zero or three overt negation markers would be one of
the possible improvements to the negation section in Grammar Matrix
Customization system. Although these languages are quite rare compared
to the languages with one or two overt negation markers, implementing
zero and tripartite negation strategies would signify a more complete
coverage of negation.

Other improvements to the currently existing negation section include
providing support for multiple negation constructions and EDGE
inflection, i.e. inflection that occurs at the edge of the phrase, which
are not yet covered by Matrix Customization system.

For more information about future work on negation section of the
Grammar Matrix Customization system please refer to Chapter 7 in Crowgey
2012.

# References

Crowgey, Joshua. 2012. The Syntactic Exponence of Sentential Negation: a
model for the LinGO Grammar Matrix. Masters thesis, University of
Washington.

- bibtex:
  
  @mastersthesis{Crowgey:12,\
author = {Joshua Crowgey},\
year = {2012},\
title = {The Syntactic Exponence of Sentential Negation: a model for
the LinGO Grammar Matrix},\
school = {University of Washington}\
}

Givón, Talmy. 1984. Syntax: a typological-functional introduction \[vol.
III\]. John Benjamins. Amsterdam, Philidelphia.

- bibtex:
  
  @book{Givón:1984,\
author = {Talmy Givón},\
year = {1984},\
volume = {III},\
title = {Syntax: a typological-functional introduction},\
publisher = {John Benjamins. Amsterdam, Philidelphia}\
}

Last update: 2013-02-27 by AntskeFokkens [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_SententialNegation/_edit)]{% endraw %}