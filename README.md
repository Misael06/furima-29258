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

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| name        | string     | null: false |
| image       | string     | null: false |
| price       | string     | null: false |
| category    | string     | null: false |
| status      | string     | null: false |
| timerequired| string     | null: false |
| user        | references | null: false, foreign_key: true |

### Association

- have :buyer
- belongs_to :user

## buyer テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| nickname | string     | null: false                    |
| name     | string     | null: false                    |
| email    | string     | null: false                    |
| password | string     | null: false                    |
| birthday | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user