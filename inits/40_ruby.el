(use-package ruby-mode
  :if (eq (ignore-minor-mode 'ignore-ruby-mode) nil)
  :mode
  (("\\Capfile\\'" . ruby-mode)
   ("\\Gemfile\\'" . ruby-mode)
   ("\\[Rr]akefile\\'" . ruby-mode)
   ("\\.rb\\'" . ruby-mode)
   ("\\.ru\\'" . ruby-mode)
   ("\\.rake\\'" . ruby-mode)
   ("\\.feature\\'" . ruby-mode)
   ("\\.jbuilder\\'" . ruby-mode))

  :config
  (setq ruby-insert-encoding-magic-comment nil)
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
  ;; flycheck is better than flymake in lsp-mode, so disable flymake.
  (setq lsp-prefer-flymake nil)
  :hook
  (ruby-mode . (lambda()
                 (add-to-list 'ac-sources 'ac-source-abbrev)))
  (ruby-mode . (lambda ()
                 (hs-minor-mode 1)))
  (ruby-mode . lsp-deferred)
  (ruby-mode . flycheck-mode)
  )


;;; rhtml-mode
(use-package rhtml-mode
  :if (eq (ignore-minor-mode 'ignore-ruby-mode) nil)
  :mode
  ("\\.ctp\\'" . rhtml-mode)
  ("\\.text.erb\\'" . rhtml-mode)
  ("\\.erb\\'" . rhtml-mode))

;; ruby-block
(use-package ruby-block
  :if (eq (ignore-minor-mode 'ignore-ruby-mode) nil)
  :config
  (setq ruby-block-highlight-toggle t)
  :hook
  (ruby-mode . ruby-block-mode)
  )

;; ruby-electric
(use-package ruby-electric
  :if (eq (ignore-minor-mode 'ignore-ruby-mode) nil)
  :hook
  (ruby-mode . (lambda () (ruby-electric-mode t))))

(use-package ruby-end
  :if (eq (ignore-minor-mode 'ignore-ruby-mode) nil)
  )

(use-package slim-mode
  :if (eq (ignore-minor-mode 'ignore-ruby-mode) nil)
  )
