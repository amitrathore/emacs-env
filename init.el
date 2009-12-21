(setq *EMACS-ENV* "~/.emacs.d")

(load-file (concat *EMACS-ENV* "/user-setup.el"))

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(add-to-list 'load-path *EMACS-ENV*)
(add-to-list 'load-path (concat *EMACS-ENV* "/packages"))
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/clojure-mode"))
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/swank-clojure"))
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/slime"))

;; clojure-mode
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
(add-hook 'clojure-mode-hook             (lambda () (paredit-mode +1)))

;; slime
(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))))

(require 'slime)
(slime-setup)

;; ido-mode
(require 'ido)
(ido-mode t)

;; maxframe
(require 'maxframe)
(setq mf-max-width *MONITOR-WIDTH*)  ;; Pixel width of main monitor.
(add-hook 'window-setup-hook 'maximize-frame t)

;; ruby mode
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
 (autoload 'inf-ruby-keys "inf-ruby"
   "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (inf-ruby-keys)))

;; windmove
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

;; javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

;; load custom key-bindings
(load-file (concat *EMACS-ENV* "/custom/key_bindings.el"))