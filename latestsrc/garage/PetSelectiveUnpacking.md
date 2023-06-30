{% raw %}# Overview

The ambiguity packing mechanism has been proved to be crucial for better
efficiency in constraint-based parsing. In the PET system,
bi-directional subsumption-based ambiguity packing (\[Oepen & Carroll,
2000\]) is implemented. With this packing mechanism, parsing is divided
into two separate phases: the parse forest creation phase, and the
unpacking phase. This first phase creates the packed representation of
the parse forest, while the later phase recreates the parsing results
from the packed representation. With ambiguity packing, the cost (time
and space) of creating the parse forest is largely reduced.
Unfortunately, the task of extracting the parsing results from the
packed forest is non-trivial when subsumption-based packing is used. In
the earlier implementation of PET, the exhaustive unpacking is used,
which can easily ran out of edge limit for highly ambiguous sentences.

In \[Carroll & Oepen, 2005\], a selective unpacking algorithm was
proposed which, in combination with the parse selection model, can
efficiently extract a specific number of (best) readings from the packed
parse forest. The key idea is that the most expensive unification
operations are postponed as much as possible and only performed on the
best hypotheses. The initial algorithm has been implemented for LKB, and
now is also available for PET (still in SVN as of 2006-10-20) with some
extensions.

# How to use it?

As of 2006-10-20, you will need the latest SVN version of the PET for
selective unpacking.

You will also need a parse selection model (a \`.mem' file). PET now
supports two different \`.mem' file formats. Both should work with the
selective unpacking. But you will need the new format for
grand-parenting features.

Here is a sample session, where only the best 10 analyses are unpacked.

    [yzhang@takeshi erg.sep-06]$ cheap -packing=15 -nsolutions=10 english.grm
    reading `pet/english.set'... including `pet/common.set'... `pet/global.set'...
    loading `english.grm' (LinGO (27-Sept-06)) reading ME model `jhpstg.mem'... [115045 features]
    68443 types in 17 s
    kim saw a mouse in the hotel
    (1) `kim saw a mouse in the hotel' [0] --- 3 (0.22|0.25s) <30:236> (1339.0K) [0.2s]
    kim saw a mouse in the hotel in the hotel in the hotel
    (2) `kim saw a mouse in the hotel in the hotel in the hotel' [0] --- 10 (0.68|0.77s) <48:487> (3094.2K) [1.0s]

Note that -nsolutions must be set to be &gt;0. Otherwise exhaustive
unpacking will be used.

# References

- \[Oepen & Carroll, 2000\]. Ambiguity packing in constraint-based
parsing --- practical results. In Proceedings of the 1st Conference
of the North American Chapter of the ACL, 162--169. Seattle, WA.
- \[Carroll & Oepen, 2005\]. High efficiency realization for a
wide-coverage unification grammar. Proceedings of the Second
International Joint Conference on Natural Language Processing
(IJCNLP05), 165--176. Jeju Island, Korea.

Last update: 2007-01-26 by YiZhang [[edit](https://github.com/delph-in/docs/wiki/PetSelectiveUnpacking/_edit)]{% endraw %}