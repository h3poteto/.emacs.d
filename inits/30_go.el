(use-package go-mode
  :config
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq gofmt-command "goimports")
  :hook
  (before-save . gofmt-before-save)
  (go-mode . (lambda ()
               (hs-minor-mode 1)))
  (go-mode . (lambda ()

               (setq indent-tabs-mode t)))
  (go-mode . lsp-deferred)
  )


