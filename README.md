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

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name | string | null: false |
| description | text | null: false |
| category_id | integer | null: false |
| status_id | integer | null: false |
| shipping_cost | string | null: false |
| shipping_days | string | null: false |
| price | string | null: false |
| user_id | integer | null: false, foreign_key: true |
| prefecture   | string | null: false |
| city   | string | null: false | 
| price | string | null: false |

### Association

- has_many :users
- belongs_to :destination
- has_one :purchase

## destination テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| items_id   | integer | null: false, foreign_key: true |
| price   | string | null: false |
| post_code   | string | null: false |
| prefecture   | string | null: false |
| city   | string | null: false |
| address   | string | null: false |
| building_name   | string |  
| phone_number   | string | null: false |
| purchase_id   | integer | null: false, foreign_key: true |




### Association

- has_many :users
- belongs_to :item

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item_id   | integer | null: false, foreign_key: true |
| user_id   | integer | null: false, foreign_key: true |




### Association

- has_one :destination