(el-get-bundle elixir-lang/emacs-elixir)
(el-get-bundle alchemist)
(el-get-bundle lbolla/emacs-flycheck-elixir
  :name flycheck-elixir)

(use-package elixir-mode
  :config
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
  :hook
  (elixir-mode . (lambda ()
                   (hs-minor-mode 1)))
  (elixir-mode . flycheck-mode)
  )

(use-package alchemist
  :after
  elixir-mode
  )

(use-package flycheck-elixir
  :after
  elixir-mode
  )
