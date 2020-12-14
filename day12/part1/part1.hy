;; pip install hy
;; hy part1.hy
(require [hy.contrib.walk [let]])

(setv facing 0)
(setv faces '(east south west north))
(setv p-north 0)
(setv p-east 0)
(with [f (open "input" "r")]
      (for [line f]
           (print "facing" (get faces facing))
           (print "position" p-north p-east)
           (let [line (.strip line)
                action (first line)
                amount (int (cut line 1))]
                (print "action" action "amount" amount)
                (cond [(= action "N") (setv p-north (+ p-north amount))]
                      [(= action "S") (setv p-north (- p-north amount))]
                      [(= action "E") (setv p-east (+ p-east amount))]
                      [(= action "W") (setv p-east (- p-east amount))]
                      [(= action "R") (setv facing (% (+ facing (int (/ amount 90))) 4))]
                      [(= action "L") (setv facing (% (- facing (int (/ amount 90))) 4))]
                      [(= action "F") (cond [(= facing 0) (setv p-east (+ p-east amount))]
                                            [(= facing 1) (setv p-north (- p-north amount))]
                                            [(= facing 2) (setv p-east (- p-east amount))]
                                            [(= facing 3) (setv p-north (+ p-north amount))])])
                )
           )
      )

(print "Distance" (+ (abs p-east) (abs p-north)))
