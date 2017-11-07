;; terraform
(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)
(add-hook 'terraform-mode-hook #'smartparens-mode)
