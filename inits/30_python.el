(use-package python
  :mode ("\\.py" . python-mode)
  :hook
  (before-save . pyimport-remove-unused)
  (python-mode . (lambda ()
                   (hs-minor-mode 1)))
  (python-mode . lsp-deferred)
  )

;; django-mode
(use-package django-mode)

(use-package django-html-mode
  :mode
  (("\\.djhtml\\'" . django-html-mode))
  )

