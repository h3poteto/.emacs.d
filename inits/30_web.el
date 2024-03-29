(use-package web-mode
  :straight t
  :if (eq (ignore-minor-mode 'ignore-web-mode) nil)
  :mode
  (("\\.html.tpl\\'" . web-mode)
   ("\\.jsx\\'" . web-mode)
   ("\\.eex\\'" . web-mode)
   ("\\.scala.html\\'" . web-mode)
   ("\\.html\\'" . web-mode)
   ("\\.ts[x]?\\'" . web-mode))
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
  ;;(web-mode . prettier-js-mode)
  (web-mode .
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (lsp-deferred)
                (prettier-js-mode)
                )
              )
            )
  (web-mode .
            (lambda ()
              (when (string-equal "ts" (file-name-extension buffer-file-name))
                (prettier-js-mode)
                (lambda ()
                  (hs-minor-mode 1))
                (lsp-deferred)
                (flycheck-mode)
                (flycheck-add-mode 'typescript-tslint 'web-mode)
                )
              )
            )
  )

