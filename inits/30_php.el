(use-package php-mode
  :if (eq (ignore-minor-mode 'ignore-php-mode) nil)
  :mode
  ("\\.php$" . php-mode)
  :config
  (setq php-mode-force-pear t))



