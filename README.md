# pickable(仮)

## サービス概要
コミュニティの強さを活かして偶発性を楽しむイベントツール
## メインのターゲットユーザー

（主にRUNTEQ生）
- コミュニティに参加したいものの、心理的ハードルを超えられない人。
- 気軽にイベントをしたい人。

## ユーザーが抱える課題

コミュニティに参加したい気持ちはあっても
参加したり、機会を作るには様々なコストや心理的ハードルがある。

`主催側`
  - 声掛け、アナウンス
  - 日時調整
  - 「集まらなかったらどうしよう…」
  - 「後味の悪い感じになったら自分のせいだよな…」
  - 「自分が企画したからには自分が回すべきだよね…」
  - 「自分が声かけて迷惑じゃないかな」
  - etc

`参加側`
  - 「知らない・期が違う人だけどいきなり参加してもいいのかな」
  - 「（すでにグループが出来上がっている場合など）自分が入って邪魔じゃないかな」
  - etc

## 解決方法

イベント作成時にランダムでメンバーが抽出されることで

`主催側`
- 声掛け、日時調整のコストを削減
- 選択権はプログラムにあるためやり取りにおける精神的負担がない

`参加側`
- ユーザー登録さえすればいいので、参加におけるコストはほぼゼロ

具体的な解決方法は次項へ。

## 実装予定の機能
#### 1. イベントを作成する。イベントは下記情報を持つ。
  - 人数
  - 開始日時・所要時間(~2h)
  - ジャンル
    - 雑談
    - 勉強
    - ゲーム
  - （同期指定ON・OFF）
  - 参加表明期限日時
  - 希望者枠数
  - 最低開催人数
  - 司会者の有無
  - 開催場所

  また、それぞれの推奨設定のセットとして
  - ランダム（推奨）
  - 一部希望制（人数選択可能）
  - 全部希望制
  をモード選択のように選んで作成できる。
  
#### 2. 登録ユーザーからランダムでメンバー抽出
  - 登録ユーザーから(人数-希望者枠数)人をランダムで抽出＆通知
  - 希望者枠が設けられている場合、抽出されていないユーザーは参加したいイベントに参加登録ができる
  - ランダム抽出されたユーザーは不参加の場合のみ、通知のリンク（仮）から不参加表明ができる
    - 不参加時に気の利いたメッセージ入れたい
#### 3. NGがでたら参加メンバー以外に「空きが出ました通知」
#### 4. 設定した参加表明期限までに最低開催人数を
  - 上回っていたら開催通知
  - 下回っていたらキャンセル通知
#### 5. 司会者設定がありの場合は、イベント開始までにをランダム抽出（タイミング用検討）

- ユーザー
    - ニックネーム、名前、期、メールアドレス（通知用）
    - 参加したいイベントのジャンル
    - 参加可否ステータス
    - OFFだと抽出除外
- 通知
    - メンバーに追加された際に通知
    - ランダム抽出された際の通知＆不参加の場合のNG表明リンク
    - マタモorメールorLINEorTwitter（実装の希望順）

## なぜこのアプリを作りたいか

せっかくコミュニティがつよつよのRUNTEQに属しているので、そのメリットを利用しないのはもったいない。

参加意思があるのに、きっかけがなくて参加できないのはすごく惜しいと思います。

自分も初めてRUNTEQのコミュニティに参加する際に少なからず心理的ハードルを感じていましたが、
コミュニティに積極的に入るようになってから、１人でやっていたら得られない知見を得られたり、チーム開発の場を設けることができたりと様々な恩恵を受けることが出来たというのが原体験としてあります。

そこで同じような心理的ハードルを感じている方に「きっかけ」を作ることができればと思いが、このサービスの出発点です。

また、個人的には期の違うRUNTEQ生とのつながりが作れていないため、その課題を解決する事ができればとも考えています！

## スケジュール
README作成： ~1/20

画面遷移図作成： ~2/15

ER図作成： ~2/15 

メイン機能実装： 2月中〜下旬

β版： 3月中旬

本リリース： 3月中〜下旬
## 画面遷移図
https://www.figma.com/file/MDG2PmmSNAQeeXRj0lDXZ1/Pickable?node-id=0%3A1
## ER図
https://drive.google.com/file/d/1GkSOMOCz3LnxglkUqOGtZauWllHLjMeb/view?usp=sharing
