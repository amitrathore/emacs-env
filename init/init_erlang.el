(add-to-list 'load-path "/usr/local/Cellar/erlang/R14B/lib/erlang/lib/tools-2.6.6.1/emacs")
(add-to-list 'load-path (concat *EMACS-ENV* "/packages/distel-4.03/elisp"))

;; erlang-mode
(setq erlang-root-dir "/usr/local/Cellar/erlang/R14B")
(setq exec-path (cons "/usr/local/bin" exec-path))
(require 'erlang-start)

;; distel mode for Erlang
(require 'distel)
(distel-setup)
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))
