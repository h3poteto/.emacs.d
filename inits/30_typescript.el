(use-package typescript-mode
  :mode
  ("\\.ts\\'" . typescript-mode)
  :hook
  ;; (before-save . tide-format-before-save)
  (typescript-mode . (lambda ()
                       (setq typescript-indent-level 2)
                       (tide-setup)
                       (flycheck-mode +1)
                       ;;(setq flycheck-check-syntax-automatically '(save mode-enabled))
                       (eldoc-mode +1)
                       (tide-hl-identifier-mode +1)
                       ;; company is an optional dependency. You have to
                       ;; install it separately via package-install
                       ;; `M-x package-install [ret] company`
                       (company-mode +1)))
  )
