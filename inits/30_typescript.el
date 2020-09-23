(defun setup-tide-mode ()
  (interactive)
  (setq typescript-indent-level 2)
  (tide-setup)
  (flycheck-mode +1)
  ;;(setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1)
  )

(use-package typescript-mode
  :mode
  ("\\.ts\\'" . typescript-mode)
  :hook
  ;; Now I use prettier so tide-format is unnecessary
  ;; (before-save . tide-format-before-save)
  (typescript-mode . setup-tide-mode)
  (typescript-mode . prettier-js-mode)
  (typescript-mode . (lambda ()
                       (hs-minor-mode 1)))
  ;; Now I don't use lsp-mode for typescript.
  ;; Because tide is better than lsp in some reasons:
  ;; 1. Can't customize indent-level.
  ;; 2. Can't resolve alias path, lile `@/some_package'
  ;; (typescript-mode . lsp-deferred)
  :bind
  (:map typescript-mode-map
   ("C-z" . hydra-typescript-mode/body))
   :config
  (defhydra hydra-typescript-mode (:hint nil :exit t)
"
^Main^                      ^Symbol^
^^^^^^--------------------------------------------------------
_f_: tide-format              _r_: tide-rename-symbol      _D_: tide-jump-to-definition[M-.]
_M-r_: tide-restart-server    _R_: tide-references[M-/]    _B_: tide-jump-back[M-,]
"
("f" tide-format)
("M-r" tide-restart-server)

("r" tide-rename-symbol)
("D" tide-jump-to-definition)
("R" tide-references)
("B" tide-jump-back)

("z" nil "leave")
    )
  )
