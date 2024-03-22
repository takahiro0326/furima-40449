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
・has_many :purchase histories dependent: :destroy 





## productsテーブル   

| Column              | Type       | Options                       |   
|---------------------|------------|------------------------------ |   
| Product name        | string     | null: false                   |
| description item    | text       | null: false                   |
| category_id         | integer    | null: false                   |   
| condition_id        | integer    | null: false                   |   
| shipping_charges_id | integer    | null: false                   |   
| prefectures_id      | integer    | null: false                   |   
| shipping_date _id   | integer    | null: false                   |   
| user                | references | null: false,foreign_key: true |   

Association  
・belongs_to:user  
・has_one:purchase_history  



## destinationテーブル    

| Column         | Type       | Options                       |    
|--------------- |----------- |------------------------------ |    
| prefectures_id | integer    | null: false                   |    
| city           | string     | null: false                   |    
| address        | string     | null: false                   |    
| building_name  | string     |                               |    
| phone_number   | string     | null: false                   |    
| user           | references | null: false,foreign_key: true |    

Association  
・belongs_to:user  
・has_one:purchase_histories



## purchase historyテーブル  

| Column     | Type       | Options                       |  
|------------|----------- |------------------------------ |  
| user       | references | null: false,foreign_key: true |  
| product    | references | null: false,foreign_key: true |  

Association  
・belongs_to:user  
・belongs_to:product  
・belongs_to:destination