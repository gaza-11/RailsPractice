# README

Rails学習のためのサンプルアプリ。

* Rubyのバージョン  
    2.3.3p222 (2016-11-21 revision 56859)
    
* Railsのバージョン  
    5.0.2。
    
* 動作に必要なもの  
    MySqlが必要。（開発に使用したのはバージョン5.7）  
    ruby_practiceスキーマのActorsテーブルが必要。  
    Developmentの設定でしか動作確認していないのでProductionでは動かないかもしれません…。
    
* 処理内容  
   ActorsテーブルへのCRUD処理と検索機能。

* DBの作成手順  
    migrationファイルもチェックインしたのでrails db:migrateで作成できると考えています…。
    
* DBの初期化  
    seedsファイルにテストデータが入っています。
    
* テスト方法  
    テストコード未作成です。

* Heroku
    https://protected-castle-17819.herokuapp.com/  

* 残作業  
    BootStrapが適用できていない部分を修正。  
    