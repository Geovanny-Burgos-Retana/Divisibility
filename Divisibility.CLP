(defrule divisibility_by_two
	(value ?x)
	(or 
		(test (= 0 (mod ?x 10)))
		(test (= 2 (mod ?x 10)))
		(test (= 4 (mod ?x 10)))
		(test (= 6 (mod ?x 10)))
		(test (= 8 (mod ?x 10)))
	)
    =>
    (printout t "Es divisible por 2" crlf)
)

(defrule divisibility_by_five
	(value ?x)
	(or 
		(test (= 0 (mod ?x 10)))
		(test (= 5 (mod ?x 10)))
	)
    =>
    (printout t "Es divisible por 5" crlf)
)

(deffunction divisibility_by_seven_aux (?x)
	(while (> ?x 9)
      	(bind ?x (- (div ?x 10) (* 2 (mod ?x 10))))
    )
    (return ?x)
)

(defrule divisibility_by_seven
   	(value ?x)
    (or
    	(test (= (divisibility_by_seven_aux ?x) 7))
    	(test (= (divisibility_by_seven_aux ?x) -7))
    	(test (= (divisibility_by_seven_aux ?x)	0))
    )
   	=>
   	(printout t "Es divisible por 7" crlf)
)

(deffunction divisibility_by_thirteen_aux (?x)
	(while (> ?x -78)
		(if (or 
				(= ?x 0)
				(= (abs ?x) 13)
				(= (abs ?x) 26)
				(= (abs ?x) 39)
				(= (abs ?x) 52)
				(= (abs ?x) 65)
				(= (abs ?x) 78)
			)
		then
			(return (abs ?x))
		)
      	(bind ?x (- (div ?x 10) (* 9 (mod ?x 10))))
    )
    (return ?x)
)

(defrule divisibility_by_thirteen
   	(value ?x)
    (or
    	(test (= (divisibility_by_thirteen_aux ?x) 0))
    	(test (= (divisibility_by_thirteen_aux ?x) 13))
    	(test (= (divisibility_by_thirteen_aux ?x) 26))
    	(test (= (divisibility_by_thirteen_aux ?x) 39))
    	(test (= (divisibility_by_thirteen_aux ?x) 52))
    	(test (= (divisibility_by_thirteen_aux ?x) 65))
    	(test (= (divisibility_by_thirteen_aux ?x) 78))
    )
   	=>
   	(printout t "Es divisible por 13" crlf)
)