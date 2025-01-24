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



;; generate a random list of integers between 0 - 100 of N items
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

 ;; my initial test functions... too attached to them to get rid of them 

  ;; test func 1: say hi
  (defun greet-user (name) (format t "Hello, ~a! Welcome!~%" name))

                ;; _
  ;; test func 2: | |
                ;; -
  (defun square (x)
    (* x x))

  ;; test func 3: is even check
  (defun is-even (n)
    (if (zerop (mod n 2))
        t
        nil))

;; our main method
(defun main () 



    ;; test random list func
    (setq TEST_LIST (GenRandoListOfCertainLength 10))



    ;; print several newline to get a clear output
    (format t "~%~%~%~%~a~%~%~%~%" "ONCE MORE FROM THE TOP")   

    ;; call test funcs

    ;; (print-ln "BRUH MOMENT")
    (format t "The square of 5 is: ~a~%" (square 5))
    (format t "Is 4  even? ~a~%" (is-even 4))
    (print-ln TEST_LIST)
    (print-list TEST_LIST)
    (greet-user "Alice")
    


  ;; values is a function that's used to return multiple values for functions in lisp
  ;; useful in itself, but we use it here with *no* values returning to sort of mark our main function with a void return
  ;; the main advantage of this is to keep our printing to output pretty as lisp normally will say the name of functions that are returning or called (I think)
  (values) 

  ;; end main
  )
 

;; call main
(main)


