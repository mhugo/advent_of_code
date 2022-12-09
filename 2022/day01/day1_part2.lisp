(defun read-calorie-sums ()
    (with-open-file (in "/home/hme/perso/lisp/aoc2022/day01/input.txt")
      (let ((sum_calories 0) (sums '()))
        (loop for line = (read-line in nil)
              while line
              do (progn
                   (if (equal "" line)
                       (progn
                         (setq sums (append sums (list sum_calories)))
                         (setq sum_calories 0))
                       ;; else
                       (setq sum_calories (+ sum_calories (parse-integer line))))))
        sums)))


(let ((topn (sort (read-calorie-sums) #'>)))
  (print (+ (car topn)
            (cadr topn)
            (caddr topn))))
