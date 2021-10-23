(use-package elixir-mode
  :if (eq (ignore-minor-mode 'ignore-elixir-mode) nil)
  :init
  (add-to-list 'exec-path (locate-user-emacs-file ".elixir-ls"))
  :config
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
  (setq lsp-elixir-dialyzer-enabled nil)
  :hook
  (elixir-mode . (lambda ()
                   (hs-minor-mode 1)))
  (elixir-mode . flycheck-mode)
  (elixir-mode . lsp)
  )

(use-package flycheck-elixir
  :if (eq (ignore-minor-mode 'ignore-elixir-mode) nil)
  :after
  elixir-mode
  )
