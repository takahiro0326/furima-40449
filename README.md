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
・has_one:products
・has_one:purchase histories




## productsテーブル   

| Column              | Type       | Options                       |   
|---------------------|------------|------------------------------ |   
| image               | string     | null: false                   |
| product_name        | string     | null: false                   |
| description_item    | text       | null: false                   |
| category_id         | integer    | null: false                   |   
| condition_id        | integer    | null: false                   |   
| shipping_charge_id  | integer    | null: false                   |   
| prefecture_id       | integer    | null: false                   |   
| shipping_date _id   | integer    | null: false                   |   
| user                | references | null: false,foreign_key: true |   

Association  
・belongs_to:users  
・has_one:purchases_history  




## destinationsテーブル    

| Column         | Type       | Options                       |    
|--------------- |----------- |------------------------------ |    
| postal_code    | string     | null: false                   |
| prefecture_id  | integer    | null: false                   |    
| city           | string     | null: false                   |    
| address        | string     | null: false                   |    
| building_name  | string     |                               |    
| phone_number   | string     | null: false                   |      

Association    
・has_one:purchase_histories




## purchase historiesテーブル  

| Column     | Type       | Options                       |  
|------------|----------- |------------------------------ |  
| user       | references | null: false,foreign_key: true |  
| product    | references | null: false,foreign_key: true |  

Association  
・belongs_to:user  
・belongs_to:product  
・has_one:destination