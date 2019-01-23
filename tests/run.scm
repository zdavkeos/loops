(require-library loops simple-tests)
(import loops simple-tests)

(define-test (do-times?)
  (equal?
   (let ((lst '()))
     (do-times i (+ 2 3)
               (set! lst (cons i lst)))
     lst)
   '(4 3 2 1 0)))

(define-test (do-list?)
  (equal?
   (let ((lst '()))
     (do-list i '(1 2 3)
              (set! lst (cons i lst)))
     lst)
   '(3 2 1)))

(define-test (do-for?)
  (equal?
   (let ((lst '()))
     (do-for i (1 5) (set! lst (cons i lst)))
     (reverse lst))
   '(1 2 3 4))
  (equal?
   (let ((lst '()))
     (do-for i (1 65 i) (set! lst (cons i lst)))
     (reverse lst))
   '(1 2 4 8 16 32 64)))

(define-test (do-while?)
  (equal?
   (let ((n 4) (lst '()))
     (do-while (<= 0 n)
               (set! lst (cons n lst))
               (set! n (- n 1)))
     lst)
   '(0 1 2 3 4)))

(define-test (do-until?)
  (equal?
   (let ((n 4) (lst '()))
     (do-until (> 0 n)
               (set! lst (cons n lst))
               (set! n (- n 1)))
     lst)
   '(0 1 2 3 4)))

(define-test (do-forever?)
  (equal?
   (let ((n 3) (lst '()))
     (do-forever
      (if (zero? n) (exit lst))
      (set! lst (cons 'a lst))
      (set! n (- n 1))))
   '(a a a)))

(define-test (loops?)
  (do-times?)
  (do-list?)
  (do-for?)
  (do-while?)
  (do-until?)
  (do-forever?))

(compound-test (LOOPS)
  (loops?))
