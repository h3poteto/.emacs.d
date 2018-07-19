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
 ;(setq initial-frame-alist '((width . 80)(height . 45)(top . 0)(left . 0)))
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

;; sky-color-clock
;; (require 'sky-color-clock)
;; (sky-color-clock-initialize 35) ;; 東京の緯度で初期化
;; (setq sky-color-clock-format "%m/%d %H:%M")
;; (setq global-mode-string (append global-mode-string '(:eval (sky-color-clock)))) ;; global-mode-stringに追加

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
