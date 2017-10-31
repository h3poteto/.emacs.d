;; yaml-mode
(when (require 'yaml-mode nil t)
  (add-to-list 'auto-mode-alist '("¥¥.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yml.production$". yaml-mode)))

;; flycheck
(add-hook 'yaml-mode-hook 'flycheck-mode)
