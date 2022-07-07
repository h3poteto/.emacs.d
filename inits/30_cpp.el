(use-package c++-mode
  :config
  (setq lsp-prefer-flymake nil)
  :hook
  (c++-mode . (lambda ()
               (hs-minor-mode 1)))
  (c++-mode . lsp)
  )
