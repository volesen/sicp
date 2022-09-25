#lang sicp

(#%require "utils.rkt")


(define empty-board nil)

(define (adjoin-position new-row k rest-of-queens)
  (let ((queen (cons new-row k)))
    (cons queen rest-of-queens)))

(define (check pos1 pos2)
  (let ((x1 (car pos1))
        (y1 (cdr pos1))
        (x2 (car pos2))
        (y2 (cdr pos2)))
    (not (or (= x1 x2)
             (= y1 y2)
             (= (abs (- x1 x2))
                (abs (- y1 y2)))))))

(define (all pred xs)
  (if (null? xs)
      #t
      (and (pred (car xs)) (all pred (cdr xs)))))

(define (safe? k positions) (all (lambda (pos) (check pos (car positions))) (cdr positions)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions) (safe? k positions))
                (flatmap (lambda (rest-of-queens) (map (lambda (new-row) (adjoin-position new-row k rest-of-queens))
                                                       (enumerate-interval 1 board-size)))
                         (queen-cols (- k 1))))))
  (queen-cols board-size))


(adjoin-position 4 3 (list (cons 1 1) (cons 2 3)))

(enumerate-interval 1 10)

(queens 4)

