{% raw %}# Documentation for the Grammar Matrix Customization Information Structure Library

# Introduction

This document explains how to fill out the Information Structure page of
the Grammar Matrix Customization questionnaire and presents background
information on the information structure library of the Grammar Matrix
Customization System (Bender et al., 2002; Bender and Flickinger, 2005;
Bender et al., 2010). General instructions on using the questionnaire
can be found here.

# Citing the Information Structure Library

The standard reference for the Information Structure Library and its
implementations is Song 2014 (A Grammar Library for Information
Structure). The full reference and .bib entry can be found
[here](/MatrixDoc/InformationStructure#References).

<span class="comment" style="display:none">[Song and Bender
2012](http://cslipublications.stanford.edu/HPSG/2012/song-bender.pdf)</span>

# Options

The
[InformationStructure](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=info-str)
page consists of four parts.

First, in \[Focus\], a user can specify the canonical position of focus
in the user's language. A cross-linguistic survey reports that there are
four positions for expressing focus; clause-initial, clause-final,
preverbal, and postverbal. What is to be noted is that a sentence in the
basic word order does not have any specific information structrual
values. A sentence in basic word order is a default form in the
language, which can be interpreted as conveying a variey of information
structures. For example, if a language basically employs the SVO order,
and the canonical position of focus is postverbal, \[O\] in SVO is not
specified as \[focus\], though it occurs postverbally. A user also can
add a focus marker, which include an affix, an adposition, and a
modifier (e.g. clitics). An affix and an adpoistion are not specified in
the Information Structure page, which should be created in the
Morphology page and the Lexcion page respectively. If a user checks out
an affix or an adposition of expressing focus in Information Structure,
but an affix or an adposition that involve focus or super/sub-types of
focus as a value of \[information-strucural meaning\] in Morphology or
Lexcion, there comes a validation error. A modifier can be directly
created on the Information Structure page. It can occur before and/or
after nouns and/or verbs.

Second, \[Topic\] has two types of options. As for the constraint on
position, topic always occupies the sentence-initial position (i.e.
topic-first) in some languages. If a user's language has such a
constraint, the checkbox should be marked. After that, a topic marker
can be added, which operates in the same way as \[Add a Focus Marker\]
above.

Third, in some languages, contrastive focus can be differently marked
from non-contrastive focus. The checkbox under \[Contrastive Focus\] is
not selected, there can exist two types of foci; one is semantic-focus
for non-contrastive focus, and the other is contrast-focus for
contrastive focus. In that case, a user can choose a specific position
for contrastive focus. Likewise, a user can add a contrastive focus
marker in the same manner.

Finally, there is an option for \[Contrastive Topic\], which can barely
have a constraint on positioning across languages. So, there is no
checkbox for the positioning constraint. Instead, it is reported that
some languages (e.g. Vietnamese) employ a contrastive topic marker,
which can be specified using the button \[Add a Contrastive Topic
Marker\].

For more information on the implementation of information structure in
Grammar Matrix please refer to the section
[Analyses](/MatrixDoc/InformationStructure#Analyses).

# Motivation

There are several motivations in the Information Structure Library.

First, just as other linguistic phenomena, there can some mismatches
between form and meaning. That means information structural markings are
not necessarily compatible with information structural meanings. For
example, the topic marker wa in Japanese, as the name itself implies, is
a merely marker. The topic marker can be used to express aboutness
topic, contrastive topic, or sometimes contrastive FOCUS. In the
library, information structural markings are specified as mkg under CAT,
while information structural meanings are specified in ICONS (Individual
CONstraintS) under CONT (i.e. mrs).

Second, just as there are semantically empty lexical items, there are
also some informatively empty lexical items. In principle, semantically
empty items, devoid of predicate (i.e. RELS &lt;! !&gt;), are also
informatively empty (i.e. ICONS &lt;! !&gt;). The items include
expletives (there, it), case-marking adpoistions (ga, wa in Japanese),
by in passive constructions, relative pronouns, etc.

Third, information structural values of a constituent would be less
specified or preferentially underspecified. For example, 'The book, Kim
reads.' can be interpreted as either 'It is the book that Kim reads.' or
'As for the book, Kim reads it.' In the former, 'the book' conveys a
focus meaning, while in the latter it conveys a topic meaning. The MRS
representation for the sentence should be able to capture the ambiguity
that 'The book' shows. Hence, 'The book' in the sentence is specified as
containing focus-or-topic.

Finally, unless there is a linguistic clue to identify the information
structural meaning, the value of information structure remains
underspecified.

# Analyses

There are three type hierarchies for information structure.

First, mkg shows information structural [MarKinGs](/MarKinGs). Note that
mkg is a morphosyntactic feature under CAT, which can be different from
values of info-str.

    mkg := avm &
      [ FC luk,
            TP luk ].
    fc := mkg & [ FC + ].
    non-tp := mkg & [ TP - ].
    tp := mkg & [ TP + ].
    non-fc := mkg & [ FC - ].
    fc-only := fc & non-tp.
    fc-+-tp := tp & fc.
    unmkg := non-tp & non-fc.
    tp-only := tp & non-fc.

Second, sform shows the Sentential FORMs, which inherits from
binary-headed-phrase. This hierarchy constrain combining two phrases
with mkg values. For example, topic-comment requires \[MKG tp\] of
non-head-daughter, which prevent focus-marked constituents from being
used as the non-head-daughter of topic-comment constructions.

    sform := basic-binary-headed-phrase.
    focality := sform &
      [ SYNSEM.LOCAL.CAT.MKG fc-only,
            NON-HEAD-DTR.SYNSEM.LOCAL.CAT.MKG fc ].
    topicality := sform.
    narrow-focus := focality &
      [ HEAD-DTR.SYNSEM.LOCAL.CAT.MKG non-fc ].
    wide-focus := focality.
    topicless := topicality &
      [ NON-HEAD-DTR.SYNSEM.LOCAL.CAT.MKG non-tp ].
    topic-comment := topicality &
      [ SYNSEM.LOCAL.CAT.MKG tp,
        NON-HEAD-DTR.SYNSEM.LOCAL.CAT.MKG tp ].
    focus-bg := narrow-focus & topicless &
      [ HEAD-DTR.SYNSEM.LOCAL.CAT.MKG unmkg ].
    all-focus := wide-focus & topicless &
      [ HEAD-DTR.SYNSEM.LOCAL.CAT.MKG fc ].
    frame-setting := topic-comment.
    non-frame-setting := topic-comment &
      [ HEAD-DTR.SYNSEM.LOCAL.CAT.MKG non-tp ].

Finally, information structural meanings, such as focus, topic,
contrast, background, etc., are subtypes of info-str. The info-str
hierarchy is designed in a flexible way. What is of importance is how
much specified the information structural meaning of a constituent is.

    icons := avm.
    
    info-str := icons &
      [ CLAUSE individual,
        TARGET individual ].
    
    ; constraints on information structure
    non-topic := info-str.
    contrast-or-focus := info-str.
    focus-or-topic := info-str.
    contrast-or-topic := info-str.
    non-focus := info-str.
    
    focus := non-topic & contrast-or-focus & focus-or-topic.
    contrast := focus-or-topic & contrast-or-focus & contrast-or-topic.
    topic := non-focus & focus-or-topic & contrast-or-topic.
    
    bg := non-topic & non-focus.
    
    semantic-focus := focus.
    contrast-focus := contrast & focus.
    contrast-topic := contrast & topic.
    aboutness-topic := topic.

# NOTE

The information structure values are represented in ICONS. Currently,
ACE([AceTop](https://delph-in.github.io/docs/tools/AceTop)) and AGREE([AgreeTop](https://delph-in.github.io/docs/garage/AgreeTop)) fully process
ICONS. So MRSes coming from LKB/PET do not have ICONS.

In some languages, both focus and topic can occur in the clause-initial
position. In that case, topic always precedes focus, and a
counterexample to this has not yet been reported across languages. The
current version of Information Structure library does not place an
ordering constraint on such a co-occurrence of focus and topic.

Modules for constraining positions of information structural components
in FREE word order languages are currently under development. All types
of word order is potentially used in a free word order language, and the
Word Order page in customization system specifies "free" as
"pragmatically determined word order". We assume that "pragmatically
determined" means "information structurally conditioned". Thus,
variations in word order of such a language need to be deeply
investigated one by one. The current version does not place such an
elaborated constraint on word order variations in the languages. If word
order is checked as "free" in Word Order, and multiple positions are
checked, the grammar may not work properly in terms of information
structure. For example, a position for focus is specified but it is not
clause-initial, and the checkbox for the topic-first constraint is
checked at the same time, information structure values might be
entangled.

Modifiers of expressing information structure in the current system are
semantically empty, which means they require trigger rules in
trigger.mtr. Unfortunately, there is no way to constrain them in
transfer. Tentatively, they are just filtered out in transfer.

# References

Song, Sanghoun. 2017. [Modeling information structure in a
cross-linguistic
perspective](http://langsci-press.org/catalog/book/111). Language
Science Press.

Song, Sanghoun. 2014. A Grammar Library for Information Structure.
Doctoral Dissertation, University of Washington.

Song, Sanghoun and Bender, Emily M. 2012. [Individual Constraints for
Information
Structure](http://cslipublications.stanford.edu/HPSG/2012/song-bender.pdf).
In Stefan Müller (ed.), Proceedings of the 19th International Conference
on Head-Driven Phrase Structure Grammar, pages 329-347, Stanford, CA:
CSLI Publications.

bibtex:

@book{song:17,\
author = {Song, Sanghoun},\
title = {Modeling information structure in a cross-linguistic
perspective},\
series = {Topics at the Grammar-Discourse Interface},\
year = {2017},\
publisher = {Language Science Press}\
}

@phdthesis{song:14,\
author = {Song, Sanghoun},\
title = {A Grammar Library for Information Structure},\
school = {University of Washington},\
year = {2014}\
}

@inproceedings{song:bender:12,\
title = {Individual Constraints for Information Structure},\
author = {Song, Sanghoun and Bender, Emily M.},\
pages = {329--347},\
editor = {Stefan M{\\"u}ller},\
booktitle = {Proceedings of the 19th International Conference on
Head-Driven Phrase Structure Grammar},\
address = {Stanford, CA},\
publisher = {CSLI Publications},\
year = {2012}\
}

Last update: 2018-05-07 by GuyEmerson [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_InformationStructure/_edit)]{% endraw %}