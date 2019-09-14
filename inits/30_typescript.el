(use-package typescript-mode
  :mode
  ("\\.ts\\'" . typescript-mode)
  :bind
  (
   ("M-/" . tide-references)
   )
  :hook
  ;; Now I use prettier so tide-format is unnecessary
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
  (typescript-mode . prettier-js-mode)
  (typescript-mode . (lambda ()
                       (hs-minor-mode 1)))
  ;; Now I don't use lsp-mode for typescript.
  ;; Because tide is better than lsp in some reasons:
  ;; 1. Can't customize indent-level.
  ;; 2. Can't resolve alias path, lile `@/some_package'
  ;; (typescript-mode . lsp-deferred)
  )
