# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| --------    | ------ | ----------- |
| nickname    | string | null: false |
| lastname    | string | null: false |
| firstname   | string | null: false |
| lastname_jp | string | null: false |
| firstname_jp| string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| birthday    | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| explanatory   | text       | null: false |
| price         | integer    | null: false |
| category      | integer    | null: false |
| status        | integer    | null: false |
| fee           | integer    | null: false |
| shipmentsource| integer    | null: false |
| timerequired  | integer    | null: false |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- has_one :send_place
- belongs_to :item
- belongs_to :user

## send_places テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ------------|
| postalcode   | string     | null: false |
| prefecture   | integer    | null: false |
| municipality | string     | null: false |
| homeadress   | string     | null: false |
| building     | string     ||
| phonenumber  | string     | null: false |
| order        | references | null: false, foreign_key: true |

### Association

- belongs_to :order