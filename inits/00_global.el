;;-------------------------------
;; global settings
;;-------------------------------
;; encoding
(prefer-coding-system 'utf-8)

;; バックスラッシュ
(define-key global-map [?¥] [?\\])

(setq large-file-warning-threshold nil)

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

;; 矩形選択
;; cua
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; delete region
(delete-selection-mode t)

;; path
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize)
  (let ((envs '("PATH" "GOPATH")))
    (exec-path-from-shell-copy-envs envs)))

;; editorconfig
(editorconfig-mode t)

;; ace-jump
(use-package ace-jump-mode
  :bind ("C-c C-j" . ace-jump-mode))

;; which-key
(use-package which-key
    :diminish which-key-mode
    :hook (after-init . which-key-mode))

;; amx
(use-package amx
  :config
  (amx-mode t))

;; undo-tree
(use-package undo-tree
  :config
  (global-undo-tree-mode))

;; yasnippet
(use-package yasnippet
  :config
  (yas-global-mode 1))

;; fiplr
(use-package fiplr
  :bind
  (("C-x f" . fiplr-find-file)
   ("C-x c" . fiplr-clear-cache))
  :config
  (progn
    (setq fiplr-root-markers '(".git" ".svn" ".hg"))
    (setq fiplr-ignored-globs '((directories (".git" ".svn" "vendor" "tmp" "uploaded_files" "log" "./public" "node_modules" "_vendor" "coverage" "_build" "deps" "el-get" "python3.*" "__pycache__"))
                               (files ("*~" "*.jpg" "*.png" "*.gif" "*.zip" "*.DS_Store"))))))

;; リモートのファイルを手元のemacsからいじるtramp
(defun reopen-with-sudo ()
  "Reopen current buffer-file with sudo using tramp."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if file-name
        (find-alternate-file (concat "/sudo::" file-name))
      (error "Cannot get a file name"))))

