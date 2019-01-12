# アプリ名

### Youtube-diggers


# 要件定義

### https://github.com/s4s7/Youtube-diggers/issues/2


# 画面遷移図

### https://github.com/s4s7/Youtube-diggers/issues/3


# DB設計


## urls_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references :user|foreign_key: true|
|url_id|references :url|foreign_key: true|
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
|category_id|references :category|foreign_key: true|

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
