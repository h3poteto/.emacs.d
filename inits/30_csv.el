(use-package csv-mode
  :if (eq (ignore-minor-mode 'ignore-csv-mode) nil)
  :mode
  (("\\.[Cc][Ss][Vv]\\'" . csv-mode)))
