(require 'clojure-mode)

;; clojure-mode
(require 'clojure-mode)

;; swank-clojure
(add-to-list 'load-path (concat *FURTIVE-ROOT* "/lib/clojure/swank-clojure/src"))

(setq swank-clojure-jar-path (concat *FURTIVE-ROOT* "/lib/java/clojure-1.2.0.jar"))
(setq swank-clojure-classpath (list
                               (concat *FURTIVE-ROOT* "/lib/clojure/swank-clojure/src/")
                               (concat *FURTIVE-ROOT* "/lib/java/*")))
(load-file (concat *EMACS-ENV* "/custom/swank_paths.el")) ;;do this after the setq call above

(setq swank-clojure-jar-home (concat *FURTIVE-ROOT* "/lib/clojure/swank-clojure/lib/"))

(require 'swank-clojure)

;;; paredit
(require 'paredit)
(autoload 'paredit-mode "paredit"
      "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'clojure-mode-hook             (lambda () (paredit-mode +1)))

;; slime
(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))))

(require 'slime)
(slime-setup)

;(add-to-list 'slime-lisp-implementations '(sbcl ("sbcl")))