;; 全体的にenh-ruby-modeを使う

;; autocomplete for ruby
(add-hook 'enh-ruby-mode-hook '(lambda()
                                 (add-to-list 'ac-sources 'ac-source-abbrev)))

;; hideshow for ruby
(let ((ruby-mode-hs-info
       '(enh-ruby-mode
          "class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do"
          "end"
          "#"
          ruby-move-to-block
          nil)))
  (if (not (member ruby-mode-hs-info hs-special-modes-alist))
      (setq hs-special-modes-alist
            (cons ruby-mode-hs-info hs-special-modes-alist))))
(add-hook 'enh-ruby-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))

;; ruby
;; rinari
;; Interactively Do Things (highly recommended, but not strictly required)
(ido-mode t)
;; Rinari
(global-rinari-mode)


;; enh-ruby-mode
; (autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
; (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
; (use-package enh-ruby-mode
;              :ensure t
;              :mode
;              (("Capfile" . enh-ruby-mode)
;               ("Gemfile\\" . enh-ruby-mode)
;               ("[Rr]akefile" . enh-ruby-mode)
;               ("\\.rb" . enh-ruby-mode)
;               ("\\.ru" . enh-ruby-mode)
;               ("\\.rake$" . enh-ruby-mode)
;               ("\\.feature" . enh-ruby-mode)
;               ("\\.jbuilder" . enh-ruby-mode))

;              :config
;              (use-package smartparens-ruby :ensure smartparens)
;              (use-package inf-ruby)

;              (setq enh-ruby-add-encoding-comment-on-save nil
;                    enh-ruby-deep-indent-paren nil
;                    enh-ruby-hanging-brace-indent-level 2
;                    ruby-insert-encoding-magic-comment nil)

;              (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode)))


;;; rhtml-mode
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))
(add-to-list 'auto-mode-alist '("\\.ctp\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.text.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))

;; ruby-block
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; ruby-end
(add-hook 'enh-ruby-mode-hook
  '(lambda ()
    (abbrev-mode 1)
    (electric-pair-mode t)
    (electric-indent-mode t)
    (electric-layout-mode t)))

;; flycheck
(add-hook 'enh-ruby-mode-hook 'flycheck-mode)
