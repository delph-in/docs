{% raw %}This page preserves some of the earlier overviews of DELPH-IN work, to
provide additional context for current collaboration.

# 2011

The most serious shortcoming of today's language technology is the lack
of methods that get at the real contents of text and speech, systems
that come close to language understanding. Therefore the central and
most ambitious problem in computational linguistics has always been the
realization of ‘deep’ linguistic processing involving an accurate
mapping between written and spoken utterances on the one side and useful
semantic representations on the other.

Modern linguistics has been able to provide theories and formalisms for
the specification of grammars that express this mapping in a declarative
and transparent way. Computational linguistics has contributed elaborate
platforms and tools for grammar development. A few large-scale grammars
have been designed that exhibit sufficient accuracy and coverage for
real application tasks. However, these encouraging developments were
seriously hampered by a lack of methods for language analysis that
fulfill the minimal requirements in efficiency, robustness, and
specificity. This simply means that all systems working with these
grammars have been too slow and too brittle for real applications.
Furthermore, they have not been able to manage the vast ambiguity in
natural language, i.e. they could not select among large numbers of
linguistically correct analyses.

Yet the most serious problem has been time and space efficiency. If an
NLP system cannot process everyday sentences in a reasonable amount of
time on everyday hardware, it is not suited for most applications.
Moreover, there was no chance to improve coverage and solve the issues
of robustness and specificity if researchers had to wait for hours for a
sentence to process. The efficiency problem was so bad that many
promising lines of research such as the large-scale grammar development
in a large EU-funded international project and many other academic and
industrial projects ended without leaving any applicable results. The
situation seemed hopeless since all laboriously achieved gains in
efficiency were almost immediately offset by efficiency losses due to
increases in coverage or sophistication of the grammars.

When Verbmobil, the largest project ever in speech and language
technology, adopted deep linguistic processing on the basis of HPSG as
one of the central methods for speech analysis in real time translation
of spoken face-to-face dialogues, this decision faced considerable
criticism from both inside and outside the consortium. Why should the
slowest and most complex processing method be employed in a system that
strives for real-time processing? The decision could only be maintained
because in the hybrid Verbmobil architecture, deep processing was just
one of several processing methods and could therefore always be
preempted by an analysis from a faster processing module.

Interestingly, it was the immense pressure for efficiency in this speech
application that caused two members of the consortium, the LT Lab at
DFKI and CSLI at Stanford University, to join forces in developing
completely new strategies for performance research in deep linguistic
processing. The methodological basis of the effort was the systematic,
sophisticated and very detailed measurement of all relevant performance
data for each version of a parser. For each parser and each parsed
sentence a database record was created that contained all data on
numbers and sizes of successful and unsuccessful, complete and partial
results, and on overall time and space consumption. Preconditions for
comparable results were the use of the same grammars and the same test
corpora. The test corpora had to be annotated by the correct results and
linked to previous performance data. The novel engineering platform
produced detailed diagnostic reports and complex multidimensional
comparisons between alternative systems.

At this time the Stanford HPSG group had already independently initiated
a collaboration among several North American research groups, focusing
on the joint production of a wide-coverage generic resource grammar of
English. The resulting grammar was called LinGO English Resource Grammar
(ERG), and the name LinGO Laboratory has since been adapted to refer to
the project group at Stanford and its affiliate partners in joint
projects.

Later the Natural Language Processing Lab at Tokyo University joined the
collaboration. A number of new methods were developed by the three sites
and tested in many combinations. In the end, it was a synthesis of
methods reached by a true scientific and technological
cross-fertilization process that brought about the breakthrough in the
fight for efficiency. The overall run-time efficiency gain accomplished
was a factor of around 2000. Space consumption could be reduced by
several orders of magnitude. These gains were complemented by
developments in computer hardware. Sentences can now be analysed in
fractions of the time needed for real-time speech applications. Larger
texts can be analyzed in a few seconds. Thus HPSG parsing now meets the
speed and working memory requirements for a wide range of applications.

This breakthrough led to increased interest in HPSG processing in
several areas of research and in industry. More theoreticians and
practitioners of grammar have shown an interest in using the software
for grammar development. The first industrial applications are being
developed. However, the efficiency problem has not been the only
obstacle for the wide applicability of deep linguistic processing. The
notorious lack of robustness of deep processing has not yet been
overcome, nor has the specificity problem found a satisfactory solution.

The main partners of the successful cooperation decided to enter into a
new phase of collaboration. Stanford, Saarbrücken and Tokyo have
remained core partners of the collaboration. However, for this phase the
partnership has been broadened by additional groups or centers that have
joined the collaboration: Cambridge University, the University of
Sussex, and the University of Trondheim.

The current research takes place in three areas

- Area One: Robustness, Disambiguation and Specificity of HPSG
Processing
- Area Two: An application of HPSG Processing to Information
Extraction
- Area Three: Multilingual Grammar Engineering

DELPH-IN partners very actively pursue these areas in an ensemble of
funded projects and many other forms of exchange and collaboration.

Last update: 2020-08-30 by DanFlickinger [[edit](https://github.com/delph-in/docs/wiki/OldOverviews/_edit)]{% endraw %}