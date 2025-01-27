;; CSC 407-001
;; Program Assignment 1: Common Lisp 
;; 3 February 2025 

;; Mergesort Algorithm
(defun lst-split (lst midp)
  (let ((left-side '())
        (right-side '())
        (index 0))
    (do ((input-lst lst (cdr input-lst)))
        ((null input-lst))
      (if (< index midp)
          (setf left-side (cons (car input-lst) left-side))
          (setf right-side (cons (car input-lst) right-side)))
      (setf index (1+ index)))
    (list (reverse left-side) (reverse right-side))))

(defun merge-lists (left-side right-side)
  (cond
    ((null left-side) right-side)
    ((null right-side) left-side)
    ((<= (car left-side) (car right-side))
     (cons (car left-side) (merge-lists (cdr left-side) right-side)))
    (t
     (cons (car right-side) (merge-lists left-side (cdr right-side))))))

(defun merge-sort (lst)
  (if (or (null lst) (null (cdr lst)))
      lst
      (let* ((midp (/ (length lst) 2))
             (half-parts (lst-split lst midp))
             (left-side (car half-parts))
             (right-side (car (cdr half-parts))))
        (merge-lists (merge-sort left-side) (merge-sort right-side)))))
