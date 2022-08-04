#lang sicp

(define coeffs (list 1 1 2))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (accumulate op (op initial (car sequence)) (cdr sequence))))




(define (horner-eval x coeff-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ (* this-coeff x) higher-terms))
              0
              coeff-sequence))


(horner-eval 8 coeffs)