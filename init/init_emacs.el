;; load Color Theme
(load-file (concat *EMACS-ENV* "/packages/color-theme.el"))
(load-file (concat *EMACS-ENV* "/packages/color-theme-vibrant-ink.el"))

(setq magit-revert-item-confirm t)

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

;; column-number-mode
(setq line-number-mode t)

;; y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

(put 'narrow-to-region 'disabled nil)