(defun read-calories ()
    (with-open-file (in "/home/hme/perso/lisp/aoc2022/day01/input.txt")
      (let ((max_calories 0) (sum_calories 0))
        (loop for line = (read-line in nil)
              while line
              do (progn
                   ;;(print line)
                   (if (equal "" line)
                       (progn
                         (if (> sum_calories max_calories)
                             (setq max_calories sum_calories))
                         (setq sum_calories 0))
                       ;; else
                       (setq sum_calories (+ sum_calories (parse-integer line))))))
        max_calories)))


(print (read-calories))
