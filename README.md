# アプリ名

### Youtube-diggers
　　

# 要件定義  

### https://github.com/s4s7/Youtube-diggers/issues/2
　　

# 画面遷移図


### https://github.com/s4s7/Youtube-diggers/issues/
　　

# 解決方法

### 動画のURLを一旦、youtube外に出して独自のアルゴリズムで、質は高いがこれまで評価されてこなかった動画が上位になる様に並び替える
具体的には、
①ユーザーに好きな分野における質は高いが広く知られていない動画ベスト３を投稿してもらう
②動画のURLからページに飛び、チャンネル登録数、投稿日、再生回数をスクレイピングする
③スレイピングにより取ってきた各パラメータからポイントを計算する
④ポイントの低い順もしくは高い順に並び替える

# DB設計


## urls_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references :user|foreign_key: true|
|group_id|references :group|foreign_key: true|
|point|fixnum|null: false|
|rank|fixnum|null: false|

### Association
- belongs_to :user
- belongs_to :url


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :urls, through:urls_users
- has_many :urls_users


## urlsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|thumbnail|string|null: false|
|subscriber|fixnum|null: false|
|view|fixnum|null: false|

### Association
- has_many :users, through:urls_users
- has_many :urls_users
- belongs_to :categorie


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :urls
　　

## total_pointsテーブル
|Column|Type|Options|
|------|----|-------|
|total_point|fixnum|null: false|

### Association
- has_one :url

　　
# ER図

### https://github.com/s4s7/Youtube-diggers/issues/4
