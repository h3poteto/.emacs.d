;; coffee-mode
(add-to-list 'auto-mode-alist '("\\.coffee.erb\\'" . coffee-mode))
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2)
 (setq coffee-tab-width 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;; flycheck
(add-hook 'coffee-mode-hook 'flycheck-mode)
