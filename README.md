# README

## users

|Column             |Type   |Options                  |
|-------------------|-------|-------------------------|
|nickname           |string |null: false              |
|email              |string |null: false, unique: true|
|password           |string |null: false              |
|familyname         |string |null: false              |
|firstname          |string |null: false              |
|familyname_furigana|string |null: false              |
|firstname_furigana |string |null: false              |
|birth_year         |integer|null: false              |
|birth_month        |integer|null: false              |
|birth_day          |integer|null: false              |

### Association
- has_many :items
- has_many :purchases

## items

|Column         |Type      |Options                       |
|---------------|----------|------------------------------|
|title          |string    |null: false                   |
|description    |text      |null: false                   |
|category       |string    |null: false                   |
|condition      |string    |null: false                   |
|shipping_charge|string    |null: false                   |
|ship_form_area |string    |null: false                   |
|days_to_ship   |integer   |null: false                   |
|price          |integer   |null: false                   |
|user_id        |references|null: false, foreign_key: true|

### Association
- has_one :shipping_location
- belongs_to :user

## shipping_locations

|Column       |Type      |Options                       |
|-------------|----------|------------------------------|
|postal_code  |integer   |null: false                   |
|prefecture   |string    |null: false                   |
|city         |string    |null: false                   |
|address      |string    |null: false                   |
|building_name|string    |null: true                    |
|phone_number |integer   |null: false                   |
|user_id      |references|null: false, foreign_key: true|
|item_id      |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
