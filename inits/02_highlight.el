;; highlight-indentation
(require 'highlight-indentation)
(setq highlight-indentation-offset 2)
(set-face-background 'highlight-indentation-face "#202020")
(set-face-background 'highlight-indentation-current-column-face "#303030")

(add-hook 'enh-ruby-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'scss-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'sass-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'yaml-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'web-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'highlight-indentation-mode-hook 'highlight-indentation-current-column-mode)

;; カーソル行をハイライト
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "gray20"))
    (((class color)
      (background light))
     (:background "ForestGreen"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
;; (setq hl-line-face 'underline) ; 下線
(global-hl-line-mode)
