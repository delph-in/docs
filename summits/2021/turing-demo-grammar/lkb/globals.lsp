;;; LinGO grammar specific globals file
;;; parameters only - grammar specific functions 
;;; should go in user-fns.lsp


(defparameter *active-parsing-p* t)

(grammar-encoding 'utf-8)
(setf cdb::*cdb-ascii-p* nil)

;;; Strings

(defparameter *toptype* '*top*)

(defparameter *string-type* 'string
   "a special type name - any lisp strings are subtypes of it")

;;; Lexical files

(defparameter *orth-path* '(stem))

(defparameter *list-tail* '(rest))

(defparameter *list-head* '(first))

(defparameter *empty-list-type* 'null)

(defparameter *list-type* 'list)

(defparameter *diff-list-type* 'diff-list)

(defparameter *diff-list-list* 'list)

(defparameter *diff-list-last* 'last)

;(defparameter *lex-rule-suffix* "_INFL_RULE"
; "creates the inflectional rule name from the information
;  in irregs.tab - for PAGE compatability")

;(defparameter *irregular-forms-only-p* t)

;;;
;;; input characters to be ignored (i.e. suppressed) in tokenization
;;;
;;; Note that these might not be the same as in pet/pet.set, which could
;;; cause parsing results from PET and LKB to differ.
;;;
(defparameter *punctuation-characters*
  (append
   '(#\space #\! #\" #\& #\' #\( #\)
     #\* #\+ #\, #\− #\. #\/ #\\ #\;
     #\< #\> #\? #\@ #\[ #\] #\^ #\`
     #\{ #\| #\} #\~)
   #+:ics
   '(#\ideographic_full_stop #\fullwidth_question_mark 
     #\horizontal_ellipsis #\fullwidth_full_stop
     #\fullwidth_exclamation_mark #\black_circle
     #\fullwidth_comma #\ideographic_space
     #\katakana_middle_dot #\white_circle)))

(defparameter *display-type-hierarchy-on-load* nil)

;;; Parsing

(defparameter *chart-limit* 100)

(defparameter *maximum-number-of-edges* 4000)

(defparameter *mother-feature* NIL
  "The feature giving the mother in a grammar rule")

(defparameter *start-symbol* '(root)
  "specifing valid parses")

(defparameter *maximal-lex-rule-applications* 42
   "The number of lexical rule applications which may be made
   before it is assumed that some rules are applying circularly")

(defparameter *deleted-daughter-features* 
  '(ARGS HEAD-DTR NON-HEAD-DTR DTR)
  "features pointing to daughters deleted on building a constituent")

;;; Parse tree node labels

;;; the path where the name string is stored
(defparameter *label-path* '(LABEL-NAME))

;;; the path for the meta prefix symbol
(defparameter *prefix-path* '(META-PREFIX))

;;; the path for the meta suffix symbol
(defparameter *suffix-path* '(META-SUFFIX))

;;; the path for the recursive category
(defparameter *recursive-path* '(SYNSEM NON-LOCAL SLASH LIST FIRST))

;;; the path inside the node to be unified with the recursive node
(defparameter *local-path* '(SYNSEM LOCAL))

;;; the path inside the node to be unified with the label node
(defparameter *label-fs-path* '())

(defparameter *label-template-type* 'label)

;;; for the compare function 

(defparameter *discriminant-path* '(synsem local keys key pred))

;;; the lex-rule suffix defaults to _lex_rule, but this might
;;; not be desirable

;(setf *lex-rule-suffix* nil)


;;; SSH 2012-04-10 Blocking Generation The lists *duplicate-lex-ids*
;;; and *gen-ignore-rules* below play a function like a filter for
;;; non-empty predicates which shouldn't be generated (e.g. informal
;;; and variant forms in Japanese).: *duplicate-lex-ids* for lexical
;;; items (lexicon.tdl) and *gen-ignore-rules* for lexical rules
;;; (irules.tdl, lrules.tdl) and phrasal rules (rules.tdl)
(setf *duplicate-lex-ids*
  '(;; lex-id1 lex-id2 lex-id3 ...
	
    ))

(setf *gen-ignore-rules*
  '(;; rule1 rule2 rule3 ... 
	
	))

;;; SSH 2012-04-11 Making generation faster
(setf *gen-packing-p* t)
(setf *gen-filtering-p* t)
(setf *packing-restrictor*  '(RELS HCONS ORTH STEM RULE-NAME))


;;; SSH 2012-04-11 MRS Semantic Equivalence Check
; prefer results with MRS subsumed by the input
; but if none exist then output all complete generated results
(setf *bypass-equality-check* :filter)

; output all complete generated results
; (setf *bypass-equality-check* t)

