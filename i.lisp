(defmacro validate (function)
    (let* ( (function_name (second function))
            (args (car (cddr function)))
            (validArgs '(x y z))
            (verdict "")
            (f (char-int (char (string function_name) 0)))
        )

        ( if (not (and (>= f 65) (<= f 90)) )
            (setq verdict (concatenate 'string verdict (format nil "~%Invalid function name: ~a is not an atom.~%" function_name)))
            (setq verdict (concatenate 'string verdict (format nil "~%Valid function name: ~a is an atom.~%" function_name)))
        )

        ;invalid argument checkpoint
        ( dolist (item args)
            (if (not (find item validArgs))
            (setq verdict (concatenate 'string verdict (format nil "Invalid argument: ~a~%" item)))
            (setq verdict (concatenate 'string verdict (format nil "Valid argument: ~a~%" item)))
            )
        )

        ( if (= (length verdict) 0)
            (format t "Valid Function. No errors detected~%")
            (format t "Function validation: ~a~%" verdict)
        )
    )
)

(validate (defun get (x) …))
(validate (defun set123 (x z) …))
(validate (defun 123set (x z b c) …))
(validate (defun multiply (x y z) …))