;; go-mode
;; this mode demand gocode, godef and godoc in $GOPATH
(use-package go-mode
  :bind
  (:map go-mode-map
   ("M-." . godef-jump)
   ("C-c d" . godoc))
  :config
  (require 'go-autocomplete)
  (require 'go-eldoc)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (setq c-basic-offset 4)
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  :hook
  (before-save . gofmt-before-save)
  (go-mode . (lambda ()
               (hs-minor-mode 1)))
  (go-mode . (lambda ()

               (setq indent-tabs-mode t)))
  )
