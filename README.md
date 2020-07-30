# emacs.d
My Emacs setting for Linux and MacOS.

## Introduction

After you install Emacs, create a directory `~/.emacs` and wirte as below:

```elisp
(load (expand-file-name (concat (getenv "HOME") "/.emacs.d/init")))
```

I have prepared example for each OS.

- [Linux](emacs.linux)
- [MacOS](emacs.darwin)

## el-get

This Emacs config use el-get as package management.
If el-get is not yet installed, Emacs will automatically install el-get at first.
So, you don't need to setup el-get.


But, you have already installed some packages using package.el, it will be warning.
Please uninstall all packages which are installed by package.el.

## Fonts

I adopt Ricty Diminished as Japanese font.
So please install this font in your OS.


```
$ sudo apt-get install fonts-ricty-diminished
```

And Emacs require all-the-icons to display icons in neotree.
Please install `all-the-icons-install-fonts` on Emacs

```
M-x all-the-icons-install-fonts
```

## Language Server Protocol
Some minor mode uses language server protocol. So please install following packages for each language.

- gopls
- javascript-typescript-langserver
- vls
- pyls
- solargraph
- rls

### gopls
For golang.

```
$ go get -u golang.org/x/tools/cmd/gopls
```

### javascript-typescript-langserver
For javascript and typescript.

```
$ npm install -g javascript-typescript-langserver
```

### vls
For vue.

```
$ npm install -g vls
```

### pyls
For python.

```
$ pip install 'python-language-server[all]'
```

### solargraph
For ruby.

```
$ gem install solargraph
```


### rls
For rust. Racer supports code completion.

```
$ rustup update
$ rustup component add rls rust-analysis rust-src
$ rustup toolchain add nightly
$ rustup component add rust-src
$ cargo +nightly install racer
```

## Required libaries
- emacs-mozc
- silver-searcher-ag
- eslint, babel-eslint, json-lint
- flake8
- go-fill-struct

### emacs-mozc

I use emacs-mozc to write Japanese in Emacs, so install `emacs-mozc-bin`.

```
$ sudo apt-get install emacs-mozc-bin
```

### Ag

```
$ sudo apt-get install silversearcher-ag
```

### prettier

```
$ npm install -g prettier eslint
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
$ go get -u github.com/davidrjenni/reftools/cmd/fillstruct
```
