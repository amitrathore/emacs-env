(setq *EMACS-ENV* "~/.emacs.d")

(require 'dired)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(load-file (concat *EMACS-ENV* "/user-setup.el"))

(add-to-list 'load-path *EMACS-ENV*)
(add-to-list 'load-path (concat *EMACS-ENV* "/packages"))
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/clojure-mode"))
;(add-to-list 'load-path (concat *EMACS-ENV* "/packages/swank-clojure"))
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/slime"))

(load-file (concat *EMACS-ENV* "/init/init_clojure.el"))
(load-file (concat *EMACS-ENV* "/init/init_ruby.el"))
(load-file (concat *EMACS-ENV* "/init/init_emacs.el"))
(load-file (concat *EMACS-ENV* "/init/init_javascript.el"))

(load-file (concat *EMACS-ENV* "/custom/key_bindings.el"))
(load-file (concat *EMACS-ENV* "/init/init_color.el"))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "white" :weight normal :height 140 :width normal)))))
