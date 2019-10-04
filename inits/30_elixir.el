;; elixir-mode
(use-package elixir-mode
  :hook
  (elixir-mode . ac-alchemist-setup)
  (elixir-mode . (lambda ()
                   (hs-minor-mode 1)))
  (elixir-mode . flycheck-mode)
  (before-save . elixir-format)
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
