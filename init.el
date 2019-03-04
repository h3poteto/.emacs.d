;; emacs-server
(require 'server)
(unless (server-running-p)
  (server-start))

;; el-get
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))


;; el-get packages
(el-get-bundle jwiegley/use-package)
(el-get-bundle init-loader)
(el-get-bundle anything)
(el-get-bundle auto-complete)
(el-get-bundle editorconfig)
(el-get-bundle yaml-mode)
(el-get-bundle flycheck)
(el-get-bundle mooz/js2-mode)
;;(el-get-bundle eschulte/rinari)
(el-get-bundle asok/projectile-rails)
(el-get-bundle rhtml-mode)
(el-get-bundle twittering-mode)
(el-get-bundle ag)
(el-get-bundle defunkt/coffee-mode)
(el-get-bundle slim-mode)
;;(el-get-bundle zenspider/enhanced-ruby-mode, :branch "v20150711")
(el-get-bundle exec-path-from-shell)
(el-get-bundle fiplr)
(el-get-bundle flycheck-color-mode-line)
(el-get-bundle highlight-indentation)
(el-get-bundle less-css-mode)
(el-get-bundle markdown-mode)
(el-get-bundle php-mode)
(el-get-bundle csv-mode)
(el-get-bundle popwin)
(el-get-bundle ruby-block)
(el-get-bundle ruby-electric)
(el-get-bundle tabbar)
(el-get-bundle wgrep)
(el-get-bundle go-mode)
(el-get-bundle ruby-end)
(el-get-bundle ace-jump-mode)
(el-get-bundle neotree)
(el-get-bundle web-mode)
(el-get-bundle go-autocomplete)
(el-get-bundle go-eldoc)
(el-get-bundle fuzzy)
(el-get-bundle async)
(el-get-bundle helm-ag)
(el-get-bundle terraform-mode)
(el-get-bundle json-mode)
(el-get-bundle flymake-easy)
(el-get-bundle purcell/flymake-json)
(el-get-bundle sr-speedbar)
(el-get-bundle elixir-lang/emacs-elixir
  :named elixir-mode)
(el-get-bundle alchemist)
(el-get-bundle syohex/emacs-ac-alchemist
  :name ac-alchemist)
(el-get-bundle jedi)
(el-get-bundle sass-mode)
;; https://github.com/ensime/ensime-emacs/issues/669
;; この対応のため，一時的に古いensimeを使う
(el-get-bundle ensime/ensime-emacs
  :name ensime
  :branch "v1.0.1")
(el-get-bundle magit
  :name magit
  :info nil
  :build (("touch" "lisp/magit-autoloads.el"))
  :build/berkeley-unix nil)
(el-get-bundle protobuf-mode)
(el-get-bundle purcell/mmm-mode)
(el-get-bundle AdamNiederer/vue-html-mode)
(el-get-bundle AdamNiederer/ssass-mode)
(el-get-bundle Fanael/edit-indirect)
(el-get-bundle AdamNiederer/vue-mode)
(el-get-bundle Fuco1/smartparens)
(el-get-bundle ajc/nginx-mode)
;; smart-mode-lineでpowerline themaを使う場合は必要
;; (el-get-bundle milkypostman/powerline)
(el-get-bundle Malabarba/smart-mode-line)
;; (el-get-bundle zk-phi/sky-color-clock)
;; djang-modeに必要な依存
(el-get-bundle abo-abo/helm-make)
(el-get-bundle joaotavora/yasnippet)
(el-get-bundle AndreaCrotti/yasnippet-snippets)
(el-get-bundle myfreeweb/django-mode)
;;
(el-get-bundle spotify/dockerfile-mode)
(el-get-bundle purcell/flymake-python-pyflakes)
(el-get-bundle undo-tree)
(el-get-bundle rust-mode)
(el-get-bundle iedit)
(el-get-bundle syohex/emacs-codic)
(el-get-bundle rainbow-mode)
(el-get-bundle typescript-mode)
(el-get-bundle tide)
(el-get-bundle company-mode/company-mode)
(el-get-bundle highlight-symbol)
(el-get-bundle Fanael/rainbow-delimiters)
(el-get-bundle syohex/emacs-fluentd-mode)
;; pyrimpotで使う
(el-get-bundle cask/shut-up)
(el-get-bundle Wilfred/pyimport)
(el-get-bundle prettier-js)
(el-get-bundle which-key)
(el-get-bundle DarwinAwardWinner/amx)
;; neotreeでiconsするために必要
(el-get-bundle domtronn/all-the-icons.el)
(el-get-bundle memoize)
;; カスタマイズテーマ
(el-get-bundle nashamri/spacemacs-theme)

;; 初期化
(require 'package)
(package-initialize)

(require 'use-package)

(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
