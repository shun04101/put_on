# Put on
![](https://github.com/shun04101/put_on/blob/main/logo2.png)

## サイト概要
コーディネート共有SNSサイトです。
「Put on」は何かを着るという意味なので、「あなたが次に着る服何にする？」ということの手助けをしたいという思いから生まれたサイトです。
このアプリでは、自身のコーディネートの投稿・他者のコーディネートの閲覧、更に他者が着ている服の購入場所の確認が出来ます。
それらの機能を利用する事で、ファッションへの興味関心を高め、自分が好きな服に巡り合いやすくなると考えています。

### サイトテーマ
コーディネートの共有・閲覧

### テーマを選んだ理由
私は猫の服を集めるのが好きです。でも、洋服選びのセンスや場所もそれほど知りません。加えて、ファッション雑誌や各種SNSを見ても探せないのが現状です。
そして、このような趣味趣向を持っている方は数多くいると思います。
それなら洋服に特化した共有サイトがあればセンスも場所も分かるし、コーディネートの参考にもなると思いました。この点に需要を感じました。
更に、誰かが着ていていいなと思い、店舗のサイトを訪れる事は販売側にも利益があるのではと感じました。
ファッション雑誌はプロが出ているので良く見えます。しかしこのサイトの投稿者は一般の方です。
**共感と共有**。これが達成できると思い、このテーマにしました。

### ターゲットユーザ
- 高校生から30代前半までの男女
  - 自分でコーディネートをし、他者へ見せる機会が多い為(学校や遊びに行く際)
  - ファッション雑誌の購読が多い層の為

### 主な利用シーン
- 新しい服を買いに行く前 or 買っている時
- 次の日のコーディネートで迷った時
- ファッション雑誌だとレベルが高く真似ができないと思った時

## 設計書
- [UI Flows](https://github.com/shun04101/put_on/blob/main/docs/PF_UI%20Flows_Put%20on.drawio.png)
- [ER図](https://github.com/shun04101/put_on/blob/main/docs/PF_ER%E5%9B%B3_Put%20on.drawio.png)
- [テーブル定義書](https://github.com/shun04101/put_on/blob/main/docs/PF_%E3%83%86%E3%83%BC%E3%83%95%E3%82%99%E3%83%AB%E6%8F%90%E8%AD%B0%E6%9B%B8_Put%20on.pdf)
- [アプリケーション詳細設計](https://github.com/shun04101/put_on/blob/main/docs/PF_%E3%82%A2%E3%83%95%E3%82%9A%E3%83%AA%E3%82%B1%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E8%A9%B3%E7%B4%B0%E8%A8%AD%E8%A8%88_Put%20on%20.pdf)

## チャレンジ要素一覧
<https://docs.google.com/spreadsheets/d/1jFiokAs1VGmZsr9ADLpOyiKyw9qP4ZdmSeuZlwwI0xk/edit#gid=800699043>

## 成果物発表会時使用プレゼン資料
- [スライド](https://github.com/shun04101/put_on/blob/main/docs/PF%E6%88%90%E6%9E%9C%E7%89%A9%E7%99%BA%E8%A1%A8_Put%20on.pdf)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 環境構築に必要な手順
```
git clone git@github.com:shun04101/put_on.git
```
```
cd put_on
```
```
rails db:migrate
```
```
bundle install
```

## サンプルユーザー情報
※フォローフォロワー等の機能確認の為に4人用意しました。
- 1人目(会員)
  - メールアドレス：yuuzi@gmail.com
  - パスワード：123456
- 2人目(会員)
  - メールアドレス：megumi@gmail.com
  - パスワード：123456
- 3人目(会員)
  - メールアドレス：sample@gmail.com
  - パスワード：123456
- 4人目(退会済み)
  - メールアドレス：nobara@gmail.com
  - パスワード：123456


## 使用素材
- [ICOOON MONO](https://icooon-mono.com/)
- [ODAN](https://o-dan.net/ja/)
- [FONT FREE](https://fontfree.me/)
- [DesignEvo](https://www.designevo.com/)

## 開発者
- 中島俊太郎(DMM WEBCAMP COMMIT 2021年11月生)