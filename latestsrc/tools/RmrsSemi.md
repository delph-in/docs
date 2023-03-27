{% raw %}This page discusses the SEM-I.

The SEM-I is a theoretically grounded component of each grammar,
capturing several classes of lexical regularities while also serving the
crucial engineering function of supplying a reliable and complete
specification of the elementary predications the grammar can realize.

For more information see:

[SEM-I rational MT: Enriching deep grammars with a semantic interface
for scalable machine
translation](http://web.mysites.ntu.edu.sg/fcbond/open/pubs/2005-summit-semi.pdf)

This page was constructed by FrancisBond, based on
information from DanFlickinger and
StephanOepen.

### The SEM-I in MT

In the transfer process, MRSs are typically checked against the target
language SEM-I. This allows you to filter out ill-formed transfers. In
batch processing it may save a lot of time to suppress incompatible
transfer outputs, as the assumption is they can only fail in generation
anyhow. In theory, the SEM-I test can even increase end-to-end coverage,
as filtering out incompatible transfer results may allow better MRSs to
squeeze into the top-n range that is passed on downstream.

Those that aren't considered compliant will be colored pink in the
multi-MRS browser, and should output \`invalid output predicate'
messages somewhere in the fan-out log (or maybe the :error field of the
profile)

The SEM-I test will, by default, reject EPs that lack roles which are
not marked as optional in the SEM-I (e.g. the ARG0 of a \`compound'
relation, which rarely plays a role semantically). It is possible to
limit SEM-I comparison to checking the validity of predicates and
variable properties by setting the following variable (in the MT
package):

     (setf *semi-test* '(:predicates :properties))

This increases coverage considerably for [JaEn](/JaEn), and is also the
default setting for [NoEn](/NoEn).

### How to dump a SEM-I

Many [sections of the SEM-I](/SemiRfc#Sections) need to written
manually, such as for variables, roles, and properties. These sections
generally go in a top-level file (analogous to 'erg.smi' in the ERG).
The predicates section can be dumped from a grammar loaded by the LKB.

In order to dump the predicates, first load the grammar with the LKB,
then evaluate the following commands in the Emacs lisp buffer. The
following assume the top-level SEM-I is etc/matrix.smi, and the
resulting files go under the etc/ grammar subdirectory.

1. Turn on predicate normalization. This is probably necessary for
creating modern (since 2016) SEM-Is. It can also be placed more
permanently in lkb/mrsglobals.lsp.
   
   - ```
        1 (setf *normalize-predicates-p* t)
     ```
2. Load the top-level SEM-I file:
   - ```
        1 (setf semi
        2   (mt::construct-semi       
        3    :ids t :rules t :descendp t :embedp t
        4    :semi (mt::read-semi
        5           "etc/matrix.smi"
        6           :includep nil :finalizep nil :recordp nil)
        7    :patches "etc/patches.lisp"
        8    :finalizep t))
     ```
3. Dump the predicate hierarchy:
   - ```
        1 (with-open-file
        2     (stream "etc/hierarchy.smi" :direction :output :if-exists :supersede)
        3   (mt::print-semi semi :stream stream :format :hierarchy))
     ```
4. Dump the predicates (below they have been separately dumped for
abstract and surface predicates)
   - ```
        1 (with-open-file
        2     (stream "etc/abstract.smi" :direction :output :if-exists :supersede)
        3   (mt::print-semi semi :stream stream :format :compact :filter "^[^_]"))
        4 (with-open-file
        5     (stream "etc/surface.smi" :direction :output :if-exists :supersede)
        6   (mt::print-semi semi :stream stream :format :compact :filter "^_"))
     ```

You can control what information about variables gets dumped with the
abstract.vpm. This is loaded in the script file:

    (mt:read-vpm (lkb-pathname (parent-directory) "abstract.vpm") :abstract)

Here is an example from the ERG, it deletes unmarked values from the
output.

    ;;;
    ;;; when creating the SEM-I, ditch a lot of the variable property information,
    ;;; essentially only keeping what is relevant in terms of the interface.
    ;;;
    
    GEND : GEND
      m      >> m
      f      >> f
      n      >> n
      m-or-f >> m-or-f
      *      >> !
    
    
    NUM : NUM
      sg >> sg
      pl >> pl
      *  >> !
    
    
    IND : IND
      + >> +
      - >> -
      * >> !
    
    
    TENSE : TENSE
      past   >> past
      pre    >> pres
      fut    >> fut
      *      >> !
    
    
    MOOD : MOOD 
      subjunctive >> subjunctive
      *           >> !
    
    
    PROG : PROG
      + >> +
      * >> !
    
    
    PERF : PERF
      + >> +
      * >> !

Last update: 2017-04-24 by MichaelGoodman [[edit](https://github.com/delph-in/docs/wiki/RmrsSemi/_edit)]{% endraw %}