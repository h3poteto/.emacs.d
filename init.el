;;; init setting
(require 'cask "~/.emacs.d/.cask/cask.el")
(cask-initialize)


;; set editorconfig
(add-to-list 'load-path "~/.emacs.d/editorconfig-emacs/")
(load "editorconfig")


;; package.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;;(require 'melpa)


;; encoding
(prefer-coding-system 'utf-8)

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

(delete-selection-mode t)

;; backspace
(keyboard-translate ?\C-h ?\C-?)

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

(require 'whitespace)
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

(global-whitespace-mode 1)

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
                    :background my/bg-color)


(require 'exec-path-from-shell)
(let ((envs '("PATH" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))

;; anything
(require 'anything-startup)
(global-set-key (kbd "C-x b") 'anything)
(define-key global-map (kbd "M-a") 'anything-imenu)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start t)
(setq ac-auto-start 2)  ;; n文字以上の単語の時に補完を開始
(setq ac-ignore-case nil)  ;; 大文字・小文字を区別する
(ac-set-trigger-key "TAB")

;; auto-complete の候補に日本語を含む単語が含まれないようにする
;; http://d.hatena.ne.jp/IMAKADO/20090813/1250130343
(defadvice ac-word-candidates (after remove-word-contain-japanese activate)
  (let ((contain-japanese (lambda (s) (string-match (rx (category japanese)) s))))
    (setq ad-return-value
          (remove-if contain-japanese ad-return-value))))
(add-hook 'enh-ruby-mode-hook '(lambda()
                                 (add-to-list 'ac-sources 'ac-source-abbrev)))

; robe
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(autoload 'ac-robe-setup "ac-robe" "auto-complete robe" nil nil)
(add-hook 'robe-mode-hook 'ac-robe-setup)
(add-hook 'enh-ruby-mode-hook '(lambda()
                                 (robe-mode)))
(setq robe-mode-map nil)

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


;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;; 隠しファイルをデフォルトで表示
(setq neo-show-hidden-files t)
;; neotree でファイルを新規作成した後、自動的にファイルを開く
(setq neo-create-file-auto-open t)
;; キーバインドをシンプルにする
(setq neo-keymap-style 'concise)
;; neotree ウィンドウを表示する毎に current file のあるディレクトリを表示する
(setq neo-smart-open t)

;; ace-jump
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


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

;; revert-buffer
(defun revert-buffer-no-confirm (&optional force-reverting)
  "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
  (interactive "P")
  ;;(message "force-reverting value is %s" force-reverting)
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))

;; reload buffer
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)


;; highlight-indentation
(require 'highlight-indentation)
(setq highlight-indentation-offset 2)
(set-face-background 'highlight-indentation-face "#202020")
(set-face-background 'highlight-indentation-current-column-face "#303030")

(add-hook 'enh-ruby-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'coffee-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'scss-mode-hook 'highlight-indentation-current-column-mode)
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
;; (require 'magit)
;;  (setq magit-last-seen-setup-instructions "1.4.0")

; ag
(setq default-process-coding-system 'utf-8-unix)  ; ag 検索結果のエンコード指定
(require 'ag)
(setq ag-highlight-search t)  ; 検索キーワードをハイライト
(setq ag-reuse-buffers t)     ; 検索用バッファを使い回す (検索ごとに新バッファを作らない)

; helm
; helm-ag
(require 'helm-config)
(require 'helm-files)
(require 'helm-ag)
(global-set-key (kbd "M-g .") 'helm-ag)
(global-set-key (kbd "M-g r") 'helm-ag-project-root)
(global-set-key (kbd "M-g ,") 'helm-ag-pop-stack)
(custom-set-variables
 '(helm-ag-use-grep-ignore-list "*~")
 '(helm-ag-use-agignore t)
 )

; wgrep
(add-hook 'ag-mode-hook '(lambda ()
                           (require 'wgrep-ag)
                           (setq wgrep-auto-save-buffer t)  ; 編集完了と同時に保存
                           (setq wgrep-enable-key "r")      ; "r" キーで編集モードに
                           (wgrep-ag-setup)))



;; fiplr
(require 'fiplr)
(setq fiplr-root-markers '(".git" ".svn"))
(setq fiplr-ignored-globs '((directories (".git" ".svn" "vendor" "tmp" "uploaded_files" "log" "./public" "node_modules" "_vendor" "coverage" "_build" "deps"))
                            (files ("*~" ".*" "*.jpg" "*.png" "*.gif" "*.zip" "*.DS_Store"))))
(global-set-key (kbd "C-x f") 'fiplr-find-file)
(global-set-key (kbd "C-x c") 'fiplr-clear-cache)


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

;; ruby-end
(require 'ruby-end)
(add-hook 'enh-ruby-mode-hook
  '(lambda ()
    (abbrev-mode 1)
    (electric-pair-mode t)
    (electric-indent-mode t)
    (electric-layout-mode t)))

;; ruby settings
(setq enh-ruby-deep-indent-paren nil)

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
(require 'less-css-mode)


;; js2-mode
(require 'js2-mode)
;;(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js.erb$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook
          '(lambda ()
             (setq js2-basic-offset 2
                   indent-tabs-mode nil)
             ))



;; csv-mode
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
   "Major mode for editing comma-separated value files." t)


;; twittering-mode
(require 'twittering-mode)


;; markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; go-mode
;; this mode demand gocode, godef and godoc in $GOPATH
(require 'go-mode)
(eval-after-load "go-mode" '(progn (require 'go-autocomplete)))
(add-hook 'go-mode-hook
          '(lambda()
             (setq c-basic-offset 4)
             (setq indent-tabs-mode t)
             (local-set-key (kbd "M-.") 'godef-jump)
             (local-set-key (kbd "C-c d") 'godoc)
             (go-eldoc-setup)
             (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)))
(add-hook 'before-save-hook 'gofmt-before-save)


;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-attr-indent-offset nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-sql-indent-offset 2)
  (setq indent-tabs-mode nil)
  (setq tab-width 2))
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; elm-mode
(require 'elm-mode)

;; elixir-mode
(require 'elixir-mode)
(require 'alchemist)
(add-hook 'elixir-mode-hook 'ac-alchemist-setup)

;; python
;; jedi
(setq jedi:setup-keys nil)
(setq jedi:tooltip-method nil)
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq ac-sources
      (delete 'ac-source-words-in-same-mode-buffers ac-sources)) ;;jediの補完候補だけでいい
(add-to-list 'ac-sources 'ac-source-filename)
(add-to-list 'ac-sources 'ac-source-jedi-direct)

(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-.") 'jedi:jump-to-definition)
             (local-set-key (kbd "C-,") 'jedi:jump-back)
             (local-set-key (kbd "C-c d") 'jedi:show-doc)
             (local-set-key (kbd "C-<tab>") 'jedi:complete)))


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
  '(progn
     (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
     (setq flycheck-disabled-checkers '(javascirpt-jshint))
     (setq flycheck-checkers '(javascript-eslint))))

(setq js2-include-browser-externs nil)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq js2-highlight-external-variables nil)
(setq js2-include-jslint-globals nil)

;; cua
(cua-mode t)
(setq cua-enable-cua-keys nil)

(setq default-tab-width 4)

(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(require 'flymake-json)
(add-hook 'json-mode-hook 'flymake-json-load)
