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

ctags更新
```
ctags --exclude="*.js" --exclude=".git*" --exclude="vendor/*" --exclude="public/*" -eR
```
