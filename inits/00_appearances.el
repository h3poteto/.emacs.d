(use-package monokai-theme
  :load-path "themes"
  :config
  (load-theme 'monokai t)
  (setq monokai-background     "#000000"
        monokai-comments       "#F19CA7"
        monokai-highlight      "#434da2"
   )
  )
(use-package spacemacs-common
  :load-path "themes"
  )
(use-package aanila-theme)
(use-package atom-one-dark-theme)
;; disable for company mode bg
;; (use-package atom-one-light-theme)

;; theme switch
(setq my-themes (list 'monokai 'aanila 'atom-one-dark 'spacemacs-light))
(setq curr-theme my-themes)
(defun switch-theme ()
  "Cycle custom theme."
    (interactive)
    (disable-theme (car curr-theme))
    (setq curr-theme (cdr curr-theme))
    (if (null curr-theme) (setq curr-theme my-themes))
    (load-theme (car curr-theme) t)
    (message "Theme is loaded: %s" (car curr-theme)))
(global-set-key [f7] 'switch-theme)
(setq curr-theme my-themes)
(load-theme (car curr-theme) t)


;; カーソル位置の表示
(show-paren-mode t)
(column-number-mode t)

;; line number
(global-display-line-numbers-mode)

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
(global-set-key (kbd "C-c C-a") 'set-alpha)

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

(defun powerline-customized-theme ()
  "Setup the customized mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face0 (if active 'powerline-active0 'powerline-inactive0))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" face0 'l)
                                     (when powerline-display-mule-info
                                       (powerline-raw mode-line-mule-info face0 'l))
                                     (when (and (bound-and-true-p projectile-mode)
                                                (projectile-project-p))
                                       (powerline-raw (format "[%s]" (projectile-project-name)) face0 'l))
                                     (powerline-buffer-id `(mode-line-buffer-id ,face0) 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format face0 'l))
                                     (powerline-raw " " face0)
                                     (funcall separator-left face0 face1)
                                     (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     (powerline-minor-modes face1 'l)
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-vc face2 'r)
                                     (when (bound-and-true-p nyan-mode)
                                       (powerline-raw (list (nyan-create)) face2 'l))))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (funcall separator-right face2 face1)
                                     (unless window-system
                                       (powerline-raw (char-to-string #xe0a1) face1 'l))
                                     (powerline-raw "%4l" face1 'l)
                                     (powerline-raw ":" face1 'l)
                                     (powerline-raw "%3c" face1 'r)
                                     (funcall separator-right face1 face0)
                                     (powerline-raw " " face0)
                                     (powerline-raw "%6p" face0 'r)
                                     (when powerline-display-hud
                                       (powerline-hud face0 face2))
                                     (powerline-fill face0 0)
                                     )))
                     (concat (powerline-render lhs)
                             (powerline-fill face2 (powerline-width rhs))
                             (powerline-render rhs)))))))

(use-package powerline
  :init (powerline-customized-theme)
  :config
  (projectile-mode t)
  )

(defvar mode-line-cleaner-alist
  '( ;; For minor-mode, first char is 'space'
    (eldoc-mode . "") ;; Eldoc
    (global-whitespace-mode . "")  ;; WS
    (undo-tree-mode . "") ;; Undo-Tree
    (highlight-symbol-mode . "")  ;; hl-s
    (highlight-indent-guides-mode . "") ;; h-i-g
    (which-key-mode . "")  ;; WK
    (auto-revert-mode . "") ;; ARev
    (smartparens-mode . "") ;; SP
    (hs-minor-mode . "")  ;; hs
    (ivy-mode . " i")  ;; ivy
    (company-mode . " c") ;; company
    (flycheck-mode . " f") ;; FlyC
    (projectile-mode . "") ;; Projectile
    ;; Major modes
    ;; (lisp-interaction-mode . "Li")
    ;; (python-mode . "Py")
    ;; (ruby-mode   . "Rb")
    ;; (emacs-lisp-mode . "El")
    ;; (markdown-mode . "Md")
    ))

(defun clean-mode-line ()
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
        do
        (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
          (when old-mode-str
            (setcar old-mode-str mode-str))
          ;; major mode
          (when (eq mode major-mode)
            (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)


(use-package highlight-symbole
  :config
  (setq highlight-symbol-idle-delay 1.0)
  :hook
  (prog-mode . highlight-symbol-mode)
  )

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

;; highlight-indent-guides
;; インデントを可視化する
(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-auto-odd-face-perc 15)
  (setq highlight-indent-guides-auto-even-face-perc 15)
  (setq highlight-indent-guides-auto-character-face-perc 20)
  :hook
  (prog-mode . highlight-indent-guides-mode)
  (yaml-mode . highlight-indent-guides-mode)
  (json-mode . highlight-indent-guides-mode)
  )

;; highlight-indentation
;; 現在行をハイライトするためだけに入れている
(use-package highlight-indentation
  :config
  (setq highlight-indentation-offset 2)
  ;; (set-face-background 'highlight-indentation-face "#202020")
  (set-face-background 'highlight-indentation-current-column-face "#303030")

  (add-hook 'highlight-indentation-mode-hook 'highlight-indentation-current-column-mode)

  (global-hl-line-mode)
  )

(menu-bar-mode -1)

(use-package minimap
  :config
  (setq minimap-window-location 'right)
  (setq minimap-update-delay 0.2)
  (setq minimap-minimum-width 20)
  (global-set-key (kbd "C-x m") 'minimap-mode)
  )
