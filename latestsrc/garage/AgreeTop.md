{% raw %}# agree : another grammar engineering environment

**A project to develop a system for processing DELPH-IN style TDL
grammars within the .NET and Mono managed runtime environments.**

[UW CLMS](http://www.compling.uw.edu/) thesis work of *GlennSlayden*.<br/>
&nbsp; &nbsp; M.S. and Ph.C. advisor *EmilyBender*.<br/>
&nbsp; &nbsp; Thesis reader *StephanOepen*.<br/>
&nbsp; &nbsp; *Spencer Rarrick* helped with MaxEnt parse selection, generation, and testing with [Jacy](https://delph-in.github.io/docs/grammars/JacyTop).<br/>

citation:<br>
&nbsp; &nbsp; *Slayden, Glenn. “Array TFS storage for unification grammars.” (2012).* &nbsp;[[pdf]](https://digital.lib.washington.edu/researchworks/bitstream/handle/1773/20770/Slayden_washington_0250O_10255.pdf)<br/>

*agree* is open-source software released under the MIT license. 

For SVN access and project information, please visit http://www.agree-grammar.com.

## Abstract

### A new parser and generator for the DELPH-IN joint reference formalism

The Common Language Infrastructure (CLI, ECMA-335) is a modern standard
for architecting extensible, platform-independent software. Well-known
implementations include Mono and Microsoft's .NET Framework. These
managed runtime environments enjoy the robust support of actively
developed software, and incorporate decades of research and best
practice experience in systems architecture and developer productivity.
An aim of this project is to explore the suitability of this platform
for a new suite of tools for processing DELPH-IN style TDL (Krieger and
Schäfer 1994) grammars.

Single-core performance having reached physical limits, the focus in
high-performance computing now concerns multi-core processors.
Accordingly, another goal of this project is to examine opportunities
for concurrent programming in the processing of precision analytical
grammars. This effort has led to the development of a low-lock,
concurrent parse/generate chart which exploits new deep operating system
support for scalable, fine-grained concurrency.

### TFS Representation

Informed by Pereira (1985), Wroblewski (1987), Tomabechi (1991), and
more recent work by van Lohuizen, a research goal is to investigate the
efficiency--under the intensive demands that are characteristic of
unification grammars--of [array TFS
storage](http://www.glennslayden.com/pubs/slayden-2012-array-TFS.pdf), a
representation that departs from the traditional allocation-per-node DAG
approach. This internal DAG representation may minimize garbage
collector activity in managed programming environments.

Capitalizing on the observation that, in DELPH-IN grammars, the
appropriate features for every type are invariant, this approach stores
each TFS's nodes contiguously, indexed according to a hash that
incorporates its hosting feature. Combined with careful application of
C\# value types, this approach has demonstrated excellent parsing and
generation performance in the .NET managed runtime environment.

* * *

## Project Status

The system supports both parsing and generation. It has been tested with
the [English Resource Grammar](http://www.delph-in.net/erg/) (Flickinger
2002), [Jacy](https://delph-in.github.io/docs/grammars/JacyTop) grammar of Japanese (Siegel and Bender 2002), and
other [Matrix](https://delph-in.github.io/docs/matrix/MatrixTop) grammars (Bender et al. 2002), notably a
medium-small grammar of Thai (unpublished). Exact derivations have been
validated versus PET for Redwoods (Oepen et al. 2000) corpora.

As the complexity of the *agree* tool suite has increased in support of
diverse analysis tasks, application maintainability, configuration, and
management have become key issues. In response, in 2012 the system was
rearchitected as a set of loosely-coupled functors with which the
linguist-user composes ad-hoc linguistic processing pipelines via XAML
markup. Binding together functors yields a customized, reusable
composite functor which, when applied to an input, produces a complex
and/or nested sequence of live monads (non-reusable workers). Each monad
represents a concurrent push-based processing stream implementing some
part of the fanout or fork/join signature required by the originally
composed task.

### Type System

- Robustly read, validate, and tokenize TDL grammars, providing
precise indication of syntax errors;
- Build the type system and efficiently calculate the greatest lower
bound closure;
- Internal representation of typed feature structures according to
"Array TFS Storage for Unification Grammars" (Slayden 2012)

### Unification Engine

- Low-lock concurrency at the single-unification level
- Fallback unification (Slayden 2012) which simplifies the standard
method (Tomabechi 1991, 1992) by eliminating the COMP-ARC list data
structure.

### Morpholexical Analysis

- Externally-configurable tokenization supports flexible input:
arbitrarily overlapping tokens in a single hypothesis, or distinct
input hypotheses
- Stand-off input token format with no whitespace assumptions
- Inflection at any position of multi-word lexical entries
- LKB tokenization options: RegEx lexrule, irregs.tab
- Concurrent analysis (per input token)

### DELPH-IN Compliant Preprocessing

- REPP
- Integrated HMM trigram POS tagger
- Lattice-based token mapping (Adolphs et al. 2008)
- Lattice-based lexical filtering (ibid.)
- Chart dependencies filter (Kiefer et al. 1999)

### Concurrent Parse-Generate Chart

- Lock-free coordination between active and passive edges via atomic
(interlocked) CPU instructions
- Single unified chart is shared between parser and generator,
abstracting only the difference in edge proximity condition
- Capitalizing on new OS support for lightweight tasks scheduled with
sophisticated hill-climbing, work-stealing, and load-balancing, a
new, non-blocking unification chart parser works by constructing a
graph of fully asynchronous fine-grained match/unify tasks.
- Rule pre-filter (Kiefer et al. 1999)
- Additionally, the following grammar-opt-in techniques developed in
the DELPH-IN community and elsewhere: KEY-daughter first,
Quick-check (Malouf et al. 2000), spanning-only rules, and daughter
ARGS pruning.
- Direct daughter unify with skeleton completion: parts of the rule
mother TFS which are outside of her rule daughter's coreference
extent are only built upon successful daughter unification.
- Ambiguity packing with exhaustive unpacking (Oepen and
Carroll, 2000)

### Maxent Parse Selection

- Read (e.g.) redwoods.mem model
- Score n-best derivations without unpacking
- *future work:* selective unpacking

### MRS

- In anticipation of convenient MRS re-writing and SEM-I transfer, a
rich MRS suite of interconnected C\# objects has been developed.
- This MRS suite is extracted from the higher-performance
parse/generation representation.
- DELPH-IN compliant VPM and SEM-I processing.

### Concurrent Tactical Realization (Generation)

- LE skolemization permuted across (possibly repeated) EPs in the
input MRS and/or lexical entries.
- Rule skolemization and rule avoidance by C-CONT evaluation
- MTR trigger rule regex evaluation for vacuous lexical entry
insertion
- 'gen-ignore-rules', 'duplicate-lex-ids', etc. config settings
support
- KEY-driven daughter instantiation
- Uses the same lock-free chart and concurrent agenda control as the
parser
- Derivation read-out with reverse morphology reconstitution
- index accessibility filtering (Oepen and Carroll 2005)
- Chart cells indexed (separately, for active vs. passive) by number
of EPs covered.

### Application Notes

- Centralize grammar engineering tasks in a single software
environment
- To facilitate MT engineering, the engine supports working with
multiple loaded grammars (see images below)
- Platform independent command processing enables console-based
interactive use (i.e. on Mono)
- Built-in support for the standard \[incr tsdb()\] (Oepen and
Carroll 2000) testsuite database format
- As with most CLR software, the same executable binary should run on
any combination of 32 or 64-bit Mono or .NET

### WPF Client Application

- Display and interact with feature structures in a style inspired by
LUI
- Syntax tree display
- Parse chart display
- Note: WPF support will not be available on Mono

<img src="http://www.agree-grammar.com/11-screenshots/galleria/20130514.png" title="http://www.agree-grammar.com/11-screenshots/galleria/20130514.png" class="external_image" alt="http://www.agree-grammar.com/11-screenshots/galleria/20130514.png" />
<img src="http://www.agree-grammar.com/11-screenshots/galleria/tfs-dag.png" title="http://www.agree-grammar.com/11-screenshots/galleria/tfs-dag.png" class="external_image" alt="http://www.agree-grammar.com/11-screenshots/galleria/tfs-dag.png" />


The project is also investigating novel visualization technologies for
grammar engineering and pedagogical use. Shown below is a
three-dimensional view of an authored constraint definition superimposed
over its expanded feature structure. Because the structures are aligned,
there are spaces in the definition to account for constraints supplied
by other structures. Multi-layer views can show the contributions from
each definition which make a feature structure well-formed.

The view can be manipulated on any axis to freely explore relationships
amongst the authored rules. Although the WPF environment makes such
renderings easy to implement, an ongoing challenge is to find a visual
presentation with the simplicity and elegance requisite for truly
facilitating linguistic insight.

<img src="http://www.agree-grammar.com/webshare/20111206.png" title="http://www.agree-grammar.com/webshare/20111206.png" class="external_image" alt="http://www.agree-grammar.com/webshare/20111206.png" />


## References

Adolphs, Peter; Oepen, Stephan; Callmeier, Ulrich; Crysmann, Berthold; Flickinger, Dan & Kiefer, Bernd. 2008. Some Fine Points of Hybrid Natural Language Parsing. In: Proceedings of the Sixth International Language Resources and Evaluation (LREC-2008). Marrakech, Morocco.

Emily M. Bender, Dan Flickinger, and Stephan Oepen. 2002. The grammar matrix: an open-source starter-kit for the rapid development of cross-linguistically consistent broad-coverage precision grammars. in *Proceedings of the 2002 workshop on Grammar engineering and evaluation - Volume 15 (COLING-GEE '02), Vol. 15.* Association for Computational Linguistics, Stroudsburg, PA, USA, 1-7.

Ulrich Callmeier. 2001. Efficient Parsing with Large-Scale Unification Grammars. MA Thesis, Universität des Saarlandes - Fachrichtung Informatik.

Ulrich Callmeier. 2000. PET: a platform for experimentation with efficient HPSG processing techniques. *Natural Language Engineering* 6(1): 99-107.

Dan Flickinger. 2002. On building a more efficient grammar by exploiting types. *Natural Language Engineering, 6,* pp 15-28.

Hans-Ulrich Krieger and Ulrich Schäfer. 1994. TDL: a type description language for constraint-based grammars. in Proceedings of the 15th conference on Computational linguistics - Volume 2 (COLING '94), Vol. 2. Association for Computational Linguistics, Stroudsburg, PA, USA, 893-899.

Bernd Kiefer, Hans-Ulrich Krieger, John Carroll, and Rob Malouf. 1999. A Bag of Useful Techniques for Efficient and robust Parsing. In *Proceedings of the 37th annual meeting of the Association for Computational Linguistics*. 473-480

Robert Malouf, John Carroll, and Ann Copestake. 2000. Robert Malouf, John Carroll, and Ann Copestake. 2000. Efficient feature structure operations without compilation. *Natural Language Engineering*, 1(1):1-18.

Stephan Oepen and John Carroll. 2000. Parser engineering and performance profiling. *Natural Language Engingeering 6, 1 (March 2000),* 81-97.

Stephan Oepen, Kristina Toutanova, Stuart Shieber, Christopher Manning, Dan Flickinger, and Thorsten Brants. 2002. The LinGO Redwoods Treebank: Motivation and preliminary applications. in *Proceedings of the 19th International Conference on Computational Linguistics (COLING 2002),* pages 1253–7, Taipei, Taiwan.

Fernando C. N. Pereira. 1985. A structure-sharing representation for unification-based grammar formalisms. In *Proceedings of the 23rd Annual
Meeting of the Association for Computational Linguistics*. Chicago, IL, 8-12 July 1985, pages 137-144.

Melanie Siegel and Emily M. Bender (2002): Efficient Deep Processing of Japanese. In *Proceedings of the 3rd Workshop on Asian Language Resources and International Standardization. COLING 2002 Post-Conference Workshop.* Taipei, Taiwan.

Hideto Tomabechi. 1991. Quasi-destructive graph unification. In *Proceedings of the 29th Annual Meeting of the Association for Computational Linguistics*, Berkeley, CA.

Hideto Tomabechi. 1992. Quasi-destructive graph unifications with structure-sharing. In *Proceedings of the 15th International Conference on Computational Linguistics (COLING-92)*, Nantes, France.

Hideto Tomabechi. 1995. Design of efficient unification for natural language. *Journal of Natural Language Processing*, 2(2):23-58.

Marcel P. van Lohuizen. 1999. Parallel processing of natural language parsers. In *PARCO '99*.

Marcel P. van Lohuizen. 2000. Exploiting parallelism in unification-based parsing. In *Proceedings of the Sixth International Workshop on Parsing Technologies (IWPT 2000)*, Trento, Italy.

Marcel P. van Lohuizen. 2000. Memory-efficient and Thread-safe Quasi-Destructive Graph Unification. In *Proceedings of the 38th Meeting of the Association for Computational Linguistics*, Hong Kong, China, 2000.

Marcel P. van Lohuizen. 2001. A generic approach to parallel chart parsing with an application to LinGO. In *Proceedings of the 39th Meeting of the Association for Computational Linguistics*, Toulouse, France.

David A. Wroblewski. 1987. Nondestructive graph unification. In *Proceedings of the 6th National Conference on Artificial Intelligence (AAAI-87)*, 582-589. Morgan Kaufmann.

## Past Images

<img src="http://www.agree-grammar.com/webshare/20111125-chart-debugger.png" title="http://www.agree-grammar.com/webshare/20111125-chart-debugger.png" class="external_image" alt="http://www.agree-grammar.com/webshare/20111125-chart-debugger.png" />
<img src="http://www.agree-grammar.com/webshare/20111125-chart-debugger-2up.png" title="http://www.agree-grammar.com/webshare/20111125-chart-debugger-2up.png" class="external_image" alt="http://www.agree-grammar.com/webshare/20111125-chart-debugger-2up.png" />


<img src="http://www.agree-grammar.com/webshare/20110214.png" title="http://www.agree-grammar.com/webshare/20110214.png" class="external_image" alt="http://www.agree-grammar.com/webshare/20110214.png" />


<img src="http://www.agree-grammar.com/webshare/20110131.png" title="http://www.agree-grammar.com/webshare/20110131.png" class="external_image" alt="http://www.agree-grammar.com/webshare/20110131.png" />


<img src="http://www.agree-grammar.com/webshare/20101019.png" title="http://www.agree-grammar.com/webshare/20101019.png" class="external_image" alt="http://www.agree-grammar.com/webshare/20101019.png" />


<img src="http://www.agree-grammar.com/webshare/20100918.png" title="http://www.agree-grammar.com/webshare/20100918.png" class="external_image" alt="http://www.agree-grammar.com/webshare/20100918.png" />


Last update: 2022-09-20 by Glenn Slayden [[edit](https://github.com/delph-in/docs/wiki/AgreeTop/_edit)]{% endraw %}