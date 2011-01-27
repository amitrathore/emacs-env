;; erlang-mode
(setq erlang-root-dir "/usr/local/Cellar/erlang/R14B")
(setq exec-path (cons "/usr/local/bin" exec-path))
(require 'erlang-start)

;; distel mode for Erlang
(require 'distel)
(distel-setup)
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))
