# emacs.d
個人的なemacsの設定になります．

## 導入

emacsをインストール後，`~/.emacs` を作成し，以下のようにして読み込みます．

```elisp
(load (expand-file-name (concat (getenv "HOME") "/.emacs.d/init")))
```

## el-get

packageのインストールにはel-getを使います．el-get自体がインストールされていない場合には，起動時に自動的にインストールを行います．
そのため，特に設定の必要はありません．初回起動時に必要なパッケージ群のインストールが走ります．

ただし，package.elで既にパッケージをインストールしている場合，warningが出ます．予めpackage.elでインストールしたものは全て削除しておいてください．

## フォントのインストール

日本語フォントとしてRicty Diminishedを推奨しています．

```
$ sudo apt-get install fonts-ricty-diminished
```

また，neotreeをiconsで表示しているためall-the-iconsを利用しています．これは起動後にフォントをインストールする必要があります．

```
M-x all-the-icons-install-fonts
```


## 別途必要になるもの
- emacs-mozc-bin
- silver-searcher-ag
- ctags
- eslint, babel-eslint, json-lint
- gocode, godoc, godef, goimports
- python, flake8

### emacs-mozc

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

プロジェクトフォルダには以下のような`.eslintrc` を用意しておくと，emacsから読み込んでくれます．
`.eslintrc`

```
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

### gocode, godoc, goimports
goのソースを触る際には必要となります．

```
$ go get github.com/nsf/gocode
$ go get golang.org/x/tools/cmd/godoc
$ go get golang.org/x/tools/cmd/goimports
$ go get github.com/rogpeppe/godef
```

### python
pythonのソースを開くときに必要になります．
python用のjediを動かすためにpython3の実行環境が必要になります．
pyenvを使って，python3をインストールしておいてください．

その上で，
```
M-x jedi:install-server
```

とすることでjediがインストールされます．
このとき，virtualenvが依存に含まれており，インストールされない場合には，自分で `pip install virutalenv` しておく必要があります．

また，pythonのLintツールとしてflake8を有効化しています．

```
$ pip install flake8
```

しておくと，emacs上でもLintを実行してくれます．
