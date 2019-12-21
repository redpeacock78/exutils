<div align="center">
  <img src="https://raw.githack.com/redpeacock78/exutils/images/logo.png" alt="ex-utils_logo" width="70%">
</div>

# これは何？
シェルスクリプトで作った面倒なワンライナーを纏めたコマンドセットです。

## 目次
<!-- MarkdownTOC -->

- コンセプト
- インストール方法
	- 依存関係
	- MacOSでのインストール方法
	- Linuxでのインストール方法
	- Dockerによるインストール方法

<!-- /MarkdownTOC -->

## コンセプト

- ありそうで無かったコマンド。
- BashスクリプトOnlyで記述されたコマンド。
- CLIによる文字列操作に特化。
- 複雑な操作をほんの数文字で表現。

## インストール方法

### 依存関係
- bash>=5.0
- awk
- sed(GNU)
- grep(GNU)
- coreutils(GNU)
- findutils(GNU)

<div style="padding:10px;margin-bottom: 10px;border: 1px solid #76acc8;background:#d9edf7;color:#76acc8; border-radius: 15px">
  <b>
    <font color="#76acc8">
      Tips: 
    </font>
  </b>
上記をインストールし、それぞれにPATHを通した後、次のそれぞれに対応するコマンドでインストールします。
</div>

### MacOSでのインストール方法		
```sh
# インストール
$ brew tap redpeacock78/tools
$ brew install exutils

# アンインストール
$ brew uninstall exutils
```
### Linuxでのインストール方法
```sh
# インストール
$ git clone https://github.com/redpeacock78/exutils.git
$ cd exutils
$ ./install.sh

# ".bashrc"は使っているShellによって適宜変更してください。
$ echo export PATH='$HOME/.exutils/bin:$PATH' >> ~/.bashrc
$ source ~/.bashrc

# アンインストール
$ cd exutils
$ ./install.sh --uninstall
```

### Dockerによるインストール方法
```sh
# インストール
$ docker pull redpeacock78/exutils

# ".bashrc"などに以下の関数を記述
exutils(){
  [ -t 0 ] && T="t" || T=""
  docker run -i$T --rm docker.io/redpeacock78/exutils "$@"
}

# 設定を再読み込み
$ source ~/.bashrc

# 実行
$ exutils prim -v
prim 0.0.1
Copyright (C) 2019 redpeacock78
License GPLv3+: GNU GPL version3 or later.

THIS IS FREE SOFTWARE.
YOU ARE FREE TO CHANGE AND REDISTRIBUTE IT.
THERE IS NO WARRANTY, TO THE EXTENT PERMITTED BY LAW.

Written by redpeacock78 <https://github.com/redpeacock78>.
```