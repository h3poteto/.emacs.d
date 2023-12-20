(use-package flymake-diagnostic-at-point
  :straight t
  :after flymake
  :config
  (add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode))
