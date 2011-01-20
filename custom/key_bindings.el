;; code editing
(define-key global-map [(control \;)] 'comment-region)
(define-key global-map [(control \')] 'uncomment-region)

;; slime
(define-key global-map [(control z)] 'slime-eval-buffer) 
(global-set-key (kbd "C-c r") 'slime-restart-inferior-lisp) 

;; truncating lines
;; (define-key global-map [(control \;)(m)(t)] 'toggle-truncate-lines)

;; magit
(define-key global-map [(control meta g)] 'magit-status)
