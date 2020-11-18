# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| name       | string     | null: false       |
| explain    | text       | null: false       |
| category   | integer    | null: false       |
| status     | integer    | null: false       |
| burden     | integer    | null: false       |
| prefecture | integer    | null: false       |
| day        | integer    | null: false       |
| price      | integer    | null: false       |
| user       | references | foreign_key :true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key :true |
| item   | references | foreign_key :true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| postcode   | string     | null: false       |
| prefecture | integer    | null: false       |
| city       | string     | null: false       |
| block      | string     | null: false       |
| building   | string     |                   |
| phone      | string     | null: false       |
| purchase   | references | foreign_key :true |

### Association

- belongs_to :purchase
