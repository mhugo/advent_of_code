(defun priority (char)
  (let ((c (char-code char)))
    (if (>= c (char-code #\a))
        (+ 1 (- c (char-code #\a)))
        (+ 27 (- c (char-code #\A))))))

(defun find-common-item (comp1 comp2)
  (let ((pos (make-array 52)))
    (loop for c across comp1
          do (progn
               (print (list c (priority c)))
               (setf (aref pos (1- (priority c))) 1)))
    (loop for c across comp2
         do (when (equal (aref pos (1- (priority c))) 1)
              (return (priority c))))))

(defun read-sacks ()
    (with-open-file (in "/home/hme/perso/lisp/aoc2022/day03/input.txt")
      (loop for sack = (read-line in nil)
            while sack
            sum (let ((pivot (/ (length sack) 2)))
                  (find-common-item (subseq sack 0 pivot) (subseq sack pivot))))))
                 

(read-sacks)
