(use-package ruby-mode
  :straight t
  :if (eq (ignore-minor-mode 'ignore-ruby-mode) nil)
  :config
  (setq ruby-insert-encoding-magic-comment nil)
  :hook
  (ruby-mode . lsp-deferred)
  )

;; ruby-electric
(use-package ruby-electric
  :straight t
  :if (eq (ignore-minor-mode 'ignore-ruby-mode) nil)
  :hook
  (ruby-mode . (lambda () (ruby-electric-mode t))))
