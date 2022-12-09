(defun to-symbol (p)
  (cond ((member p '(A X)) 'Rock)
        ((member p '(B Y)) 'Paper)
        ((member p '(C Z)) 'Scissors)))

(defun to-score (p)
  (cond ((equal p 'Rock) 1)
        ((equal p 'Paper) 2)
        ((equal p 'Scissors) 3)))

(defun resolve-round (other me)
  (let ((pair (list other me)))
    (cond ((or (equal pair '(Scissors Rock))
               (equal pair '(Rock Paper))
               (equal pair '(Paper Scissors)))
           ;; I win
           6)
          ((equal me other)
           ;; draw
           3)
          (t
           ;; I loose
           0))))
        
(defun read-rounds ()
    (with-open-file (in "/home/hme/perso/lisp/aoc2022/day02/input.txt")
      (loop for pair = (list (read in nil) (read in nil))
            while (car pair)
            collect (list (to-symbol (car pair)) (to-symbol (cadr pair))))))

(setq sum 0)
(loop for pair in (read-rounds)
      do (progn
           ;;(print pair)
           (let ((me (cadr pair))
                 (other (car pair)))
             (setq sum (+ sum (to-score me) (resolve-round other me)))
             (print (list pair sum (to-score me) (resolve-round other me))))))
           

sum
