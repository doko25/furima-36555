## users テーブル

| Column                        | Type   | Options     |
| ------------------            | ------ | ----------- |
| nickname                      | string | null:false  |
| email                         | string | null: false |
| encrypted_password            | string | null: false |
| name_last                     | string | null: false |
| name_first                    | string | null: false |
| name_kana last                | string | null: false |
| name_kana first               | string | null: false |
| birth year                    | date   | null: false |
| birth month                   | date   | null: false |
| birth day                     | date   | null: false |
| goods                         | references | null: false, foreign_key: true |
| comments                      | references | null: false, foreign_key: true |

## goods  テーブル

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
| goods             | references | null: false, foreign_key: true |

## comments  テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| text              | text       | null: false |
| user              | references | null: false, foreign_key: true |
| goods             | references | null: false, foreign_key: true |

## buy  テーブル
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| card              | integer    | null: false |
| card_year         | integer    | null: false |
| card_month        | integer    | null: false |
| security          | integer    | null: false |

## address  テーブル
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| number            | integer    | null: false |
| prefecture        | integer    | null: false |
| town              | text       | null: false |
| banchi            | integer    | null: false |
| building          | text       | null: false |
| phone             | integer    | null: false |