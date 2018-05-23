;; elixir-mode
(add-hook 'elixir-mode-hook 'ac-alchemist-setup)
(add-hook 'elixir-mode-hook #'smartparens-mode)
(add-hook 'elixir-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
