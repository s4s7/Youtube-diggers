# アプリ名

### Youtube-diggers


# 要件定義

### https://github.com/s4s7/Youtube-diggers/issues/2


# 画面遷移図

### https://github.com/s4s7/Youtube-diggers/issues/3


# DB設計


## first_urlsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|title|string|null: false|
|author|string|null: false|
|thumbnail|string|null: false|
|subscriber|integer|null: false|
|view|integer|null: false|
|category_id|references :user|foreign_key: true|
|url_id|references :url|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category


## second_urlsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|title|string|null: false|
|author|string|null: false|
|thumbnail|string|null: false|
|subscriber|integer|null: false|
|view|integer|null: false|
|category_id|references :user|foreign_key: true|
|url_id|references :url|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category


## third_urlsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|title|string|null: false|
|author|string|null: false|
|thumbnail|string|null: false|
|subscriber|integer|null: false|
|view|integer|null: false|
|category_id|references :user|foreign_key: true|
|url_id|references :url|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :urls, through:urls_users
- has_many :urls_users


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :first_urls
- has_many :second_urls
- has_many :third_urls


## total_pointsテーブル
|Column|Type|Options|
|------|----|-------|
|youtuybe_url|string|null: false|
|title|string|null: false|
|author|string|null: false|
|thumbnail|string|null: false|
|subscriber|string|null: false|
|view|integer|null: false|
|point|integer|null: false|
|category_id|references :user|foreign_key: true|


# ER図

### https://github.com/s4s7/Youtube-diggers/issues/4
