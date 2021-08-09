(el-get-bundle jwiegley/use-package)
(el-get-bundle init-loader)
(el-get-bundle anything)  ;; needs for loop
(el-get-bundle yoshiki/yaml-mode)
(el-get-bundle highlight-indentation)
(el-get-bundle DarthFennec/highlight-indent-guides)
(el-get-bundle ag)
(el-get-bundle exec-path-from-shell)
(el-get-bundle fiplr)
;; (el-get-bundle tabbar)
(el-get-bundle manateelazycat/awesome-tab)
(el-get-bundle wgrep)
(el-get-bundle ace-jump-mode)
(el-get-bundle fuzzy)
(el-get-bundle async)
;; ivy/counsel
(el-get-bundle ivy)
(el-get-bundle abo-abo/swiper)
(el-get-bundle asok/all-the-icons-ivy)
(el-get-bundle Fuco1/smartparens)
(el-get-bundle milkypostman/powerline)
(el-get-bundle undo-tree
  :url "https://gitlab.com/tsc25/undo-tree.git")
(el-get-bundle queue)  ;; needs for undo-tree
(el-get-bundle iedit)
(el-get-bundle syohex/emacs-codic)
(el-get-bundle rainbow-mode)
(el-get-bundle company-mode/company-mode)
(el-get-bundle joaotavora/yasnippet)  ;; yasnippet is required to insert arguments in company-mode
(el-get-bundle highlight-symbol)
(el-get-bundle Fanael/rainbow-delimiters)
(el-get-bundle which-key)
(el-get-bundle DarwinAwardWinner/amx)
(el-get-bundle jschaf/esup)
(el-get-bundle jacktasia/dumb-jump)
(el-get-bundle magit)
(el-get-bundle shibayu36/emacs-open-github-from-here)
(el-get-bundle emacs-dashboard/emacs-dashboard)
(el-get-bundle magnars/multiple-cursors.el)
(el-get-bundle purcell/page-break-lines)  ;; To install emacs-dashboard
(el-get-bundle neotree)
(el-get-bundle domtronn/all-the-icons.el)  ;; To show icons in neotree
(el-get-bundle memoize)
(el-get-bundle m00natic/vlfi)
;; Japanese
(el-get-bundle mozc
  :type http
  :url "https://raw.githubusercontent.com/google/mozc/master/src/unix/emacs/mozc.el")
(el-get-bundle d5884/mozc-popup)
(el-get-bundle auto-complete/popup-el)
;; Themes
(el-get-bundle oneKelvinSmith/monokai-emacs)
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
;; hydra
(el-get-bundle abo-abo/hydra)
;; Language server protocol
(el-get-bundle emacs-lsp/lsp-mode)
(el-get-bundle emacs-lsp/lsp-ui)
(el-get-bundle emacsmirror/jsonrpc)
;; DAP mode
(el-get-bundle tumashu/posframe)
(el-get-bundle emacs-lsp/dap-mode)
(el-get-bundle alezost/bui.el)
(el-get-bundle abo-abo/ace-window
  ;; It is required by treemacs
  )
(el-get-bundle Alexander-Miller/pfuture
  ;; It is required by treemacs
  )
(el-get-bundle
  Alexander-Miller/treemacs
  ;; treemacs and lsp-treemacs is required by dap-mode
  )
(el-get-bundle emacs-lsp/lsp-treemacs)
;; projectile
(el-get-bundle bbatsov/projectile)

;; nginx
(el-get-bundle ajc/nginx-mode)
;; fluentd
(el-get-bundle syohex/emacs-fluentd-mode)
;; puppet
(el-get-bundle voxpupuli/puppet-mode)
;; toml
(el-get-bundle dryman/toml-mode.el)

;; css
(if (ignore-minor-mode 'ignore-css-mode)
    (message "css-mode is ignored")
  (el-get-bundle less-css-mode)
  (el-get-bundle sass-mode)
)

;; csv
(el-get-bundle csv-mode)
;; dockerfile
(el-get-bundle spotify/dockerfile-mode)
;; elixir
(el-get-bundle elixir-lang/emacs-elixir)
(el-get-bundle alchemist)
(el-get-bundle lbolla/emacs-flycheck-elixir
  :name flycheck-elixir)
;; go
(if (ignore-minor-mode 'ignore-go-mode)
    (message "go-mode is ignored")
  (el-get-bundle go-mode)
  (el-get-bundle weijiangan/flycheck-golangci-lint)
  (el-get-bundle s-kostyaev/go-fill-struct)
)
;; js
(el-get-bundle mooz/js2-mode)
(el-get-bundle prettier-js)
;; json
(el-get-bundle json-mode)
(el-get-bundle tminor/jsonnet-mode)
;; markdown
(el-get-bundle markdown-mode)
;; php
(el-get-bundle php-mode)
;; protobuf
(el-get-bundle protobuf-mode)
;; python
(el-get-bundle purcell/flymake-python-pyflakes)
(el-get-bundle cask/shut-up) ;; needs for pyimport
(el-get-bundle Wilfred/pyimport)
(el-get-bundle paetzke/py-autopep8.el)
(el-get-bundle paetzke/py-isort.el)
;; rust
(el-get-bundle rust-mode)
(el-get-bundle racer-rust/emacs-racer)
;; terraform
(el-get-bundle terraform-mode)
(el-get-bundle rafalcieslak/emacs-company-terraform)
;; typescript
(el-get-bundle typescript-mode)
(el-get-bundle tide)
;; vue
(el-get-bundle purcell/mmm-mode)
(el-get-bundle AdamNiederer/vue-html-mode)
(el-get-bundle AdamNiederer/ssass-mode)
(el-get-bundle Fanael/edit-indirect)
(el-get-bundle AdamNiederer/vue-mode)
;; web
(el-get-bundle web-mode)
;; ruby
(el-get-bundle rhtml-mode)
(el-get-bundle ruby-block)
(el-get-bundle ruby-electric)
(el-get-bundle ruby-end)
(el-get-bundle slim-mode)
;; coffee
(el-get-bundle defunkt/coffee-mode)
