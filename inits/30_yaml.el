;; yaml-mode
(use-package yaml-mode
  :straight t
  :mode
  (("\\.yml$" . yaml-mode)
   ("\\.yml.production$". yaml-mode))
  :hook
  (yaml-mode . (lambda ()
                 (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
  (yaml-mode . flycheck-mode)
  )
