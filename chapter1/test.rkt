
(define eps 0.001)

(define (close-enough? x y) 
  (< (abs (- x y)) eps))

(define (interval f a b)
  (let ((midpoint (/ (+ a b) 2)))
        (if (close-enough? a b)
            midpoint
            (if (negative? (f midpoint))
                (interval f a midpoint)
                (interval f midpoint a)))))


(define (f x) (+ x 1))

(interval f -10.0 10.0)
(close-enough? 0 eps)
(close-enough? 0 (/ eps 2))