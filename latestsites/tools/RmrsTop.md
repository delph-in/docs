{% raw %}# Overview

The MRS and RMRS representation languages are designed for compositional
semantics. These pages are primarily intended to cover aspects of the
implemented MRS and RMRS support in the LKB and other DELPHIN tools, as
well as the use of RMRS with shallow processors.

These pages are very much under development: additions would be welcome.

RMRS predicates are decorated with the start and end points of the input
text they correspond to ([RmrsSpan](https://delph-in.github.io/docs/tools/RmrsSpan)). This makes it easier to
link RMRS to other annotations, including RMRS from different sources.

- [Design](https://delph-in.github.io/docs/tools/RmrsDesign): Some discussion of topics related to (R)MRS.
- [RmrsPos](https://delph-in.github.io/docs/tools/RmrsPos): RMRS defines a list of coarse POS distinctions.
- [RmrsParaphrasing](https://delph-in.github.io/docs/tools/RmrsParaphrasing): A discussion of how to
paraphrase using (R)MRS.
- [RmrsModel](https://delph-in.github.io/docs/tools/RmrsModel): A discussion of the Model Theory of (R)MRS.
- [RmrsDistributional](https://delph-in.github.io/docs/tools/RmrsDistributional): A discussion of
distributional techniques.
- [SEMI-I](https://delph-in.github.io/docs/tools/RmrsSemi): The SEMantic-Interface.
- [VPM](https://delph-in.github.io/docs/tools/RmrsVpm): Variable Property Mapping (between the TFS and MRS
universes).
- [EDS](https://delph-in.github.io/docs/tools/EdsTop): Variable-Free Elementary Dependency Structures.
- [DMRS](https://delph-in.github.io/docs/tools/RmrsDmrs): Dependencies which may be interconverted with MRS.
- [Frequently Asked Questions](https://delph-in.github.io/docs/tools/RmrsFaq)
- A compilation of [discussions](https://delph-in.github.io/docs/tools/RmrsDiscussions).
- and [[SofiaMrsRfc]] [[MrsRFC]]

For computing equivalence (i.e. isomorphism) of two MRSs (note, not
accounting for RMRS), please see [MrsIsomorphism](https://delph-in.github.io/docs/tools/MrsIsomorphism).

Some introductory slides for MRS:

- Yi's grammar engineering course
[slides](http://www.coli.uni-saarland.de/~yzhang/ge-ss08/lecture-05.pdf)
- Valia and Markus's [slides](http://www.let.rug.nl/egg/mrs.pdf) from
an [ESSLLI 2004 course](http://www.let.rug.nl/egg/esslli04.php3) in
Nancy
- Kostadin Cholakov's
[slides](http://www.coli.uni-saarland.de/~kordoni/courses/ss07/mrs_presentation.pdf)

## References

- Ann Copestake, Dan Flickinger, Rob Malouf, Susanne Riehemann and
Ivan Sag, 1995. [Translation using Minimal Recursion
Semantics](http://mt-archive.info/TMI-1995-Copestake.pdf) (ACQUILEX
II WP NO. 61) In: *Proceedings of The Sixth International Conference
on Theoretical and Methodological Issues in Machine Translation
(TMI95)* Leuven, Belgium
- Ann Copestake, Dan Flickinger, Ivan Sag and Carl Pollard. [Minimal
Recursion Semantics: An
introduction](http://www.cl.cam.ac.uk/~aac10/papers/mrs.pdf)
*Journal of Research on Language and Computation*, 3(2-3), pages
281-332, 2005
- Ann Copestake. [Semantic composition with (Robust) Minimal Recursion
Semantics](http://www.aclweb.org/anthology/W/W07/W07-1210.pdf). In:
*Proceedings of the ACL-07 workshop on Deep Linguistic Processing*,
pages 73-80. Prague, 2007.
- Ann Copestake. *Robust Minimal Recursion Semantics*. [Unpublished
draft](http://www.cl.cam.ac.uk/~aac10/papers/rmrsdraft.pdf),
2004/2006.

Last update: 2021-09-02 by Alexandre Rademaker [[edit](https://github.com/delph-in/docs/wiki/RmrsTop/_edit)]{% endraw %}