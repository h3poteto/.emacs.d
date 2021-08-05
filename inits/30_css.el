(el-get-bundle less-css-mode)
(el-get-bundle sass-mode)

;; This line is required before load css-mode
(setq css-indent-offset 2)
(use-package css-mode
  :mode
  ("\\.scss\\'" . css-mode)
  :hook
  (css-mode . (lambda ()
                (hs-minor-mode 1))))

