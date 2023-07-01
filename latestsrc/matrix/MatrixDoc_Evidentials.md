{% raw %}# Documentation for the Grammar Matrix Customization Evidentials Library

# Introduction

This document explains how to fill out the
[Evidentials](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=evidentials)
page of the Grammar Matrix Customization questionnaire. General
instructions on using the questionnaire can be found
[here](/MatrixDocTop#General_instructions_on_how_to_use_the_questionnaire).

# Citing the Evidentials Library

The standard reference for the Evidentials Library and its
implementations is Haeger 2017. The full reference and .bib entry can be
found [here](/MatrixDoc/Evidentials#References).

# General

Evidentiality refers to the grammatical expression of information
source. This may appear in a number of forms, such as in verbal
inflection or in verbal auxiliaries. Within a language, evidential
semantics can be organized into an inventory of terms. Examples of
cross-linguistically common terms include a reported term, indicating
that the speaker knows what s/he is saying because someone told him/her,
and a firsthand term, indicating that the speaker perceived the event
being discussed him/herself.

This version of the Grammar Matrix supports verbal inflection and
auxiliary verbs as means of expressing evidentiality.

# Options

The
[Evidentials](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=evidentials)
page allows you to define the semantic inventory of evidentials in your
language. There are two options for how to do this: Select among common
hierarchy elements and Specify your own hierarchy.

If you choose to select from common evidential terms, you will be able
to choose among firsthand, non-firsthand, visual, non-visual sensory,
inferential, reported, quotative, and "everything else". Note that the
reported term is often called hearsay as well.

If you need terms not included in the pre-provided list, you need to
specify your whole evidential inventory manually. You can specify any
number of evidential terms by clicking the Add an evidential term button
and entering the name of the term in the textbox that appears.

# Interaction with other pages

When an evidential inventory is defined on the
[Evidentials](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=evidentials)
page, it allows a pseudo-feature to be specified on lexical rule types
on the
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
page or on auxiliary verbs on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page. This is called a pseudo-feature because, while it is specified as
a feature in the questionnaire, in the grammar produced by the Grammar
Matrix evidential semantics are represented by elementary predications,
not features on events.

In order to specify a verbal affix that expresses evidentiality, add a
lexical rule type to a position class on the
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
page. In the **Features** section, click the **Add a feature** button.
Select evidential in the **Name** field and select the evidential term
name in the **Value** field, and make sure the feature is specified on
the verb.

In order to specify a verbal auxiliary that introduces evidential
semantics, go to the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page and click the **Add an Auxiliary Type** button. Select the **No
predicate** option under **This auxiliary type contributes**. Click the
**Add an auxiliary feature** button and, as with verbal inflection,
choose evidential and the name of the term in the **Name** and **Value**
fields, respectively, and make sure the feature is specified on **The
auxiliary**.

# Analyses

When a lexical rule type or auxiliary verb specifies a value for the
evidential feature, rather than adding a feature to events, as is done
with tense, aspect, and mood, an independent elementary predication is
introduced. The PRED value of this predication is of the form
ev\_&lt;evidential-name&gt;\_rel. The EP for the main event being
communicated is linked to the ARG1 of the evidential predicaiton. As an
example, below is a snippet of the code of a grammar that expresses a
firsthand evidential term by verbal inflection, found in
your\_language.tdl:

    evidential-lex-rule := cont-change-only-lex-rule & same-spr-lex-rule & same-spec-lex-rule &
      [ C-CONT [ RELS <! event-relation &
                         [ LBL #ltop,
                           ARG0 event,
                           ARG1 #harg ] !>,
                 HCONS <! qeq &
                          [ HARG #harg,
                            LARG #larg ] !>,
                 HOOK [ LTOP #ltop,
                        INDEX #mainev,
                        XARG #mainagent ] ],
        DTR.SYNSEM.LOCAL.CONT.HOOK [ LTOP #larg,
                                     XARG #mainagent,
                                     INDEX #mainev ] ].
    
    firsthand-evidential-lex-rule := evidential-lex-rule &
      [ C-CONT.RELS <! [ PRED "ev_firsthand_rel" ] !> ].

Auxiliary verbs expressing evidentiality leverage the same tdl as
auxiliaries expressing other elementary predications. Below is a snippet
from the your\_language.tdl file of a grammar with a directive
evidential auxiliary verb:

    arg-comp-aux-with-pred := arg-comp-aux & hcons-lex-item &
      [ SYNSEM [ LOCAL.CONT.HCONS <! qeq &
                                     [ HARG #harg,
                                       LARG #larg ] !>,
                 LKEYS.KEYREL event-relation &
                              [ ARG1 #harg ] ],
        ARG-ST < [ ],
                 [ LOCAL.CONT.HOOK.LTOP #larg ] > ].
    
    dir-aux-lex := arg-comp-aux-with-pred &
      [ SYNSEM.LOCAL.CAT.VAL.COMPS.FIRST.LOCAL.CAT.HEAD.FORM finite ].

And below is the lexical entry for that auxiliary in lexicon.tdl:

    dir := dir-aux-lex &
      [ STEM < "dir" >,
        SYNSEM.LKEYS.KEYREL.PRED "ev_directive_rel" ].

# Upcoming Work

One current limit on the evidentials library is related to limits on
word order in the auxiliary system. Currently, only one word order for
auxiliaries and their complements is allowed per language. However, some
languages, such as Basque, have different word orders for their
evidential and tense/aspect auxiliaries; thus, as of this writing, only
one of the two auxiliary systems can be produced by the Grammar Matrix
in a single grammar.

# References

Aikhenvald, A. (2006). Evidentiality. Oxford linguistics. Oxford
University Press.

- bibtex:
  
  @book{Aikhenvald:06,\
title={Evidentiality},\
author={Aikhenvald, A.Y.},\
series={Oxford linguistics},\
year={2006},\
publisher={Oxford University Press}\
}

Haeger, Michael. (2017). An Evidentiality Library for the LinGO Grammar
Matrix.

- bibtex:
  
  @mastersthesis{Haeger:17,\
author = {Michael Haeger},\
year = {2017},\
title = {An Evidentiality Library for the LinGO Grammar Matrix},\
school = {University of Washington}\
}

Murray, S. E. (2017). The Semantics of Evidentials. Oxford University
Press.

- bibtex:
  
  @book{Murray:17,\
title={The Semantics of Evidentials},\
author={Sarah E. Murray},\
year={2017},\
publisher={Oxford University Press}\
}

Last update: 2018-01-11 by MichaelHaeger [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_Evidentials/_edit)]{% endraw %}