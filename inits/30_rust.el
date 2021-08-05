(el-get-bundle rust-mode)
(el-get-bundle racer-rust/emacs-racer)

(use-package rust-mode
  :config
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t)
  (use-package :racer-mode
    :hook
    (racer-mode . eldoc-mode)
    (racer-mode . company-mode)
    )
  :hook
  (rust-mode . (lambda ()
               (hs-minor-mode 1)))
  (rust-mode . lsp-deferred)
  (rust-mode . racer-mode)
  )
