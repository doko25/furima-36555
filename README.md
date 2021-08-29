## users テーブル

| Column                        | Type   | Options     |
| ------------------            | ------ | ----------- |
| nickname                      | string | null:false  |
| email                         | string | null: false, unique:trueオプション |
| encrypted_password            | string | null: false |
| name_last                     | string | null: false |
| name_first                    | string | null: false |
| name_kana_last                | string | null: false |
| name_kana_first               | string | null: false |
| birth                         | date   | null: false |

-has_many :items
-has_many :comments
-has_many :buys

## items  テーブル

| Column           | Type       | Options     |
| ----------       | ---------- | ----------- |
| name             | string     | null: false |
| detail           | text       | null: false |
| category_id      | integer    | null: false |
| condition_id     | integer    | null: false |
| deliver_price_id | integer    | null: false |
| area_id          | integer    | null: false |
| days_id          | integer    | null: false |
| price            | integer    | null: false |
| user             | references | null: false, foreign_key: true |

-belongs_to :user
-belongs_to :buy

## comment  テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| text              | text       | null: false |


## buy  テーブル
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

-belongs_to :user
-belongs_to :item

## addresses  テーブル
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| number            | string     | null: false |
| area_id           | integer    | null: false |
| town              | string     | null: false |
| banchi            | string     | null: false |
| buy               | references | null: false, foreign_key: true |

-belongs_to :buy