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
(el-get-bundle js2-mode)
;;(el-get-bundle eschulte/rinari)
(el-get-bundle asok/projectile-rails)
(el-get-bundle rhtml-mode)
(el-get-bundle twittering-mode)
(el-get-bundle ag)
(el-get-bundle coffee-mode)
(el-get-bundle slim-mode)
;;(el-get-bundle zenspider/enhanced-ruby-mode, :branch "v20150711")
(el-get-bundle exec-path-from-shell)
(el-get-bundle fiplr)
(el-get-bundle flycheck-color-mode-line)
(el-get-bundle highlight-indentation)
(el-get-bundle less-css-mode)
(el-get-bundle markdown-mode)
(el-get-bundle php-mode)
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
(el-get-bundle scss-mode)
(el-get-bundle sass-mode)
(el-get-bundle ensime)
(el-get-bundle magit
  :name magit
  :info nil
  :build (("touch" "lisp/magit-autoloads.el"))
  :build/berkeley-unix nil)
(el-get-bundle protobuf-mode)
(el-get-bundle AdamNiederer/vue-mode)

(require 'use-package)

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

