;;; init setting

;; set load path
;;(setq load-path(cons "~/.emacs.d/" load-path))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))
(let ((default-directory (expand-file-name "~/.emacs.d/vendor")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;; set editorconfig
(add-to-list 'load-path "~/.emacs.d/editorconfig-emacs/")
(load "editorconfig")

;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
;;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup) ;install-elisp.el

;; package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;;(require 'melpa)


;; encoding
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

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

;; newline and indent
(setq indent-line-function 'indent-relative-maybe)
(global-set-key "\C-m" 'newline-and-indent)

;; delete whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; anything
(global-set-key (kbd "C-x b") 'anything)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start t)


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



;; 一括コメントアウト
(define-key global-map(kbd "C-c :") 'comment-or-uncomment-region)

;; 一括インデント
(define-key global-map(kbd "C-c i") 'indent-region)

;; バックスラッシュ
(define-key global-map [?¥] [?\\])

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


;; grep-edit
(require 'grep-edit)

;; fiplr
(require 'fiplr)
(setq fiplr-root-markers '(".git" ".svn"))
(setq fiplr-ignored-globs '((directories (".git" ".svn" "vendor" "tmp" "uploaded_files" "log" "./public"))
                            (files ("*~" ".*" "*.jpg" "*.png" "*.gif" "*.zip" "*.DS_Store"))))
(global-set-key (kbd "C-x f") 'fiplr-find-file)
(global-set-key (kbd "C-x c") 'fiplr-clear-cache)

;;file-info
(defun file-info () "
カレントバッファのファイル情報を表示する。"
  (interactive)
  (if (buffer-file-name (current-buffer))
      (progn
        (let* ((file-name (buffer-file-name (current-buffer)))
               (f-attr (file-attributes file-name))
               (a-time (nth 4 f-attr))  ; 最終アクセス時刻
               (m-time (nth 5 f-attr))  ; 最終修正時刻
               (f-size (nth 7 f-attr))  ; ファイルサイズ
               (f-mode (nth 8 f-attr))  ; ファイル属性
               (mes1 (format "ファイルパス:   %s\n" file-name))
               (mes2 (format "最終参照時刻:   %s\n"
                              (format-time-string
                               "%Y-%m-%d %H:%M:%S" a-time)))
               (mes3 (format "最終修正時刻:   %s\n"
                              (format-time-string
                               "%Y-%m-%d %H:%M:%S" m-time)))
               (mes4 (format "ファイルサイズ: %s byte\n" f-size))
               (mes5 (format "ファイル属性:   %s" f-mode))
               (mess (concat mes1 mes2 mes3 mes4 mes5)))
          (message "%s" mess)))
    nil ))

(global-set-key "\C-ci" 'file-info)

;; tramp
(defun reopen-with-sudo ()
  "Reopen current buffer-file with sudo using tramp."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if file-name
        (find-alternate-file (concat "/sudo::" file-name))
      (error "Cannot get a file name"))))

(require 'exec-path-from-shell)
;;(when (memq window-system '(mac ns))
(exec-path-from-shell-initialize)

;; jamp goto line
(global-set-key (kbd "C-x :") 'goto-line)

;; common indent
(setq-default indent-tabs-mode nil)

;; Warning の抑制
(setq large-file-warning-threshold nil)

;; find
(global-set-key "\C-x\C-f" 'find-name-dired)


;; タブ、全角スペースのハイライト
(defface my-face-r-1 '((t (:background "gray15"))) nil)
(defface my-face-b-1 '((t (:background "gray"))) nil)
(defface my-face-b-2 '((t (:background "gray26"))) nil)
(defface my-face-u-1 '((t (:foreground "red" :underline t))) nil)
(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode())
  (font-lock-add-keywords
   major-mode
   '(
     ("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-2 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     (" [\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; highlight-indentation
(require 'highlight-indentation)
(setq highlight-indentation-offset 2)
(set-face-background 'highlight-indentation-face "#202020")
(set-face-background 'highlight-indentation-current-column-face "#303030")

(add-hook 'enh-ruby-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'scss-mode-hook 'highlight-indentation-current-column-mode)
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


;; hideshow
(let ((ruby-mode-hs-info
       '(enh-ruby-mode
          "class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do"
          "end"
          "#"
          ruby-move-to-block
          nil)))
  (if (not (member ruby-mode-hs-info hs-special-modes-alist))
      (setq hs-special-modes-alist
            (cons ruby-mode-hs-info hs-special-modes-alist))))
(add-hook 'enh-ruby-mode-hook
          '(lambda ()
             (hs-minor-mode 1)))


;; magit
(require 'magit)
 (setq magit-last-seen-setup-instructions "1.4.0")

; ag
(setq default-process-coding-system 'utf-8-unix)  ; ag 検索結果のエンコード指定
(require 'ag)
(setq ag-highlight-search t)  ; 検索キーワードをハイライト
(setq ag-reuse-buffers t)     ; 検索用バッファを使い回す (検索ごとに新バッファを作らない)

; wgrep
(add-hook 'ag-mode-hook '(lambda ()
                           (require 'wgrep-ag)
                           (setq wgrep-auto-save-buffer t)  ; 編集完了と同時に保存
                           (setq wgrep-enable-key "r")      ; "r" キーで編集モードに
                           (wgrep-ag-setup)))






;;;; each languages mode

;; yaml-mode
(when (require 'yaml-mode nil t)
  (add-to-list 'auto-mode-alist '("¥¥.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yml.production$". yaml-mode)))

;; php-mode
(require 'php-mode)

(setq php-mode-force-pear t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode ))



;; ruby
;; rinari
;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)
;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)
(global-rinari-mode)

(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(setq auto-mode-alist
      (append '(("\\.rb$" . enh-ruby-mode)
                ("[Rr]akefile" . enh-ruby-mode)
                ("\\.rake$" . enh-ruby-mode)
                ("\\.feature" . enh-ruby-mode)
                ("\\.jbuilder" . enh-ruby-mode))
                auto-mode-alist))

;;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))
(add-to-list 'auto-mode-alist '("\\.ctp\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.text.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))


;;; slim mode
(require 'slim-mode)

;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; ruby-electric
(require 'ruby-electric)
(add-hook 'enh-ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; ruby settings
(setq enh-ruby-deep-indent-paren nil)
;; (setq ruby-deep-indent-paren-style nil)
;; (defadvice ruby-indent-line (after unindent-closing-paren activate)
;;   (let ((column (current-column))
;;         indent offset)
;;     (save-excursion
;;       (back-to-indentation)
;;       (let ((state (syntax-ppss)))
;;         (setq offset (- column (current-column)))
;;         (when (and (eq (char-after) ?\))
;;                    (not (zerop (car state))))
;;           (goto-char (cadr state))
;;           (setq indent (current-indentation)))))
;;     (when indent
;;       (indent-line-to indent)
;;       (when (> offset 0) (forward-char offset)))))

;; enh-ruby
;; 保存時にmagic commentを追加しないようにする
(defadvice enh-ruby-mode-set-encoding (around stop-enh-ruby-mode-set-encoding)
  "If enh-ruby-not-insert-magic-comment is true, stops enh-ruby-mode-set-encoding."
  (if (and (boundp 'enh-ruby-not-insert-magic-comment)
           (not enh-ruby-not-insert-magic-comment))
      ad-do-it))
(ad-activate 'enh-ruby-mode-set-encoding)
(setq-default enh-ruby-not-insert-magic-comment t)


(ac-config-default)
(add-to-list 'ac-modes 'enh-ruby-mode)



;; scss-mode
(require 'scss-mode )
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)
(defun scss-custom ()
  "scss-mode-hook"
  (and
   (set (make-local-variable 'css-indent-offset) 2)
   (set (make-local-variable 'scss-compile-at-save) nil)
   )
  )
(add-hook 'scss-mode-hook
  '(lambda() (scss-custom)))


;; coffee-mode
(require 'coffee-mode )
(add-to-list 'auto-mode-alist '("\\.coffee.erb\\'" . coffee-mode))
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2)
 (setq coffee-tab-width 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))


;; css mode hook
(add-hook 'css-mode-hook
          (lambda ()
            (setq css-indent-offset 2)
            ))


;; js-indent
(setq js-indent-level 2)


;; less-css-mode
(require 'less-mode)


;; js2-mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js.erb$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; csv-mode
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
   "Major mode for editing comma-separated value files." t)


;; twittering-mode
(add-to-list 'load-path "~/.emacs.d/twittering-mode")
(require 'twittering-mode)


;; markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))






;;;; check

;; flycheck
;;(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'enh-ruby-mode-hook 'flycheck-mode)
(add-hook 'php-mode-hook 'flycheck-mode)
(add-hook 'coffee-mode-hook 'flycheck-mode)
(add-hook 'js2-mode-hook 'flycheck-mode)
(add-hook 'scss-mode-hook 'flycheck-mode)
(add-hook 'css-mode-hook 'flycheck-mode)
(add-hook 'yaml-mode-hook 'flycheck-mode)
;;(add-hook 'html-mode-hook 'flycheck-mode)

(require 'flycheck-color-mode-line)

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
