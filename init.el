;; set load path
(setq load-path(cons "~/.emacs.d/" load-path))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))



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
(setq default-truncate-lines t)
(global-set-key "\C-c\C-y" 'toggle-truncate-lines)

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

;; newline and indent
 (global-set-key "\C-m" 'newline-and-indent)


;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
;;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup) ;install-elisp.el

;; anything
(global-set-key (kbd "C-x b") 'anything)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start t)

;; yaml-mode
(when (require 'yaml-mode nil t)
  (add-to-list 'auto-mode-alist '("¥¥.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yml.production$". yaml-mode)))

;; php-mode
(require 'php-mode)

(setq php-mode-force-pear t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode ))


;; rinari
;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)
;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)
                ("[Rr]akefile" . ruby-mode)
                ("\\.rake$" . ruby-mode)
		("\\.feature" . ruby-mode))
                auto-mode-alist))

;;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))

;; scss
(require 'scss-mode )
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)


;; tabbar.el
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
 
(put 'upcase-region 'disabled nil)


;; coffee-mode
;;(add-to-list 'load-path "~/.emacs.d/coffee-mode")
(require 'coffee-mode )

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2)
 (setq coffee-tab-width 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))


;; 一括コメントアウト
(define-key global-map(kbd "C-c /") 'comment-or-uncomment-region)

;; 一括インデント
(define-key global-map(kbd "C-c ;") 'indent-region)

;; Finderから開く際に新しいウィンドウを生成しない
(setq ns-pop-up-frames nil)

;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; direx
(require 'direx)
(setq direx:leaf-icon "  "
      direx:open-icon "- "
      direx:closed-icon "+ ")
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)


;; js-indent
(setq js-indent-level 2)

;; jamp goto line
(global-set-key (kbd "C-x :") 'goto-line)
