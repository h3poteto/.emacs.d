(use-package markdown-mode
  :if (eq (ignore-minor-mode 'ignore-markdown-mode) nil)
  :mode
  ("\\.text\\'" . markdown-mode)
  ("\\.markdown\\'" . markdown-mode)
  ("\\.md\\'" . markdown-mode)
  :config
  (defun remove-markdown-key-hook ()
    (define-key markdown-mode-map (kbd "C-c <left>") nil)
    (define-key markdown-mode-map (kbd "C-c <right>") nil)
    )
  :hook
  (markdown-mode . remove-markdown-key-hook)
  )

(use-package markdown-preview-mode
  :if (eq (ignore-minor-mode 'ignore-markdown-mode) nil)
  :config
  (setq markdown-preview-stylesheets
        (list "https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/3.0.1/github-markdown.min.css"))
  )
