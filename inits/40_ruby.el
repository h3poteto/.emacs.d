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
;; projectile with hem
(setq projectile-completion-system 'helm)

;; ruby-mode
(use-package ruby-mode
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
  (setq ruby-insert-encoding-magic-comment nil))


;;; rhtml-mode
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))
(add-to-list 'auto-mode-alist '("\\.ctp\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.text.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))

;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; ruby-electric
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))
