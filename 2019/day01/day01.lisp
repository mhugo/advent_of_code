(defun read-masses ()
    (with-open-file (in "/home/hme/perso/lisp/aoc2019/day01/day01.txt")
      (loop for line = (read-line in nil)
            while line
            collect (parse-integer line))))

(defun fuel-for-mass (mass)
  (- (floor (/ mass 3.0)) 2))
 
(defun fuel-sum1 (masses)
  (reduce '+
          (loop for mass in masses
                collect (fuel-for-mass mass))))

(fuel-sum1 (read-masses))

(defun fuel-sum2 (masses)
  (loop for mass in masses
        collect (let ((f mass)) (loop do (progn (setf f (fuel-for-mass f))
                                      when (< f 0) return
                                      collect f)))))

(fuel-sum2 (read-masses))
                 
                                         
