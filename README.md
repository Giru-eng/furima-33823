# README

## users

|Column             |Type   |Options                  |
|-------------------|-------|-------------------------|
|nickname           |string |null: false              |
|email              |string |null: false, unique: true|
|encrypted_password |string |null: false              |
|familyname         |string |null: false              |
|firstname          |string |null: false              |
|familyname_furigana|string |null: false              |
|firstname_furigana |string |null: false              |
|birthday           |date   |null: false              |

### Association

- has_many :items
- has_many :purchases

## items

|Column            |Type      |Options                       |
|------------------|----------|------------------------------|
|title             |string    |null: false                   |
|description       |text      |null: false                   |
|category_id       |integer   |null: false                   |
|condition_id      |integer   |null: false                   |
|prefecture_id     |integer   |null: false                   |
|ship_form_area_id |integer   |null: false                   |
|days_to_ship_id   |integer   |null: false                   |
|price             |integer   |null: false                   |
|user              |references|null: false, foreign_key: true|

### Association

- has_one :item_purchase
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :ship_form_area
- belongs_to_active_hash :days_to_ship
- belongs_to :user

## item_purchases

|Column|Type      |Options                       |
|------|----------|------------------------------|
|user  |references|null: false, foreign_key: true|
|item  |references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one : shipping_location

## shipping_locations

|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|postal_code  |string    |null: false                   |
|prefecture_id|integer   |null: false                   |
|city         |string    |null: false                   |
|address      |string    |null: false                   |
|building_name|string    |                              |
|phone_number |string    |null: false                   |
|item_purchase|references|null: false, foreign_key: true|

### Association

- belongs_to_active_hash :prefecture
- belongs_to :item_purchase
