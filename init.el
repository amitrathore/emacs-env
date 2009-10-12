(setq *EMACS-ENV* "~/.emacs.d")

(load-file (concat *EMACS-ENV* "/user-setup.el"))

;; clojure stuff
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/clojure-mode"))
(require 'clojure-mode)
