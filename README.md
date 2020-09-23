# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| birthday | string | null: false |

### Association

- has_many :items

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| user_name     | string     | null: false |
| price         | string     | null: false |
| category      | integer    | null: false |
| status        | integer    | null: false |
| fee           | integer    | null: false |
| shipmentsource| integer    | null: false |
| timerequired  | integer    | null: false |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :buyer
- belongs_to :user

## buyer テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## send_place テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| sendplace | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer