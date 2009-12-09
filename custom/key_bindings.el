;; slime
(define-key global-map [(control z)] 'slime-eval-buffer) 

;; truncating lines
(define-key global-map [(control \;)(m)(t)] 'toggle-truncate-lines)