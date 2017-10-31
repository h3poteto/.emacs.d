;; go-mode
;; this mode demand gocode, godef and godoc in $GOPATH
(use-package go-mode
  :ensure t
  :bind
  (("M-." . godef-jump)
   ("C-c d" . godoc))
  :config
  (progn (require 'go-autocomplete))
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq c-basic-offset 4)
  (setq indent-tabs-mode t))

