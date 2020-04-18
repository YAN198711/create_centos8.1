### (3)デスクトップ環境(+ Windows Generator:WINE)のインストール（任意）：約1.5時間
```./create_centos8.1/_desktop_wine.sh```

### (4)リモートデスクトップのインストール（任意）：約3分
```./create_centos8.1/_remote_desktop.sh```

### (7)スマホから接続するファイルのインストール（任意）：約1分
```./create_centos8.1/_x11vnc.sh```



#### ex1)(1)と(5)を実行したい場合、
```./create_centos8.1/_basic.sh && ./create_centos8.1/_python.sh```


#### ex3)デスクトップ + リモート接続 を実行したい場合（改行せずに入力)、
```./create_centos8.1/_basic.sh && ./create_centos8.1/_chrome.sh && ./create_centos8.1/_desktop_wine.sh && ./create_centos8.1/_remote_desktop.sh && ./create_centos8.1/_x11vnc.sh```

#### ex4)全て実行したい場合（改行せずに入力）、
```./create_centos8.1/_basic.sh && ./create_centos8.1/_chrome.sh && ./create_centos8.1/_desktop_wine.sh && ./create_centos8.1/_remote_desktop.sh && ./create_centos8.1/_python.sh && ./create_centos8.1/_cloud9.sh && ./create_centos8.1/_x11vnc.sh```