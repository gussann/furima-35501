# テーブル設計

## users テーブル (ユーザー情報)

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| family_name         | string | null: false               |
| first_name          | string | null: false               |
| family_name_kana    | string | null: false               |
| first_name_kana     | string | null: false               |
| birth_day           | date   | null: false               |

### Association

- has_many :items
- has_many :purchase

## purchases テーブル (購入記録)

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :residence

## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| introduction        | text       | null: false                    |
| category_id         | integer    | null: false                    |
| item_conditions_id  | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| delivery_id         | integer    | null: false                    |
| days_to_delivery_id | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## residences テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| delivery_id         | integer    | null: false                    |
| municipality        | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| purchase            | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase