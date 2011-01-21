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
(add-to-list 'load-path "/usr/local/Cellar/erlang/R14B/lib/erlang/lib/tools-2.6.6.1/emacs")
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/distel-4.03/elisp"))

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

;; load Color Theme
(load-file (concat *EMACS-ENV* "/packages/color-theme.el"))
(load-file (concat *EMACS-ENV* "/packages/color-theme-vibrant-ink.el"))

(require 'color-theme)

(eval-after-load "color-theme"
 '(progn
    (color-theme-calm-forest)))

(global-hl-line-mode)

;; ido-mode
(require 'ido)
(ido-mode t)

;;; save histories
 (savehist-mode 1)

;;; recent files
(require 'recentf)
(recentf-mode 1)

(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

;; tabs
(setq-default indent-tabs-mode nil)

;; desktop-save mode
(setq *foo-desktop-dir* (expand-file-name "~/.emacs.d/desktop"))
(setq desktop-dir *foo-desktop-dir*)
(setq desktop-path (list *foo-desktop-dir*))
(desktop-save-mode 1) ;; Switch on desktop.el
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)

(setq *foo-desktop-file* (concatenate 'string desktop-dir "/" desktop-base-file-name))
(setq *foo-desktop-lock* (concatenate 'string desktop-dir "/" desktop-base-lock-name))

(defun desktop-in-use-p ()
  (and (file-exists-p *foo-desktop-file*)
       (file-exists-p *foo-desktop-lock*)))

(defun autosave-desktop ()
  (if (desktop-in-use-p)
      (desktop-save-in-desktop-dir)))

;; Can be switched off with (cancel-timer *foo-desktop-saver-timer*)
(add-hook 'after-init-hook
	  (lambda ()
	    (setq *foo-desktop-saver-timer*
		  (run-with-timer 5 300 'autosave-desktop))))

;; winner-mode for window configuration management
(winner-mode 1)

;;; highlight-interactive mode
(global-hi-lock-mode 1)

;; save-point in file
(require 'saveplace)
(setq-default save-place t)

;; toggle split windows
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))
(define-key ctl-x-4-map "t" 'toggle-window-split)

;; layout restore
(require 'layout-restore)
(global-set-key [?\C-c ?l] 'layout-save-current)
(global-set-key [?\C-c ?\C-l ?\C-l] 'layout-restore)
(global-set-key [?\C-c ?\C-l ?\C-c] 'layout-delete-current)

;; maxframe
(require 'maxframe)
(setq mf-max-width *MONITOR-WIDTH*)  ;; Pixel width of main monitor.
(add-hook 'window-setup-hook 'maximize-frame t)

;; revive
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)

(define-key ctl-x-map "S" 'save-current-configuration)
(define-key ctl-x-map "F" 'resume)
(define-key ctl-x-map "K" 'wipe)

;; windmove
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

;; revert-all-buffers
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files"
  (interactive)
  (let* ((list (buffer-list))
         (buffer (car list)))
    (while buffer
      (when (buffer-file-name buffer)
        (progn
          (set-buffer buffer)
          (revert-buffer t t t)))
      (setq list (cdr list))
      (setq buffer (car list))))
  (message "Refreshing open files"))

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

;; javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

;; js-lint 
;; JSLINT_HOME needs to be set and be on the path
;;(require 'flymake-jslint)
;;(add-hook 'javascript-mode-hook
;;	  (lambda () 
;;	    (flymake-mode t)
;;	    (local-set-key [f8] 'flymake-display-err-menu-for-current-line)))

;;; moz-labs
(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)
(add-hook 'espresso-mode-hook 'espresso-custom-setup)
(defun espresso-custom-setup ()
  (moz-minor-mode 1))

;; erlang-mode
(setq erlang-root-dir "/usr/local/Cellar/erlang/R14B")
(setq exec-path (cons "/usr/local/bin" exec-path))
(require 'erlang-start)

;; distel mode for Erlang
(require 'distel)
(distel-setup)
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))

;; Haskell mode
(require 'haskell-mode)

;; SML mode
;(load "/usr/local/share/emacs/site-lisp/sml-mode/sml-mode-startup")

;; column-number-mode
(setq line-number-mode t)

;; y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; load custom key-bindings
(load-file (concat *EMACS-ENV* "/custom/key_bindings.el"))
(put 'narrow-to-region 'disabled nil)


;; load Color Theme
(load-file (concat *EMACS-ENV* "/packages/color-theme.el"))
(load-file (concat *EMACS-ENV* "/packages/color-theme-vibrant-ink/color-theme-vibrant-ink.el"))

(require 'color-theme)

(eval-after-load "color-theme"
  '(progn
     (color-theme-vibrant-ink)))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(show-paren-mode t)
 '(weblogger-config-alist (quote (("TechBehindTech" "http://techbehindtech.com/xmlrpc.php" "sivajag" "" "11954221")))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "white" :weight normal :height 140 :width normal)))))
