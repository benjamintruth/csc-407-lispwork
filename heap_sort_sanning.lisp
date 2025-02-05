;; CSC 407-001
;; Program Assignment 1: Common Lisp 
;; heap sort :(
;; Created By: Rien Sanning


;; I left in the bells and whistles
;; will only publish the actual HeapSort, Heapify and Swap functions to the report



;; print item + newline char, simple printline
(
 defun print-ln (item)
  (format t "~a~%" item)
)

;; generate a random list of integers between 0 - 100 of n items
(defun GenRandoListOfCertainLength (n) 
  ;; kickoff let to use a local var
  (let
      ;; define local var
      ((return-list nil))

    (do 
        ;; on loop increment - (init) (per-loop-case)
        ((i 0 (+ i 1))) 
        ;; end case & return - (end-case) (return value)         
        ((= i n) return-list) 
        ;; loop body             
        (push (random 101) return-list)
    )
  )
)


;; swap function my beloved: exchange the position of two items in a list
(defun swap (inList index1 index2)
  (let ((temp (nth index1 inList)))      ; save a copy of index 1
    (setf (nth index1 inList) (nth index2 inList))  ; copy index 2 into the index 1
    (setf (nth index2 inList) temp)))    ; copy the temp of the original index 1 into index 2


;;; the hated heapify function
(defun heapify (list n i)

  ;; this little manuver cost me 51 years ( took me forever to realize I needed sequential binding on the let* )

  (let* ((largest i)                   ; begin assuming the root is largest
         (left (+ (* 2 i) 1))          ; left child's position
         (right (+ (* 2 i) 2)))        ; right child's position
    
    ;; check left child, if exists and is larger
    (when (and (< left n)
               (> (nth left list) (nth largest list)))
      (setf largest left))
    
    ;; check right child, if exists and is larger
    (when (and (< right n)
               (> (nth right list) (nth largest list)))
      (setf largest right))
    
    ;; if we found a child larger than the root
    (when (not (= largest i))
      ;; swap with the largest child
      (swap list i largest)
      ;; and we go again
      (heapify list n largest)))
  list)

;; actual heapsort 
(defun HeapSort (INPUT_LIST)
  (let ((n (length INPUT_LIST)) (RETURN_LIST (copy-list INPUT_LIST)) ) 
    ;; build our initial max heap
    (loop for i from (floor (/ n 2) 1) downto 0 do
          (heapify RETURN_LIST n i))
    
    ;; extract elements one by one from the heap
    (loop for i from (1- n) downto 1 do
          (progn
            ;; move current root (maximum) to the end
            (swap RETURN_LIST 0 i)
            ;; re-heapify
            (heapify RETURN_LIST i 0)))
    RETURN_LIST)
)


;; our main method
(defun main () 

    ;; print several newline to get a clear output
    (format t "~%~%~%~%~a~%~%~%~%" " ")   

    ;; list of one item

      (setq TEST_LIST (GenRandoListOfCertainLength 1))
      (setq SORTED_LIST (HeapSort TEST_LIST))

      ;; double space
      (format t "~%~%~a" " ")   

      ;; print lists
      (print-ln "LIST OF 1: ")
      (print-ln "ORIGINAL LIST: ")
      (print-ln TEST_LIST)
      (print-ln "SORTED LIST: ")
      (print-ln SORTED_LIST)


    ;; list of 10 sorted numbers

      (setq TEST_LIST `(10 20 30 40 50 60 70 80 90 100))
      (setq SORTED_LIST (HeapSort TEST_LIST))

      ;; double space
      (format t "~%~%~a" " ")   

      ;; print lists
      (print-ln "LIST OF 10 SORTED: ")
      (print-ln "ORIGINAL LIST: ")
      (print-ln TEST_LIST)
      (print-ln "SORTED LIST: ")
      (print-ln SORTED_LIST)



    ;; list of 10 numbers sorted in descending


      (setq TEST_LIST `(100 90 80 70 60 50 40 30 20 10))
      (setq SORTED_LIST (HeapSort TEST_LIST))

      ;; double space
      (format t "~%~%~a" " ")   

      ;; print lists
      (print-ln "LIST OF 10 SORTED: ")
      (print-ln "ORIGINAL LIST: ")
      (print-ln TEST_LIST)
      (print-ln "SORTED LIST: ")
      (print-ln SORTED_LIST)



    ;; list of at least 10 unsorted numbers
      ;; o7


      (setq TEST_LIST (GenRandoListOfCertainLength 13))
      (setq SORTED_LIST (HeapSort TEST_LIST))

      ;; double space
      (format t "~%~%~a" " ")   

      ;; print lists
      (print-ln "LIST OF 13 UNSORTED: ")
      (print-ln "ORIGINAL LIST: ")
      (print-ln TEST_LIST)
      (print-ln "SORTED LIST: ")
      (print-ln SORTED_LIST)


    
    
    


  ;; values is a function that's used to return multiple values for functions in lisp
  ;; useful in itself, but we use it here with *no* values returning (no arguments) to sort of mark our main function with a void return

  ;; the main advantage of this is to keep our printing to output pretty as lisp normally will say the name of functions 
  ;; that are returning or called
  (values) 

  ;; end main
 )
 

;; call main
(main)


