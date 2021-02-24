# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname     | string | null: false |
| email    | string | null: false, unique:true |
| encrypted_password | string | null: false |
| family_name | string | null: false |
| first_name | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birth_day | date | null: false |
### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name | string | null: false |
| description | text | null: false |
| category_id | integer | null: false |
| status_id | integer | null: false |
| shipping_cost_id | integer | null: false |
| shipping_day_id | integer | null: false |
| user_id | integer | null: false, foreign_key: true |
| prefecture_id   | integer | null: false |
| price | integer | null: false |

### Association

- belongs_to :users
- has_one :purchase

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item_id   | integer | null: false, foreign_key: true |
| user_id   | integer | null: false, foreign_key: true |

### Association
- has_one :destination

## destination テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post_code   | string | null: false |
| prefecture_id   | integer | null: false |
| city   | string | null: false |
| address   | string | null: false |
| building_name   | string |  
| phone_number   | string | null: false |
| purchase_id   | integer | null: false, foreign_key: true |


### Association

- belongs_to :purchase

