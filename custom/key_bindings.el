;; code editing
(define-key global-map [(control \;)] 'comment-region)
(define-key global-map [(control \')] 'uncomment-region)

;; slime
(define-key global-map [(control z)] 'slime-eval-buffer) 

;; truncating lines
;; (define-key global-map [(control \;)(m)(t)] 'toggle-truncate-lines)

;; magit
(define-key global-map [(control meta g)] 'magit-status)