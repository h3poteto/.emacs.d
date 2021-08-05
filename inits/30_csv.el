(el-get-bundle csv-mode)

(use-package csv-mode
  :ensure t
  :mode
  (("\\.[Cc][Ss][Vv]\\'" . csv-mode)))
