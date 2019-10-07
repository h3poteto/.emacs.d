;; elixir-mode
(use-package elixir-mode
  :config
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
  :hook
  (elixir-mode . ac-alchemist-setup)
  (elixir-mode . (lambda ()
                   (hs-minor-mode 1)))
  (elixir-mode . flycheck-mode)
  )

(use-package alchemist
  :after
  elixir-mode
  )

(use-package ac-alchemist
  :after
  elixir-mode
  )

(use-package flycheck-elixir
  :after
  elixir-mode
  )
