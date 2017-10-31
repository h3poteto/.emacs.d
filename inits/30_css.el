;; css mode hook
(use-package css-mode
  :ensure t
  :config
  (setq css-indent-offset 2)
  (add-hook 'css-mode-hook 'flycheck-mode)
