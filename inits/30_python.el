(use-package python
  :mode ("\\.py" . python-mode)
  :config
  (setq lsp-pyls-plugins-pylint-enabled t)
  (setq lsp-pyls-plugins-pycodestyle-enabled nil)
  :hook
  (before-save . pyimport-remove-unused)
  (python-mode . (lambda ()
                   (hs-minor-mode 1)))
  (python-mode . lsp-deferred)
  (python-mode . flymake-python-pyflakes-load)
  )

;; django-mode
(use-package django-mode)

(use-package django-html-mode
  :mode
  (("\\.djhtml\\'" . django-html-mode))
  )
