(use-package elixir-mode
  :if (eq (ignore-minor-mode 'ignore-elixir-mode) nil)
  :config
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
  :hook
  (elixir-mode . (lambda ()
                   (hs-minor-mode 1)))
  (elixir-mode . flycheck-mode)
  )

(use-package alchemist
  :if (eq (ignore-minor-mode 'ignore-elixir-mode) nil)
  :after
  elixir-mode
  )

(use-package flycheck-elixir
  :if (eq (ignore-minor-mode 'ignore-elixir-mode) nil)
  :after
  elixir-mode
  )
