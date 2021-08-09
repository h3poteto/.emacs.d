(use-package js2-mode
  :mode
  ("\\.js.erb$" . js2-mode)
  ("\\.js$" . js2-mode)
  :config
  ;; js-indent
  (setq js-indent-level 2)
  ;; flycheck is better than flymake in lsp-mode, so disable flymake.
  (setq lsp-prefer-flymake nil)
  ;; method-chain indent
  (advice-add 'js--multi-line-declaration-indentation :around (lambda (orig-fun &rest args) nil))
  (setq indent-tabs-mode nil)
  (setq my-js-mode-indent-num 2)
  (setq js2-basic-offset my-js-mode-indent-num)
  (setq js-switch-indent-offset my-js-mode-indent-num)
  (setq js2-include-browser-externs nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  (setq js2-highlight-external-variables nil)
  (setq js2-include-jslint-globals nil)
  :hook
  (js2-mode . prettier-js-mode)
  (js2-mode . (lambda ()
                (hs-minor-mode 1)))
  (js2-mode . lsp-deferred)
  (js2-mode . flycheck-mode)
  )

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
  :init
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
