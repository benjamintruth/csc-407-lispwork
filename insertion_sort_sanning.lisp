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

    ;; bruh
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
                    (> (nth j SORTED_LIST) key)
                )
             do
                ;; swap items
                

                ;; decrement j
                (setf j (- j 1))

             finally
                 ;; move key to new spot
                 (format t "Subloop ~a done!~%" i)
           )
         ) 


    )




  )

)


;; our main method
(defun main () 



    ;; test random list func
    (setq TEST_LIST (GenRandoListOfCertainLength 10))

    (setq SORTED_LIST (InsertionSort TEST_LIST))

    ;; print several newline to get a clear output
    (format t "~%~%~%~%~a~%~%~%~%" " ")   

    ;; print lists
    (print-ln "ORIGINAL LIST: ")
    (print-ln TEST_LIST)
    (print-ln "SORTED LIST: ")
    (print-ln SORTED_LIST)
    
    


  ;; values is a function that's used to return multiple values for functions in lisp
  ;; useful in itself, but we use it here with *no* values returning to sort of mark our main function with a void return
  ;; the main advantage of this is to keep our printing to output pretty as lisp normally will say the name of functions that are returning or called (I think)
  (values) 

  ;; end main
  )
 

;; call main
(main)


