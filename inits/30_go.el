(use-package go-mode
  :commands go-mode
  :config
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq gofmt-command "goimports")
  (define-key go-mode-map (kbd "C-c C-k") 'go-fill-struct)
  ;; flycheck is better than flymake in lsp-mode, so disable flymake.
  (setq lsp-prefer-flymake nil)
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))
  ;; (add-hook 'go-mode-hook #'lsp)  ;; lsp-mode
  :hook
  (go-mode . (lambda () (add-hook 'before-save-hook 'gofmt-before-save)))
  (go-mode . (lambda ()
               (hs-minor-mode 1)))
  (go-mode . (lambda ()
               (setq indent-tabs-mode t)))
  (go-mode . lsp)
  (go-mode . flycheck-mode)
  )

(use-package go-fill-struct)
