;; CSC 407-001
;; Program Assignment 1: Common Lisp 
;; Created By: Jade Bell
;; 7 February 2025 

;; Mergesort Algorithm:
#| Mergesort algorithm recursively divides the list into sublist and sort
 those arrays and merges them back together to obtain a sorted array.
 Mergesort in simple terms is to divide the list in halves, sort them and merge them back.
 For Common Lisp, 3 function were used to complete thsi algorithm.
 1. 1st-split splits the list in 2 halves
 2. merge-sort recursively splits th elist into smaller parts
 3. merge-list merges the sorted lists back into 1 single sorted list|#
 
;; 1st-split Function: 
 #| This function gets a list at its midpoin index and splits it in half
 (left-side) - Obtain elements from 0 index to midpoint-1.
 (right-side) - Obtain elements from the midpoint to end of list |#
(defun lst-split (lst midp)
  (let ((left-side '())
        (right-side '())
        (index 0))	;; to keep track of the position, we have an index counter
    (do ((input-lst lst (cdr input-lst))) ;; while iterating through the list, going through each element 
        ((null input-lst)) ;; when the list is empty, it would stop iterating
      (if (< index midp)	;; checks if index is less than the midpoint
          (setf left-side (cons (car input-lst) left-side))	#| if index < mid, element belongs to the left-side of the list
														car input-1st gets first element in list, cons creates new list
														and gets updated with setf to hold the new list.|#
          (setf right-side (cons (car input-lst) right-side)))	;; if index < mid, element belongs to right-side of list 
      (setf index (1+ index)))	;; Increment its index to process next element in list
    (list (reverse left-side) (reverse right-side))))	;; reverses both leftand right side by cons before it is returned and is wrapped 
														;; into a new list 

;; Merge-list Function:
#| This function merges 2 sorted lists into one single list.
	It compares the first elements of each list and appends the
	smaller element to the final list and recursively merge the rest in ascending order.|#
(defun merge-lists (left-side right-side) ;; merge both lists into a single list
  (cond
    ((null left-side) right-side) ;; if the left is empty, then return to the right
    ((null right-side) left-side) ;; if the right is empty, then return to the left
    ((<= (car left-side) (car right-side)) ;; if 1st element of left is <= right
	 ;; add 1st element from left-side to final result while recursively 
	 ;; calling merge-list() to rest of list and right side 
     (cons (car left-side) (merge-lists (cdr left-side) right-side)))
    (t
	 ;; if right-side is smaller, then we do the same thing
     (cons (car right-side) (merge-lists left-side (cdr right-side))))))

;; Merge-sort Function:
#|This function is in charge of merging both sides of the list together
 if checks if list is empty or only has 1 element to show its sorted
 the list gets divided into 2 parts and recursively calls merge-sort on those parts.
 After sorting, both parts are merged using merge-list|#
(defun merge-sort (lst)
	;; if 1st list is empty, return or has only one element, then return as sorted
  (if (or (null lst) (null (cdr lst)))
      lst
      (let* ((midp (/ (length lst) 2)) ;; Compute the midpoint 
             (half-parts (lst-split lst midp))	;; split the list in half parts
             (left-side (car half-parts)) ;; get the first half of list
             (right-side (car (cdr half-parts)))) ;; get the second half of list
        (merge-lists (merge-sort left-side) (merge-sort right-side))))) ;; use merge-list() to merge both half parts

