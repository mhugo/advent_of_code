(defun read-ranges ()
  (with-open-file (in "/home/hme/perso/lisp/aoc2022/day04/input.txt")
    (loop for line = (read-line in nil)
          while line
          collect
          ;; format of each line:
          ;; <L1>-<R1>,<L2>-<R2> with L1,L2,R1,R2 integers
          (let* ((ll1 (multiple-value-list (parse-integer line :start 0 :junk-allowed t)))
                    (l1 (first ll1))
                    (i1 (second ll1))
                    (rr1 (multiple-value-list (parse-integer line :start (1+ i1) :junk-allowed t)))
                    (r1 (first rr1))
                    (i2 (second rr1))
                    (ll2 (multiple-value-list (parse-integer line :start (1+ i2) :junk-allowed t)))
                    (l2 (first ll2))
                    (i3 (second ll2))
                    (r2 (parse-integer line :start (1+ i3) :junk-allowed t)))
               (list l1 r1 l2 r2)))))


(defun fully-contains? (l1 r1 l2 r2)
  (or
   ;; range1 fully included in range2
   (and (>= l1 l2) (<= r1 r2))
   ;; range2 fully included in range1
   (and (>= l2 l1) (<= r2 r1))))

(loop for (l1 r1 l2 r2) in (read-ranges)
      count (fully-contains? l1 r1 l2 r2))
