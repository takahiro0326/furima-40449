class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :price,                null: false
      t.string :product_name,          null: false
      t.text :description_item,        null: false
      t.integer :category_id,          null: false
      t.integer :condition_id,         null: false
      t.integer :shipping_charge_id,   null: false
      t.integer :prefecture_id,        null: false
      t.integer :shipping_date_id,     null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
