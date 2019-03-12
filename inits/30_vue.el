;; vue-mode
(use-package vue-mode
  :config
  (setq css-indent-offset 2)
  (setq js-switch-indent-offset 2)
  (setq js-indent-level 2)
  (setq js2-basic-offset 2)
  (setq mmm-submode-decoration-level 0)
  :hook
  (vue-mode . prettier-js-mode))
