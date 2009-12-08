(setq *EMACS-ENV* "~/.emacs.d")

(load-file (concat *EMACS-ENV* "/user-setup.el"))

;; clojure stuff
(add-to-list 'load-path *EMACS-ENV*)
(add-to-list 'load-path (concat *EMACS-ENV* "/packages"))
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/clojure-mode"))
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/swank-clojure"))
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/slime"))

;; clojure-mode
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/clojure-mode"))
(require 'clojure-mode)

;; swank-clojure
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/swank-clojure/src/emacs"))

(setq swank-clojure-jar-path (concat *EMACS-ENV* "/packages/clojure/clojure.jar"))
;      swank-clojure-extra-classpaths (list
;				        (concat *EMACS-ENV* "/packages/swank-clojure/src/main/clojure")
;                                       (concat *EMACS-ENV* "/packages/clojure-contrib/clojure-contrib.jar")))

(load-file (concat *EMACS-ENV* "/custom/swank_paths.el"))
(require 'swank-clojure-autoload)

;;; paredit
(require 'paredit)
(autoload 'paredit-mode "paredit"
      "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))

;; slime
(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))))

(add-to-list 'load-path (concat *EMACS-ENV*"/packages/slime"))
(require 'slime)
(slime-setup)


;;ido-mode
(require 'ido)
(ido-mode t)