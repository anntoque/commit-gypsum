# commit-gypsum
**commit-gypsum** はcommitを毎日行なっているかをチェックすることで、使用者の成長を監視する仕組みです。

## 仕様
- 実行時の日と最新のgithubへpushされたcommitの日を比較し、その日まだcommitしてなければslackに通知します
- 実行時の日にcommit済みであれば、賞賛のメッセージが送られます。
- 逆にだcommitしていなければ、commitを促すメッセージが送られます

## インストール・使用方法
```
$ git clone git@github.com:anntoque/commit-gypsum.git
````
