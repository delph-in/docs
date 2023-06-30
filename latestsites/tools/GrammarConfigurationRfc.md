{% raw %}There are a variety of processors that load TDL grammars, such as
[agree](https://delph-in.github.io/docs/garage/AgreeTop), [ACE](https://delph-in.github.io/docs/tools/AceTop), the [LKB](https://delph-in.github.io/docs/tools/LkbTop) (including
[LkbFos](https://delph-in.github.io/docs/tools/LkbFos)), [PET](https://delph-in.github.io/docs/garage/PetTop), and to a limited degree
[PyDelphin](https://delph-in.github.io/docs/tools/PyDelphinTop). These all need some way to specify which files
to load and how to load them, and most implement their own configuration
format. There are some problems with this arrangement: duplication of
information, subtle differences among implementations, increased mental
burden on grammar developers, etc. This RFC, therefore, proposes a
unified configuration file format that works with all processors,
possibly with some processor-specific section for unique features.

Contents

1. [Survey](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Survey)
   1. [Grammar Version](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Grammar_Version)
   2. [Grammar Loading](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Grammar_Loading)
   3. [Lists](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Lists)
   4. [Types](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Types)
   5. [Features](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Features)
   6. [Feature Paths](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Feature_Paths)
   7. [Preprocessing](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Preprocessing)
   8. [External Interfaces](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#External_Interfaces)
   9. [Models and Efficiency](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Models_and_Efficiency)
   10. [Generation](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Generation)
   11. [ICONS](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#ICONS)
   12. [Chart Mapping](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Chart_Mapping)
   13. [Roots](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Roots)
   14. [Generics](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Generics)
   15. [Rules](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Rules)
   16. [Chart Packing](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Chart_Packing)
   17. [MRS](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#MRS)
   18. [Other Settings](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Other_Settings)
2. [Proposal](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Proposal)
   1. [Sub-proposal 1: Conditionals](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Sub-proposal_1:_Conditionals)
   2. [Sub-proposal 2: Including Sub-config
Files](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Sub-proposal_2:_Including_Sub-config_Files)
3. [Example](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Example)
4. [Questions](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Questions)
   1. [Repeated Settings: Conflict or
Reassignment?](https://delph-in.github.io/docs/tools/GrammarConfigurationRfc#Repeated_Settings:_Conflict_or_Reassignment.3F)

## Survey

Part of loading a grammar is determining whether to load some TDL as
types or instances (including lexicons, rules, etc.). TDL has the
ability to mark certain blocks of code and defining types or instances,
but the LKB is a notable deviant in not using this feature. Other things
that need to be loaded include morphological preprocessors, parse
selection models, and so on. Configuration also sets the values of
variables which can affect processing and output.

The LKB uses a script (generally at lkb/script) that directly calls its
lisp functions for loading files and setting variables. ACE and PET use
declarative config files (e.g., ace/config.tdl) in a pseudo-TDL syntax
(with slight differences between ACE and PET). They rely on TDL's
environments to determine how to load grammar definitions.

### Grammar Version

##### ACE

    version                   := "../Version.lsp".

##### LKB

```
(defparameter *grammar-version* "ERG (trunk)")
```

### Grammar Loading

##### ACE

    grammar-top               := "../english.tdl".
    
    idiom-rules               := "../idioms.mtr".
    non-idiom-root            := root_non_idiom
    
    irregular-forms           := ../irregs.tab.

##### LKB

```
(read-tdl-type-files-aux (list [...]))
(read-cached-leaf-types-if-available (list [...]))
(read-tdl-grammar-file-aux [...])
(read-morph-file-aux (lkb-pathname (parent-directory) "inflr.tdl"))
(read-tdl-psort-file-aux
 (lkb-pathname (parent-directory) "roots.tdl"))
(read-tdl-lex-rule-file-aux
 (lkb-pathname (parent-directory) "lexrinst.tdl"))

(mt:read-transfer-rules
 (list
  (lkb-pathname (parent-directory) "idioms.mtr"))
 "Idiom Tests"
 :filter nil :task :idiom)
(defparameter *non-idiom-root* 'root_non_idiom )

(load-irregular-spellings
 (list
  (lkb-pathname (parent-directory) "irregs.tab")
  ))
```

### Lists

##### ACE

    list-type                 := *list*.
    cons-type                 := *cons*.
    null-type                 := *null*.
    diff-list-type            := *diff-list*.

##### LKB

```
(defparameter *list-type* '*list*)
(defparameter *empty-list-type* '*null*)
(defparameter *diff-list-type* '*diff-list*)

(defparameter *list-tail* '(rest))
(defparameter *list-head* '(first))
(defparameter *diff-list-list* 'list)
(defparameter *diff-list-last* 'last)
```

### Types

##### ACE

    semarg-type               := semarg.

##### LKB

```
(defparameter *toptype* '*top*)
(defparameter *string-type* 'string
   "a special type name - any lisp strings are subtypes of it")

(setf *top-semantics-type*
  (vsym "predsort"))

(setf *false-type* (vsym "-"))
(setf *true-type* (vsym "+"))

(defparameter *label-template-type* 'label)
(defparameter *quant-rel-types* nil)
```

### Features

##### ACE

    deleted-daughters :=
      ARGS HD-DTR NH-DTR LCONJ-DTR RCONJ-DTR DTR DTR1 DTR2 DTRA DTRB.

##### LKB

```
(defparameter *sc-arg-feature* (vsym "HARG")
  "the feature in a qeq that leads to the first argument")
(defparameter *outscpd-feature* (vsym "LARG")
  "the feature in a qeq that leads to the second argument")
(defparameter *bv-feature* (vsym "ARG0"))
(defparameter *scope-feat* (vsym "BODY"))

(defparameter *deleted-daughter-features*
  '(ARGS HD-DTR NH-DTR LCONJ-DTR RCONJ-DTR DTR DTR1 DTR2 DTRA DTRB)
  "features pointing to daughters deleted on building a constituent")
```

### Feature Paths

##### ACE

    orth-path                 := ORTH.
    semantics-path            := SYNSEM LOCAL CONT.
    lex-rels-path             := SYNSEM LOCAL CONT RELS.
    lex-carg-path             := SYNSEM LKEYS KEYREL CARG.
    lex-pred-path             := SYNSEM LKEYS KEYREL PRED.
    rule-rels-path            := C-CONT RELS.
    
    label-path := LABEL-NAME.  ; from Jacy
    
    hook-path      := HOOK.  ; default
    mrs-hcons-list := HCONS LIST.  ; default
    mrs-icons-list := ICONS LIST.  ; default
    mrs-rels-list  := RELS LIST.  ; default
    recursive-label-path-in-label := SYNSEM LOCAL.  ; default
    recursive-label-path-in-sign := SYNSEM NONLOC SLASH LIST FIRST.  ; default (currently buggy?)

##### LKB

```
(defparameter *orth-path* '(orth))

(setf *initial-semantics-path*
  `(,(vsym "SYNSEM") ,(vsym "LOCAL") ,(vsym "CONT") ))
(setf *main-semantics-path
  `(,(vsym "SYNSEM") ,(vsym "LOCAL") ,(vsym "CONT")
    ,(vsym "RELS") ,(vsym "LIST")))
(setf *construction-semantics-path*
  `(,(vsym "C-CONT") ,(vsym "RELS") ,(vsym "LIST")))
(setf lkb::*c-cont-check-path*
  `(,(vsym "C-CONT")))
(setf *psoa-top-h-path* (list (vsym "HOOK") (vsym "LTOP")))
(setf *semantics-index-path* '(SYNSEM LOCAL CONT HOOK INDEX))

(defparameter *psoa-index-path*
  `(,(vsym "HOOK") ,(vsym "INDEX"))
  "path to get an index from a psoa")
(defparameter *psoa-event-path* `(,(vsym "HOOK") ,(vsym "INDEX")))
(defparameter *psoa-liszt-path* `(,(vsym "RELS") ,(vsym "LIST")))
(defparameter *psoa-rh-cons-path* `(,(vsym "HCONS") ,(vsym "LIST")))
(defparameter *rel-handel-path*
    `(,(vsym "LBL"))
  "path to get the handel from a relation")

(setf *head-path* '(synsem local cat head))
(setf *head-daughter-path* '(hd-dtr))

(defparameter *label-path* '(LNAME))
(defparameter *prefix-path* '(META-PREFIX))
(defparameter *suffix-path* '(META-SUFFIX))
(defparameter *recursive-path* '(SYNSEM NONLOC SLASH LIST FIRST))
(defparameter *local-path* '(SYNSEM LOCAL))
(defparameter *label-fs-path* '())

(defparameter *discriminant-path* '(SYNSEM LOCAL MINORS MIN))
```

### Preprocessing

##### ACE

    preprocessor              := "../rpp/tokenizer.rpp".
    preprocessor-modules      := ../rpp/xml.rpp ../rpp/ascii.rpp ../rpp/lgt.rpp ../rpp/quotes.rpp ../rpp/wiki.rpp ../rpp/gml.rpp ../rpp/html.rpp.

##### LKB

```
(clear-repp)
(read-repp (lkb-pathname (parent-directory "rpp") "xml.rpp"))
[...]
(setf *repp-calls* '(:xml :lgt :ascii :quotes))
(setf *repp-characterize-p* t)
(setf *repp-characterization-beam* 2)
(setf *repp-interactive* '(:tokenizer :xml :lgt :ascii :quotes :lkb))
(setf *repp-debug-p* nil

(setf *characterize-p* t)
```

### External Interfaces

##### ACE

    parse-node-labels           := "../parse-nodes.tdl".
    variable-property-mapping   := "../semi.vpm".
    semantic-interface-2016     := "../etc/erg.smi".
    semantic-interface-top-type := top.
    mrs-deleted-roles           := IDIOMP LNK CFROM CTO --PSV WLINK PARAMS.

##### LKB

```
(read-tdl-parse-node-file-aux
 (lkb-pathname (parent-directory) "parse-nodes.tdl"))
(mt:read-vpm (lkb-pathname (parent-directory) "semi.vpm") :semi)
(mt:read-semi (lkb-pathname (parent-directory "etc") "erg.smi"))
(setf *variable-type-mapping* :semi)
(setf *ignored-sem-features*
  (union
   *ignored-sem-features*
   (list (vsym "LNK") (vsym "WLINK") (vsym "PARAMS")
         (vsym "CFROM") (vsym "CTO"))))
(setf *ignored-extra-features*
  (union
   *ignored-extra-features*
   (list (vsym "SORT") (vsym "INSTLOC")))
```

### Models and Efficiency

##### ACE

    maxent-model              := "../redwoods.mem".
    quickcheck-code           := "../ace/ace-erg-qc.txt".
    post-model-path           := "english-postagger.hmm".
    
    übertag-emission-path     := "../ut/nanc_wsj_redwoods_noaffix.ex.gz".
    übertag-transition-path   := "../ut/nanc_wsj_redwoods_noaffix.tx.gz".
    übertag-generic-map-path  := "../ut/generics.cfg".
    übertag-whitelist-path    := "../ut/whitelist.cfg".
    
    robustness-marker-path := GENRE.
    robustness-marker-type := robust.

##### LKB

```
(tsdb::read-model (lkb-pathname (parent-directory) "jhpstg.g.mem"))
(setf *unpacking-scoring-hook* #'tsdb::mem-score-configuration)
```

### Generation

##### ACE

    generation-ignore-lexemes := "../lkb/nogen-lex.set".
    generation-ignore-rules   := "../lkb/nogen-rules.set".
    generation-trigger-rules  := "../trigger.mtr".
    
    index-accessibility-filtering := enabled.

##### LKB

```
(setf *duplicate-lex-ids*
  (load-erg-settings-file
    (merge-pathnames "lkb/nogen-lex.set" *grammar-directory*)))
(setf *gen-ignore-rules*
  (load-erg-settings-file
    (merge-pathnames "lkb/nogen-rules.set" *grammar-directory*)))
(setf *parse-ignore-rules*
  (load-erg-settings-file
    (merge-pathnames "lkb/noparse-rules.set" *grammar-directory*)))

(setf *gen-packing-p* t)
(setf *gen-filtering-p* t)
(setf *gen-equate-qeqs-p* t)

(setf *bypass-equality-check* :filter)
```

### ICONS

##### ACE

    enable-icons := yes.
    mrs-icons-list := ICONS LIST.
    icons-left := IARG1.
    icons-right := IARG2.

##### LKB

```
(defparameter *icons-p* t)
```

### Chart Mapping

##### ACE

    token-mapping := enabled.
    
    lexicon-tokens-path := TOKENS +LIST.
    lexicon-last-token-path := TOKENS +LAST.
    token-type          := token.
    token-form-path     := +FORM.       ; [required] string for lexical lookup
    token-id-path       := +ID.         ; [optional] list of external ids
    token-from-path     := +FROM.       ; [optional] surface start position
    token-to-path       := +TO.         ; [optional] surface end position
    token-postags-path  := +TNT +TAGS.  ; [optional] list of POS tags
    token-posprobs-path := +TNT +PRBS.  ; [optional] list of POS probabilities
    
    lattice-mapping-input-path    := +INPUT.
    lattice-mapping-output-path   := +OUTPUT.
    lattice-mapping-context-path  := +CONTEXT.
    lattice-mapping-position-path := +POSITION.

##### LKB

```
(setf *lexicon-tokens-path* '(TOKENS +LIST))
(setf *lexicon-last-token-path* '(TOKENS +LAST))
(setf *token-id-path* '(+ID))

(setf *token-ignore* '(+STAG))  ; maybe?
```

### Roots

##### ACE

    parsing-roots    := root_strict root_informal root_frag root_inffrag root_robust root_robust_frag.
    generation-roots := root_gen.

##### LKB

```
(defparameter *start-symbol* '(root_strict root_frag))
(defparameter *gen-start-symbol* '(root_gen))
(setf *fragment-start-symbols*
  '(root_strict root_informal root_frag
    root_lex root_phr root_conj root_subord))
```

### Generics

##### ACE

    generic-les-for-semantic-index := generic_proper_ne generic_card_ne generic_ord_ne generic_dom_card_ne generic_dom_ord_ne generic_year_ne generic_date_ne generic_pl_noun_ne.
    generic-les-by-part-of-speech  := "generic_adj a" "generic_adverb a" "gen_generic_noun n" "gen_generic_verb v".
    generics-overwrite-orth        := true.

##### LKB

```
(labels ((match-pred (ep tag)
           (let ((pred (string (mrs:rel-pred ep)))
                 (re (format nil "^_([^_]+)_~a(?:_[^_]+)?_rel$" tag)))
             (multiple-value-bind (start end starts ends)
                 (ppcre:scan re pred)
               (declare (ignore start end))
               (when (and starts ends)
                 (subseq pred (aref starts 0) (aref ends 0)))))))
  (setf *generic-lexical-entries*
    `((generic_proper_ne :generate)
      (generic_card_ne :generate) (generic_ord_ne :generate)
      (generic_dom_card_ne :generate) (generic_dom_ord_ne :generate)
      (generic_year_ne :generate) (generic_date_ne :generate)
      (generic_pl_noun_ne :generate)
      (generic_adj :generate ,#'(lambda (ep) (match-pred ep "a")))
      (generic_adverb :generate ,#'(lambda (ep) (match-pred ep "a")))
      (gen_generic_noun :generate ,#'(lambda (ep) (match-pred ep "n")))
      (gen_generic_verb :generate ,#'(lambda (ep) (match-pred ep "v"))))))
```

### Rules

##### ACE

    spanning-only-rules :=
      aj-hd_int-inv_c
      [...].
    
    fragment-only-rules :=
      frag_np frag_nbar frag_pp_i
      [...].
    
    hyper-active-rules :=
            hdn-np_app-idf-p_c hdn-n_prnth_c n-n_num-seq_c
            [...].

##### LKB

```
```

### Chart Packing

##### ACE

    parsing-packing-restrictor    := RELS HCONS ICONS RNAME +TI +LL +TG.
    generation-packing-restrictor := ORTH RELS HCONS RNAME.
    
    chart-dependencies :=
      "SYNSEM LKEYS --+COMPKEY" "SYNSEM LOCAL CAT HEAD MINORS MIN"
      "SYNSEM LKEYS --+OCOMPKEY" "SYNSEM LOCAL CAT HEAD MINORS MIN"
      "SYNSEM LKEYS --+ARGIND" "SYNSEM LOCAL CONT HOOK INDEX"
    .
    process-chart-dependencies-before-lexical-parsing := no.

##### LKB

```
#+:null
(defparameter *chart-packing-p* t)

(defparameter *packing-restrictor*
  '(RELS HCONS ICONS RNAME ONSET)
  "restrictor used when parsing with ambiguity packing")

(defparameter *chart-dependencies*
  '((SYNSEM LKEYS --+COMPKEY) (SYNSEM LOCAL CAT HEAD MINORS MIN)
    (SYNSEM LKEYS --+OCOMPKEY) (SYNSEM LOCAL CAT HEAD MINORS MIN)
    (SYNSEM LKEYS --COMPHD) (SYNSEM LOCAL CAT HEAD)
    (SYNSEM LKEYS --+ARGIND) (SYNSEM --SIND)))
```

### MRS

##### ACE

    invent-ltop := yes.

##### LKB

```
(setf *sem-relation-suffix* "_rel")
(setf *value-feats* `(,(vsym "CARG")))
(defparameter *mrs-normalization-heuristics*
  '(("JJ[RS]?" nil "_~a_a_unknown_rel")
    ("(?:FW|NN)" nil "_~a_n_unknown_rel")
    ("NNS" nil "_~a_n_unknown_rel")
    ("RB" nil "_~a_a_unknown_rel")
    ("VBP?" :v_3s-fin_olr "_~a_v_unknown_rel")
    ("VBD" :v_pst_olr "_~a_v_unknown_rel")
    ("VBG" :v_prp_olr "_~a_v_unknown_rel")
    ("VBN" :v_psp_olr "_~a_v_unknown_rel")
    ("VBZ" :v_3s-fin_olr "_~a_v_unknown_rel")))
(defun normalize-mrs (mrs)
  (loop
      for ep in (psoa-liszt mrs)
      for pred = (rel-pred ep)
      when (stringp pred) do
        (loop
            for (tag rule pattern) in *mrs-normalization-heuristics*
            for re = (format nil "^_([^_]+)/~a_u_unknown_rel$" tag)
            thereis
              (multiple-value-bind (start end starts ends) (ppcre:scan re pred)
                (when (and start end)
                  (let* ((form (subseq pred (aref starts 0) (aref ends 0)))
                         (form (string-upcase form)))
                    (cond
                     #+:lkb
                     (rule
                      (let* ((stems (lkb::one-step-morph-analyse form))
                             (stem (first (rassoc (intern rule :lkb) stems))))
                        (when stem
                          (setf (rel-pred ep)
                            (format nil pattern (string-downcase stem))))))
                     (t
                      (setf (rel-pred ep)
                        (format nil pattern (string-downcase form))))))))))
  mrs)
(setf *normalize-predicates-p* t)

(setf *feat-priority-list*
  `( ,(vsym "LTOP") ,(vsym "INDEX") ,(vsym "LBL")
     ,(vsym "ARG0") ,(vsym "ARG1") ,(vsym "ARG2") ,(vsym "ARG3")
     ,(vsym "RSTR") ,(vsym "BODY")
     ,(vsym "MARG") ,(vsym "CARG")))
```

### Other Settings

##### ACE

    english-pos-tagger        := enabled.  ; ERG-specific
    extra-erg-dag-stash       := enabled.  ; ERG-specific
    simplify-lexicon          := enabled.
    generalize-edge-top-types := enabled.  ; sets top type of passive edge to 'sign'
    freezer-megabytes         := 512.

##### LKB

```
(defparameter *active-parsing-p* t)
(defparameter *irregular-forms-only-p* t)
(defparameter *display-type-hierarchy-on-load* nil)
(defparameter *lexdb-dump-source* "LinGO")
(defparameter *lexdb-dump-lang* "EN")
(defparameter *lexdb-dump-country* "US")
(defparameter *chart-limit* 100)
(defparameter *maximum-number-of-edges* 4000)
(defparameter *mother-feature* NIL
   "The feature giving the mother in a grammar rule")
(defparameter *mal-active-p* t)
(defparameter *maximal-lex-rule-applications* 7
   "The number of lexical rule applications which may be made
   before it is assumed that some rules are applying circularly")
(defparameter *dag-pool-size* 200000)
(defparameter *dag-pool*
  (if (and (pool-p *dag-pool*)
           (not (= (pool-size *dag-pool*) *dag-pool-size*)))
    (create-pool *dag-pool-size* #'(lambda () (make-safe-dag-x nil nil)))
    *dag-pool*))
(defparameter *last-parses*
  (let ((symbol (find-symbol "*LAST-PARSES*" :lkb)))
    (if (and (boundp symbol) (rest (symbol-value symbol)))
      (symbol-value symbol)
      '("Abrams hired two competent programmers."))))
(setf *intersective-rule-names* nil
  #+:null
  '((aj-hd_int_c . (1)) (nadj_rr_nt . (2))))
(setf *translate-grid* '(:en . (:en)))
(setf *c-cont-check-path* nil)

(setf *top-level-rel-types*  nil)
(defparameter *mrs-to-vit* nil)
(defparameter *mrs-for-language* 'english)
(defparameter *mrs-scoping* nil)
(setf *scoping-call-limit* 1000000)
(setf *rel-name-path* `(,(vsym "PRED") ))
(defparameter *mrs-rule-condition-path* (list (vsym "CONTEXT")))
(setf *maximum-genindex-relations* 500)
```

## Proposal

The TDL-like declarative config seems the most portable, as we can't
expect non-Lisp-based processors to understand the Lisp calls of the
LKB's script files. However it would be better if the config files were
more compliant with the TDL syntax. For this, we suggest using a new
config environment in TDL:

    :begin :config.
    ...
    :end :config.

Settings that are shared by the various processors go in this
environment. Those that are specific to a particular processor need to
be separated somehow. There are two sub-proposals for these separate
sections.

### Sub-proposal 1: Conditionals

We could define a new pseudo-environment that is read if some condition
is met. For instance:

    :begin :config.
    ...
    
    :if ACE.
    quickcheck-code           := "../ace/ace-erg-qc.txt".
    
    :elif LKB.
    maximum-number-of-edges   := 4000.
    
    :endif.
    :end :config.

We might allow boolean operations in the condition:

    :if EDUC | MAL.
    start-symbol := root_strict root_informal.
    :endif.

These conditions increase the ability of a single config file for
handling multiple processors or configurations, but it also increases
the complexity for parsing and interpretation; the processor would need
to handle :if, :elif, :else, and :endif, the boolean operators, and
maybe parenthesized boolean expressions.

Another possible syntax for conditionals is as an optional parameter for
the config environment:

    :begin :config.
    grammar-version := "ERG (2020)".
    ...
    
      :begin :config ACE.
      quickcheck-code := "../ace/ace-erg-qc.txt".
      :end :config.
    
      :begin :config LKB.
      maximum-number-of-edges   := 4000.
      :end :config.
    
    :end :config.

### Sub-proposal 2: Including Sub-config Files

Alternatively, we could handle most configurations by having multiple
config files. To reduce redundancy, we could use core config files via
:include statements, which are already supported by TDL.

    ;;; lkb-educ-config.tdl
    :begin :config.
    :include "core-config.tdl".
    :include "lkb-config.tdl".
    :include "educ-config.tdl".
    :end :config.
    
    ;;; lkb-config.tdl
    :begin :config.
    maximum-number-of-edges   := 4000.
    ...
    :end :config.
    
    ;;; educ-config.tdl
    :begin :config.
    start-symbol := root_strict root_informal.
    ...
    :end :config.

This keeps the changes to the TDL spec to a minimum, but they cause a
proliferation of individual config files.

## Example

Here is an attempt at an example configuration. First is a file with
default values. If the grammar doesn't change these, they do not need to
be configured (but I :include them anyway to be complete). You might
imagine the Matrix grammars would use some variant of this.

    ;;; configs/defaults.tdl
    :begin :config.
    
    ;; Lists
    list-type       := *list*.
    cons-type       := *cons*.
    empty-list-type := *null*.
    diff-list-type  := *diff-list*.
    list-tail       := REST.
    list-head       := FIRST.
    diff-list-list  := LIST.
    diff-list-last  := LAST.
    
    ;; Types
    top-type            := *top*.
    string-type         := string.
    top-semantics-type  := predsort.
    false-type          := -.
    true-type           := +.
    label-template-type := label.
    token-type          := token.
    
    ;; Features
    sc-arg-feature      := HARG.
    outscpd-feature     := LARG.
    bv-feature          := ARG0.
    scope-feature       := BODY.
    icons-left-feature  := IARG1.
    icons-right-feature := IARG2.
    
    ;; Feature Paths
    orth-path               := ORTH.
    head-path               := SYNSEM LOCAL CAT HEAD.
    head-daughter-path      := HD-DTR.
    semantics-path          := SYNSEM LOCAL CONT.
    lex-rels-path           := SYNSEM LOCAL CONT RELS.
    lex-carg-path           := SYNSEM LKEYS KEYREL CARG.
    lex-pred-path           := SYNSEM LKEYS KEYREL PRED.
    rule-rels-path          := C-CONT RELS.
    label-path              := LNAME.
    prefix-path             := META-PREFIX.
    suffix-path             := META-SUFFIX.
    local-path              := SYNSEM LOCAL.
    recursive-path          := SYNSEM NONLOC SLASH LIST FIRST.
    discriminant-path       := SYNSET LOCAL MINORS MIN.
    hook-path               := HOOK.
    hook-index-path         := HOOK INDEX.
    hook-top-path           := HOOK LTOP.
    mrs-hcons-list          := HCONS LIST
    mrs-icons-list          := ICONS LIST.
    mrs-rels-list           := RELS LIST.
    mrs-rel-label-path      := LBL.
    lexicon-tokens-path     := TOKENS +LIST.
    lexicon-last-token-path := TOKENS +LAST.
    token-form-path         := +FORM.
    token-id-path           := +ID.
    token-from-path         := +FROM.
    token-to-path           := +TO.
    
    ;; External Interfaces
    semantic-interface-top-type := top.
    ignored-sem-features        := LNK CFROM CTO.
    
    :end :config.

And here is the main config for the ERG:

    ;;; config.tdl
    :begin :config.
    grammar-version    := "ERG (2020)".
    character-encoding := "utf-8".
    
    :include "configs/defaults.tdl".
    
    ;; Grammar Loading
    :include "english.tdl".
    irregular-forms    := "irregs.tab".
    
    ;; Features
    deleted-daughters   := ARGS HD-DTR NH-DTR LCONJ-DTR RCONJ-DTR DTR DTR1 DTR2 DTRA DTRB.
    
    ;; Chart Mapping
    token-postags-path      := +TNT +TAGS.
    token-posprobs-path     := +TNT +PRBS.
    
    ;;; (to be continued)
    :end :config.

## Questions

### Repeated Settings: Conflict or Reassignment?

If a setting is present two or more times, do the successive occurrences
cause an error (like feature that don't unify) or do they overwrite the
previous occurrences, like variable reassignment? The latter would
probably be more useful, but it changes the TDL paradigm within the
config environment.

Last update: 2022-09-14 by EricZinda [[edit](https://github.com/delph-in/docs/wiki/GrammarConfigurationRfc/_edit)]{% endraw %}