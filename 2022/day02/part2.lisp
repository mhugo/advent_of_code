(defun to-symbol (p)
  (cond ((member p '(A X)) 'Rock)
        ((member p '(B Y)) 'Paper)
        ((member p '(C Z)) 'Scissors)))

(defun to-score (p)
  (cond ((equal p 'Rock) 1)
        ((equal p 'Paper) 2)
        ((equal p 'Scissors) 3)))

(defun resolve-round (other result)
  (cond ((equal result 'X) ;; I need to loose
         (cond ((equal other 'Rock) (to-score 'Scissors))
               ((equal other 'Paper) (to-score 'Rock))
               ((equal other 'Scissors) (to-score 'Paper))))
        ((equal result 'Y) ;; draw
         (to-score other))
        (t ;; I need to win
         (cond ((equal other 'Rock) (to-score 'Paper))
               ((equal other 'Paper) (to-score 'Scissors))
               ((equal other 'Scissors) (to-score 'Rock))))))

(resolve-round 'Rock 'Z)
        
(defun read-rounds ()
    (with-open-file (in "/home/hme/perso/lisp/aoc2022/day02/input.txt")
      (loop for pair = (list (read in nil) (read in nil))
            while (car pair)
            collect pair)))

(defun compute-sum (rounds)
  (setq sum 0)
  (loop for pair in rounds
        do (progn
             (let* ((result (cadr pair))
                    (other (car pair))
                    (result-score
                      (cond
                        ((equal result 'X) 0)
                        ((equal result 'Y) 3)
                        ((equal result 'Z) 6)))
                    (me-score (resolve-round (to-symbol other) result)))
               (print (list pair me-score result-score))
               (setq sum (+ sum me-score result-score))
               )))
  sum)

(compute-sum (read-rounds))
