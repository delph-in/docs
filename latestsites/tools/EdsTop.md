{% raw %}# Background

This page provides some semi-formal and semi-technical background on
what are called *Elementary Dependency Structures* (EDS, or at times
also EDs), a reduction of full MRS (underspecified) logical forms to a
variable-free form, i.e. a semantic dependency graph (or ‘semantic
network’ or ‘conceptual graph’). The original motivation for this
representation was ease of downstream processing, for information
extraction applications, say.

EDS since its 2002 inception ([Oepen, et al.,
2002)](http://bultreebank.org/proceedings/paper10.pdf) has found a
broader range of DELPH-IN-internal applications, typically where it is
desirable to ‘break down’ a full meaning representation into relevant,
variable-free component pieces: designing so-called discriminants for
semantics-based treebanking ([Oepen & Lønning,
2006](http://www.lrec-conf.org/proceedings/lrec2006/pdf/364_pdf.pdf);
[Branco, et al.,
2010](http://www.lrec-conf.org/proceedings/lrec2010/pdf/154_Paper.pdf)),
for example; features encoding co-occurence of semantic predicates in
parse disambiguation ([Toutanova, et al.,
2002](http://bultreebank.org/proceedings/paper17.pdf); [Fujita, et al.,
2007](http://aclweb.org/anthology-new/W/W07/W07-1204.pdf); inter alios);
generative probability models for semantic transfer ([Oepen, et al.,
2007](http://www.velldal.net/erik/pubs/OepVelLon07.pdf)); granular
semantic parser evaluation ([Dridan,
2009](http://www.dridan.com/research/papers/dridan-phdthesis.pdf);
[Dridan & Oepen,
2011](http://aclweb.org/anthology-new/W/W11/W11-2927.pdf); [MacKinlay,
et al., 2011](http://www.dridan.com/research/papers/rolc-xd.pdf);
[MacKinlay, et al., 2012](http://www.aclweb.org/anthology/S12-1031);
[Packard, 2012](http://aclweb.org/anthology/N/N12/N12-2006.pdf); inter
alios); further reduction into bi-lexical semantic dependencies
([Ivanova, et al.,
2012](http://aclweb.org/anthology/W/W12/W12-3602.pdf); [Oepen, et al.,
2016](http://www.lrec-conf.org/proceedings/lrec2016/pdf/887_Paper.pdf));
efficient search in Wikipedia-scale semantic networks ([Kouylekov &
Oepen, 2014](http://www.aclweb.org/anthology/C14-2020)); estimating
inter-annotator agreement ([Bender, et al.,
2015](http://www.aclweb.org/anthology/W15-0128)); or inference-based
textual entailment ([Lien & Kouylekov,
2015](http://www.aclweb.org/anthology/W15-2205)).

Outside of DELPH-IN, applications of EDS or its reduction into
bi-lexical dependencies show growing community interest in parsing into
graph-shaped target representations—for example in the experiments of
[Jones, et al. (2013)](http://aclweb.org/anthology/W/W13/W13-1810.pdf),
[Agić, et al. (2015)](http://aclweb.org/anthology/W/W15/W15-0126.pdf),
[Ribeyre, et al.
(2015)](http://aclweb.org/anthology/N/N15/N15-1007.pdf), [Kuhlmann &
Jonsson (2016)](http://aclweb.org/anthology/Q/Q15/Q15-1040.pdf), [Zhang,
et al.
(2016)](http://www.mitpressjournals.org/doi/pdf/10.1162/COLI_a_00252),
[Axelsson
(2017)](http://www.diva-portal.org/smash/get/diva2:1111896/FULLTEXT01.pdf),
[Buys & Blunsom (2017)](http://aclweb.org/anthology/P/P17/P17-1112.pdf),
[Peng, et al. (2017)](http://aclweb.org/anthology/P/P17/P17-1186.pdf),
[Cao, et al. (2017a)](http://aclweb.org/anthology/P/P17/P17-1193.pdf),
[Sun, et al. (2017a)](http://aclweb.org/anthology/P/P17/P17-1077.pdf),
[Sun, et al. (2017b)](http://aclweb.org/anthology/K/K17/K17-1005.pdf),
[Cao, et al. (2017b)](http://aclweb.org/anthology/D/D17/D17-1003.pdf),
Schuster, et al. (2017), Kurtz & Kuhlmann (2017), or Gildea, et al.
(2017). From two more recent CoNLL Shared Tasks on *Cross-Framework
Meaning Representation Parsing* ([MRP 2019](http://mrp.nlpl.eu/2019) and
[MRP 2020](http://mrp.nlpl.eu)), there is a broad body of data-driven
parsing work into EDS, using both transition- or factorization-based
approaches, as well as compositional and translational architectures
(see [Oepen et al., 2019](https://www.aclweb.org/anthology/K19-2001/)
for an overview; [Oepen & Flickinger,
2019](https://www.aclweb.org/anthology/K19-2003/) provide an empirical
comparison between the top-performing data-driven parsers and parsing
with the full ERG).

This development owes in part to the inclusion of EDS-derived bi-lexical
dependencies in [Task 8](http://sdp.delph-in.net/2014/) and [Task
18](http://sdp.delph-in.net/2015/) (on *Broad-Coverage Semantic
Dependency Parsing*, or SDP) at the 2014 and 2015 SemEval Conferences,
respectively. EDS-derived bi-lexical semantic dependencies continue to
be used for data-driven semantic parsing work beyond SemEval 2015, and
the [full SDP data sets](http://sdp.delph-in.net) have been publicly
available through the Linguistic Data Consortium (LDC) since early 2016;
an [open sub-set of the
data](http://sdp.delph-in.net/index.php?page=5&language=en) is available
for direct download and comprises bi-lexical semantic dependencies (for
Czech and English) as well as EDSs and full MRSs for English. A
structural comparison of EDS to bi-lexical semantic dependencies, on the
one hand, and to Abstract Meaning Representation, on the other hand, is
provided by [Kuhlmann & Oepen
(2016)](http://www.mitpressjournals.org/doi/pdf/10.1162/COLI_a_00268).

This page was initiated and is maintained by
StephanOepen, who is also the original developer of the
EDS design and supporting Lisp code (which is part of the LKB, as well
as of the stand-alone Lisp MRS library). Additional details of the
conversion process from MRS are discussed on the
[EdsConversion](https://delph-in.github.io/docs/tools/EdsConversion) page, and experimental documentation on
using EDS as an input representation to generation with the ERG is
provided on the [EdsGeneration](https://delph-in.github.io/docs/tools/EdsGeneration) page.

# A First Example

Following is the Elementary Dependency Structure (EDS) associated with
the (preferred) ERG analysis (in the 1111 release version) for the
sentence *Abrams promised the dog to bark.*

      {e2:
       _1:proper_q<0:6>[BV x5]
       x5:named<0:6>("Abrams")[]
       e2:_promise_v_1<7:15>[ARG1 x5, ARG2 x10, ARG3 e16]
       _2:_the_q<16:19>[BV x10]
       x10:_dog_n_1<20:23>[]
       e16:_bark_v_1<27:32>[ARG1 x5]
      }

Semi-formally, the above structure is a directed graph where nodes are
labeled (among other things) with semantic predicates (e.g. proper\_q or
\_dog\_n\_1) and arcs are labeled with semantic argument roles (e.g.
ARG1, ARG2, or BV). Node labels can optionally be suffixed with
so-called *characterization* pointers, e.g. &lt;7:15&gt; on the
\_promise\_v\_1 predicate; more on these below.

For unique reference (in the textual format depicted above), each node
further has a node identifier (e.g. \_1 or x5, prefixed to node labels
and separated by a colon), which serves to depict reentrant node
occurences in argument positions, i.e. as the target of an incoming
dependency arc. While node identifiers in EDS can superficially resemble
logical variables in an underlying MRS, they formally have a very
different (non-variable) status and could be uniquely renamed without
any loss of information or generality.

Consider our example above: the fourth line renders the node identified
as e2 and labeled with the predicate \_promise\_v\_1 (at
characterization &lt;7:15&gt;). This node has three outgoing dependency
arcs, labeled ARG1, ARG2, and ARG3, pointing to nodes x5, x10, and e16,
respectively. Outgoing arcs are depicted as a comma-separated list
enclosed in a pair of square brackets following each node label; nodes
without any outgoing arcs will have an empty such list (as do for
example nodes x5 and x10).

Some predicates may be parameterized, i.e. they take one or more
constant arguments. In our running example, this is true of the named
predicate (the label of dependency node x5), which shows its parameter
enclosed in a pair of parentheses, following the predicate and
characterization (if any).

Finally, the top node of the dependency graph is identified by the node
identifier immediately following the opening curly brace (on the first
line), i.e. in our running example node e2 is the top of the graph.

# Reflections on Selected Phenomena

Note that (unlike many flavours of syntactic dependency graphs now in
common use) EDS need not be tree-shaped, i.e. dependency nodes can have
more than one incoming arc. In the above example, node x5 is an argument
of both node e2 and node e16 (as the ARG1, i.e. ‘deep subject’ in both
cases). Furthermore, some of the input tokens from the underlying
utterance may not be reflected in the semantic dependency graph. In the
above, this is true of the infinitival marker *to*, for example, which
is analyzed as semantically vacuous (i.e. not contributing any meaning
of its own).

Conversely, it is possible for multiple EDS nodes to correspond to a
single input token; this is observed in nodes \_1 and x5 in our above
example, making two statements about the interpretation of *Abrams*, of
which one is a syntactically covert quantifier (labeled proper\_q) in
the underlying MRS.

Finally, it is also possible for an EDS to contain dependency nodes that
do not directly correspond to a single input word. While this is not
true for our first example above, the phenomenon is present in the
following example, the EDS analysis of the input *Chasing the garden dog
helped.*

      {e2:
       _1:udef_q<0:22>[BV x5]
       x5:nominalization<0:22>[ARG1 e9]
       e9:_chase_v_1<0:7>[ARG2 x10]
       _2:_the_q<8:11>[BV x10]
       e17:compound<12:22>[ARG1 x10, ARG2 x16]
       _3:udef_q<12:18>[BV x16]
       x16:_garden_n_1<12:18>[]
       x10:_dog_n_1<19:22>[]
       e2:_help_v_1<23:30>[ARG1 x5]
      }

In the above, nodes x5 (the nominalization of the *chase* event) and e17
(the compounding of *garden* and *dog*) do not directly correspond to
individual words of the input, but rather are pieces of semantics that
are associated with larger phrases and the constructions used to build
them (viz. nominalization and compounding). Arguably, the same holds for
one of the nodes labeled udef\_q (to be read as definite in an
underspecified manner), i.e. node \_1, which corresponds to the covert
quantifier (in the underlying MRS) assumed to bind the nominalization.
Node \_3 in the above example (also labeled udef\_q, i.e. a
syntactically covert quantifier), on the other hand, is similar to node
\_1 (labeled proper\_q) in our initial example (i.e. corresponds to a
single input word, viz. *garden*, as indicated by its characterization);
in other words, this covert quantifier just binds the left, non-head
element of the compound.

# Further Properties of Dependency Nodes

In the MRS universe, information such as number and tense (which are in
large parts determined morphologically, in English at least) is
typically represented as so-called *variable properties*, i.e. pairs of
attributes and corresponding values associated to logical variables; in
our examples so far, we have suppressed all such information. For some
further discussion of MRS variable properties and how they relate to
features and types internal to a parsing or generation grammar, please
see the [RmrsVpm](https://delph-in.github.io/docs/tools/RmrsVpm) page.

Seeing that EDS is a variable-free representation, variable properties
need to be re-associated with dependency nodes, more specifically the
node (corresponding to the MRS elementary predication) for which the
variable served as its so-called *distinguished variable* (Oepen &
Lønning, 2006). Thus, each EDS node can be optionally annotated with a
variable type and a set of property–value pairs (enclosed in curly
braces, inbetween the node label and outgoing arcs), for example *the
dog barked.*

      {e3:
       _1:_the_q<0:3>[BV x6]
       x6:_dog_n_1<4:7>{x NUM sg, IND +}[]
       e3:_bark_v_1<8:15>{e SF prop, TENSE past}[ARG1 x6]
      }

In this serialization of node properties pertaining to the underlying
distinguished variable, the variable type (e.g. ‘x’ for instances and
‘e’ for eventualities) is optional and, when present, needs to occupy
the first position in the list (in which case there will in total be an
odd number of expressions between the pair of curly braces). Empty sets
of node properties can be omitted, as was the case in our introductory
examples above.

Serialization of node properties is enabled by the boolean configuration
option \*eds-show-properties-p\*, which until late 2015 used to default
to false; with emerging use of EDS for generation (see the
[EdsGeneration](https://delph-in.github.io/docs/tools/EdsGeneration) page for background) more recently, it
seemed convenient to toggle the default behavior, in a sense trading a
bit of compactness and readability for additional information content.

# Breaking Up Things Further: EDS Triples

      {
        proper_q<0:6> BV named<0:6>(Abrams)  
        _promise_v_1<7:15> ARG1 named<0:6>(Abrams)  
        _promise_v_1<7:15> ARG2 _dog_n_1<20:23>  
        _promise_v_1<7:15> ARG3 _bark_v_1<27:32>  
        _the_q<16:19> BV _dog_n_1<20:23>  
        _bark_v_1<27:32> ARG1 named<0:6>(Abrams)  
      }

# Alternative Serializations

EDS examples in the above are shown in what is called *native* EDS
serialization, a multi-line format, where nodes are separated by line
breaks, bracketed by opening and closing curly braces, also each on its
own line.

The EDS graphs are formally (if not necessarily linguistically) very
similar to [Abstract Meaning Representation](http://amr.isi.edu/) (AMR),
and it is straightforward to serialize the bulk of the information in an
EDS in AMR-like PenMan syntax (we are grateful to
MichaelGoodman, who inspired this serialization
option). For cross-framework interoperability, the EDS implementation in
Common Lisp supports (trivial) conversion of EDS graphs into the
tree-like format (with node re-entrancies, as needed) of AMRs, where the
top node is at the root of the tree, and inverse roles (like, for
example, ARG1-of) serve to indicate incoming edges to nodes:

      # ::id 20209013
      # ::snt A similar technique is almost impossible to apply to other crops.
      (e12 / _almost_a_1 :lnk "<23:29>"
       :ARG1 (e3 / _impossible_a_for :lnk "<30:40>"
              :ARG1 (e18 / _apply_v_to :lnk "<44:49>"
                     :ARG2 (x6 / _technique_n_1 :lnk "<10:19>"
                            :ARG1-of (e9 / _similar_a_to :lnk "<2:9>"
                                      :ARG1-of (e11 / comp :lnk "<2:9>"))
                            :BV-of (_1 / _a_q :lnk "<0:1>"))
                     :ARG3 (x19 / _crop_n_1 :lnk "<59:65>"                        
                            :ARG1-of (e24 / _other_a_1 :lnk "<53:58>")
                            :BV-of (_2 / udef_q :lnk "<53:100>")))))

Note that in AMR-like serialization the characterization pointers are
rendered as a pseudo-role :lnk, and the variable property information
(e.g. tense and number) is (currently) omitted. Furthermore, the
‘inlining’ of nodes into a tree-shaped dominance structure is similar in
nature to the test for graph connectivity discussed below; graph
fragments not reachable from the top node will not be included in
AMR-style serialization.

Finally, EDS graphs can also be serialized in JSON (to support an
emerging RESTful interface to the ERG on-line demonstrator; see the
[ErgApi](https://delph-in.github.io/docs/erg/ErgApi) page), where the top-level structure is an object (i.e.
associative array) with properties top and nodes. The set of nodes, in
turn, is encoded as an object indexed by node identifiers. Each node has
properties label, (optional) lnk, (optional carg) and edges; outgoing
edges, finally, are encoded as an object indexed by role names (i.e.
edge labels), with node identifiers as their values. Variable properties
and the variable type originally contributed by the distinguished
variable corresponding to each node are rendered as type and properties
components in the JSON serialization. For example (for the input *Abrams
snored.*):

      {"top": "e3",
       "nodes": {
         "_1": {"label": "proper_q", "lnk": "<0:6>", "edges": {"BV": "x6"}},
         "x6": {"label": "named", "lnk": "<0:6>", "carg": "Abrams", "edges": {}},
         "e3": {"label": "_snore_v_1", "lnk": "<7:14>", "edges": {"ARG1": "x6"}}​}}

# Graph Connectivity

Optionally, the EDS code can test for graph connectivity, i.e.
reachability of nodes from the top. In the default textual EDS
serialization format, graphs that contain sub-graphs (which can be
individual nodes) that are not connected to the top node will be flagged
as *fragmented*, and non-connected nodes will be indicated by an
annotation (using the ‘\|’ symbol) in the first column of each affected
line. Following is the EDS for the input *Nearly every dog barked.*
(from the MRS test suite, using the 1111 release of the ERG), for
example:

      {e2: (fragmented)
      |e4:_nearly_x_deg<0:6>[]
       _1:_every_q<7:12>[BV x7]
       x7:_dog_n_1<13:16>[]
       e2:_bark_v_1<17:24>[ARG1 x7]
      }

In this example, node e4 is not reachable from the top node e2, i.e.
there is no path through the graph leading to e4. In this case,
non-connectivity is owed to a limitation in the analysis of degree
specifiers on quantifiers in the ERG (or, arguably, in the more general
MRS framework, as a candidate analysis for this phenomenon would call
for the composition of predicates). In current ERG analyses, the degree
specifier *nearly* is only weakly integrated with the underlying MRS,
viz. by sharings its label with that of the quantifier, i.e. attaching
itself to the same scopal position as the quantifier. Seeing that labels
(and hence label equality) are an MRS-internal notion (part of the meta
language, but *not* logical variables that would have a status in any
variant of predicate calculus as the object language), it is only
natural that the ‘missing’ link between the quantifier and its degree
specifier is exposed in EDS.

To work around this frequent source of EDS fragmentation, an additional
mechanism was added to the conversion from MRSs sometime around 2012:
Optionally, so-called ‘predicate modifiers’ can be recognized (using a
combination of pattern matching on their predicate symbol and inspection
of the label and argument topology) and converted to regular predicates.
For degree modification of quantifiers, this additional step in EDS
construction will lead to parallelism with other usages of (typically
the same general range of) degree specifiers, i.e. the above example of
fragmentation (using the default settings in the 1214 release of the
ERG) will result in the fully connected graph:

      {e2:
       e4:_nearly_x_deg<0:6>[ARG1 _1]
       _1:_every_q<7:12>[BV x7]
       x7:_dog_n_1<13:16>[]
       e2:_bark_v_1<17:24>[ARG1 x7]
      }

While degree specification of quantifiers used to be a known source of
non-connectivity in ERG-derived EDSs, there is no principled or
technical reason in ERG-internal meaning composition to prevent other
instances of non-connectivity—which typically would correspond to
ill-formed MRSs. Thus, EDS connectivity is at times used as a
wellformedness test in the grammar engineering and treebanking cycle.

# Software Support in DELPH-IN Tools

The reduction of MRSs to Elementary Dependency Structures is implemented
as part of the Common Lisp MRS Library that is part of the LKB and can
be linked into PET (activated through the -mrs=eds command line option).
Please look near the top of the EDS [source
code](http://svn.emmtee.net/trunk/lingo/lkb/src/mrs/dependencies.lisp)
for available parameters. Excessive use of comments in the function
ed-select-representative() (in the same file) may also serve to clarify
the disambiguation rules that apply in case a single variable (typically
a handle) is associated with multiple elementary predications.

In the LKB, EDS views can be requested for parsing and realization
results from pop-up menues in several of the graphical viewers. Together
with other views on syntactic and semantic aspects of parsing results, a
LaTeX rendering of Elementary Dependency Structures can be obtained from
the [ERG On-line Demonstrator](http://erg.delph-in.net). However,
probably the easiest path to obtaining EDS outputs is through batch
processing in [\[incr tsdb()\]](http://www.delph-in.net/itsdb) and its
export facilities; please see the [ErgProcessing](https://delph-in.github.io/docs/erg/ErgProcessing) page
for instructions.

For access to full EDS functionality, one can invoke the MRS-to-EDS
reduction through Lisp function calls like the following:

      MRS(48): (type-of mrs)
      PSOA
      MRS(49): (with-open-file (stream "/tmp/sample.eds" :direction :output
                                :if-exists :supersede)
                 (eds-output-psoa mrs :stream stream :format :ascii))
      NIL

Other valid formats include :triples, :latex, :amr, :html, and :lui, and
various optional parameters to the function (and global variables, e.g.
\*eds-show-lnk-p\* and \*eds-show-properties-p\*) serve to customize the
output in format-specific ways.

# EDS Configuration Options

# Semantic Wellformedness Testing

# References

Last update: 2020-08-22 by StephanOepen [[edit](https://github.com/delph-in/docs/wiki/EdsTop/_edit)]{% endraw %}