(use-package python
  :mode ("\\.py" . python-mode)
  :config
  (setq lsp-pyls-plugins-pylint-enabled t)
  (setq lsp-pyls-plugins-pycodestyle-enabled nil)
  :hook
  (python-mode . (lambda () (add-hook 'before-save-hook 'pyimport-remove-unused)))
  (python-mode . (lambda ()
                   (hs-minor-mode 1)))
  (python-mode . lsp-deferred)
  (python-mode . flymake-python-pyflakes-load)
  )

(use-package py-autopep8
  :config
  (setq py-autopep8-options '("--max-line-length=140"))
  :hook
  (python-mode . py-autopep8-enable-on-save)
  )

(use-package py-isort
  :hook
  (python-mode . (lambda () (add-hook 'before-save-hook 'py-isort-before-save)))
  )
