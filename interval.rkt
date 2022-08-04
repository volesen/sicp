;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname interval) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#lang sicp

(define eps 0.001)

(define (close-enough? x y) 
  (< (abs (- x y)) eps))

(define (interval f a b)
  (let ((midpoint (/ (+ a b) 2)))
        (if (close-enough? a b)
            midpoint
            (if (negative? (f midpoint))
                (interval f midpoint b)
                (interval f a midpoint)))))


(define (f x) (+ x 1))

(interval f -10.0 10.0)
(close-enough? 0 eps)
(close-enough? 0 (/ eps 2))