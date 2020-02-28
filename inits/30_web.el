;; web-mode
(use-package web-mode
  :mode
  (("\\.html.tpl\\'" . web-mode)
   ("\\.jsx\\'" . web-mode)
   ("\\.tsx\\'" . web-mode)
   ("\\.eex\\'" . web-mode)
   ("\\.scala.html\\'" . web-mode)
   ("\\.html\\'" . web-mode))
  :config
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-attr-indent-offset nil)
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-sql-indent-offset 2)
    (setq indent-tabs-mode nil)
    (setq tab-width 2))
  (add-hook 'web-mode-hook 'my-web-mode-hook)
  :hook
  (web-mode .
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode)
                )
              )
            )
  )

