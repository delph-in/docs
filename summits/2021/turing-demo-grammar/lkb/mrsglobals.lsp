(in-package "MRS")

(defparameter *initial-semantics-path* 
  `(,(vsym "SYNSEM") ,(vsym "LOCAL") ,(vsym "CONT"))
  "Following this path into a sign gets you to the MRS structure")

(defparameter *main-semantics-path* 
  `(,(vsym "SYNSEM") ,(vsym "LOCAL") ,(vsym "CONT") 
    ,(vsym "RELS") ,(vsym "LIST")))

(defparameter *psoa-liszt-path* (list (vsym "RELS") (vsym "LIST"))
  "path to get a liszt from a psoa")

(defparameter *psoa-top-h-path*  `(,(vsym "HOOK") ,(vsym "GTOP"))
  "path to get the top handle from a psoa")

(defparameter *psoa-index-path* 
  `(,(vsym "HOOK") ,(vsym "INDEX"))
  "path to get an index from a psoa")

(defparameter *psoa-event-path* `(,(vsym "HOOK") ,(vsym "INDEX")))
(defparameter *psoa-rh-cons-path* `(,(vsym "HCONS") ,(vsym "LIST")))

(defparameter *rel-handel-path*
    `(,(vsym "LBL"))
  "path to get the handel from a relation")

(defparameter *sc-arg-feature* (vsym "HARG")
  "the feature in a qeq that leads to the first argument")

(defparameter *outscpd-feature* (vsym "LARG")
  "the feature in a qeq that leads to the second argument")

(defparameter *bv-feature* (vsym "ARG0"))

(defparameter *scope-feat* (vsym "BODY"))

(defparameter *ignored-sem-features* (list (vsym "WLINK"))
  "A list of features which are ignored completely")

(defparameter *main-semantics-path* 
  (append *initial-semantics-path* (list (vsym "RELS") (vsym "LIST")))
  "the path into a lexical entry which gives the list of
   relations - typically (append *initial-semantics-path* '(RELS LIST))")

(defparameter *construction-semantics-path* 
  (list (vsym "C-CONT") (vsym "RELS") (vsym "LIST"))
  "the path into a rule/construction which gives the
   semantics specific to that construction")

(defparameter *top-semantics-type* (vsym "RELATION")
  "the highest type in the hierarchy under which all
   rels are found")

(defparameter *value-feats* 
  (list
   (vsym "CARG")))

(defparameter lkb::*semantics-index-path* 
  (append *initial-semantics-path* (list (vsym "HOOK") (vsym "INDEX"))))
  
;;;
;;; types for variable naming in mrsoutput (copy from `src/mrs/mrsglobals.lsp'
;;; but here to remind us to adapt them, as appropriate).
;;;

(defparameter *event-type* (vsym "event"))
(defparameter *event_or_index-type* (vsym "event_or_index"))
(defparameter *non_expl-ind-type* (vsym "non_expl-ind"))
(defparameter *eventtime-type* (vsym "eventtime"))
(defparameter *handle-type* (vsym "handle"))
(defparameter *group_lab-type* (vsym "group_lab"))
(defparameter *hole-type* (vsym "hole"))
(defparameter *label-type* (vsym "label"))
(defparameter *ref-ind-type* (vsym "ref-ind"))
(defparameter *full_ref-ind-type* (vsym "full_ref-ind"))
(defparameter *deg-ind-type* (vsym "deg-ind"))
(defparameter *individual-type* (vsym "individual"))
(defparameter *difference-list-type* (vsym "*diff-list*"))
(defparameter *conj-ind-type* (vsym "conj-ind"))

;;;
;;; context condition in MRS munging rules
;;; 

(defparameter *mrs-rule-condition-path* (list (vsym "CONTEXT")))

;;;
;;; ERB 2004-06-08
;;;

(setf *sem-relation-suffix* "_rel")
(setf *rel-name-path* `(,(vsym "PRED") ))

;;;
;;; MWG 2013-05-21: block the LKB's default var type mappings (use the SEMI)
;;;

(setf *variable-type-mapping* :semi)

;;;
;;; MWG 2013-05-16: adding to allow generation with [incr tsdb()]
;;;

(setf *show-lnk-p* nil)
