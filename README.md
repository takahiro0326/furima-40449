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
・has_many:products
・has_many:purchase_histories




## productsテーブル   

| Column              | Type       | Options                       |   
|---------------------|------------|------------------------------ |   
| price               | integer    | null: false                   |
| product_name        | string     | null: false                   |
| description_item    | text       | null: false                   |
| category_id         | integer    | null: false                   |   
| condition_id        | integer    | null: false                   |   
| shipping_charge_id  | integer    | null: false                   |   
| prefecture_id       | integer    | null: false                   |   
| shipping_date_id    | integer    | null: false                   |   
| user                | references | null: false,foreign_key: true |   

Association  
・belongs_to:user  
・has_one:purchase_history  




## shipping_adresseseテーブル    

| Column             | Type       | Options                       |    
|------------------- |----------- |------------------------------ |    
| postal_code        | string     | null: false                   |
| prefecture_id      | integer    | null: false                   |    
| city               | string     | null: false                   |    
| address            | string     | null: false                   |    
| building_name      | string     |                               |    
| phone_number       | string     | null: false                   |      
| order   | references | null: false,foreign_key: true |

Association    
・belongs_to:order




## ordersテーブル  

| Column     | Type       | Options                       |  
|------------|----------- |------------------------------ |  
| user       | references | null: false,foreign_key: true |  
| product    | references | null: false,foreign_key: true |  

Association  
・belongs_to:user  
・belongs_to:product  
・has_one:shipping_address