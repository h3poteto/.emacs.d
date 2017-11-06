;; go-mode
;; this mode demand gocode, godef and godoc in $GOPATH
(eval-after-load "go-mode" '(progn (require 'go-autocomplete)))
(add-hook 'go-mode-hook
          '(lambda()
             (setq c-basic-offset 4)
             (setq indent-tabs-mode t)
             (local-set-key (kbd "M-.") 'godef-jump)
             (local-set-key (kbd "C-c d") 'godoc)
             (go-eldoc-setup)
             (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)))
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook #'smartparens-mode)
