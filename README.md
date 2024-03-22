# DB 設計



## usersテーブル

| Column            | Type   | Options                  |
|-------------------|--------|------------------------- |
| nickname          |	string | null: false              |
| email             | string | null: false,unique: true |
| encrypted_password|	string | null: false              |
| family_name       |	string | null: false              |
| first_name        |	string | null: false              |
| family_name_kana  |	string | null: false              |
| first_name_kana   |	string | null: false              |
| birth_day	        | date   | null: false              |

Association
・has_many :products dependent: :destroy
・belongs_to :destination dependent: :destroy
・belongs_to :card dependent: :destroy




## productテーブル

| Column           | Type       | Options     |
|------------------|------------|------------ |
| product_name     | string     | null: false |
| price            | string     | null: false |
| description      | string     | null: false |
| seller_name      | string     | null: false |
| category         | string     | null: false |
| condition        | string     | null: false |
| shipping_charges | references | null: false |
| delivery_region  | references | null: false |
| shipping_date    | references | null: false |
| user_id          | string     | null: false,foreign_key: true |

Association
・belongs_to:user




## Cardテーブル

| Column      | Type    | Options                       |
|-------------|---------|------------------------------ |
| customer_id | string  | nul: false                    |
| card_id     | string  | null: false                   |
| user_id     | integer | null: false,foreign_key: true |

Association
・belongs_to:user




## destinationテーブル

| Column        | Type    | Options                      |
|---------------|-------- |----------------------------- |
| post_code     | string  | null: false                  |
| prefectures   | string  | null: false                  |
| city          | string  | null: false                  |
| address       | string  | null: false                  |
| building_name | string  | null: false                  |
| phone_number  | string  | null: false                  |
| user_id       | integer | null: false,foreign_key: true|

Association
・belongs_to:user