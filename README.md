# FamilyDoctorFinder

<img alt="トップページ" src="https://user-images.githubusercontent.com/62799261/128605576-b2f7d8da-c7a9-42db-9b66-c594aa620213.png">

</br>
</br>

主に総合病院が、連携する**開業医さん（かかりつけ医）を登録・検索する業務システム**です。</br>
症状が安定し、総合病院にかかる必要がなくなった患者さんに、通いやすいかかりつけ医を紹介する際に総合病院側が使用します。

- URL：https://fd-finder.herokuapp.com/（close済み）

- ゲストログイン

※ユーザ登録なしでログインできます。

<img alt="スクリーンショット 2021-10-23 20 49 55" src="https://user-images.githubusercontent.com/62799261/138554935-9241105b-5069-4470-8846-1d14b7432b46.png">

</br>
</br>

## 開発した目的・背景

- Railsを学習してから期間が空いてしまったので、復習と基本動作を定着させるため
- 実務により近しいシステムを作成することで、ユーザに使われることを意識した開発を行うため
- 実際のシステムはサーバーの関係上、機能部分をJSのみで作成したので、サーバサイド言語が使えたら実装したかった機能を盛り込んだ
</br>
</br>

## 概要
### 使用対象者：

総合病院の事務員さん、看護師さん、医師や救急救命士の方など
</br>
</br>

### 使用例：</br>
1. 連携するかかりつけ医さんの情報を、登録権限があるユーザが登録
1. 医師や専門の事務員が、患者さんに通いやすいかかりつけ医さんを紹介する際エリアや診療科目、病院名で検索
1. 診察日など詳細を確認し、かかりつけ医へ問い合わせる。患者さんには登録したパンフレット（PDF）をサイトから印刷して渡す
</br>
</br>

- 診療科別一覧リンク

<img alt="診療科別" src="https://user-images.githubusercontent.com/62799261/128552305-2d3bfb57-291e-4b9f-a164-496b2fe27195.png">

</br>

- エリア別リンク（京都用）

<img alt="エリア別" src="https://user-images.githubusercontent.com/62799261/128549746-d0bb2324-2466-4db9-b98a-c605b895e97d.png">

</br>

- 医院登録画面

<img alt="登録画面" src="https://user-images.githubusercontent.com/62799261/128552625-821eeee6-d9d6-4ad3-a039-830adddd77ef.png">

</br>

- 複数診療時間・診療科目登録対応

![診療時間追加](https://user-images.githubusercontent.com/62799261/129411295-1365ee1e-52e9-4efb-92e7-65c4a0181cdd.gif)

- 医院詳細ページ

<img alt="医院詳細画面" src="https://user-images.githubusercontent.com/62799261/128530446-3d6225b7-ded3-4a62-a756-c44e8fa700b4.png">

</br>

- マイページ

<img alt="マイページ" src="https://user-images.githubusercontent.com/62799261/128552508-edad8667-8f68-4927-844a-5f27dfc60620.png">

</br>

- 管理画面

<img alt="管理画面" src="https://user-images.githubusercontent.com/62799261/128712999-4328acd9-010c-4bcb-82c8-ed9b59e38860.png">

</br>
</br>

## 機能一覧
* ユーザー登録関連
    * ログイン、ログアウト機能
    * ゲストログイン機能
    * 管理画面（新規登録、ユーザ名編集など）
* マイページ機能（投稿済みアナウンス、登録病院一覧）
* PDFアップ/ダウンロード機能 (AWS S3バケット)
* GoogleMap API
    * 住所から地図表示
* マップリンク
* 病院情報登録、編集機能
    * 論理削除
    * 診療時間、診療科目複数登録
* 検索機能
    * 病院名の検索
* お知らせ（アナウンス）投稿機能
* 診療科・地図別一覧
<br>
<br>

## 操作権限表

| 対象者| 病院情報閲覧 | 病院登録・削除 |ユーザ新規登録|
| :-: | :-: | :-: | :-: |
| 未ログインユーザ | ◯ | ✖︎ | ✖︎ |
| ログインユーザ | ◯ | ◯ | ✖︎ |
| 管理ユーザ | ◯ | ◯ | ◯ |
</br>
</br>

## 使用技術

* フロントエンド
    * jQuery 1.12.4
    * HTML / SCSS / Bootstrap
* バックエンド
    * Ruby 2.6.6
    * Ruby on Rails 6.0.3
    * Google MapAPI
* インフラ
    * postgres 13.3
    * Heroku（HerokuーCLI/7.54.0 darwin-x64 node-v12.21.0）</br>※別PFをAWSにデプロイ済みのため、維持費の関係上今回はherokuを使用しました
    * AWS（S3）※画像アップロード用
* その他使用ツール
    * Visual Studio Code
    * cacoo
    * draw.io
    * Google spread sheet
</br>
</br>

## ER図
![FDF_ER図2](https://user-images.githubusercontent.com/62799261/128231958-2305c1ce-3d7e-4f7c-a18a-dcabcdf3276d.png)
<br>
<br>
## 工夫したところ
* DB設計です。診療時間を複数登録するため、試行錯誤の末に曜日を整数型の配列で持たせ実装しました
* 患者さんに渡すパンフレットをPDFとして登録でき、保存先をAWSのS3としてダウンロードもできるようにしました
* 在職時制作の際、「PC操作に詳しくない職員も使うから、とにかく分かりやすく！」との要望だったので、全体的に分かりやすく、シンプルさを意識しました。
* N＋1問題の解消を行いました。
* 記述量を減らすためhamlitを使用しました
