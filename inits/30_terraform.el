;; terraform
(use-package terraform-mode
  :hook
  (terraform-mode . terraform-format-on-save-mode)
  (terraform-mode-hook . smartparens-mode))
