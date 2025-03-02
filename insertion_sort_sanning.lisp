;; CSC 407-001
;; Program Assignment 1: Common Lisp 
;; insertion sory
;; Created By: Rien Sanning


;; I left in the bells and whistles



;; print item + newline char, simple printline
(
 defun print-ln (item)
  (format t "~a~%" item)
)

;; simple print list
(
 defun print-list (list)
  "Prints the elements of a list."
  (dolist (element list)
    (print-ln element))
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


;; insertion sort
(defun InsertionSort (INPUT_LIST)

  ;; using let again to store a return list
  (let
      ;; define the return value here as a copy of input
      (
       (SORTED_LIST (copy-list INPUT_LIST))
      )

    ;; loop through the input list
    (do 
        ;; on loop increment - (init) (per-loop-case)
        ((i 0 (+ i 1))) 
        ;; end case & return - (end-case) (return value)         
        ((= i (length INPUT_LIST)) SORTED_LIST) 
        ;; loop body             
        (let (
               (j (- i 1) )                 ;; j is the cursor we will use to pass backwards through the array and move things forwards
               (key (nth i SORTED_LIST))    ;; key is the current item we are moving into position
             )
          (loop
             while 
                (and
                    (>= j 0)
                    (> (nth j SORTED_LIST) key) ;; move the current item (key) to the left until it's larger than the item to it's left
                )
             do
                ;; swap items to the left
                (swap SORTED_LIST j (+ j 1)) 

                ;; decrement j
                (setf j (- j 1))

             finally
                 ;; move key to new spot
                 (setf (nth (+ j 1) SORTED_LIST) key)
           )
         )

    )

  )

)


;; our main method
(defun main () 
    
    ;; print several newline to get a clear output
    (format t "~%~%~%~%~a~%~%~%~%" " ")   

    ;; list of one item

      (setq TEST_LIST (GenRandoListOfCertainLength 1))
      (setq SORTED_LIST (InsertionSort TEST_LIST))

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
      (setq SORTED_LIST (InsertionSort TEST_LIST))

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
      (setq SORTED_LIST (InsertionSort TEST_LIST))

      ;; double space
      (format t "~%~%~a" " ")   

      ;; print lists
      (print-ln "LIST OF 10 SORTED DESCENDING: ")
      (print-ln "ORIGINAL LIST: ")
      (print-ln TEST_LIST)
      (print-ln "SORTED LIST: ")
      (print-ln SORTED_LIST)



    ;; list of at least 10 unsorted numbers
      ;; o7


      (setq TEST_LIST (GenRandoListOfCertainLength 13))
      (setq SORTED_LIST (InsertionSort TEST_LIST))

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


