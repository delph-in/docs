(in-package :lkb)

;;;
;;; identify characters that can form words; all other characters will create
;;; word boundaries and later be suppressed in tokenization.
;;;
(defun alphanumeric-or-extended-p (c)
  (and (graphic-char-p c) (not (member c *punctuation-characters*))))

;;;
;;; determine surface order of constituents in rule: returns list of paths into
;;; feature structure of rule, i.e. (nil (args first) (args rest first)) for a
;;; binary rule, where the first list element is the path to the mother node of
;;; the rule.
;;;
(defun establish-linear-precedence (rule)
  (let ((daughters
         (loop
             for args = (existing-dag-at-end-of rule '(args))
             then (existing-dag-at-end-of args *list-tail*)
             for daughter = (when args 
                              (get-value-at-end-of args *list-head*))
             for path = (list 'args) then (append path *list-tail*)
             while (and daughter (not (eq daughter 'no-way-through)))
             collect (append path *list-head*))))
    (if (null daughters)
      (cerror "Ignore it" "Rule without daughters")
      (cons nil daughters))))

;;;
;;; detect rules that have orthographemic variation associated to them; those
;;; who do should only be applied within the morphology system; for the time
;;; being use value of NEEDS-AFFIX feature, though it would be nicer to rely
;;; on a type distinction of lexical rules or re-entrancy of ORTH.
;;;
(defun spelling-change-rule-p (rule)
  (let ((affix (get-dag-value (tdfs-indef 
                               (rule-full-fs rule)) 'needs-affix)))
    (and affix (bool-value-true affix))))

;;;
;;; create feature structure representation of orthography value for insertion
;;; into the output structure of inflectional rules; somewhat more complicated
;;; than one might expect because of treatment for multi-word elements.
;;;
(defun make-orth-tdfs (orthography)
  (let* ((unifications
          (loop 
              for token in (split-into-words orthography)
              for path = *orth-path* then (append path *list-tail*)
              for opath = (create-path-from-feature-list 
                           (append path *list-head*))
              collect (make-unification :lhs opath                    
                                        :rhs (make-u-value :type token))))
         (indef (process-unifications unifications)))
    (when indef
      (make-tdfs :indef (create-wffs indef)))))

;;;
;;; assign priorities to parser tasks and lexical entries
;;;

;;; ERB 2008-03-12 rule-priory has to return a value for every
;;; rule or the mmt system fails.

(defun rule-priority (rule)
  (case (rule-id rule)
    (subj 1000)
    (t 0)))

(defun gen-rule-priority (rule)
  (rule-priority rule))

(defun lex-priority (mrec)
  (declare (ignore mrec))
  800)

(defun gen-lex-priority (fs)
  (declare (ignore fs))
  800)

;;;
;;; determine path and file names for lexicon and leaf type cache files.
;;;
(defun set-temporary-lexicon-filenames nil
  (let* ((version (or (find-symbol "*GRAMMAR-VERSION*" :common-lisp-user)
                      (and (find-package :lkb)
                           (find-symbol "*GRAMMAR-VERSION*" :lkb))))
         (prefix
          (if (and version (boundp version))
            (remove-if-not #'alphanumericp (symbol-value version))
            "lexicon")))
    (setf *psorts-temp-file* 
      (make-pathname :name prefix 
                     :directory (pathname-directory (lkb-tmp-dir))))
    (setf *psorts-temp-index-file* 
      (make-pathname :name (concatenate 'string prefix ".idx") 
                     :directory (pathname-directory (lkb-tmp-dir))))
    (setf *leaf-temp-file* 
      (make-pathname :name (concatenate 'string prefix ".lfs")
                     :directory (pathname-directory (lkb-tmp-dir))))))

(defun bool-value-true (fs)
  (and fs
       (let ((fs-type (type-of-fs fs)))
         (eql fs-type '+))))
  
(defun bool-value-false (fs)
  (and fs
       (let ((fs-type (type-of-fs fs)))
         (eql fs-type '-))))

