(use-package rust-mode
  :straight t
  :if (eq (ignore-minor-mode 'ignore-rust-mode) nil)
  :custom rust-format-on-save t
  :config
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t)
  ;; We can use rls or rust-analyzer as lsp server.
  (setq lsp-rust-server 'rust-analyzer)
  :hook
  (rust-mode . (lambda ()
               (hs-minor-mode 1)))
  (rust-mode . lsp-deferred)
  )

(use-package cargo
  :straight t
  :if (eq (ignore-minor-mode 'ignore-rust-mode) nil)
  :hook
  (rust-mode . cargo-minor-mode)
  )
