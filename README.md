# emacs.d
個人的なemacsの設定になります．

## Cask

[Cask](https://github.com/cask/cask)で必要なものをすべてインストールするので，Caskの設定をする必要があります．
`.cask`はこのディレクトリの直下に配置し，`.cask/cask.el`と`.cask/cask-bootstrap.el`のシンボリックリンクを貼っておく必要があります．
自動でシンボリックリンクを貼ってくれないので，以下を参考に自前で貼る必要があります．
http://willnet.in/132

Linuxの場合は，`~/.cask`に`cask.el`ファイルが生成されています．

```
cask install
```

`editorconfig`のみ，Caskだけでは作業領域を確保できなかったので，submoduleで導入しています．

## 別途必要になるもの
- silver-searcher-ag
- editorconfig
- ctags
- jsonLint
- eslint, babel-eslint, eslint-plugin-react

### eslint準備
```
$ npm install -g eslint babel-eslint eslint-plugin-react
```

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


### ctags更新
```
$ ctags --exclude="*.js" --exclude=".git*" --exclude="vendor/*" --exclude="public/*" -eR
```
