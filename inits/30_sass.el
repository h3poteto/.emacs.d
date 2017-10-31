;; sass-mode
(use-package sass-mode
  :ensure t
  :mode
  (("\\.scss\\" . sass-mode))
  :config
  (add-hook 'sass-mode-hook 'flycheck-mode)

