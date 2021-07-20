(in-package :mt)

;;;
;;; disable all post-transfer post-processing of MRSs; needed in Norwegian --
;;; English MT (due to mismatches in internal variable structure), but surely
;;; not when working with only one grammar.
;;;
(setf *transfer-filter-p* nil)

;;; ERB 2008-03-12 Disable ranking or mmt model fails (in the absnse of
;;; a real model).

(setf *lm-model* nil)
