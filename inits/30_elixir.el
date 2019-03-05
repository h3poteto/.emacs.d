;; elixir-mode
(use-package elixir-mode
  :hook
  (elixir-mode . ac-alchemist-setup)
  (elixir-mode . smartparens-mode)
  (elixir-mode . (lambda ()
               (hs-minor-mode 1))))

