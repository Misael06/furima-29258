# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| lastname  | string | null: false |
| firstname | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| birthday  | date   | null: false |

### Association

- has_many :items
- has_one :buyer

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| price         | integer    | null: false |
| category      | integer    | null: false |
| status        | integer    | null: false |
| fee           | integer    | null: false |
| shipmentsource| integer    | null: false |
| timerequired  | integer    | null: false |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :buyer
- belongs_to :user

## buyers テーブル

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
| postalcode   | references | null: false |
| prefecture   | references | null: false |
| municipality | references | null: false |
| homeadress   | references | null: false |
| building     | references | null: false |
| phonenumber  | references | null: false |

### Association

- belongs_to :buyer