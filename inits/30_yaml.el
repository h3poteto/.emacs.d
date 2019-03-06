;; yaml-mode
(use-package yaml-mode
  :mode
  (("\\.yml$" . yaml-mode)
   ("\\.yml.production$". yaml-mode))
  :hook
  (yaml-mode . (lambda ()
                 (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
  )
