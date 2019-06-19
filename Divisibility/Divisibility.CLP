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

(deffunction divisibility_by_three_aux (?x)
	(bind ?result 0)
	(while (> ?x 9)
		(while (> ?x 0)
			(bind ?result (+ ?result (mod ?x 10)))
			(bind ?x (div ?x 10))
		)
		(bind ?x ?result)
		(bind ?result 0)
    )
    (return ?x)
)

(defrule divisibility_by_three
   	(value ?x)
    (or
    	(test (= (divisibility_by_three_aux ?x) 3))
    	(test (= (divisibility_by_three_aux ?x) 6))
    	(test (= (divisibility_by_three_aux ?x) 9))
    )
   	=>
   	(printout t "Es divisible por 3" crlf)
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

(deffunction divisibility_by_eleven_aux (?x)
	(bind ?result 0)
	(bind ?count 0)
	(while (> ?x 0)
		(if (mod ?count 2)
		then
			(bind ?result (+ ?result (mod ?x 10)))
		else
			(bind ?result (- ?result (mod ?x 10)))
		)
		(bind ?count (+ ?count 1))
      	(bind ?x (div ?x 10))
    )
    (return ?result)
)

(defrule divisibility_by_eleven
   	(value ?x)
  	(test (= (divisibility_by_eleven_aux ?x) 0))
   	=>
   	(printout t "Es divisible por 11" crlf)
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