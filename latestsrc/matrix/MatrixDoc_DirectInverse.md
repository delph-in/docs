{% raw %}# Documentation for the Grammar Matrix Customization Direct-Inverse Library

# Introduction

This document explains how to fill out the
[Direct-inverse](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=direct-inverse)
page of the Grammar Matrix Customization questionnaire and presents
background information on the direct-inverse library of the Grammar
Matrix Customization System (Bender et al., 2002; Bender and Flickinger,
2005; Bender et al., 2010). General instructions on using the
questionnaire can be found
[here](/MatrixDocTop#General_instructions_on_how_to_use_the_questionnaire).

# Citing the Direct-inverse Library

The standard reference for the Direct-inverse Library and its
implementations is [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf).
The full reference and .bib entry can be found
[here](/MatrixDoc/DirectInverse#References).

# Options

The direct-inverse library allows users to define the scale used to
determine direct-inverse marking (if applicable). Please note that this
page is optional. Leaving it blank will result in a grammar without
direct-inverse marking.

In some languages, referred to as **direct-inverse** languages, marking
of verbal arguments depends on *grammatical scale* (sometimes also
referred to as *hierarchy*) that ranks agent and patient in terms of how
natural they are in the role of agent. If in a sentence the agent ranks
higher than the patient, the clause is considered to be **direct**. And,
vice versa, if the patient ranks higher than the agent, the clause is
considered to be **inverse**. Depending on the ranking, appropriate
direct-inverse marking occurs through different verb forms, different
cases on argument NPs, or both. The scales (hierarchies) vary for
different languages, as well as does the corresponding marking.

The Grammar Matrix Customization system covers only one type of
inverses, i.e. **pronominal** or **morphological** inverses. The other
type of inverses, i.e. **word order** inverses, is not yet covered by
the Grammar Matrix customization system (for more information please
refer to the [Upcoming Work](/MatrixDoc/DirectInverse#Upcoming_Work)
section.

If your language is **not** a direct-inverse language, please skip this
section entirely and move on to the next page [Tense, Aspect, and
Mood](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=tense-aspect-mood).

If your language is a direct-inverse language, you can add the features
that define the direct-inverse scale on the
[Direct-inverse](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=direct-inverse)
page of the Grammar Matrix Customization questionnaire. **NOTE**: Even
if your language is not described as a direct-inverse language, but also
uses a grammatical scale to determine marking on other parts of speech,
such as NPs, you can still benefit from modeling it as a direct-inverse
language (please see [Motivation](/MatrixDoc/DirectInverse#Motivation)
section below for an example of such language, Fore).

An example of a direct-inverse language is Cree (Algonquian language of
North America), in which the direct-inverse scale is sensitive to
person, with the following ranking of person:

- **2nd** &gt; **1st** &gt; **3rd proximate** &gt; **3rd obviative**,

As shown above (and described in greater detail in [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Chapter 4), in Cree 2nd person ranks higher in terms of fulfilling the
agent role than the 1st person, which in its turn ranks higher than the
3rd proximate person, and so on.

As instructed in the questionnaire, please make scale entries in order
from the highest to the lowest ranking. Once the scale is defined, it
will be available for use on the
[Morphology](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=morphology)
page to create the appropriate lexical rules. To model the
direct-inverse pattern in Cree shown above you would add 4 scale
entries, starting from the highest ranked value (2nd person) and
finishing with the lowest ranked value (3rd person obviative).

Next you will need to define the behavior of the verb when patient and
agent have equal rankings on the grammatical scale, i.e. whether the
verb takes direct form or some other form, e.g. reflexive. For Cree, for
instance, a user would indicate that the main verb takes *some other
form* when agent and patient have equal ranking:  

- |                    |                  |
|--------------------|------------------|
| **Scale entry 1**  |                  |
| **Features**       |                  |
| **Name**: *person* | **Value**: *2nd* |
  
  |                    |                  |
|--------------------|------------------|
| **Scale entry 2**  |                  |
| **Features**       |                  |
| **Name**: *person* | **Value**: *1st* |
  
  |                       |                        |
|-----------------------|------------------------|
| **Scale entry 3**     |                        |
| **Features**          |                        |
| **Name**: *person*    | **Value**: *3rd*       |
| **Name**: *proximity* | **Value**: *proximate* |
  
  |                       |                        |
|-----------------------|------------------------|
| **Scale entry 4**     |                        |
| **Features**          |                        |
| **Name**: *person*    | **Value**: *3rd*       |
| **Name**: *proximity* | **Value**: *obviative* |
  
  **When the agent and patient have the same value, the main verb
is:** *some other form*  

For more information on the implementation of direct-inverse pattern in
Cree please refer to **Test Cases** in [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 4.4.

# Motivation

The Direct-inverse library was added to provide support marking on verbs
and verbal arguments that is sensitive to a grammatical scale present in
direct-inverse languages.

Additionally, the Direct-inverse library can be used for languages that
are usually not analyzed as direct-inverse, but have similar
characteristics and can therefore be modeled using direct-inverse
analysis of the Grammar Matrix Customization system. For example, in the
Fore language of Papua Guinea, the ranking of agent and patient
determines the presence/absence of marker not on verbs, but on agent
NPs. This marker, i.e. an extra suffix -*wama* appears on the agent when
it has a lower ranking than the patient. Although Fore is not analyzed
in standard literature as a direct-inverse language (Scott 1978,
Drellishak 2009), it can nevertheless benefit from a direct-inverse
analysis, with appropriate modifications to which parts of speech are
marked based on the status of the clause (direct vs. inverse). For more
information on modeling Fore using direct-inverse analysis please refer
to [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Sections 4.2.3 and 4.4.2.

# Analyses

Defining a grammatical scale on the
[Direct-inverse](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=direct-inverse)
page of the Grammar Matrix Customization questionnaire will result in
the creation of appropriate lexical rules for transitive verbs.
Additionally, more values will be available on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page for your use, i.e. user can choose whether transitive verbs follow
the direct-inverse pattern or not. The user will also be able to specify
whether the verb features on the
[Lexicon](http://www.delph-in.net/matrix/customize/matrix.cgi?subpage=lexicon)
page correspond to higher- or lower-ranked arguments.

Below is the snippet of code from direct-inverse section in the choices
file for Cree language:

    section=direct-inverse
    scale1_feat1_name=person
    scale1_feat1_value=2nd
    scale2_feat1_name=person
    scale2_feat1_value=1st
    scale3_feat1_name=person
    scale3_feat1_value=3rd
    scale3_feat2_name=proximity
    scale3_feat2_value=proximate
    scale4_feat1_name=person
    scale4_feat1_value=3rd
    scale4_feat2_name=proximity
    scale4_feat2_value=obviative
    scale-equal=other

For the analysis of direct-inverse languages, a direct-inverse scale was
modeled using a type hierarchy and arranged into a right-branching tree.
This scale and its constraints preventing spurious parses are described
in greater detail in [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 4.2.

Additionally, a list feature \[SC-ARGS\] was introduced to support some
direct-inverse languages, in which instead of agreement between the verb
and subject or object, agreement is described as agreement between the
verb and the higher- or lower-ranked argument. This feature contains the
list of arguments of the verb in order from highest-ranked to
lowest-ranked. This means that if the verb is direct, the subject will
occupy the first position and the object will occupy the second position
on the list. And, vice versa, for an inverse verb, the object will
occupy the first position and the subject will occupy the second
position on the list.

The analyses implemented in the direct-inverse library are described in
greater detail in [Drellishak
2009](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf),
Section 4.2.

# Upcoming Work

One of the current limitations of Grammar Matrix Customization system is
lack of support of word order inverses. Adding support for this
grammatical phenomenon, involving interaction of inverses with word
order, would be one of the possible directions of broadening Grammar
Matrix coverage of direct-inverse languages.

# References

Drellishak, S. (2009). [Widespread but Not Universal: Improving the
Typological Coverage of the Grammar
Matrix](http://depts.washington.edu/uwcl/matrix/sfd/Drellishak%20-%20Widespread%20but%20Not%20Universal.pdf).
PhD thesis, University of Washington.

- bibtex:
  
  @phdthesis{Drellishak:09,\
author = {Scott Drellishak},\
year = {2009},\
title = {Widespread but Not Universal: Improving the Typological
Coverage of the {G}rammar {M}atrix},\
school = {University of Washington}\
}

Givón, T. 1994. The Pragmatics of De-transitive Voice: Functional and
Typological Aspects of Inversion. In T. Givón (ed.), Voice and
Inversion, pages 3–44, Amsterdam: Benjamins.

- bibtex:
  
  @chapter{Givón:1994,\
author = {Talmy Givón},\
year = {1994},\
book = {Voice and Inversion},\
editor = {Talmy Givón},\
title = {The Pragmatics of De-transitive Voice: Functional and
Typological Aspects of Inversion},\
publisher = {Amsterdam: Benjamins},\
pages = {3-44}\
}

Scott, G. (1978). The Fore Language of Papua New Guinea. Canberra,
Australia: Paciﬁc Linguistics.

- bibtex:
  
  @book{Scott:1978,\
author = {Graham Scott},\
year = {1978},\
title = {The Fore Language of Papua New Guinea},\
publisher = {Canberra, Australia: Paciﬁc Linguistics}\
}

Last update: 2013-03-01 by AntskeFokkens [[edit](https://github.com/delph-in/docs/wiki/MatrixDoc_DirectInverse/_edit)]{% endraw %}