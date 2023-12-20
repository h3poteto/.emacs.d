(use-package csv-mode
  :straight t
  :if (eq (ignore-minor-mode 'ignore-csv-mode) nil)
  :mode
  (("\\.[Cc][Ss][Vv]\\'" . csv-mode)))
