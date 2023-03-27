{% raw %}# Synopsis

Chart Mapping is a mechanism for the non-monotonic, rule-based
manipulation of chart items that are described by feature structures.
There are currently two chart mapping phases during parsing:

1. Token Mapping, where input items as delivered by external
preprocessors are adapted to the expectations of the grammar. This
requires that input items are described by feature structures ‒ the
token feature structures.
2. Lexical Filtering, where lexical items can be filtered by hard
constraints after lexical parsing has finished.

Token mapping necessitates that tokens are described by feature
structures. Token feature structures can be arbitrarily complex. This
allows users to pass information of various preprocessing modules into
the parser. To this end, a new format ‒ the XML-based FSC input format
([PetInputFsc](https://delph-in.github.io/docs/garage/PetInputFsc)) ‒ was created. However, there is also a
compatibility layer for the old input formats in PET, which
transparently converts the token information available in these formats
(form, optionally stem, characterization information and pos tags) into
token feature structures. Please see the [PetInput](https://delph-in.github.io/docs/garage/PetInput) page for
more information.

Another related issue is a new way of generic lexical instantiation
which has been introduced with token feature structures and chart
mapping. In this new setup, the parser tries to instantiate all generic
lexical entries for each word. Upon lexical instantiation, the token
feature is unified into a designated path of the lexical entry. Only if
this unification succeeds, the lexical item is instantiated. In order to
control the instantiation of generic lexical entries, the token feature
structures are appropriatly constrained in the generic lexical entry,
for instance by requiring that a generic verbal entry is only applicable
for token feature structures where the highest ranked part-of-speech tag
is a verb.

# Implementation status

- Chart mapping is part of the PET main branch since August 2010.
- Chart mapping is supported in [LKB-FOS](https://delph-in.github.io/docs/tools/LkbFos), but is not implemented in the earlier [LOGON](https://delph-in.github.io/docs/tools/LogonTop) distribution of the LKB.
- Chart mapping is supported by ACE.
- Chart mapping is supported in *agree*.

# Documentation

- Tutorial slides: <http://www.delph-in.net/2009/cm.pdf>
- [Practical notes](https://delph-in.github.io/docs/garage/ChartMappingSetup)

# Publications

Adolphs, Peter; Oepen, Stephan; Callmeier, Ulrich; Crysmann, Berthold;
Flickinger, Dan & Kiefer, Bernd. 2008. [Some Fine Points of Hybrid
Natural Language
Parsing](http://www.lrec-conf.org/proceedings/lrec2008/pdf/349_paper.pdf).
In: Proceedings of the Sixth International Language Resources and
Evaluation (LREC-2008). Marrakech, Morocco. ﻿

    ﻿@inproceedings{adolphs_fine_2008,
      address = {Marrakech, Morocco},
      title = {Some Fine Points of Hybrid Natural Language Parsing},
      url = {http://www.lrec-conf.org/proceedings/lrec2008/pdf/349_paper.pdf},
      booktitle = {Proceedings of the Sixth International Language Resources and Evaluation {(LREC-2008)}},
      author = {Adolphs, Peter and Oepen, Stephan and Callmeier, Ulrich and Crysmann, Berthold and Flickinger, Dan and Kiefer, Bernd},
      year = {2008},
      keywords = {chart mapping, hpsg, preprocessing}
    }

Last update: 2023-03-26 by John Carroll [[edit](https://github.com/delph-in/docs/wiki/ChartMapping/_edit)]{% endraw %}