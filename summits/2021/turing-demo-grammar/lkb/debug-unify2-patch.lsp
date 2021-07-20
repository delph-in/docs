(in-package :lkb)

;;; src/glue/dag.lsp

(defmethod print-object ((object failure) stream)
  (if *failure-raw-output-p*
    (call-next-method)
    (case (failure-nature object)
      (:type
       (format 
        stream 
        "#U[type ~:[-1~*~;~a~] [~:[~*~;~{~a~^ ~}~]] ~
            ~:[top~*~;~a~] ~:[top~*~;~a~] ~:[-1~*~;~a~]]"
        (failure-id object) (failure-id object)
        (failure-path object) (failure-path object)
        (failure-type1 object) (failure-type1 object)
        (failure-type2 object) (failure-type2 object)
        (failure-context object) (failure-context object)))
      (:cycle
       (format 
        stream 
        "#U[cycle ~:[-1~*~;~a~] [~:[~*~;~{~a~^ ~}~]] [~:[~*~;~{~a~^ ~}~]] ~
            ~:[-1~*~;~a~]]"
        (failure-id object) (failure-id object) 
        (failure-path object) (failure-path object)
        (failure-suffix object) (failure-suffix object)
        (failure-context object) (failure-context object)))
      (:constraint
       (format 
        stream ; JAC 10-Nov-2020 - removed spurious open bracket in 2nd expression below
        "#U[constraint ~:[-1~*~;~a~] ~:[~*~;[~{~a~^ ~}~]] ~
           ~:[top~*~;~a~] ~:[top~*~;~a~] ~:[top~*~;~a~] ~:[-1~*~;~a~]]"
        (failure-id object) (failure-id object)
        (failure-path object) (failure-path object)
        (failure-type1 object) (failure-type1 object) 
        (failure-type2 object) (failure-type2 object) 
        (failure-glb object) (failure-glb object)
        (failure-context object) (failure-context object))))))

(defun debug-unify2 (dag1 dag2 path)
  (multiple-value-bind (glb constraintp)
      (greatest-common-subtype (unify-get-type dag1) (unify-get-type dag2))
    (cond
     (glb
      (setf (dag-new-type dag1) glb)
      (when constraintp
        (let ((constraint (may-copy-constraint-of glb))
              failures)
          (let* ((%failures% nil))
            (debug-unify1 dag1 constraint path)
            (when %failures%
              (loop
                  with context = (make-failure 
                                  :nature :constraint
                                  :path (reverse path)
                                  :type1 (unify-get-type dag1) 
                                  :type2 (unify-get-type dag2)
                                  :glb glb)
                  with id = (failure-id context)
                  for failure in %failures%
                  do
                    (setf (failure-context failure) id)
                    (push failure failures)
                  finally (push context failures))))
          (setq %failures% (nconc %failures% failures)))) ; JAC 10-Nov-2020 - setq was omitted
      (setf dag1 (deref-dag dag1))
      (setf (dag-forward dag2) dag1)
      (setf (dag-copy dag1) path)
      (debug-unify-arcs dag1 dag2 path)
      (setf (dag-copy dag1) nil))
     (t
      ;;
      ;; to build a robust unifier, would it be sufficient to
      ;; - determine the most specific type subsuming both input types
      ;; - recurse over features only that are appropriate for that type
      ;; - discard any additional information from the two input structure
      ;; --- we wonder ...
      ;;
      (push (make-failure 
             :nature :type :path (reverse path)
             :type1 (unify-get-type dag1) :type2 (unify-get-type dag2))
            %failures%)
      (case *unify-robust-p*
        (:lub
         (let* ((type (least-common-supertype
                       (unify-get-type dag1) (unify-get-type dag2)))
                (features (appropriate-features-of type)))
           (declare (ignore features))
           (setf (dag-arcs dag1) nil)))
        (:size
         (let ((i (debug-unify-size dag1))
               (j (debug-unify-size dag2))
               k l)
           (when (= i j)
             ;;
             ;; if need be, use the count of subtypes as a tie-breaker, making
             ;; the (debatable) assumption that more subtypes indicate a larger
             ;; degree of uncertainty.
             ;;
             (let* ((type1 (get-type-entry (unify-get-type dag1)))
                    (type2 (get-type-entry (unify-get-type dag2))))
               (setf k (length (and type1 (ltype-descendants type1))))
               (setf l (length (and type2 (ltype-descendants type2))))))
           (cond
            ((or (< i j) (and k l (> k l)))
             (setf (dag-forward dag1) dag2)
             (debug-unify-arcs dag1 dag2 path)
             (setf (dag-copy dag2) nil))
            (t
             (setf (dag-forward dag2) dag1)
             (debug-unify-arcs dag1 dag2 path)
             (setf (dag-copy dag1) nil)))))
        (:default
         ;;
         ;; the cheapest possible strategy: arbitrarily select one of the two
         ;; input dags as the result dag; still recurse over all arcs to try
         ;; and pick up additional information (on shared arcs).
         ;;
         (setf (dag-forward dag2) dag1)
         (debug-unify-arcs dag1 dag2 path)
         (setf (dag-copy dag1) nil)))))))

