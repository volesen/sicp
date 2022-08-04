#lang sicp

(define (sum a term b next)
  (define (iter a result)
    (if (> a b)
        result
        (iter
         (next a)
         (+ result (term a)))))
  (iter a 0))


(define (id x) x)
(define (inc x) (+ x 1))


(id 42)
(inc 69)
(sum 1 id 100 inc)