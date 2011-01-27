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

