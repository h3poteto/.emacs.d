;; css mode hook
;; この設定はcss-modeが読み込まれる前にする必要がある
(setq css-indent-offset 2)
(use-package css-mode
  :mode
  ("\\.scss\\'" . css-mode)
  :hook
  (css-mode . (lambda ()
                (hs-minor-mode 1))))

