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
(require 'ido)
(ido-mode t)
;; Rinari
(require 'rinari)
(global-rinari-mode)

;; enh-ruby-mode
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(setq auto-mode-alist
      (append '(("\\.rb$" . enh-ruby-mode)
                ("[Rr]akefile" . enh-ruby-mode)
                ("\\.rake$" . enh-ruby-mode)
                ("\\.feature" . enh-ruby-mode)
                ("\\.jbuilder" . enh-ruby-mode))
                auto-mode-alist))

;;; rhtml-mode
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))
(add-to-list 'auto-mode-alist '("\\.ctp\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.text.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))


;;; slim mode
(require 'slim-mode)

;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; ruby-end
(require 'ruby-end)
(add-hook 'enh-ruby-mode-hook
  '(lambda ()
    (abbrev-mode 1)
    (electric-pair-mode t)
    (electric-indent-mode t)
    (electric-layout-mode t)))

;; ruby settings
(setq enh-ruby-deep-indent-paren nil)

;; enh-ruby
;; 保存時にmagic commentを追加しないようにする
(defadvice enh-ruby-mode-set-encoding (around stop-enh-ruby-mode-set-encoding)
  "If enh-ruby-not-insert-magic-comment is true, stops enh-ruby-mode-set-encoding."
  (if (and (boundp 'enh-ruby-not-insert-magic-comment)
           (not enh-ruby-not-insert-magic-comment))
      ad-do-it))
(ad-activate 'enh-ruby-mode-set-encoding)
(setq-default enh-ruby-not-insert-magic-comment t)


;;(ac-config-default)
;;(add-to-list 'ac-modes 'enh-ruby-mode)


;; flycheck
(add-hook 'enh-ruby-mode-hook 'flycheck-mode)
