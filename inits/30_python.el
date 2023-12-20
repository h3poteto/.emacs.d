(use-package python
  :straight t
  :if (eq (ignore-minor-mode 'ignore-python-mode) nil)
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
  :straight t
  :if (eq (ignore-minor-mode 'ignore-python-mode) nil)
  :config
  (setq py-autopep8-options '("--max-line-length=140"))
  :hook
  (python-mode . py-autopep8-enable-on-save)
  )

(use-package py-isort
  :straight t
  :if (eq (ignore-minor-mode 'ignore-python-mode) nil)
  :hook
  (python-mode . (lambda () (add-hook 'before-save-hook 'py-isort-before-save)))
  )
