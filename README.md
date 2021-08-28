## users テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| nickname            | string | null:false|
| email               | string | null: false |
| password            | string | null: false |
| name  last          | string | null: false |
| name first          | string | null: false |
| name kana last      | string | null: false |
| name kana first     | string | null: false |
| birth year          | string | null: false |
| birth month         | string | null: false |
| birth day           | string | null: false |

## goods テーブル

| Column         | Type       | Options     |
| ----------     | ---------- | ----------- |
| name           | string     | null: false |
| detail         | text       | null: false |
| category       | string     | null: false |
| condition      | string     | null: false |
| deliver price  | string     | null: false |
| area           | string     | null: false |
| days           | string     | null: false |
| price          | string     | null: false |
| user           | references | null: false, foreign_key: true |

## comments テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| text               | text       | null: false |
| user               | references | null: false, foreign_key: true |
| goods          | references | null: false, foreign_key: true |