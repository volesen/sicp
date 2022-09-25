#lang racket

(provide filter)
(provide flatmap)
(provide accumulate)
(provide enumerate-interval)

; List utilities from the book

(define (filter predicate sequence)
  (cond ((null? sequence) empty)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate 
                       (cdr sequence))))
        (else  (filter predicate 
                       (cdr sequence)))))

(define (map proc seq)
  (if (null? seq)
      empty
      (cons (proc (car seq)) (map proc (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append empty (map proc seq)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low 
            (enumerate-interval 
             (+ low 1) 
             high))))
