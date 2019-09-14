(use-package rust-mode
  :hook
  (rust-mode . (lambda ()
               (hs-minor-mode 1)))
  (rust-mode . lsp-deferred)
  (rust-mode . flycheck-mode)
  )
