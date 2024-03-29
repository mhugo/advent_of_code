(defun read-ranges ()
  (with-open-file (in "/home/hme/perso/advent_of_code/2022/day04/input.txt")
    (loop for line = (read-line in nil)
          while line
          collect
          ;; format of each line:
          ;; <L1>-<R1>,<L2>-<R2> with L1,L2,R1,R2 integers
          (multiple-value-bind (l1 i1) (parse-integer line :start 0 :junk-allowed t)
            (multiple-value-bind (r1 i2) (parse-integer line :start (1+ i1) :junk-allowed t)
              (multiple-value-bind (l2 i3) (parse-integer line :start (1+ i2) :junk-allowed t)
                (let ((r2 (parse-integer line :start (1+ i3) :junk-allowed t)))
                  (list l1 r1 l2 r2))))))))


(defun fully-contains? (l1 r1 l2 r2)
  (or
   ;; range1 fully included in range2
   (and (>= l1 l2) (<= r1 r2))
   ;; range2 fully included in range1
   (and (>= l2 l1) (<= r2 r1))))

(loop for (l1 r1 l2 r2) in (read-ranges)
      count (fully-contains? l1 r1 l2 r2))
