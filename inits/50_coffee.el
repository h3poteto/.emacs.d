;; coffee-mode
(add-to-list 'auto-mode-alist '("\\.coffee.erb\\'" . coffee-mode))
(custom-set-variables '(coffee-tab-width 2))
(setq coffee-indent-tabs-mode nil)

(add-hook 'coffee-mode-hook 'flycheck-mode)

