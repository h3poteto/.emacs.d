;; (use-package alect-themes
;;   :load-path "themes"
;;   :config (load-theme 'alect-dark-alt t))
;; (use-package spacemacs-common
;;   :load-path "themes"
;;   :config
;;   (setq spacemacs-theme-comment-bg nil)
;;   (load-theme 'spacemacs-dark t)
;;  )

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
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)


;; color setting
;; seto window status
(if window-system (progn
;; (setq initial-frame-alist '((width . 80)(height . 45)(top . 0)(left . 0)))
 (set-background-color "Black")
 (set-foreground-color "White")
 (set-cursor-color "Gray")
 ))

;; make window transparent
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
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'dark)
(sml/setup)

;; 1秒後自動ハイライトされるようになる
(setq highlight-symbol-idle-delay 1.0)
;; 自動ハイライトをしたいならば
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
;; ソースコードにおいてM-p/M-nでシンボル間を移動
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; 括弧の色を強調する設定
(require 'cl-lib)
(require 'color)
(defun rainbow-delimiters-using-stronger-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
    (cl-callf color-saturate-name (face-foreground face) 30))))
(add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors)

;; ツールバーを非表示にする
(tool-bar-mode 0)

;; タイトルバーをカスタマイズ
(set-frame-parameter nil 'ns-appearance 'dark)
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; common indent
(setq-default indent-tabs-mode nil)

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
  (global-hl-line-mode))


;;------------------------------------------
;; tabbar
;;------------------------------------------
(require 'tabbar)
(tabbar-mode 1)
;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)
;; グループ化しない
(setq tabbar-buffer-groups-function nil)
;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))
;; ウインドウからはみ出たタブを省略して表示
(setq tabbar-auto-scroll-flag nil)
(setq tabbar-use-images nil)
;; タブとタブの間の長さ
(setq tabbar-separator '(1.5))

;; 外観変更
(set-face-attribute
 'tabbar-default nil
 :family "Comic Sans MS"
 :background "black"
 :foreground "gray72"
 :height 1.0)
(set-face-attribute
 'tabbar-unselected nil
 :background "black"
 :foreground "grey72"
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background "black"
 :foreground "#c82829"
 :box nil)
(set-face-attribute
 'tabbar-button nil
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :height 1.2)

;; タブに表示させるバッファの設定
(defvar my-tabbar-displayed-buffers
 '("scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
  "*Regexps matches buffer names always included tabs.")
(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; タブ移動キーバインド
(global-set-key (kbd "<M-right>") 'tabbar-forward-tab)
(global-set-key (kbd "<M-left>") 'tabbar-backward-tab)

;; タブモードのオン/オフをトグル
(global-set-key (kbd "M-4") 'tabbar-mode)
