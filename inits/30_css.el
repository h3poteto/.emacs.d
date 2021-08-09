;; This line is required before load css-mode
(setq css-indent-offset 2)
(use-package css-mode
  :if (eq (ignore-minor-mode 'ignore-css-mode) nil)
  :mode
  ("\\.scss\\'" . css-mode)
  :hook
  (css-mode . (lambda ()
                (hs-minor-mode 1))))

