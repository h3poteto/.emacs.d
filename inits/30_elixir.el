;; elixir-mode
(use-package elixir-mode
  :ensure t
  :config
  (add-hook 'elixir-mode-hook 'ac-alchemist-setup))
