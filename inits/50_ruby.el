;; 全体的にruby-modeを使う

;; autocomplete for ruby
(add-hook 'ruby-mode-hook '(lambda()
                             (add-to-list 'ac-sources 'ac-source-abbrev)))

;; hideshow for ruby
(let ((ruby-mode-hs-info
       '(ruby-mode
          "class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do"
          "end"
          "#"
          ruby-move-to-block
          nil)))
  (if (not (member ruby-mode-hs-info hs-special-modes-alist))
      (setq hs-special-modes-alist
            (cons ruby-mode-hs-info hs-special-modes-alist))))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))

;; Rinari
;;(global-rinari-mode)

;; projectile
(projectile-rails-global-mode)

;; ruby-mode
(use-package ruby-mode
  :ensure t
  :mode
  (("Capfile" . enh-ruby-mode)
   ("Gemfile\\" . enh-ruby-mode)
   ("[Rr]akefile" . enh-ruby-mode)
   ("\\.rb" . enh-ruby-mode)
   ("\\.ru" . enh-ruby-mode)
   ("\\.rake$" . enh-ruby-mode)
   ("\\.feature" . enh-ruby-mode)
   ("\\.jbuilder" . enh-ruby-mode))

  (setq ruby-insert-encoding-magic-comment nil)
  ;; flycheck
  (add-hook 'ruby-mode-hook 'flycheck-mode))


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
(add-hook 'ruby-mode-hook
  '(lambda ()
    (abbrev-mode 1)
    (electric-pair-mode t)
    (electric-indent-mode t)
    (electric-layout-mode t)))
