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
・has_many :destination dependent: :destroy





## productテーブル  

| Column              | Type       | Options     |  
|---------------------|------------|------------ |  
| category_id         | integer    | null: false |  
| condition_id        | integer    | null: false |  
| shipping_charges_id | integer    | null: false |  
| delivery_region_id  | integer    | null: false |  
| shipping_date _id   | integer    | null: false |  
| user                | references | null: false,foreign_key: true |  

Association
・belongs_to:user
・has_one:purchase history



## destinationテーブル  

| Column        | Type    | Options                      |  
|---------------|-------- |----------------------------- |  
| prefectures   | string  | null: false                  |  
| city          | string  | null: false                  |  
| address       | string  | null: false                  |  
| building_name | string  |                              |  
| phone_number  | string  | null: false                  |  
| user_id       | integer | null: false,foreign_key: true|  

Association
・belongs_to:user



## purchase historyテーブル
| Column        | Type    | Options                       |
|---------------|-------- |------------------------------ |
| user_id       | integer | null: false,foreign_key: true |
| product_id    | integer | null: false,foreign_key: true |

Association
・belongs_to:user
・belongs_to:product