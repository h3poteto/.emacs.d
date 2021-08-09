(use-package terraform-mode
  :if (eq (ignore-minor-mode 'ignore-terraform-mode) nil)
  :hook
  (terraform-mode . terraform-format-on-save-mode))

(use-package company-terraform
  :if (eq (ignore-minor-mode 'ignore-terraform-mode) nil)
  :config
  (company-terraform-init))
