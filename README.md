# commit-gypsum
**commit-gypsum** はcommitを行なっているか毎日チェックすることで、使用者の成長を監視する仕組みです。

## 仕様
- 実行時の日と最新のgithubへpushされたcommitの日を比較し、その日まだcommitしてなければslackに通知します
- 実行時の日にcommit済みであれば、賞賛のメッセージが送られます
- 逆にcommitしていなければ、commitを促すメッセージが送られます

## インストール・使用方法
```
$ git clone git@github.com:anntoque/commit-gypsum.git
$ sudo sh setup.sh
$ crontab -e #監視を走らせたい時間にsh commit-gypsum.shを実行するよう設定してください
````

