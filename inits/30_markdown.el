(use-package markdown-mode
  :if (eq (ignore-minor-mode 'ignore-markdown-mode) nil)
  :mode
  ("\\.text\\'" . markdown-mode)
  ("\\.markdown\\'" . markdown-mode)
  ("\\.md\\'" . markdown-mode))
