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

### gopls

```
$ go get -u golang.org/x/tools/cmd/gopls
```

### javascript-typescript-langserver

```
$ npm install -g javascript-typescript-langserver
```

## Required libaries
- emacs-mozc
- silver-searcher-ag
- ctags
- eslint, babel-eslint, json-lint
- gopls
- python, flake8

### emacs-mozc

I use emacs-mozc to write Japanese in Emacs, so install `emacs-mozc-bin`.

```
$ sudo apt-get install emacs-mozc-bin
```

### Ag

```
$ sudo apt-get install silversearcher-ag
```


### ctags

```
$ ctags --exclude="*.js" --exclude=".git*" --exclude="vendor/*" --exclude="public/*" -eR
```

### eslint

```
$ npm install -g eslint babel-eslint json-lint
```

If there is an eslint config in your project, like `.eslintrc.json`, Emacs automatically read this config.

```json
{
  "parser": "babel-eslint",
  "plugins": [ "react" ],
  "env": {
    "browser": true,
    "es6": true,
    "node": true
  },
  "ecmaFeatures": {
    "arrowFunctions": true,
    "blockBindings": true,
    "classes": true,
    "defaultParams": true,
    "destructuring": true,
    "forOf": true,
    "generators": true,
    "modules": true,
    "spread": true,
    "templateStrings": true,
    "jsx": true
  },
  "rules": {
    "consistent-return": [0],
    "key-spacing": [0],
    "quotes": [0],
    "new-cap": [0],
    "no-multi-spaces": [0],
    "no-shadow": [0],
    "no-unused-vars": [1],
    "no-use-before-define": [2, "nofunc"],
    "react/jsx-no-undef": 1,
    "react/jsx-uses-react": 1,
    "react/jsx-uses-vars": 1
  }
}
```

### python
If you write python, Emacs needs `jedi` and python3 is required to run `jedi`.
At first, install python3 using pyenv.

Then install `jedi` on Emacs:
```
M-x jedi:install-server
```

In this time, `jedi` needs `virtualenv` so you have to install `virtualenv`.

```
$ pip install virtualenv
```

I use `falke8` as lint tool for python. Please install it.

```
$ pip install flake8
```
