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
- インストールを行わずに気軽に使いたい
	- 依存関係
	- 方法

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
Dockerを使用してインストールする場合は、[依存関係](#依存関係)についてインストールする必要はありません。
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

# アップデート
$ docker pull redpeacock78/exutils && docker rmi -f $(docker images | grep docker.io/redpeacock78/exutils | grep none | awk '{print $3}')

# アンインストール
$ docker rmi -f $(docker images | grep docker.io/redpeacock78/exutils | grep latest | awk '{print $3}')
```

## インストールを行わずに気軽に使いたい
インストールを行わずに使うときは[インストールでの依存関係](#依存関係)に加えて以下のものが必要になります。

### 依存関係
- インターネット接続
- curl

### 方法
```sh
# 一時的に使用する場合
$ bash <(curl -s https://raw.githubusercontent.com/redpeacock78/exutils/master/bin/ngram) 御旗のもとに
御旗のもとに御
旗のもとに御旗
のもとに御旗の
もとに御旗のも
とに御旗のもと
に御旗のもとに

# 恒久的に使用したい場合
# 以下を.bashrcなどに記述
exutils(){
  if [[ "${1}" == help ]] || \
     [[ "${@}" == version ]]; then
    bash <(curl -s "https://raw.githubusercontent.com/redpeacock78/exutils/master/docker/bin/${1}") "${2}"
  else
    bash <(curl -s "https://raw.githubusercontent.com/redpeacock78/exutils/master/bin/${1}") "${@:2}"
  fi
}

# 設定を再読み込み
$ source ~/.bashrc

# 実行
$ exutils prim -w 100 | exutils camb 13
02 03 05 07 11 13 17 19 23 29 31 37 41
03 05 07 11 13 17 19 23 29 31 37 41 43
05 07 11 13 17 19 23 29 31 37 41 43 47
07 11 13 17 19 23 29 31 37 41 43 47 53
11 13 17 19 23 29 31 37 41 43 47 53 59
13 17 19 23 29 31 37 41 43 47 53 59 61
17 19 23 29 31 37 41 43 47 53 59 61 67
19 23 29 31 37 41 43 47 53 59 61 67 71
23 29 31 37 41 43 47 53 59 61 67 71 73
29 31 37 41 43 47 53 59 61 67 71 73 79
31 37 41 43 47 53 59 61 67 71 73 79 83
37 41 43 47 53 59 61 67 71 73 79 83 89
41 43 47 53 59 61 67 71 73 79 83 89 97
```