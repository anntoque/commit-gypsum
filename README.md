# commit-gypsum
**commit-gypsum** はcommitを行なっているか毎日チェックすることで、使用者の成長を監視する仕組みです。

## 仕様
- 実行時の日と最新のgithubへpushされたcommitの日を比較し、その日まだcommitしてなければlineに通知します
- 実行時の日にcommit済みであれば、賞賛のメッセージが送られます
- 逆にcommitしていなければ、commitを促すメッセージが送られます

## 実行環境
- heroku
- python
