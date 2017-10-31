;; sass-mode
(use-package scss-mode
  :ensure t
  :mode
  (("\\.scss\\" . scss-mode))
  :config
  (add-hook 'scss-mode-hook 'flycheck-mode)

