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
- has_many :purchases

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name | string | null: false |
| description | text | null: false |
| category_id | integer | null: false |
| status_id | integer | null: false |
| shipping_cost_id | integer | null: false |
| shipping_day_id | integer | null: false |
| user_id | references | null: false, foreign_key: true |
| prefecture_id   | integer | null: false |
| price | integer | null: false |

### Association

- has_many :user
- has_one :purchase

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- has_one :destination
- has_many :users
- belongs_to :item

## destination テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post_code   | string | null: false |
| prefecture_id   | integer | null: false |
| city   | string | null: false |
| address   | string | null: false |
| building_name   | string |  
| phone_number   | string | null: false |
| purchase   | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase

