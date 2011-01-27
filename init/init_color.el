;; load Color Theme
(load-file (concat *EMACS-ENV* "/packages/color-theme.el"))
(load-file (concat *EMACS-ENV* "/packages/color-theme-vibrant-ink.el"))

(require 'color-theme)

(eval-after-load "color-theme"
  '(progn
     (color-theme-vibrant-ink)))

