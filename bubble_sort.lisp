(defun bubblesort (lst)
  ;; Bubble sort implementation in Lisp
  (labels ((bubble (lst)
             ;; Swap adjacent elements if needed and continue bubbling
             (if (or (null (cdr lst)) ; Single element or empty list, no swap needed
                     (< (car lst) (cadr lst))) ; Elements already in order
                 lst
                 ;; Swap elements and continue sorting
                 (cons (cadr lst) (bubble (cons (car lst) (cddr lst)))))))
    ;; Base case: If the list has 0 or 1 element, it's already sorted
    (if (null (cdr lst)) 
        lst
        ;; Recur with the rest of the list and perform bubbling
        (bubble (cons (car lst) (bubblesort (cdr lst)))))))
