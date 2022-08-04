#lang sicp

(define (square x) (* x x))

(define (expmod base exp mod)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) mod)) mod))
        (else
         (remainder
            (* base (square (expmod base (/ (- exp 1) 2) mod)))
            mod)))
  )

(define (passes-fermat-test? a n)
  (= (expmod a n n) a))

(define (is-carmichael? p)
  (define (is-carmichael-iter? count)
    (cond ((= count p) #t)
          ((passes-fermat-test? count p)
           (is-carmichael-iter? (+ count 1)))
          (else #f)))
  (is-carmichael-iter? 1))

(is-carmichael? 6543)
(is-carmichael? 561)
(is-carmichael? 1105)
(is-carmichael? 13)

