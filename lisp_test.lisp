(defun print-ln (item) (format t "~a~%" item))


(defun main () 

    ;; drop some newline chars to space output from previous exec
    (format t "~%~%~%~%~%")

    (print-ln "apple")
    (print-ln "banana")
    (print-ln "pomegranate")
    (print-ln "grape")

)
(main)