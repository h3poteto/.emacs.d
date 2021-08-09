(use-package coffee-mode
  :mode
  ("\\.coffee.erb\\'" . coffee-mode)
  :config
  (custom-set-variables '(coffee-tab-width 2))
  (setq coffee-indent-tabs-mode nil))

