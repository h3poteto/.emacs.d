(use-package dockerfile-mode
  :straight t
  :if (eq (ignore-minor-mode 'ignore-dockerfile-mode) nil)
  :mode
  (("Dockerfile\\'" . dockerfile-mode)))

