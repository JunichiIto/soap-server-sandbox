# soap-server-sandbox

SOAP通信 + SSLクライアント証明書の実験をするためのRailsアプリケーション（サーバー側）

## Setup

1. CAの作成と各種証明書の作成を行う
  - [Ben Vandgrift | Secure Communication for Rails Applications (2)](http://ben.vandgrift.com/2011/05/13/secure_communication_rails_2.html) のThe Easy Wayを参照。
  - CAの名前は demo (demoCA) とする
2. 1で作成した証明書と秘密鍵を配置する
  - `ssl/newcert.pem`
  - `ssl/newkey.pem`
  - `ssl/user.p12`
3. 公開鍵を抜き出す
  - [Ben Vandgrift | Secure Communication for Rails Applications (3)](http://ben.vandgrift.com/2011/06/17/secure_communication_rails_3.html) を参照。
4. 公開鍵を編集する
  - BEGIN CERTIFICATE で始まり、 END CERTIFICATE で終わるようにする
5. 公開鍵を配置する
  - `ssl/user.pubkey`
6. ローカルのCAが以下にあることを確認する
  - `~/demoCA/cacert.pem`
7. サーバーを起動する
  - `bin/rails_https s`
8. soap-client-sandboxから正常にアクセスできることを確認する
