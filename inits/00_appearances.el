(use-package monokai-theme
  :load-path "themes"
  :config (load-theme 'monokai t)
  )
(use-package spacemacs-common
  :load-path "themes"
  )
(use-package aanila-theme)

;; theme switch
(setq my-themes (list 'monokai 'spacemacs-light 'aanila))
(setq curr-theme my-themes)
(defun switch-theme ()
  "Cycle custom theme."
    (interactive)
    (disable-theme (car curr-theme))
    (setq curr-theme (cdr curr-theme))
    (if (null curr-theme) (setq curr-theme my-themes))
    (load-theme (car curr-theme) t)
    (message "%s" (car curr-theme)))
(global-set-key [f7] 'switch-theme)
(setq curr-theme my-themes)
(load-theme (car curr-theme) t)

;; カーソル位置の表示
(show-paren-mode t)
(column-number-mode t)

;; line number
(line-number-mode t)

;; line number
(global-linum-mode)

;; init window
(setq inhibit-startup-message t)

;; title full path
(setq frame-title-fomat "%f")

;; toggle line
(setq default-truncate-lines nil)

;; make window transparent
(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(80))))
(set-frame-parameter nil 'alpha 80)

;; whitespace
(use-package whitespace
  :config
  (setq whitespace-style '(face           ; faceで可視化
                           trailing       ; 行末
                           tabs           ; タブ
                           spaces         ; スペース
                           space-mark     ; 表示のマッピング
                           tab-mark
                           ))

  (setq whitespace-display-mappings
        '((space-mark ?\u3000 [?\u25a1])
          ;; WARNING: the mapping below has a problem.
          ;; When a TAB occupies exactly one column, it will display the
          ;; character ?\xBB at that column followed by a TAB which goes to
          ;; the next TAB column.
          ;; If this is a problem for you, please, comment the line below.
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

  ;; スペースは全角のみを可視化
  (setq whitespace-space-regexp "\\(\u3000+\\)")
  ;; 保存前に自動でクリーンアップ
  (setq whitespace-action '(auto-cleanup))

  (defvar my/bg-color "#232323")
  (set-face-attribute 'whitespace-trailing nil
                      :background my/bg-color
                      :foreground "DeepPink"
                      :underline t)
  (set-face-attribute 'whitespace-tab nil
                      :background my/bg-color
                      :foreground "LightSkyBlue")
  (set-face-attribute 'whitespace-space nil
                      :background my/bg-color
                      :foreground "GreenYellow"
                      :weight 'bold)
  (set-face-attribute 'whitespace-empty nil
                      :background my/bg-color))


(global-whitespace-mode 1)

;; smart-mode-line
(use-package smart-mode-line
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'dark)
  (sml/setup))

;; 1秒後自動ハイライトされるようになる
(setq highlight-symbol-idle-delay 1.0)
;; 自動ハイライトをしたいならば
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
;; ソースコードにおいてM-p/M-nでシンボル間を移動
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; 括弧の色を強調する設定
(use-package rainbow-delimiters
  :config
  (require 'cl-lib)
  (require 'color)
  (defun rainbow-delimiters-using-stronger-colors ()
    (interactive)
    (cl-loop
     for index from 1 to rainbow-delimiters-max-face-count
     do
     (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
       (cl-callf color-saturate-name (face-foreground face) 30))))
  :hook
  (emacs-startup . rainbow-delimiters-using-stronger-colors))


;; ツールバーを非表示にする
(tool-bar-mode 0)

;; スクロールバーを非表示にする
(scroll-bar-mode -1)

;; タイトルバーをカスタマイズ
(set-frame-parameter nil 'ns-appearance 'dark)
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; common indent
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq standard-indent 2)

;; タブ
(setq-default tab-width 4)
(setq default-tab-width 4)

;; Finderから開く際に新しいウィンドウを生成しない
(setq ns-pop-up-frames nil)


(use-package rainbow-mode
  :config
  (setq rainbow-html-colors t)
  (setq rainbow-x-colors t)
  (setq rainbow-latex-colors t)
  (setq rainbow-ansi-colors t)
  :hook
  (web-mode . rainbow-mode)
  (vue-mode . rainbow-mode)
  (css-mode . rainbow-mode)
  )

;; highlight-indentation
(use-package highlight-indentation
  :config
  (setq highlight-indentation-offset 2)
  (set-face-background 'highlight-indentation-face "#202020")
  (set-face-background 'highlight-indentation-current-column-face "#303030")

  (add-hook 'enh-ruby-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'scss-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'sass-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'yaml-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'web-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'go-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'typescript-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'vue-mode-hook 'highlight-indentation-current-column-mode)
  (add-hook 'elixir-mode-hook 'highlight-indentation-current-column-mode)
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
  ;; (setq hl-line-face 'hlline-face)
  ;; (setq hl-line-face 'underline) ; 下線
  (global-hl-line-mode))

(menu-bar-mode -1)
