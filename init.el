;; Error message in inits
(custom-set-variables
 '(init-loader-show-log-after-init (quote error-only)))

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
(el-get-bundle tarao/el-get-lock
  (el-get-lock)
  (el-get-lock-unlock 'el-get-lock)
  )
(el-get-bundle jwiegley/use-package)
(el-get-bundle init-loader)
(el-get-bundle anything)
(el-get-bundle auto-complete)
(el-get-bundle editorconfig)
(el-get-bundle yoshiki/yaml-mode)
(el-get-bundle highlight-indentation)
(el-get-bundle DarthFennec/highlight-indent-guides)
(el-get-bundle ag)
(el-get-bundle exec-path-from-shell)
(el-get-bundle fiplr)
(el-get-bundle tabbar)
(el-get-bundle wgrep)
(el-get-bundle ace-jump-mode)
(el-get-bundle fuzzy)
(el-get-bundle async)
(el-get-bundle helm-ag)
(el-get-bundle sr-speedbar)
(el-get-bundle Fuco1/smartparens)
(el-get-bundle Malabarba/smart-mode-line)
(el-get-bundle undo-tree)
(el-get-bundle iedit)
(el-get-bundle syohex/emacs-codic)
(el-get-bundle rainbow-mode)
(el-get-bundle company-mode/company-mode)
(el-get-bundle highlight-symbol)
(el-get-bundle Fanael/rainbow-delimiters)
(el-get-bundle which-key)
(el-get-bundle DarwinAwardWinner/amx)
(el-get-bundle jschaf/esup)
(el-get-bundle jacktasia/dumb-jump)
(el-get-bundle magit)
(el-get-bundle emacs-dashboard/emacs-dashboard)
;; To install emacs-dashboard
(el-get-bundle purcell/page-break-lines)
(el-get-bundle neotree)
;; To show icons in neotree
(el-get-bundle domtronn/all-the-icons.el)
(el-get-bundle memoize)
;; Japanese
(el-get-bundle mozc
  :type http
  :url "https://raw.githubusercontent.com/google/mozc/master/src/unix/emacs/mozc.el")
(el-get-bundle d5884/mozc-popup)
;; Themes
(el-get-bundle h3poteto/monokai-emacs)
(el-get-bundle nashamri/spacemacs-theme)
(el-get-bundle santoshs/aanila)
(el-get-bundle jonathanchu/atom-one-dark-theme)
(el-get-bundle jonathanchu/atom-one-light-theme)
;; minimap
(el-get-bundle dengste/minimap)
;; flycheck
(el-get-bundle flycheck)
(el-get-bundle flycheck-color-mode-line)
;; flymake
(el-get-bundle flymake-easy)
(el-get-bundle purcell/flymake-json)
(el-get-bundle meqif/flymake-diagnostic-at-point)
;; Language server protocol
(el-get-bundle emacs-lsp/lsp-mode)
(el-get-bundle emacs-lsp/lsp-ui)
(el-get-bundle tigersoldier/company-lsp)
(el-get-bundle emacsmirror/jsonrpc)
;; js, ts
(el-get-bundle mooz/js2-mode)
(el-get-bundle defunkt/coffee-mode)
(el-get-bundle typescript-mode)
(el-get-bundle tide)
(el-get-bundle prettier-js)
;; ruby, rails
(el-get-bundle bbatsov/projectile)
(el-get-bundle rhtml-mode)
(el-get-bundle slim-mode)
(el-get-bundle ruby-block)
(el-get-bundle ruby-electric)
(el-get-bundle ruby-end)
;; css
(el-get-bundle less-css-mode)
(el-get-bundle sass-mode)
;; markdown
(el-get-bundle markdown-mode)
;; php
(el-get-bundle php-mode)
;; csv
(el-get-bundle csv-mode)
;; golang
(el-get-bundle go-mode)
(el-get-bundle s-kostyaev/go-fill-struct)
;; html
(el-get-bundle web-mode)
;; terraform
(el-get-bundle terraform-mode)
(el-get-bundle rafalcieslak/emacs-company-terraform)
;; json
(el-get-bundle json-mode)
;; elixir
(el-get-bundle elixir-lang/emacs-elixir
  :named elixir-mode)
(el-get-bundle alchemist)
(el-get-bundle syohex/emacs-ac-alchemist
  :name ac-alchemist)
(el-get-bundle lbolla/emacs-flycheck-elixir
  :name flycheck-elixir)
;; protocol buffer
(el-get-bundle protobuf-mode)
;; vue
(el-get-bundle purcell/mmm-mode)
(el-get-bundle AdamNiederer/vue-html-mode)
(el-get-bundle AdamNiederer/ssass-mode)
(el-get-bundle Fanael/edit-indirect)
(el-get-bundle AdamNiederer/vue-mode)
;; nginx
(el-get-bundle ajc/nginx-mode)
;; python
(el-get-bundle abo-abo/helm-make)
(el-get-bundle joaotavora/yasnippet)
(el-get-bundle AndreaCrotti/yasnippet-snippets)
(el-get-bundle myfreeweb/django-mode)
(el-get-bundle purcell/flymake-python-pyflakes)
(el-get-bundle paetzke/py-autopep8.el)
(el-get-bundle paetzke/py-isort.el)
;; docker
(el-get-bundle spotify/dockerfile-mode)
;; rust
(el-get-bundle rust-mode)
(el-get-bundle racer-rust/emacs-racer)
;; fluentd
(el-get-bundle syohex/emacs-fluentd-mode)
;; For pyrimpot
(el-get-bundle cask/shut-up)
(el-get-bundle Wilfred/pyimport)
;; puppet
(el-get-bundle voxpupuli/puppet-mode)
;; toml
(el-get-bundle dryman/toml-mode.el)
;;
(el-get-bundle m00natic/vlfi)

(require 'package)
(package-initialize)

(require 'use-package)

(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

