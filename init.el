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
(add-to-list 'load-path "/opt/local/lib/erlang/lib/tools-2.6.4/emacs")
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/distel-4.03/elisp"))

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
(require 'flymake-jslint)
(add-hook 'javascript-mode-hook
	  (lambda () 
	    (flymake-mode t)
	    (local-set-key [f8] 'flymake-display-err-menu-for-current-line)))


;; erlang-mode
(setq erlang-root-dir "/opt/local/lib/erlang")
(setq exec-path (cons "/opt/local/bin" exec-path))
(require 'erlang-start)

;; distel mode for Erlang
(require 'distel)
(distel-setup)

;; load custom key-bindings
(load-file (concat *EMACS-ENV* "/custom/key_bindings.el"))