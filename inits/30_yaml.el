;; yaml-mode
(use-package yaml-mode
  :mode
  (("\\.yml$" . yaml-mode)
   ("\\.yml.production$". yaml-mode))
  :config
  ;; flycheck
  (add-hook 'yaml-mode-hook 'flycheck-mode)  )

