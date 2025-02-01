(defun quicksort (lst)
  ;; Quick sort implementation in Lisp
  (if (or (null lst) (null (cdr lst))) ; Base case: empty or single-element list is already sorted
      lst
      (let* ((pivot (car lst)) ; Select pivot as the first element
             (rest (cdr lst)) ; Remaining elements
             ;; Partition elements into smaller and larger lists based on pivot
             (smaller (remove-if-not (lambda (x) (<= x pivot)) rest))
             (larger (remove-if-not (lambda (x) (> x pivot)) rest)))
        ;; Recursively sort smaller and larger sublists and combine them
        (append (quicksort smaller)
                (list pivot)
                (quicksort larger)))))
