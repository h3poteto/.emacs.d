;; coffee-mode
(use-package coffee-mode
  :ensure t
  :mode
  (("\\.coffee.erb\\'" . coffee-mode))
  :config
  (custom-set-variables '(coffee-tab-width 2))
  (setq coffee-indent-tabs-mode nil)
  (add-hook 'coffee-mode-hook 'flycheck-mode)
