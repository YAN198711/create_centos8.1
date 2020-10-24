# 使い方
Tera Termを起動、下記をコピー&ペースト

***
# はじめに
## ①初期化
dnf clean all

***
## ②Gitのインストール
dnf -y install git

***
## ③Gitより実行ファイルをダウンロード
```git clone https://github.com/YAN198711/create_centos8.1.git``` \
```chmod -R 755 create_centos8.1```

***
## ④ファイルの実行
### (1)OSアップデートおよび日本語化（必須）：約5分
```./create_centos8.1/_basic.sh```

### (2)google-chromeのインストール（任意）：約1分
```./create_centos8.1/_chrome.sh```

### (3)cloud9のインストール（任意）：約5分
```./create_centos8.1/_cloud9.sh```

### (4)pythonのインストール（任意）：約10分
```./create_centos8.1/_python.sh```

### (5)ngrokのインストール（任意）：約5分
```./create_centos8.1/_ngrok.sh```

### (6)desktopのインストール（任意）：約5分
```./create_centos8.1/_desktop.sh```

## ワンポイント！
> 複数を一気に構築したい場合、間に　&&　を入れて、文を繋げます。

#### ex1)python + cloud9 を実行したい場合（改行せずに入力)、
```./create_centos8.1/_basic.sh && ./create_centos8.1/_chrome.sh && ./create_centos8.1/_python.sh && ./create_centos8.1/_cloud9.sh```


***
## ⑤システムの再起動
```systemctl reboot -i```

***
## ⑥cloud9を永続実行(（6）をインストール時、VPS再起動の度に実行必要)
TeraTermで再度接続を実施し、 \
```forever start ~/c9sdk/server.js -l IPアドレス(xxx.xx.xx.xx) -p 8080 -w ~/workspace/ -a 名前:パスワード```

※名前およびパスワードは管理しやすいものに変更 \
ex) \
IP：192.xx.xx.xx \
名前：user \
パス:abcd1234 \
```forever start ~/c9sdk/server.js -l 192.xx.xx.xx -p 8080 -w ~/workspace/ -a user:abcd1234```

## 下記にアクセスでcloud9に接続
```http://IPアドレス(xxx.xx.xx.xx):8080/ide.html``` \
ex) \
```http://192.xx.xx.xx:8080/ide.html```

## cloud9の設定
Python support \
Python Version　⇒　Python 3 \
PYTHON PATH　⇒　```:/root/.pyenv/shims/python3``` 　を右端に追加 \
デフォルトのままなら以下の通りとなる \
```/usr/local/lib/python2.7/dist-packages:/usr/local/lib/python3.4/dist-packages:/usr/local/lib/python3.5/dist-packages:/root/.pyenv/shims/python3```

***
## ⑦ngrokの稼働方法
1)ngrok公式サイトにアクセスし、(https://dashboard.ngrok.com/get-started)

> ③ Connect your account \
> の認証Tokenを予め取得しておく。

2)再起動が完了後、再度Tera Termで接続。 \

> IP : **ConoHa作成後に表示される** \
> ID : **root** \
> pass : **パスワードを入力 +エンターキー**

```./ngrok authtoken **ngrok認証Token**``` \
例) \
```./ngrok authtoken xaUxxxxxx2Rxxxm3xxxxxxxHxkxxxxxxojhFxxxxVExVNxxxx```

3)下記コマンドを実行 \
```./create_centos8.1/setup_ngrok.sh```

4)ターミナルもしくは、Cloud9起動後、下記コマンドを入力で port:80,81,82,83 が開通します。\
ターミナルはこちら \
```ngrok start --all``` \
Cloud9のworkspaceの中ではこちら \
```/root/ngrok start --all``` \
※このターミナルを閉じるとngrokの通信が切れ、Freeメンバーの場合はアドレスが変化します。 \
そのため、cloud9の1つのタブ(ターミナル)で実行することをお勧めします。

## ⑧リモートデスクトップで接続する方法
1)自身のPC(windows)の検索より、リモートデスクトップを検索し実行します。

2)IPを入力する。 \
> IP : **ConoHa作成後に表示される** \

3)CentOS側の画面に切り替わり、IDおよびPASSを入力する。 \
> ID : **root** \
> pass : **パスワードを入力 +エンターキー**

## ⑨rootユーザーでChromeを利用する方法(上級者向け)
デスクトップをインストールし、rootユーザーでChromeを利用する場合設定を追加する必要があります。 \
こちらはデスクトップをインストールしない場合は不要な設定です。

1)ターミナルを開き、下記を実行する
```
vi /opt/google/chrome/google-chrome
```

2)一番下までスクロールし、"i"キーを押し編集モードにする。 \
*before*
```
exec -a "$0" "$HERRE/chrome" "$@"
```
*after*
```
exec -a "$0" "$HERRE/chrome" "$@" --no-sandbox --user-data-dir=~
```

3)"ESC"キーを押し、順に":"キー、"w"キー、"q"キーを押す。
