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
  (require 'dap-go)
  :bind
  ("C-z" . hydra-go-mode/body)
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


(defhydra hydra-go-mode (:hint nil :exit t)
"
^Main^
^^^^^^-----------------------------------------------------
_gf_: gofmt                    _gjs_: godef-jump
_gu_: go-remove-unused-imports _gjo_: godef-jump-other-window
_gga_: go-goto-arguments       _gd_: godef-describe
_ggd_: go-goto-docstring       _gr_: go-rename
_ggf_: go-goto-function
_ggr_: go-goto-return-values
"

("gf" gofmt)
("gu" go-remove-unused-imports)
("gga" go-goto-arguments)
("ggd" go-goto-docstring)
("ggf" go-goto-function)
("ggr" go-goto-return-values)

("gjs" godef-jump)
("gjo" godef-jump-other-window)
("gd" godef-describe)
("gr" go-rename)
  )
