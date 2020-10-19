# README

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| first_name           | string | null: false |
| last_name            | string | null: false |
| first_name_reading   | string | null: false |
| last_name_reading    | string | null: false |
| birthday             |  date  | null: false |

- has_many :items
- has_many :customers



## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            |   string   | null: false                    |
| catch_copy       |    text    | null: false                    |
| genre_id         |  integer   | null: false                    |
| status_id        |  integer   | null: false                    |
| delivery_fee_id  |  integer   | null: false                    |
| prefecture_id    |  integer   | null: false                    |
| day_id           |  integer   | null: false                    |
| price            |  integer   | null: false                    |
| user             | references | null: false, foreign_key: true |

- has_one :customers
- belongs_to :user 


## customers テーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| user_id          |   integer   | foreign_key: true              |
| item_id          |   integer   | foreign_key: true              |


- belongs_to :user
- belongs_to :item
- has_one :address


## address

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| postal_cord      |   string    | null: false                    |
| prefecture_id    |   integer   | null: false                    |
| city             |   string    | null: false                    |
| house_number     |   string    | null: false                    |
| house_number     |   string    | null: false                    |
| building_name    |   string    |                                |
| tell_number      |   integer   | null: false                    |
| customer_id      |   integer   | foreign_key: true              |

- belongs_to :customer

