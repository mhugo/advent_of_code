(defun priority (char)
  (let ((c (char-code char)))
    (if (>= c (char-code #\a))
        (+ 1 (- c (char-code #\a)))
        (+ 27 (- c (char-code #\A))))))

(defun find-common-item (comp1 comp2 comp3)
  (let
      ((pos1 (make-array 52))
       (pos2 (make-array 52))
       (pos3 (make-array 52)))
    (loop for (pos comp) in (list (list pos1 comp1) (list pos2 comp2) (list pos3 comp3))
          do (loop for c across comp
                   do (let* ((i (1- (priority c)))
                             (v (aref pos i)))
                        (setf (aref pos i) 1))))
    (loop for i from 0 to 51
          do (when (equal (+ (aref pos1 i) (aref pos2 i) (aref pos3 i)) 3)
               (return (1+ i))))))


(find-common-item "vJrwpWtwJgWrhcsFMMfFFhFp"
                  "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL"
                  "PmmdzqPrVvPwwTWBwg")

(defun read-sacks ()
    (with-open-file (in "/home/hme/perso/lisp/aoc2022/day03/input.txt")
      (loop for group = (list (read-line in nil) (read-line in nil) (read-line in nil))
            while (car group)
            sum (find-common-item (car group) (cadr group) (caddr group)))))
                 


(read-sacks)
