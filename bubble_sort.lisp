(defun bubblesort (lst)
  (labels ((bubble (lst)
             (if (or (null (cdr lst)) ; Single element or empty list
                     (< (car lst) (cadr lst)))
                 lst
                 (cons (cadr lst) (bubble (cons (car lst) (cddr lst)))))))
    (if (null (cdr lst)) ; List with 0 or 1 element is already sorted
        lst
        (bubble (cons (car lst) (bubblesort (cdr lst)))))))