;; newline and indent
(setq indent-line-function 'indent-relative-maybe)

;; *.~を作成しない
(setq make-backup-files nil)
;; *.#を作成しない
(setq auto-save-default nil)

;;; mozc
(use-package mozc
  :config
  (set-language-environment "Japanese")           ; 言語環境を"japanese"に
  (setq default-input-method "japanese-mozc")     ; IMEをjapanes-mozcに
  (prefer-coding-system 'utf-8)                   ; デフォルトの文字コードをUTF-8
  )

(use-package mozc-popup
  :config
  (setq mozc-candidate-style 'popup))

;;----------------------------------
;; autocmoplete
;;----------------------------------
(use-package auto-complete
  :config
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
  )
;;-----------------------------------
;; company-mode
;;-----------------------------------
(use-package company
  :config
  (global-company-mode t))
;;-----------------------------------
;; ag
;;-----------------------------------
(use-package ag
  :config
  ;; 検索結果のハイライト
  (setq ag-highlight-search t)
  ;; 検索用バッファを使いまわす
  (setq ag-reuse-buffers t)
  (add-hook 'ag-mode-hook 'wgrep-ag-setup))

;; wgrep-ag
(use-package wgrep-ag
  :after ag
  :config
  (setq wgrep-auto-save-buffer t)  ; 編集完了と同時に保存
  (setq wgrep-enable-key "r"))      ; "r" キーで編集モードに

;;------------------------------------
;; ivy/counsel
;;------------------------------------
(use-package ivy
  :config
   (when (setq enable-recursive-minibuffers t)
    (minibuffer-depth-indicate-mode 1))
  (setq ivy-truncate-lines nil)
  ;; リスト先頭で `C-p' するとき，リストの最後に移動する
  (setq ivy-wrap t)
  (ivy-mode))

(use-package counsel
  :after ivy
  :bind
  (("M-g ." . counsel-ag)
   ("M-g r" . counsel-ag)
   ("M-y" . counsel-yank-pop)
   )
  :config (counsel-mode))

(use-package all-the-icons-ivy
  :after ivy
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup))


;;-------------------------------------------
;; file-info
;;-------------------------------------------
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

(use-package file-info
  :bind
  (("C-c i" . file-info)))

;;-------------------------------------------
;; neotree
;;-------------------------------------------
;; neotreeでiconsを使う場合に必須
(use-package all-the-icons)

;; neotree
(use-package neotree
  :bind
  (("<f8>" . neotree-toggle)
   ("C-c n" . neotree-hidden-file-toggle))
  :config
  ;; 隠しファイルをデフォルトで表示
  (setq-default neo-show-hidden-files t)
  (setq neo-create-file-auto-open t)
  (setq neo-keymap-style 'concise)
  (setq neo-smart-open t)
  (setq neo-theme 'icons)
  :hook
  (neo-after-create .
            (lambda (&rest _) (display-line-numbers-mode -1)))
  )

;;-------------------------------------------
;; smartparens
;;-------------------------------------------
(use-package smartparens
  :config
  (require 'smartparens-config)
  :hook
  (go-mode . smartparens-mode)
  (elixir-mode . smartparens-mode)
  (python-mode . smartparens-mode)
  (json-mode . smartparens-mode)
  (scala-mode . smartparens-mode)
  (terraform-mode . smartparens-mode)
  (emacs-lisp-mode . smartparens-mode)
  (js2-mode . smartparens-mode)
  (typescript-mode . smartparens-mode)
  )

;;-------------------------------------------
;; language server protocol
;;-------------------------------------------
;; lps-mode 7.0.1 moved clients under the directory, it is not root directory, so I have to add this directory to load path.
(setq load-path (cons "~/.emacs.d/el-get/lsp-mode/clients/" load-path))
(use-package lsp-mode
  :custom
  (
   (lsp-inhibit-message t)
   (lsp-message-project-root-warning t)
   (create-lockfiles nil)
   (lsp-auto-configure t)
   )
  :hook
  (prog-major-mode . lsp-prog-major-mode-enable)
  )

(use-package lsp-ui
  :after lsp-mode
  :custom
  (scroll-margin 0)
  :bind
  (
   ("M-." . lsp-ui-peek-find-definitions)
   ("M-/" . lsp-ui-peek-find-references)
   ("M-]" . lsp-ui-peek-find-implementation)
   )
  :hook
  (lsp-mode . lsp-ui-mode)
  )


;; treemacs
(setq load-path
      (append '("~/.emacs.d/el-get/treemacs/src/elisp" "~/.emacs.d/el-get/treemacs/src/extra")
              load-path))
(use-package treemacs)

(use-package dap-mode
  :after (
          lsp-mode
          treemacs
          )
  :custom
  (dap-auto-configure-features '(sessions locals breakpoints expressions repl controls tooltip))
  :config
  ;; https://github.com/emacs-lsp/dap-mode/pull/326
  (custom-set-variables '(dap-go-debug-program `("node"
                                                 ,(f-join dap-go-debug-path "extension/dist/debugAdapter.js"))))
  (custom-set-variables `(dap-output-window-max-height 50))
  (dap-mode 1)
  (dap-auto-configure-mode 1)
  (require 'dap-hydra)
  :bind
  ("C-c d" . dap-hydra/body)
  )

;;------------------------------------------
;; hydra
;;------------------------------------------
(use-package hydra
  :defer t
  :commands
  (hydra-main/body)
  :bind
  (("C-z" . hydra-main/body)
   ("C-c z" . hydra-main/body)
   ("C-c l" . hydra-lsp/body)
   )
  :config
  (defhydra hydra-main (:hint nil :exit t)
"
^Main^                                  ^ivy/counsel^                           ^Other^
^^^^^^ — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — — —
_j_: ace-jump-mode[C-c C-j]             _a_: counsel-ag[M-g .]                 _n_: neotree-toggle[f8]
_b_: magit-blame                        _i_: counsel-imenu[M-a]                _q_: query-replace[C-c r]
_g_: magit-status                       _F_: counsel-find-file[C-x C-f]        _O_: org-capture[C-c c]
_f_: fiplr-find-file[C-x f]             _L_: counsel-info-lookup-symbol[C-h S] _A_: org-agenda[C-c a]
_c_: fiplr-clear-cache[C-x c]           _G_: counsel-git-grep
_o_: comment-or-uncomment-region[C-c :] _H_: counsel-git-log
_t_: goto-line[C-x :]                   _m_: counsel-minor
_l_: toggle-truncate-lines[C-c C-l]     _R_: counsel-buffer-or-recentf
"
 ("j" ace-jump-mode)
 ("b" magit-blame)
 ("g" magit-status)
 ("f" fiplr-find-file)
 ("c" fiplr-clear-cache)
 ("o" comment-or-uncomment-region)
 ("t" goto-line)
 ("l" toggle-truncate-lines)

 ("a" counsel-ag)
 ("i" counsel-imenu)
 ("F" counsel-fzf)
 ("L" counsel-info-lookup-symbol)
 ("G" counsel-git-grep)
 ("H" counsel-git-log)
 ("m" counsel-minor)
 ("R" counsel-buffer-or-recentf)

 ("n" neotree-toggle)
 ("q" query-replace)
 ("O" org-capture)
 ("A" org-agenda)

 ("z" nil "leave"))
  (defhydra hydra-lsp (:exit t :hint nil)
"
 Buffer^^               Server^^                   Symbol
-------------------------------------------------------------------------------------
 _f_: format           _M-r_: restart            _d_: declaration       _i_: implementation[M-]]  _o_: documentation
 _m_: imenu            _S_:   shutdown           _D_: definition[M-.]   _t_: type                 _r_: rename
 _x_: execute action   _M-s_: describe session   _R_: references[M-/]   _s_: signature
"
  ("d" lsp-find-declaration)
  ("D" lsp-ui-peek-find-definitions)
  ("R" lsp-ui-peek-find-references)
  ("i" lsp-ui-peek-find-implementation)
  ("t" lsp-find-type-definition)
  ("s" lsp-signature-help)
  ("o" lsp-describe-thing-at-point)
  ("r" lsp-rename)

  ("f" lsp-format-buffer)
  ("m" lsp-ui-imenu)
  ("x" lsp-execute-code-action)

  ("M-s" lsp-describe-session)
  ("M-r" lsp-restart-workspace)
  ("S" lsp-shutdown-workspace)

  ("z" nil "leave"))
  )

;;------------------------------------------
;; GC Settings
;;------------------------------------------
(setq gc-cons-threshold (* gc-cons-threshold 10))
(setq garbage-collection-messages t)

(use-package vlf
  :config
  (require 'vlf-setup)
  )

;;-------------------------------------------
;; dashboard
;;-------------------------------------------
(use-package dashboard
  :diminish
  (dashboard-mode page-break-lines-mode)
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-startup-banner 1)
  (dashboard-items '((recents . 15)
                     (projects . 5)
                     (bookmarks . 5)
                     (agenda . 5)))
  )

;;-------------------------------------------
;; magit
;;-------------------------------------------
(use-package magit)

;;-------------------------------------------
;; dumb-jump
;;-------------------------------------------
(use-package dumb-jump
  :config
  (dumb-jump-mode)
  )

(use-package open-github-from-here)
