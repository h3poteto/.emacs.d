(use-package terraform-mode
  :straight t
  :if (eq (ignore-minor-mode 'ignore-terraform-mode) nil)
  :hook
  (terraform-mode . terraform-format-on-save-mode))

(use-package company-terraform
  :straight t
  :if (eq (ignore-minor-mode 'ignore-terraform-mode) nil)
  :config
  (company-terraform-init))
