;; ensime
(add-hook 'before-save-hook 'ensime-format-source)
(add-hook 'scala-mode-hook #'smartparens-mode)
