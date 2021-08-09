(use-package dockerfile-mode
  :if (eq (ignore-minor-mode 'ignore-dockerfile-mode) nil)
  :mode
  (("Dockerfile\\'" . dockerfile-mode)))

