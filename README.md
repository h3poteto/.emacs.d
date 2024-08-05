# emacs.d
My Emacs setting for Linux and MacOS.

# Introduction

I have prepared example for each OS.

- [Linux](emacs.linux)
- [MacOS](emacs.darwin)

Please copy it to `~/.emacs` and, read `.emacs.d`:


```elisp
(load (expand-file-name (concat (getenv "HOME") "/.emacs.d/init")))
```

## EmacsClient

And I have prepared emacs client command for each OS.

- [Linux](emacs-client.linux)
- [MacOS](emacs-client.darwin)

### Linux
Please create an alias:

```
alias e='~/.emacs.d/emacs-client.linux'
```

### MacOS
Please create emacs client binary in `/usr/local/bin/emacs-cli`,

```bash
#!/bin/bash

if [ $# -eq 1 ]; then
        open -n -a /Applications/Emacs.app $1
else
        open -n -a /Applications/Emacs.app
fi
```

and create an alias this command:

```
alias e='~/.emacs.d/emacs-client.darwin'
```

### Usage
Please call emacs with `e` command like this:

```
$ e
```

or provide file path.

```
$ e init.el
```


# Required packages

This Emacs config use [straight.el](https://github.com/radian-software/straight.el) as package management.
If straight.el is not yet installed, Emacs will automatically install straight.el at first.
So, you don't need to setup straight.el.


But, you have already installed some packages using package.el, it will be warning.
Please uninstall all packages which are installed by package.el.
## Fonts

I adopt Ricty Diminished as Japanese font.
So please install this font in your OS.


```
$ yay -S ttf-ricty
```


And Emacs require all-the-icons to display icons in neotree.
Please install `all-the-icons-install-fonts` on Emacs

```
M-x all-the-icons-install-fonts
```

## Language Server Protocol
Some minor mode uses language server protocol. So please install following packages for each language.

### Golang

```
$ yay -S gopls
```

### Typescript/Javascript
Install `ts-ls` on Emacs.

```
M-x lsp-install-server
```

### Vue2
Install `vls` on Emacs.

```
M-x lsp-install-server
```

### Vue3
Install `volar-api`, `volar-html`, `volar-doc`.

```
M-x lsp-install-server
```

### Svelte
```
$ npm install -g svelte-language-server
```

### Python

```
$ pip install python-lsp-server
```


### Rust

Install `rust-analyzer` on Emacs.

```
M-x lsp-install-server
```


### Elixir

Download elixir-ls release package and expand it in `~/.emacs.d/.elixir-ls` according to https://github.com/elixir-lsp/elixir-ls#detailed-installation-instructions


## DAP
### golang
[dlv](https://github.com/go-delve/delve) is required to debug golang in dap-mode, so please install:

```
$ go get github.com/go-delve/delve/cmd/dlv
# If in darwin
$ sudo /usr/sbin/DevToolsSecurity -enable
```

## Other required libaries
- emacs-mozc
- silver-searcher-ag
- eslint, babel-eslint, json-lint
- flake8
- go-fill-struct
- goimports
- golangci-lint
- aspell

### Ag

```
$ yay -Ss the_silver_searcher
```

### prettier

```
$ yay -Ss prettier
```

### json-lint

```
$ npm install -g json-lint
```

### flake8

I use `falke8` as lint tool for python. Please install it.

```
$ pip install flake8
```

### go-fill-struct
```
$ go install github.com/davidrjenni/reftools/cmd/fillstruct@latest
```

### goimports
```
$ go install golang.org/x/tools/cmd/goimports@latest
```

## golangci-lint
Please refer [official page](https://github.com/golangci/golangci-lint).


## Aspell
```
$ yay -S aspell
```

## elm-format
```
$ npm install -g elm-format
```
