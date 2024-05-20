(use-package cc-mode
  :straight t
  :if (eq (ignore-minor-mode 'ignore-c-mode) nil)
  :hook
  (cc-mode . lsp)
  (c++-mode . lsp)
  )
