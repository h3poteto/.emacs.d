(use-package coffee-mode
  :straight t
  :if (eq (ignore-minor-mode 'ignore-coffee-mode) nil)
  :mode
  ("\\.coffee.erb\\'" . coffee-mode)
  :config
  (custom-set-variables '(coffee-tab-width 2))
  (setq coffee-indent-tabs-mode nil))

